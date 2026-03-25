Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F99351C1F
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430365; cv=none; b=H5jInLBl2cVOXOZfkYZUEuF6WGXfPxUPyxNZ2yYmhyhtj8pjhcGiig80zA1nTCxGm3G63S3piHvik6XIggLVzOb9rRKNmsmjSpMYCvjC2HhGk1/9nBHKhaVZ56KyrCZ+XtX/E2424zT/4f8a4JYBsX7f0rQcn2gVtzwHNING9Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430365; c=relaxed/simple;
	bh=DqGHiJTWn6xJDqHoA2f0o1Udu6/Px365tf8MWIx0luM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNowxVV6Uh7CM4i1kXNgEffbG1n83seR9A+V1nvbr8P0a5qTmnoIz96FF0kV9YrMyFFmZIDS02/TliOYSz7xe2k6k5YG0jsiild0u7HsbZnjcirR82zq/4c394RPTzxgf2trmSBHylzrYYW0ZCsx9YfIVm8ROtIOFWXu50ACM1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fvm1tVnC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEqnyaIu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fvm1tVnC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEqnyaIu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5NJPO2075638
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9dsJle9MpviZgcI39+LL/UBtRGhU0LCfuavkOaTYh0=; b=Fvm1tVnC1hgqN7e2
	cjokBbdsl5quK0YCTvRp3K6mLsQ13MLXSVyaTsHQMRJHAf/OWLUGbScQIw5oy/Le
	t91uA+tSbabJAAAuXUF7Po8VbjA4LcvbqDHVAClOHIkZWnoRPbuqRwe8Kl6/Ap6f
	S2G7oJKXKEMbDLpSGbr5/UVPRDMK/gsRl8ft9vprZx9TwQvMv+3uE7AQnuBvQRq0
	c1+pom3XdtCkY3dvq8S/1YWfktocj/rRirGmACoz3J3QXRC5ZA7+nxyfKuT2Q2EF
	jPwNL8j6UOXyA7FBITLGrHB7iAerJrzlt2HsbzijdSerr+2ktIJax5KljUUQTn+g
	+mLzTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41412eb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:19:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0565d77a6so32668065ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774430363; x=1775035163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9dsJle9MpviZgcI39+LL/UBtRGhU0LCfuavkOaTYh0=;
        b=dEqnyaIuacBa8AXnuQUF5W7wWtscf9MF0Mgx99R7oWYKcMzgrmWFdccQebwRaEcGqE
         OFWXQIm6nfxTmgnpehD68S3D4OtyY4L7xw4P2hLG/elWu2XyqZy/xbzoaCNX5gKdPiKy
         RTOsSe0dqwjJKimtvuGBfTl1Q5uz3lBNgbELZRLVZ5mFi+GYJeKcBApP+Cp9PM71Wmk7
         RnqdlVXaPcxdBELJVajaFhS8Q1PNnY5lbOOs4LEzzvNq7R31NaNONdHEBTtcj7LwJlO4
         Lh6qxVj+ClnnccpLbVFne8WV2ktfEAAXMSHJ5WOQVfkhCUJ8QOydX69uVcpsIsFzs52f
         v78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430363; x=1775035163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N9dsJle9MpviZgcI39+LL/UBtRGhU0LCfuavkOaTYh0=;
        b=Lrzis8OuDA75ZalO8XKnGILivMQeQHJp31TsgqscRLAZHb+Ah9F5xAexIZeHFgbVOG
         EbDmW2NxK9E3L6kVNGdDCnRdF+gbdQdhEbsEovqmOxrRZkXzBRn7O86whP6j23QQuUuT
         OiHM7EzschcL2EDCl7hAZ6Zc/zXvfKmJdtVy2OP89aUfEe0lZBbJpP8Akkb8q+Rimlqd
         fvwd0C3g9NcjCkbeBNHQk6jId0AbAlG4nQmhPRHhR67pq2R4BJXUpAkBM+CA+cVklIRY
         cbh/DsXxEXX0Z2SXL+/EHjdEQVSpnVwyGQAHXipASl7m6pujR1ls8T0NbeSIet9mNA8W
         Ptzw==
X-Forwarded-Encrypted: i=1; AJvYcCX9XQBUrhvK9X0gzrZGXNArcaP6DANSJ8kms4ijjq10W7Vh6JL5d6C0ukagHBZ23UZ01f9YNnZ5TVvt@vger.kernel.org
X-Gm-Message-State: AOJu0YxaXSe5mlsZ+NCp3EVdUcom3BXzGBXf+OxiZPDcUAAlgtifSeWo
	2yfx56sS6FIkcGdQYWZxRD1PKGHbJlwovJUDBD8OhWRVOp0PiZGzBnY8BzDlWvm7ikX/ziTx8Pr
	JDsjCGHhh1lfeGbJyrW1ioP/gsKU+r2LmLyApjIsmq8H01KwVOPFOBo3ep8NvR1yk
