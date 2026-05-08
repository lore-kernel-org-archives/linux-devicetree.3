Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560752F2619
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275989; cv=none; b=upcDR8P12+3qJVEOSLSODxGJv9NiPGqgHCddmt+PZQPxDLSTv2XP6S2SLgXvOp180dH6uOcNZggbGyZKay0Yb2hcwyR65HvjuFl/AdjPZoqS3gRDquK5wOqVi2Kf9JeLBcQWfxZujCxLPDlKXFCKzMT3ejH1sJ4esRrG5Lzp4K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275989; c=relaxed/simple;
	bh=r7Z52qBn7Oiq3+44QCWlmOdEnbJHHdtV1GjdHQai3oU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=htQnEKpOE8inJtsIi3akw8vn18kgyul9UZLTSXqp+qjKuasdZGWdZQjkvJnoykvZ2/iwfgju0o3k6rwUuWHXV/LBYUTOidwdCflGZbHQVH5xulI1oWAuxXX6qPXHM7sozRC9Bpi5bS4nPi8yc1XncUb2jUtLBRk4xVOROM3SHD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNAdAH0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehEvbRPd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNAdAH0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehEvbRPd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4jfW1116256
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 21:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ecNTbhYHuyh
	QbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=; b=jNAdAH0YKmnXVRc++ujA8I1EB3p
	SaaHA+r/Y0HkFFNG6dcFq3Opd+3AyegXgHzRdbJFTFb7ZztzO1dbrigMuxFzgRsO
	5PPRwGPXmWsDfRCciL4++sdaTpztMIL+3VAK0BuPftWFLdL3wXCo4m+JVN8nGnjT
	cP+nsnLyGeqVnVjlMIxr72vaOsBMil1cDZRSYzoH5/RlyxF9yGBZIYfz8XurX4bF
	mmIh15RZ3+7Vw9I6xDfvn/tY9v8QQshopZaP01or8L8JEJTwYmcKv3TqUoS3gLA8
	umjOYHALIIxAHA7C4cw3xWUeISzUJOIBwa9ueC8vt7c4IyJQZfa9UicilLg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1ph0y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 21:33:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f525565b33so3250391eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275986; x=1778880786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecNTbhYHuyhQbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=;
        b=ehEvbRPd8Xweku9+usz5UJUBQ49vptXwl0vdncOxoJpz+kSJLSIlqUkUidXJAmrITk
         h5+CEslagbdXk32ucRYGXhUUefEjKV/O2KfyaFjMWTqcPq9ULwrEjq6ZGN1pQhWffV2+
         hTqyIe74dxMzqPffkUSjX0ZA626Z+uQ0N7aDI6164RXpi7hnOCEzOyxRxeaUBNt0MkXV
         E25X3MGYplXYGFABSNDVDp8kVbb8bgL4D9PX+XXD3OQo8zF7lAwJtAAJo6BYrukOqfPy
         27Cdc1w1hPGet2ujoXTV1p4vg1cZ3YrpvRC3iYvx6tAzF/11mL6Apf6wNZ5u1+ZWmsq9
         Xlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275986; x=1778880786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ecNTbhYHuyhQbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=;
        b=DtldaNbDx3YmoaFBhldLZRB7SLuQ2cvuQ8wUMvOHCKTNEdNyDWE5nlXLSf4P2s6cu7
         cp0I4/jVLZ7y5nkiGbj3oMT3s237G+Bew6l7R8/ZHTYbrBQY5YFUKDBbO0/9IaLscvTH
         r7Nts2Y2zff0G90qlwuwRPrI1Q1dLBIEm1+DP2Scm9QlyiAHjubzDEcneiDt00rQLXNj
         zbK6aLR9Kpt+F3O0RpjolWrSaGefySkAOUoe0fUa9Fe6JbFZ+2PDbYxrWcfExUlPq9gq
         tfQkhpxlXybc04djSxDBgLA5BdA/fKdCu0Ag6PQzWCwbMsthFiX/cypqg3cTT+xuC0W4
         jJDw==
