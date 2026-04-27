Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0463A6EEF
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326164; cv=none; b=PdnybdGoZqflyXu+coRjiulMkPmvr9CwgPueY6DBNSvGLDgyMNX3CBbQoi7Ld9g/EDkHdXi4SCA4TYrzhDvMPBfyLTpZ5clQ/fHg9q83+xGtD7X0ICH4/zo1AFtASRdT91JUxZc4opeyDciCGDxYxiXSd1nkIUyD2D9RA9K6vJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326164; c=relaxed/simple;
	bh=r7Z52qBn7Oiq3+44QCWlmOdEnbJHHdtV1GjdHQai3oU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vk5CU4ewq18n66GlNcKLl+FQF4gpPeHEN21ikyWXPt0O8XuvE+FOIp2DuBGn0xXGriv584GvZVP7uifIJ1f31iRvInIECludd2Qfxu/NbBMX2I9e7BuVlmJULwDxsm+N8nYQuoUZJG/qZUUb9rAwwORm1V+A7rhTrFNt6pLbOm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5WrC9JW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgdBfA8L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5WrC9JW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgdBfA8L"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJ5RRa429177
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ecNTbhYHuyh
	QbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=; b=b5WrC9JW7JAMcr3KVwh989rq+Tp
	iPJKEqxKBpznej42ftjhEOsGDsjmwmyAvL1mPKfspVYQ04bGpMX9p+Vnd89xO2ht
	LF7aRVelvKON9i4K4J2S6o/M7v13F9i58VGZBPJ1kGHt2Ca4P6ba33HugRoezlbP
	YFfMLycar5ffs7rNdXCbdtSSoiMWtP0+oRup+9VEBTrb0lAevNd2KudfP20GCOnn
	blcbntJvAwr5coh6+x6FJqxwClUKKj8ImpmTt8XTA92sgciHHC5qZiqiuTdAMgEF
	Ie75FJE2d163MEZfRNwQhHGAw6b9jUVSc/qW18dNi3Z25h+GgZg1tuu+0Kg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x321rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:42:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so14822459eec.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326161; x=1777930961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecNTbhYHuyhQbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=;
        b=bgdBfA8L6ZlX/jQpUs5BeS1B9SwkNRMEhQ38RYfEYiPYSifdhG1L+pwNyHE7eokJtp
         vXS5yWEY+0ViHhtr3Gh7zjzsuBADIhee+b/IeydpMCyWk0bUEQVLXn8vyKw6at7eGcZq
         swgZOIEdDss2yM7xtizRnY3dvtER4i1/kpLdgUzLH3cd5xADkubuC04W6WcqESSMrNpz
         dv7oQlEPiymamVH2KLXMBEwuiWa6kmAVHd6PHhIn0SF8b+7weaFvGAM9jUGV3zv+EqF5
         sgXjdUYNxM++H/ENTA5Y+atc0CK8Q3HICzuUWHZW4MCHc3acD4jquc/AetfXw7eLd2Wy
         GIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326161; x=1777930961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ecNTbhYHuyhQbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=;
        b=eWsanT5sFlCXSXk+vDSkwhRWLwL1Fvyp5hn+QL0aRJHCnLO/EbW1bnR1PTaFVahNtK
         q6A9ieq7gfGYrk5/jouGLjzQmzTMNYvNEzJXEc1JO27bL+5jGX5qABi/3U87uXeMes5L
         8duKuonl9bdQS5AN8i5UfBI2SMfBPbdKTILSFFKaU5JNlA+xdpC0ii3T8YIPCj3WycbH
         PkO/tuPFaL2qyAF42BGFiiWxlP9PjbYtNgVQZmkVXssBfZyqo+Tkpai4lv2U7kHAYX2j
         1IsGh2fZlDwxQofY3K0eroVNoiNKUt8NPWXho69SYcZdOQ9bgLhU1TPL1h+X+FeSMGmN
         nBhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dVjDktCkBjkHeOVxgL61kG86Agw7aE1YtXPB2KIXxW2zV6McYHmSNCrWwZcP51szlqjpkkYZjlFiG@vger.kernel.org
