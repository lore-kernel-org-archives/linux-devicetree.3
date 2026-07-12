Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07B02FE042
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 17:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783878532; cv=none; b=Jptj5pk0FwWhfIElzkKxLSUC38UWJR4lWMljTlE79wF2k1W/byoE09VUcHROlw5o4zhQJaqle4gyNrrP+emUdegv5lFkpiMrK0ego9hjx6sohyt3kk7xDWuTWkWtXkLLjmrRp8iDSBdcEJb8zERKvLO8f0inVvaWi3CwhCxa7VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783878532; c=relaxed/simple;
	bh=VJcjUXbtX3f4WSQdzSuuHqAJhBkkCn09H/VEJXL+J0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rw2i2s7C3dbwsPKyGjA7FWhuY6nceURkrtmPKyK6pr85TdnHiYcj24gN3GQVZPhpdTHwqsHArZSlUkEUXPoPMIe+Gs3xIyM7gZlBJJ+w7zb5pXaEg8KA9Poa/S7yFnQBO91+E1+9pDi3UG9nPgV2hTD4dZ5qWPF4iCnsKJHZD1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPHzvXwW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NX/Lygjt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPHzvXwW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NX/Lygjt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CGrnbd3105593
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 17:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uLI6dtiwQ0bBLx8SDV3mto
	Bn+506m8hldEGF6Ztdkm0=; b=bPHzvXwWiaAKVPDv4ta2X8s+7mZHmGqHl1mNAW
	sNuFOsZt6vXR5ArVIUJGgLE/npraVV56Puf0N5SahII4H61d+Hivg7w9Z8lYYzHp
	kwO1OIkhVGTwxK8K5Cze9irDIoVpFjnIU3RlUosxEL56+8TQjnRQldu9SakfIOP5
	rwFLAfU/gLdpj7miQUeJMwqqkiirpdDDIeZI+ymrx+nmacoYC3xjAhK5mDvt8mJK
	wJu62x7NmW2gSPJweNaPeAnhvEII2T/Br0PXPH+A2AGHRFMyLW1FidB+QQqiMiew
	iypx92G7eB+nh0TkZf2UCx8L3aHRDiSGRHPt1jHKVWi5RR1A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamu9aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 17:48:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so3400609a12.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783878529; x=1784483329; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uLI6dtiwQ0bBLx8SDV3mtoBn+506m8hldEGF6Ztdkm0=;
        b=NX/LygjtITSMRU8iAYCDoXIaCR3VoyfLMBP7R5SlpZtJBoUUnVoXX2sEcvegZBn0G/
         ixzfPj1Z4ZevW455Q9wrqVNgAmTFqpOiAQPES7OK8/MYaEXW6hFcRQLM8anF3V4eodE/
         fCHkRN2cuWkIXmHYBz36NXmuV0KX2KU82LfKC0+vx+LSciq2SZpVhYvuAy2gWcvWzrFe
         nDbTLR5RDHJ7HNhJRqroZRlVkprez/9McBLKpQSB9WfGpFAdWTOl8iZgPXBVTOENxB6W
         KQi+vF4ewQC6kRK1P5ZysC5N+YyrTiXDf5ayg5aVZmpjkJv3MUZlnpUx89xO6wU+fpZ+
         6eBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783878529; x=1784483329;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uLI6dtiwQ0bBLx8SDV3mtoBn+506m8hldEGF6Ztdkm0=;
        b=OiVlPdE6uz22do8e81YuSNoTkQDFCDQCuufbFizGlzUI2aDK6FBbeNMptqkHBsTBgI
         FG1QUiEqBZdQnhRLvCQdrobdxuU7y2GVXx35xoc++1RvW8Dr2ll9ZM2TWQt+hxSrEHwl
         ZevhWAfOA3eaSyTPhWmxD9KLCRlxTKI+wvIWdpQbs3NITG0kXwiTU6QC7vvXJR2RboLO
         8St99w53++Y+wG5bIt4QiencJmZtZ65flZRxEOch40Nz6LD4yu878HeU0t2TNPdfm8WG
         eUTP5h5ImF9/H72N3iEdnNiMDmyXxp+QZzF9Ljblh6u98qGgCqQ7fr6hbObVQupRmyig
         8mFw==
X-Forwarded-Encrypted: i=1; AHgh+Rqg9HSjUY7O0c6yi8/ywrzPEiB0NRVofcUsDqwI7Xy8af4L4vpyUMqkAChtMupxNBgnVoY6g18Kw0g8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn7p29Ba5PENjm/MqnwTArzAWOJB6LRydgJX4rjxziY2r0bFQr
	Vf8ClO7ar9kW2Z2zTz3V584mdcCZejV1uN6Z0NHWbCGWfzLuEg6k8XWw49eGdP6IS1F7Y5O2s5E
	r8p+hHVQi08e9mjxiGz4mogl2c5wqrJsH3bX2e+8oHwUdOA0qGGcQBf3V9T2ly9rU
