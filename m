Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7092B406827
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285276; cv=none; b=roGwfupAI9c7rZ6bExP2lxAcoNEQB70nP6po5bX8uQXsVFCHBVnBgjFnAfB9vZh64DDZF6FXUG2EqU9KnzVutr6mOe942T07ICqx3AbCiu8jgTWbLjsDjfw3qBU1rvmVcKK+ZJEj2XYZ49HwVIZtp0Vpv5BQLZwYhSmp09Z17gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285276; c=relaxed/simple;
	bh=7BvGgsMzIym3cFm938zERz/XKsgQcAutut856Vu3XHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AC6PETre4c9FQbVA2T59sak2Teu3d1VXn/wNCnRqgNSYzImELm4fBj30KP0/+eye19XNXucW/vGn+g2yJjlxmbp/aTCDts2Fv2nnHhbh78oZ8ekuyD27Dtjur47Ellna+UL8itUNMrbLQFDFd5yLHuP1Opgf4JagEE6O4qLfOTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8i5Wr47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+BRGMG2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8i5Wr47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+BRGMG2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGSXUu001362
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0B3aL8wANNFMcgo2EUByGJXGvJUE1R3H+briV1PRdNw=; b=S8i5Wr47700KpzIG
	cp/cdtfK0IUskhEYqG4UEm4ShwaFYiJIFzMfif06v/xIx8d9evwFsWeNGlnckidX
	VRsZXxmOcpVKoI8GJP1iRhCNCKqSrVlqZc/Nzpi5Irpvf1C99Ff9ixoRduVGIgrG
	wSP0H4Zs2jDvMFeL2VlyHTKdPf+6S6ftDEjaAOxO6DwbLcgg5/dN5YfnUtmr8RET
	+zDJUmLZKfQKK0j12mvbbkTmC3eAG7RHVpFlacZzOqnymgUEjph3W2z2yhqKyx9R
	iGwqKblizRlawLJTCOXKqLmpLr+q9rEnUPiqfSvL2NHwwdoVAUb0PUHBywgLehcJ
	edkYbA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7mcx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:27:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf3636d6c0so12479205ad.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781285274; x=1781890074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0B3aL8wANNFMcgo2EUByGJXGvJUE1R3H+briV1PRdNw=;
        b=M+BRGMG2iWWBfaYCffMrA3FHhVpQ29ET3tPu6jWj1wr0U4eBHeCxWGpbOhyob9P7k7
         yFXjrMzR0wn/izneYspDY/isYEtH0oWkBA1yPC/KpWWhZjAMCdBktBMy2xeohzvIyBnE
         sI1142H5F2aBsLE5iC2RKnPuUAsXJc/qbQKhq+lg5rRGCLo3tLNxzGF3L+J8QfqWrhSX
         /SNHH25XWn7520iRsZ+C0DimZBmnpoLuauKrh6E6+r5hJ5u+LvtTO5evhDhayAtaUpmJ
         dty+Kgi+CgXF2xdtvjlHLWpIbIFwEum3oRybv8zEx0PMwbwVKNcB3Nz0nGcCrUgl3SmF
         vCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781285274; x=1781890074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0B3aL8wANNFMcgo2EUByGJXGvJUE1R3H+briV1PRdNw=;
        b=FaSWl+XsC7hJb+5BrAVGV/Jh4uJmD6k+S3fxnYzAEjAvmlXLfkr+TC6AWSwYDT8b8n
         vBPnYReNfqahrUCrayjbOZdkd/BQ7FCvXHfFWCdbdzno3DlmwVqHvMSvZieGETM6ha1A
         sh4dZvRKF649yXeDPf6BMCCpf1D0kHEHNRicZ+2ZK6P7/EXvIbTSkQOXvcvoUFnWWg1/
         yPkO/QPCWYMKFUYCgRWyRCcVfo57pRFXV3AtXT/NoAOKok1XyWcqDvfluieu9aSSc4wv
         Unxn6k7B21ILm7ss5HSqX4oePA0bUJKDGOLk6GLBEi/3C8laPVTzL0TEp67vogJ+Gw5Q
         4hBw==
X-Forwarded-Encrypted: i=1; AFNElJ+Br7d5mqGpsGpFRp8DQ8/GqoeLuCoWSBylWPBrhlypkOWohMeaiVqwBS5YVBklT7sZ3sBMck0ZOPwG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr1dKRtC89F+KrL5FdCUY8aJKA3VLD6em1DX+yJXSqWEtBIvLB
	SZYHum/VO/jYd84MmIfKw9/qjD/kWcQhbZqPmojr67nmi7MhQ1l1DHm/TkeGgxT03XdgwXc+zbF
	McMmRlmXieGeXj0qN7GH9nBCdddYf8V55eLKlEAaorCtQp0/INfukZn7itiYh7aoJcS14U936
