Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763B3336896
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303624; cv=none; b=XuzUKcGt0T1oDuERj/vUOQpYExtPnQdKuJOmZzA4Y3Lc2toSTMfXY+Ie/5pW0dISgWiaHA93mcjAlwzIk5BJd/xbhZpNmheSqCkH2UroMCEfWpA3R0sVe5OGbBH2/R+Rbux/mF/uP/4YNBMTn5VbYW+m+bfJcfpnUP+0ZOnA1KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303624; c=relaxed/simple;
	bh=uAMXjM4R4ypUPu0O2chE4qQ0SBsBultATlgaeo4yXaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QyxQJ21gTYkuL0xeSs5wl512uaYvfkNt5jnZ5tcfH0nJzoscUUN2P71ykQKEMo2Y24WqVoDtrIDcu5WSkD2oPpAt6f8CLTGtB1+v5yyZSgPa82igjJEeeZ+71+AUp6LuQ3OGdejH/t1TDoRCwjpavWJCYvxLMEBIiLetZI/JSnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=htYgICsa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="htYgICsa"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so100945105e9.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 01:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303621; x=1780908421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmVPGxo5yViqGmt/Bu0RZOE4gHJiRjSg/HFe8p5NX6s=;
        b=htYgICsapXhp6MgRr0p2heq/mQsEAaHWTOgMq0y45bgzYA8DI8rJDVahtnF5JmtfLD
         vOzWbUYbOWT0Eb/mPg02uqX7cLGH2sC+uQ0MsCWlsGxvp9lJSXGoIWnirLGcQAzOUol8
         QbnRJb0IsseHnoRBTC+YdfZ80VWPhBgih91KxmN/sS8qutsNC1xvWn41MMiy8cWe5s4c
         ajtx0qzFCS7Yx09P2vluwSQnZFfae12H5xUq/aH0UPTh3yheR0DrecJIaOKDkP21cR7q
         j9nTnDotbPHyywwzjPf2aOcxdlK9j1yy1nq2ziRYJQn/1xOf1ZK4BQgXc/EFv4KD5wLC
         Q8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303621; x=1780908421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OmVPGxo5yViqGmt/Bu0RZOE4gHJiRjSg/HFe8p5NX6s=;
        b=YY6nopOFfm4eeT5n5J8vteojfwEusZXj+4RIuKVvoGxxzoYNzf/zR8OWK/dSFoowF4
         MHGOFUgcoi9PdoIrFWqfEjS5ojbh9jACCW2gFfyr7+t4N1bqtG60qpCBN53oyHLqiifY
         2ppe2ilXqYoaF04sT3DZ8H+pfhkLrRfpEGryaEDJIm8BuNomHD/fwQA5eUvPS/xlynKd
         AOixAH5pRzL+a6SzWZs8W+1GFiY1MW2rjoQWct99SvgKWMlBzk5xGMy1I7CbKiRxLjWs
         cE/7hAlCnAPZaAz9OHUrAa7rD+S8AsIZmHE8k1A3WZOhrdsoVIVGLurP9NknyCSdb6Fo
         2RzA==
X-Forwarded-Encrypted: i=1; AFNElJ9u/Fh4vgY2gaqLDvq8Xq04Ah4dcPzC1zB5maGMhaYJW8aw6AfSXirNURls/bSgMxA/kvCwxcY5pBFx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7u7o6PvnBrlJWcSjjEldMnj2X9nqVANE3xrIop9DXmwkaStcP
	tpv7LMrtdxluDr0Rz4pxztiSG89kc9fTKyWX2P4gsGvOq2nuAa8q6v4hnG/DL4Fwcis=
X-Gm-Gg: Acq92OECZH+1K+3I3MGepSw3HAVpwS75XmphD4gA4SxkDYKMBY0B1bLZllgoTyDgQ2U
	fttCJJTxN4v10uHcGOhFwqnuQCE3WUiONfQ37WXg1lC3quuBMh1NUcCNTLjLURrYJCm+egRHCH5
	r+B0yIsDbOt6O3B2vGiylWuQiLAiAWrNJJwdr7oDUD0sBjWISIcv6qsxm6RbbdSnU5Ofiup7vef
	7bCFXZyckxP2ZGuIFXVjo8wmmVI+a092HCvdvk0Aj0R9XQm9NhF+zZ9VdDd+I9TXw9Yd27KRnkp
	PFKsGrT18XfxdIHk5PETR48JkDsmo3JQaGyVoSXKRleRlSEsfxLswSZ1h6rx3kpFFVuNM9fYINi
	zMHYWb855Q8ljmszrQeNpqsk+gMmnzPsQ4p3prc0ydcykNvaYsTT34HtW4VwEV5x2I7nVGl3jlm
	+WUNj5urBlXMY61ZGl/yTMzicb0hupaJU=
X-Received: by 2002:a05:600c:3b09:b0:490:a7ab:bbee with SMTP id 5b1f17b1804b1-490a7abbdcfmr125745245e9.15.1780303620937;
        Mon, 01 Jun 2026 01:47:00 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0e8c1bsm95750715e9.3.2026.06.01.01.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:47:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Mon, 01 Jun 2026 10:46:16 +0200
Subject: [PATCH v5 5/5] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f
 nodes to pre-ram bootphase
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-5-3856a023aff2@baylibre.com>
References: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
In-Reply-To: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=msp@baylibre.com;
 h=from:subject:message-id; bh=uAMXjM4R4ypUPu0O2chE4qQ0SBsBultATlgaeo4yXaA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZt8+x0gdne5pd9r24JXFq5taqTWvXVJ7LXO/GEhhwd
 4HctQyhjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIC1tGhmeBiiHPoy61H7uv
 mRzM/9R59bHT++T02y4z56uKqPmtbmZk6CxfalM5ffPSf9vkqi/e8jAp650UeDDj6na7H9e0cne
 J8gIA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 437b1df02142c666019ad4ad3558fa066e04781d..27b8f0b6666091d0ad8fb51be07f000e4c10c439 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -40,6 +40,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0x9ca08000 0x00 0x1000>;
 		no-map;
+		bootph-pre-ram;
 	};
 
 	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -89,6 +90,7 @@ &wkup_r5fss0_core0 {
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
 	status = "okay";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0 {

-- 
2.53.0

