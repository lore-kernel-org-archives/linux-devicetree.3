Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A14B4E1C88
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779969; cv=none; b=LaUrvKcN2wXH/dpvi/GNKznOGjJViD96LlnEv3yzAIMoww78gaJp4kHRp81sXcOXYC1dii6SMtTubAdD4Wh1XoFEUqAaWE/B/yQRLwf80VuwOfluXWGMAN+457tYp7xGaNNScTmkh9Ox2WQpgcR4n5Vpks/7pfbYOkZ+gfv3wqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779969; c=relaxed/simple;
	bh=5GJGXU8fsHQt/qFopLvzw/9Pem+53Rp3DL4C9MNnYlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CHaLB46mZwCmSo8hHNEchFw9U8J9bnzHAnm3bZ845IqgCRIXWLi+NOv6ccdtbRmi+joFGlwleCz2gcYRR8dC9JyLxS6v9++HQn/8rwsJ3OgRtL0fKiktTC2+6c2n0dWsYZJNoCKrJYULH5uDUCmpDjYYO2GZwkMq3QMC08EGmZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLWuNrds; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fweErejb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLWuNrds";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fweErejb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE07cr4178753
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=quF3R874oc+
	nzE7gwS/oZ4MN3r+xqKntIK58vfepnss=; b=iLWuNrdsLj6wcg2qoSsJPCDsBML
	jbKsI+ZMr93owVlWQ8RjqIvwOX7EolPr8zeRNSFWNWArisnvp5RewanbQ1bfN2sQ
	yxh//x8e+UzLMaPZmqnJWwPZ9RumtuBjlibPB0Pxhppy3hsucWsjcCjU41v1DAM8
	rU7nmYDu+UxIrJLAVcaH/5eUqvdezSnS+ybiiaKEPWzzFaAoPihPrJoQbpMIWpsd
	gxq3Qm8GB3O9JnWHIuNn0QFuiMipv7ySI/RX800CXpoHgymTr3j/EKE/EeeIR5yr
	zLE98yWnXqTwR8bGK+AyoJZ8U8HxIHGf/IqqU/y1/FA+6f/86y33DUgUIpA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3m02v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:52:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d49d8dee1so463570eec.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790779946; x=1791384746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quF3R874oc+nzE7gwS/oZ4MN3r+xqKntIK58vfepnss=;
        b=fweErejbo8VT8vyZs5H+mx5ckIlaSR6aJe52n4slceuTXC4qxocewHfN7Pi6t/7Z6e
         P8gWh+dobj+GNKd0JPVvvxmS+EpcdR6+VFNPuz/fRIT+60LI/l4ww+g7FjLc01HDwVZQ
         PV2yVc2UcoRVygwqPpHnlQvBtgJ3pTv/4kf3VrLuZVsilQOMDcvUM4cFcRnLKmDSXZXL
         2TUpHwEzLJD8NnK0+9cXJGiwYN4rlMOMi/SriYo3PckK/e/FLNo93iFsTP7EIqOT508b
         BtgCrlB0nZeQjuHcZ/eQpNfGn6fuSRlkIgeNCXI0gNAZBz2QLIKnwMnN43DWVruF9sme
         6OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779946; x=1791384746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quF3R874oc+nzE7gwS/oZ4MN3r+xqKntIK58vfepnss=;
        b=ewmgmlERC6zDbM0W/yijzDf/O/58D0aNpFLLZdBQOlnZ2Uk/fRVk4WIJyIIOSwrWmi
         Z5SgqEuHDH9crxWaxqQ6KqxPiUpnlCnRD85g1T5vXJDeEiTbrThOsOYol4iYmNzQbeJz
         L9polUi5PcU73yZtfYhzGO2C025LnIjffeSQphUTWsciqjQ2DZ2wY4SNJTnNYMy8AE5G
         n5S8HsmLB8fWDJuhhUTKIWRxHija6ZAinZkgzeyVYl6J5fr6nN7fZvDDaFvfUH94dhGm
         fTbwf6b1qJKsm6w1yHhq9JPGdovMIU9j7e8iRte5gTBBZ6YGLprIVPji9MRoZuKwkrlC
         mK3A==
X-Forwarded-Encrypted: i=1; AKwUvBye/bQ9LsVqP3+x/cxJeH2HcbjD0skdT7xbkJdKbSQukD2+ncVGGil/CVH80Woe3eWGvgkaMzUql9FQ@vger.kernel.org
X-Gm-Message-State: AFq9FYLn2VDZqXNAf11JpMTxZK8QbINcTNt+CPpjuIR1tp1c7e9HOSaU
	jEhgPXB8GakaAthGsBkyrBph5jgnw1EC4KpC0sNxRBAQtCYd+Hz0c++H6XS7h7d6p4kIFip2rky
	+f/6bD2LhcVrBR8w3EFSH8X3taryDxequxzjtkMDLdBwEJvKOFoKeZcHojtXB7sZA
