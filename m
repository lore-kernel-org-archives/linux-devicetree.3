Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BF44028D6
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789441849; cv=none; b=fGL3qt7CJFmMCrr5MrjY11SWv3eFHhc/KOfkSxS5ygZYjJge5dcJRZd2wYrKZvbBG9JVE5ZzePtw9viS8pExQjnG1DJJnxpcST8LhDQIvOm40OH2/smlrLY4othom+VEz6Jgud6HDHq5GndmdAxissZfk/brVvGxSyZ6f69l9SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789441849; c=relaxed/simple;
	bh=Tqm8mGXvI2nKoUm+9pLtaJ+uyO5KFGl5Yiy7z7wtnBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLAEVnOANhnj/z3i0vNVhkCEKMrdbFBnoJCV6/N45rI1n69EaNYMPzNaBQYMtxXXaTRK3MACzvz8Yf5cl+E2y3oIvZyd5FiUjw1OGsSskxV+2U/zJ23XcoPF3ODwfFHW6M6X5vvOfOMVVUVUK/RXOtqDiFOfS9kAQQUa4uxrqsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=tGa9frY1; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="tGa9frY1"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-530e1b6a689so22406911cf.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 20:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789441846; x=1790046646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSNWHoyvKJfGdDxylfGmEXIoCFeqbapyGd1fgWyygV0=;
        b=tGa9frY1CyWiXP3Ve/Nl+X1cwDGI7vW6LYKcX9kUlCsoo4gg68RRZ+F/+XxLR/DHYF
         CkLjUkEygXTmYTxln3LzeYTwCKvxP4X+yVSwkM5F8Kf2vw5Igc0TKGUuqNo6Q1Gdj1pW
         SA7LVU441bJ+u3ZGtlQ+M1R+maw50Lnt54uTtBVAZFKaTjKjqJ0ztKK6MgzGD4E3LUGm
         I/Bwc5AW1Y+kwEra3LdsxTfeQjiz53Bo4o6RsnortHXK5t8YA07Xw6rOHse9DpGtmxHw
         R1UhP4r3Xa/+9fAChpR3zLNO72vFy6RMHcJ7RBy2mc+1MoMbfJlKmZCdMCmTyJ99bO/H
         SEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789441846; x=1790046646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSNWHoyvKJfGdDxylfGmEXIoCFeqbapyGd1fgWyygV0=;
        b=TswjCguRlOlt+EE8dTElDoKWljH1BHaxmNmfFFZA5lZGPyGfyLHdvvOc7CVmvdG2V/
         VmSatWE3Nt95/vAtF2uyYrKVRAKPo8FPHoO52H/5cot483koHvsOjs4hzLRqowf4YLSv
         1mNw7v7tqiSxRBPpzqkrCweCW2H1cfNyrTJaA07l8QIzp3u06ZG9grRvAZGAGSHbMVZ8
         Mcq7YX95n54u/C5473G8SS/30YIEeaieMrI0Am+W55HHjpG9hXSOnLkDqT76e1dnaghm
         985AxKRqFg1GJroT/cIEcplxo62H9p/pjnJkyyq7e0MssGyhlJGlIPjOZS9WAn3OLV6R
         +ymw==
X-Forwarded-Encrypted: i=1; AKwUvBydx1xc5aboQh5tMHJmNtQIw+x4l1X55J9pg2qqlTXX2oy80PTTEONt1/fKsWXXWHZhYgWlbkbp6YEl@vger.kernel.org
X-Gm-Message-State: AFuF++lXUtnbEoQxEop1SJUhBN5zkKB+UjOdiiTFKClMfBJque8oGsfz
	DeUC5FuStolX8ewNjvI0R8lHh7R5WwTIQEEXaUj2wRYYnkEvsgC80bTQgEne7WSFXHM=