X-Gm-Gg: Acq92OFL9ptWjOF/WFNb8EEC/xrUp7frJwVMMqVbyLQjAeVlNMPSgWHQTyL5DyxQGzY
	c3mNr4Bw+eRKGD1ulw6L8lh6yWKYmhrDU+5x9SLET4v1BX961Vu44qKGWG/KmUEAjDtQZ9LF2af
	YmhfbO1g6bKjgrCO32rJJ436QV4sdZaG+aVktc8PIBaYYoCAoL8R+ya3DPcDRklHTHsXpqwQz6H
	0KWE80Pw32A12NgVjRgBTxUCM/zUqkRAj9j/gsd0+BIn6ln8G8duoNhdUxt75ZowZ+ZTexA5qpb
	WRgpvQ6HF9StvLTPrkPH1xUJSkkzx9ZfrF1Ar5oF3RcK7+IgRZStDmodPEQ15oL0HMsJoqXDDXV
	WMojWnIBj2GZQ5NcANlJkA8NO01TlZo9EZXx5
X-Received: by 2002:a17:903:2341:b0:2c0:af09:f3d9 with SMTP id d9443c01a7336-2c4136e38dbmr45137785ad.36.1781285274043;
        Fri, 12 Jun 2026 10:27:54 -0700 (PDT)
X-Received: by 2002:a17:903:2341:b0:2c0:af09:f3d9 with SMTP id d9443c01a7336-2c4136e38dbmr45137545ad.36.1781285273578;
        Fri, 12 Jun 2026 10:27:53 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acae2sm24278105ad.52.2026.06.12.10.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 10:27:53 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 22:57:37 +0530
Subject: [PATCH v6 1/5] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra-dt-v6-1-6b6cb58db477@oss.qualcomm.com>
References: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
In-Reply-To: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781285260; l=1818;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=7BvGgsMzIym3cFm938zERz/XKsgQcAutut856Vu3XHQ=;
 b=u6nbiWUBsu6TxrfPJwAk9JiZJQBGrhvswgZqlmEjggQJYKOmEHyj3ViLkUguSgSupnYFN8aAH
 qeOF8AtuGgiD5LTNhnnXgqdnaNJwvJfgXSSnPjzLd6adzxtvOMhZrA6
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: pdfQXSxaceQsacLmBnHYrJHGwZX4W4l4
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2c419a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nhUW8Zqzme2qF2hNOrkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE2MiBTYWx0ZWRfX4KcNYTUSY7zE
 ur+4W0Xc87d5MBSNBm/zPxXFRYd3+zxK2gLUOahmhLr+OQdBURt5lTtrOmA/BmMC734pqFBGGBX
 dhUbeLYtCtGS5iYso5tJqfgQ3oXguNNe46JfAyvDr3NjksipA+BbKP2Lh+fi7H8UVhk4n7R//Bg
 g+MRCcbI8wL+Lr/loO3q03msU/rDFDXUXst1oUtUJUdawiALP6PTC88s6zExeNgoe2uJhAJpkzi
 NYdhxo0E3iv9J6OluqOrUn8N9bNypJ1lJonv1I74/lD3DfUTpVqudlUz78ldUEw/UFxs+k/M26M
 e+KDpKLefCDm8Mcz+oxJXEYqRtI74mUSgU7faBAK4KDupFUsVDontQ1WA/M6DVvoxR4JmBoljPl
 i1CGg8AIbrxKD/Xn7G2TqniO2kVv8ioBbCm5wG4lQvGWaXDeRjj0PmBRFcmLu17hFRlaTcFCroE
 fDnscyHsGAwNDs8gH2A==
X-Proofpoint-ORIG-GUID: pdfQXSxaceQsacLmBnHYrJHGwZX4W4l4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE2MiBTYWx0ZWRfXxN6X7cpl+PK6
 3fzHgcXv52PXAfqNRdoNeJRbMK5vvp/0T712Zb/hYppiDzwzezqZdbqdSJ2gVgzpWmRlFuFe6/e
 q8JYytNBHyxK6NxXI2kgQqau1K+n6h0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120162

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

Three eSoM variant are introduced:
  - CQM: retail variant with integrated modem (PM4125 and PM8005 PMIC)
  - CQS: retail variant without modem (PM4125 and PM8005 PMIC)
  - IQS: industrial-grade variant without modem (PM8150 PMIC)

Each SoM variant pairs with a common EVK carrier board provides debug
UART, USB, and other peripheral interfaces.

Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and
its corresponding EVK boards.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

