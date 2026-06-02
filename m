Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EBC26FD97
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392566; cv=none; b=PrVGhx23qGEz9xDQx7OoLfat7G5TJDocHLLP5tPGERd8Jp5p9rCDFDyXyAHjVyIXvQ7/oFCHdth9BTY+iK3A2V4MXO8LCmQKA0Esx8b97gdIj37gLL1VLEicfOSiTI7rfomJlNwIyYCdz6ZmJZ9K04oNttnIpFcNS4Ky87Nprmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392566; c=relaxed/simple;
	bh=3lj6WnxCG3PCY5X83ET4Od2/Tkn5dMud92hPcPArfHA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OIhsKDWKvL9q6TFErViH8omEqZZREQDgJEQMu35xQTOu4fwBfuT6T7rnatOnZuDkT58n+hhWWv9Q3B3cRmnuH0RpuJZTcZckdbeA/9n9qBakHYJmi6CqMQGUGFn3wlMleBn//O+MDF8bNXm+TujRQhjt6CgmmOv+dqH5wqKxQzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kbcs/3m1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kbcs/3m1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AA01F00893;
	Tue,  2 Jun 2026 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780392564;
	bh=WLxrNYCA1pO3ApejdfWVZDBjpGfOF8ToFWTVki0FAX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kbcs/3m1N1UbD2lE4Rk11Owxw2ZAbqASd33YzzILrPV/2llMaRawcKZoFxf2/6QBB
	 hXliUUgcLK6YSXXUExk2soqlEFf6qEXZdYzGPrBXoY0RYNvEoJ1ViV17ohIf4Ifmfh
	 kOgIjC1zjRr/mENiZUeoVUrsendow4rBhFbdLocipanDYfiZE15mLkQzWBoeF6yjC8
	 2U5YNoRCDlhftoksS2P3MBvMAq3GHfW8hSfBvD/OP5Ko9QMDdymju056MnDVuLDxvZ
	 0IsetksdhWNcjL3cvgKT8mKBCGTJk5WZBS2uqrBbx144dIFiDkHhiCEJni3/sZL3Ua
	 0p29bcyGUV8VA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260602-ipq9650_refgen-v1-1-55e2afa5ff64@oss.qualcomm.com>
References: <20260602-ipq9650_refgen-v1-1-55e2afa5ff64@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 09:29:22 +0000
Message-Id: <20260602092924.24AA01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `qcom,ipq9650-refgen-regulator` compatible incorrectly defin=
es `qcom,sm8250-refgen-regulator` as a fallback, falsely asserting backward=
s compatibility and creating a crash risk for older kernels.
--

commit 53a9f2cc53f31d4f470e020ea803a060c384000b
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

regulator: dt-bindings: qcom,sdm845-refgen-regulator: Document IPQ9650

This commit adds the qcom,ipq9650-refgen-regulator compatible and documents
its requirement for explicit core and AHB clocks.

> diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refg=
en-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845=
-refgen-regulator.yaml
> index 40f9223d4c272..2686569ca0606 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regu=
lator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regu=
lator.yaml

[ ... ]

> @@ -29,6 +39,7 @@ properties:
> =20
>        - items:
>            - enum:
> +              - qcom,ipq9650-refgen-regulator
>                - qcom,qcs8300-refgen-regulator
>                - qcom,sa8775p-refgen-regulator
>                - qcom,sc7280-refgen-regulator

[Severity: Medium]
The commit message states IPQ9650 explicitly requires its AHB and core cloc=
ks
to be enabled. However, adding the compatible string to this specific enum
block defines qcom,sm8250-refgen-regulator as its fallback.

The qcom,sm8250-refgen-regulator fallback driver does not handle clock
management. If an older kernel binds to this device using the fallback, it
will attempt to access the peripheral's MMIO registers without enabling the
AHB interface clock.

Since accessing unclocked AHB registers typically triggers a synchronous
external abort on these platforms, does this fallback definition create a f=
atal
system crash risk?

Should qcom,ipq9650-refgen-regulator be defined as a standalone compatible
string without a fallback instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-ipq9650_re=
fgen-v1-0-55e2afa5ff64@oss.qualcomm.com?part=3D1