X-Gm-Gg: AYBFou05k6WqLFeO377ilYn8kVxt8j6JqIrkAF0nzrqPNRhvRkaX/84V+dycAPLp1GT
	Wmed0W+9ka/l3I1III72PfTMMOYrMHSdvJrK5YYVdRVq/nD4EzXgtWlopegClJGaZBcSPpNFayZ
	UCkNB/Ij3fZXgODLZnNtBPw2fWwmINltzyX3RF/N3rTMFOoFejIlXOiDe4imPpqF8t4Aie0tuiP
	DUICoVMJszb3hhj9oPgBUm/HP3RFL81UkOSGjhVy2s+T8zTms4mqehcROuqHgso9z5rPsgxOMGt
	W16xMNvvm1ajlp0Xbkt0g94VEna81qRRFQFEi/gFu+7viDp+x1mNi6LlShZVQXpHw8LvVGIp+gG
	Pac8YtNStOgYQn33VwtuCuG08TN/t7BQ5GN2zHrQfIP1C6UEAo22RP112yLt39qFUtV7/1m6hgv
	RXUEFW/KTXb7ne2AL4jGyUE3ICiRINMJnwPdfyvc7SE0R/5KF9VnKlyu9+tFZR1Qfqv9npd5UX7
	WQ=
X-Received: by 2002:a05:622a:1919:b0:530:efea:7a55 with SMTP id d75a77b69052e-5310cef6b70mr77015881cf.4.1789441846176;
        Mon, 14 Sep 2026 20:10:46 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ce4ec298sm118563841cf.16.2026.09.14.20.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:10:45 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses
Date: Mon, 14 Sep 2026 22:10:37 -0500
Message-ID: <20260915031038.1087264-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915031038.1087264-1-elder@riscstar.com>
References: <20260915031038.1087264-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TC9564 SoC incorporates a PCIe switch, which is connected via
the second PCI segment (0001) on the RB3gen2 platform.  The third
downstream port of that switch (pcie@3,0) has an embedded PCIe
endpoint that implements two PCIe functions.

The SoC implements other peripherals, and they will be accessed via
PCI endpoint bus.  Define the devicetree nodes representing these
buses, including the mapping of each BAR's address range to its
local address space.

The endpoint's ranges property must be defined, but it will be
updated dynamically to include all BARs.  As a result of this update,
the parent address portion of each range will reflect the specific
address assigned to the BAR.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Added this patch to the series

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 3bb5fca8e2b13..59fbb0444d9b7 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -955,11 +955,41 @@ pcie@3,0 {
 			bus-range = <0x5 0xff>;
 
 			dev@0,0 {
+				compatible = "pci1179,0220";
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				/* Ranges will be updated dynamically */
+				ranges = <0x0 0x0 0x0  0x83050000 0x0 0x0 0x0 0x4000>,
+					 <0x2 0x0 0x0  0x83050000 0x0 0x0 0x0 0x80000>,
+					 <0x4 0x0 0x0  0x83050000 0x0 0x0 0x0 0x200000>;
+
+				pci-ep-bus@4 {
+					compatible = "simple-bus";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					/* Map 0x0-0x1fffff to BAR 4 */
+					ranges = <0x0  0x4 0x0 0x0  0x200000>;
+				};
 			};
 
 			dev@0,1 {
+				compatible = "pci1179,0220";
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				/* Ranges will be updated dynamically */
+				ranges = <0x0 0x0 0x0  0x83050100 0x0 0x0 0x0 0x4000>,
+					 <0x2 0x0 0x0  0x83050100 0x0 0x0 0x0 0x80000>,
+					 <0x4 0x0 0x0  0x83050100 0x0 0x0 0x0 0x200000>;
+
+				pci-ep-bus@4 {
+					compatible = "simple-bus";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					/* Map 0x0-0x1fffff to BAR 4 */
+					ranges = <0x0  0x4 0x0 0x0  0x200000>;
+				};
 			};
 		};
 	};
-- 
2.53.0

