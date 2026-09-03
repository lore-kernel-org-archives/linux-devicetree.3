Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AACA4A499D
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439243; cv=none; b=ANwO1Cpgl4fL5GRVGvrA10Nc7LtCY8Fidh4IPjVav3XU8ITL3OSfXVW0BCl0Bwz/6vMuEtOSOm+yhN6ECnKq5FTTbosnxmHoZyyH9oBXRT9YFDDHffE7sCOI4C3EuYvvBS8/R9TvgZmwrVqljNIANIGaHJpDn1nm3anccdiPzgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439243; c=relaxed/simple;
	bh=FoQ3XTwpNwKbtnfX5AvLGyDYALD0aJcqQzBoRSx3Yo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iG/+lyR93yCyaNRKWQ89hMd919lPFP1CKAUYcj2SF9CpmOHf9MEZ6Xjxj44/E/wXVKX+Kw4b2nCD9yuYU27AJUv/e7slYzAGZVf5MHvxrozP84/7qMOx7YDv84bydHYGWb98cVxWkkwXLTrTrUJX68vGdupE02G6ycCrpTzvhZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RnX2Nk8e; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RnX2Nk8e"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1553800f8f.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 05:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439239; x=1789044039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBo5GglLSUf+2qKcbw0juE43gyDXKzXipzNkiqLKy4U=;
        b=RnX2Nk8eZDgu5QyixlWDEQfpsQRyCWb3ql63UN46zWLmYBLIoKJbdLsk/pzgkyaAE0
         ppWtnePJA+wFYad9DDyUz5Kx+ODdO81pOPGKg15ypYij5qKzRI3VbSxeFN4aD4xXE3Bw
         WUOxCyVfOt6dLzOtT4+5qLJ+EV+pA9iPgtc7Dfu6Zh9/n/YQV6+v75hgzVRGhLRQ5MNQ
         918Ueyp+isR7HY/S/GFADUM3Uz8ZRmQ66LFWDlA9dZEmysrToxGDCGDQSpHvqHuSdUtw
         +4odXBypfTX24LthWLhQGxNN89boW1nacU7Qp57HeuDukWAaov++EHtAqmfzhb3LrhyC
         +0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439239; x=1789044039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBo5GglLSUf+2qKcbw0juE43gyDXKzXipzNkiqLKy4U=;
        b=RtfehHbDstyhD7W4bK7IrHoOesjk/HMhu62o2Hi331JZP45kQZ3rZKFoTLkXbaVMv9
         0I4bfhmuNvFMUdP6T1xLB5l9r87CrX023hHqLOqC+jF2XouzXD8EuZZlUAleQvMCHsEg
         9XDW0Lhh9zj1l+6sXVMrwiuWHqNTrcjst5ka/Nm2I1PrgPNKSX9kHF/ZMlQGib6BdvsE
         vYJH2a3WfWh2Hmw/KSxP45uF+ENa9LyyDenGfVvroaCFE4etjXptzqFIU0QKfjqRzvfQ
         r9pA9W9JEV+unaL1iA3E/i03JYaTcO4wPBL+qu6khMogv8+Vt+pT5kVbzC41WEkgyGNX
         UPcw==
X-Forwarded-Encrypted: i=1; AKwUvBygCeg2Y+7z+k5+DceXEVzAU3Vk3sfQXIzBZvNHiE4pQ+NOR6vl3Yeervk7USWQ6ToASWOm0DL+ql5V@vger.kernel.org
X-Gm-Message-State: AFuF++kqsX9dGXuL3PQO9kGtraa7rpTz/Y6J0TCVerI0MKjAuSpwWFb2
	mVenbigYfPZ2kNvuoM4KCTmE9IMINiblKKvRrHGDoed3knVgCHmlo/qNDtJofpryCqo=
X-Gm-Gg: AYBFou3Xz8FG/6L6M/nXRfcMUwEUs4tD4eeP0Pk7uJdQdj96XPGh9cJbB8q/f8CKz7f
	1/N2Amt1KwKsHKx/NUKUXJknSe7BuvRiUbM/PshWDg/bf5squ0SH0mD1xyaR10Bk9pbRXn/9q/5
	gEaDSKuPLf0CCpwFsFVyg4rBgFBtBK9/XJq28V6hbgVIEuDwGejAXjXpRLpugOC19AlEyV1rw4g
	Pqft7XAHr6VUNOpDvgcynLDkDt5jxEQa8LjUNOD9omN1bcqq3O0XB08YHVBJoav7C56nxJe1x93
	e1gJtGkHEzc88tNWkbPUZrAYIKvDw9Zumq3XNa+iTWO6xV7wT9QnOunXK+hbZ0bZ1gEAtbNbVp8
	rGbd7WaxHMpZ3SDl6hnVlZZpmnRybFeMjLjs/IsLL7mko2hi8V6X+Csk2GevvUNR2QCAfevYQZM
	DX2Wn1jNtuCjWduqChyVJy1zHpRfQswMTaCSKQjELLxCw0LwV/ciKxFah56g==
X-Received: by 2002:a05:6000:2dc8:b0:482:f270:65c5 with SMTP id ffacd0b85a97d-48488f07d61mr20646049f8f.9.1788439239541;
        Thu, 03 Sep 2026 05:40:39 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeae34sm14604419f8f.32.2026.09.03.05.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:39 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:24 +0200
Subject: [PATCH v8 3/9] arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-3-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=msp@baylibre.com;
 h=from:subject:message-id; bh=FoQ3XTwpNwKbtnfX5AvLGyDYALD0aJcqQzBoRSx3Yo8=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWZNO5Uvd3h/88vvRQg9XP+vqXkGdf8v0OGOy86893
 iU4qetpRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEykVpXhr4hH0ovjpwQOiRTe
 6Z7E2Fe4anWDQ2Pi1ySN30l6ZXczhRj+mcRuSgvSyF0+ce7blcJhL8VaPXg12/bYVG0WNGZIk2h
 gAAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

AM62A additionally has a second DM firmware for edgeai whose highest
section end address reaches 0x9e700000, so the region should end there:

    0x9e700000 - 0x9c900000 = 0x1e00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 77c29ebe76d8 ("arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index d3b3675e7a8f..6e5419de8e35 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -61,7 +61,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 		};
 

-- 
2.55.0

