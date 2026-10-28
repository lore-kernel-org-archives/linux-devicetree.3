Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185094;
	b=juHD55XBsGeMnO8CPtgfe0fnhoB/QYlN7Ct6QsZ9rcDhAnFVmBbUKSuGPq3dy+L1CP5D
	 qojS3rsE1EUXwsRJB2v+kZ3+cuh60zU/Keh/IjUwNDRUQuugTCqxNjA16Maxp0yk9fCZ9
	 WRnK5JgpAxG/fFR/BVB8NoTCvF9AH4FZ5R3N4R9tb27+Jdch15+l0AVsx7yudlSYSBRfW
	 J+B/qeaU+h0mgPiCdI4PyK/QKbHIiutbv/iKcky3aLaLZ2DhglEZrFZFisthsV9Cv/Mmq
	 G+UfPkVIJDWNffsXv+giEhkgRh+2g+DTyYDeAYraGy0UWNR8R4DIDUsS21kROi+fWWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q1RsoPgnfkWmfzIcQOevxAgUv9RWbdrqvZKCjq9hQeg=;
	b=JfVhGR8tgl99IgnzmCsJUKLEbg2Zt1tKyOjDLQVORRSRuMfb5dMDyUDvbPua5kcXcWFq
	 uqsXdKSHX5UmW2hen76DcvYhlf4RgFhM9TmCOahdnfm9xJigqHFQ5lx5Ja73J4UiTXW+s
	 X0RucZ0QqcPYu/0JssoVHndHNMDNFtfwlBStdCeZj+VgnAJK0qUmnMG1VkL2IRB0bv5ar
	 e+DiADxPcT8Ea366M6dkssw19Ez+LT4gSRs2B05S6rClSLkBlMEYVLJ1tl24nwqByTH0U
	 wE6eR3N1kv0AHLzw6EG25fb7iMZ1vZP32Iepk1+FvtedIZBjs1NnQpI9y6wuD7MRjIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GivSWpYZ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B495D606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B495D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GivSWpYZ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so6263245e9.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 03:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793185092; x=1793789892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1RsoPgnfkWmfzIcQOevxAgUv9RWbdrqvZKCjq9hQeg=;
        b=GivSWpYZ0b5ikL0WirNkogDtQIaJF9JnCAAB7wXuMCQm0nxYklLILmPiqrBVMyjlHK
         fIBaVv3uGdWIumdKrf6seIRCnj56owvuip6GEDmX74WBq/gM/JDoE2WwSpiPciz7hJ9n
         nA0dEafM4LG3GVapQx6FLZNTooVewlXjix6oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185092; x=1793789892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1RsoPgnfkWmfzIcQOevxAgUv9RWbdrqvZKCjq9hQeg=;
        b=uHwVpofXQ1r55luJq7zyJncsiy0xZu4rZYI5GHggYpe19I186caazc9iz0CrJVRzPe
         J+EUaXdl1/eCI+Y+ns1kOrPvl7sw7K/lO+3Ngjk+fylL//FTJ/hRV5vON/ZFuTTsEkS5
         Oh89ul1CbnRxhlflAILt/D7+RCw3TVY2li8r8SOVfe5IrAqO9jzDL36wknAPL9dy9QmT
         jwNBm5uU9xzvx6rkFqkjam9nn0fICaSXn3fzToE0euRsPKj+QhMD9guUMGRMMBj5hhtX
         V6irzEpDsQmLa1KINVcXES+v/xqpZiRm4P+jBbhiaEmI9xWGdIuyDPlclT40eDx0l1y4
         Ni+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGSVA69D1R9/nEnIdCqpnYIK7IPBZ9QML6Lr6cUHD/fw/MnaShWL3OzMOOMEidgrCGER7uSHikooex@vger.kernel.org
X-Gm-Message-State: AFq9FYLvvhbbq9lIeCugl+uEz+UKIilD+S97XKZPjysAJ7lNFy8lKi5N
	H6/tYd9ld0VZww2Z+ZRwCC71Gc2j7VDlP41SniiUz/NGwpcvPjtmzTnq6mkxSvjOsyY=
X-Gm-Gg: AYBFou36nwlCRfjtDFlcmIktLMyIJigx3nxuCKN14oNfnd+p8E18yU7Onn0MT2Gbheh
	cNzszr4ylpNWNvzq+3P8aTHlOIZiSh73uTLUvTvJ3bfNECYrUE0h3iou8z4AuNiXL0WV5wYnoM0
	0854RjuRzv/wISP4/ZwFCKtZJ54tQslXPbsGg86GQMts1WReAqmtZYQvyjPqPCeMCXFuiXEhtLI
	/b6WDJ2QCm626SHmN3MSraae2qGGsbpHyESOOoPxmjkEwFvTn3lHReFnv9syng/3ZfNzMljnlDu
	qehhiPUd6giEqiBWCiihvRaa1tD65X0joelP4pWUz9FdZoWCy2aePkgDadUdN//5sAFfcOystTq
	o/ov2LCgAJlF59xhc7nfzOsWwOrH7VkNxJ0uBpigH7APRadKsERP2MQXe3/fhZAo9JY/F+peOSx
	ntq7i4exjMDqd9yC/RVwrtmcAUTvTXdo68uhURZa+TYRlgIN58HBuGioDU0LCvi0dLt51tPpjuL
	t+QgOg1xQxCSEnQ7yZkAsjyI89oqEUMKjnHleBsqg+V2qCk0NN+AHCFrjpVlNcwgTzivVUC2BDI
	mb3R6DpSB7GewKwwm/JgzKI9UIGtUmT+QB67pZw54jfqwPe8pmOWP0wTn3qH1uS0xfncbwOoRZQ
	8A20NPfui5/bLY1EYMZu3RJEkzYe6/vBtL9gi1QYXtnmJ0oggCbVy2YjGkmit+UKNH7hX5a8=
X-Received: by 2002:a05:600c:4e03:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4a9640f217amr38505965e9.2.1793185092065;
        Wed, 28 Oct 2026 03:58:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42ca77sm35782785e9.8.2026.10.28.03.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:58:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] arm64: dts: st: add firmware reserved memory to Engicam MicroGEA-STM32MP257
Date: Wed, 28 Oct 2026 11:57:40 +0100
Message-ID: <20261028105807.2567225-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first 64 MiB of the DDR are used by the secure firmware (TF-M,
Cortex-M33 firmware, BL31 and OP-TEE) and are protected by the RISAF
firewall. Without a reserved-memory node Linux allocates pages there,
and the first access triggers an IAC exception and an OP-TEE panic:

  E/TC:0   stm32_iac_itr:197 IAC exception ID: 137
  Faulty address (IADDR0): 0x80000060
  E/TC:0   Panic at core/drivers/firewall/stm32_iac.c:212 <stm32_iac_itr>

Reserve the region, as done for the stm32mp257f-ev1 board.

Fixes: c5ce8d7bcc78 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../boot/dts/st/stm32mp257-engicam-microgea.dtsi     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
index 5b4287e86def..6cd64587ecdc 100644
--- a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
@@ -19,6 +19,18 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		fw@80000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x80000000 0x0 0x4000000>;
+			no-map;
+		};
+	};
 };
 
 &scmi_regu {
---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
branch: stm32mp257-engicam-microgea-fw-reserved-memory

-- 
2.43.0

