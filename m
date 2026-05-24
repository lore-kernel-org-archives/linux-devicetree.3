Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7614031ED8B
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652203; cv=none; b=b9skDBRhXcqtpBX67iSopsSiuK8fbhrsnNmzi8vD+1g8JCqqhb2KvtalSxNfW10KMCpvZiwHQy8O6CPUlzfAFbMuwrpIbQ4Q4tQE39vGspOewXsK4q1Q/nNkGMvmAIxhTX0NQ9ShZVD6UCr9ZbjMRAQa+ese08eZ6dINcwDhzn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652203; c=relaxed/simple;
	bh=b+23ZjD20/zfX0Wk+Yhgv7IVAfpuYgIBSYXxov+Xe7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IckqOhYSN4WKUJb8RdMsz/uib4VERFtY2LvKSsGBsJJ3mnDF2RyO8FMaDueYX5L7m3NM1yfmk1BTOZmTSdYG/QUi662CsqBxb854edCebDSf86hgiOVtpxiq2mI3Cpu5Cj60b4csDXL4h7lspfBrDDvuXfUu8yNyAxYHOzbxo0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rw7hzJkA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dcSPSDBT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rw7hzJkA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dcSPSDBT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NL5sHl1498348
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RkUFsf2T+/cstUtuISGHLPa0b3uwoUOPZw+kpwQll2A=; b=Rw7hzJkAEPEUy1tG
	5GBH/nuXt5PRCUWKSkbGZwnj+UwCxiwjRkmdzMEQQNvKIELLpY2PG7vc6+CxLwyX
	Nt5TUD44KIxHjt6lnguoW7dhHFLUgGNUQzkj/Bl4cDYP9tQ0vJBpAMC2ChWmJMkO
	/+RlxFXp7iCuEqjACFgk2nB1vRLrn+dfpkxtvZBoVH/lb+dmqFaxC36/8sqsBKFK
	zwvcoTtHtRKAOjsB9jh++Uqwz+xwCYHE0aVXz1p/smo2xad5hOfi0iVWmDmrjIMg
	QAD7yh6aVIdBo0/GXLpaZ91UOLj2t8tqlHviPPd6lyaA2VtnSPToKyb25bjGRJtM
	aeq2UQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386m2rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366015bca9bso7295011a91.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652200; x=1780257000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkUFsf2T+/cstUtuISGHLPa0b3uwoUOPZw+kpwQll2A=;
        b=dcSPSDBTdtmnFc06tsPwDBfzJS/gk4fK+l5ffY+3IxP9ZNyRfenHU4r6vNn9ZDlPT/
         5mmPtOuZAnu6R7aWgnHYbxO5jSjZvuak0eRhiicK0DdqAchosAODRthrRImz8l9F3EHz
         NeqmbL94yaap778pWPbeHuJb3XwbnDvRcXYJMEg0Za4pDNgz4KP11UfXLSp2Bp7MGVN+
         3kwWLyvHMCcoAQDDpLEuKccYycg07wWwFYsWj9QhdtiQ/JuabqKra0PF0BVSLPgbDTGt
         uhADoLlD4PXhP4OUzBkVvAOwwUoJW9ZHUKXqBIQ2Cagd6ok9MWPb90ngWPOiIYuk3Bzw
         XE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652200; x=1780257000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RkUFsf2T+/cstUtuISGHLPa0b3uwoUOPZw+kpwQll2A=;
        b=sxP7NfeV3XJH8G3j1hJAFY371OVaV69jPElgmHv59OeEVgQ5a9CoaiWdiPf1g8kabi
         WhfSONuZ6vC1Nnha/dF4GO5RMxQVaYJOTv15fYP0XHnEHQQH/DWlhRhDfDYODI2mNks4
         MF8xSxqxKKdnoPuRWVEmI/rEjiiH3wedEZ1OmlPte6BPWv3KQ4mToDx7NGqLfdpZQbPO
         +LarlaQDEK8DywbMgHGu98yFofngqdW/8Cq3tHfv+/lpCes4C9J8hmgP4p8PveA4Lzsa
         ex9KVut9+oqHZmKyvdYqJEEkIcv+MwfZO4exoQhvWRYaj/q7ynrrTlNYFkNK7AMsjv6z
         1h5A==
