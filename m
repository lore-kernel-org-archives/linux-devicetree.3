Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378503;
	b=4J9z25TMw5AXdIPPzAeXNtJW+enRyZMxWusTnjieSyY7LFW0TEP+Bnb2kPj5rwg4Xaef
	 ZsxJpjZk4aS1rTIE5Ak9FAFiw1sNsX93kUWEKkR7kUNhgaPsjuPWryDvHWIe8b0aaPuHB
	 C19NoUT0j9470USgpfUxqmz4++HtIFsXSVMKEkoNh2jnKiexs2lLY4TeFYYdher9aN1Zn
	 QWsMaYK0szThYcynXA8mjncseZhCBASCaLx257Y6u9SSv9JYx/rfwnWJ+7xG19O9OJA5s
	 HB0F1RoTMdhW7KIK0UMe1CezAyrpzxvAHku5jNLXzkX5D/dqcTPQKBX4qJjPzT1NCvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MaqYWImv02DJ+CpqgjmSJfLLPzjJ2VjogqkfcXMZh8E=;
	b=sZBt6eNtdKpulsTkwVtRBQCmzF6iWAn9RGseUdT4ih07PohZTBhw+j7ZY0eIY2lMYu6c
	 gy5buOSh/LHCWVScXDG9xeMJ6oy+VoxjFFXQWT8QAJebrOlkcLPU90k0Km+8oJZe/58wW
	 Fi1nWYfdamzZ5/leMMqPeK1k0KFbV+PkxCuzLBmRofuLE2oDAYPVcQuhRi5kklkqWUzQq
	 Y3e2468RJpaaQYUYSHsnn4m3A4jUntW+JTdX2OjQK4mo7WO31zCxHqWSFKC3bf2u4p6H8
	 mi/eXOYznuwruWmy/HRUzGyQT7k7HnKWR6etAqGnmnInL+PLlGLwOkdcm/xRcuWPkdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+tBIyG6;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A42C606A68D
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A42C606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+tBIyG6
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso3408921a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378501; x=1795983301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MaqYWImv02DJ+CpqgjmSJfLLPzjJ2VjogqkfcXMZh8E=;
        b=A+tBIyG6FwKA51lw2JK4ViwReDqsc56mbtfe7BW93tsdunhceN+ejkxD2D0u8vNYyU
         PcO/HRW82JLP1rm439Aljgl4SuoKKPM/PnLDLOKtzRXRE9aHCilcoX/sgIICSyacpAtF
         UNaoQeIdQav/KcsFDCZMe1gERTA65AFO2bS+KRdQi8ENsvTHTVGzaNxmnG2dsWvhBtHP
         PT+UqCHw42m61ldaoGj70KTYsRtdgWPh68Q+4n6ChIz6/4a+xfrNyiAdZLNpB+Wzyr10
         fau0+BG6bLu2DJfS69pAkUHon0HQQ9YL+sxGD5mqV1MVI2Ftuk48oqcu244aCxvaabX5
         96fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378501; x=1795983301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MaqYWImv02DJ+CpqgjmSJfLLPzjJ2VjogqkfcXMZh8E=;
        b=1vpUkwiyhkFsnVAOB45bXUWToxyw699G3vlbDU16SQPZMdQvOwiR+6FdSRTTcOnxOL
         eWdEMaj0BKiqgDVUi/qHzVOAVkMTP9SIXEHo72Mfbv0iCvX+VqSuueJts/nlU3LxCti1
         ipgNSg/mOYKGciyDrk/4wbr6jta/vdQn+l+eDCaZkSUJfJCUn0/6PPkhSqpqTCE4OOU+
         apoiVE4y63wuowuCfWXR/22sneZbWd5MI9s9E19wi7c1rKR6FxZV75VE2ZAUs6W8v85z
         ITtyHeh341vj/ElyhaK+xeIwyzguyUC1oh9DMFYUxlFWbhyUTz08MYNG5CZcBpF04ddf
         tCxA==
X-Gm-Message-State: APuU4Z8om3OGonJputS+APxPd/5AjofuJGZhuFMwXOsq4qTT1qXayl14
	YHemSF5kAntaslY4IMPdnGSTzU41CzHHsOHl+rlfOHB+jKSyatMplefe
