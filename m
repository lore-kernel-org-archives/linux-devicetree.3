Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A0532F770
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065584; cv=none; b=WOFyYLdu0sTfN54Yp8HXIhGMZAAhJb+0EmvNojDwkzgK5hwyrW+yWOGT3tZjdEfyMpx+/8drNA4ybY5B9jF+jkfCKPGqEGACzHdVaWFK1hU7qYzKNoNfF2uCvvuLj05TJPgEgdaWlUgLe39JU+HsJw1D4ixzMWQV13MvmCaOB/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065584; c=relaxed/simple;
	bh=DfgYc6STwhwsbTv1WYflN50AoGYldENo8jmOu8gtNlU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aCRLwX1ARaxTQclPbLGmkBO8T17Bo1NMDe+eff9N8vRryPSM+U/T8Ac50ACAt6yDAtaVV7KhNdND/XCDBPwFMcKpuWnVic1W46tQMd9tu/rUMe1hbm4FyJXaQpLlxxRRmALhL3sLFSbOJhglVn3fhc878oLLAogWIv9zVCX5LI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXMQKSOi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXMQKSOi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB321F00893;
	Fri, 29 May 2026 14:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780065583;
	bh=OuxQiVHtq7dFN/+W5TEUHJWlVxpPotheHEQ22ZTvY/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TXMQKSOi9+RCajalKkDDP++SPISwi8LLBfpfFzIh0Se6jqBzWqsGIlXHlWzgJWNhb
	 F6r2VlR+fbN7QR7eg+sLDC0VFiPt4JPoVlNwaAP7t6sp81/rn4Rj3fr2duGDLtlEHM
	 yftIgWGDuSvb8q1xnKpl7JNG0HcQR+/cHSwXe6WA1kTco3ECl7amNVKEyo9AWWE3y/
	 EQyk08m/8ZMYBaI3RROLBSD0BkG7eIumIR/9PjhAJnZ9SD7+Mx+aAIm+/aWE9l38fP
	 kbo1oiS1FvXldX0+7xtWzG1wAWicm2XBBeo2evAxZR5irmR70+xkLuEOf5Q0ITd+1p
	 f2hXgcIWo7mzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] PENDING: arm64: dts: qcom: sm8750: add reboot-mode
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anurag Pateriya" <anurag.pateriya@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-1-7c32161cf50b@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-1-7c32161cf50b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 14:39:42 +0000
Message-Id: <20260529143943.0EB321F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `reboot-mode` child node lacks a `compatible` string, which wi=
ll prevent standard Open Firmware (OF) driver binding and probing.
- [Medium] SoC-specific `reboot-mode` properties are unnecessarily duplicat=
ed across multiple board files instead of being defined in the common SoC `=
.dtsi` file.
- [Medium] The addition of the `reboot-mode` child node directly violates t=
he existing `arm,psci` device tree binding schema, causing `make dtbs_check=
` to fail.
--

commit 617db56b43f1f719cf41b6a802c5ad389fa5c24f
Author: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
PENDING: arm64: dts: qcom: sm8750: add reboot-mode support

This commit adds psci system reset2 reboot-modes for the sm8750-mtp and
sm8750-qrd boards. It defines bootloader and edl modes to be used by the
psci-reboot-mode driver.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dt=
s/qcom/sm8750-mtp.dts
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
[ ... ]
> +&psci {
> +	reboot-mode {

[Severity: Medium]
Does adding this node cause a dtbs_check failure? The core psci device tree
binding schema in Documentation/devicetree/bindings/arm/psci.yaml sets
additionalProperties: false and does not currently permit a reboot-mode
sub-node.

[Severity: High]
Is a compatible string required here for the reboot-mode driver to probe?
Without a property like compatible =3D "arm,psci-reboot-mode", the device t=
ree
subsystem might skip node instantiation during of_platform_populate(),
preventing the psci-reboot-mode driver from functioning.

> +		mode-bootloader =3D <0x80010001 0x2>;
> +		mode-edl =3D <0x80000000 0x1>;
> +	};
> +};

> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dt=
s/qcom/sm8750-qrd.dts
> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
[ ... ]
> +&psci {
> +	reboot-mode {
> +		mode-bootloader =3D <0x80010001 0x2>;
> +		mode-edl =3D <0x80000000 0x1>;
> +	};
> +};

[Severity: Medium]
Could these values be consolidated into the common sm8750.dtsi file? Since
the system reset2 edl and bootloader modes are defined by the SoC firmware,
they appear to be tied to the sm8750 architecture rather than individual
board designs.

Moving them to the common dtsi would reduce duplication across the board
files.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-psci_sys_r=
eset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com?part=3D1
