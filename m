Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674F32F6920
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776823545; cv=none; b=JqYkrESe8MDXWjj1XIcT5sKCy2A1YsY9FvnsZ0QJ4ahbA72coqHbmGIJ0/utbKusAKlAjPvNmvQJtP2ADhDQyZgfhfUnT5BXqsq9gJJqdis2nFcLRgg8CyXfigl3xt0bCTcM0Vv99AxlONVbtP5cBO+f8VSCvm1PHLpV7NxIsQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776823545; c=relaxed/simple;
	bh=/t53h29Pkj7viUxmExb0P2VDmCp1KWMxYHFdwnxPeeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j6QIZgYF8OvOQCa95kOgSG0UHnykWAMReLZ4Ll7f9UZs7tQfKnBOJOQrVXQapAx4XjzJ5FkTn99aEfc5eL6s/TOlp56p0HhWKl1asSYVAKMBG6qzwaOaeRYKbARqfi+NAAID2nHS9xVev6ZhACBNKgZuS2UGTNg/VrmfWLRU/Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HW+wvQkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPIBnuoT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HW+wvQkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPIBnuoT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZoKY2123589
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Amnf+ainR1CvooQB5tQswFdW/8sU8z+ZPwOSNkYwagk=; b=HW+wvQkTIDiUcqKX
	vMuKzspgl5pW0ZbJSaQaTnOlf5KeuloezZT5CzbREdzAhb0adhn6Ym+3wbTCnQv+
	CcQAoFnoCIHKxz/PGSVcf6WcKp/HPV7rgibxkMlLLPhoeFryGRHMs7HbsX4iqKqv
	q3BiMGsMdJ24YZK0k1SUtnMb3AX5sppYbdQOA15QqHR/UPwKQbG7tBnpmOlUgdC1
	MpEmsv0TrN6XDvxoJcCDeh1SosbTNu7Yvoxawlr20aU6wETXtvIyj7QsTphUh9Sh
	A5PliXOQSr4m24RtkiEZibO4kEzlAoIO7uwc9K2WVqeF7VYevQd/BO7QJc4Cxd+O
	Cw3Caw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfs744-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:05:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f2138a9e0so2902838b3a.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 19:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776823542; x=1777428342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Amnf+ainR1CvooQB5tQswFdW/8sU8z+ZPwOSNkYwagk=;
        b=VPIBnuoTjdpy5V6egPYIaDW6sPGIo/EaoiDEtMTiAC85L9XHKSZan5RqBzXRVBg+VY
         TuEwd9JbMqojsqMikSTnqZ0GgOIRKEf8DR6dxLUlFbFJeC5bQW2A1yQtK1EkUqVNy8g+
         OBGThGtI+ZkJIOEEUPGVkYqatdOReDh/OfamMbHnfcZOB3Tm2qRFjnxgIr00y8eSOjAj
         wuzcApPw/wmAi+i19jVRPBC022qlQXJ1GPBL4aOWbU+FNGGU1TXbM1mU5Ez1Xy3ow7B2
         iM3tJH5xs2qZYC9lGE9USXhk6jTnevmoYOGAPDkzcMsIfcuVYEE8uhj6fLifrLG4DZb+
         TYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776823542; x=1777428342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Amnf+ainR1CvooQB5tQswFdW/8sU8z+ZPwOSNkYwagk=;
        b=lkOUK3Swm/n28lzmU2gU8Iiq6wyThQ/fHdvS/y05GLiFuLbhHlaoheHRpIHD9NdDZe
         2j7YnFvBHtYsNa6TLJJ/PlIMbT9ldIGNYPs7nsDMrJMwwjFbovz72SqAeS/hgItDcb8l
         Lx+9GXbqk2DuO8xqKn8Q54t+I7ibQPUxBJragJzHLcUY/hnb8GLyC+KMrtFB6ubPlt+w
         58JpoeTgeb0Ryp4FShd/iENY+XxYQ16JrxlrglZbWbBBjaw4qvXW7xD6/EUn+J4ZerD6
         1qxpLxNqzhhij1pjobJe3EivBdIwFNMOVj2D8PvSSSxMKZBeLmTpz6M/AuYUIswbe6GR
         Ddxw==
