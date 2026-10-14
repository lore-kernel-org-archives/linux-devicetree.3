Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403E451614D
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983772; cv=none; b=ZH+9zMCZIh/dZmZTxpJjzl1Pft0AM6buKKqkc4QQEjDYpgOSYotVIr3BPx9/vbu/aIbW6cI0WLC6ebI2Xf2sh2PLetH90HPayMcFg7ajpgQqBOUy7HLvTXC8XR7lzKAqwYDTPmG7VNOSVtdUEzkiJColSmAy291bIqHU3QHKDTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983772; c=relaxed/simple;
	bh=BRqmdLB6oQ/3zLdUMHEmPxgXOAi0+Qlgf8AOOfmMWwg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=toHiw9pZ+uMru5kJeFVlGL8Bdxen6xHOv++ey1pGo30Ti/gjLGD1vbmBwf7lQ2jieXCLK8CgHpN+f1ZuXbaxOfQcIYB6YH8B/Kkc5XTB1H7I0WYQH47rtp5ksosLgS3GqA8GTUvz7IwLRKmzcS6oJFcvrjcl+JBB6kpHxHP56DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7AjzU67; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7AjzU67"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99641F000FF;
	Wed, 14 Oct 2026 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983770;
	bh=DP1EoYbOQX2EDvepkzAOmPAGPhI5FgaIN6KXtwJjYxk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V7AjzU67frGtowGs+PPfXCBbbi5u6rPHnzxZuo/AxyNP5QTu4tmjhfj3gx8Hpzj1X
	 JD83y/fj4RGtMCvjgWWjF1914zbTrg64KBapybVRcN87U8T9EqUa26p52wRWjJi3uV
	 Ce2M139hev1XQglm2f1TkASSWU7azYfPaij1xuqJ78eBST286JOrDAv5rbLsEQxmcF
	 5cvmoDMLudv6s2Ul6/RVR2JlRXPzxbmc5f+7BqIV2NH4JB0da8iei6lgI4shOu7eD8
	 mGFLPO6fIPvfgJ8Ac4JZ3ikZUUzhhowiZxVatTBLykzVJi12fSiAqTmRDH/gTgBrmQ
	 h1xuRHRLlbJoQ==
Message-ID: <sashiko-outbox-171329@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 4/5] wifi: ath12k: Support MAC address from the
 firmware node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
 <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:16:10 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] ath12k: invalid MAC address bypass via ignored device_get_mac_ad=
dress() return
- [Medium] wifi: ath12k: DT MAC override ignored on multi-radio wiphy
- [Low] ath12k: unaligned memory access risk with mac_from_dt array
--

commit 8b8a36f00c150187c70e8a8b42d0d7b0eecc142a
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

wifi: ath12k: Support MAC address from the firmware node

Read a MAC address from the device's firmware node (a DT "mac-address"/
"local-mac-address" property, or an nvmem cell named "mac-address" via
device_get_mac_address()), and use it in preference to the address from
the firmware board data. This mirrors what ath10k and ath11k already do
and lets the WLAN MAC be sourced from firmware-provisioned storage such
as a UEFI variable exposed through nvmem.

> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless=
/ath/ath12k/mac.c
> index 01f8c6572f657..f4d2d0377c8ef 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14878,15 +14878,27 @@ static int ath12k_mac_hw_register(struct ath12k=
_hw *ah)
>  	u32 ht_cap =3D U32_MAX, antennas_rx =3D 0, antennas_tx =3D 0;
>  	bool is_6ghz =3D false, is_raw_mode =3D false, is_monitor_disable =3D f=
alse;
>  	u8 *mac_addr =3D NULL;
> +	u8 mac_from_dt[ETH_ALEN] =3D {};

[Severity: Low]
Does this code risk an unaligned memory access trap?

The mac_from_dt array is declared as u8 without __aligned(2), meaning it
could be placed at an odd address on the stack.

When mac_from_dt is later passed to is_zero_ether_addr() and
ether_addr_copy(), both cast the pointer to u16* (and u32* depending on arch
config), which can trigger alignment traps or performance penalties on
architectures with strict alignment rules.

>  	u8 mbssid_max_interfaces =3D 0;
> =20
>  	wiphy->max_ap_assoc_sta =3D 0;
> =20
> +	/*
> +	 * Allow a MAC address provided through the device tree (directly or
> +	 * via an nvmem cell named "mac-address") to override the one from the
> +	 * firmware board data.
> +	 */
> +	device_get_mac_address(ab->dev, mac_from_dt);

[Severity: Medium]
Could this bypass input validation if device_get_mac_address() fails?

If fwnode_get_mac_address() internal to device_get_mac_address() reads an
invalid MAC address (e.g. multicast), is_valid_ether_addr() inside
fwnode_get_mac_addr() will fail and return -EINVAL.

However, the invalid non-zero bytes are left in mac_from_dt. Because the
error return from device_get_mac_address() is ignored here, the subsequent
check against is_zero_ether_addr(mac_from_dt) will succeed, causing the
invalid address to be applied.

> +
>  	for_each_ar(ah, ar, i) {
>  		u32 ht_cap_info =3D 0;
> =20
>  		pdev =3D ar->pdev;
> -		if (ar->ab->pdevs_macaddr_valid) {
> +		if (!is_zero_ether_addr(mac_from_dt)) {
> +			/* A device tree / nvmem address takes precedence. */
> +			ether_addr_copy(ar->mac_addr, mac_from_dt);

[Severity: Medium]
Is the device tree override ignored for multi-radio devices?

Later in this same for_each_ar() loop, the permanent MAC address is selecte=
d:

	if (i =3D=3D 0)
		mac_addr =3D ar->mac_addr;
	else
		mac_addr =3D ab->mac_addr;

If the device has multiple radios (i > 0), mac_addr defaults to ab->mac_add=
r.
Because ab->mac_addr is never updated with mac_from_dt,
SET_IEEE80211_PERM_ADDR and ath12k_mac_setup_mac_address_list() will silent=
ly
fall back to the un-overridden firmware MAC address for the entire wiphy.

> +			ar->mac_addr[4] +=3D ar->pdev_idx;
> +		} else if (ar->ab->pdevs_macaddr_valid) {
>  			ether_addr_copy(ar->mac_addr, pdev->mac_addr);
>  		} else {
>  			ether_addr_copy(ar->mac_addr, ar->ab->mac_addr);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-b4-nvmem-e=
fivar-v1-0-187c85f65018@oss.qualcomm.com?part=3D4
