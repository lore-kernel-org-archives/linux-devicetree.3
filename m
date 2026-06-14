Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802A63C7696
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781448705; cv=none; b=WVeFxi30lizJlwrzncZ9uFDWNouzdfrWOTryZop3jLmkOKKsGEA4r47/5asV5StuSCSKM97SN8K5cFvo6lf4AOdNZv27ijAHvCUSXm3hDjEKbi14AY6wjCzH8KikCfqNmtuD75T1AETWvIMxfGn8q6QkawW074w7Tc0ae78L0Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781448705; c=relaxed/simple;
	bh=ogMc+SzI7BygL/QiVUbBYX/vH1UfhMtj0GEZ+Aa4xVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScA9hDS2fA3SoUfUVJriOks8BCUFU7m/0i/nELBDS5Cqt2dnTfuJ65E06y5B5PBF58MnMHUY8CZMOQMcvjWDhHNpzMjoPVpPrfc7MrUgCKKjCPwFxzNPGjCy96e57l/rDoUeXrDXJrRoyRRLLc08COLZmOoMl/SBX9GBbBEvqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=eXojB0Yp; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="eXojB0Yp"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so15530215ad.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781448701; x=1782053501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+DoEJx5niGEYDDqKxpP9EhcqDdLdwV3n1HbmZ+qqPE=;
        b=eXojB0YpAazp8Lr3X2NiQWsAHKauMpzM70r8rE9Ltex7+1z7iwd9l1G3oFztfndHno
         pdwLw3j3Thtewk7viM+wtCHSPljLdYsP5q51NoKWileNEn94pX57kezeaAFhC3a5tIvM
         ZFz4u9bdg14UZjpjgdys0gjZnJf3h1pswY/6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781448701; x=1782053501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c+DoEJx5niGEYDDqKxpP9EhcqDdLdwV3n1HbmZ+qqPE=;
        b=ShDVqS/jX1EMAaa9cJfsbu4PqGhhUaamVu4E+QTK1SJujbtUqsxOVkXJf6d04JhUSj
         gHOIKL9tddeXo6ffRNqBOcajvW3PNmmQoN97OzohtLowBYzQKhygIRbYFjJQwukkL5zA
         +Zp+j0tYfMis42C56XMai7Jo0+Wgrvc2pXqC9mc7tNW10hkaxZlRLIaOfKK7SgF4j5m3
         CrYfQejO0SZ8nlFC0EMOX9fAV6LEF0/p7RHATxJbiF3BFNr9RlkivqSevsHoSD7aokYK
         kbR/V3ULJQ8vieQkEtHHNMo1WiLsH4ljHvmK8zSDCad13/izdhw/PSGdyV12iVaH3WB/
         AOHg==
X-Forwarded-Encrypted: i=1; AFNElJ/wYtBBfoCb4YsdC2PGKMgjtv3G211FeoiSrNdbZGCHpq6V8KQBW8Kxpd6AAGxay7hHFgbFTgUqDaue@vger.kernel.org
X-Gm-Message-State: AOJu0YyyJa2D7rQaQEj5iVm6Knq1EH32+4JJpIpsgXPZhvft51I6IG7M
	KwCz0JZgdd04LQdXNxvJAEdwGeKW6n+/Gfz5wJRvigk7YDFD5K9VuLiS1r+doURId8L4WkP6wv2
	D6C51S1elcg==
X-Gm-Gg: Acq92OH0cpDYIIDD4MeaZFP60DU2ogYZOGBJaCnZjjBCff+GnSQxy8Rnj4r7pRnt4uf
	H++pJWXAPL5v+miSwDlZO74wGmCn4WcUWQ1+ZuQKtmi+6r7c7oEvxWaGjjGW+4iewtysZ86xfob
	NLRJwpl3C5dm0VMAgii4mUpiQwzmLfFfuPPbnbaQ62Sqv5/K5mm5f/dvUyN2c7aUuSN30Ene9xe
	MMKBxUztWuHMUSZChnj14o/dEjUVJF7oV9BdDsP5g/KPM90eJ13m/+e4TOkH9sJc7tglTlueX8U
	Y4yYLu+EO6u5isQo04+QPEc/tbh3MvpfbtQXlmwLRdbHEzaPLio6XOnzokgJXp7dp8V8l0Eve0h
	Y/y8JabjXJk+8LsrH2B0uk84nOrCJ2ojUgBgP0s99SlHKlOP6713FBcUAjtu5KHlo5L3ZrILvqA
	A6DQR3x9WsiFgl9b6aJ6szfbuQ1r82isfbUP4eZJpyASK+HmNbVBbjKMYnrs4uva2jEG9nfbJHF
	6CUScYov7zqUDL9ByRWVyOOJCKi3jjfkHIZYQ8MBTEfQfq4tzmu1qlbikxJRfnKvzZNLCzvWfOW
	qB1CWoDwqw7drN6zuc7/Oxy8GI5PVwle08+F3KR1k+pQqN6AotVip6PyLxt/hw==
X-Received: by 2002:a17:903:37c7:b0:2c0:f807:9bf3 with SMTP id d9443c01a7336-2c4108f197dmr120914925ad.10.1781448700638;
        Sun, 14 Jun 2026 07:51:40 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:c800:f499:6f6c:fbd4:8f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acca5sm66746385ad.51.2026.06.14.07.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 07:51:40 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Bryan O'Donoghue" <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Daniel J Blueman <daniel@quora.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
Date: Sun, 14 Jun 2026 22:51:12 +0800
Message-ID: <20260614145113.84243-2-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614145113.84243-1-daniel@quora.org>
References: <20260614145113.84243-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
below 0x25800000 (600MB), primarily for non-pixel buffers accessed
via different Stream IDs. DMA into that range triggers unhandled SMMU
page faults that cause spontaneous device reboots. This is readily
reproduced with one or more browser tabs driving multiple concurrent
video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000)
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

This applies to all current hamoa.dtsi consumers (X1E80100/X1P42100/
X1P64100 boards); other Iris-bearing SoCs (sm8550/sm8650/sa8775p/
qcs8300) do not include hamoa.dtsi thus not affected.

Backports also require the preceding binding patch ("dt-bindings:
media: qcom,sm8550-iris: Allow IOVA reservation memory-region");
without it, dtbs_check rejects the second memory-region entry.

Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
v2:
- add Fixes tag
- clarify the reservation rationale
v1: https://lore.kernel.org/lkml/20260601041336.9497-2-daniel@quora.org/

 arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..ce96e7f8d8c1 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -716,6 +716,17 @@ smem_mem: smem@ffe00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	qup_opp_table_100mhz: opp-table-qup100mhz {
@@ -5479,7 +5490,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			interconnect-names = "cpu-cfg",
 					     "video-mem";
 
-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&iris_iova>;
 
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
-- 
2.53.0