X-Gm-Gg: ATEYQzy2yu2QpTCLV/VUjrgDhSXqynUCtwxaNHWSAxELYU0iUQtNS5JGJQifloi93yw
	vy8KaXNOZhIuZgqFq+Vq5h8dlL4aXrzZLHfuJ4z84srxfHdhyxmokVzINTtzI/VsYfsIlIgRBZv
	5pwBemXlzBx16i/kKdpAlYvExwREMNzxzLVAW3z26dd/Ny7gqayftAdBkQL0rMKG+MMcYK/oqPd
	3ufBimm8Nfr5F2S+5Jd1RMKf/6yl1sOXIA63VmIFpgnMbC5L5YRsHkHl0ShqiTl/N/OJ8w4C6eH
	gcqOERHBLHY//91WrIWEmNWQHYh8pYk5wCZ+qYbjakeumOz8XjI0luH4CmlzenLd3wim8pThLui
	q0PuHPYUug5UZ7lhECpwafVaeC4ZghT/Vb9o+6gwcxFsf01T/imoRNbSDJGtICMEET0f9Qr5bMw
	zVUuyOO+V3hQw8E3ZFf4I6+sv7a6IkjX4ZFPjcglkczbN3fx4kQv7Agd78
X-Received: by 2002:a05:6a20:cf86:b0:39b:e789:7d10 with SMTP id adf61e73a8af0-39c4adf4832mr2998774637.57.1774430362684;
        Wed, 25 Mar 2026 02:19:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf86:b0:39b:e789:7d10 with SMTP id adf61e73a8af0-39c4adf4832mr2998745637.57.1774430362204;
        Wed, 25 Mar 2026 02:19:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c38565096sm9643605b3a.51.2026.03.25.02.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:19:21 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 14:49:09 +0530
Subject: [PATCH v3 1/2] dt-bindings: qcom: add ipq5210 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ipq5210_boot_to_shell-v3-1-9c7360d19d10@oss.qualcomm.com>
References: <20260325-ipq5210_boot_to_shell-v3-0-9c7360d19d10@oss.qualcomm.com>
In-Reply-To: <20260325-ipq5210_boot_to_shell-v3-0-9c7360d19d10@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774430351; l=893;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=DqGHiJTWn6xJDqHoA2f0o1Udu6/Px365tf8MWIx0luM=;
 b=djQly+ldqLQ0wZD7dx5lcKg64pPrB/d2bMfDj6mDkhh60Nyu16gAcmW0jK5yWoo5WqEP8lxBh
 wlhvXDc1RiUCwVs9U51jWXEeEzcjlgNJ5NgKkcxHDiRPbKvFrXw0qVt
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3a89b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HYPJJSFQ9-wKY5ciiH4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qe3e_BNItGUxGKAqY2XccUbnVH7Wlsla
X-Proofpoint-ORIG-GUID: qe3e_BNItGUxGKAqY2XccUbnVH7Wlsla
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2NSBTYWx0ZWRfXzi9fhxNCH6rF
 aMP3VkxzNQLwXdORIbnoiRDmV1gJiUnlyMKb5s8p0JkEdue9oev714kMuiCqhxcxlRa3XrUtjK6
 3BdD7WUMYAl9HF/ftFVRxe8/AH0bNsJ+VOtxjSfwAi6jIDNC73IbIH9qgbnoL9LpQj0lKKzXSOE
 CnQXNxXoUgD91t202C07Xdx3oPCxM9wgzEp4KcUznPxsc/3Tb4XpYbDDX7L9HAW9drHXiMeHtKJ
 0CIIrKM0Jq+3IDTJJflTRPu0q6dySM6OFQzimiqpgMJTyrIdrtiQvMUXJzoMssrh8N9sFVJ4WRS
 8To4ZQvRfbp9WMpJmoodPY8VQByueFVpR/c6wflrib+jCsHcAuujJcwO/45IUrC7aYNdy12iAQb
 kLsA9SOy8ZQOuw9HgqkNIHsvk77MoJdJixnFZOsStPleIi8LDafB+Al6vdwy4N+SUwbIKjHLdW7
 6tvRFM+RR/yY0YfHSxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250065

Document the new ipq5210 SoC/board device tree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9f9930fb9a5e..ca880c105f3b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -322,6 +322,11 @@ properties:
               - tplink,archer-ax55-v1
           - const: qcom,ipq5018
 
+      - items:
+          - enum:
+              - qcom,ipq5210-rdp504
+          - const: qcom,ipq5210
+
       - items:
           - enum:
               - qcom,ipq5332-ap-mi01.2

-- 
2.34.1

