Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309153;
	b=d60EF3OvD6aJ8c514Lp3Kj1XVmEl1p7wL9P9ft3bbro0bDz+FTplUUMBktdlJOM5TV7H
	 R8kJ8/bBASpo983jwvZsukhuCq/L0zzXNnjHm7z90SXMm/Y714iuZUiMJ07sk52oR+4P4
	 WGJoaQ1WGi8TSTiyOQzORRFOKDBHlYPQWRK9v0pal65vks+7rvdBfh64XKz+2e/ZOTHfk
	 KoH5Sw6qbX0F/yBXXlrhJ/B2qzerJE3SWiBNTpTlVmkU3N/8/UJV+wgHzTug00leIVMs8
	 R8pg3/I0yyyZyf3rAgCGIx3gT9WtjLjZnc0Bok3fz5b/VJw+IMBSKArWZuBrRispS6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309153;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AYQvHUr5XcDTIZEyFup8naCoxmdjA1fPKlc6d6EU6sw=;
	b=mkJkqwmtbzDYx0Pc0sEvUqsFEk6Vk9UPko6ezN3iILbaCIgJr5SI+TVtsOSGfE4gOHrt
	 2YgQHTNaWlTc0KYeCZGX1QKgujmNbxvTh2YFg3PXphyc7ZKzuvC5EomkRRNb23uT7BcdX
	 8m+GCmmhomBWFFEaQsYMOKta7JehKJ6gHZMFkyI8SdKVeyadQMfjP8nEwrwDIUu7OSBNs
	 D/XIuNnoSFdX5qT4/wmzXy/lBiCaPCk/poEsfPSAhj+n/s8rXx8Ph5J/hPO4cyup8vQIY
	 lJG/9g7O4TpfxSDntbmurR7gdMQ5apSCktxuFQfmI7j0SxVpZLagjnK8lSrVVqjuGCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WRhzUP27;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B3606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WRhzUP27
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DB91F008A1;
	Tue, 10 Nov 2026 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794309152;
	bh=AYQvHUr5XcDTIZEyFup8naCoxmdjA1fPKlc6d6EU6sw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WRhzUP276Rf5UHhNU0oSxRF1kaioxtr9GUeq49EqObfxhZ4wF4CWky8x6q95RvNGI
	 z0J2mVZbpMurF0q4U40kH1aPBuAqe2asni82J7qSanoftdPBkxCFEwT9gl3/I60BSB
	 zIC1Hg69YRhsVeiyROL5aLYDM5oaA+Dx5Sp+1fitT8wgvHj2GPZ/cpoOAPyKYPeinZ
	 ysYsynmeylK7g+70b83m5vOrijIU+WyDCnIYIDyFHIr8xvqgk8aSbDZg86MA8cyv9K
	 +cq7YBudUIkeKMx4oxmKqNjtb2m6FFyD6bYN9dauhkS36zbWJgWVCniF+nK0KYHrl7
	 m92fyGoZlAejw==
Message-ID: <sashiko-outbox-206923@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] bus: ti-sysc: fix I2C quirk for OMAP3 variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-i2c-sysc-v1-1-8945eb1d38f0@kemnade.info>
References: <20261110-i2c-sysc-v1-0-8945eb1d38f0@kemnade.info>
 <20261110-i2c-sysc-v1-1-8945eb1d38f0@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 11:12:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] bus: ti-sysc: undocumented revision_doubleword member in struct
  sysc kernel-doc
--

commit 0008e125c797b0d08a6fb8ecb495aa9e3c3c8337
Author: Andreas Kemnade <andreas@kemnade.info>

bus: ti-sysc: fix I2C quirk for OMAP3 variants

This commit tracks whether the revision register spans two 16-bit words via
a revision_doubleword flag in struct sysc instead of relying on the upper
revision bits or a fake 8-byte register range on OMAP3 I2C controllers.

> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> index 12285ad9ef51f..c07a0e1f9a878 100644
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -153,6 +153,7 @@ struct sysc {
>  	struct ti_sysc_cookie cookie;
>  	const char *name;
>  	u32 revision;
> +	bool revision_doubleword;
>  	u32 sysconfig;
>  	unsigned int reserved:1;
>  	unsigned int enabled:1;

[Severity: Low]
struct sysc has a kernel-doc comment above it, so adding revision_doubleword
without a matching @revision_doubleword description triggers a W=3D1 kernel=
-doc
warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-i2c-sysc-v=
1-0-8945eb1d38f0@kemnade.info?part=3D1
