Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645ED3F485E
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887498; cv=none; b=KuORUM5Gk8aghh0LZmkuzojteO9GVh9VxyCjWKF9RcJrFZyG3HOCbqYNIwUweXD/uuo7KdLLzMGvQQZsPJKQaIn8cEFHR6AFCYA9nQXJcZdZBmDUZZF6/6nr5hUxfvD2cVKkGWpmh/QtvmVAjDKZ32/jY+K8k6rgoxnbf/LXZFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887498; c=relaxed/simple;
	bh=RLVdOjbk8q79leZnUw4e7AnLMaT0NIxaidcU/gr7DHw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=g4YvoTJdXAWZx8+LBm6kU9Vo7A5uRUk6VOTphTllxEGiPle9BDRuFtjuxQaHHef2PksIDkqiQvz9LQsd9jHGZKNEf3X6jVNTTOtQTIHsYG3s3kiHZAVDnyLuPMvcrUVqdtEm0inpuekhFbE1ttHum1f3oRdz4Hhy2sVh+VxuxaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLiSGe/a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLiSGe/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDA71F000FF;
	Tue, 13 Oct 2026 10:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791887497;
	bh=htOP13SIl35k6U9Z2/1oJsPEVRSHV1QviTfQKrsU6xQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KLiSGe/axxe39wbjMYVCwdb8k+afK80NYii7za+KdmmtMaqTfiuwG5KrDQ2s+SjH/
	 +VHC/H2zGEoAM9E7H5UtwoVS0WCXHKMqtYdUBdaNRQwooQ9HphhlaXAsk31hA1XIvG
	 Y+fPAbdDgCPKRmW9xw9GGXnNM5+7QbvkQkjJwZdKwNJaL6EnDnmcHPGg676Y/D3IKY
	 SdLNZlnMrGjpDBHVcW4bsq/rpfn+UefqbSPWcmT7wxD8vP78LsrjA9m8Vw8valrgbW
	 88dheqegHlaZVxNvt74XAuRRuJuMCSzdVnvgAEhVeV54FzKZN5d8Ch0prF7oBr41lC
	 vFmoa0TkR8HJw==
Message-ID: <sashiko-outbox-169511@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] riscv: dts: ultrarisc: Add Milk-V Titan board
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xincheng Ji" <jixincheng@ultrarisc.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013-ultrarisc-dts-v3-7-5ff3ebb2a90d@ultrarisc.com>
References: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
 <20261013-ultrarisc-dts-v3-7-5ff3ebb2a90d@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 10:31:35 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: incorrect RGMII phy-mode causes double clock delay
--

commit 471320732fb47362c8b5d5e16472052117a95204
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: Add Milk-V Titan board device tree

This commit introduces the device tree for the Milk-V Titan board, an ITX
motherboard based on the UltraRISC DP1000 SoC.

Link: https://milkv.io/docs/titan/overview

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts b/arch/=
riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
> new file mode 100644
> index 0000000000000..59edd8157221a
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts

[ ... ]

> +&ethernet {
> +	phy-handle =3D <&phy0>;
> +	/*
> +	 * The PCB does not add RGMII TX or RX clock delays. The DP1000
> +	 * integration adds fixed delays in both directions.
> +	 */
> +	phy-mode =3D "rgmii-id";

[Severity: Medium]
The comment notes that the DP1000 integration already adds fixed delays in
both directions. When the MAC or SoC natively provides the RGMII delays,
shouldn't phy-mode be set to "rgmii" instead of "rgmii-id"?

Setting it to "rgmii-id" instructs the PHY to insert its own internal delays
as well, which might result in a double-delayed link. This combination could
shift the clock outside the valid data window, leading to link failures or
dropped packets.

> +
> +	status =3D "okay";
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-ultrarisc-=
dts-v3-0-5ff3ebb2a90d@ultrarisc.com?part=3D7
