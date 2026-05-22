Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFBE3672B1
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472965; cv=none; b=pTiJcKKmXOqBZP+eZOedhplqsaLL+pc9CvhCcl/7cPIT0hfHHrXCG0jt4wBst2RcQCRv5ktKYJsoolunPtMrPA7QzrefKEi2o150eZIq9FsWzkNwmKM+CrkJ0Z6IJFCaP5ZE9c+EkaQnW6cbb8KR1mK6QKyacaSaCS0hgt9Y3oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472965; c=relaxed/simple;
	bh=TnKOE7unCT/HQOtvafKdSU3ITE0Jp3sab/TyCby1k78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S+vt42SDv5xaSLk2ynoRtJg7hzP4p/IEPALAoW//NunTKgX5tZoILPkkZMdS5CvbOOgeYvxb65FyLq1KoBX0pBJCAdTbj81vszGMeR6jy+uWvaVlrtt1cJ5N4cuEr8CdcLLV4U3o1+hBX0T3YQR8L8Km/mIe9nodFAkruwRx5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/vzTRd/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9uXzLkX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/vzTRd/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9uXzLkX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHfgDj3601306
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	64LpLRRJIlxMY+JNBOraanlo/l9X9GJFOflyXf+N9/E=; b=L/vzTRd/DLlC2VXj
	pp+P5XTwaLPjttc+nI5EG0GgjUHRWO2xtpXUjdFq4i4YfO3HwN/keSWwPZyiEhTi
	6HFtrMqi1DqF62BozVGzayX+2iXqemx4UbDvCKBr0m/JW2HNVxJXOhnc7ftYjO76
	BiAEmHeiTUeuZA1itw3pgKnDDqIWaBTQCuzJ8/fHitHT8+yx6HTeGO+lN9c295LM
	4ueaSmMAI9mv1pxK9rAEydcCRqCwCWw84DYSlrypeohLMP+nHXdOaRTqRdjKQmL9
	GtKyqlVRpNDmgwsOpVKWYUhfl79RVjxnGWXpc4MD77eirA8k8Sl/rH3Pzg6W43iG
	PBSsDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaury02sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:02:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bdaf8567f3so54021245ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779472961; x=1780077761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64LpLRRJIlxMY+JNBOraanlo/l9X9GJFOflyXf+N9/E=;
        b=d9uXzLkXdV63TYV2HZium6LJKsEueKomhp7dShf3E3HcorCboG6WjdsLmYcieIbs3i
         0lRUI6sQqkwtTCiFTMHHv8zlWWhxiKwZPIH59uMgaK4vneHaJ9psQ5vnyDVRa2ONecZq
         tPmd6bJj1rprKY2h1yIthGWg+AmkgYQIAjgmpg86oci5gKe95Tys0/bcGyuUV6fdAbT3
         y6HP8BSyoEyW5J2qYj7JJVcfY0oImTiOYbl7XTfQuu2eEZTmOxGtjkobkDbqWDkTo3eV
         GjZw0xDdjDRzwY2WzZDbB+Zp4txebPVCQVIQw63qnHNNkM7wzHit7k2/G+DawMOcM3rR
         icFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472961; x=1780077761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=64LpLRRJIlxMY+JNBOraanlo/l9X9GJFOflyXf+N9/E=;
        b=AdjPo5B2vrPI1+R0+deho+auuBjqlyK8BZVNc4l93Vez4b6MaCNqYJBOfZ0pU96lYJ
         ppftSaPKQ/q2msAE63q2V/NZfSy1BrMBB402gj1KtLfFkPPiQk7g7kN0GqRQQ9c8/Iwa
         XzGOOH+dpoqUW4p5XgN+1XkGr6JYnOTOPrkaekRVHLf90tR2AdW2Ktg9gv2sGiG9kqQV
         iyQpTJ1LLrAJN2FP8gCuu10yEmH5t8TorL79KE8tN4LkKJ+n3v7ol9sgAz+4p2calsPc
         Rj4sZ9WyfIGKz66QY4RUHrtGqF8neiSfDQwlt7dxbXD0SXsKazWSWkqaEEpJT0W50Hb9
         RFng==
X-Forwarded-Encrypted: i=1; AFNElJ+R+aJK6ngeTQkVc4bnNPKhdxwl47lePEgnKsaPqUAuFtMCRB0uIoWUG99RL9RQ/gjq7miPCFsIEVMv@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCaxErGDTt6C2xLwewPD2dd9c+GIm2Hc/edOnNYD6O/3/DZ5s
	BzdHOzUE0HfhlNg3tAe+RSWU51iJrbI/b5mrFUcsA74ElWZKJdW4lZrvmlQKCrsrsP9CJqidKg3
	IhmLSdT2L8ZUSLRgt1Th1HjVT6l8Fv40dbGRaH7in53b0TYOVdf/YI/0ulH70dx2g
