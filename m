Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96C83AD53B
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810223; cv=none; b=nPLDMvTy4SDfVHT70ulj7WGs2MNg2pHUImomHH7rFjDclgIBXF6mOskko9R+2JMsDUuwsAJdMdsX+6sxcWdM/+iWQFQlvnsF3CxJjR2EKuyEKly/J9suj/BSGuMo3MsorHNrnOdF+cLHMIAC03gm3xJ/C9cQAvXW5G6ONveOHfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810223; c=relaxed/simple;
	bh=97BloAxFVtTOzajOIz4gcpCzymw3iMe7qiRHhs6YZ8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMs4mZ2oYLfcmj8gdK60vLqX4v3Ls9ugen58Avs0sHFujmPE+kQiQsXUB3PEfgjorD2blzng7uDem860VC+owJm/b31I6re2Ii5S45AD2z23QC83ZytXCabaIJHF2xUF0fVQOsGyRvj3DEOz4IdSD4OtG5Tg1Vz/2SEEWvbPBV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXvTKVFs; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXvTKVFs"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-835c98b659eso155095b3a.0
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 05:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777810221; x=1778415021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rwuq32avt18rSkWA7/JT7CKrN0qUNBlcSTis+msHENE=;
        b=WXvTKVFskklq1Cz6MMoxC9vBQGd99XZxHYuplyd6qkYKVZEjx4NNCr3nOZpRJMHBZ7
         lw3tKIgqy/9f0GFd4TwRVwj18BvosGk8Uk6xkkyUOAVQ14gz818PzfRKvq7PQqFA3E6w
         Lisc/+l2p8CfZ6AH6ANBMxgF3jh7XbcZ738BGvQgGhbcsBY5kZKOa89/hafksBiJA3Pl
         HYVCpHfbypxIjbgvvX8HvG9x2FrJVSfE17fRLLVySz+QZ0mECXEQHQ3tNOOe02yoLw2k
         cbJzWiNSNeEmAKLV3Z4K1Hwq8exzOgS7thYAVpKgsZo1bykCR1SJKT/xv+g+SOJxSajy
         i5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777810221; x=1778415021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rwuq32avt18rSkWA7/JT7CKrN0qUNBlcSTis+msHENE=;
        b=HZu5xjn2OV67pgk9o5AY72MTL7Wl5xWfy5Usse8HUmITBv8XOltPgBpFE4KqUFRXSC
         1sDkb+yvoY2tjXPSfBKumBkhDSY1UOuARYXBX7wWLytJPy0o6X1n3hJdEVYC6p34+6ag
         Jvjf5zPM8E1eqAddmhOVedPUP+MBuzGBRkCBkrAE7n2H+G+FKPJ/CBAjvyAkRLSuK7mc
         oYp8KT6FyiK28ptUtxOe6YDnECr6qHWupgF1Pdxne9aIe06YJ5cS+rg/ba1jS4yVAgCg
         GWY+HcKzYWtyJ5q88v0bq7HCjqb+X/YEFIfrUslinVZb8Q187cbIW4uthij6tTjqaACV
         IysQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iky1SBkSJYRYMr+uycqmL/oEbC0fJPgSMCOL6Mwh9MnVRjEjemrWazl6MILTAI1HzyNtjlYfM1QPy@vger.kernel.org
X-Gm-Message-State: AOJu0YzH0/KykhY/kXSVxdA7H5EcUcrbariB4eT2feHB46HfngxBKsiu
	6XiFTpUSdsbkjwwH2iNfTL7qlIVOCPTGQ+rusK1HmWrbA61aLO5elLFE
X-Gm-Gg: AeBDieueFSPmfUge+g7J3Z4/glKlUlH/MQMxRs0Vd5BzyB0FmnGZWLaxko6vg25szqf
	VObyroprhmh+FaoOsAnPFrA/ldLUhtEzG+cho0EtR8UACReM23VQN2PARt9kAOhWaycspWsYH+B
	K8GV1btKQy2knFvtjHpYKOYATQd909I7LEUAcf4/HPlYIXkU65r7xcPYUBCe/9EmTMd2kfCTBcg
	wN2r340ljb/oW3+zLmZG6E0IDudRoYCcjJ9xpBDI+1RUBFaM/pivUdE/q2o04QPXpNSHm+iJAHc
	cZD3Syqf4nvWm7IgSV4C0AC3otolAb9lrmpOvmgzEipHuLPexHK50nQDEHtRb1zSsxGNJ98AQ1U
	QpL2SSPdGKKAgEGrGsFZqvX9tsuaiuoMtR8HL8IxL2jM3s+x20tXTztiwpaY/l1/qCMWhoCII2E
	gHWBYC7+wt3KNq2/YRIlv56Id+/bPURf5Qjufcizp9YoNKABCcmZOyJ1VI6vXYSNPUL0fXV++KP
	c3Q0rtI3Xu7JBh4HSBTAuxxqC8ML2mOvVvuglv0FavRdx/YjpO0jEr77iCe8P4S50boTRg=
X-Received: by 2002:a05:6a00:1ad0:b0:82c:9c90:54cf with SMTP id d2e1a72fcca58-8352d2d75c8mr5419894b3a.43.1777810221020;
        Sun, 03 May 2026 05:10:21 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8357c4f4530sm1474364b3a.9.2026.05.03.05.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:10:20 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Andreas Klinger <ak@it-klinger.de>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/11] dt-bindings: iio: adc: hx711: add RATE GPIO property
Date: Sun,  3 May 2026 17:39:32 +0530
Message-ID: <20260503120949.80292-4-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260503120949.80292-1-piyushpatle228@gmail.com>
References: <20260503120949.80292-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional RATE pin GPIO used to select the HX711 output
data rate.

Update the example to show the property in use.

No functional change for existing users.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index a8eaa1f18de5..9134bbe41379 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -37,6 +37,13 @@ properties:
     description:
       Supply voltage for the on-chip regulator (VSUP).
 
+  rate-gpios:
+    description:
+      GPIO connected to the RATE pin. When driven low the output data
+      rate is 10 SPS; when driven high it is 80 SPS. If omitted the
+      RATE pin state is determined by the board wiring.
+    maxItems: 1
+
   clock-frequency:
     description:
       Controls the SCK bit-bang timing. The value is used to derive the
@@ -61,6 +68,7 @@ examples:
         compatible = "avia,hx711";
         sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
         dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+        rate-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
         avdd-supply = <&avdd>;
         clock-frequency = <100000>;
     };
-- 
2.43.0

