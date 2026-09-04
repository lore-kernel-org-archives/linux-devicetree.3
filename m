Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9D83655EA
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513022; cv=none; b=AMxWnhOXNQ0zSltRdcHRGscJubI/81eEgKf7YJWLcE/TqE/O0Qk28qzYfCzQLOqvJ4pZf1WIMsNbFSmxDhAfNkU+U3JvNih8gxss3/3G8Tk9+b2CWTL9I3dCYevRG94YuOsZ2x+BTnA5poiId0rQDeU0EE+1gwDnjvhs1NzdAQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513022; c=relaxed/simple;
	bh=pcitFeoMAC6Dwq8h3AiFgDtrPt78Yxy+xMSeudhjm24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LVy2BTOKmJqnYt5i0AUyXNpGGtl4PgM65LnkcwCLfSwOmsTynkuLn+EO4S07LrWVHmqgimzjalH5nPJK7KJgH+eGoWmPFw03/Q2EXsguQgTuYaxymof5odg1AXt4+KWBO9R/JNijf3bYWhFj1T8B5JF1MkOxGXqLQMMOCmlpOqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5ZkAn3c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5ZkAn3c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE4F1F00A3D;
	Fri,  4 Sep 2026 09:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788513020;
	bh=sI5ew1cAM4QJ9ePSFCvhBKSbMGzcPeUc9AZfOvMDrNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h5ZkAn3cdSkgAAOdfYo5eYzl64OtdxGwMvZSN40VVMqSr9SwpJRjNjjmaoU9PaL+y
	 XLCvbKZ3iJcZ9WvU6ABaZ+5hoqreALrlWacsW8sSbCUzDvXdAwgBAo4SWWqzyyigmz
	 AeB4/8xDO6dboyMlmfSz/HWqMH+2vBwgDyOXTKEKnQ2kvDiXsEWWKWWSJoWnUEqqaF
	 tnHM9vEN8PM6lgVjHLSS4gFuRWwltjHO4j0abedVCk+3tvbTg6ib3I57zdZ6XkBvZH
	 VURQMymAOFtk25vZ4nmDDZnqT6Y7CCZ5QjB7ONzwXaeXpX5pVVTDAI+eRWdYR/Sfo2
	 OmjyxtvXmJMBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904084158.1341550-11-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-11-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 09:10:19 +0000
Message-Id: <20260904091020.4DE4F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hub_is_port_power_switchable() evaluates a per-port property at =
the hub level, leading to brittle logic and unintended side-effects for por=
ts without power sequencers.
--

commit 839f0d077bce3f935502df5060567449e3c570bf
Author: Chen-Yu Tsai <wenst@chromium.org>

    usb: hub: Power on connected M.2 E-key connectors with power sequencing=
 API
   =20
    The new M.2 E-key connector can have a USB connection. For the USB devi=
ce
    on this connector to work, its power must be enabled and the W_DISABLE2#
    signal deasserted. The connector driver handles this and provides a
    toggle over the power sequencing API.

    Link: https://lore.kernel.org/all/20260610084053.2059858-1-wenst@chromi=
um.org/
    Link: https://lore.kernel.org/all/20260515090149.3169406-1-wenst@chromi=
um.org/

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
Does this loop incorrectly promote a per-port capability to a hub-wide
capability?

If any port on a hub has a pwrseq, hub_is_port_power_switchable() returns
true for the entire hub. Could this cause callers to erroneously try to app=
ly
power switching logic to all ports on the hub, even those without a pwrseq,
just because a sibling port made the hub appear switchable?

For example, in drivers/usb/core/hub.c:hub_port_connect():

	if (hub_is_port_power_switchable(hub)
			&& !usb_port_is_power_on(port_dev, portstatus)
			&& !port_dev->port_owner)
		usb_hub_set_port_power(hdev, hub, port1, true);

Additionally, since hdev->maxchild is 0 during port creation, the loop
inside hub_is_port_power_switchable() does not execute at that time. Does
this make the hub-wide check redundant for its intended purpose in
usb_port_allow_power_off()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904084158.1341=
550-1-wenst@chromium.org?part=3D10