X-Gm-Gg: Acq92OHHJWGGAqLrVcbsvYF6inonHxxVLLlne73twYke8iA/0TzhYyWBp0xPP+Z4t+5
	YvAf+MotzlUi1tXumhyxzR001iVovIY8cM1hyemPq1hf8dKJ1PXg3Sgu1IvkxzyZ+0Uw7XdnhXW
	9WWiAxEKyzSUEjbpcusDhAd8+1bUHiRjLeYjCEJvGXk3uLm5OIyK4GYb+fxlgq0aQfj8Oe6xln1
	qDOsYnEYMhyNGNDcmoNtIYm4Y+eZBVOzmjTQuwqPEy7ulSHCpZ8vahSzP6VTP3gqxcwoAi3o0Mi
	uqvg7jjvkcMS1lfaQusXUJ/0jSDdcVyJL85rAXOOIVFS3MCbHiCVrGRRD7fsxrjYrktvKmcI1FX
	R3VKseHi2MkmbhsFSlSSkCIxetZJjFXehM5Vc
X-Received: by 2002:a17:902:e78e:b0:2bc:977b:846d with SMTP id d9443c01a7336-2beb07b5161mr33830355ad.5.1779472960531;
        Fri, 22 May 2026 11:02:40 -0700 (PDT)
X-Received: by 2002:a17:902:e78e:b0:2bc:977b:846d with SMTP id d9443c01a7336-2beb07b5161mr33830045ad.5.1779472959931;
        Fri, 22 May 2026 11:02:39 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58ff106sm21193645ad.74.2026.05.22.11.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 11:02:39 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 22 May 2026 23:32:24 +0530
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-shikra-dt-v3-1-80ffde8a3dc4@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779472947; l=1681;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=TnKOE7unCT/HQOtvafKdSU3ITE0Jp3sab/TyCby1k78=;
 b=lipHYk4WInft7+V0GCh+adx+B5S1zW0zaOQCUNgDx1cFqTwFKxvaTvPyDS1IpBJ4n2RGHCZUq
 DbSRO0zd0KqASjomeFsYUocpU55FNf6eUK8ZW6IDjIFp/wuCNEdpOU/
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE4MCBTYWx0ZWRfX6iw5WvvQXLoY
 E02I6u1569+bFHzL1jMuKq6kGsnw0AW/VmMdpp94Hc3NnauI5zgfjxL+BfxcoLN+VXBMNwgmga+
 BqlZPsvknMqCnlmfZJTKPwVLYk9eiyECHKWdq6MqxIPZWw3R/UT+RV8H5vlVdO1rD3hkiqrprO1
 HDS6eogXfzPHEKp7dY338P/S55SMSvfXyiXlLqeDkvpW137S6J/idy15c/wO0XCyGlTiLi8Gflw
 Gnq8qAUEnuk39ryP7a/gZxl7+ldLMqkvDjCJ7pIfCsTy6TYFYvotwQxvYQqOUXGys/OT8baYPgc
 L0WhZxZ0sR2aCw4C1sxNYhSx/glb2HCmPnXlecED56byLI1RsrlCFjkVMzYWo0R9sHmwediCANs
 giSU2qzwXtYSojDnNH6v4RUIoDoNsqZcQlzGAsS1QEDL6plAQXThExIqCE1BP2G0L+F1U22TOnY
 P3luHkfSH4T3dj3+7Vw==
X-Proofpoint-ORIG-GUID: z8naCvZLliHY05pM7XZVbclJg52NknaV
X-Authority-Analysis: v=2.4 cv=d8fFDxjE c=1 sm=1 tr=0 ts=6a109a41 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nhUW8Zqzme2qF2hNOrkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: z8naCvZLliHY05pM7XZVbclJg52NknaV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220180

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

Three eSoM variant are introduced:
  - CQM: retail variant with integrated modem
  - CQS: retail variant without modem
  - IQS: industrial-grade variant without modem

Each SoM variant pairs with a common EVK carrier board provides debug
UART, USB, and other peripheral interfaces.

Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and its
corresponding EVK boards.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..cf7d241f8107 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -989,6 +989,24 @@ properties:
               - xiaomi,polaris
           - const: qcom,sdm845
 
+      - items:
+          - enum:
+              - qcom,shikra-cqm-evk
+          - const: qcom,shikra-cqm-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-cqs-evk
+          - const: qcom,shikra-cqs-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-iqs-evk
+          - const: qcom,shikra-iqs-som
+          - const: qcom,shikra
+
       - items:
           - enum:
               - oneplus,billie2

-- 
2.34.1