X-Forwarded-Encrypted: i=1; AFNElJ+lazaANEzOFBe1M0lT8emnux/gB+DQz7ilg0zqIprruDtPYw0fbHCqsTzBccanD8MzLrUNesWLKCv5@vger.kernel.org
X-Gm-Message-State: AOJu0YwpCSJyttARyP7Y7KWLUK9AgtHV9ILwNjC8Wb6U+RzTaoVLAP9T
	mh1LEMxj9IBhsn3TDB1P0CVEYSKcZPLIjpqapBrv/ZAoNp08fIrRhSWa42HRmzuuhyvh2RqrO1O
	g3+B332vB5mW/DjmGNX44Gf+jteBuoyxLbzSFO5irER6B2Jy0aQe2fstNNXUEKl+U
X-Gm-Gg: AeBDieuv57uOqMc/JlJbB6Ofn7gGOPDSoP+R9vPnSkTtmy8H7++OUrqddlk4AIKJeZ4
	0KxH+gitTQueJke/bnR5/aVmbjPgm1WfTr1W6dhvLLBKN0+ZOjcQy1Frkebr8/hj3/nTQjMDQyT
	Fd/pMvlUQHunZ+NQud1X85JTqbzscXZ0uQD4JDw3U0+OIiWywBRjf2GsPLycTlPAEWxe2oeO+hB
	Nyw4Ree20czUpiLIQpmimaDuIkgfdAWKPj2aR0iafBmyAut/mDq3UKBXqIVlmHWy7u/C9HU1/A1
	pywXyhmMxse7S06ixjoRjcDQO6tCbkPp6Uf9/d4Az7Crds9nr6yxa/5vJwGKdh/h5TP8A5PvogL
	oMXUXn9HgLpGNZZXQ2YNe7B0xyrIJFe/WAkJywwMD6MK5dyoyhCQitTM=
X-Received: by 2002:a05:6a00:2d03:b0:82c:ebae:3cb with SMTP id d2e1a72fcca58-82f8c91924dmr20936856b3a.43.1776823541980;
        Tue, 21 Apr 2026 19:05:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d03:b0:82c:ebae:3cb with SMTP id d2e1a72fcca58-82f8c91924dmr20936809b3a.43.1776823541477;
        Tue, 21 Apr 2026 19:05:41 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981be6sm18040368b3a.9.2026.04.21.19.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:05:41 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 02:05:13 +0000
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100: Add clocks for QoS
 configuration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-x1e80100_qos-v1-3-bcc2afe4cc78@oss.qualcomm.com>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
In-Reply-To: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e82cf6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iJbeT2h-Aok9JeJ55RIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: NFrV66MhKo9nGPwRV8_i2WGv1iJuoBqd
X-Proofpoint-GUID: NFrV66MhKo9nGPwRV8_i2WGv1iJuoBqd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxOSBTYWx0ZWRfX4l3fy5A8pA8U
 ZFQ81ypbuIVieOVaA8PmvA9F4TE2GHwxN5MZSVYeOktITBkML654Tai9U7sHWVuqDswTt/EVeMh
 4Nc0d3HCwB8xLURs8/apEELX3bwP6HzOsIRMCvet2uvOhU/HOW14RGZBvI7lHj+m7rm0M6P1GW4
 Y9AmRuJElZ/O1B79fm9IO6MkJWmB4lSTpddYiBy/37jakLVd12gJ2nQ/g+s7cP8MsyKaZHyPItZ
 eOTKm1cTkqX4amYp2pKWITgN8dgNP3OlRLRZ/bigoWEjxXms8O79o1tKF0M5dZ1wX6kw+akyIWk
 GWO77a6+eKLx0KJS88pDz/Ohft1x+zikGuQw9Gz01RVrjGr9vDQLhIkx7WJ9mA7t4aoFODc8sOp
 xtcB+oDCLnCIaB6PdJcKrQlPRrHvYueXKs6KiTGOEVfIB7GUqp72CjUeh1avccqWtRylN0xZbfz
 Eg4wHzd13Rq0NukoKMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220019

Add clocks which need to be enabled for configuring QoS on
x1e80100 SoC.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..aa206452950c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3132,6 +3132,7 @@ aggre1_noc: interconnect@16e0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
 		};
 
 		aggre2_noc: interconnect@1700000 {
@@ -3168,6 +3169,8 @@ usb_north_anoc: interconnect@1760000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>;
 		};
 
 		usb_south_anoc: interconnect@1770000 {
@@ -3177,6 +3180,12 @@ usb_south_anoc: interconnect@1770000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 
 			#interconnect-cells = <2>;
+			clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_0_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_1_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB4_2_AXI_CLK>;
 		};
 
 		mmss_noc: interconnect@1780000 {

-- 
2.43.0

