Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44E4388E55
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379467; cv=none; b=Y7XijKbRIzaanqmpM0fmdpsiI0U6IxsVMcGnkXD8VO47cS08Fj6qEVexc3s7jB98cbuQakRFMUYxYGYFBkKuhZLwxLnhQGkGBOuYBfwzoPT7cyk0FqDvyL86P1RfoOXrsb04RWRmP4C3pGuLbQy4i3uw/a+ehX0xFQUjuwbsMdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379467; c=relaxed/simple;
	bh=xt0dIfbU0BtlsPnwy3/JUQfeGdBD3gUJbPZnDZ4FIF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SApJubplWAvIO1NTsdw8ascbA7Ssq9+LbyhLFptOsZiKml8WcFyQoJPtO/LSgcsEmDysbxHohzvpZrn/I8nc/C++s/U40P49FCETVBBqdqGEmi+eFuj8h363fqHgeqt8RzZ5wnmzBPQoFBydWSQSQqwANvm5+CW3Wu9UViJYO7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SwU3NBRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQIdrWuJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwU3NBRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQIdrWuJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHMvX026861
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZd9qdn4jJ+TfuW7atuuCkzu1ujKCTjlDR+NCFpwtEA=; b=SwU3NBRJjJee0W/q
	TJuu7Gm7spZHzHkFoDvJSUhPW8Ty8H9rSc4qqvJCqtCp3v5++9nNxIk7By4KqHGt
	XS4/ElebD9VLxVWcKAgdLNGSVKpaciVIT9K6IK86/iBMUvX2a0sd+nja26sJnxXt
	kB2nvlfYKUKu2eXCgdCw1FiH8NKd1aAF92qsGmjROSFHKAeliDFeqzISVVjzO4lP
	0ssMnn0WsXL30A5UJPcmAaA8sCMTcyKjSyB/TiCCsDb7PLTkU6xLvpQvPGEgS3Oq
	Oh/BmTmIcmlR9Bv9lEmYWzxNhEn0JPQqA1fBz9LaLtuio+O5aCeT7z9kHAZQOwst
	oqt/jA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhgqtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:57:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso11263563a91.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379464; x=1784984264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZd9qdn4jJ+TfuW7atuuCkzu1ujKCTjlDR+NCFpwtEA=;
        b=CQIdrWuJsvFpXuoFtTG2djHGQxK2wUghP8ysA/7dFw1oWxpi/2pMpDSC0qM2I3ZKSC
         7RdyiVgJ+bFCrrg5p66NVR0tgFOQ2nZuoLUiHtHuo+nfUegVJvGa6WB8oaRUgSyZVQ2D
         UdIDwPT7R+BehIBzVFT7S7JKccF/9Vk3yYqKdxQNWA//+5m/slV9YOpH0+9r3HcO04gR
         fYD9Xgqz9kFytrg1dNwQMDavxAIlbNTY6NkCcSnAWccIpz9XZ2l9T/+wy6xAHEm/tPTa
         NLPCaRy8ysP2WbpHbxZNkw2S/7kqVtLcCHGvMVKq/AiO07mzMRKTAhwOxOiXI+hLz9Bs
         imeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379464; x=1784984264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZd9qdn4jJ+TfuW7atuuCkzu1ujKCTjlDR+NCFpwtEA=;
        b=W9RbPBKYYAdpOiDdiHrWZhyH+02Cjy6jVojFTM1r2bH16Rs8vxWUknuIYuQDaYo+uZ
         QPDuY2AXg54PJe6MPBi6mu2U96YBHbAUOVauSccc+y6V49Qb9TlluZlihfwlfPjsstjO
         zVO03PtWMZpOjtL4vMsCt5V0aH/DRLodVflzcSF/DyGzELlBL9vYVYlUQ6mjsM8MtLmw
         M3YZhVY4C7eGPUEsIAkAUSgw3JubVMBu38hfk1xYEdjixP7dU10adFf5ZJtnl9ThnvjW
         8sswcW56DDkJwBma52/Cb3GOkFPAV9gzcwerOKzN//8ZaKLF6t+ZY/PqeU2zY9pkJe2H
         XOUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcluO3nP9nFalb3kd9SzRXX1c2haVg0PmUYbbT309fgsc5WKc2+Kkx8yxDuwIr38UOJE2xGgyeR3Yd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp2ogcWz/4xzCCxBixn5ja6q2DuStIscoEqHS2qPkOEiCVB9vC
	qH9+2o5KsAJ1+z7Ix0k67mN1asXBUe8yqMrR5U0CAb8PF/ANGcoAEhVMjpFy5yrj+C86593mKi4
	wR3I2NBO0Dve2TQ+mgiq7UeoNiuZlsHxo0goBx07ef4FaBVK5x57a6vxoybJY3cxv
