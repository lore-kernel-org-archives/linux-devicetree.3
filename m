Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3D441D4F7
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 04:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297838; cv=none; b=FUZ5FW56i21+oRp1P/pwWS5z+DeleMXg3+uEFsGNKjriZlzsn8+SqgW0j3vQ171IOtVbo2OtFZml2662HdqYWIyOxP32DJjknPtd+amlB8Fk+oQKVetVZQGnIs09oCSlK60U7WncgAxMXEChu0tNU2wSnvNXARQ1eI11Xgw8iyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297838; c=relaxed/simple;
	bh=BGOJLVXVccbwwnFWY84JCzL1yNcyYfyrD1jQgZCkXjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RRTeAP0U+CCiwThheKgtqlQ0dBWhJ/rCG0cVnNFO5P9R/n8bwI5wR+hQU+IK44pS0RUobeL4EAQ4922PD2a8TEvMbP3LQiGqZVCqGYtO2WYa0qfXqGtX23vDOuIA19Vx7uDaahM1S6mzQmRxdMTSzblu8MyZx9ilkpAjcx31nvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCMbhNkG; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCMbhNkG"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso743954a91.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 21:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297831; x=1792902631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=;
        b=gCMbhNkGSsOdH9aYXpH/1IxtdqUaBox/YbQOaKqvTAHpI/tXkOTYO7fEBH31xyAxBJ
         RbjWs+ZovgL3sNqTm5dka6YGtCPRbBjPa19FurcZEk5jkDgmzypapmyu/jPrSk9XQH2X
         PeDR8/fgA/BWBOR5z9i9ZC/h8sqNIM3Q0iccFvHIuFPaSTqjfPt/jVb+7mWayaFN8sJQ
         7ggHKmlNR5cTnKJthFPMBx0kSkJ984JJ/11nlX+sp39KF3/ob9HKhYyNVIhx0iMx7g30
         2AkFUGrp/P1PlIKpxnsjUhZd3RF/nkuIAfqjaMh/7rKedTcD7RQF0kZeoz0or9UislhQ
         RE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297831; x=1792902631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=;
        b=iAWZbxbG7BgUr5JrHeeaDsI3sAeSZv0mCa3wijGME8H8nlGaQrdNIOp5rDA+4aoBPj
         bTxPNnpWHlSRbUYP26d+nFAr369ZOIn8ABOI8bojw+E1/gsiNQmRvd8Zx0PwDSXLG8tJ
         QzABkwdr131dl6sDMkbDGfkPeODnAqk5tJYtchHiHnm5vnN/1gdzHhsbhIbdUJ6SwCp3
         jUJ8xX2bDLXaKGURxcTd+apkII/g7CKfBbaCv5Tk/UEKBrdK3qTDogjh3OnuAuyQlthl
         5mtmAKiav3ur5GelOY2ydf4s5rnMxeLtvWONijJZ+8KXRE/CvBDVxvEoMgfCSgyBgLMT
         t7Rw==
X-Forwarded-Encrypted: i=1; AKwUvBxbpl/KYbD6GFFpk5LLSSSruIlo7wpA2WW/aPCHguVIZEcfUaYDhV3Oj9ES9lgi2idGlF15+MW2WW9q@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ3UPfcqy0j7qmnbx50XW+B0FTlcHk3qQ5ml17E82yl0x8qFc4
	HJAPdXzwGusUYknHp08P32MlzR5IXcdnqft/IxGNkIP/Rm74cab8ktqs
X-Gm-Gg: AYBFou0IkkKHzu6l/Ha/URt7APA5Yq3nXn+wkQfYz5nplonJwMsPi9MC05fWOXP7FPc
	mDHZmCoso2++5F9G0p3SRpKRI3pwtgOINT76lo+D9Ato3K/hpTftlGdZTqM95Zb6TVlKE+ekqmv
	s4HzrhwBtPDs53lMaVS5/PEy1JFPBxGISSlkSTkoVWYWeGdS/EOurIXgGdUSTSU1Gb52lROWvaA
	wb1Vr2O0W3iogS1kfvBJZmG+8KoAfdeiYDYF8yVb0wuSWtukSg0CUwCxZtxbIhiJnBBRZn9jx4h
	x95Jtc2l+0mPbkst5p1i2MfllX3uQgFzjpD/Vkm/gbxbp9spVDBr9v1FE6FdQ7S7+IPUkbBG/zy
	tcVgZWMIOvZ8UrxrgiRLuDVutynVIBKFhrwbm4oQVQa2D4WAL56owkUfmunzRJ8dUJWOgzpA/+E
	zMWFKD9Ig9kdXsZzlgH4xIRBUDhemW7AIJpnWJ29feIzr4WGYIEi8aUHKkbvD8TLw=
X-Received: by 2002:a17:90b:5870:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3aceefc0547mr3380131a91.13.1792297830714;
        Sat, 17 Oct 2026 21:30:30 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:30:30 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sun, 18 Oct 2026 04:29:23 +0000
Subject: [PATCH v2 3/4] arm64: dts: qcom: Skip suspend mode switch on
 MSM8917 and MSM8937
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-psci-fix-v2-3-35f65b59eb9a@gmail.com>
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

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a63..f0771187d0 100644
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
2.55.0