X-Gm-Gg: AZFdTZeiGE8aR/lHbIjuIcnBhai8TNJgEzDdzkZjr0kkUEEUyZ7c6xHNzt11+TQutDe
	veeaoBhSktrMIR6ZplezhF3ylYxg206UUPEXC/Pr/BiV6PvBw4VY0o7zMquHte0ZhtSAbJmSMHN
	MxRQC4OG/EtsKOE/ZRDBJ66syv0WPlU4ist/jo8vr8y+/V4cIvPBpR7P9Ippn1pWE0hs1CIO+eQ
	4VBUMlbbkQHr8cnG15k+hBgalJLWZpy4H8SnNE7OXKX1x3CJu79DPZq5a3iEBaF5jEzEoWJARKK
	RPaIb2zdfxm1kXWH8dIHBkidzyZa4ALC07NraGvxJFQ7CbVtgTuZIpFr9Hlw6mC3/iIQmELOFlZ
	HlMBsscjmXrXh64oBPdaK7UwDTlD4TqfI2QyOwxdvSWk+FcYaBjId3B7fEosuPyYiqDvqnqhQeX
	9hVKV7maDh9g0MWmq84K2fywZOVhkPU564XpEnP60RrWhcjN/nxnBoOdj6piYaAIw7NmsPIcIe9
	xUIq85z6cRTc5Ff/ZHPwWaOkmz1UoQyiPbLcdw3+HTBu3WYnf+FmW8NEhp2csLx4fB/6LE/fKYh
	P6EY9iIgv78uydDXMeZoqXRkIjt+dmASiTmf7xRobo9Z1aRc3JDyAibo+mOUe1TZ9dEEvsj2dVP
	aUJpVYJu0wA==
X-Received: by 2002:aa7:da08:0:b0:6ba:144f:ae49 with SMTP id 4fb4d7f45d1cf-6ba37e8b7cemr4884943a12.27.1795378501279;
        Sun, 22 Nov 2026 12:15:01 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:15:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 16/18] ARM: tegra: tegratab: Update aliases, chosen and memory nodes
Date: Sun, 22 Nov 2026 22:14:05 +0200
Message-ID: <20261122201407.23742-17-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Add the chassis-type property. Add RTC aliases and place the aliases node
first. Drop redundant configurations from the chosen node. Expose all
available memory in the memory node, but add reserved memory regions to
avoid touching TrustZone or bootloader firmware.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 44 ++++++++++++++-----
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index f6b167dc8d338..1e9df07dadc98 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -6,23 +6,24 @@
 #include "tegra114.dtsi"
 
 / {
-	chosen {
-		/* TN7's bootloader's arguments need to be overridden */
-		bootargs = "console=ttyS0,115200n8 console=tty1 gpt fbcon=rotate:2";
-		/* TN7's bootloader will place initrd at this address */
-		linux,initrd-start = <0x82000000>;
-		linux,initrd-end = <0x82800000>;
-	};
+	chassis-type = "tablet";
 
 	aliases {
 		mmc0 = &sdmmc4; /* eMMC */
 		mmc1 = &sdmmc3; /* uSD slot */
 		mmc2 = &sdmmc1; /* WiFi */
 
-		serial0 = &uartd;
+		rtc0 = &palmas;
+		rtc1 = "/rtc@7000e000";
+
+		serial0 = &uartd; /* Console */
 		serial1 = &uartc; /* Bluetooth */
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	firmware {
 		trusted-foundations {
 			compatible = "tlm,trusted-foundations";
@@ -32,8 +33,31 @@ trusted-foundations {
 	};
 
 	memory@80000000 {
-		/* memory >= 0x37e00000 is reserved for firmware usage */
-		reg = <0x80000000 0x37e00000>;
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,cma@80000000 {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x80000000 0x30000000>;
+			size = <0x10000000>;		/* 256MiB */
+			linux,cma-default;
+			reusable;
+		};
+
+		bootloader-firmware@b7e00000 {
+			reg = <0xb7e00000 0x8000000>;   /* 128MB */
+			no-map;
+		};
+
+		trustzone@bfe00000 {
+			reg = <0xbfe00000 0x200000>;	/* 2MB */
+			no-map;
+		};
 	};
 
 	host1x@50000000 {
-- 
2.53.0

