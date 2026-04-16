Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98621A9F8C;
	Thu, 16 Apr 2026 00:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299037; cv=none; b=DZ3CcNFh+hdAaNs0apP/CC0ZR+9UjcvVLFSEgLDpG69MFYvUDZteA2rf0hPIJXrRAc1B2kezgE0SWQjN0sJVQ47YpQyYJxKdxC+ktoy/i8QCePWrDLKrAvZ0xIEwmqZLkeUxdqrMQTTBQKooxeQj6LcnN2ChGUHAdVL7xnDcPNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299037; c=relaxed/simple;
	bh=b+/P5S46EXmbx7Y4p1BzA5O5ISbeJcNi0wD2r34Ocd8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ANiDmwBdh4Zf4J4eilPvYLEBcOFy7q3/HTOFnn6tl4ZEPUjS6qA4EGfrBzEIGxXhWGh6/aciuhd4u3SzkkqMdo8AQrUNBHsVdB1nt+dzMGwembr5JZ8hZuJlC0GLr/e7Pm3svVPuU35av5zdJ5uwr/6rQMuR7eDAa1ZHqfD1wCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=M4ufa4ou; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="M4ufa4ou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776299025; x=1776558225;
	bh=b+/P5S46EXmbx7Y4p1BzA5O5ISbeJcNi0wD2r34Ocd8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=M4ufa4ouBvbS/c+r1dTzU5BW4WcKRC0qg3jCwkWDuKorJp7XG979dRX8hHth274pR
	 LtC1/s/5IKmpRXBB0cn/RVhUpDS9J5Smg/rSmVDynjy1Y/fO5ak/+jXH1p60L1McNM
	 VTbG5BgICLKJdr2OGN7FCf7o0MSiMfmPViys5vEqEd+3ct4O+hGOigJyXW/sUXRvLr
	 sji8MqOk+36YWHX1dPdYHYp1IFRMSoxENORvBnerSmm0M1JGjRIr0Fg+/VwCwn1Ej8
	 dx1LO6VJfHcaSCGbTNrnFVlpf667jXvadB/OiWeGCqgjh8BzAaDJj2KUigLRmw5wUt
	 AUQ52Fo7MWbyg==
Date: Thu, 16 Apr 2026 00:23:41 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/2] arm64: dts: qcom: eliza: Add IMEM node
Message-ID: <20260415-eliza-imem-v1-2-4a90e8683799@pm.me>
In-Reply-To: <20260415-eliza-imem-v1-0-4a90e8683799@pm.me>
References: <20260415-eliza-imem-v1-0-4a90e8683799@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 11c1c4c31c71802b4067f066c59d4fb7259ee097
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a node for the IMEM found on Eliza, which contains pil-reloc-info
and the modem tables for IPA, among others.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom=
/eliza.dtsi
index 4a7a0ac40ce6..1f0c92898f13 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1343,6 +1343,26 @@ qup_uart14_default: qup-uart14-default-state {
 =09=09=09};
 =09=09};
=20
+=09=09sram@14680000 {
+=09=09=09compatible =3D "qcom,eliza-imem", "mmio-sram";
+=09=09=09reg =3D <0x0 0x14680000 0x0 0x2c000>;
+=09=09=09ranges =3D <0x0 0x0 0x14680000 0x2c000>;
+
+=09=09=09no-memory-wc;
+
+=09=09=09#address-cells =3D <1>;
+=09=09=09#size-cells =3D <1>;
+
+=09=09=09pilreloc-sram@94c {
+=09=09=09=09compatible =3D "qcom,pil-reloc-info";
+=09=09=09=09reg =3D <0x94c 0xc8>;
+=09=09=09};
+
+=09=09=09ipa_modem_tables: modem-tables-sram@3000 {
+=09=09=09=09reg =3D <0x3000 0x2000>;
+=09=09=09};
+=09=09};
+
 =09=09gem_noc: interconnect@24100000 {
 =09=09=09compatible =3D "qcom,eliza-gem-noc";
 =09=09=09reg =3D <0x0 0x24100000 0x0 0x163080>;

--=20
2.53.0


