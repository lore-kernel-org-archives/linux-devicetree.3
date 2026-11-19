Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089079;
	b=mLNp07lyk2fAFVBUiy4qGjgp3A+Hw7c6b3Vr3qCBvWT3uu2D5cYNFXzxz/jyZ6YQE7si
	 75vG+ROzw/3MifJ3ADGXgKbXEpJiz9fJAcDJ65yKaK1oGdHl73B/nSSzStSgdCk3IHk+y
	 7NxfQtyGbCWE9mYvaxOLOw5xsqW3enBp4MsQsJFQh06GwJtRTowG268x4bAc0KTm3FDqO
	 5RrLYvW9mKVR6rmzomI9vKfmMi/7lTClJkU6IMFyB1QWvIah7rkEVhg9YlE6Kt2zZXUrK
	 Fz7s0WWmlO/ICeD1SyIS7fDbjHwTHAruABzsRPABvFGcQsPI2XBJUvecbQCuSrvXagg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089079;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7UM73seovd2n0Q0uEmik7iBAhBzqjhgYorREWcZdRMc=;
	b=GJrOdQHqzOj/KqEt7s87Se8UHWtcnNFJpxvYCDBInpa8CiBgWGmWYOD5jIp+1x9DFYeb
	 cDwJ5Q56kZCyXfIvmwq6vgaA6QYcJkmvO12vZdOEo2uNH3cpx/2ICkDsD5zdB68UfxLsg
	 I1wh8SQwiHOKXREFRSGUZzsGHmbf1gW4iRt2soqyicVwIQAxIlySJaqpijJI6dghgZWem
	 XM8vsapgH8dVdKgN7a6hmO1xI1YRF1T8hwFIbkIbgJNcc7Vf54zMFODn0NfwIi9jQkaO4
	 l3vGyLwRSdJ6YacBPefWP8cxor2VpXW8dtc7NymtqpCzBG7Gk45ayPqaLC/vQHks2mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHpAZrvH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273CC606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHpAZrvH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BC31F000C7;
	Thu, 19 Nov 2026 11:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795089078;
	bh=7UM73seovd2n0Q0uEmik7iBAhBzqjhgYorREWcZdRMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fHpAZrvHEgorAMGBIKpPgeNNDoV88xehMS7lb4sf6M6oGb89xPABsFTgA4dx5hXgA
	 3d6qZOd3N1MFo/f/xFkMRKaQsdfV3db9dvX+gSnih7PWSHhkIn0IV8rVQFyDiAbGgR
	 EJy2FONY6EOg1aDcccfMH2ozPnOaEq5J576GL8YXmQXwtoAnI/oYiXMdpz6U2dKy8h
	 YOJFHrPpP2CvEButQorNV9KjvMamPx8QDaizXbNj1w9X1WSZAZq2IeH5ZKW5uE+oh+
	 aBMFjmQJnHAyUI7dEnPWgoYza3jrkKXe2S/pwIg73LCieeT62uqQqvG+MEdmsxfqn2
	 IVmT1Yv6+TgcQ==
Message-ID: <sashiko-outbox-223064@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for
 remoteproc SMMU mappings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-shikra-el2-v6-5-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
 <20261119-shikra-el2-v6-5-0e91a1467e79@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 11:51:18 +0000
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
- [Low] arm64: dts: qcom: commit message mentions Shikra and omits
  disabled nodes
--

commit 4293b12aa38fd366536aa13846bd84f70cea3ea7
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

> arm64: dts: qcom: sm8750: Add EL2 overlay for remoteproc SMMU mappings
>
> SM8750 board boot Linux under the Gunyah hypervisor, with Linux running
> at EL1. Linux can also be booted directly at EL2 on these devices.
>
> For EL2 boot, describe the IOMMU streams used by the remote processor
> firmware in the DeviceTree consumed by Linux.
>
> Add an EL2-specific DT overlay and apply it to the Shikra IoT variants
> to produce -el2.dtb artifacts alongside the standard DTBs.
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

[Severity: Low]
This isn't a bug, but the commit message mentions applying the overlay to
the Shikra IoT variants, whereas arch/arm64/boot/dts/qcom/Makefile applies
sm8750-el2.dtbo to sm8750-mtp.dtb to build sm8750-mtp-el2.dtb.  In addition,
the subject and changelog only mention the remoteproc SMMU mappings, while
arch/arm64/boot/dts/qcom/sm8750-el2.dtso also disables gpu_zap_shader and
iris.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-shikra-el2=
-v6-0-0e91a1467e79@oss.qualcomm.com?part=3D5
