Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1282433C1BE
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792951; cv=none; b=rR6lB+syGVGGEeYnr3xQysW4LZvNEkdlkAdWb2iesA4MhjnlA6k+g75himiMLcr8OSpiKf0H2l0qxfLv7DmKX3oetFCwidhGwu4ylVnZUuIaKg/dEPsMSpIMtJszVjn/zb7czM42hXQITMat2LzyTFTdLKNq3ylevWt0mcX42Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792951; c=relaxed/simple;
	bh=yHW9YGMjVKLHQHBQzk2U9y+gnTYtfc23B8grb8VNHQQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Uh7/F2Sgt4QlWso0ty14l+OpCXnJj/tcE1aQ5+fVU8rXb3yK8BCYn13AHE/umJNimE+HS6Cn20SRFDnChymRnZEUnK1qjzWeF+k+6ziK+/+CK1zvm2LsGMrVMQA1RHicYbMphIbDHBbAS6lDf6Zq4hC65r5HWZV4irK6B4jR6w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0rKPpdA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0rKPpdA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518691F0089C;
	Mon, 12 Oct 2026 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791792949;
	bh=RPr+QclsJzPOVUXH7iy1yxBLvSkFSB9zf6ErqWEqDTg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I0rKPpdAMALZRz2yQqPMIchkRmAsy+yldNw6Uu2+YWmWJk3FhzM3ybeu9oTdVOIhj
	 Sq11gkoJTJK5E5tvt/l9BYTMgsQx3Xnqg0JRWstP4q4FT5AKcKdUw81g+7K+3KCUuh
	 7x+Ou96+y43gVIJ9myqk4DE79wYgu9Wc+/ebdoXUyCJALXMXK8XzgrOFU0w5wnTWJb
	 sgZ5mT0B+gumfBawBSI3gku9os01CEvcJothKrRHfpXJ2HU3hs9AZL+35OTWzSNis4
	 DB6MJJD3Xte8ZFROYZGeQQPEb13LI7VAvt5rtVOvqs1T787k0M53qfHNI/ItlJlQZ5
	 JEBge0jkTbn8Q==
Message-ID: <sashiko-outbox-167831@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] phy: cix: Add Sky1 DP PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Liu" <Luo.Liu@cixtech.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20261012080517.566920-3-Luo.Liu@cixtech.com>
References: <20261012080517.566920-1-Luo.Liu@cixtech.com>
 <20261012080517.566920-3-Luo.Liu@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 08:15:48 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: cix: premature hardware ready polling in CDB transactions
--

commit 9a56e63287f31e17b6e8c0dd1873f84b0c04b8d1
Author: Luo Liu <Luo.Liu@cixtech.com>

phy: cix: Add Sky1 DP PHY driver

Add a PHY driver for the CIX Sky1 dedicated DisplayPort PMA. Support
link rate, lane count, SSC and voltage swing via the generic PHY DP
ops.

> diff --git a/drivers/phy/cix/phy-cix-dp.c b/drivers/phy/cix/phy-cix-dp.c
> new file mode 100644
> index 0000000000000..b5adc9c295060
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-dp.c
[ ... ]
> +static int cix_dp_phy_cdb_write(struct cix_dp *dp, u32 offset, u32 data)
> +{
> +	int ret;
> +
> +	ret =3D cix_dp_phy_cdb_ready(dp);
> +	if (ret)
> +		return ret;
> +
> +	writel(offset, dp->base + CIX_DP_CDB_ADDR);
> +	writel(data, dp->base + CIX_DP_CDB_WDATA);
> +	writel(CIX_DP_CDB_SEL_WRITE, dp->base + CIX_DP_CDB_SEL_WR);
> +	writel(1, dp->base + CIX_DP_CDB_ENABLE);
> +
> +	return cix_dp_phy_cdb_ready(dp);

[Severity: Medium]
Is there a risk of a race condition here if the hardware takes a few clock
cycles to pull the CIX_DP_CDB_READY bit low after CIX_DP_CDB_ENABLE is set?

Because cix_dp_phy_cdb_ready() uses readl_poll_timeout(), it immediately
performs a read. If the PHY IP drops the ready bit asynchronously (e.g.,
due to a clock domain crossing), the CPU might read the stale idle state
where the ready bit is still 1 and return success instantly.

This could cause the write operation to return before the hardware
transaction actually completes, potentially overlapping with the next
transaction and corrupting PHY configuration.

> +}
> +
> +static int cix_dp_phy_cdb_read(struct cix_dp *dp, u32 offset)
> +{
> +	int ret;
> +
> +	ret =3D cix_dp_phy_cdb_ready(dp);
> +	if (ret)
> +		return ret;
> +
> +	writel(offset, dp->base + CIX_DP_CDB_ADDR);
> +	writel(CIX_DP_CDB_SEL_READ, dp->base + CIX_DP_CDB_SEL_WR);
> +	writel(1, dp->base + CIX_DP_CDB_ENABLE);
> +
> +	ret =3D cix_dp_phy_cdb_ready(dp);
> +	if (ret)
> +		return ret;
> +
> +	return readl(dp->base + CIX_DP_CDB_RDATA) & GENMASK(15, 0);

[Severity: Medium]
Similarly, could this early ready check cause cix_dp_phy_cdb_read() to
read stale data?

If the hardware hasn't pulled the ready bit to 0 yet,
cix_dp_phy_cdb_ready() will return 0 immediately and we will read
CIX_DP_CDB_RDATA before the hardware has actually populated it.

> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012080517.5669=
20-1-Luo.Liu@cixtech.com?part=3D2