X-Forwarded-Encrypted: i=1; AFNElJ+PsLo2DDSfimYoyusHYxwSf+ag7ne+VIFAqhmCmoJoLrVBLG97SfnDl19Pu49f9Y4Fq9cvyJgjQwWi@vger.kernel.org
X-Gm-Message-State: AOJu0YwA0cTZqYnUoPygjdTKXAjqxi/Yz3QZbVtkKZhOTWiFn6eF3qNz
	/66jQlwQddgtsGAvb8ce1zNvHqrbDPu2HSr/CZ99HL22V/OSsonPluXYhLzagwtDKohNKbeze0B
	hh0RyAUP14wqLyjcmBSCrAr6wd8zP3t/jBW+H6XLovdzcivXHaQIjLTyd0ZUooqSR
X-Gm-Gg: Acq92OGxJed7CYSQY5ssevDNN3hx1YfAUoi59HoTrExIm1wMJy5Nc2THyYPfXMAiN8L
	ylB+Y0DHuTT4aES29rD6My7ult4C2y4e+Arh8pwTraIw9S/u6ZQ4HjHekGNygiAfjB+oyGIr5x8
	vYl+f/3DaZOJc1Dlo54g+hROhuNFnZqg4wbtFwh/OlcCT7vbYom7XRL0nsUrxpeWUdwSSRWFPFC
	G6082H+535l4F7hmnl9uKAKzfrjInUkfM4a9KKf6bCzIfGQOMVx9Z1cW+my5yFdCgTHDGEmvt1K
	0dKglgHJeZvzTd3b6BQ/7XB52bom041oUButcjQSBN0/JTBmfLeWFCIRjSioD6vsAdLZRTajHT0
	UL4FRr1yp16DbVXc/0aSe/XwXzlOD+7k9Ysqs1qSbcRVnTh2CSZaEISdtw3PvfvWhbh5J5P0qnF
	g=
X-Received: by 2002:a05:693c:394c:b0:2df:71f0:e5b3 with SMTP id 5a478bee46e88-2f54f9447a6mr6846193eec.20.1778275985275;
        Fri, 08 May 2026 14:33:05 -0700 (PDT)
X-Received: by 2002:a05:693c:394c:b0:2df:71f0:e5b3 with SMTP id 5a478bee46e88-2f54f9447a6mr6846176eec.20.1778275984797;
        Fri, 08 May 2026 14:33:04 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm4871285eec.27.2026.05.08.14.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:33:04 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
Date: Fri,  8 May 2026 14:32:32 -0700
Message-Id: <20260508213234.4643-3-ronak.raheja@oss.qualcomm.com>
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
X-Proofpoint-GUID: hQlkukXdN7sknIUrkL_3L_UjeM3L_0bZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfX/d2nJPiuLE3q
 vkn3ilzxTsDt+pzX/pNtkkzliKgvGBGNHG/n3U7ldp943nL8y+Rjhw45WKrVpop6ALfPfrlMJNN
 VwbX//UIMmTO0qcg3zNkq/FZEcqilRvLL2ulIEcvyG8Pmg/B/IMlatVTEKzmpbOElZhYUkt5t6E
 zkeD10SEr9pzv6gBiPIKx7HrbJSkL3M07EBqpFercS+F5cW5pRTO9SZBRD2pgDSBWmGuoOUrSji
 iMad4qyoD+hNSP3tivL0pr5jw3L/ouy9spn3hKGjLt4urOiD1ctdLRwis7q8tPKk3nHjYuCGcMS
 FqVwwHn76mqtDq0wOTTot81KCtdOVykZJmZ711Irb78i0zLHAS1hRGU+WTxnhV5C69QluJ+yDiT
 rWCNlZcRHE1aOuIyjYqsiI8AxtMLfvAeYgRp2A5dKLnpeueeJTM5LqcxA5oX6P9l+stD6UGIJjl
 cy5Hd/NkAHGD9B6ZKig==
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=69fe5692 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=vC2bFTPnYnLVIQvTftgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: hQlkukXdN7sknIUrkL_3L_UjeM3L_0bZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080213

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