X-Gm-Message-State: AOJu0YywA6Wa+1NqhbE1iuBKy4A9qlDIJHQPIm3i85u1gxGjUuTLIRM8
	mkmfYr5aY+FBPq9NX/eURZ4OaAp0S0FaonR8LyQzGYExDpgLYlwCtPNrD+ZCLPTp537MSh/XSlP
	vUv+mQi3WjjYPGg1sqSZfGcyClhnpNPKdTjuzB3hlK9x3NpaA/Zhun/LOTPJaz09E
X-Gm-Gg: AeBDievev/5ut+DjJJa/vrYOJiMCdH3o3HAGdQWC1NDeCB6LWpVUD8T8JGp5hNwekMc
	aMUozrWMOK8pW8LyMJ0IQ6glQV99eDZFsfXde8vKy3fTI/FLcpNy1VY8pWc0FvWGm0wDvxOtPLy
	FkZRRAniLSWfTSYRNiOOSEiXjN+eQWIuq6aemI16TQ/wxNFWljjZnzsXYshX0kmCQAsdH1CEaIB
	1+zt8c2jG5bRLKWRrSw9Rf0kDvF1Oj7Aya9xm1M53P6Krhwb4o4pLwV1BsDoAEUZVndrwJNX9Qy
	mU7taOFyPXLJl9bvLuDPdMhzNIpctcZTvNzQpYUE85l6ykkD/rMlTXbNxfMh75s887wfmbDzIbo
	JMPmjMzEKUPu4+5MvUhCm0x7UR5tZcEGtEw+gYQOZFZrtuMlKMWjW3zAFo5vSerLl5S3RdyoNBn
	PLNrvtgbwxxQ==
X-Received: by 2002:a05:7022:1b0d:b0:12d:b8e5:5d6 with SMTP id a92af1059eb24-12ddd995d76mr319169c88.24.1777326160474;
        Mon, 27 Apr 2026 14:42:40 -0700 (PDT)
X-Received: by 2002:a05:7022:1b0d:b0:12d:b8e5:5d6 with SMTP id a92af1059eb24-12ddd995d76mr319153c88.24.1777326159951;
        Mon, 27 Apr 2026 14:42:39 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm653119c88.2.2026.04.27.14.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:42:39 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, ronak.raheja@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
Date: Mon, 27 Apr 2026 14:42:15 -0700
Message-Id: <20260427214217.2735240-3-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMCBTYWx0ZWRfX/cKyUOlBR+Yp
 zSOYu5t08cO/4F5B5l62tcREFR9ZOqdCA3EHQmYJ7YnWg5Z2D67QfXiaaDcB6pd8PiBOhPEtfR5
 Z59378LH4KUWxZ9DgRgD5doFd9gE4UxaYynMsVdyyaixl6MqKkmKtyzfzN8Fw5wY7w/7PFQkR2C
 YBJmnslxto1qd51C9axVMXJKwOlrSAPSh9aL+n58mm1iJQDArZtFQwfgtaaZwuiYdnLjrbUMT2K
 l1wh6cu8SsyyKEPUyDsWMNYKTdm29ZHLCTs9QN5+h8ibPYBW51VKD1j8DK+UfK5nza26qS85h4b
 NyqFMoA/62EVksdKf39ybBiJsUMrA0vxdwbBKa+Kr8ZvertraduNcAOt2FDAdpP2jOCG9YPQXX8
 OPEK05yIUOTQdlCzBGXrFiaRtwdYwkmAzoIOcNbMG8fErPi9MErJnnphJQXYUheBfhWR4jr9Dhx
 YfgmTIHnScE7M0LFQSg==
X-Proofpoint-ORIG-GUID: BtHhS8vgIJ2t3ET1fvaaEykkNQPPZi3s
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69efd851 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=vC2bFTPnYnLVIQvTftgA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: BtHhS8vgIJ2t3ET1fvaaEykkNQPPZi3s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270230

Document the M31 eUSB2 PHY for Hawi which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on the Hawi
with that on the SM8750.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index cd6b84213a7c..c0e7e2963ce6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-m31-eusb2-phy
+              - qcom,hawi-m31-eusb2-phy
               - qcom,kaanapali-m31-eusb2-phy
           - const: qcom,sm8750-m31-eusb2-phy
       - const: qcom,sm8750-m31-eusb2-phy
-- 
2.34.1