X-Gm-Gg: AfdE7ckYn7ziDXyrm/VCOMSUkGSgaflxHBdGPhR1E9x2aDxm7+Dw5HJwf4VUKF3DdIP
	du1x3xd3uGYU4+a7QPb3rZcOSqW5ikNqoPbMWBDgiFaYADRfaTqfh6sJSEXR136pRW9rkUO6LZN
	e7NqmPD45hQFmAi/WJM/yFvgNWpNeeyqRAolsIH2/AKpD2ZtrpcVrVNR3VAkY2b+nTJfdoG2zUQ
	9Yp9i6mtGUTeSnC11N9a3VUFP9idGPBM+U3wSOH+g9ZHkNxothYllw/s7WxIzdukqiH0pnEWRH5
	UW2SK/g5LFbGIA5aqThon8PRkZMOX31BbtYutUCcVWFUK7SnRX6QJkcXT6zx76fCm5uaLyY8S0R
	XklvHBifJ1JDINFMEux3HKfBIIsNZJp0=
X-Received: by 2002:a17:90b:5908:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38e4b448c32mr7467135a91.15.1784379464469;
        Sat, 18 Jul 2026 05:57:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5908:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38e4b448c32mr7467084a91.15.1784379463998;
        Sat, 18 Jul 2026 05:57:43 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:43 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:20 +0530
Subject: [PATCH v6 13/16] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-13-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5b7849 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zFVXnba82tZ0OxNrzBkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: zwGNWeNxsnlcML6-urM3053ZfGZAANlH
X-Proofpoint-ORIG-GUID: zwGNWeNxsnlcML6-urM3053ZfGZAANlH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX5uV7H834wd28
 T40EdDnpgSDXJ+2MyfaOXER9ggWao97M1U9sT2cpqqIOwnusNpz+EZlqRoSGLbp+tIdu8zXB//D
 juG8wfK106qCJZWPQ0eJR93eIfo/vEHnbEOFG92irseCalNdMcBrDoKDvJ00O/adZuZJQf6QZF5
 39qH5ueMGZIh4VA1xaxK5R2e0g4152vuGJHz4oDwuPIbCAngc7cJkfsQlUiddH58/XHxyxjzVDC
 /C7vBSvqdM4/JeUO7iyxE1qLSxWpXYnv8lmDlaBHnEdtnhDyp714ggKAI5LZ7rX4kEI3U4Z67w7
 ccvFk662W8fQGCgs4xn1kYrqVL+PWFi6aJOe8E9VruEtky5AfxYUedlJ81SvELIJ8NE7TU0gkyv
 4hVBLZVvnSKjZY0eQSW+W0gv9eVt0vZqlR6xfrkS9haQmu56Tbu4LUliB0LoN9VDb7lm8mmMbeq
 32WVC2xCnkBwfEuE7cA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX4gkISRLfqDmo
 DVTAboB36j+aTuFSZcFORIGut84lL0MmBkGovEacBDtzCr6Idv1KxbydDKOpfrvAkDlZHPQ6+hL
 wZGln8CAuIhD4pDcR3x9AfyLUv7jC2s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

The Qualcomm Shikra Display clock controller has clocks same as QCM2290.
Hence, add support to use the QCM2290 DISPCC compatible as fallback for
Shikra DISPCC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index e9c2326adfd285444257b96f5adc68e27213281f..8d4f53c8a6cbf9ae89475381ef6ce6e7b61b006d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,7 +17,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
     items:

-- 
2.34.1

