Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941B54502F
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251558; cv=none; b=hcogfsR1dv6IG5kShjOi4slk5jJgvBzFZF5V0E/CDkeeIJLbe6YtjQH8ELlnCXg4SbCzk8x3BE3/vc2Ck4FWI+4CK1HuNdixiUpXF7UAVQewVSimWIEXPIG273+2deJ2B7OJ69G16hGLc2Q9QBjzlD1JCa7ln/+6Stz9YgxYqGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251558; c=relaxed/simple;
	bh=WwAukQBvBlQKt/0sDy+HB5jTVqYbgBzmRl7sIxg3I3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MS61gCxxlyPDoRVo3+tWk1cDEm2hEbBp0Uk42Tfa6dpS7Nfmi8hRH6J8BEfLUc0lHp7ISNwrhWW9V6oyZ0KNPpOpyxiSIzalrBJeYPOiwkevzPYERz33M5VyBYTaxN0Mufo2Z/we4qbA4zjPuSyZYPfcodk48uAjg7hbvlHi1u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFzMCJjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O48mi7I6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFzMCJjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O48mi7I6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QGdH9s2878398
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CSCClgFCGdfxbkWymQv4Z/NTd5LMxxMp9Gm
	3xwHHSoE=; b=mFzMCJjhsoQKPKe6qMmFWjCVi3Sem3UUJ3LH4ag/WUJN12+v6id
	c5Z0mtK3Q6gH1zlucJIFnSXr25wTBM27Z7iVu9r9hdWRAFikwn1+5Gn9z/cxwiY8
	yiSh7M1EfHUbqxeOmBz+xJZJZV8rBdwd3lGrGWQiKwNQiXiRpbCst+XODgArRUhG
	rC1HtXxZzBIv/tCv5MVOTjtJ2eGAbQeZGI+YN6jbDBgU+XiWXsS3yCuy0dQOMQLB
	CrS5MrgUsBzwm9PkG22N0mx5ptAyMIAakWy7kPDPe2+lP0MWJae+g3hMf3ZVLTfj
	LfL9s2+/aKd/Bg0XU9n1xALI0rRD+6f2B3w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdktrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:59:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2de07c12745so29269604eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 17:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777251556; x=1777856356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CSCClgFCGdfxbkWymQv4Z/NTd5LMxxMp9Gm3xwHHSoE=;
        b=O48mi7I6wxixCSCsK0xCfzwe36SwyeS0Gl/nZk++WUEwhRLxgWmF1uuCA7V1ssEQly
         BNWZSQjbZY4qrWRBA7gNP///3kr7kuUii/30A+eVvPQdJaNUAtb/XsPQO2leOt2P/fRH
         5HTGV/DRNT5RqakyVmvyurVBn+taC6xlrUa5ma9Ka/ZBdA41H+Lb352Ir6ZoMuauhhyC
         N7pE3oc5XXtmlkersb3LV/G32ei91EWnyxiZ8vKefElCdpjzW/BcAyMdKsiWyojn2cqh
         4ID3cOBcFZTaM5B2hRAfAkhAoRt6MKpJT1zfA7WRmiE8oRMA4W6KCBYIWg+pl1bAHo1u
         GG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251556; x=1777856356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSCClgFCGdfxbkWymQv4Z/NTd5LMxxMp9Gm3xwHHSoE=;
        b=SnVrMbjtUlKlsdJTO55JP579X6TgFSkKXAPDErozjSNwExyfIQhhq1rAkDS5MEHqLX
         aT9lDKltXrtvnVaPNjnHIfSieXmg/a6fKnhdyhiiL6tjvNU6js1pPcwxFKOwUBS4vYR/
         x407oO9Cl1fAfhbmXYa0BIGb2pPqniEQQ0PON0yDgCt9uJKeiUEBpPaZegvHucjEguhS
         KXLBS/f0Qy1tL1LCHCUVHh6p3BkUtO32hnvfGZgYlgplDUpsGh/CM+3WTeq3fw7nQz4D
         ylrKgQ/csxq66S0bYQVjHVbIJRbm6RcXwJtWm9V4m1rzYcn5CrC1W2/YBIycscvuJjzl
         haLg==
X-Forwarded-Encrypted: i=1; AFNElJ/JgKIN78vd7Haswa5sbaVyyvSOaHLOJR7j0W7BLdcdsUJZ5cZ55hJttalM9k55ejegMAhGOTPgynS5@vger.kernel.org
X-Gm-Message-State: AOJu0YwD4/I0+01WG6mPhHC8WEyVYg7Hb6SkIFs/43xxcxavG/+P7oMv
	526uqfEY9jVxKZxs6nadX4Hx64yklt51ixyffZHMhq8iSFEwi0VqiSeh9dYkF0GIUx37+hhff3r
	wHk0jPjd7qNXwWgiw8cufdphRG0w3ia7TL9xaSt537DIRsSii/odzLwmD/LsRG+1/
