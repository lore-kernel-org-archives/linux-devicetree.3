Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54523E317C
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223570; cv=none; b=niMkKZjD4+A+1n6myr+a9TNDinoyPt5PFcAVLJU4n7+EkFuTt+l0vV9873eLXctCbDN7OITt6mkr7ErjjwbccjvoE2RapBdOpMfY+pvibiCGis7EmlAFb6lDxu/ZSW9DXrhcvtX7B0XZn2PCJEBiGy7QTxk5DH3GnqoMFG2NiHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223570; c=relaxed/simple;
	bh=jmfZMXY2+BGGtZtP2A9SNqzjmS3weGa45fP0SoCxPEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z6vepgaJs7tsA6opQH8YerKoLX4opInu+NGNAnToPXdDCbH1EtZqIjhTdfoP1uiUnI7OgRybFELWyda152T+1rlC3ZYNZoB9gNAOWoUAlvue+oi7I1CWeuuJ1eHLe/Acm9lYMxiX9znilcjIjnKjxAVbFQO+JQqWW+roAxAZbsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFN+0UEE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMxxivB+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFN+0UEE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMxxivB+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S63RSt1387522
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vz/EEJCGdNhdhKJw/J0AWn7zxktXXb18r9YS1k8E0N4=; b=TFN+0UEEgrt/Z8kP
	lQHeGrJGF2Ip7oqjqqksNieZ/ZogFebJTvfLhOeU14kibkggoFOdhzp/KfsZgzp+
	xIcIbvoRc0BYVl9Ii4p4ursTNXem4ZuDjr1ajytYmWr2madpBxVI7DeKVFD6Ekgf
	XC7QdgTwFeCVHcXZ8OzXqEJF5T8NMtiVQIzOzsR6rQzef21xMy0GhAnpepGJA7cc
	2RUBrAKWWs0dYXbJTvPiHoaHnijZS9ORVQXnOOx4lhrrZ6ehVxnZSXunTi8ZlUR/
	3Pqg7cv2lzC9hGG+q5T7dTmt7Bqha5AFnytRw/QDUPb+HUYVQVgch36ejzuZoIUv
	7u+8zw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttrb1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso42866991cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785223567; x=1785828367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vz/EEJCGdNhdhKJw/J0AWn7zxktXXb18r9YS1k8E0N4=;
        b=DMxxivB+b6OWNO4Mxj1c7b5COyoLU+//hYX1Eo9OIqLCaHMk4OYWc8ngUvBl8QFvyL
         ANnd8QVlptsEtAmWWXHmFeAH6Cl9swZQ0L3XWe26f01D6t1bloNXEPzfbWKPCJMFrRIu
         ZAY6JjrDq/QZUkO5Pxy8QK7oVMpt02o/a1Y0C/POs02ir6qoGBRB9lGiRZN7Ocqrwwcb
         IuziCr7sSGM3LF65P1oXAFVnNrpV8OfD/A/HUveIT1no7/m410eFgKHE50T6Nyqksrrc
         l7Sw5xWwCRLrMivhO+dlA55v/liuGWXIK5c0DSqJdwbZNDV/5q8g5V4GdqqRIgYXj05o
         zabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223567; x=1785828367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz/EEJCGdNhdhKJw/J0AWn7zxktXXb18r9YS1k8E0N4=;
        b=m6xgD8Yodp4ibfijy5cBBVhqMU5ZVrwEy7PKXmfnjxOomu78vLUH+TYiY3f65VIlbM
         nPvvqtzvRqULDhoKLQF05cxNI5HCLqhaRUx/iaXFOwPEohmvBHUdu8Cue9hhTHgXNcZo
         hsqoU4GGmfHI5aA4AOR9iWA/Pn42xTF86Kkzcy/pKHcx2MfA9L7fPuDeoJPQeqIEVTEP
         Rmpxuq8sxQr0/NhoyqZT6JGnkbVpJ7ZQ0qW5/bA4jmMw6KPrb9STkNv8/zXcoHSNkjL9
         TkiOXFR4eLdFhKi6xsNSZQRlNseFri8mOlajcov6qih+TAb4E0nhY3dZ7XfUFkwZCaG4
         I+bQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcMxPThq5kDmjO95jWFWbqE0ClMIuJ1xvHlCSqutFhYyBNTs/LGzCkR1n2s5IPhtBNiOQXS1L//1C7@vger.kernel.org
