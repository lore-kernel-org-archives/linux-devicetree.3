Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ABC37754E
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 11:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779623838; cv=none; b=ZYEoYjmvcQbMmbdG+pFBoh0U7lKXoeoYnoxpKZjlG9DIEFVrq2nfT19gqu/R7oD3IwnkPwUUDKvDR/wYEALYFQP+/CsxwrHe+74vckq9dqoH47TbjpzTLH0XG4w9guR2TVTB4oYOkSSX+WjR/3vLVNpZMHSwtJDUSAWBk4Hge4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779623838; c=relaxed/simple;
	bh=622IsWjqu/Dv33iBQgEoGfptos4IBuvIhRAx8KjaNjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fRxRTpJDkHmQV6l1O3WEfpMWqZOBqoZfih6CrP+lemwkAE/ZBcQk/+4tj0EvyclH+JKQ/YD7aF4ubQ70ikrqKf8bgsL9nR6+rNr8kywxNi9lsVhzhfN9dTzrRvpeAzPIVDc5A2z3x1D8u1YPp6V54/OiJV8FNjr6HSORAMH4v/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=IM4l3UB9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="IM4l3UB9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-83659d38e38so3513683b3a.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 04:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1779623837; x=1780228637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1YJd465RK3GhQ1QFKpfJRaoQk4hxKax7K4+5xuIARHU=;
        b=IM4l3UB9tIYLTRx2odzLJn+yVQamTk8XEA8GH8MceNtOEVp85vhQU46mXlvVggca1S
         aSmlg/aKLhOm4654PrYCgJlZujIbMKypOfXf+xMtsGqqPbR7eu97QQU+RfzogV3fCd9F
         M2JusarBMc3Ijbp0+yWXdEK6pDMmchv6goxWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779623837; x=1780228637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YJd465RK3GhQ1QFKpfJRaoQk4hxKax7K4+5xuIARHU=;
        b=dBaE2ZMF19yrud6eL4rfxe5Nmpv0d+Iomg997o2YZgcdrm++lkMyMOeu22Dft30ouz
         2DQLxgVqoCWnUQyzRZuL7tLWqDnomtfptyjZDvo8L5qFlmhWRSOBz9koXeBLWaVPFUby
         7OQFlCrQKihAehEmQloS593OWV06H3YE8OQ26RvbMzuVQUOFmZ8dPr5/DWar1hQ4bqH5
         I5r74OFqxxRCPqysoGsRWY0qoLStGdbuq6EljrCAp22BR1ODIuBC7jp4h36eNayzJ2Hn
         v2jUAD/AozsSzm40bHcSF9/ZRNod69z6SKa57CtgRiXx0kSyYclNtQhbc49rCTujZWah
         8rxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gvLOr3Vk7LSdNXR6kWDjA1X+7S2O2eJvZIoc7UlCXxyCQF9rCFkxfio/zKsPys3WndfC/t1uymcWN@vger.kernel.org
X-Gm-Message-State: AOJu0YyMBgBI6MCI/YNI2I2q+6++gINl4nYQJkuL9mNOqthDCEufV1y2
	qvI93soQHpfiQNqNpC+ZbiiiAcvc5zsm48VV7tx1VqX0sj0U6mi25NXjvYb8NBm+qiY=
X-Gm-Gg: Acq92OHeO//UizzT99bI8R79scU4qV0oezU+e5pEYLOxYDFWunxIvVv5vpt+TAVvOSJ
	Zhum9BbXHLvNHAbvEmVTvNj99YgNw88xRM+r0WUMOL1ihKA/WLMIG7QQnNJcjcEQAHFuDEMaR2C
	aNx95JG9a1ucdTTEWWSLt1d2K3gG6L4jPitdEFeCmCiUH7UjcVo6ZvAzZa+cqweT+tn1MUFiaJW
	rm5ToIZtFdYKyxEKBQT/Vcxiit4ti9Pvoau2Q1H+cnGY51m8nVhG8BzU1h2jJNLprv6JXYYni+k
	MT5IHql0GYAKDIPRzpl6cHh2PFykqUfrwiPIecvX2EgXj3KQf/nc2gNEdRN0jj9bAs3EAP9OtYM
	fGI7moTVH90/tk1WluWzsBx8nJODUOlOtkObH4x+So9YzklwMNCQhRR5LA87PSoPeSKdnkPhYhu
	5Zce716OZviHzn2X8li87oPXQE0VkeDH0pA7CweHg+COklMfXLWZLSjdCLWT+oZkiLPGcQjF+ZD
	RTpR73CObYFOygO6NKmlDAxO9wcd9Wxl6SqTfCa9szQevvvjRzcOvxljdkUI8Re1KG/9xX2Vcv1
	S1hhm4BVPdfw6fcY71lHjziRHnVTadqQOnfPtl/CEYiyKKcnMYl/a0yUXep6B9uSyzRykjfl5VA
	=
X-Received: by 2002:a05:6a00:ab85:b0:83a:7565:3505 with SMTP id d2e1a72fcca58-8415f1dc87emr10131980b3a.8.1779623836798;
        Sun, 24 May 2026 04:57:16 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:6402:d84a:6f89:2d65:de88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb01a7sm7014274b3a.44.2026.05.24.04.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 04:57:16 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] arm64: dts: qcom: hamoa: Set MDP MMCX corners to LOW_SVS per Windows
Date: Sun, 24 May 2026 19:57:03 +0800
Message-ID: <20260524115704.9442-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Lenovo Slim 7x with Qualcomm X1 E80100, the current Windows ACPI
DSDT votes LOW_SVS (0x40) for all 7 MMCX OPP packages in the _SB.PEP0.G0MD
F-state EXIT package:

"FSTATE",
Zero,
Package (...)
{
   "EXIT",
   Package (0x02)
   {
       "NPARESOURCE",
       Package (0x03)
       {
           One,
           "/arc/client/rail_mmcx",
           0x40
       }
   },
   ...
},

Apply the same in Linux for power saving opportunity. Validated on Lenovo
Slim7x across daily workloads over 2 weeks with the internal 2944x1840
panel @ 90Hz and a 3840x2160 @ 60Hz monitor over USB-C MST DP alt.

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..bdd9e7e0768c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5657,22 +5657,22 @@ opp-200000000 {
 
 					opp-325000000 {
 						opp-hz = /bits/ 64 <325000000>;
-						required-opps = <&rpmhpd_opp_svs>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
 					opp-375000000 {
 						opp-hz = /bits/ 64 <375000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
 					opp-514000000 {
 						opp-hz = /bits/ 64 <514000000>;
-						required-opps = <&rpmhpd_opp_nom>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 
 					opp-575000000 {
 						opp-hz = /bits/ 64 <575000000>;
-						required-opps = <&rpmhpd_opp_nom_l1>;
+						required-opps = <&rpmhpd_opp_low_svs>;
 					};
 				};
 			};
-- 
2.53.0

