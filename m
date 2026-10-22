Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662119;
	b=1w/HskqeFWbz0DVR0qmeso8b79xmwT7I/lFrsPYXWKi1u4f2qewAgTrKKsoCSi22WBNi
	 KeZKOamXtoBT00bW169ufhKZuSg+N2nobdNEWVAMmMtJMl39am97lIswEP997VFzdMQ4z
	 U98XE8thxt+E4+5p/sa3MQ5UGDCMEml+5yF8PzXRSJLaP2mrJ3rXQGzpvnT0ZIRldPCSX
	 y0Y5kw27FeX+8Zr5cmqaFXYtOwLbrI7oiVMUdKAGKvDLQr4X2gNRPBIuvjOuM3T0z6m5E
	 UDKyYkx8X8AGtc5oWP70tArJ4OlFB080tp2DKxJV2e4sXbFRM+u7kdfCI+iQ/o49hOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3coeDBrZk8u/krbuiegVJJLUnKMcE1BvLH+6X7PiidU=;
	b=roVvXHPLVFv7ffpQNHM+P4dhNoWMIqguNAw7le9Zs8J2866DsZp5h+1oP9s3Cy57Qwfa
	 T1b55Reor3SMQnmmWHn7q/eqYRaznCtnHfQuDf9h2PzMU+Gssx9pUiVB5Vp/jk3CL08F2
	 l3661ZHqX+62F7bCTM8lS9ocb9QKiJPJsoJ8cQA/J8XmCf0L7WlD0HHzETjR+7QgdU3SU
	 oaZ67exx1zNcWs6682aJfxijMs9Xeu7VQErlWQZxDHe34IR9kydAGtx6jyQLGUmbFtU1F
	 oV9EzY7vtc915RyPc7PI30b1VNtPCCvMIw+wJJKk5sH4Ep3IYpqhm+6lH0UsquooVoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LIJPXttu;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CC360A2614
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78CC360A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LIJPXttu
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2dd76b1361dso10960385ad.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662118; x=1793266918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3coeDBrZk8u/krbuiegVJJLUnKMcE1BvLH+6X7PiidU=;
        b=LIJPXttuRUF3aI6VA/GbBvwU/mjQ6tXV3YypQwF+4GRv43301OmIvWAXHrJhFZjeFq
         Vad00cxPu09jBuojeK00Yd8iprJpKIyvwgZLjHrGgqDIxdWFs0Hence8H7TTlUpSX5Oe
         4gWrGNreVcrl56t6kWRkHrgPI3wjH2evjhvDPGfucj48lHepJS39H816/MwkrhPipp8T
         nvAk9NYjyy6CsTD+c0dj0OFIPTRLOXOHmnnmZVPbaSynfhi66ky8kk0inu6PH3mYspIC
         hTF08O9LNCE5EZYsbSPEWGqOVdKGOo+LxlQPaPMBhw4rZ9eqZHIIn2hjmDTZe6Svs0tl
         /1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662118; x=1793266918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3coeDBrZk8u/krbuiegVJJLUnKMcE1BvLH+6X7PiidU=;
        b=KKb58W8U3bpuJRijxKq+rHFCicYiLd0bageUCHy6K9TXm4w7eBLK5x8B++5ARZBJuS
         QvP3xfGqiHxZSq6gCeQ4MLbD3N0ZlvEp7MGbqwVumMTbrGPmE6vS+fNb8tfimpAXcIhz
         TJhaRzNZ77LToZ98qWP4gnQDqxQp2dtYX6OWgP5ajmghG9x/lSj6dSl9Nru0EfmxDrN5
         +053lrIzVECLlmIY5Ucy9xjGIeuyFJv9TAoA8E+AIGbLHdxtPbsADNSxcWrHSWdVGgCU
         38Q/zRDKDgkMB+HK3czq4a/PCalqtkjC5DZF+ARnM/kqR7y/eKzx6fS1d8LSfvTfphbP
         1Egg==
X-Forwarded-Encrypted: i=1; AKwUvBzOc05LQj9j98mUa6Mcq4kBrSksnHbJG3sdB/81rjJrcjqzq7LhwcH1QNmi+lUuXGM7A+vh09W5VZZl@vger.kernel.org
X-Gm-Message-State: AFq9FYL5LPdRPvRuDJTrlCTuGKbw89ofB9meXycASeyvjyqUIQnRTzvu
	H0tKMrQCgRWMhtE5i9ZB3I4OAGPTkmzLyIe827WfDNHDuSTA8ZQ1CxS0
X-Gm-Gg: AYBFou3+eXasryhxVnhOWZ9izben00RS7vR1KwdHRIIsYmr8cyxUSFDsqgRaGV3Jafw
	dI/lqkbZt7e/IcDZOnbabMpwn+okJSKgFg1hLQrFZGchUpeBn4ty70as5VI9ovym0vbxArdwh+m
	RRawqpW93V/mAG89oeaD0bituzyTAbIcbFA2TQfP+TkYll6EkbnTYF7mNrR0MzF3MvGsxb61Tfh
	TvTK5zlMpVZSthtCMSb5Kh7W4J4OEzeb+opF260H6I9mnfjgfpF5lA+pRKhq1PKmsu8LZ9aJa53
	vn6HaEQOtKzVfrJYib8LyfoWX9O7NTSBqHu4J5uiY23yyrpGqQP1SV86G/uw4tskNvCE/qWIb7k
	5aTx4A/Ps5njU4ghEM6KuetJt73zKXMg3pKEFtmpJx/dt7B+DePFAciUG3YxJHVHopayoLGyZyG
	xjs4MJEvQihUSTeZBMc61Y7wun8BL83zeUNZRNt892ZmuwcSTPxfqOGgV6VKFRBTQ48i7WMBvmj
	YAlucVFWZLeSkmzt2PJvgzcvXCKOJtbztoHZ640U4DtzVzT
X-Received: by 2002:a17:902:f683:b0:2e9:5c55:c46a with SMTP id d9443c01a7336-2ea4396c346mr37258705ad.7.1792662117740;
        Thu, 22 Oct 2026 02:41:57 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:57 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:12 +0000
Subject: [PATCH v3 3/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
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
Message-Id: <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

MSM8917 is a single cluster SoC, so powering down the cluster means
powering down the whole system. This causes two problems:

1. The system becomes unresponsive, even to common interrupts. Waking it
   requires an interrupt from the MPM (MSM Power Manager) or scheduling
   the MPM to wake the system later. Linux currently has no way of doing
   the latter, so the cluster may never resume operation.

2. Entering power collapse blanks the screen. When the state is entered
   and exited repeatedly, this shows up as visible flicker.

Even if MPM scheduling were implemented, the second problem would remain
and it wouldn't fix the system being unresponsive at idle.

Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
is less aggressive and can wake up from conventional interrupt sources.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a63..06f7e7f57c 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -112,10 +112,10 @@ core3 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x41000053>;
-				entry-latency-us = <700>;
-				exit-latency-us = <1000>;
-				min-residency-us = <6500>;
+				arm,psci-suspend-param = <0x41000043>;
+				entry-latency-us = <240>;
+				exit-latency-us = <280>;
+				min-residency-us = <806>;
 			};
 		};
 

-- 
2.56.0