X-Gm-Message-State: AOJu0YwPWgZKkv46EfofvDyI89Kl9IRTvUX8u9QulHQyTI9ThPhvCT7W
	XDJYiXws/QRrfnUCo+U6urJfzsSJ0TAhbHEcdKJ4ccZx9ON6EOaGH2ramgXtW1oDG1w0syDpoxq
	VLh0wgnUz31++TKgxqigGPt1INTsj6GakSb5FzBaPGulU+72tefmaB/V7kO6HZJtfB1SKTQ97
X-Gm-Gg: AR+sD10Z/8LRFQLQz7KQK+My2f4dKe+Qx7WQRVcOP7Uu0/vjV09XIKB44mvV7XdgXOF
	H5d66iQBGFCfHoEoe91kJGxnn3asTcGNK2AkHstY1ZaDy0FyaGQ6B6/2HpezxGszuOWWt8mt+KI
	D2XNpj/goMeZBVrf9/OzIoW4qYhmJeZQVnxVqVlIqFABYkfHNrj1amrAWfQ49JjZm7QWaClcETU
	DJ40utTpjjE8RF3mvnIlG4u8eY9eQuoJXz3wwxwg1n+9TinJ5wSwexI1gAKJiLaTEIWUAgAKAhZ
	GOS7J+KGoan3+/hMS7SM3OhdYH1UjoJl0GOPZJBJDiKi9YrrW+Z65U1TD3mrKXwXgKCsX/GHB4A
	anoJU5AQerFkAUlBKjCgYHoMq
X-Received: by 2002:ac8:5f8a:0:b0:527:1f49:85d4 with SMTP id d75a77b69052e-529d7222552mr8887621cf.66.1785223566750;
        Tue, 28 Jul 2026 00:26:06 -0700 (PDT)
X-Received: by 2002:ac8:5f8a:0:b0:527:1f49:85d4 with SMTP id d75a77b69052e-529d7222552mr8887521cf.66.1785223566290;
        Tue, 28 Jul 2026 00:26:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm61340805e9.0.2026.07.28.00.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:26:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:25:53 +0200
Subject: [PATCH v4 1/4] dt-bindings: arm: qcom-soc: Include Eliza,
 Kaanapali and others in SoC names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dt-bindings-qcom-soc-naming-v4-1-39ff32071641@oss.qualcomm.com>
