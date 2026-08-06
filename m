Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726DC3E638D
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786049844; cv=none; b=MVYh1sjC7oIDe4QSa5WPlM3XCwWWDQ81zBOmcCrpd0djr9TiLqMPwW1AigmXC06a1yhRZ+TEJTKmJO3bWPfyFhs2AQ6Ky/pHkZW6d04cafZygmxRvAfWz8HAl4c5dQeETCAhUIyxns7avoRgR+NRkKdsUm93+MnvkDetNpBimiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786049844; c=relaxed/simple;
	bh=MD5I+VArbC1H63/X/zCUsjSZIDHA/CM8wfB/bAIAthE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsPt2GbxPjAbsPUMF7ZMa2qwb/zMwxU2D/UO+fIqHz3UhBCP+BzrnuruDtYVCp2YWGg8Fatya5zT/G+wHDV8c5ImSr7H/qKntn7ZDkIbpcDbZmXcOkjYlwnuw+cfJJuiqKV9g3P1hnqoCKJrkPCSNmFw8LnBmndEoA65084xJWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXMWxeTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6VCRhny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXMWxeTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6VCRhny"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHXG32791538
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 20:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bBCWNJUB84UpOgg5BY1iXXPsRYauvBdtILg7E28C0U=; b=pXMWxeThI8cjN0uv
	KVt41gCnjEEaZUSn+V9h/n7yxFekG++alz4My9Prgow+7u1dpqvcGG0Mll5KBU8N
	YVkaHmrRM1BL5v7ZhNSMyGGrCQ7yg6UxidXoHwrCHs0tAcrtNMi5qi9nOEvy/f0T
	qjR9i6qeUsXrTQNKa52HOSz6WBDTC/BD3fSiPjFgP63opEYRYgwM+0fQGjj6VQDS
	wrK6z48DLo3KOe/fk7m5UoZeD0o+FBJnwxBAnEASh0lO41e+Rai4g4XXBzEUjUAZ
	9elfmQXehYDvdukvF0dxN+41rzSS04tQd2Qy0t/5G4Pj+9NiJCaLpFUEL7CiRHMl
	6lZ4kw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jrqc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 20:57:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso2952380a12.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 13:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786049832; x=1786654632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bBCWNJUB84UpOgg5BY1iXXPsRYauvBdtILg7E28C0U=;
        b=I6VCRhnyaIJTd/Kmx98Ku10nhPIBTeSOrIhnsrA7tNHuAcKQbNnfyOi7CQypBSFjOR
         XRmV7HD1eEFufkGATIy2ZKYMVI5b5iAFB1jQwY9UZ2IXCa/KPl0HIhoEXywzvf9sUHJG
         ncQajP6yuhxzHAP6d6SkSM2e2+vqAjEHwg1f5SmwqOaSkL3iQxyBUqJ/+A9IfGloYAsL
         uIGmEc4T0MTcShP8dAxxvpTi+OFcQkybiTUwiDlYRoUPYeAf2pZwGAyq8doE+eOsud5H
         15wLWetNyc18J2mW8PoG5JvFJ0CJ9fMaOCPt7sbQM22dNLHCM7hxMRZl8EN5pWSZsB2a
         i7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786049832; x=1786654632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bBCWNJUB84UpOgg5BY1iXXPsRYauvBdtILg7E28C0U=;
        b=WpYd9LmbB1qSMIFt+subM2w+nkvA0XRa8ZdzjZPFzOYTJCulkjVxZ3A89+owC1Nmbh
         8ACBThaXd4SSJR/5vIV1yPtuXrOb9XtEBNYTYOoV6JKERhPnkyvcAh1RP7IC3Semi9ic
         Q2CPZRbwrlJkdcMlVrUTwsngZBIcDzLVJqc85LUtjTMcukiU3/ljL5KHuNlEBRAHOYTT
         VW8wthJjGeUrxdLerOSm3u4fOynUcpsFi8dh6F3fOxeS2uoj7lj67dlhCB978+FU3CEO
         4Njw79dmeOQdkhOgJztVBoOrJWgncm7SMaDoS1IpBDL+ISKVJRa361TVSuY6F8WMthah
         2/wQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCEgyeD2d0MrwkHZcptuJteCn4tMc5mnwj0JXOARe0ktNFVTrLr+j0iYhnL5HAkUrLrk5NJRXExzkt@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNPPhHq5SyFg/VaNits0OctIOMvzDD6BreZY+cAuXblOmxNDp
	DNLkazTYFQCjtTvFA44okxKUV8sKYlU9ZtMUuiFhVgrvPmOYepqiKCFt+1fu5ZikftMZ9CLY8dX
	jzC2odZEsFBV0I+AWUki2F4lvVMHoXyIHzb6Jupyi89stB4Ta7mUHL3LaJc9ZVGJo
