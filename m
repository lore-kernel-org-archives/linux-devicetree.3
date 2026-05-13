Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C35397AED
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648610; cv=none; b=rfwyCCDNQhTD/GdYne4V+bAoXYqXppHzMhTSiWmlyN2wPpXaRW4/06gqJogglMGIzF1FAhRE7pWHOTK3uXjVkSIg2aTS7HtPVmUaG8o5hc1PJZOccliXqk5m1y4G91n7QRXJ4nhJh2V7zWDpRBY+RQjTyQvK+eB/Pg9mycfqY1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648610; c=relaxed/simple;
	bh=7TsvUbjc4X268M/Hx6PDGtVg97A3grZlDo4nulrNFis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnIo1+fFDXut1LdWu2D2kgQELKIu6n4gKZ5Wl4gPbdS94/ArWz3SGu21cdt5MVwQ0sKZhv5JO6IUss1WGkgJ5Dh7IgoOb42UvbWFLtTlZX6CsjRZGEBZwTIa0DuAS2/1xun+D1rv1UkJO8SPvO19kLg0JEsfbi8jBJtDRPyLdxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmryBVl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKwCz+cW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmryBVl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKwCz+cW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p8uV2331397
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6TKCr8g37ugTtUVFFTI4XZN1+gbzLZmDNfSb367h78=; b=SmryBVl3pHKpHNik
	sTYpcZz+4pwYTX75bae8coPbOKKz/7ycGtQqirdQvlag7AgLfktS2Ot1fKo9F7lP
	Xcwk5Bf4ODQTiyMTwh8AIWAS6N2tb54MI8nNrNVMwhPy/O0lS0oWYsa46XDcw5dl
	el+KNYmxMORIhmIcpCV+am8PZQ9Ku1We2BtjTwgK4sRwi/SYzP38KbMdaKZVj1sp
	BEnTPIVDJi6X7vM0iDDLBhN7cEV8mDQbk1a6Od+hFoF28BxIG4ot4vjiGA1+BRAc
	eHHJUv06FjXIiu3o4egErgZsqugHxYApDcKWlfajAtEOtI6WPLTqe1rwy0AS+Ju7
	XjQ+YA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43ypbdd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:03:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so4284549b3a.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778648607; x=1779253407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6TKCr8g37ugTtUVFFTI4XZN1+gbzLZmDNfSb367h78=;
        b=dKwCz+cWDZVa4aPyh6emkWja9LyhJC/YIH+xCriVaFAsss0qAWffQRolY+NckD4gty
         GXSlnGl37Um0YeizERF1ciz1wref3kOPjtfps86Yh/XwQ0xZBMGzIk/EB7rdVG89QNPv
         QoXzPpWdqCDAoo1L8Oj8WALsSDFrN5kYHQp2WDL5VJp4l4UEVIyykhnlzEkLH/wHDS1w
         OjKKfQk/9cjmNzGdxHQV86JepM6ivk+l65fhg/derOEo3sm8VTBPK/bqt4H/uhdWorf9
         5XKc/lGIHmYmJsGzRqm+2fK0F9JUgeq08P0HFbezmFxIMJAb8R65mwEEJOispWicHyOM
         QLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648607; x=1779253407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I6TKCr8g37ugTtUVFFTI4XZN1+gbzLZmDNfSb367h78=;
        b=ad0DhQGL1wy/8/+CB2HLG9beOzDIwPCMjszOPPFPS48I0doaxHjrk+gDqmCFyWoXwz
         unInG3n4v4DUrGa1zTLh/ojwjWSTYaDoiAzNJDKPKv2Q9Du/JMpCxyOvMcvgzXYUxfc1
         nZfYWfxHGOIOg7GtvX47+6ZnKVNeoB2moRKFcA1kvolJvBq7twySXatI05RvhtYMCJy+
         49w0K/kvY/fXHR+cf9vreWSouZEIX5sEOsXXWWPKYW3OcQK7qoBgBAXdfAFdTZAZ+tIr
         zflZiPaQeV75oBZg+YUqHmPryfFBb+kEHUeTpQiFPu6tN0wPg9EgTfTStUe8aBVMRPJP
         Rx1w==
X-Forwarded-Encrypted: i=1; AFNElJ9ARnwBLT127ncS4MjpNOQXkZ3FacUewwkCvTCxXcPt5/102HE/VA6G6pGP8RRxf9OwMY6t+GmU0Z+s@vger.kernel.org
X-Gm-Message-State: AOJu0YyLh/bCRMbppgtoVSqEAX6Pw//9VWPNkWmagYoHK1voZZ86EGVJ
	9JTbvfE0vZxQzQtNy4F4SyKx/tCnUktSmqR7W+3e+7q+hCPi1yhH1o8HHFzBNu6S3tOL9dXL10p
	wTP+8azknZ7hcgTsd7GHQ/cJCa4TP8nTNnE6rnSQ/zNPwAbJn794wKMVTF3CncPoH8I/7NhYW