X-Forwarded-Encrypted: i=1; AFNElJ8ViacduSo9IWvcZOuhufX/hvLtUUQ68eoiO7x2MHMxRwaXRr3NK80BLKQWJuxnOgt8UecVZC3ahTXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YycS4MmYD8IHyIlQpNyUlTUNhAAqmU4Xi9N4LFgzrJaeL2q9sTm
	2Pgq3kTOhMBEhQ2u8KUv1kK4Az41dUxoithEmPxeaJb5In3f06XdYaNGrZ3g5zgIyQhZR6zkcbO
	/cl9yyzeXu8/gmKN369rbJrkL1DtLnnU0Z+OEHVwH2gfUL0kQtdWc0X8S7+GWi5JK
X-Gm-Gg: Acq92OE3JCtYWVfp/cXrH42sB+IGccuCo4XOCpsnZlBRhLrP1znjL2EVaRNU6efXzBt
	xoHC5oeISVWUDUf6DihM11oAkwLL/OsOp1EJsfFWQx+zKKQBtza51EVvYmCmUZSF21cq9dVIepO
	E16Qimm6TSfasCpc9EZrD1MO2VBSGZNLiYcDT+NlIzsNxcWHzg9WH+aOBX5FOQAc9mDa2Mp6qrw
	xj+XQfrr3MogQM5ea4XA994RTx3fmX4BN7MsIqDG8nuLDGvvqu5wxEL3eQWWLcD78Xm0KhNz9nX
	UtIZnWkHo4kBQEINdX6Nr5R/kYTS49NAabFM7jAe9jeWKGIW3hIE2SqaVwI2i7eZi15/RJCsjYY
	TlidPp7sIwi/PAvFTRvsOZtm3Lykc4vetECzx
X-Received: by 2002:a17:90b:2712:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-36a6c79dd38mr8744325a91.12.1779652200267;
        Sun, 24 May 2026 12:50:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2712:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-36a6c79dd38mr8744310a91.12.1779652199671;
        Sun, 24 May 2026 12:49:59 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:49:59 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:10 +0530
Subject: [PATCH 06/16] arm64: dts: qcom: shikra: Add EPSS L3 interconnect
 provider node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-6-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=1320;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=dEWvwbcLQmzuI3XkSrEr3+ecYdNDbFw8synh+n3gH5Q=;
 b=9PueDrgoyTVBdXUt5RaCvm7z8DQPhu0eSbiw0BzW9l3UlKlj1VJul4jhUyK7CXS70IZ/zq2m7
 +cjS+ypBh4dBbJdF/6n/SIgI6JQTHZi8atbMSrhPZwCf3aBYW6Oxneh
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: 2RllcCPdjJl3vQZGZRwOwUQ7Ee2fsR04
X-Proofpoint-GUID: 2RllcCPdjJl3vQZGZRwOwUQ7Ee2fsR04
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX8HtI6ebSZggi
 6hBNqcIBF+lNJMS3g4voMma+Z7NgDS1KyXu5Pcyh/zGCCS9lP8UZ6oVk1cUYuZ/4NjMyH/CJiha
 Xc/2vZscTJehdPilAswvBnL1b7P8TjfbaFZbmMcyr5VnCXQyX/boLzOIbx0cDSQxxgMLYsgkHMX
 TPe7Od+mXVSLr+ZRkfwnV4rBFfn3a7CaOWqJ4itO7F6ngLgC5rIwvlpzGEWLmN0VYNA7Q8Ejdsv
 9mHLQtzfTRzV+jqvyhwtox6phDbLRb0n3zy8hkyR1qzgRa6e6o0ZW6ntYP5If+Tj2CLFmGbatkp
 DHhqr6TdIK8RJTf3sqCMBJBh90qedoA4ILFDvS7rPmfiuP6541ORyPDEEg4oj9DHfiBIc0KfqzX
 W78dUahQoxLtJMZc8460SOeNma7bUhwwW9gzn6W8pwDX7HhHVXYhcCwgw47cXPKJ14EpGgu98BS
 6CKpn2QoWZD5+yVeuMw==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a135669 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=V_Xbm4hklSwhDaoQdiQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240198

From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>

Add Epoch Subsystem (EPSS) L3 interconnect provider node for Shikra SoC.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 238772f064ec..ebdb4bc15d76 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
@@ -1833,6 +1834,14 @@ frame@f42d000 {
 			};
 		};
 
+		epss_l3: interconnect@fd90000 {
+			compatible = "qcom,shikra-epss-l3";
+			reg = <0x0 0x0fd90000 0x0 0x1000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+			#interconnect-cells = <1>;
+		};
+
 		cpufreq_hw: cpufreq@fd91000 {
 			compatible = "qcom,shikra-epss";
 			reg = <0x0 0x0fd91000 0x0 0x1000>,

-- 
2.34.1

