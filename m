Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DB141D23C
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 04:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297844; cv=none; b=CmZNUbmpN4OX/C0oD4Cw+xvLbjyvNya2j0r5LMTOS2CAxHfo59trI+YpqMPdnWt8YRDL22oPv0e+UM+wLPcN8lbl8t0+L/98ftTTV4bRO0iMK1Pp8flAEyr1n9R1VlhUCSu4UVYo+Krzeeota2kwuItmbbQM+pQzr3uHY+m/L0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297844; c=relaxed/simple;
	bh=V1PrfALe+dXwVq1n5n/hITI7hGqfkZud86/hme5sr+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eSMh0yupgWx+GNs7lgeqX2oyKE32KpkLOQqVk15tsh+Eh5bwck8ap8BFTz1AcJRf1NkzCHo8XC/jhbCoq1F2aYhaFvvlTXyaLnwwsRW5xx3fFwkpIt2mHt6NuUnBYa1nBL5QTXybV8Q5DF1V9qEABVC/A42Bps/B02XKnOyPpY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiDHFkgK; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiDHFkgK"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso506639a91.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 21:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297839; x=1792902639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=AiDHFkgKgTtqrGV/pACAL8QeR3YGPRzDSBXywJIF6f9wfJDwzDVmmEddWI7PaShnbd
         FJfNZegkH5+dPNJ0D8nk1v3ZdwFxch0q52MQT7/hYQzyhKQq8jtd82zlF4CXxVfXvKWx
         wn/g2h7k6n3MM0gnrZfZZdFggOZ11slw9R33iORWeRbQ0My5xTBsVB5ECIduL/NyMhdy
         1Q00tCIjUUfK0Ay+r5X2L0USJGGMG8XD3vngyUm5DXHkKDsKws6P0oH64zx+5+w06cMz
         DmRGB3zUPzZZUFx2DwV8xDpbIr9dTUFzO6V6bKQfAJb7I8814WTsxNtOT2k/98ojtfz7
         zWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297839; x=1792902639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=inbLxmAKAZqoGvMd+ndoC4ozvP7Ce+fnsFIDYCvIqAUT+e1AE60++EBPuSNwRv7Lq4
         OT400xVmT3yyhZOTmzn8kWWspJSLAS2vMWdoVWrr2yiGCKdk+fJvFTypbfXAyU2bToxn
         j0NlDN74xxJsqB6sS1OkEwB0pUh2mC7dkuOihE5hcT5g5Ak+Nq58oSrJWFBD3cB2x1lY
         Mgt+8SbwBaYJWfcLpLFTr/iR1t/1GwcSgWr4c3FB59qxLfZxO87QIboVMHjXOrjroqH6
         e+y6r94ayyqfQ4skxo5tbuDVf4l9CuClfhPG3D0AdmkSDWCxTH/NiY/xk6AFnsED9F9m
         DeqA==
X-Forwarded-Encrypted: i=1; AKwUvBzBxX09uK2JOpgJ8ZMR0oi21EjIfjOaQNoii3fsJ9zevtPCx9fDFHDmPnWzhh+d+kXquk5Nd1ebTMx1@vger.kernel.org
X-Gm-Message-State: AFq9FYJN8ycSr2zu9sDAoRPbx+hcUc2ONnMEKGZ/hrqlSkNoeXkN5LmO
	bXmpuJu6vuO7y95Tk41iCgmBST6cqLWJMUmrazKJUI4073keJYc3V0ar
X-Gm-Gg: AYBFou1A+c1WEAFWSOxyvyHMTFsofhDdWpyM/Cs8iwyH4ApJ+TXVZuWlSaDO49rzc2Q
	3nX1lQCjoVv7UeOO+7PsQFCeyAH4vtJUyWTZ8pInZR0Pv7a2Vjqq7JDyVwE2FFRRMqAcDFimgwp
	jrOB52zEgW3hksBdr8SueRhNk6+/m9aWw7R3ldFE+uX3rHrinD6RGP8Xde4S/31L2U6eMJ3v95N
	XykFSN4APUIXBMX7HbP6A7IwOkCriJpt0THewmZ97qJXXlSFe6PE61g+EBBRVYf+Qlw64XBDHm0
	PWOvlT1p9CId6GM+KCS8XIx//V9havZkwEA8D8CZBzILC0eSwC5/27j+quN/lV5e8bkOFVcPOj7
	MwNdVbxUokh3hqKqzHB10F7lgtwC4YFQl33L4xLxzc773CZqjD+lIzeOOMQzuiiwLAcSAQIwz9G
	l27WWTi+vxJ+0+48B/VuSNMkKKBxIdhcxpwhN6y/3LEvgMSZK5A0rtAjfTzR0Gv70=
X-Received: by 2002:a17:90b:380b:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3acef14451fmr3843389a91.24.1792297839161;
        Sat, 17 Oct 2026 21:30:39 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:30:38 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sun, 18 Oct 2026 04:29:24 +0000
Subject: [PATCH v2 4/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-psci-fix-v2-4-35f65b59eb9a@gmail.com>
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
In-Reply-To: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
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
index f0771187d0..7730977e6e 100644
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
2.55.0

