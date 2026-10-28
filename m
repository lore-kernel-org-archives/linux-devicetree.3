Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203157;
	b=Dr0k9BpMa/kiBTNjkPY6OLBwBVC0hA87x/wCDw0vqYY6OxYwPwZnReHsirNOmAI9nQYS
	 xEPniYbO6122dBDmxxf6G33+VQYV/kyPcnzPsZfL5g8XGhv/WskB3srNBZAR8Lh2R5lRp
	 7jXeQHN4JBGhPw3U36RZOsrtOKGO9eEhG/T9dd4+gN5fBzHKkBmsq09N/FdVTgEReF1Pn
	 KjbCirrPQA2ZcP9ukorSTEzJhJxET5PgQdHEznKa6rLJq4PzUacUFmPfnR0MbB3teOe6y
	 hCSGVxKub9OaI6IYT6MW/LsIovXJ8+PxwL102BY4XMnrwCFGqEMrs1XU9QjOs0ISTDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203157;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=I5a5E1bhzg0ab79hA59Sa28dgk9pFwQ/43DPmrVSBB0=;
	b=qiXwNt/Yj6Z1lGyW3lDeDuIhYjgr0BOlcmEmOXifplHNQSVOyyBLJU3LtMiwYNGcti1g
	 b3NDG9HhI9JbjUehlW7QFkyV0E8mDPR2/+Y+N9xQg6+zQw6gHkd7Y36uMXYbRnpPYaLNT
	 iS+fi7MkJ1VhW9mRFR5slxXhVx0JRfYwIP4QWs6PmIy7OoUoqta652C/FZZt2maq3ZtNm
	 IN82xqZYjwZS6qbZe18FlUkFLwczBDeYR/k37K1+fPMA/pvWxw7SvC94wOBBELqNfkjV5
	 fbKk6bCiQNapcjlu2TO3jpKNYJGGcI3G5HaadELbpPE5MM7M5Rh8um4USZPq6y3vcdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=siGGsAza;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900CC60A2612
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 900CC60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=siGGsAza
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 07946C4FED4;
	Wed, 28 Oct 2026 16:00:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B00460769;
	Wed, 28 Oct 2026 15:59:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E87F9103290E4;
	Wed, 28 Oct 2026 16:59:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793203149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I5a5E1bhzg0ab79hA59Sa28dgk9pFwQ/43DPmrVSBB0=;
	b=siGGsAzaUYL5jWGoahigsm3qAAFbt3eQ8UQIzi1QX14Wq6QB7nawSD6Q3daecLWN+wsnB9
	Q7g1s2+jv8XFbqNasXx9QaSkuKoNixUBoRzIm9KKDEf2LGF+uxAEqbxJPY8MuiTFGKK4vm
	UGFyflOztVIjaocFl5JPmClRItqhVPCNp2l9jdjx8MNlw7ncoB2uhH5ZMZZ5moeUokwo+1
	3XMxS51hD52sAkEpkajTa3OOFqjnQuqp87EfsJCrYR6rUjm8O/hTWXDVAvLaDxzQM8+grc
	JfzqbRN1p/Vd/kKslnOeJHsbWTzrADtrlF2LXNZa/J8ekHgOLCFBsUuXXiR98w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 28 Oct 2026 16:58:50 +0100
Subject: [PATCH 3/4] MIPS: dts: eyeq5: add MSI controllers
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-eyeq5_msi-v1-3-c464752fb55f@bootlin.com>
References: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
In-Reply-To: <20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add the two EyeQ5 MSI controllers. They use reserved-memory regions as
their doorbell windows.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index cec5ad8752285..be5239d890239 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -309,6 +309,36 @@ gpio1: gpio@1500000 {
 			resets = <&olb 0 26>;
 		};
 
+		msi0: msi-controller@5840000 {
+			compatible = "mobileye,eyeq5-msi";
+			reg =	<0x0 0x05840000 0x0 0x10>,
+				<0x0 0x05840040 0x0 0x20>;
+			label = "port0-msi";
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupts =  <GIC_SHARED 7 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region =	<&pci0_msi_reserved>;
+			num-vectors = <4>;
+		};
+
+		msi1: msi-controller@5840010 {
+			compatible = "mobileye,eyeq5-msi";
+			reg = <0x0 0x05840010 0x0 0x10>,
+				<0x0 0x05840060 0x0 0x20>;
+			label = "port1-msi";
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupts =  <GIC_SHARED 48 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region =	<&pci1_msi_reserved>;
+			num-vectors = <4>;
+		};
+
 		iocu-bus {
 			compatible = "simple-bus";
 			#address-cells = <2>;

-- 
2.53.0