X-Gm-Gg: AeBDieuLZOTKeD8YLx/KdzgQMx78QRkiVBWcYupSPYL59dL4q9QrlQYzfA8FCz20Ylg
	nhmqQDF+eOiv80WIEKPUeDnuTpsWY8jmCIweqYGddqhXmI4gX96hI4kGqJP+1R9EXto+jSc5a1d
	Qors3piTvulJMY1RMGbI5Phg99XaSB/m5SQDXHLBYQ1NF1DgVYxuMzQ4YjZrhFruTAIjikg4+Ow
	w7MfOE5yKrIb9URVempvDrTmU9VDjlVPUrmGbkJET5VlGhVjc2p7aUqbl0oIt0SrOy8E7N245d2
	77FGKUd/lrUmVVHSRHqzLwQI01+19Ls/vAq9SIweWEXEhaX4MTxgVxnf5MXMmkuY+SbmgjHfxhL
	Ul79QrJZiExPmtNdm1KCUEc93+dZbZ9nA+dnHRpLtvAZBjsUrDFg00fj8zsxK4B96t4caDXlgct
	OzxNMbUuU/SAgnaxbO
X-Received: by 2002:a05:693c:2b15:b0:2d9:b466:5e19 with SMTP id 5a478bee46e88-2e47a1058a2mr25167330eec.21.1777251556242;
        Sun, 26 Apr 2026 17:59:16 -0700 (PDT)
X-Received: by 2002:a05:693c:2b15:b0:2d9:b466:5e19 with SMTP id 5a478bee46e88-2e47a1058a2mr25167316eec.21.1777251555723;
        Sun, 26 Apr 2026 17:59:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa3ce1sm39253861eec.4.2026.04.26.17.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:59:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: qcom: geni-se-qup: Add compatible for SA8797P SoC
Date: Mon, 27 Apr 2026 08:59:01 +0800
Message-ID: <20260427005901.230237-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNiBTYWx0ZWRfX60Iug4/RhAZ3
 61eXaJPuT4zsc4knrfr5FCo0WHY2EOEFYA6WSKT4alNg8maVGgKD50YvCUHEfhvgIhljlBTgnfA
 z1wCu4iaYGqBUcyHqsXq6YgoN3NO9PjHC6aj5BsVKUHDN1hfTDmN9UdoB+92U8kJHkpabKpJfB/
 IpCufkX5tyL8uPohazXddyxGWxFHxTEGcHkDZtj9O6cBidLWykRPtSDIqo78X6xRdTUxs+FDUa8
 FEdP4YxtQKfBJVr9wFw34WNBApeaTyJqW9qPZkh+5i2VJWiPmPwgJsa4jQzFQE9RviQeySBoWWI
 sSKxuRJOHwll7h+tPdnKcZoJtB49X1jXZwu+7uzcExTkjjsCXf+nHz9JtTXc/foVE+3GmOGQUuB
 WSuJIOKDgv+jLwqg8UAVTUa0AIwN7Zoyrh+5PrMdpTOrOSim+vvb3D/jBK4wrw1Xl2zTqfrcjMa
 pV9HcOZeB4OEmdMk/Zw==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69eeb4e5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UCCXU7vEHtf_CmXrlTQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 1lbB1_OMlly69RaGerBn6IcYAPYClRFV
X-Proofpoint-GUID: 1lbB1_OMlly69RaGerBn6IcYAPYClRFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270006

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document GENI Serial Engine QUP Wrapper Controller on Nord SA8797P SoC
which is compatible with SA8255P one.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Fix indentation warnings reported by yamllint
 - Use 'sa8797p' instead of 'nord-auto' in compatibles, also update
   subject and commit log accordingly
 - Add missing I2C and SPI compatibles
 - Link to v1: https://lore.kernel.org/all/20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com/

 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 31 +++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
index 352af3426d34..9c38ba59662b 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8255p-geni-se-qup
+    oneOf:
+      - const: qcom,sa8255p-geni-se-qup
+      - items:
+          - const: qcom,sa8797p-geni-se-qup
+          - const: qcom,sa8255p-geni-se-qup
 
   reg:
     description: QUP wrapper common register address and length.
@@ -49,7 +53,11 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,sa8255p-geni-spi
+        oneOf:
+          - const: qcom,sa8255p-geni-spi
+          - items:
+              - const: qcom,sa8797p-geni-spi
+              - const: qcom,sa8255p-geni-spi
 
   "i2c@[0-9a-f]+$":
     type: object
@@ -58,7 +66,11 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,sa8255p-geni-i2c
+        oneOf:
+          - const: qcom,sa8255p-geni-i2c
+          - items:
+              - const: qcom,sa8797p-geni-i2c
+              - const: qcom,sa8255p-geni-i2c
 
   "serial@[0-9a-f]+$":
     type: object
@@ -67,9 +79,16 @@ patternProperties:
 
     properties:
       compatible:
-        enum:
-          - qcom,sa8255p-geni-uart
-          - qcom,sa8255p-geni-debug-uart
+        oneOf:
+          - enum:
+              - qcom,sa8255p-geni-uart
+              - qcom,sa8255p-geni-debug-uart
+          - items:
+              - const: qcom,sa8797p-geni-uart
+              - const: qcom,sa8255p-geni-uart
+          - items:
+              - const: qcom,sa8797p-geni-debug-uart
+              - const: qcom,sa8255p-geni-debug-uart
 
 required:
   - compatible
-- 
2.43.0

