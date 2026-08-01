Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E42D12EE
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785570370; cv=none; b=a7thGwjaXiWNZCDig2w38zbFoMOTrmNgdKkE1Cqzi02zdI+Nw6+XTzQyJpC0t0QdnHeJ/0q5SM4bU8SEP9SZSYtdlzFECOeDh4QKrsexaSQYk2y9iRW/gcGzrVyzgCiPWe2oJaezpHE0SWVb5OUwZWmEzBdvj6dgvBMH0cv/H8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785570370; c=relaxed/simple;
	bh=MZc7yFhMQXQve9S8feRKptd8d9tVGep9fHZpAi07XTs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CuoXo0B/C5p9RpMZZDrfGyz+GU0VZDA+Jpg/tk5/nBVb0qSbxrRI4jSpyN4jsYS/Fa5SPTpzPDgs0CN+pvZM7FZdtk//6FvVbXKxXP8ba/IvNMp4iqvhoJQo8GdsSkyQC5zw7gI/FkhIsoE+S0EJf5KiWU5Mu1T4bn0MDktuYrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHY9sBFS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHY9sBFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B4B1F00AC4;
	Sat,  1 Aug 2026 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785570369;
	bh=Y3IIuagX1N5mqKnxS3MVTiLi4aZdXC79xVFIsXC/nmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NHY9sBFSiAWp7yGPwEKnKPNJ+ZiBgoRwI2z7krQqjVRmhJjsYj2qBUXCHoaKRQq45
	 RsAmwFbjvwdwkXmE8okYO5zbutg4cIUBMLuqf4bmmOg2MM8uzfmIPRu/46mqI5qjeH
	 HQEaSkop5IB36huQN6qYjjDO83dEtgRHBPxuQ4Oh5H1JYXyFvzJ+1kRbmH+9tE+RuB
	 RVdJAnyXTSgNFyX4AsUgxLWR3/4nUFXVJNRO8VGkctcKlhDCuhVRtSs+t9EVxE20Fc
	 jaLGLqYt15NyT3Tjy7FPJcDEyxAk6VLa4fmh2Es+E04ZKnItWJy2bc1WgPvdduRrvM
	 dqaISGlH1adLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sc7280-venus: Add
 dma-coherent property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260801-iris-fixes-dma-pseq-fint-v1-1-aba0cb22f6ab@oss.qualcomm.com>
References: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
 <20260801-iris-fixes-dma-pseq-fint-v1-1-aba0cb22f6ab@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 07:46:08 +0000
Message-Id: <20260801074609.33B4B1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch updates the YAML schema to require the 'dma-coherent' =
property but fails to update the device tree source, breaking DT validation=
 and leaving the runtime bug unfixed.
--

--- Patch [1]: [PATCH 1/4] dt-bindings: media: qcom,sc7280-venus: Add dma-c=
oherent property ---
commit 73ea504069776873329a245bdcc0241e9976a3c3
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

dt-bindings: media: qcom,sc7280-venus: Add dma-coherent property

This commit adds the dma-coherent property to the venus node binding schema
to address I/O coherency issues between the CPU and the video hardware.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> index 9725fcb761dc0..cc31f3ba7e7e0 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml

[ ... ]

> @@ -85,6 +87,7 @@ properties:
> =20
>  required:
>    - compatible
> +  - dma-coherent

[Severity: Medium]
Will adding this to the required list break make dtbs_check for existing
device trees?=20

Since the corresponding dts updates don't appear to be included in this pat=
ch,
the schema validation might fail because the dma-coherent property is missi=
ng
from the actual device tree source.=20

Additionally, without updating the dts files used to build the DTB, will the
runtime data corruption issue described in the commit message persist becau=
se
the hardware configuration remains unchanged?

>    - power-domain-names
>    - iommus

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-iris-fixes=
-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com?part=3D1
