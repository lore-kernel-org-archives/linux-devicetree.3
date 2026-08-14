Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2EF41F365
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692839; cv=none; b=YFldX734WfrPMtPYvsHhI+LO5CYf2uKUTKrGLANRU/2o4QgcWnY0mthoTb/8amyHrHQ9c3o/4QNLL6In1PFtQGco3rcPJob8OLpn5kdPS1+ZHzyVG8VYsSTHYCwwvIL6wq41g+EzEY8EHA6dFgtYKWimCVN5HEybhdfbFYE7FDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692839; c=relaxed/simple;
	bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T86/l0QVURn8T/uF/a7UI8AQ+/rSTfRk001c+RvzhSKBTzgoG66iBL9d4sDhqKH4+SbmptDJP0rEALVIKudDQV8NcNRFgziE8/EhFZjk7LZl/7ln01weNZinE3reAD/tB2mNmFI30heQfSq4fc75O3XLtq4zUsvRfNDaMQtyXvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f47cNOju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFfetm2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f47cNOju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFfetm2g"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QtR33615498
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=f47cNOju6Yg9bKgr
	pVlDJ9ZD1JPPwYQ3kYTqh0QE4byrKyuysRvlI0cjuCdzouB1EIo/rY7ONJaRiM3D
	4e0Wfs35yErbB8+a0S6GCI2+0GqTZkiMDgQlWuoJDvop9jsAe7abC7somdrXeOSy
	m7w29WbZpnvknbkOeiNeJyscniNVcUN+ZRBdwH6oFVFs0a/5sZIB5L2TsOYGRmVC
	EQwU1HgTvwJqWAGZAXg9ySNKRlz9FEBpBc6GCxwf3TTEM2cUCozy+hj/taydQVl8
	utrwPClqiXnV80cVBd6hlfMBJ2+FOMTamDkS3kjarFQ1bkPhxyfzaVzLmQSUKKWn
	yWQ2Wg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy32t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:33:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso10866995ad.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692822; x=1787297622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=iFfetm2gDIAck+ar7ckmYqV6Pf7sVCA92rQe0Qe3H0FAKKjmlu8lLGI/DjpCy35Tff
         Toq7GTgoXECF62zhBiI4unHD4axhnsgpPNWivX9YztSfZH39KJrEo+Lsaf23qiusm7P+
         z2xnx6t3zgs+zCTjuRmpsjeXD5NF/SFmmYWbhOcHCXse+PLo3lzIYpIk7k2OZPvA5nnn
         TR2emXZfJv17h1E8mK389+y6caGXnprrDDWGsdrMTeTIjKd/4511gn1s2UGv8Jp3b1CV
         2zICOZrBi2fkQB0hH1SJGy7DZ1kDhA+5yiE4HX9TM5P9OJaoGFndvBIxKRff96PnilIK
         rHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692822; x=1787297622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=UB2Nim78r6V3AA1knA/lh57MswSBUxIkK0r7w81bpGlwnTDqanjECdfmhuArZMJf7G
         G6qCixbj352Uyqu37eD4hhAfd6O3RA4KE7bmsvuaByiqYef2hHwednQYW6AmgKrokEep
         BpPlPdh5vKT/eXHdUF+6l8vkpte7cGD+yb6Ln3qy+m/XOZcoFHvroAOYDyVx3RvsCRSl
         pesN8yDd13cMACnCPQ25ot9MK9cmboWf9LyCpdJIAUrf5EQ4b5AyYDRZPzBEDNwanhER
         EveQ4VHVNCyZb07Rc+ckFGBAdlCv7ET3ZlXFJ5MoyffK6uo4Cb7PZ2vkNcxs2h4QYxgf
         kiOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6O451N030HvtYc93OsvaRVQ47Bl+VvAEAnRU3dzOGRXgWLx33EUex91ciRVFqTNhBWCrO1i8oghjx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgo8TOYdT0Z/1uDs4LGpZqtDNOognVM6Piecbc/QEXGpT3h+6i
	I5k7C7v0odiUmR/k63xRZomU3m9FgG9GZEUhcOg5b8QhcZxeOzKyHxf65Eg1Avych1AX8V3/QBe
	ilG9PtbgNmoPzzzH9/wOV8p73Bm5lNcLeUyG0feYS9cxTTsplOUC5p+ZI7WbfHHR4