X-Gm-Gg: AR+sD10oz9v+QY/XEugRbnC5Dh5GJRsNwJQu+IF+vVIihLy0Ym2sy6R3msF0O+FNVLE
	3a7vx3QB/MU1MZ/0CT+PonIg0qAwa6zxNPjSIx8K5hvPoJXVccqiTlDOQZO+6sT3TgS/aLyhf/8
	4j4acTypTmCV+Sl+bAELuxZdP+LRWdEoSzPMZ/lJwVFR3vWyOTJeYiYAKOVrxq+q/Bl/+P5h1py
	QztVG0ia+Su3XfbIx7dLGS0pEswRNLpJDZcXnnpGFZR94LnmH9suuasoM92SlyThruuKDAm0Cag
	AVFRbZXfsHn5LKwzkbqhJsm5Q7YSSlSb05dLim9an6xw8jYFwculuWyO6vM8X+MRM8ryc3/8RAE
	Bjjx7yZj4U7HkK2Zg7/NCuO9421NNVA==
X-Received: by 2002:a05:6a21:3a82:b0:3c3:704d:57c4 with SMTP id adf61e73a8af0-3cb85ded954mr22189208637.12.1786049832131;
        Thu, 06 Aug 2026 13:57:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a82:b0:3c3:704d:57c4 with SMTP id adf61e73a8af0-3cb85ded954mr22189169637.12.1786049831727;
        Thu, 06 Aug 2026 13:57:11 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bc667f1csm116641eec.12.2026.08.06.13.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 13:57:11 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 02:26:30 +0530
Subject: [PATCH 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Document RTC
 client properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-rtc-glink-cleanup-v1-1-7801e4d69c4f@oss.qualcomm.com>
References: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
In-Reply-To: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Raj Aryan <raryan@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786049822; l=1194;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=MD5I+VArbC1H63/X/zCUsjSZIDHA/CM8wfB/bAIAthE=;
 b=toKd43o3cpn3nv/npS75mCQTi7r5OfqMdiI5G8BIj1R7PIQ5xV7RIwoVj1UMPgF3Qou2XZs9x
 i5Oan3QM94RCyASDrn89qABVFr5fQG+1RxI6Xurwxwi+OueBp5D37LE
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a74f52b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qoOW9mG7lyo1mN_lm6gA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE2MyBTYWx0ZWRfX7e/pvtY8poNZ
 vwvK5Mg3yy929D4SKxGbzRMlYde0wPB/djUgdmNtvRthWFbAncF5zL1UqLBgWrsWj/rVPGxHMxb
 vwiRJ2gRGFsf5104g+Lc20dlsFv6XiVDS0vEQ8g3cH4MC+v+hdQ/i2011ORAHDj2t5fMApqbXkj
 UVz45FpXlOm1ZsZ64/ZM18az6rvbjijZCfycMfqU3oKm+zMT/GmbmVVz9befz/eG0s5Qn1VxJXS
 VhiZYDomcPprBQJydztTFE7FsqVAY3dGBmipK/yHyLEilWw9I1Tn/9O0IhGU9WJXLhrSFfRUIB6
 APrRTojvKBiurlnEgXf7OoQJom/nb8IZcoOF0oCaR1NHtTo9WnQMRFE5iSFXU2jsmQX0Yhmur8m
 PHuSYLZdFduVQmx/54qb/KsbcEjYB4y4AaS6Y6fXZUB1YCYhD0RKXrXahjF3p9kELDn/Ib1dgXr
 nHvgY/oFSyb2yPUaU0g==
X-Proofpoint-GUID: KweEHbs-UU6B0f8T-pfT6C3EcxRQhGtv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE2MyBTYWx0ZWRfX/mvlZ03wI+N+
 9dVZZ4WoSRg/Zu+EXQAuTm1FZJV8r6HvtE4vbFo73J18FoYq5T2XTDIyFR84Ua6w6knGXUlMTsl
 xU2rlNQORqlsKYuGSgoXQza6bkeaQSg=
X-Proofpoint-ORIG-GUID: KweEHbs-UU6B0f8T-pfT6C3EcxRQhGtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1011 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060163

The pmic_glink driver can now register an RTC auxiliary device on
glymur, whose PMIC exposes an RTC over GLINK (see rtc-glink driver).
Document the allow-set-time flag it consumes from the parent
pmic-glink node.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Raj Aryan <raryan@qti.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 16ad4f5698fc..38db1ff473c0 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -79,6 +79,11 @@ properties:
       - const: charge_limit_end
       - const: charge_limit_delta
 
+  allow-set-time:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates that the setting of RTC time is allowed by the host CPU.
+
 patternProperties:
   '^connector@\d$':
     $ref: /schemas/connector/usb-connector.yaml#

-- 
2.43.0

