Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6561F1419A4;
	Sun,  2 Aug 2026 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785677565; cv=none; b=LJPYUwL2vWMEjX07Z0XUhgl44RQ0E1jHU71ivddSULkfQagbw5LM0OMl1293S2TbHMilw+vkfyVFC3IBT/OfXLbC2Vc6IKoKGZeK4ytk2MjDGp7GYJi/TOHoHRAUgudTEsz2qmFS/a8SaWcfMpEljCbGHywV6c7eTyhAZGx9RuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785677565; c=relaxed/simple;
	bh=Q0Tdi4ona97HaOj2lQ2Zz6/UV+bzo/H4J9IXH1j2NA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EX7vaf2IQ5rSxRQWeuGSmzOHlvmMkC77hqshdzzGhjdwjxrsmPYNmkk6YC8fTmlqCFLGtT+DPjrBnhlBCZWBmZERVKTIJ2r2z8VOntLeLF6EgNzD+fCSqcERbaxzcSiSc8v0L7ysBItwkh+zgSccVekonbsFyc6qAO+sFlWPGMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kvr09f4v; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QRDCFHnD; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kvr09f4v";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QRDCFHnD"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1785677527; bh=TQ+f6nse3BQ298yrxR35+iH
	2+RoR/bmDWGcEMHFES0c=; b=kvr09f4vxzzh2I5r/kdCobzavTeBPvBZtV2tyrOHyXyZrlRZHE
	2hySOGtwGG1GNeq78ZhSFbpxaVvO+dpLNaxGJbSCk9BKBSsHfajwwGGdMZxgxI/hNTlzWUXGUbs
	DYNNVy1gfG5/dg7BJnTvbAEjUpssSESxKq0eaIEC4dvFBsC1gHfjyoWZka0CeGQGHdbfmC37L0L
	ycKn4hpwHX3+ZDh5ASKtp4KlQG7F9Eon39/CFYxnhOxgw5rEnaHgQoQE+eETCNnxIBgDETp+SEa
	1Ipj2gk7f1+kmx+Cx7oC139cQiOR5awdtE38OwrSlcH3Bri5tXUXq/E6BrW/98cHfBw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1785677527; bh=TQ+f6nse3BQ298yrxR35+iH
	2+RoR/bmDWGcEMHFES0c=; b=QRDCFHnDS54R3UNtEWQtFrMwtoo9KOY25S7S0QcWUNEKbIDDEi
	75iUkyv9c5oB02KGz2rfkFNzrOX3HpqAqSBA==;
From: Danila Tikhonov <danila@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Vasiliy Doylov <neko@altlinux.org>,
	Achill Gilgenast <achill@achill.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Danila Tikhonov <danila@mainlining.org>
Subject: [PATCH] arm64: dts: qcom: sm7325-nothing-spacewar: Add ath11k calibration-variant
Date: Sun,  2 Aug 2026 16:32:03 +0300
Message-ID: <20260802133203.259734-1-danila@mainlining.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nothing Phone (1) has its own calibration files for the WCN6750 used
with the ath11k driver. Add the calibration variant name to the DTS so
that the appropriate calibration files can be loaded from
linux-firmware.

Nothing capitalizes its codenames, so the capitalization is intentional.

Signed-off-by: Danila Tikhonov <danila@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 1e78a42062c7..85811b5de4af 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -1546,5 +1546,7 @@ &venus {
 };
 
 &wifi {
+	qcom,calibration-variant = "Nothing_Spacewar";
+
 	status = "okay";
 };
-- 
2.55.0

