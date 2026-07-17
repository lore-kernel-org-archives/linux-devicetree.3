Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F0A3A4267
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320984; cv=none; b=PeMz5pG1ScYA83RXgHCMCEbbqKNld1lF5JpRt8iWdmkyaiV3tRyx7UpmcMa/c0M116mgQVm604mJLQvKZeEXPldN5gSt5OVU69dZaLCohK9KWIIQJ6uE0GFh18VkwqLYWMxmghy3uHPInPULxkIJGOGy5OXtDbLsDttse5nPFxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320984; c=relaxed/simple;
	bh=ji5iLrBg00KLDTJDEeIrkWdaqc6esAA0v7oRt6NInIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZ0pREhjggMRorbH5jOKTAaFcfbmD6mjkybQoW8SNzaacx0eTiRBSCDKmN5DmeVpK9sRJjqHmYNDrWRrZme74xZ+akpXOCNjbkojZVuH7XakCH4DvC1o/4d3KJILBs4X6svGKh20ApdmQXMRldR3k53rYmOSbwDENnInIlkNafQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpiX1zfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYJd0VD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpiX1zfS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYJd0VD4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtYkZ2780236
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2OnpQ0EmgRssH2L3CQIB8lRZrNWoIaLQHzlCrugCPk=; b=DpiX1zfSRa6lldwY
	U3+6wAwK7OaEjUxXNbS6Hpa/Jz9rdmUiuJruNGa7Ft7Pb87qNd5/8ado7rOywoji
	4g8r0n5RFV7qkO1xsONitbbpmd6wSIJCznkxWiA0eV4tMGotcuuqFG9WordV/heW
	63GJ6k2CtjkSArYE57hlftCsvm03e/Gye8q3E+q1/cQUKZwicwmULldy9+pxbP8S
	FISXmm7f99LpO+yvArlXiWZNavYDNvcCVNSE2ypq+uC19ybeV6JwC7YwVA1PNXMc
	msb1YG+ci7MF2ImSX7AqWz7uJYIdoiN1XUfk490TItw3eAD8W/N1yOczeHCe7mjk
	l0VYyw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gu99u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 20:43:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so252383a91.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320980; x=1784925780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2OnpQ0EmgRssH2L3CQIB8lRZrNWoIaLQHzlCrugCPk=;
        b=OYJd0VD4qYV/g1kigqSchc/+ll44WB0OJGjchMh4Bhrjssz8+CVvcKB9dTuXUIpDRB
         CWcJCpADm024CYXyuonjTd9zBpTS0bQ4VW+dRSAWzUVfaDSKrGCpwIcvNcn/LrfNK09X
         1JCnLSBltaylEQTvhdcAUp+KMcEPSPMLgPSAScEtsxMyAVUk5bXXayrotmSdEIVnlkGi
         fLpmyVk2Ok5L+i2nGs8e2GntzLHKIsjaNEuayrOh5EzpV8BCy/9u3beNYBB7lj59uW9v
         LbhqSlzv9aS+N8RIeG6ucjUmDAn+p1wIKz5zrne8xJfBSIF2o0Vaw25vzeXq8TmXgY/7
         2Cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320980; x=1784925780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2OnpQ0EmgRssH2L3CQIB8lRZrNWoIaLQHzlCrugCPk=;
        b=jFqK/Pr1Av3Cc8ZJfetFqP0UECtJptk40/Ae209Qds8xw7AzYwItyYNQ8p+rcKzq6d
         0K1Dgs+G11y+Mo0mgu3wj1JKzeXITRvKFicB+AXjvGuCyozk9k72jBbzyE0lgxdp8db8
         vASbppB0oRSjObVHiGQojzM9knuNLUmzo2AlCEGazpUo8q43r+NfmgqkHtvxtwPNpoM1
         z4Z5TdVgrS2VdgNaSHktO+sS32gqP30TgE1RUY03nU6w00jmtI6pPR7UNHcFb/CGg5Xp
         eSK4Z3Sqm+ViNTqiBD4jDaBpJgZLYC+2+wUCmt/wPl+n+6x54dm+1sjDpzhwC+hFtMrz
         Vs1g==
X-Forwarded-Encrypted: i=1; AHgh+Rr1dPNv4ejfWIzLdV1X3ZWn41kakSRfT3wh70ONebxIhctp8CNQCNLWXRpoLzzF7ovVbpw5y9zFnKys@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz7j7MpFk5L+nFX3DMg6vViArkfFsldp8JtPzgaVeapY8BJxec
	BAKT8Qp2qcOCYA5jTeDnGLSFDSoaBrkGq6leqNxo0hkE3RMgLsWQ2ariwuYpsqX0HS6FsOjRmJg
	euAH32McEDNrsyAKlODkNcIhiNi/cppVjHMt1xhfPgHGt58TshrG+o2nSynVeUp1K
