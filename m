Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ECD432E6F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617996; cv=none; b=pZpLkgR8s7c/M4uxq+0s78Q7eXMMbNHSyy/lCawBMGm7f6q6tw81iOeRkign1h12ebehL9qvGsXSw5PypFMOboLA5H5/B11Y+Th5AJXw2zHvJ0IpvASuimUh1w1QqW2HC5zwafATo4nVtIDn9oqzRFtTawQZ0q8payq7B6qF7D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617996; c=relaxed/simple;
	bh=cwONs7bhQ7OPID8E7yE7ShVKg+A0lgusucH8S0umQOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Be3Wnu7zBmtYT1sWaorPvbP+Qx8pMS5TN5NTrNrRdoZpZqpyLYj7ponPWlYTsAxOjd/tu8ShMq8nFoXS2LakdHkC+0+6q18AgujPIVtsV6TAuy2Y4ro+HhMLAXFQO8hnNGweMSrEs9x4HY0BIdKQ5JDQ5JiiHKQPhQ9nrVKjvW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZcE8ehU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZcE8ehU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E221D1F00A3A;
	Tue, 21 Jul 2026 07:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784617995;
	bh=bsuv7VfmcnztAISiH/Dug0gPt/TDFAeY8IOYk1CMUxo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cZcE8ehU3JAcLz+WFdTjsTqleR3ncWdgAL6u4wkmOhjj9lqXHrvZsDdn+64NVamE6
	 4ZtY4W9H68JEF/LUuZy9CFnnSpDH5A89hvLMuKaQ27vzR6wDUVEllg3ASi7Q/xsd3J
	 kKK0TfSPJUMYZBlllwnYluk6v+4KOUnCLh9HqC0QW6/ACM61NCdefZT+ciQC/jbgDy
	 gACnUeZ5KadBj85Bo4DscUgL2Y7/iyMPRlftFvxvMqu1A/UV0W7vfUk23MeBQ3gPUw
	 ypPBzCdTLWOh8fnqxzvHMYBVEJ7US2sWDuH1kP5vOLIxzLbBF3/K/mo317/VZsNQe/
	 IlCvnx0kiFy+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721065413.2306137-11-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-11-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 07:13:14 +0000
Message-Id: <20260721071314.E221D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race condition during sysfs unbind leads to Use-After-Free of the =
`hub->ports` array in `usb_hub_set_port_power()`.
--

--- Patch [10]: [PATCH v6 10/16] usb: hub: Power on connected M.2 E-key con=
nectors with power sequencing API ---
commit 11e3aac46e37825563690ac3ff867ec8a68c9006
Author: Chen-Yu Tsai <wenst@chromium.org>

usb: hub: Power on connected M.2 E-key connectors with power sequencing API

This commit adds support for powering on M.2 E-key connectors over the power
sequencing API. It modifies the port power control functions to retrieve and
toggle power sequencing descriptors. Port devices now manage power sequences
for connected connectors that require it.

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 10f15b40fcc55..298fb68c6afc7 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
[ ... ]
> @@ -887,15 +898,22 @@ static void hub_tt_work(struct work_struct *work)
>  int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
>  			   int port1, bool set)
>  {
> +	struct usb_port *pwrseq_port =3D hub->ports[port1 - 1];
                                       ^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Can this result in a Use-After-Free of the hub->ports array?

The commit message notes that sysfs callbacks acquire the lock and check for
disconnect, preventing a use-after-free. Is this assumption accurate?

Looking at the disable_store() sysfs callback, it uses
sysfs_break_active_protection(). This breaks active sysfs protection,
causing device_unregister() in the disconnect path to return immediately
without waiting for disable_store() to finish.

If a concurrent hub_disconnect() runs, it does not acquire the hdev lock.
It sets hub->disconnected =3D 1, unregisters the port devices, and calls
kfree(hub->ports).

If disable_store() has already passed the hub->disconnected check while
holding the lock, could it proceed to call usb_hub_set_port_power()
and dereference the newly freed hub->ports array here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721065413.2306=
137-1-wenst@chromium.org?part=3D10
