Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC864
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 00:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284913; cv=none; b=YK8R0+FrRxNND/3TSi8Br5Tlhme7KnPcGcxS62iSh9IY5kcWMwfJ+FPfu2z6IGimY/iCLZ1Hzwvm+iyH7LUui0zUfZGKKb64yntjYibUHrOHPPgmL3pGfWoVkdjW9LlnxJCj6qO+Ki2aGMora4uIZb23stPyTbqZWBp+SM6JCE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284913; c=relaxed/simple;
	bh=6KOmX9ViBl2pJJfgS1Nxx46zArF4dazObleXND9Qgw0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hQVheDSEXe2MnhfC/W5bOqew8EUk9ygob5VPPQagYF8WfFmt4FQQZyt3R5IM5Xs68HOsYd6AVjnDBQgK3UbFGF09X6sojWelXZzNK0J/Kc5AVEE8CivMVIcd3HaT+3633OKSNbtWU0aM4jts4q7tGgn6u2A/oQsCYvmphbtbLhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbWXcgC2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbWXcgC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363BFC2BCB0;
	Sat,  9 May 2026 00:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778284913;
	bh=6KOmX9ViBl2pJJfgS1Nxx46zArF4dazObleXND9Qgw0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gbWXcgC24LXqq8LCPlFh7NlQH+Tn56lkqJAZDCR1xudHCjpF9Y3bTg6TRt4u7S74B
	 vDPOKagoCVXL1bgPpHt2i/KTEa7VcOhjyefw83ronbadw7aGYUgZZLcBo/Tr/CqWmm
	 jnaTd9s0GGhfE5e+mVNWxDSffXlySPzGyq9C5n08GAgadIZJzCCyzO91hjRt2T581q
	 BSP3mCPjpROiRjmEqyQaUXtSXvJi5H2OQ8OGAv/YjJ6ah8wzGWvJA9lPVwISyHy6aw
	 WpeStMtmNqL7MR3fsH4tGMoo8C7xG6oumap0/R0uzNynP+MIppZpJWCD3Hqx2wPBpz
	 nYYpoOtjAtjlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/8] arm64: dts: rockchip: add radxa camera 4k on
 rock 5b+ cam0
Reply-To: sashiko@lists.linux.dev
To: "Michael Riesch via B4 Relay" <devnull+michael.riesch.collabora.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260508-rk3588-vicap-v4-6-6a6cd6f7c90b@collabora.com>
References: <20260508-rk3588-vicap-v4-6-6a6cd6f7c90b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 00:01:52 +0000
Message-Id: <20260509000153.363BFC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The CSI-2 receiver input endpoint (`&csi2_in`) is missing the manda=
tory `bus-type` property.
--

commit 3116df0f04df5ee4f52ff3fd8e1f890c40b802e7
Author: Michael Riesch <michael.riesch@collabora.com>

arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam0

This commit adds a device tree overlay for the Radxa Camera 4K (featuring
the Sony IMX415 image sensor) to be applied on the Radxa ROCK 5B+ CAM0 port.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k=
-cam0.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-c=
am0.dtso
> new file mode 100644
> index 0000000000000..ee9ecf68a8866
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.d=
tso

[ ... ]

> +&csi2_in {
> +	csi2_input: endpoint {
> +		data-lanes =3D <1 2 3 4>;
> +		link-frequencies =3D /bits/ 64 <445500000>;
> +		remote-endpoint =3D <&imx415_output>;

Is the bus-type property missing here?

The rockchip,rk3568-mipi-csi2.yaml binding requires the bus-type property
in the input port endpoint (e.g., bus-type =3D <4>; for D-PHY).=20

While the V4L2 core detects the data-lanes property and gracefully defaults
the bus type to V4L2_MBUS_CSI2_DPHY at runtime, omitting bus-type here
violates the device tree schema and triggers a dtbs_check warning.

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-rk3588-vic=
ap-v4-0-6a6cd6f7c90b@collabora.com?part=3D6
