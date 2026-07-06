Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE513E44F8
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 06:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783319393; cv=none; b=kuTVYcEgby0FBr2OSUBKrRWoBFL3qvmNzE5b9oSfIhgxcp4kWV8AGtquHmJVf8/SaeFwjxC01IqrMrocU16mT3oGtys+9qdZBhUhcfG9VkinQVDrKcbK1nY0pwq6jZko6G5G8VtI3IIR0nU5EhQIdkO00Ax2xXkybjdVj7vn8sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783319393; c=relaxed/simple;
	bh=v8nmVyZqxaG+bHgDm8pJDNcw16d5cJEinnhDzfLRvvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GYX6BNAZu6MjSywO8GRIQUN/1irQQHwxw8hoiFf3cIfcW3djOtnZ5mxPhH7DBXM/0WpMr86pK/8h22ZbjaYZLpbm74kpKQ4C5KO/4mnk0nKjp/ebb9x1AL6kbGfgCeO+SdTCNKQDcXxTl3RverOWflMF8eA8ETphEO9xxidzAVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxQlkGVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsahpYrL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxQlkGVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsahpYrL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641dWM3402284
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 06:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TUjpQsnyErfX0o07DSPRbJ
	jFpZ6yO0JzVDMShO5lcN4=; b=WxQlkGVju+oKjYeu0TdlVqWXWoZqI30cZ2sqrL
	nZCJmnKYzCMp9FkjNjVq3J+j6S/L30YoaTFL4KurzHbVirKnVHAh6Z5bzc4ZtsH1
	yrC0a9A+/Q4oefgTJ/h2937emakwc0D5Z/WIQ6XWIeBMHx69G2YwsrwIwuZ1karn
	ADvl64aH9rwtDrzq6EYVOXvsOPXSKD9bqaLotPyTAiEXW6rQo6k08LgQBHE6uIDH
	Vz7hcWjGdtRl+jTX+37WSrI1BJ0oo5+Si8Rd582+3CbHyPANLUAb355p0OKINavi
	OZyAuxFAaFAFOd3aujhKi1ZdaiIFn2VlLJhWMCx7g03HVWGw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgmjps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:29:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso2111251a12.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 23:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783319385; x=1783924185; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUjpQsnyErfX0o07DSPRbJjFpZ6yO0JzVDMShO5lcN4=;
        b=BsahpYrLsIWS9N6BINRYBqvhFkjI73XwTYKRNmgZgJux/ZA7+DPl08kgSBjIRQ3lo6
         Z9AgKN5xO+EN4KPKAcUFN3AzsxJ7Sfeq+4SLpxwfr8nBOwDv+KxqDNOzMY9t9Kd/vhOr
         a+/ZGpjJLopRB3+K1ye3gO7iDiwiXLq2uzWbBoGkslwn8sOT8fSqFgQXI/KsKuGU+APr
         JDaRuG0BS39YcVl7EQqFcLHMdbTruIeJ1tqhaDgbhlGtEs4Hn8LJglmVnitrhfPCjlkp
         tfl8zI0n87wplreKUku5N4rcctq7j/V1dwur/Y+nB9n7/AGhx4CJ9aIdFAHJghdgr2Be
         GP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783319385; x=1783924185;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUjpQsnyErfX0o07DSPRbJjFpZ6yO0JzVDMShO5lcN4=;
        b=ZO1hjDyweAjG/vZsBgW1xI8W8qX0cPmLUu0G8ElLpFciTBYuOBNk3HIQwbWJ5wVnq3
         Y4/b3PqO9n0KPDXc+hOlRXfRS6IRxfBXFzeYirIkxJx0ysk9q12mtfH9fCMdly8Ghh23
         0lm6dtLOoUJFppk30DSEUWc58lWYiVlw6V2Zw1fpso24DhZqZSuiH2C4CXbrV9LTwq/4
         LfNConctKgsxX2/iwgxSXepHqs9gyVn74GnVZMSJXT4/mJhXLxrK5/Uy7PyViLJu5Qmz
         +LxKJp6fDmwS7BUqKBOrCM6363MHkFhAIw0IwvUeXhfSbCLih/H8N/UM1aMV4yUa3NT2
         6n6w==
X-Forwarded-Encrypted: i=1; AHgh+RqOrmxu+5C+VWZn3ktzKkJU49PTDaDJfc3zIy39Z3dXgO5tBdvIrIY4ZBf71memerpf8Rpm3XBu1QL+@vger.kernel.org
X-Gm-Message-State: AOJu0YwFN+JDzLw3ugheqhFRdfWzTVApSSdpzNI6ww1R+cY6prcQEUqi
	3pxNYAn+Xjqk2MiSkEwyOQov9hwScrnvjbMrR9PDKh0eckLtqdEeijhKyCEmKEv9mvFO8q603Ks
	Lg1MtXclKMsKcBYzKe4w2rg4n8F8RTg6BkN2Ql03srGmcmRgzWbd6Tl31wISPw4UV
