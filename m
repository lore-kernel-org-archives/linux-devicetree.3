Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FF53B3C07
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726536; cv=none; b=dIcJUSfoXy429lqA9cYIh0MoTrRsxRBxEFuZxwNBvdOgClb1Yj0Tv/TEsrKJ46sg1NmY6Mtuipv4e13YDJv/bC6tSdPBwFIuHm3vJV6+t+UVRUs2PixtfSmKVEc6OayMfd39y2x2LPMdA13VZ5s2RyWQvzgrMUazF9xWnWpmsKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726536; c=relaxed/simple;
	bh=f3VcSNn611opCTNVe2wVeFbuvVUH7zgswWxsH/PezuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qk72qkcnWP0Qu0hKjyHsRfjTWSnhKDA5k6lXelxU89TtpUfgLGdoU8XFeBlaQ0gR9+xhZZciJUZAd8stmHzWXEsdCTmd2ufTzjTq2pkIqRvM/eNrwAh6MrQV23bBauJ2ADK112j/sVL6prHa2gXmldRtweKCVcFmPmnnhch+Pvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJp1mfIn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idGYxkh/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJp1mfIn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idGYxkh/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395IRaM3716150
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqgSOZ/Q3NlPl5exLfE3lkF0aJkdeSMwAV4+I0elz2M=; b=pJp1mfInFKOoNSqR
	BYATcf3OXwWjQnGeTG86Zb6d6O8WCxKRo2jdsCOeCSzO+z3FjHUGy/nH8+GKcKRu
	ekSVFpCZcX/Lxd+dyt3a+1RI2Y7jTdRq7j9gNuJtRpWg2GItguCsvHHSQT5bjg7l
	CJYbBOb5au3NwfkLV1LdCysIDSYGh1pbeKXDLcYgfwsR6Ofi/8RlDe3Aizlwv2yB
	O9Wg6fb7/775kJwjamPX9bO4ABXGGlE8g2XyWwLRLGsq9m5IGJIrfq5KQG7eLpti
	9Xa9X1pFSF+KDiHDUb5i9rPIY9096g4M6Tpn16dZW4pDRk6U38edN+TnPOpHMSf9
	Vl1QSw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74b9pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:22:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0bf2b3879so18242655ad.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775726524; x=1776331324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqgSOZ/Q3NlPl5exLfE3lkF0aJkdeSMwAV4+I0elz2M=;
        b=idGYxkh/ucm9LgFs9KWX6lk9mj9ejld0mzd0r46LmKixJBQNU+3IDqTJSJPnlZgeL9
         5rYwCqAhEm7CR81BAJZIDSltdQpusKKvStSBblulYga73atlrsl+/c30D9sDUU2AZGkW
         s9xGTuuFmctK3JOuC2yjVrjn+wMnmXtRnGudPGB+1xDnLChsXrQx/2m2APTaNq5AGCeb
         MpRHgu8HNKFTVD0sJhx74f2QxIlFScV7LzAX+c5VuiWw7nk+rF9tkXsCfjyPHZSG7bc5
         Kafig5bR0xEmh7fcoqrRcQ76Aoa6dax7oCDRSesKyhkZgVveF2NrEAW5SUOi4IcDIn4c
         O9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726524; x=1776331324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qqgSOZ/Q3NlPl5exLfE3lkF0aJkdeSMwAV4+I0elz2M=;
        b=PIebhwbUQgA/bGjet/JkUG2BtRfRWaqzJL1KCU0o3Q5COMPYH8ucw6/RNzJt1wOZkS
         +pRgMJoUBxEta5YegO04veiGi8xSKdRJESO1zDyrnh9pv3wZ2e81zJc2eiyQE92hAkqL
         OIQYO60tvRbgeSdte+ru+aS8wscHhb/SHTmunmLHy4C+qb/xE6GDK7t9v0us/ejPED1N
         0REToABMXeUfrzNV8kYe/KOb+nvCPwPMIONhND02SgMnhtA0VUAF+spDTh/0CIf19hFM
         poBeZ3fhZ9bDvaQlyzXaTq/M+dMUXdI+aOdPS9yJlE+XoZY2kKsyc9hpoLXAjhn1K5Et
         s+ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvaP26zGQ1/S1zII99IDOf7OnwTuKxnLKIrUn4/pHQDDahXEIi5S0eSVkFptYanM3p7hhvHaOyXOOZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9U9UXbb57LgWuZiGRxX72mHkTGtxo+qKd6nfMD8YzcRwmVgs3
	dDSVrUuAabNaIjiQZ7Zj4j3lUdULv78vuXGwUF5WOkcBN4QEyA8aFc0vL5B5Xc/fWg4rNhfS34v
	K84Fgj7argopq3cahPLDgog9mH7PziohZK18tply5xoHqaQ+2GzQ+hifFl57NwOac