X-Gm-Gg: AYBFou0eiGcOAfJ3z8BLMHdc+4fi4hO1LKTg3+ETLJ9iKthXCy+FyBnusDkwxwPfqVU
	X8UmWEhmMAXNO+fk9zBK/2Nvp8Wl6OTr8OWFXf+XmWHI+r1Y0wlSVOpBVj1sNYOz3gyufigQlAK
	qOpIJhNPfHrmIyW5E/2f3rq14vPHZFkX6HYH3808hvIxq46gqb3H0Iqr4qNECvF0hV7yjLSjPUt
	TEsp3tIgbBeiqDZBBmUFzgjD90WbIB7WR//R9qpFD9ghK72eyOfgYS/QyhY6Fb9U7QphL/22Mt3
	PFXG7nKiJzLhT3BrkekMpJz1Zi9NkSdUsMsoZ6Jqr1eZRxhKYT4grn1I4yESotK9ZHs+xW77ks2
	5uabkQkHof8oYPL/6+4y0F5tAS66H8hdMRlvE8VzsxdjJqjiV3459h70=
X-Received: by 2002:a05:7301:9a81:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-34cdc0cd8dfmr1890761eec.7.1790779946342;
        Wed, 30 Sep 2026 07:52:26 -0700 (PDT)
X-Received: by 2002:a05:7301:9a81:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-34cdc0cd8dfmr1890729eec.7.1790779945736;
        Wed, 30 Sep 2026 07:52:25 -0700 (PDT)
Received: from hu-c-gdjako-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5639339sm4524609eec.18.2026.09.30.07.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:52:25 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: hawi: Add QPaCE DT node
Date: Wed, 30 Sep 2026 07:52:15 -0700
Message-Id: <20260930145215.3380977-7-georgi.djakov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yMzWOb80Yelwp-xseSalU_2SXOxa-udV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX+D8K8w4gWQ4u
 vHnh6jPedtn5tQ+Nj0cMLTIJGX7N832XrZnaCgjGYVjyXPAVHJSg0Okp7TeZ87LgrFQ0le25liB
 yvj218iXYCwavctbZ11p9xwMCXwiRsKutDg0OO+iD6amlMZzZDOrSIaxeNifxPSxTPUYsukHhXS
 /9T62aqdgMV9rWoDEcUoVT8EPj5JK2xWTZpzCRKIBt7Gh3P5nhEY1AKuYLNS8byatApWab5cQ4b
 GA3osbe0M4iT4U6JO+2sWHGeUizxjk0wmAkvoS0C+m2/UypkQAnd5QREPdLI1xzuSJBNd8vO3qB
 ye6m1eycFvWsNZlFn0DxqDF+L4Iqo61lbIc/aWnu2V9JypTfxIPARIY166hG3/Y37xSdJ1R+Qps
 WQ/1/zwbeCuy6AoHYLZR0fNjQtt7GVP78PGfviGZSQk13qo3reMX4YgcgJTy0IlX0Y0chr0D54N
 cZjP/XREmXsSUR2PnjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX3S/HeocDCJqk
 FRXAgIEVU7nacREBsTW4YpTRXjtaNoy0jpnwtRo+Nin6mHqVRoWBaVHCyZw1ZUrgzWmyD18uYSI
 B2rGN1HIXxt6J1OpfBNdaWoHbAepdHQ=
X-Proofpoint-GUID: yMzWOb80Yelwp-xseSalU_2SXOxa-udV
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abd222b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=caZMlNoC1EqYFQpew0QA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300059

Add the device-tree node for the Qualcomm Page Compression Engine on
the Hawi platform.

Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 6b0a0ff0faa4..283a5acfa073 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -5677,6 +5677,23 @@ llclpi_noc: interconnect@31310000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		qpace: compression@31400000 {
+			compatible = "qcom,hawi-qpace";
+			reg = <0x0 0x31400000 0x0 0x80000>;
+			iommus = <&apps_smmu 0x1c20 0x13>,
+				 <&apps_smmu 0x1c24 0x13>,
+				 <&apps_smmu 0x1c28 0x13>,
+				 <&apps_smmu 0x1c2c 0x13>;
+			dma-coherent;
+			interconnects = <&gem_noc MASTER_QPACE QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qpace-mem";
+			interrupts = <GIC_ESPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ring-and-bus-err",
+					  "urgent";
+		};
+
 		system-cache-controller@31800000 {
 			compatible = "qcom,hawi-llcc";
 			reg = <0x0 0x31800000 0x0 0x200000>,