X-Gm-Gg: AfdE7cmey8M7022Gr4AkepEPU6Y8e9/YU/5AgPQD6sAEUVQO/ZwwQHBigF3ZMQTionp
	Hc1nlGcbpfwkSsuyhguu9hWA0Fg06Ftz+Tkn1Te1a5HBrDO6AsO1FLSzafpTawYpiZPTbKo67t6
	XlVVbQoS7Pqu2FgHfjvcxYhzcug+T7KKuB5EZQKT/HssrFVWHsDsfmg2zuZBbHsjLyENnCUh6+l
	uc4vqTRQncSOEx6W8TQN9NEvivgIazo1IZD9F21N67wAVcw5b0tGdswp0ADpMNsDL0YW5jPGYKl
	0dDxDZh5M/hjRZsWwJO05KraVNcsgoTZCbPrV18Kvo4wJUaLxW+JA7OCsyrJ+1eIAvMMIxsYA1D
	Lt8YVmyX9QS4EbSL3Hg1GZguXEv7sxgFTc/iHDDFSJ9iunj7OMUnWJnYUL3iy8xaiGudH4v08xX
	qMXsdWDrDEuclrTvJhmv91T5LiUJulXY0/D4rm56+O
X-Received: by 2002:a05:6a20:b40b:b0:3b3:d0f:7883 with SMTP id adf61e73a8af0-3c03e1f3834mr9310006637.7.1783319384569;
        Sun, 05 Jul 2026 23:29:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:b40b:b0:3b3:d0f:7883 with SMTP id adf61e73a8af0-3c03e1f3834mr9309973637.7.1783319384118;
        Sun, 05 Jul 2026 23:29:44 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef188sm47645640c88.2.2026.07.05.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:29:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:59:38 +0530
Subject: [PATCH v2] dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qfprom-v2-1-f5d9eaf12d55@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFFLS2oC/0WO0QqDMAxFf0XyvIh2qx172n8MH2qXzsKs2lYRx
 H9f3IQRCNxwcrgrRAqOItyyFQLNLrrecxCnDEyr/YvQPTmDKERVqKLC0Q6h71DYUjX2Ys5GXIH
 hIZB1y1f0qDnbHUptIP1/l6XEFMlHnEvkUVI2fFNK0b2PMR8n/TZ91+W8DmegceJO6SeGRkfCH
 XHplnlaEh69BNTb9gHiHzsszQAAAA==
X-Change-ID: 20260706-qfprom-2f17bf4c3c28
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2MyBTYWx0ZWRfXwwuyqg2/G25a
 mKe+VVsadnp8bu0iNjybaXBmS0W+Q2gaWUScbrbSsd4TaLqzHAFEjatY5eOZidMzw5duRrzomE8
 UXDnCu+OC9cGV2QmU8paCzTtrx20lhA=
X-Proofpoint-ORIG-GUID: Guatbgls9Ye8xONYHrNGixt4Wv59jC-g
X-Proofpoint-GUID: Guatbgls9Ye8xONYHrNGixt4Wv59jC-g
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4b4b59 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E3ZHFlwXONBU5DQtPr0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2MyBTYWx0ZWRfX19u+tK5xJHR9
 1Me4cVcsCN9wFPcEbFCOFJD4SBTjijV4h7e41BCWK2eXTNr/U0iEbbPABj/vK3fZsxJ2CeE/mlg
 /KvTmHeBWjp6ckfqXT9YoKZO4h1l9Wv+qpgqXA2HoijK8o/5OctNVu48ca0y5B97OTFt0xyrgb9
 +fPZGm5BpTxeWE42bj/39fKGwiwkKPf878E14bPhRJHlR0FuJ8NpYV/NxixXu8/Y3mpkOVILAtt
 pLkONrMsCtaIfSWlQlsdwzi4uTDDc8jKlo84yGuTeSAqxYopeoTBxe3kLrl0ucP8FqryPsb+zwv
 c75j7vcoCkIgCCoMWqipOt2c/XmjVPnw4P00uV4Lk3AChfb51vbDR+qFE7lm27NpgfjzvbVrnqz
 gsuV4dS9/5HP8mPMQfBFrcxSDtsk/tCuHNSYeJZn7PPLoPFErW459cX92j/A1p7LUqsrBOfbICR
 aNkhIaEi1ZHvhXreKfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060063

Document compatible string for the QFPROM on ipq5210 & ipq9650 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v2:
- No code changes
- Rebase to top of tree
- Pick 'R-b Krzysztof'
- v1: https://lore.kernel.org/linux-arm-msm/20260515-tsens-v1-1-1755b515777e@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 8134ddb54e13..bc0a0898b9e4 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -22,12 +22,14 @@ properties:
           - qcom,glymur-qfprom
           - qcom,hawi-qfprom
           - qcom,ipq5018-qfprom
+          - qcom,ipq5210-qfprom
           - qcom,ipq5332-qfprom
           - qcom,ipq5424-qfprom
           - qcom,ipq6018-qfprom
           - qcom,ipq8064-qfprom
           - qcom,ipq8074-qfprom
           - qcom,ipq9574-qfprom
+          - qcom,ipq9650-qfprom
           - qcom,kaanapali-qfprom
           - qcom,milos-qfprom
           - qcom,msm8226-qfprom

---
base-commit: a9498e40e3e314ade387d3ab0d5cb14f0f3aa1ad
change-id: 20260706-qfprom-2f17bf4c3c28

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