X-Gm-Gg: AfdE7cmPcTGzq3IBCEdZQhhDMS3MfuLZuvhnEp4IFsvsohA+usQxJR1QLKKuYTyFUcI
	jSZ+kopn75lMtpPr9NJgJVB1wYOP8gE/+YKfJ5TR1WPzISebHL97UaEv0XrQk9guigdSyemWZsq
	EoGn6u6v7/CAGKFi0VkSI30PoaXKuK9isWZ9I1V8J38dbDrB2Shyu1ZiD8vtXrzobKmEUSjcHaB
	Kp9K/0c7Q2v7rV5s+v6KXONEOa+tIOnrZzzLCLvsfkbv37ajkdjL55oetc53zyEq5GwABAflnRp
	YDu3T+eybansbs7PB0hqorRnEGssByOH/593Bj+TLGyWdIGsMZ6TbH7K5dBMUwKTSaAlYzLJPlM
	knslm6a5IlO6ShXabCfbLwk3L
X-Received: by 2002:a17:90a:d60f:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38e4b51656bmr4228894a91.28.1784320979922;
        Fri, 17 Jul 2026 13:42:59 -0700 (PDT)
X-Received: by 2002:a17:90a:d60f:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38e4b51656bmr4228835a91.28.1784320979372;
        Fri, 17 Jul 2026 13:42:59 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:58 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:33 +0530
Subject: [PATCH v2 8/9] arm64: dts: qcom: eliza: Add GPU cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260718-eliza-gpu-v2-8-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=1862;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=I2qdHaXAWQ66skBdEcFBDJZY9iFXnEWZCtP8SvXbtEY=;
 b=Hr26za7eMf4CPEZuBeq1QpcGTa+cwNyDY7ry7ltZ24uYMQrlbbDQKhp1jH0P9FhBarogV3/ti
 yGBLL4sPirEAEkMVokLL3QmWaYWdYvOUfnk2qfLFmhYQ4OdQKTpPQry
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX5m8RJmEWEqCO
 LwDR1ihUZ3gAb7QFjG9B0PJ3noYIg/0pwGsIhWRgbisoaeZlmPE7QwWhqgy85mA3hMEMCw8NZ/b
 4Pq4MTFH0fTDnZNly/QCHRyY2YPlfy0=
X-Proofpoint-ORIG-GUID: 73f9r3B494COyo98GLqvW_AG6CWZ4IQf
X-Proofpoint-GUID: 73f9r3B494COyo98GLqvW_AG6CWZ4IQf
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a93d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wz9XmjxeAwFrORu178sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX+85zDH09zyys
 8bA1L9tAkqubCb01vH+4KoPQp844NBYUNPoIbulvC1XmpQZkI/Bv8VFl5AI2IUKgCfn0Yp5k4OW
 YZ36HFFeL7xD5YoJ/sM7wAKzj0aOA50iLgTRNQvyV/D/EGy8HZ7XMozKb1hCRHPWam+xMaeXrvs
 dZ3EFp/2iKWC9h9UsZovgmkTSj0Zz84AO6PNJj+89R4xkmmnKHXjGBxs+uXUVY5PRB4e3Ra+gxm
 y9PCE26CgZe0ouxYGI6HjW1buKuyEpj24RCKE5TLXCzDp1YQekssakkfNJj5Yna4mFCRGdi48Mj
 vtx6XCpFEG0o4t8oXgdmFzetvRDy6L98xjarpB5S63OuL2JfvitRn9bR0QjN5R8pvI8+MhTRxm5
 7rwLmx5ytALXt+O6hQ8UiJSPFcTC7WGafXlKqYBLe66UKly08K5ETFQPlvU6Q44h4aMMh7yzJnd
 9m+ERA1u8GDF/h1arTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170213

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures. Set up GPU cooling by throttling the GPU speed
when it reaches 95°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index c24c5e9695d5..7a6095495b5a 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4203,7 +4204,7 @@ gpuss0-thermal {
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
-				gpu-alert {
+				gpuss0_alert0: gpu-alert {
 					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
@@ -4221,6 +4222,13 @@ gpu-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss1-thermal {
@@ -4229,7 +4237,7 @@ gpuss1-thermal {
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
-				gpu-alert {
+				gpuss1_alert0: gpu-alert {
 					temperature = <95000>;
 					hysteresis = <1000>;
 					type = "passive";
@@ -4247,6 +4255,13 @@ gpu-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		modem0-thermal {

-- 
2.54.0

