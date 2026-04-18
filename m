Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C2E342C80
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776508792; cv=none; b=CzUOQo0W8bRE3E1u2tRRDZfXQ20f+tD7TQjs722NUyn+IU3c+0PXNVbg0RiusofYWMO2a+uuM9IM/O8EjxfgfW1JVZDzInG0qkqc/uuC3hGK7T6BCMaNv3SaHQFffHN2wXYAEzHNj9bztO74pCr/jPkm2n68KHwEzk5E3j0yecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776508792; c=relaxed/simple;
	bh=UM1j3tTyd4NJQRoZKg2wpV5j69LwzRebkAbz0Z6p4VY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WRn2LF1S2+0o4AaJctHyGxidqCd/8nGFscZxtL7PH1sXdhcM9DA2HpmyIrOixO+spy+pRiYqxwS5iuz2s6oHEx5ydgx1sQxhr9iIRb03BRbWF7g2nIDw41tHJ6Oud6HLyiskQm6VFXkIM8nXgQAO1Ln5soVZEf5r/FEgH3kYR/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=DHVAWqoC; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="DHVAWqoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776508783; x=1776767983;
	bh=wCcx7kme4eOad2JrX+MW8A3AgGN4Z0ct0zGc8ZL5D5o=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DHVAWqoClPy276XXltuN/mc2VySF5tIdsC24Lk2uCN4F1Z+HL4keRbzS2NOUXt2df
	 F0orHFlnBUADmF6veWTlPXTbbZCOPHT4Bi0OukZQq8EK4DYyo6FSyH8k6mnN9XF/vS
	 vaNhAQYz/NHMYCT/2IXqui5ME45JICAMczjWl13nBGMmB1Qax7qPBIWIKCFKbgy/VC
	 sz4cwE6xXvsPhiGhF7hEs4T6D1r8vezSkvKJa4FhyJNajBcD/V7t3npCpHM3W95HNP
	 CPLw0xhw3quT/DXPlDFjfGTl0FJatlV9HwP/x1CSu7Vm5jTKK/2V0I9jsaOI8RlRTa
	 Uyu3f4aofVhuw==
Date: Sat, 18 Apr 2026 10:39:38 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Describe IMEM on Eliza
Message-ID: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 03c2634e0ff46d4489246ce80f3d761f0d24d6d6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a compatible and describe the IMEM for the Eliza SoC.

Sort nodes by unit address, this can be applied separate of the other two.

I kept the IPA modem tables in eliza.dtsi per Konrad's feedback about the I=
MEM
containing it regardless of SKU.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v3:
- pilreloc-sram -> pil-reloc-sram (Konrad)
- Link to v2: https://lore.kernel.org/r/20260416-eliza-imem-v2-0-fb7a711234=
51@pm.me

Changes in v2:
- Fix sorting of nodes in eliza.dtsi
- Link to v1: https://lore.kernel.org/r/20260415-eliza-imem-v1-0-4a90e86837=
99@pm.me

---
Alexander Koskovich (3):
      arm64: dts: qcom: eliza: Sort nodes by unit address
      dt-bindings: sram: Document qcom,eliza-imem
      arm64: dts: qcom: eliza: Add IMEM node

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/eliza.dtsi              | 94 ++++++++++++++------=
----
 2 files changed, 58 insertions(+), 37 deletions(-)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260415-eliza-imem-e791f44abf1b

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>


