Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9588B3BED56
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747416; cv=none; b=XfajSCI5n3JN2WxAsax8ZV+gmKC2M6iK92PeX1EorRuLyJBWEZLD9A8TlIiJnlbIOCQldaezEk290F73mGqutc+alyuiX9bHGKppDNKrb2loeEo/qWIcF6B+4m+IwcxzR1u2aQsQ5fr8CyMsHY1exSAn9UkwO0bOEvrWr3dLhUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747416; c=relaxed/simple;
	bh=gYUMGwTh5TmWIdBRF5ZLKHYbqWVKM3nWDqSs3zw4ukQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bLJ3Cg3NjAC9NqubSdqVnlD6PJ9HTQrDxiyTtcLx+QZZuF4/SrPRXLGyj2lnmPdDtP3kIqPsi2AUsXN1DFKEGhx/nXuXBIcrodDKXZQRywSfurfhCdEy/4Nc6hmwtWXlmDqllDN+E4wG+IwDGx0A0h14XA3unDHNh5XMtWaHzFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUAb0JOU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUAb0JOU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6321F000E9;
	Wed, 26 Aug 2026 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787747415;
	bh=UtSWnO8wYXw/1VV1WiKrzVT3DNo9dp10RalKutXs2ks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BUAb0JOUQiiQkeAy/7nTNsRpasvq94B1ajwbvPhEQd+TySIMaCNUanpUJci0OjthC
	 9648Ww7cSuSptJfqQ682rb4K5xy2RfUHwte6M2zqJxKto5ZNub0t3kgZv+92oKzbcj
	 ySlUCcDVKSCj/oow82nFYYWargEiXAAbbvezyJNRYnIMHJlBsi94rhcVhWh8QFGo5B
	 8QqCzruUoInr8pV24WpUFf0fAhnPk8vxeUe9/9I3LS6Az/959TMbRdFCcSDy8VrA4U
	 vLaTrJO17hB4Hzv8EN6PownjgYjosNtclfMZGbc6iNsphg6o4n35Hc9E776Ibopqsh
	 TzPigU+M2A/1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: typec: mux: gpio-sbu: enable when only used
 for orientation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-usb-fusb340-v1-v3-2-11927682504d@foss.st.com>
References: <20260826-usb-fusb340-v1-v3-0-11927682504d@foss.st.com>
 <20260826-usb-fusb340-v1-v3-2-11927682504d@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 12:30:14 +0000
Message-Id: <20260826123014.CA6321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-after-free on driver unbind due to devres-managed objects acce=
ssed by registered callbacks.
--

commit ac2f1c36c2a2fd8f5788aba123b30da04e627199
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: typec: mux: gpio-sbu: enable when only used for orientation
   =20
When used as orientation-switch only (no mode-switch, e.g. no altmode),
the optional enable gpio remains disabled.
Enable it from the switch_set() routine, in this case, when the
orientation is set and the enable-gpios property has been provided.

> diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux=
/gpio-sbu-mux.c
> index 1834f1a2dd9dd..b1aa976aca240 100644
> --- a/drivers/usb/typec/mux/gpio-sbu-mux.c
> +++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
[ ... ]
> @@ -120,6 +126,7 @@ static int gpio_sbu_mux_probe(struct platform_device =
*pdev)
>  	sw_desc.fwnode =3D dev_fwnode(dev);
>  	sw_desc.set =3D gpio_sbu_switch_set;
> =20
> +	sbu_mux->mode_switch =3D device_property_read_bool(dev, "mode-switch");
>  	sbu_mux->sw =3D typec_switch_register(dev, &sw_desc);
>  	if (IS_ERR(sbu_mux->sw))
>  		return dev_err_probe(dev, PTR_ERR(sbu_mux->sw),

[Severity: High]
This is a pre-existing issue, but can this lead to a use-after-free during
driver unbind?

The sbu_mux struct is allocated with devres (devm_kzalloc), tying its
lifetime to the platform driver's bind state. However, the driver registers
callbacks with the Type-C subsystem via typec_switch_register().

When the driver unbinds (e.g., via sysfs), typec_switch_unregister() removes
the switch from sysfs but does not wait for active consumers who hold a
reference to the typec_switch_dev to drop their references.

After the driver's remove hook completes, the driver core's devres cleanup
runs and frees sbu_mux and the GPIO descriptors.

If a consumer holding a reference subsequently invokes typec_switch_set(),
it calls into gpio_sbu_switch_set() which blindly dereferences the freed
sbu_mux pointer (e.g., locking its mutex) and accesses freed GPIO structure=
s.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-usb-fusb34=
0-v1-v3-0-11927682504d@foss.st.com?part=3D2
