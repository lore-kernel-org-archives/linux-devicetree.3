Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF509346FA1
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 19:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033467; cv=none; b=dszBetxqdia+AaORkdVDaDvrnrMN3wcndkspgaSG1737K62In4i0Yria7ZE4nZ3LLsl3AyQPczY0CdN6MwJKQlYTufwbMcb47yw/n86PrdC2zqp7lyI93LXTRLii68D10Gg470h2sMRXFsFr7qdC+zQb3hGIpkmMgqgw8/oMNLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033467; c=relaxed/simple;
	bh=KexEdUi8eVPfaImhTbcvd83BzVBcwqTYB+ktPEy0qlw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oKWHtElkLwHFdf0oogL7nmi6woX9mi5d+WE7MBCg0Qfhr73gB8oracVfqwldfkOVu0MBeqQu+zSSojTVNWqMgsDECas2RiKSdpfZ3Bgfc/qTzNjS0S8iRraYbvPvdg8LLiaioTUbvr5ZKi3AHoNd5Vo5aTEepDwregkRk+3/1gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7IH+sAm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7IH+sAm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCF51F00898;
	Tue,  9 Jun 2026 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781033466;
	bh=cS3dfSPSpLBsHz0bJgREN0NTqwG02LgSNsquw5EjwpA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d7IH+sAmvye8THzrJdb6+6orOln8RwdjnyQ0c92T8+UmhWlAQo8o6R40LeDT3TwD6
	 DICM1VCmpH9LD7Tg03KYxaMkWNAe7bRVuXJ15Dcd7g1PhYBpwviFGmDKT+Cv0kJdZo
	 nDfw9XEzaoDVp0LrirylfNMqLWjfVGBRiXhxOu91DC6wyNcUptbI/3PSf1dweoE/ZV
	 fCK5iX2pkGhjeTRZl4csrwexGtwcXnuNV4JVDeCfvD6pOFIHejrV+7AMz5ep4iOoAW
	 xBQ8440w7Jjt4HDvHc0E7IP1+s7IGhKHxzVWJn+vNrNV6f4JJHvZgSE3rpQuJ4ngKM
	 YB4ztYvgfRBng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 2/4] net: phy: mediatek: add phy driver for
 MT7628 built-in Fast Ethernet PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joris Vaisvila" <joey@tinyisr.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608192948.289745-3-joey@tinyisr.com>
References: <20260608192948.289745-3-joey@tinyisr.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 19:31:05 +0000
Message-Id: <20260609193106.1BCF51F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Register overwrite due to unconditional write instead of read-mo=
dify-write.
--

commit c56d71446569801055eeaf712bd2739d4e88d605
Author: Joris Vaisvila <joey@tinyisr.com>

net: phy: mediatek: add phy driver for MT7628 built-in Fast Ethernet PHYs

This commit adds a new driver for MediaTek MT7628 built-in Fast Ethernet PH=
Ys.
It configures the PHY to establish 100mbps links by setting an initializati=
on
bit in an undocumented register.

> diff --git a/drivers/net/phy/mediatek/mtk-fe-soc.c b/drivers/net/phy/medi=
atek/mtk-fe-soc.c
> new file mode 100644
> index 0000000000000..317944411fbe7
> --- /dev/null
> +++ b/drivers/net/phy/mediatek/mtk-fe-soc.c

[ ... ]

> +static int mt7628_phy_config_init(struct phy_device *phydev)
> +{
> +	/*
> +	 * This undocumented bit is required for the PHYs to be able to
> +	 * establish 100mbps links.
> +	 */
> +	return phy_write_paged(phydev, 0x8000, 30, BIT(13));

[Severity: Medium]
The comment and commit message mention setting an initialization bit. Does
this unconditional write safely preserve the other bits in this register?

If other fields in this undocumented register are initialized by hardware
reset or the bootloader, writing 0x2000 will destructively clear them to 0.
Should this use a read-modify-write operation like phy_modify_paged()
instead, or is overwriting the entire register intentional?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608192948.2897=
45-1-joey@tinyisr.com?part=3D2
