Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D772BE7D1
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275989; cv=none; b=aHy7gENRi4Z+2WbLGOMGd8RgDV/c1l8ue8Li56BCMaiO2eb7M6PxNSdVLcRIBGT6bqEolT65tULR783DjYRs5d1k8wMu7sk23xDW51ZzesaqPsgwkg/+/qsnOZCpMTNLVFfY4/ot2VqSS1CJYAbBoor+5kiilem3m4806A0Tr98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275989; c=relaxed/simple;
	bh=Xi8+8vBpk72pueSbcHCY6ojLbswdddkKT2eKqWSkDDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bW/wTWWllUkTc1XvYCM1tzzVv4FVdL4w12aKsln7EgF3xHNiXMfGGnValEMD5rtuTIvMDHDnwG+uHvHZTWt52cx6pI4ORjPrXgvsE8zhGsAaMtF/BlI+MRIqOAvlnS3KvF7rFQYs560efaLjmz3C+iErKWEGA4fmRt2lZBr4lb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/Sg34Z1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e82jQ2IG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/Sg34Z1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e82jQ2IG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648JdXIT4041447
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 21:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EkH62hBfkTl
	pUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=; b=c/Sg34Z13JGJrprRrYmjoW2KJlQ
	nCxnH11PY1RZxiTbM0zzIVYt8RPK2R8OsqE3yXy9T+7j7F6AxI/Rro9kd9ykKMKc
	YoRbKHx1d9bHmtE12dRvXrJelcfehh7+DUALqp+rNnazYV3vUjZrdkOg/tcnbpAy
	jKSNKHHvdJ8MyqInASOa3Mcg5vCQ0z3XIsK4P/k/4KnrOeWFl+8rl3n6eiFKWnPe
	PcAG8nDbSOF9qczxOWoF5P/Z5WYFRG3rv0nHqyxanxRzAMNLXMmwCbaPYaaSo7xj
	arkOyg8d65PJkKf7dtzZhTCrJfJXKDeHsBLy25HRdSDpLi1w8NiGcQcpVnQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1p68r9wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 21:33:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee34588671so3618757eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275986; x=1778880786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkH62hBfkTlpUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=;
        b=e82jQ2IG3cyhQRzdLW6t13O35bHoqkU2i7ncnMpIvvQJjjHtKoS7NiD3PTAvAW10VZ
         sVKBJED2xSc/UHbKHt3Xnw2avW/cEQtzXUPiXcKP1IWNdSDvWvymq9PsFZna9r95MIKZ
         pktuwlEezYO6I49HcY4JAxcbCtxx+32DwkvKMWMsvo6maHvUGxYnK0T1wJKQu09jhHvL
         LN9UGz5eqcN9EHWzHjADm/QtU8DmeZuSKAtzrQ2ALjySaCI2LyTmw9Un3ggYAhlC1mDm
         reCnq2c3TP/gJfjHFmXCC4gQ63VGW8jMVOSNKJZCjkS6A5ccPQzrAO0TiWCLf7cJwvXs
         3EAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275986; x=1778880786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EkH62hBfkTlpUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=;
        b=s9K0i+g/BWbfu9/iLnXtwydjbheOS0aGe6PeUjGOeXqNDW+0HcTW/m9XD2QIQXVN+n
         0ftUdaJWBWoB1OjQyASymYBNIZtiXEIYwHvImPg4B7Gve7S1ISET08jI9dIxyMFTQCBg
         xrs7Aed1N1pBoYC3giexIcNGb25CEXmbe6vDXV5iv/iAYrry6Q4YZMIYPP3MB1y78ags
         QP0C0LCMiTPidOFVIf5jQ4a9zgeyFMJ8Ol1ANH7J2f0aQDGEvStja+9g8QVFjHtiWdSB
         jO35r/uiUBntJ3GTTx6m97T+ZlpInaN+UngL7iCzTKcPBxiWUx5q80RBoWrQ5YexpgY7
         hlYg==
