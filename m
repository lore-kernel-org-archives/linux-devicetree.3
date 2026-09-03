Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4E4A4987
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439244; cv=none; b=WjH989WGKP6Z35PFZt9TQXbf0hchecYl6vAIeLjuF28kVqxmxIyxh8mt2F1IPYwV80PrcV2lyKAsIB0qD/JJUTmf+WD6PRFLC7tswnCao7zTfCSyle4zvo8NmwZCMzh8p0zBoWuN2YEpK+Pk65J86ZfvbG8qd7XC1xI5hgYq3cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439244; c=relaxed/simple;
	bh=QsWsNZTIkr67WF9AjDgtYRNQrYQN536HF4RLuL9T4IA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFIDy6o47BqMBs/qcloFzoLcMepP1EqY4j9KGh6TDCwaL4uUo2pUAS9vrZcS8UKtIG+MSdV5Zty8AemzFvBz2hH42AtWL9gxKH9u97qikRbgIpHne3bqQhmTmQy8DpZcJaU/dDfOzZ4yIDg4zzQDdLbNV4Mb4ylVKOkTS8I5Quo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ipLBJ5Fu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ipLBJ5Fu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so25777455e9.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439241; x=1789044041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjFZmudxAh+ySTUFXLrbiWaAvGo3ICyw/TH1dxTohxw=;
        b=ipLBJ5FuiBa18jgDhq3PVNpy5AGWb0ZbADHiNtBjBaebeQvU/MetuXRHJm5RmtVR9j
         acd6+CyTGsuB0p+f50OGP/TiNuWbb9KddQutwJlkrDzrxXV6iQL7xV9VFNjY3GRs4dBF
         1tdCm56Oo5KXUFD2tdf6L0bPOJ8o93ssgbvtnLpn6m9hxXo4epOjCnquzgHjWwMhGDdI
         Rqbz9AFOW6zRc+pP/5Yy8yLCgC50MkDAH8KrokBd7Qy4UeU02+8V6/xLVayVhKeH7TjX
         do+RYBKaCmXLO1CcXertSamW3wTIiC15FyhjYp1Wjuu/TMUZWsvZ6Lu8dtrQFUhBVOOP
         EncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439241; x=1789044041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjFZmudxAh+ySTUFXLrbiWaAvGo3ICyw/TH1dxTohxw=;
        b=Pcst5jB6ZYgnkXJHCVKvCf6HHH1Vxxh2RsrLu+aosDRlaQH4pZoDm/Ri8WPEHZ8yuC
         cO8BjN+LNUu7qF0AkxSwUIlniX/3MhCvRudLl3DzAfoR5P9hrDAXoLSJ4ZqnvUg9JFaf
         dcrsVUkZGbr7732zbzhDGy0lF/D/KRSk1H6kC85kFL/kTcMQcAMVewCJ9YYEQosGPNMU
         Dm97p4b1xirdCfZ+WQQNKVhGy3VZp0sBsmw53aDBrQIRa020n+v0WPRVxuP1fHYJgrQK
         zvodx7EfJqN3dvHR7lCLJ1svZsVPBwesSdgjRhsH8RC7cy6cpFRsifahJukSfq6PqVjp
         xFkw==
X-Forwarded-Encrypted: i=1; AKwUvBxOedGNrrzQS1PdB3DFrSovEQAxrWEmHLt/L/8nLGKonCFB9eoRdIgyyqlJuhobSqBl+pAPoYgkK+C+@vger.kernel.org
X-Gm-Message-State: AFuF++lWooiTXnjW5C76OLXAtfVPGLAm3g742eQhAIx34suXCpZqghdl
	mUAQlRpHlvHKT/UY0h6SNaIt3/Gv8rgRXr4UF/Q5D9D72jrPkDcMGNU1E2PijbaiNo0=
X-Gm-Gg: AYBFou3a4wQxrGYoEag5lTleGpNtqmSCU33DxG5LhLrHgxdpz30kt9hy+9Pzk/exn8J
	WVCX1oZ4uGlv9vRt3tQwi+7an8vamJTJhoAmj9Qmxj4Ft0jw6n6NeReuZ0hgfwjbyPI22IN4+QJ
	p4lU785Z8TEiW8qw1NeaansmNREZ8BalQgPD/UwoqcrQcyzf5GCEXGjndfMIR/KTBd3DqzQnEmW
	WIPxXWMNh11eXlkQDRK27OQPYaTEQWv7jaialAonkhuW/Tw6EjDMYS1VzQueqF5HCUFvxRBj3Or
	vPuP/i+BLQTW5pOWAfYavemkqlfcap0Gk1xdpMsOZP6//GcHdnk9uVDeOFOw2Ua7Qv1xIbh/AIB
	FsMkf/ZvSUi8jR2c6m+YA0r+7/eixD7h3LlBRdN9NvKtNBFDJKs76SBc5H3VUpRkr45Acq+Mu32
	tBMyUdaq+6LIBQo7goR6VkaP2nVPVzGIgBdp+2pkEbtzeFicNebjzu7caDC6BRCulp7WU1
X-Received: by 2002:a05:600c:34c2:b0:499:7219:122f with SMTP id 5b1f17b1804b1-49ce581f2d9mr233935795e9.4.1788439240973;
        Thu, 03 Sep 2026 05:40:40 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm88257445e9.0.2026.09.03.05.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:40 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:25 +0200
Subject: [PATCH v8 4/9] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-4-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=msp@baylibre.com;
 h=from:subject:message-id; bh=QsWsNZTIkr67WF9AjDgtYRNQrYQN536HF4RLuL9T4IA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWdNFzSayXi4SfJp8vNTrucnBI8nzJm1uVQ5mMvL0n
 bAhQ/BBRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEwkbxrDP6Wo3EkqE9Vqzuzc
 6Nd13e8hM9Omr7aTb8sznCxPLjBnEWf4p8lTm1r9T/Pw+iMtLbryr67bFlnNd3iqMX/HgYvSHel
 HGQE=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with
0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 7ee894d59113..8a5ff5c45757 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 	};

-- 
2.55.0

