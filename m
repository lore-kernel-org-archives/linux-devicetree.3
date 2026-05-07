Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB5C3D4134
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194238; cv=none; b=Yf1RWNJ08aj+xA/wJ/U2GQ8LJ/tNKnPoscviKKBQpGEmLmQ/1RCjyv8h9wSNe9U3ryim6uIg0whtJ4SenqxZCKPqtAWgqyt5eHvFR6m++WBNi8wC5myDIA1g9+b7iXu/bdLngcXNYpcAC/RjI2OOeHDvycBU8yv203tMMnGd+7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194238; c=relaxed/simple;
	bh=y/+a20YL+ysQIFGE4+AK114lY8/mBSFRbp2rnNsk+9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gmwn3qJX65jGeVYigGWfsuIEW1L5SsZR8si9n80qqSFawOAFMCch6aThuui5Onmk1hGiyY59u4+fmxEFSTpQV+QXpLPpnA3KpukzH916TaWI3iGlfoXGAljiuGB7cp9v2s+YGm7BqsSMx393ab9BMX/BZuLn4fLztZnqG905YRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LihrcusZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBU+4Uj/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LihrcusZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBU+4Uj/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647IBdP42770992
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 22:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fWBniTwp1rVPBTuTnmxciCl5iow63nGmhGyjthKvyds=; b=LihrcusZCPNaVV8G
	/hcNguhVavhDf3AN2SifQLSR7abJ7MknEWJyaSPOQ54/J7nV2i3nbNXDy0sbMx7b
	TGJ2FYEFkO1HIqciqVsVVyJJc2j7ExC5M/1TxuwMtBYv+yhstnBx0xq9IBN8WtsD
	l9W6KeVz2M9tBSLWBh6Z5EI9dhpObyszrtiPGU8EW+n8QR+7yinUg9UaazD8AAfn
	qNjuafvaImrtgS8ZCQPeViu3nyTi0w4Cp8ut2ktZRhWMVkkwgZsesf63VcYwhu3v
	yweuedmyEbfgTvjQ5jkZ9n8TBqILvjtUFkNr/If2DoOo8aPGWB0B3yarBmBjJKvw
	MXJtKw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5gupa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:50:36 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95d2ad5df14so2613251241.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194236; x=1778799036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWBniTwp1rVPBTuTnmxciCl5iow63nGmhGyjthKvyds=;
        b=TBU+4Uj/UoaKu+Gjxjb3mU0QSsRrG+pT+zcKgmlqKxPiCcgbAMTekVI7zlkUO8j6kJ
         aHGtCIhKcLhejN/jg6EpdpLGQQvXVHeFJRSbNVDc+5ABvre4m2QC+41Hehxps7joaBJg
         Cqw8eHTVO8thp7okVgFncfTxwV8BLl5rXLSklMe282oN2WITs4NX4830XifNWGHpV9ch
         ATln4qWi4cpV5sjqOfYoXYzzZhkk9bZawqVc0SyUOYHteHSwXsA4ma4bqIqV+ZrxDsRQ
         sBeqO65dj2dQYXx/5ob9U0LO9rJBsUx1mO2GmXSnXTFXPpk05bBJNfTAKmcIY0mbbFY0
         to4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194236; x=1778799036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fWBniTwp1rVPBTuTnmxciCl5iow63nGmhGyjthKvyds=;
        b=cuvDlT5Bn5M//lDRuBytYq7GSzXpLvac18fxqg4Xx6ex7JBrs8uhU79mqMm4gfMx/0
         zJx/slnaGjk18nKe07Qj8fa4GZq23cOn84TcO9+dRXLPZ0XNYEfeSocXwqSZULFOiKn9
         WuC4eUBuc9bDdHM3f186YMQKpc5lRfc6OKfUY6P+uSqZqRbgPNcq9qJioAnqM8u1mE4q
         J7+secKCDyLXNGNUUza/W/FH55Y+0sSxNDgJ9v6mB5OkdQC/MElXl72iG6ony33Kimtc
         2pChh9ZtV/fBHZb3Qema8HJZw7EsNCI8U7LN+wU/zCtE21y/3K4UikXvWMDdLwu/rWYo
         mi9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9pPI/YTrQvOCEIpwQL3Cp1Wi+0v+epGYs3KOI9SjGYmwTg9AlqtqLkQmXWhHK/Bd7NAN0Guw72HLx+@vger.kernel.org
