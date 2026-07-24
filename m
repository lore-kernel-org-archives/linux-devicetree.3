Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AA63EAC71
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883781; cv=none; b=fJlTvK5wCxf2+aEPLZygmHZaX1Q8ZzVM79uDmkiNW1BVMZqkjB3jIt+Cq+TN3i9EeQD8jHtDaVqEDdKgyzCznfJH5lNmxOqktOtXzRXnhLdqiA+xKI0NFhWpaKgJtngl8rgpc4or1vl0wukL5SHFk+mYl0IzOZ9I7ebBDgpILDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883781; c=relaxed/simple;
	bh=H3QljMdHh4+JfVCI6RczDOnMZ8KlGCtIGtJeJqXVpfs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CEXDyG6nYNudw08UGn0A0GnRHqAzfBONm2pN157o5lpGsMVErcbIxbVTFGCAOSRPi4qTZ0SwNPYSCsFDAlyQK2uSpEQvNDHK3hwNa18i9rljvVj3K4n0HePks73QLj+HRpH6i1BLF+6USs5GHbigXBcBbMEk5ifUUiZ9jAhS448=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cawzBVIo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cawzBVIo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D9E1F000E9;
	Fri, 24 Jul 2026 09:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883780;
	bh=Nkx2bEiyYNCFuhVK5Wh2dHwg4Q/mQe48y5n+KWKCbAM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cawzBVIoyIY7/SWxoCD91l2Lpzfn9VOtICxlT1kCZkLie3IWpIu7PxvorAdauoOdn
	 Omel/eADjM9OjF1pZrRDGNihpc89/o5bLyvZ1axfJvNPWEGQEC1nRCabR6M8W2R55G
	 jlCf7W82OygcT/F4UGWh+EtsO53MABFzAKnFBfVjeMteH/2Y5Zq8czcGCjrXOoUoh5
	 ItqncjLMetvGQvAzAWYGu3yXfV+mxHwBhLSsHXr7W2VSUPg2gmB7ZPobcf36QpZdQP
	 7305yu327le0uL27f6I+OmiwqksTwdSDBPGcioBvNwTXwYwDDSI12gYcnA5Jq6CDN6
	 F6lvhRrL7au0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724084328.3943997-11-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
 <20260724084328.3943997-11-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 09:02:59 +0000
Message-Id: <20260724090259.C4D9E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hub_is_port_power_switchable() incorrectly elevates a per-port p=
ower sequencer property to a hub-wide capability.
--

--- Patch [10]: [PATCH v7 10/16] usb: hub: Power on connected M.2 E-key con=
nectors with power sequencing API ---
commit 5b4df25e39c50f42b92c649d3b30e831a5d2dc33
Author: Chen-Yu Tsai <wenst@chromium.org>

usb: hub: Power on connected M.2 E-key connectors with power sequencing API

This commit adds support for powering on M.2 E-key connectors that have a
USB connection using the power sequencing API. It uses the usb_port device
to acquire the power sequencing descriptor, allowing the power sequence
provider to differentiate between ports on a hub.

Link: https://lore.kernel.org/all/20260610084053.2059858-1-wenst@chromium.o=
rg/
Link: https://lore.kernel.org/all/20260515090149.3169406-1-wenst@chromium.o=
rg/

[ ... ]

> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index de524c6da9fc4..3f403a56e5f75 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -103,7 +103,15 @@ static inline bool hub_is_port_power_switchable(stru=
ct usb_hub *hub)
>  	if (!hub)
>  		return false;
>  	hcs =3D hub->descriptor->wHubCharacteristics;
> -	return (le16_to_cpu(hcs) & HUB_CHAR_LPSM) < HUB_CHAR_NO_LPSM;
> +	if ((le16_to_cpu(hcs) & HUB_CHAR_LPSM) < HUB_CHAR_NO_LPSM)
> +		return true;
> +	/* check for controllable external power sequencers */
> +	for (unsigned int i =3D 0; i < hub->hdev->maxchild; i++) {
> +		if (hub->ports[i] && hub->ports[i]->pwrseq)
> +			return true;
> +	}
> +
> +	return false;
>  }

[Severity: Medium]
Does this code incorrectly elevate a per-port property to a hub-wide
capability?

If a natively non-switchable USB hub is connected and at least one of its
ports has an external power sequencer, hub_is_port_power_switchable() will
return true for the entire hub.

This causes runtime operations like hub_port_connect_change() to act on all
ports as if they are switchable:

drivers/usb/core/hub.c:hub_port_connect_change() {
    ...
		if (hub_is_port_power_switchable(hub)
				&& !usb_port_is_power_on(port_dev, portstatus)
				&& !port_dev->port_owner)
			usb_hub_set_port_power(hdev, hub, port1, true);
    ...
}

Will this erroneously issue SetPortFeature(PORT_POWER) commands for ports on
the hub that neither support power switching nor possess a power sequencer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724084328.3943=
997-1-wenst@chromium.org?part=3D10
