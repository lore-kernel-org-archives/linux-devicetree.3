Received: from mail-wm2-f1.google.com (mail-wm2-f1.google.com [74.125.225.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7453F463B9B
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786549222; cv=none; b=ewc3NSd8s4FXxmd7PZYRoX960g2Eka5SPKWbqEeIzKOVWbqgq2JVz5Kxor3MJR3wUg9cmB1mxppekayGlGm7VqZI0CJ0ddu4XEcYD/FgpYvc1Lf1nsfAfG1iCP8sMZsBgh/xHmyeEL0OGHndTkeGvEwgjWVk9wt8znCvdjZ2/zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786549222; c=relaxed/simple;
	bh=26UWdpaQDzgnBTtxHw4Cp6AynYdIEUwCzz6rHSHePsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gSLDGPFiSDcZoIETQaydEiHf8kaBpc4jbDSBKvZcTdPdRrXlC41dqTUBsbEZDU1M5KmvCa3cdBjO6iecRxKVfERHuHPzxZn2swN0TeRxvz+uRZu6VPGkJoWUzZXsgCS3yAUmGSKjl6eQI1OtEMZGSZj6dNEV5A2Sdfezxh9dBt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com; spf=pass smtp.mailfrom=ferrisoft.com; dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b=Ocgb9iKF; arc=none smtp.client-ip=74.125.225.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b="Ocgb9iKF"
Received: by mail-wm2-f1.google.com with SMTP id 5b1f17b1804b1-492367f3094so4316365e9.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferrisoft-com.20251104.gappssmtp.com; s=20251104; t=1786549217; x=1787154017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QbLyQ0GmRGBKkuWyBUwDxJtHBvWoKJlB6ZFlIuJiUYY=;
        b=Ocgb9iKFmD8e5BThUWh5Plr3stK6EIYGFourjDEUPuLuVoyv7VbOioP5lqoeV7OuxR
         e3kMlVui4n5BzV8fI57aSmTYcXrjBw5dAiabcJHQ76apTNtdZvM3EfUoOyucKyynG+ZM
         ygjwqJ8DtfnAiXZJhVPbFE4AamAaZwlRFrTLkecPc//UXFtUbQY0Hs0Nk6UgtziJOIso
         6DceMsfIHj1eK/bZ9+PgDW21FV5nEbkXI6nZ8C7EVQt2dQB2j4mciHBvmVpLDOZ9h9B6
         QsG6yrFmpdnx9UndH4KQ7gcNcSkuBWn6aopWf24p9NqJx+CH84zY83dsp3EaY3wJOGnT
         9NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786549217; x=1787154017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbLyQ0GmRGBKkuWyBUwDxJtHBvWoKJlB6ZFlIuJiUYY=;
        b=SwbdXPfPTNZm0KoHHh3b+AqOxLRwRLmUr0L3na5m0qkT842iTm2hBFJftv+Fy+AMf8
         d4H1PjTMsQSmjPljzq1TzPInS1wuaL1lWqIgmYONZ2e3UPv57+Fzsnjlqa1IoeM3fj74
         fUjvzahDXgQvG0yL+dwITQHgRj1kqYBiAOg6LG7JiknkECCUTMk+n5g2gJudkHBJFNWT
         iCnUij1fG2vrqNLJ1r/qqQk4g1HRMXCfWfw2pSpySYAeMD4b+1pzUR0EixAcuMdFYrw6
         XOMP+eKt9RpjA27q0o0auv2rPbK0/lOnGJwPoBR1ZHIC8oThYYkTIpNINeFkJhfKS0Z8
         uTZw==
X-Forwarded-Encrypted: i=1; AHgh+RqjuSWyAfLTZeP2NnSDpTNZEE2iXIbO9d2MtrFhWPjhNUPz+wQaVuUfEgWirR2U+LOBxiQQmNcPYnRy@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx5z4eGriS9K5Pw27MSBV0PTo3IaaYnGpJUJb2HPb2F1W2ayuG
	1pDR4eopWh7sX8QwjYzzPwEaSwGw6/jPdJ4PkGfuKS7A0cvTDjFSfB+V57u8+MBlfGS/
X-Gm-Gg: AR+sD111eLkHsJc51zXV8+U86TGHenYx97rsue+AOXBU/uFNebkrWWzgumJIPdbdcFm
	Zs9LJP9VYJNVnKI4u/8CFdFzcpqyFQy9I7d/Rq5oiLlV7QcG4vj4+g++0tqHY0ZHjOdKtxvdpgt
	8G8uMsGI3NQZA3EjrjxC9zjSt2yYg+ywfWysthTEUgLAAoqUzY+W0OopYgS8Cc0nFWj+Dl+t2wh
	N0YalGSOdGdze6n+TVBp4CbxMYiW5RCVlnNfyuo0REk7dTEmPTWQWbIKRItbTcHT5/O1frESBfP
	+oFvYERFzvTg/oPRfWl0FMJ5HAtuuuPnOryPVec6TSVs5j3FhS9CCIb4BMSO7Ee/6rnisH6UY/6
	By0fCTDtsypcZhqLhMWu53pEbWJOo/EBMF5AuoFiZc7Y6hyQ0WGhmbEmAMEy26WXSuM+1/ubdD+
	Mi8iib0qHjoUb/lvfn3kl0huKiRC+n/Fg7QFmxmK1Bg99T1n5kXKtVNo4mS6MrRJ/cPAOK+tWb8
	EpsIIDudrZyQOdo
X-Received: by 2002:a05:600c:8012:b0:493:cc25:85cb with SMTP id 5b1f17b1804b1-4997c12747bmr83471045e9.8.1786549217031;
        Wed, 12 Aug 2026 08:40:17 -0700 (PDT)
Received: from zenbook (45-11-61-69.ip4.greenlan.pl. [45.11.61.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c93b362sm23296255e9.3.2026.08.12.08.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:40:16 -0700 (PDT)
From: Greg Ociepka <greg@ferrisoft.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: glymur: Mark USB controllers dma-coherent
Date: Wed, 12 Aug 2026 17:40:14 +0200
Message-ID: <20260812154014.123315-1-greg@ferrisoft.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All five USB controller nodes on Glymur (usb_0, usb_1, usb_2, usb_hs,
usb_mp) are missing the dma-coherent property, which Hamoa carries on
all of its USB controllers. Krishna Kurapati confirmed the Glymur USB
controllers are dma-coherent [1].

Without the property the kernel treats USB DMA buffers as non-coherent
and performs cache maintenance on every transfer, which coherent
hardware makes redundant.

Follow-up to the clock/power/bandwidth votes patch [2], kept separate
so the already-reviewed patch stands as is.

Tested on an Asus Zenbook A16 (UX3607OA): all controllers enumerate
their devices as before and a 64 MiB write plus two O_DIRECT
read-backs over USB mass storage produce identical checksums.

[1] https://lore.kernel.org/linux-arm-msm/f92cc91e-6e5c-4375-aaa6-f079a165f4b5@oss.qualcomm.com/
[2] https://lore.kernel.org/linux-arm-msm/20260812083522.774711-1-greg@ferrisoft.com/

Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Signed-off-by: Greg Ociepka <greg@ferrisoft.com>
Assisted-by: Claude:fable-5
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4605,6 +4605,8 @@
 			usb-role-switch;
 			wakeup-source;
 
+			dma-coherent;
+
 			status = "disabled";
 
 			ports {
@@ -4681,6 +4683,8 @@
 			usb-role-switch;
 			wakeup-source;
 
+			dma-coherent;
+
 			status = "disabled";
 
 			ports {
@@ -4757,6 +4761,8 @@
 			usb-role-switch;
 			wakeup-source;
 
+			dma-coherent;
+
 			status = "disabled";
 
 			ports {
@@ -4847,6 +4853,8 @@
 			usb-role-switch;
 			wakeup-source;
 
+			dma-coherent;
+
 			status = "disabled";
 		};
 
@@ -4919,6 +4927,8 @@
 			dr_mode = "host";
 			wakeup-source;
 
+			dma-coherent;
+
 			status = "disabled";
 		};
 

-- 
2.50.1