X-Gm-Gg: AeBDieuvEOUEzl0DRr4E6DM6WJFYjzrTpk7WF4PB52eQOTyElGxsQKDWtPidHfSR+D9
	QJ4sXAnTztpiZ/Q16fqEpvzEr7/W6qnGTg3mRAZ3KXoWY4lL3tFbxWzT6eBnVxI46EBsiUrRDGb
	rwvyI7A5BguJI09GRKUq2qllF7ePXw+V/9q9B/iH0FWqX+WhgwLCewDvjUStMKhRmr4CSg3mUnL
	WIcWCt3aSM47am1dBIFrd1xm7H2WpMOVZgyuB3dDlcggiAxCxwIXvxBrubsd3TYZgk6RERhPz1d
	adH8Gxon+Wub8oRmrMFr41nss1bBzEWTvZBy7NtO0JaYQ5ILR47KspHEl+IQ8h1gwvcs+qrJqJK
	64SBd+Z9zYuxtnhVzCxKKHAeTt0sD2oZEorJvqMkam7l3E+phYSJf
X-Received: by 2002:a17:903:a86:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b2817995b8mr245081855ad.23.1775726524048;
        Thu, 09 Apr 2026 02:22:04 -0700 (PDT)
X-Received: by 2002:a17:903:a86:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b2817995b8mr245081385ad.23.1775726523598;
        Thu, 09 Apr 2026 02:22:03 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274978fd7sm311766815ad.39.2026.04.09.02.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:22:03 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:51:08 +0530
Subject: [PATCH v4 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-purwa-videocc-camcc-v4-6-5a8e5f2dd4b2@oss.qualcomm.com>
References: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
In-Reply-To: <20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d76fbc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7hkWjQK7Xc3mONE6JcUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: O7kKfBVUCj5z-sONVpdiMefBaUdgxMH0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MyBTYWx0ZWRfXwZhWFsK4zOvA
 r+noug/Ncei0QgwS8rY2ZBO43a//9s+QKFLI8EVELupFN+Y0ay83dKpHtR9xFrs+v9Ls41DDnoM
 2JrBYADKNP7avhzMUc50bPuLHFf5VN2Q+EHpER/0yHqwUB9WaACcwQJJISjCTVtGwzHSWKdQbjA
 yRqgsX2TTvpp86lxLIq0gpZkovt3//mAECuvEQM8S23NhGlgy0T1rh6Tn9Rt7Gyt1nnDsmQxryv
 iYCJ1JOVYkJOmIatROi0EL/e0NQFPNFX8wJYp1/+YasML2mOWTNz3kkr2N+Kx2EvWYiV2aoeLHc
 XtOxJuLbWxl5YE86ak3zW2oJuB6nroJo8+6sy1oK2TxsUIv+4wxMm96bvxOVCsGLxN15dkjnqZl
 uonrE+sn46PO5lV/BTeQ1reCtlroa+DkL4+8Ub8ijahBVpTIM5+H++p+m1HR1XX6AmZdwz5aC2c
 KuoxOCUZCIIdkXBUgqQ==
X-Proofpoint-GUID: O7kKfBVUCj5z-sONVpdiMefBaUdgxMH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090083

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one. And update the compatible for camcc and
videocc nodes on Purwa to match with their respective Purwa (X1P42100)
specific drivers.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa.dtsi | 10 ++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee0764167338023c96342d895f2871a61c59..a736ff0508be9b3c12975f8af3e06effc662a7ab 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5550,6 +5551,22 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 9ab4f26b35f298ad7c6c361b3e232edf07baf223..ea65b8448836ead83f837e973ed536e8ea0ed8ef 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -6,6 +6,8 @@
 /* X1P42100 is heavily based on hamoa, with some meaningful differences */
 #include "hamoa.dtsi"
 
+#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
+
 /delete-node/ &bwmon_cluster0;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
@@ -36,10 +38,18 @@
 /delete-node/ &thermal_gpuss_6;
 /delete-node/ &thermal_gpuss_7;
 
+&camcc {
+	compatible = "qcom,x1p42100-camcc";
+};
+
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };
 
+&videocc {
+	compatible = "qcom,x1p42100-videocc";
+};
+
 &gmu {
 	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
 };

-- 
2.34.1

