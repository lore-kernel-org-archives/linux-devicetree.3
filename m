Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5CF3C3438
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039227; cv=none; b=Ildc+FEJzWNcOXCLEOeQmdKzH00bGQmqUhQCfXlqpcUkx6tgo2AqpoKrsC8+FvZqZum9ClbDSBeetDtI8KYnWu0MlWV3SVZsJW+9QLN2qld2fSqC0t1aibT0Y2hMEjepRktHv+prCHh2Fb39G5OO3+1rzgh0THktVAv5WrE5Nu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039227; c=relaxed/simple;
	bh=tJN3jwnDUiaVHC4/cDv+QG2aCiK9PqDg1hQYkAmyq2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n917n5Yqc+SZw/UwXnAIBr7n50TNOZ2F/lL0k3ZB7vAmapuJxQ80Nk5YO1w5+qwJrJougJO6wK+s+l4NcH3dQmutKXqE36U+Gi7SI89fKoVX5VhQmLXO1R9SfRrEH9XXqVpHG3iZvECiwC9WKzprtDyQFuvLkmMq9GWc4lweFnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyBPWDjA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpO7d84U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyBPWDjA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpO7d84U"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H2bpxg2590280
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jaHcN2Ua5y54bvsc7r6mYnRrx1xn06nYXzRuIAUB6U=; b=QyBPWDjAglnO2ePX
	/8qJotpBXdNG2miWoFRUHoUYYxmOcbo3pp/ndbBkGiSu9JkH07gAkW7PQg618omb
	Xkg5qZE43HQM98e1/QaZ/bZOy62Q16kEYC6L4zk+tqFiOk2n3NX1b5w8AhrZ6Z4H
	vESf0Z3R+WF5y05/Ap7SJ8uOEdObdKzfCjD1dcNebdjTbhkdMxq6SXNnbTvpoquG
	5vBeV4aB0+1flinWVgaXLdW0zADwz9iB1XkvS89j+oVOU3kXfHgS2dYq1+mF1Qw4
	Sov/EFQiq6BmnrNewjMlXjzoriczilbzvC7Qsqz9Z2FpGilWhjoOY/qRADoGRhmr
	GzzILQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h01k9xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:33:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so1805159b3a.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779039224; x=1779644024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jaHcN2Ua5y54bvsc7r6mYnRrx1xn06nYXzRuIAUB6U=;
        b=RpO7d84UKTG6WRBjj1iQuNdDceWZzNDmxU0TYO4ouKY2FnzemgqsB71rWO0GKToUDT
         kFr4vSLmThEE99upfjjwbXfOeeBbJZfyaXJFcVcVLe9106iy6Dwwbf4qMwwFvZDSyCmq
         2pKU74HyiTE1qNBPLiBxvXCURr2FQR0BvK4yb10Mf8CRzPK1+cck9cvGw/GmDn2P+9iW
         fk1lG4yGc3aRbUCn7ClEIkrSHit8tRu4SRvyDxgilPV/yljKWisjxgBDJGNEf3mWeOqB
         CYsGpiyoMWrYjsj+HK1CLGpDkiCgk/4tzoS/pqE5vrPlBDOqz+vnTEVdz5Ka0dXqWD0T
         Jm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039224; x=1779644024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1jaHcN2Ua5y54bvsc7r6mYnRrx1xn06nYXzRuIAUB6U=;
        b=ogt8uokBOzN545eTWg4OsdiZ+9lGWbMHJnOitZ5eU7JslnQ7yncRjIKFvGopgTAa/G
         3dIgajIH6ZOgQRhNf+98eVQqmC/SzMKKGmJtUHfab4tnxn2PZMjqsamISUvqmmDBXTaO
         224TFKR0hwl0o3+39Z5qKSxOJWCLCqP9LOvR1S1cM1HooQ45x/O8DsodcL6dleMFuRMz
         VpFlw6o3k+2S4MdurutktzrQ/Da+NCnQ3+IsuO5wvwt9E8oE//xTmPxJbfYnPNKZjttC
         DSgWM85V8p9C+zOznwTf5mxVTEFoWxN1s5Wla7F0FMPNgGChFIJ0DZ5ZrXuU+roo2lmT
         Ltog==