X-Gm-Gg: AfdE7cm1l9IFrrKdF0evGaVJy7pxoJqbzLMbwM5LRT5/kC7tG/MlpmrHAeSHHfYpJwq
	xW+p8zTbkZSYqXbVfBEFvqxieEdYcx4v8gIN6CyPFV6XZE/nfg6IHa+cVy3O9PRGZhBqbr8W0we
	1pgOyEZHrI7z9z/cEisss9glUwfNeNwZvckRv3yFCaRZGXGT1+iaZhYU8RbxdLF8RXhioYgo5lS
	h2w84BvPtMwHQP+LvykEE4qa9UmAUrdd8DKnkwjjzf2EcQN+mmHEugQZ+ljbB+Mhb7K+qYEKxJ/
	ttGyTWMaYStwv4nJg0Eq+GZayD8JRIyydwrMOydDpc3wy84AANhc3HESV/269bttDU75z94OLeU
	WFkVO7gWHMa6a6hJAfDYS83Db2ouOztPCAKKg9OIFNJNGkSKJS3k8Y4ngVADU/bJCfkI+BOk5n5
	UcfKfR
X-Received: by 2002:a05:6a21:e584:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3c110a47008mr6050710637.16.1783878528659;
        Sun, 12 Jul 2026 10:48:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:e584:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3c110a47008mr6050699637.16.1783878528239;
        Sun, 12 Jul 2026 10:48:48 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b987fc629sm10369954c88.0.2026.07.12.10.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 10:48:47 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 23:18:35 +0530
Subject: [PATCH] dt-binding: qcom,snps-dwc3: Add Maili compatible to
 supported device list
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-maili-usb-dwc3-binding-v1-1-fd6697fa1e21@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHLTU2oC/yXMQQ6CMBBG4auQWTtJKSjBqxgXTDvib7SajigJ4
 e5WXX6L9xYyzVCjfbVQ1hcM91RQbyoK5yGNyojF5J3fua72fBtwBU8mHN+hYUGKSCP3wcdWOtd
 vG6ESP7KeMP/Gh+PfNslFw/N7o3X9AFp4o1F6AAAA
X-Change-ID: 20260712-maili-usb-dwc3-binding-9c2d4b70953b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783878524; l=1581;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=VJcjUXbtX3f4WSQdzSuuHqAJhBkkCn09H/VEJXL+J0M=;
 b=kinRlM8Q7KyFXC9K6ofEAUKJd+qvlawCj0u78m9N4+eSav+8r9Lm5D5HhISbJqmQiXoDsRsu9
 CqMxIbUPN+OBWwPTsH3Xr7Rh5m8YuLLtcWXehZNfC3gqmEFIEcaIUS2
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE5MSBTYWx0ZWRfXyYhF/ZB4rYY+
 ogufH4325seBZBCCzTZgtK+LpugrB8T6ph7FSDPk15hHkl6UVHIkK/saALfvIJVIIYN/DNjP5dQ
 Lubly67Xowbht+cGHjWr46SMGcf9CC0=
X-Proofpoint-GUID: WicNr3uLNIzoZ024_aeFnWSrAeSerTPV
X-Proofpoint-ORIG-GUID: WicNr3uLNIzoZ024_aeFnWSrAeSerTPV
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a53d381 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-cuiU98Imdfp90X4gAkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE5MSBTYWx0ZWRfXxTmy5iQcHXjq
 WJHJeFEo8eQ8hjecY4fz0ZNA2o3nyJ88FrV6Jf6tVEfldV8XmvcrCCF9c0F54zsLydI5ZYUh3TE
 3mmNxkEj3gwrzESLDT6gHBBc47yb2Cg5Ix/zoyHVgt0Msd9CkWduhDpV81FIe2kE+L717QsTEqX
 YCWjSce8rflueR/qvcixcUdXyU5yotxxezDaufqb8LCEmkD/yAcwEPH/d0as/hUxzHyBWqpZWhN
 7Q9MOqDYj3pkwjC1auzKxoAJ9mcwvppn43TpUmBrRS/k+D4VOeJV/2qIBhSkdi3A9/4fJ5MV6Cg
 9Sb9puwxU2QOZHT7mayOn7KNaJ8jCye6WdjauCruaelWT9qaUKm/k56INneyXlpAH31iqt+/xP+
 m+KpLuOW31I1tLb/K71NabSXxGHOPDAnyGE4Oh2ACX3YUsXkYSo1+Tfde74DFYhCQzDk1WYXmDg
 Pawi85oUy/EPf+J6oKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120191

Add Maili compatible to supported device list. Maili has one SuperSpeed
USB controller.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 932d7aea43c5..9eec07dd33de 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
           - qcom,kaanapali-dwc3
+          - qcom,maili-dwc3
           - qcom,milos-dwc3
           - qcom,msm8953-dwc3
           - qcom,msm8994-dwc3
@@ -208,6 +209,7 @@ allOf:
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
+              - qcom,maili-dwc3
               - qcom,msm8953-dwc3
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
@@ -546,6 +548,7 @@ allOf:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
+              - qcom,maili-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3

---
base-commit: 1db5c6b0b9834aee2f14e39764becfcc29d09ccf
change-id: 20260712-maili-usb-dwc3-binding-9c2d4b70953b

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