X-Gm-Message-State: AOJu0YzOXPdDwT24eEfuFEKzdMeRJtZACCT0Sw0N4TyDit0N77L3JbLG
	l4RPrdL9YVMzpL9Cdrz8ry2W+MaykEhfrCgGBPKu9pAf5s6WBou+Aerop1KQ5bti3wQlYpdlPfz
	Bp9T8NQildxVPJ/M54OQYnr030QPEyKEZKrcrwWxSXxAvuwNKmd65Y2/WaiRW/hYA
X-Gm-Gg: AeBDietYPAqUBgsrTTcL2jwd2YW5iyccg/tmoeXV0LDrEtBYlK/GTWawmCP+Siuk5vF
	gOil6tO5TasG95r55ywVAut77s2QWVZwk8XXAVfEY5G9P34SQ7Tar9oRDEtCWVVb9f1fa0FavSR
	99YWF/ob944IGLNpOZng2EQKjFRGldDg0wY4nD8ekT0lU73HTqSywilNNz0dMBIhhZvjkIHhLjd
	MVTt3mz88Bv0dttix97QQ8E+fpPIzHxi3EO0YL89XegqZvTkuQKR4ygyokIrZ9FgAVTFrHCnGq0
	gX5Fb8Lk+ULTOzx8/XH+jhPlcKdWRwPyHjKqYdgiBi2t72143+1hB1ptekCd1IyMT1F8H6O3uRM
	7P0W36b0hwP7CNZSQdVBOeUXvs/hdgxy2hEJYV8sMlaVgfr8g2TeCdSr0OAaZnxYRNlGqtQL6RV
	r46MEpdvIQjoJVHnHQ
X-Received: by 2002:a05:6102:8515:10b0:631:2973:5c2c with SMTP id ada2fe7eead31-63129736518mr1766715137.21.1778194235711;
        Thu, 07 May 2026 15:50:35 -0700 (PDT)
X-Received: by 2002:a05:6102:8515:10b0:631:2973:5c2c with SMTP id ada2fe7eead31-63129736518mr1766690137.21.1778194235272;
        Thu, 07 May 2026 15:50:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:25 +0200
Subject: [PATCH v3 10/15] dt-bindings: media: qcom,qcm2290-camss: Add OPE
 ISP subnode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-10-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fd173c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: S_zDUbAdY1bt5vQa9B5xvTslirp4eod2
X-Proofpoint-ORIG-GUID: S_zDUbAdY1bt5vQa9B5xvTslirp4eod2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMiBTYWx0ZWRfXzZu40w6k+lEY
 hOzrLO8b8h/QlIAa8NhAKEu39hn0zJDcPJy2dWB/cMP40C8rjU8cYFtdsd2WxEEwS0I4P+YwzlF
 VgLH2g6Mu/n97byzeW0YBYUWsBhqSdVHXLbDD1JYAlpJkYnb1D+SFPXkzdk+P8370qUhTq6qeHW
 mVfmpjGT8TVJXrlLTpgLC70rzTmX6TTQgor67oJlMkJOcEI/ZGJorXKbpY9CnAP24z3pu+hPd5p
 dF7pYcPmlCwJjvx7unn+yEq97h18MiIIL56JQZKJU6U6qHJBc5ouWIuv64cI9WpBCKVXttWfrb3
 7f0mkK2F37jAqDd/psVghKySrIVMBU85rj6wlibYQ66JRMgX3cBXmkOfFtDltpfuBadHQsrYkyz
 8WtdDgFjIoyG1KM8VfRjbXd/9+tdJP8XzZwGlNL1+bWRDPg9CIhdh+0WNUv2orpIxEy5hL4ztd/
 dvzhLuzJvbCpIG4Qdbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070232

Extend the qcm2290 CAMSS binding to describe CAMSS as a simple bus by
allowing child ISP nodes. Add the required address and size cells, as
well as ranges, and validate ISP subnodes against the existing
qcom,qcm2290-camss-ope schema.

On qcm2290 the OPE (Offline Processing Engine) is a memory-to-memory
ISP (Image Signal Processor).

The address-cells for the CAMSS bus is <2> (64-bit) as related
DMA/IOMMUs offer 36-bit addressing support.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..e70f4cd1348b8065ee9f0e4448185cfd8a8fb7de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -52,6 +52,14 @@ properties:
       - const: vfe1
       - const: vfe1_cphy_rx
 
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
   interrupts:
     maxItems: 8
 
@@ -117,6 +125,11 @@ properties:
             required:
               - data-lanes
 
+patternProperties:
+  "^isp@[0-9a-f]+$":
+    $ref: /schemas/media/qcom,qcm2290-camss-ope.yaml
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg

-- 
2.34.1