References: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
In-Reply-To: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jmfZMXY2+BGGtZtP2A9SNqzjmS3weGa45fP0SoCxPEs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqaFmGWhxGatodSFjJEa0OI+6BH0WmxjcMaEdl6
 8ryAbp7xTKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamhZhgAKCRDBN2bmhouD
 1+uaD/4jnPISWhqgVgkRaiwku7hf1NNNjxksh5jGj0XWeWys8MTCDlLd/y72jLbiJ2WfSiaAWV0
 haL34yOkOz5zuzaXvxhJmF9q8Xwlw+Ny2Upi/6s+Jo0xaZbB8FuY/02H4zGRyaztKkDsneTVjJE
 Kq0JRd7XmLnt/DptKPLhnfwaooO/UJ2kJ/9nIpSRSv30AIaAdjqXegtzLkccOoVKRMK6g44QVb2
 cCRVkWhuJxl9QtLm1tHyqp0e9IlGBZCEZo3/W2clK2PzO9PJBuM+LKx/bMMOExC5c177IlCQqj6
 IpApaen1AcJFFvbtPaJGl3/ir4+4GUL4G2neYUDhPh+9Y/MbZder1NGnNgP92h/z8E1wW95UoGg
 n3iejuqy2ViymtuQyhrIf4dqC0+H3SAScpiG3kcWCe6CNCcpkB7aIhXFvas7W50oqubTFjjHuoE
 zS8YD7Urn0aFL+npIZrOWvjZIXQCadWXfW9sbAtOSzsOjTbH2ZruwokVwQLEQN90Xjn3sQfYzPe
 9j5yjvBX8wOdEMWvxCFVEw757SojVO1/Q/bnfH5+JqxTN8BjgeUStWK1MuWkfqIIVi8HjP6ENOE
 59tloSumHeyTRoqs2fALJ3e2FQiE2hcKW/P24FL1bWAJnL1g/BggCZQ30wy1sUZnRP1dZ+CtyD8
 Q3j+RfQigunO3xA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfX7iN8P6Dptj6w
 PWSDTY6UCF65S2qRXfGlCGCHMVBAeDtqij4F8j6WX1Mh3AW/PAPI3VMCFrnglPHmVgtPw1x07Tn
 d3TugxhsHAXLAvdLpNMpj0RaBz63f2Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MyBTYWx0ZWRfXzHLD+iRuPo0d
 SV0glB04lN8EPEsD2cIEaNWdo4hBHaLATecXoXnWj9QH3j8E2C0AYq40LlpHLh/4AgUllslbcg8
 NAapfICGXt3gIk1ZK5oXHl+LPEcMs7X8iaLu7c8nVxdmcE9UTDuKySidJtGQnvdUgbnDyDJm8IN
 xNYR/dUH20mk3MuZyJoWti/9kH7+ikzghNlgOo8kDSEahR8D/HFvgb+0V9T7ZGOxRo+VoGIPnQf
 rzmikNjT5ouR2k5dryKj0uXXufeYTVzg4P+2U6P7dDljeigIqTvtVkRUZzCaZwdwgGfx7neyjIa
 Oy8k3x8/Hx+BTJXbWAXAfRv9NOCtD5rJuiHiGRxw4pEHeUran7QEd/H6SaNTrfze7s9wVO1Ajp3
 8aL+qLerOSQp9KEh/vBAu6gAx1lBOQFzQEb61Sk7Y9wGxkJB6zoId6b6z1f9N1nA/xAlG0YP4s+
 lfBNc9imT3+bc7u2UdA==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a68598f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ujLjCFpqU2tUUBGeNqAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ON4D2w24sp-d1-EsWWmccU-ffNXZchyp
X-Proofpoint-ORIG-GUID: ON4D2w24sp-d1-EsWWmccU-ffNXZchyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280063

Grow the schema checking for proper SoC compatible naming style with
recently upstreamed new Qualcomm SoCs: Eliza, Kaanapali, Hawi, Mahua,
Maili, Nord and Shikra.  The list covers only SoC IP blocks, thus no
Hamoa or Talos in the names, because these are codenames but not used
for SoC IP block naming.

Since switching from model numbers to codenames, this list with explicit
codenames will have to grow and list them all in order for the schema to
work.  It feels like a churn, but the compatible naming is still mess,
for example, the schema pci/qcom,pcie-x1e80100.yaml with a legacy naming
vendor,IP-SoC (qcom,pcie-x1e80100) received a new compatible with new
style (qcom,glymur-pcie).

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 37fdd5a080b7..1f9e52d9968d 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -25,7 +25,7 @@ select:
     compatible:
       oneOf:
         - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-        - pattern: "^qcom,.*(glymur|milos).*$"
+        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -36,7 +36,7 @@ properties:
       - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
       - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-      - pattern: "^qcom,(glymur|milos)-.*$"
+      - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:

-- 
2.53.0