X-Forwarded-Encrypted: i=1; AFNElJ/wDl8XqS/z6E6RqrJVg3J7eFQ1iUSMEKG42rbnjukaKRyd+bkleztQgIztwve3GIuKmaxGvFTzg1Ku@vger.kernel.org
X-Gm-Message-State: AOJu0YxI3L6bX8kv3wa6yH2insTIGmmlW6bd0PamEUkBISYHwiKPNQ/I
	GVhTRqe8Lt7fmoQ8DT3Geg3s2av53KKYzp1vsAytkRCuB/Z03JDT7g00GNxxE9EHcuN9C7fx5rv
	90NvgwRaN/KgFJvyPN4Oz523CZhByyg4rSgLjpmeT94Nil4xQT+4x0YNXSsoZYHSJ
X-Gm-Gg: Acq92OHAvQsTykBPIee33a5dKXgz29XqVdEgw5h5ETFO17NgXU1yg1DckfZJu6HDd9S
	c38GMjtmEVFxyckVhtCdlnXnlxdKlzy6pLxTNDfvDpYT/gB3gZ2Lhqb+HYg+PX3fXqa9Jm0Vw+M
	ZzLAe4TaKg1nOgDBZzJgepfJ4KXZoKi9F96hDI0W/ZfOJeSH4MNJKTSwat/w3pf2C95TT69Przs
	M8UHYNNIsXP7Ix+EhvFQjCEAZeMws0Kb6Do4DRqq2OAG39leHx0IJbgjEtd7MRIlmH4UAXv6Tjq
	wCA+W+NpFXrGJmfR25P2A3+kEeCWifM1V4dqJ97pkIyvTgyANe8KitMpQ8i1XkLxRHFdp/x6I5c
	JMSb5wtoIQYltB99Z20WunoNN9h8ejHdpSOLv56977WaA21Cf1ZWBgKJscN80EmRXCCdSohkdc/
	A=
X-Received: by 2002:a05:7300:4313:b0:2ed:e14:42e7 with SMTP id 5a478bee46e88-2f54b068c4fmr6969111eec.32.1778275986125;
        Fri, 08 May 2026 14:33:06 -0700 (PDT)
X-Received: by 2002:a05:7300:4313:b0:2ed:e14:42e7 with SMTP id 5a478bee46e88-2f54b068c4fmr6969082eec.32.1778275985563;
        Fri, 08 May 2026 14:33:05 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm4871285eec.27.2026.05.08.14.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:33:05 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Fri,  8 May 2026 14:32:33 -0700
Message-Id: <20260508213234.4643-4-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfX+FXQvv3dDg0Z
 B5hasHXGkwUjMzcoC9xFKlXS3iBHRAZA+qSFkzcN9fzZcRBSsCtAOW3hWbW4Njzq9tl0OwyLRTZ
 vRG79G6yj4q/fMBNFyqQMGiRNP26yBuylrDErJ63yAb/+SesMy4wv1B73vqKQ5UVt0xzfVM9WkR
 l/ytTXXuuxoXHEU36wsv58j9wbkhMmsf42x+FvaWMsGmO7GkFhAuuR3zJ4HSqFtxBb8885pHzee
 ZSQ6p3Ou8Q1ltcDRr36WynlqSkPg8X3ctBrLOOpyjuQbO8zVC6meyJ/yye8arplWJ0G0g38eoeG
 of72IecaAD6JhmSytPh97CwQrc9mFvPePMRkQTWEqxDBNcM4VlWYz67TOI6id7cDr0zByke4s8B
 uq4Aoye1xAU6/l4EbL3sF7h23b8fV8m+FH8NeNQo4cXp8yQqxxn3WCNuses9jdweAYvQr9+ruiu
 mBbeepDdl99+ikM7g5w==
X-Proofpoint-GUID: kfsssJAq-0nQfgZ5Ro2H8WoxYFFXu1ut
X-Proofpoint-ORIG-GUID: kfsssJAq-0nQfgZ5Ro2H8WoxYFFXu1ut
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=69fe5693 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6lSwUGAo5LeF7p0M46YA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080213

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..2d10994f7b44 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
@@ -203,6 +204,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
@@ -540,6 +542,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.34.1

