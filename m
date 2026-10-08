Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A8A4973AF
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456191; cv=none; b=kBpP58mkgX2Kf6zHCtzSXYZ2kHOCoJGnkkofOunDa+y+TJJ1I+8Zf1KfvUpCLyX9sApBjuthlGTSt3DJNFRl0716GK6wDy+huOehlIvc1GKZvId5Z1QhhYvteWhViRclbfZV/KRPhpO8GvCjI0vwXr34W8RGhmvciGTU8yrNbOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456191; c=relaxed/simple;
	bh=WDO4iy6VQ9f79DF+r3GJK4iLJ735/EaYT57I8GKkxZg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=M8fHOaHYdAwp2H/XT9Vs5xmLXQFL2W59Y45/gBYIWIXhsyH3O6xRfkrRo2E0Gp0eXRsGTKJKnghBHAXt6yFb1nziexVirswLrfoXBIr7kdkNvJJNkgCMfoaRIof1bY3GsqHY1bWVuo11fX1W7X9uIeZPIGhRuscfwkt7aS+9Qhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RY4Hz0m0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RY4Hz0m0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B128A1F000FF;
	Thu,  8 Oct 2026 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791456190;
	bh=GHU91XUs97lKoDApsumNSnMlJmUzTwEpmyfKSIYfJ0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RY4Hz0m0k0m5ZBd87MYmsgYawjmbI+VAaLUomxvb+oZ05tHGueNIb4rpMjphAGXCF
	 TpFWXru3nnVCLplcTp7nXy0jHa2U9eMzkdXh+yAxiPeGRfQc/LLlQM1sbP231lYvHN
	 rufGHrZkV9H3S9KEnJ82KwIQRmPlrl8BIwjfKyOfFAhCRT+KeggdWOIQk4qKqNKVhU
	 x2NazQfkTJA40sk3gVSJird9ls1ilHUCCzpVvUh3E0t7CW9MFoB+QDaqJMixIoY/Xr
	 Pmfo0AS+QXIbnMLsRXsRkU1qpPC/zQGsmq5s0jdlJjZZ2B+nd05CDuMOxmruzAA7xK
	 d+Fht4MHuB8lw==
Message-ID: <sashiko-outbox-164038@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 16/17] wifi: ath12k: Resolve userPD ID per
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaradhana Sahu" <aaradhana.sahu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008-mpp_bringup-v1-16-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-16-2c5797b5e4ac@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 10:43:09 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] style: inefficient NULL check inside resource loop
--

commit 1ba3501c64845782d9fd054ea266b2485861b530
Author: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

wifi: ath12k: Resolve userPD ID per device

This commit resolves the userPD ID based on the device address rather than
hardcoding it during AHB probe, which is necessary for multi-PD platforms.
It also sets multi-PD support based on the AHB device descriptor.

> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wi=
reless/ath/ath12k/wifi7/ahb.c
> index bff48b2fe124d..86359ed1eeb2b 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c

[ ... ]

> @@ -43,6 +47,26 @@ static const struct of_device_id ath12k_wifi7_ahb_of_m=
atch[] =3D {
> =20
>  MODULE_DEVICE_TABLE(of, ath12k_wifi7_ahb_of_match);
> =20
> +static u32 ath12k_wifi7_ahb_get_userpd_id(struct ath12k_base *ab)
> +{
> +	const struct ath12k_ahb_userpd_map *map;
> +	struct resource *res;
> +	size_t i;
> +
> +	res =3D platform_get_resource(ab->pdev, IORESOURCE_MEM, 0);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ath12k_wifi7_ahb_userpd_map); i++) {
> +		map =3D &ath12k_wifi7_ahb_userpd_map[i];
> +
> +		if (res) {

[Severity: Low]
This isn't a bug, but could the NULL check for res be moved outside the loo=
p?

Since res is retrieved before the loop and does not change during the itera=
tion
in ath12k_wifi7_ahb_get_userpd_id(), checking it on every pass is redundant.
Returning early if res is NULL might make this slightly cleaner.

> +			if (map->io_start =3D=3D res->start)
> +				return map->upd_id;
> +		}
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-mpp_bringu=
p-v1-0-2c5797b5e4ac@oss.qualcomm.com?part=3D16