X-Forwarded-Encrypted: i=1; AFNElJ9O61/oj4EGyKdERFUw8aOQjkG0dsMrlVnOX56lpnYKHrEfWSZ2Nzz5Fz4kSu8+7qObePRur78v2tUG@vger.kernel.org
X-Gm-Message-State: AOJu0YysMErs1VqairzVsDCofxWGj/Md5/e0HZ5LoRhbLtpIjzRn8rdP
	+xmydkqG1yWZ7fwYZmlPi8lOzYH/nI2vgJ2JWRuahSMnBabLC5wYMzxXbmSx28Y5lA8l8LDu4gP
	vxF9QaVFAF2xNYWF6fVRPnFgfN6M52MA4u9PwWu4Sph/ot8uZ+J/q/AhtAD0yG/bB3uqhre3V
X-Gm-Gg: Acq92OESMmLUIYXiEM6Y5jrc25ITYQrCTnL1ZSdpmlKzWkzJacPv8p2doVtF0yizHLH
	BJl8ZmVB2UTN9LIdkAvYyBH0bnDTYQyPr0See/XORuZrbyoLyeuI7DiqrTJen7EPIICttNqT0DZ
	IyZwqK61c5wpt+lKnVJA2hS6900fvf4OGUN8hwAXaXsl4HPmFoImm/Nrt+ghfbRtUpkEMvPSwGZ
	2Jtl+8ANFLWt744JcL41+4y3JreisvZJb0icMOVe0tzNpwz0/fpQtiARDy2g+eCTflJTnBYKcBk
	o6duLVpWYEKwMV5FzAz6eZntlGmdRf9NsQ6uNFUo7y6KdmZ7SZOgEATRI9uLNmiU651G+995UE+
	tl+XyRuNW7n+eyhPJeyrrIn+1pZBwmvswSqDBD2ObhA4OkGXDyaUV
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr13311236b3a.16.1779039223560;
        Sun, 17 May 2026 10:33:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr13311216b3a.16.1779039223108;
        Sun, 17 May 2026 10:33:43 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778c87sm11331567b3a.19.2026.05.17.10.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:33:42 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sun, 17 May 2026 23:03:09 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: glymur: Add camera clock
 controller support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-glymur_camcc-v4-3-9d00acffdbf7@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
In-Reply-To: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: XYBNtzYP4MtlOVL9EzjSPyM9bcKpMAX7
X-Authority-Analysis: v=2.4 cv=XbG5Co55 c=1 sm=1 tr=0 ts=6a09fbf8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3iLwGWznUEgL9WBE7MAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XYBNtzYP4MtlOVL9EzjSPyM9bcKpMAX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4OSBTYWx0ZWRfXxYCLSEMycjKG
 bmCED2sTyk31QtsoXt/rUXQqXijSbRQPC0D21Ad1nK7VKkYKSULsMrBkGH/8RTcxuymFEpXH/Cv
 xuodzmSITUB++JinKXEM6YWPd/e9wGyPht1uujVDN+7y2ljWcLPZym4txg/33P9jKbL/ymsW3Rj
 Br8h0etk5zoBt3eTeo+RL9yzCUK06io3ePO0RirDL7hXmYMA22fNrvuYaI8A6duXqaPTNjYla2V
 VPYMgp3U+MTRcAsMY9g5Fis5eU07nXietiC+/K0sYmPIAil8NbRx6VGKQRuPnhleP5QTFIy1Hc6
 f3MjaklzoUE6e5hQRT3BkVpWiQZRCj9X/TKZEQJgF6wY26NbeV8NIC2Hw8M9eWebLkszNyZzC16
 t/DYdZxDO7JhegTzYA8468rAYDsDmkXWLS1eYagv81ePVrnDvlZmBlMFTUatw6rZndI1CUJetv7
 z/wIdg5ZsTUFlsMN+Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170189

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 0c5cb8532b202c29ea5fca6e65e714ef5b09555e..6f9bdeb6f3acab21a4fc13608116b591c80d240c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,glymur-camcc.h>
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
@@ -4163,6 +4164,22 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,glymur-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
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
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1

