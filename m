Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662126;
	b=uu5svvu0F7ZhqPCWUXIo3euY+6uwuFSVMZQ7Nkjb8yOiW1toQ56c6cRr7y5FYi+wYg74
	 0lB9g1maflbYgTs3FypFHgsEjSzwlZTbtmct5Z/E3YPLHWWmD6/aCfDZkrxTqJWYtQXv+
	 qnWlvjmahvbYuu4WqQC6C9/NBioFtDfaFl2MYFnFBXI9Pgd0bbY7YE9qui2w5+76ze3k5
	 0gUGK8BqgQd1pd4CrS1CR3TTskK5fPwkrnXO+Ec2uxio7PhWhtcXc1KafZeNhWY4nP2bn
	 2up/NCmdIJU22T33wWrabno8ki+DdkX2aKgprM1h98wF4Ky/roreMCX2IMsG3X/ex9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2nt4hBSHpClOgv3HgtYgoEhMhOYNcFrEBCSUvXNxseY=;
	b=mNFYovXpGHq0hvaw2qhkEyYX6jsuYeUtRZAByQDNjoFENHksKUHVYJIT4ZBE2as7U6FH
	 KN6dnnj2J1xlTEgOKMT4Wm67fs67wgnDznrvK32X0NxmFHGtXxqooUEGoRE9JlOgtX7rU
	 LJVMPZQELFnE+xy4jZbyM/708E+fPhAMAjSAQQhEZInlIonpjMjmDqj9G8vlgukryYuTW
	 jb+StrIGoOlpqbcVkFu8FKGgQU8lG2QTSFIa/bqRhke7QWwD8P0usEcpOC/pHpWJaiXEo
	 IUoA7x3Msazxj1KH1AQYAnkO7E+V/mz2ShNbdPOQp7Bv4s1UR1jal/J743Sl4YUu6SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXN5FGnH;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B89606A322
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B89606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXN5FGnH
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e608cd460eso10043145ad.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662125; x=1793266925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2nt4hBSHpClOgv3HgtYgoEhMhOYNcFrEBCSUvXNxseY=;
        b=jXN5FGnHRwP+5OJ7cTrRlZff4KAtHfziQlUnTWwd2J3/DzoQH338aRE6AVC3TtWQWS
         4sfhzUWpvN1/untLl6zPcQtwXvrsxdWrdvTw6mYDfYze6ooDK/U5SZ1xP2IRydnaKq8/
         rvrRb5SpwO3oRrLu7b1TWN9h9qbwpLk/5P216h0QTRr5ck0lTWB0SsNUdp8FHX6AGy/1
         Q+WJAEfhDkpylmSvx58DfEd05xu0nrLLEIFpJu2JKt2RVo5zQv5fxLR//YUlgHSJbLxR
         X6YhLYWNCxb/Pf19khjJrMBq01joJ8baqg6WiDNGbtA70nJMj4mKVSFFpjb0j4amgUyd
         n+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662125; x=1793266925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nt4hBSHpClOgv3HgtYgoEhMhOYNcFrEBCSUvXNxseY=;
        b=lvWrISwPr2+bgsL1nxlkJBJFOzQLd9DWpFlQh/KDjSTQWfw9ebFFRgl25HLqD4+INU
         LFdPi0AWfmEOYXg3JZ8nY3kh4YEQr7icDn0pR2GXwd89mHLKCGItfqSkrMYbpBa7DxaC
         AQYXE9t7UKfq0t7c034uuxZsnZI8t8yUVNsSZ6qobr2ei9j1ByA/ILvF7xM1UntNdyCK
         QoV6IdfCAZTxODDCsfhY7t59Ym1d7SeRp1k/FTBNJcpDcaT/xydBwLQGbFI5oPpEOtbg
         IiZhQZQaRsqmcAcnB9jjPQvGDtD/oEydKS8z8YVAQIA/tHAtsmY0BkDsWZMkNbt8TI9A
         P2+A==
X-Forwarded-Encrypted: i=1; AKwUvBwKvEXJh8ZBGOi9X9A6dhcRU0Jwp4GF0PdU6R4YL7HIMvifYdYxhyGr6FP7bGUwbZ7tXz/v8HIF+Vdu@vger.kernel.org
X-Gm-Message-State: AFq9FYJcgSZ34a5ZXCqxqvYo6VXZ4Dv0/abvqa7fXKGyMHCTJuJdDgsA
	CM1700dJyuZoB8MGfYwEfQUR2W190p9ceOeFNHZpYOOUZ7puQYXLPL+g
X-Gm-Gg: AYBFou1ju/hfaF2TIpm11i/CgcRVWTXKVLXv391kYdffp346ckPCZi3j2WiaBfmbCRV
	LryZIXlEPF+/PlVYuaFn7+wIst7fewbEyiZD+NQY+TKJ+N2xs2GX4R2kHCU+O1hUas0ilVIErBP
	Y8owzxDTKiRbErTMW+7q3bnM5z6pmM8DBQp4tXPBPpG3nQdMcGq0AeEpoF1p1glKhVUFyWsVoMT
	UukD5YqEWGfc3PqtrHnM0LVhYD6EKL7HcKkZB5tgy5Y3xWUvxL7Qe0dChkPYkwNq5FTFx22WeG9
	T0XV7tx1DJ0uzjMWH2y7I2zrzuOtP/qx6xri6RFnJx22PdNnXFqZvbsCqdN0DfzFKOlNAmMCcYN
	AiQ5TRE8BmoY9de8nrUqGz2JnPAKm31t1UmITSHQfQ7anl+IOikwo2SJpTapM6EKsYMcSh4ruJ1
	PmrwNV/4+3zb/D/jFLb7iKTbk7teI1y0Bg2zp6G23hFoO0DxnD94MowBIkP2FAKms/rMLusBu/e
	yo1C52KyqijHAQBNOeXt2m9NT17xGPDG7N8ybN8+oiJB9J2
X-Received: by 2002:a17:902:e892:b0:2df:b250:ad9a with SMTP id d9443c01a7336-2ea43cc2bdcmr36258875ad.48.1792662125463;
        Thu, 22 Oct 2026 02:42:05 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:42:05 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:13 +0000
Subject: [PATCH v3 4/4] arm64: dts: qcom: Skip suspend mode switch on
 MSM8917 and MSM8937
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-psci-fix-v3-4-9ce2133c5659@gmail.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

The PSCI firmware on Qualcomm MSM8917 and MSM8937 reports to support
OS-initiated suspend mode but rejects call to PSCI_SET_SUSPEND_MODE with
NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and
probe of psci-cpuidle-domain is aborted:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

Skip the mode switch on these platforms and continue with the topology
that was already built.

This is expected to be safe since it matches the downstream kernel
behavior, which manages the cluster power level in addition to the CPU
power level, just like Linux does when OSI is supported.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index 06f7e7f57c..7730977e6e 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -182,6 +182,7 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		skip-suspend-mode-switch;
 
 		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index 7de6447de4..a66a544f30 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -311,6 +311,7 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		skip-suspend-mode-switch;
 	};
 
 	rpm: remoteproc {

-- 
2.56.0

