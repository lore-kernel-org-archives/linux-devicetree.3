Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805BD381B1A
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550100; cv=none; b=hl6nkesXQJMhi5+EFzIr2tQwrY/D8m2RQ3++WPw2EFVsLbZZ0F79F+bnBqHFUkcIHNiofdprZNbuzvxP26nA5ufNZL1diR3QBd5Ddf5MKOUsCiVXWwwxja2Sl9sGJ98OkpbfG4vM8V4mpNBgu0hFSbmbgcb8pRho9Gf6UhWaEQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550100; c=relaxed/simple;
	bh=CxhR7o7SSUT0NvWD4XVEB1HlYWRt7ee+hQAwr4mAfyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oUfSbNEL7dlrZgQ8jNqe+kKaMTC2fPdRnVD2gGI2Ma+9y0Ew/39DLzgiEkG5sJplYWbwajI14BuLBp9ed69f7B1w5/Ta8+4b7kxJvol4+q6z2tM5dK43jTWjJy7WgvQbF1fdNjuWgzkkTMXULBiNx4tBnGrI9drpcUP8wRZTSQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDOBkA43; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDOBkA43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEB01F000E9;
	Wed,  8 Jul 2026 22:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783550099;
	bh=y8F3s87f7cjC1/N4ZFY9/3Uytz0omY66I8fMIKIvSkA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZDOBkA430CPF5NsKnnsFL+BgTieCltu6+sWVaGgusWzxa+qFCczxWv6kJHnZQkhrj
	 jNWda+3OoEVw92IxXDsJWodkzmisIUSaVt445sTW6BEqodpF6wA/1GnUNKhU6YbvaN
	 n/QK9YjpPFv7qP4Jf1w7W0aI7RBW+0TYsU97vSkofeB6+Umtl1cW9JCPY52CrccPwC
	 1IH5NetCm5ls96PlQLUTJVPZhhHCxSW9Zwu46TQ5Ol7p/iy6P69WZFyWSv4O55lyHj
	 nuokkETeB2CVKOLaxbpzoBpYIKwUTwgZwKiAzIDC2UGuKgRgztvBKHn++tIQSOjHUl
	 GIYJdksatDA4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 12/13] net: phy: Add support for the
 ADIN1140 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Regus" <ciprian.regus@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-adin1140-driver-v5-12-4aca7b51a58b@analog.com>
References: <20260708-adin1140-driver-v5-0-4aca7b51a58b@analog.com>
 <20260708-adin1140-driver-v5-12-4aca7b51a58b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:34:58 +0000
Message-Id: <20260708223458.DFEB01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] adin1140_loopback incorrectly rejects valid loopback speed reque=
sts
--

--- Patch [12]: [PATCH net-next v5 12/13] net: phy: Add support for the ADI=
N1140 PHY ---
commit 55f86668d72d6b8eb4a781fcee866b06847b0a2f
Author: Ciprian Regus <ciprian.regus@analog.com>

net: phy: Add support for the ADIN1140 PHY

Add a driver for the ADIN1140's internal 10BASE-T1S PHY. The device
doesn't implement autonegotiation, so the link is always reported as
being up.

> diff --git a/drivers/net/phy/adin1140-phy.c b/drivers/net/phy/adin1140-ph=
y.c
> new file mode 100644
> index 0000000000000..d35da4ad680da
> --- /dev/null
> +++ b/drivers/net/phy/adin1140-phy.c

[ ... ]

> +static int adin1140_loopback(struct phy_device *phydev, bool enable, int=
 speed)
> +{
> +	if (enable && speed)
> +		return -EOPNOTSUPP;

[Severity: Medium]
Will this correctly handle a valid loopback speed request? If a MAC driver
explicitly passes the PHY's native speed (SPEED_10) when calling
phy_loopback(), this check will evaluate to true and return -EOPNOTSUPP.

Could this instead check if the requested speed is unsupported, rather than
rejecting any non-zero speed?

> +
> +	return phy_modify_mmd(phydev, MDIO_MMD_PCS, ADIN1140_PCS_CTRL,
> +			      ADIN1140_PCS_CTRL_LOOPBACK,
> +			      enable ? ADIN1140_PCS_CTRL_LOOPBACK : 0);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-adin1140-d=
river-v5-0-4aca7b51a58b@analog.com?part=3D12
