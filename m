Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6DF3FCB27
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468978; cv=none; b=dkBa43aN1FCdjdoCpnXLeBH5J2mqEcHvvl10I3jVp1i+ZNBzq3cI2IBH3XPtqvw1n+r9ydY1ClcQpZw98/Q8fTBbSdfJ4iEfLm6DZjDRYztXA3CpITFIJkMrsw6G+w23Qsampu9l4SVLVrl4XyFJB3CiEx4qZupM1zVQ8/P/B1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468978; c=relaxed/simple;
	bh=S9PhpLFx+N3VMs13TwHZ1Fz84zCZTEwqsIfi6+XGGtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bw7DcKvHaEtDLgWGEHuonjeL5abA22/I9OBZcfI9tJrVkqIA9PV94JZNE1dwyu+N3O6YsB4myX8r+QRd+Zs6+tc5INK5IRrby31rf7BPegOKjL1ZBF/IJR4bm3q3NueOPKZy2F7N7a97mSk6kpSFXkLUJ+x9x6F3jATwtOxxsB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=h50G46Fs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="h50G46Fs"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so7833047f8f.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777468976; x=1778073776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+67EPX7Gc76LkP0rB0FN86BjtT6XKaRsT3p4u4gAuA=;
        b=h50G46FsLE7ZyOnvn+adxJ4p5goPzleppAQM5plxH9O+u/gRc4xHqh/3ntvdOEnp5D
         hu9mafh6+MbwxtabUSvkS0A1LjuDfvLeqQToxUbJQAu+aqskuiiXlfZAVNvyZBMY4XCk
         TxiFKJx/CNTbwk72dFO2D4uwy3oAXS9hcqMJpzuzF1pms7rFUSXE+pSNsWfLxQSoUirO
         wEUUtk/7X9bsTrSRF0dNezy5iL4MLes/m7dF6HRF2Zl1EKg/CFVIFvHeRf7FcpyGNB/T
         nwSA7NCJris0xlL6l0t3V/12z5DBG0dK35wK91jdBuZX0KJh6Sw77Tqc+KVQEVecTzHD
         HKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468976; x=1778073776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l+67EPX7Gc76LkP0rB0FN86BjtT6XKaRsT3p4u4gAuA=;
        b=L1HvCf+JP2+7DY2pNz0znhZW/ysw9j8X+K3v9YxhlKSacm8EwUasoRJiz3IzQtH8sn
         M0bjV1FwXk+wC6cM06xR2vHM0Y316F0CGBXOR4x7cR0ALzOq0wDptJyVYU8KZaRNf36v
         0l+0gR/0HwSa9EmyJc638hne4SRE8fQ4AuvvZ2rlDLtALCixrrBYoIRE/NhdaE6shqyO
         DGyKh05qKtiR0xoLf3c/XfVX35hsiA+nB8Z7e0Q+o6D/T/V3DvZ91ZmVN1snEfe8dnYC
         RaDYIVWwPS4ZNAIedU1IjHyJEnCqcuzdGvKq3aMj44wiekYoYhto3XTmqQnTn7YLMhzd
         d5Ng==
X-Forwarded-Encrypted: i=1; AFNElJ8DROjoeH76STyNVXlPoeBDTt2ZpTagFLldEb/q1vUv+5pb4/g+PI8nOi2cy7cSwB+F8j0iG7rI7uL9@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0bEjNdBPfCYYqAStEQa3xzGVpNj3cVU75guOCPc6rmtrdLcS
	R0oO39uj7zt3WFNuLcgSmair6u8lc+0DJFJrSy0XTmcZvXCZcOQ0AYOAejgXO6dTK0c=
X-Gm-Gg: AeBDies9XbsKKh8sFh2cpQhFZZpQ+Y478UFhH8QObMsToJjY5bcI8RtWQLwjUtc/ONX
	YHbqheQ25T7/jTN1FjLRuHPEzwgDgyfkj9fQ1Ywz1NrnhWuuDiZ29ybDMHbRxNEn4yHsJWt95hG
	cQG1yIqqJ9rXwDYCO7u+yDSnYGi4jTaqNRO2f9ynMaGgYbZwQevQZ276qcCpGG7YSAsRBSyCMBU
	Lm5nIkZUMDj/ZRjp+cblfoq+d8RbgyVnhGCxKphsl1LeRefT8e1W1jD9cJEXYXAeiiKSsmLs+ZS
	zHzMQXt8/Jr+OqKlq8ry/1Qj5J79GSbSl1wNIjjyRc+8GdZDp5h2n0AoAnBwu+o9uPSQVQHJMEm
	+Upz+sP5/32ISsSFC2KHmnaX5B8X+BFJUWENxg9Kf888iNkUUQdgUIFe/qth5mO+B0IeI0uxcpI
	Y++BDejto2tUumCsQAyGOLfxvVoRzAzQxjbf9g1eI9RA==
X-Received: by 2002:a05:6000:200f:b0:43d:70de:1c68 with SMTP id ffacd0b85a97d-4464aced5d6mr13681441f8f.30.1777468975590;
        Wed, 29 Apr 2026 06:22:55 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:1917:a47e:1872:2063])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca664csm6222511f8f.35.2026.04.29.06.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:22:55 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 29 Apr 2026 15:22:10 +0200
Subject: [PATCH v4 3/4] arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to
 pre-ram bootphase
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-topic-am62a-ioddr-dt-v6-19-v4-3-fc27d6ac753c@baylibre.com>
References: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
In-Reply-To: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=msp@baylibre.com;
 h=from:subject:message-id; bh=S9PhpLFx+N3VMs13TwHZ1Fz84zCZTEwqsIfi6+XGGtw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxPbFJVk2Y4bps8v5vpQ4TVzSPWh1bZq7dd2XBPNJfDT
 EBcSti2o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACbCPJuRYe2Gp/f2hhkFbM3I
 lt+4wjQkM2V+WMzTmR4mJv7vLW8FOjD8lWVjULp38e6GqV6HVFawCt+4ubqTifeU7z+2OJHGJdm
 1PAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 6f2ee93c7be141ee5ae3f1e3324d3a060db069f6..5155f093437f35d815b2bf62429b57c9d8672290 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -75,6 +75,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -968,4 +969,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.53.0

