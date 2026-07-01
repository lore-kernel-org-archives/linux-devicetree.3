Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E8A48BD42
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909664; cv=none; b=ojzCCJIxGAb4lgmiyvUPLrN2ixJYHoGhlA46sTxm2lzjnJ/C1FJjuUh3rAF2B6WIoma/iO//7A/dTCEKV7Qcy2uEdDnwplRh64o4lY/9FtpimLuUUVM88LJGD6qoPNBapR0HCZDxbcr9wY2GKUGz8xWdFL8V0MvRgcFqgzxZODo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909664; c=relaxed/simple;
	bh=1HjXZU3N3yWNNw6i7VHEK3NtZRbPjnphoL+Zf42nRpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gC9tY12qEL5NYVIcIbQQ0Ge0y3QzB8tQM2XfpP7J9/M5mi+KicxkVehTqtSx77P06VlBRhIzuU9cAATDQ9LxHedeArO0FyTRbeVbI3NtOKbSJPB2RBUZp4O3Zc3IWU4Mk1D5a7lQ5lzvOJuPtENyVcgfiSotWchEJ8FoHHdIWJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XF6iLV1U; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XF6iLV1U"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so4949495e9.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909661; x=1783514461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=;
        b=XF6iLV1UN4ED7sBZKyeO9prWKS0yAOPFRX6OLpPE9dKMXVz8Al3A+Gpkt6KkoTQq5X
         dk3LiM1lTs4Fq57quWNkmdOTmMQUyrvKeECTmOY3Y1LZ67J+hruxs8Ax8KCG47EIGXjr
         PEcjj6WoZlZPUKPh7TgsCGwNNf3UCwqqQng4wCX20blDpnbqCN7VCWEUKolgeW4uI/IL
         izMI5Vuk8vMXsCdh3EPg47QScxOm5NdDlgQvx+Lfb2Q1ZR/Sz3nWTMvsZwwVkv2ocRg0
         Rpz/JYdqdZscZvF2D5N51GtzvXNBfrpPzULtlFpHxxsnDAleFTB4JIPBK81qCspIW5KB
         gSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909661; x=1783514461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=;
        b=dZ7dkZ3mFL0BbUckI6S3p+CCty5BSrPGaKvtSe7NdDiA+YZVgaAsYykoqiMpUeQ3K8
         a10w6qyzP7NRMBNTtoroVVY9ZYQRw2UddmCQTb/6phCrH0qVyfc3SiSXiRVbdPaLCElH
         hkKnPajF+SD3Wk+zRq1aRVdyRFONTn/Vl9iEbVlyxWPxP39bwr/BXlMSxbMMMG3zSU4+
         t7prpRGVMUazjg3RWMXIG4xIAxCl4fvNZCgwe3RS21Zf3SOJYar/JKKjjdvdSPXQhNm1
         hl0hF3BihYTNL2kStPT8BiHstL9xqfF8HQZElPwjxgSiBqNzZTfbzPdYaQsOfhICih6k
         RI6g==
X-Forwarded-Encrypted: i=1; AFNElJ/8Cf+8DjR7xjJJHjdW4WrKh/MJ88iWmmQ7EMamGEj1IxW9t6KHsRU6K00/y2FT6bC17uZRipED6a5h@vger.kernel.org
X-Gm-Message-State: AOJu0YyIljo5EAdlzSmvtVyBLlvzEbcyEc8G57Mom3gFLe/Gare/3KEy
	IT6gydlS5HyejnQ1GU7xp4WLv+ePPa2O9BdXOIjrGKlaBja/iFw8bY6XMiKMz8Fa9IE=
X-Gm-Gg: AfdE7clqNvcLvznCJWN5u9C+Ai2hOpllLfQiH9uUvJJX1IWN07C/2GzbWrE/sBpQUGn
	DJWytUmRQGpGz9aMfDuxA31Vyz8kruN8Ic9P7Ux82ixQMOxIpZ674paKDTnHqqU7SpHkQmVIcms
	tgm3munhLHYvfyNvRkJksWTmHFT0GnY9ZS7f7Xq8h3g1xfZrXg48pgZbMQJGV+FZj/RaIt6RxUW
	sHX9L5Me8fKntvJtk8hDXcXOVaLK6BZ62EXNaSRw52mLkIByT07OjFnUsE4iuVpRRkMV0mRfX6w
	FqdVJJSSMD8LxCHwdtdW60Tfy4O7HT25A7QZ7F53cKPeEEeVFEUabNrN2AR3ED+Lo7hUzI+dtwh
	nUujLz9GAy6WizMPx/KpIjxUGRZgq4ImWyUZngG2bMjygne5e720sIFqJkoOUFeLeM+Smi8VWBp
	cGCKhzbn4/Rw==
X-Received: by 2002:a05:600c:5307:b0:493:bfea:2786 with SMTP id 5b1f17b1804b1-493c3df38b1mr7549745e9.32.1782909661423;
        Wed, 01 Jul 2026 05:41:01 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm72470595e9.6.2026.07.01.05.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:41:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:22 +0200
Subject: [PATCH v7 10/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split
 r5f memory region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-10-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400; i=msp@baylibre.com;
 h=from:subject:message-id; bh=1HjXZU3N3yWNNw6i7VHEK3NtZRbPjnphoL+Zf42nRpo=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrr3806ZIac/87yDv/G0e60K21tWLXFIly7QWGTI9u
 Kyqfre4o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACaieIThn8Hqot8VWi1HcqQ8
 N/zkFZPViGuJ/GO0OKe5K0RBnPXTTYa/ovelJjw+0aqgfTx8+VxWTb7r5eafhZmOh3JFbL+65Gg
 UGwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index f77651109564224408723b72baba93e39a82be07..8f7409da83392d2d1f160a9645ef4d68f7aaa1bf 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -24,9 +24,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 		no-map;
 	};
 
-	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 		compatible = "shared-dma-pool";
-		reg = <0x00 0x9c900000 0x00 0x01d08000>;
+		reg = <0x00 0x9c900000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca00000 0x00 0x8000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca08000 0x00 0x1000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca09000 0x00 0x97000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 		no-map;
 	};
 };
@@ -56,8 +80,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	status = "okay";
 };
 

-- 
2.53.0

