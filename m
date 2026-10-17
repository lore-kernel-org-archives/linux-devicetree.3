Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1553C1983
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 16:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255385; cv=none; b=FzdHVMS5hh25MnC+ZJI5cmGT5+fc9Z00pw1OAjAKyuQO6nEQJd+WRV5yLeGWX2Xgb4Td9SePPeOy+0y3m8X4k6t7XLSsrBj0CWS+/2b14IutpM9bjVIkBbg7Me2pUZSbEaH79V7lMraCmFuVEXfBPuuCwVqKiWaLB8SU5g5sVks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255385; c=relaxed/simple;
	bh=V1PrfALe+dXwVq1n5n/hITI7hGqfkZud86/hme5sr+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NauPwegHsigiYNv1X59gYiXu9z83eFIM+++T8I53Zoxkdx/8DjS7mHopaX0zzdhHPX6he6DGb5t0lAI29nXCJbyu3YOllGlMKdflFjevQ7uWl+Dk0Vp1AzoWZfSDBH0emfj3ZBfVAD4xKh0+EU+NEE5PXQqocGWEBcI1dpiv5AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z684EGJz; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z684EGJz"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso413853a91.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255383; x=1792860183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=Z684EGJzahvWTW/dApznEGhNzcZDNeGIMusam1DcH5X2irUvFOTfj07KS3NThy8NU8
         LfSIlw3tFdq4UjNCeWX5F72/LvzMk9XtazIwLlj1oWcZY7OH7fbcttABt4wjPr1idZUJ
         +lfUVDUW/d9u5iogF3S3RIbS8MeKAZPk/hwtWaENxM4CgqSBm4Zgh5W7tA5VyBwd7hoO
         1v9UnMGrY7QesfH4Xc/koXsmrT3r91RKZUIbS88qMekBHHmMczd8+RtQwC27G6G53zj8
         z8XPMyLWbxr/Z3uqkAHrCgy8pCezp2iklrRpdyUmqQ0c3T/WZSfNqtAti7NTTQuyVoff
         8/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255383; x=1792860183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=dCPANTnOoA7WkHKRRnvMYuJxROXsgmXdo/INgiLUqCxMU75paODuufxZPPmYV5rYXD
         PGVquPlnSuw/AZjt8dHM1qeQhqbQG8T2tuoaeQ70eXkxH6P0ShLIQQzchfnflVIW/3Of
         JwobuvFUfgv7wCfwhZ9sRG5N6RHOnV+KbjBA9taU0wxC6jEiCglQF0zzhZ5cWs+chZ5F
         S39M4m1HKGOjtAUOD8aEUoANnnlU+cR6H7fLf2i44PWMmshehCF40Fi+u01bvSYoyWwA
         VXyuT949wiX6g6er94yLo+zSf11bPNsWve5idtqQHddUj6ng0sbdLiD6LPRMy33Fmg9b
         /GdQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6Wmi2BUIIBZUElSy36kfhWttU+BpyIsZMW2TYIR+DfXb2yaQwqfSBxCk3hcZuMNj1CsqFsDehyAOE@vger.kernel.org
X-Gm-Message-State: AFq9FYKbE4i4CeXhO59LvmhBUqYHSc3PG3AphV3HiRAHIC6rVHMMzPwQ
	WMHE9x5IxvoaeOA43hGdDNcCVk4n7WZ05bC7tsuFbk/V1HSQdvmJHPix
X-Gm-Gg: AYBFou2VFIeHux2yjt/AIsPV90T1esFRukuBkm8R3F0Xk1O1GiXKY4pl506yb0uH+88
	Vh/cOlHMT8RYlZ5XVq4eajU5QJVTfEMI4Pwm5nmYiB99/5NtLy7W/q/nXWf32ETCAMpyA1SeQM5
	0DjdsEcKN1KxvSLGDtYL/iEI8/n+M6d5nuWMC05BoYEZcDfJaBy12jWLUD9IZYZnvhcqx2WyqTF
	yvl58RkN24t8n6nOEGZbw/bVrMUcxsVXyvToiCqbfnSXwv7gHJXhKAnsRzyPVJTBTNDok+hWahI
	a/ot5OITfTOuuYU72VoNUWQUZAJL9BdM9g6eEeu+nCm+x0S9QLCqOGKZQXXKLIOFk/FuuGzbu13
	IHzThTHOFl3JtaQSLpnRKTEPiUtfM3ZrcCm9BtoksiaCw6CltqvuuMXZplYauFfSj8FADlbztt2
	Ml7J0qSTYgtx5WJja56COFtedgLTXQAPHus/uHo0W+YwmpzmUNVs+xWd7tjM+4yQ==
X-Received: by 2002:a17:90b:582d:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3acef1455edmr2772023a91.32.1792255383602;
        Sat, 17 Oct 2026 09:43:03 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:43:02 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 17 Oct 2026 23:41:26 +0700
Subject: [PATCH 4/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-psci-fix-v1-4-dedae27e4a31@gmail.com>
References: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
In-Reply-To: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
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