X-Gm-Gg: Acq92OFCcIwoKSkd3bkNGoA5ohl44Yaq6nnhUXOnoG85ZYPVgZP1WEme5kopZamTqkD
	dWA9zQEmy+U3/hOXOj8kDZGF8qwR9n4zvi8YxuobwcFLtQ9TLJpuq75Hf+PNeSKZPRbOW08NxaF
	QD4od3lrp2Ep5fMZzwAPfqt0WilftBN6Mv5W1fvdCSvucDk88nzDNMfdRNt323GzYlcnGSekqwd
	YRwZzGn1MSHmuR9fCW7Gk4LCBC0l7EsUPH6WRawJUCBkLxHnXEl471JN+kS4wuh4kHDlqKZSUYP
	dM+Llt+TmsVw4AOV26XTFHrQ8Fo4iTugt7IqHtG9s40PlLMaGRlS7lYKstd7/JQxLqNdWBzyrHH
	WCuNFQKvpM+pL+2QTvR31MotvbIvRijkKorQ2r1eMjqVeIuGIaIimPMoHWngX6MXv841fe4QQec
	JUaL+2tuQZY0oQhXh0uEriRF+lDshW+VQM/EW1GbOt8zk+5/aX/2fLreaF
X-Received: by 2002:a05:6a00:1c88:b0:838:af72:fb2a with SMTP id d2e1a72fcca58-83f0547b22cmr1234247b3a.4.1778648606703;
        Tue, 12 May 2026 22:03:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c88:b0:838:af72:fb2a with SMTP id d2e1a72fcca58-83f0547b22cmr1234216b3a.4.1778648606192;
        Tue, 12 May 2026 22:03:26 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm26328020b3a.15.2026.05.12.22.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:03:25 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:30:30 +0530
Subject: [PATCH v10 1/3] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260513-wdt_reset_reason-v10-1-cebda08ab1ef@oss.qualcomm.com>
References: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
In-Reply-To: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778648598; l=1655;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=7TsvUbjc4X268M/Hx6PDGtVg97A3grZlDo4nulrNFis=;
 b=VoBc+jN+wqFW7Ah7rZA8jSPQXgMD6USrTya6R0xhgnqM++UKrbPXBsmqxhJJsBHbC4eDVewqL
 BElQVJoqDLzD7qiB6UPGfr+o8Nngez5TgKXYHveS/a/h2UG0XmkU4LZ
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: cABF7mhK_7UVmwlnHLVAtNxbkkhniHS0
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a040620 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=O_M3gYDVzo3QzbZqNbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA0OCBTYWx0ZWRfX1jlEUOKf5oXm
 93SX70C03cnNxt6lxygtOymcBVuSy467Tpsw1TPs1vwz4SQmXCXoJwLznLx6TSJZo7l+d/roM3V
 mKdqGSjRkk/Me8MusQ+xzJ2ZRWsCm08JobWXtj+lh0hhop1u+bmRAOQhx3T8Ibwtb1LlUH/6VJy
 RdkJm8KgtKP5hlOVqxps6lLMoB+syEDFevUgu4H5boj9Bs2CWgSffUOvb0vsNa3M2p6+50y2WTF
 nx+blKQQ/NPVmOkUPxmo6cjdugMc0SZLFmPPKX7jyzNzm3vWWXAJtUGeQzo85OfCxofdBOtI4vf
 5/OeMJv0taa5xS0OShlPdxDNK7W9nTuyrWDB1yjhVnOa9CAcNOOVJrpLAKTrj8J89hGO1Tdrjmf
 K9gvyS/yFBYKhJOoszzgMSJIe2fo/Q1Zlq0rtv368dZrWu/00wACIQ6JJWp9m2Dh/LuPOSg9yBf
 r2RNvRATbQNRZkHjVBQ==
X-Proofpoint-GUID: cABF7mhK_7UVmwlnHLVAtNxbkkhniHS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130048

IMEM shouldn’t be treated as a syscon or simple-mfd because it’s really
just on‑chip SRAM, not a block of control registers or a device with
multiple hardware functions.

Describing it as generic mmio‑sram keeps the model simple and closer to
what the hardware actually is.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 -
 Documentation/devicetree/bindings/sram/sram.yaml      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index c63026904061..576e627fbc11 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,7 +18,6 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
-          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index eb695698a03e..2f594f60e1e6 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -36,6 +36,7 @@ properties:
         - nvidia,tegra234-sysram
         - qcom,eliza-imem
         - qcom,hawi-imem
+        - qcom,ipq5424-imem
         - qcom,kaanapali-imem
         - qcom,milos-imem
         - qcom,rpm-msg-ram

-- 
2.34.1

