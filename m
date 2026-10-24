Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792840270;
	b=M93yD37bUH33dNEE0wgh2Lv3Cv+h0BGNxkXecVG5k2zfF/KxeXzdEFTExl/UiliTUq7F
	 o/SBiOrwifVnondiqdt6AexYnf/OzOnEA2v8hmbKTdHrgSoAaXPiuqDkXNNpcf8lzzxvw
	 epoaf8xJ/cP/YnUKbyfmq7QPnGy2LbhP5v1rNnMmReS4MikYrukFW3gNK2q1YCOi227u4
	 JUCvtjR4ENHwEjZ5u0Qn1u2CEmE1fqfedM2bL1FZi6/9pLfTjfddF3JEeg13N68cSdlOS
	 qVDB4AWqbqJQ3+19R49cXaizOrytAZbLnreVyVcJtH4k11t8Tl4VvUV73NNtT9f63ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792840270;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=+pCjYuPgcaJ2F7dZslcnQcAsaGg/IMaeWcFaiwfAsJ4=;
	b=gW9nt+Rg3Vtx08nK05Dg370iNuUMOgi+ILcXHk8e6LLngK/MaNstS/bN48XDjqAvD/OX
	 OIwxfXnTWmwEc989kgt/CBq7CFausd9WgeQGC5LPWTZpKNgO+ONSWklAAd3OveobFug2T
	 lF0YdLyiONtQ4wfKu6aXWUpSyQdFpBho492+JEpn3QB6tlySxWqEpZ2HhxKs/W9v59s/S
	 Yr/hlqg95MzUWcCLKbaakeGrjTiQWfaldZEbJUKGQRRj/m5gQH49YUIZhe68aLaQ7SJJC
	 /xKzUc27/JR5CtfhOam1RhT4Epqo2o0lStg3ZmJSwylaHm+gMdEA9AY4EzQvm6nw0DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b="s/Lm2Uvi";
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C77606A31B;
	Sat, 24 Oct 2026 11:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44C77606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=s/Lm2Uvi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792840261; x=1793099461;
	bh=+pCjYuPgcaJ2F7dZslcnQcAsaGg/IMaeWcFaiwfAsJ4=;
	h=From:To:Cc:Date:Subject:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=s/Lm2UviQ6bIMviRyZa3r++i853dV8aWIMaKTIaZocfyjWstxLfuA5Yf/UqPTtUqZ
	 +SQrJpN8NX6gk/jNlHIKc0uXATgC/8PxMDLGZUYwZLb3JEC7gMmv9JXft3UEX/4DuT
	 Rel2zAOWB5EhEUYLcC3NniYWRshCw3AChpa2XPk632uMeGgYd+NcC9em72Xx3PTzDr
	 7LdYh3lrnHQFeqZcpJUXXT7nrsxCy3GSYTD8IXaOZ/dtyowt3RmlfjX9g+tkI1W7Il
	 OIStbuqHudDqKS2YjyHZ+DRcjTIjiFKnZQMpE6Brh97wLVzLepO+G/ItW5MVEvLiNk
	 t9PICtCbP/big==
X-Pm-Submission-Id: 4jBcdG4RH4z1DFSm
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 12:10:08 +0100
Subject:
 [PATCH v2 0/3] arm64: dts: qcom: Add initial Motorola Moto G10 support
Message-ID: <cover.1792840208.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Konrad, all,

Thanks for the review. I've updated the Moto G10 (SM4250) series with
a separate patch for the shared idle-state fix. I've disabled Bluetooth
for now while I work through the remaining driver changes.

Regarding the magic smoke, I checked the 25 voltage ranges against
the Android DT pulled from the G10, and they're all within the vendor
ranges. The 640 mV L8 setting also matches Android's ICNSS override.
These settings are also running on my device.

Changes since v1:
- Correct the cluster idle-state parameters in sm6115.dtsi first.
- Use QCOM_ID_SM4250, delete reserved-memory nodes by label, and tidy
  the comments and redundant USB defaults.
- Keep GPIOs 14-17 reserved; I haven't established their board-specific
  use.
- Keep both framebuffer bus clocks enabled, disable DISPCC, and point
  display0 at MDSS to preserve the bootloader display.
- Leave Bluetooth disabled pending the separate shutdown fixes.

The DT passes schema validation and boots on the phone using separate
Android bootloader handoff/alignment code, with USB transfers and
read-only eMMC access tested. GPU, Wi-Fi, DSPs and suspend weren't
exercised in that minimal test image.

v1: https://lore.kernel.org/linux-arm-msm/cover.1792703903.git.me@michaelmcallister.org/


Michael McAllister (3):
  arm64: dts: qcom: sm6115: Correct cluster idle state parameters
  dt-bindings: arm: qcom: Add Motorola Moto G10
  arm64: dts: qcom: Add Motorola Moto G10

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm4250-motorola-capri.dts   | 374 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |   8 +-
 4 files changed, 380 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250-motorola-capri.dts


base-commit: d053e38e614fb2e383b298ce8fc308a780d7f209
-- 
2.39.5