X-Gm-Gg: AR+sD13PXjKHeyO4GW1CuhSapVXfz1UQWGLFQxfOnk2sg1x/m+0JwiGmI42goI1uKwv
	A9U7455ob4tvTOWV8k6k6tQCtOyIkpN+MKfOY0oPCNajM0tvTCrr90IVnrLpzF9eZTl+3tbwg1W
	TimOoeOFp46+JypzhY/sXWQzzvCe9USj13gJN3Dq9nd31RT13+L1a+btff6Uj2kD5JRbdGaPSDb
	qBCJACE4NEnF0283RwDj5Fz20iKUwYlOb6yqi4VG//pgs/RgzyJrDbf1qHYk9kqe3UCym12eB0Y
	2jyctxtXHdiYDfFqcW3cZ/FdmhgBtJFwoXEa1/JWEDLPI2gZTEH4L+Iw/7cNAgf5TPYq/K0ls0U
	yq9Noj8u4uAeON6noBxy9mA0pXTVx+T1plNHXP0qxOTIMPD/S8cjji2QlNTIk8phcwVMw01DodN
	at6n1NKgWta7ZlB8rw7T22lAA=
X-Received: by 2002:a05:6a21:a98:b0:3c4:397a:69ba with SMTP id adf61e73a8af0-3cc71d7bd03mr4632015637.28.1786692822534;
        Fri, 14 Aug 2026 00:33:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:a98:b0:3c4:397a:69ba with SMTP id adf61e73a8af0-3cc71d7bd03mr4631945637.28.1786692822096;
        Fri, 14 Aug 2026 00:33:42 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:41 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:43 +0530
Subject: [PATCH v2 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-12-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=5rfTSqeF3ZffhEbWQ/MCkAbuDD82v1o8NO8GUugDaLDLaKTC3LlK5BcLVBkEaw7CxqOZjkCyn
 LB5WOXsXFY3DZZxny1BmotvMhg1imljcHSJu02Gp/nx3UKotZJU73zb
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXyhFAVDY83oQ3
 xW4QZ8nQTeop0tXQRzb/2PI/hNLlCuQhLqOReXC3+PUQEdqvmPagSQTWblBNl318Gaq+LUWmh3B
 B5XwGphhBfI8jPVJv8TXoky8at2I/ubp0rivjcaIiRXTeqbZvzI/SlFXB9W9m24ZmN89SmfY1ee
 QA0bkk8VV3KnzcghPa5Od4uw90GvALN9D+rnSa0hGbn+Y8l6YsYU0slyucaXUPwGuz0JiL3JBtW
 BHq6UmT6vXWoE0k9tUOp2hs/pEA3E0lFXgD9UTtrcnupapSaJQzKa8qg8W+8CwV0EyvFwBAf+y2
 celPzfdWP50gLoOh5taIVNVzPSJ4U8A1skD4Ufiuui3xUgt7DEz7UXLp3ZPdK50toZtBTERemQW
 bSiz6Pt79pkILSjdaG42PNK3b+dJ0UISfLNVY56eElSzBRblaDhh8/w1+qFhBYzeG8/iN8npO45
 C7usCSqS4RpdEJyDetg==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7ec4d7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 6yiaRIveUmBqy09dHHI9M-P1JnHeP3VR
X-Proofpoint-GUID: 6yiaRIveUmBqy09dHHI9M-P1JnHeP3VR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX1ZIXv+6xEPis
 XbclM1o6aJRoV95JLxQ2eaLGOzKtrL3IhFpE2hQrUO89ZgEf+hJek/d/yM/KKCbfwfETkm0kAEj
 KjooEX2obxoHQCZDr2sIQv9okriQ2cI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0

