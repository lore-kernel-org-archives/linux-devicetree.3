Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6625232ED58
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504135; cv=none; b=O4O974lP8vU6ABF+e+KO3Mp7BfokfHYjeVATtqn1fbE4qR/Ib6k2r4oggbAz2jyBY3sLxIQViOg6Gk03AWieKYUvGEJ/Fx2oiSyWb6iIlI8ofKLBKM/Kh2W6krC4T6F1RpFie6kya1hh1e+zz2hOuA6tOlccJusEDR/TIm9zSFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504135; c=relaxed/simple;
	bh=+vT/E+tWHZB4AciEso/RRvrs6oCrmcZom56e4NXWz3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JuKnrCTqU4beVUInMMWf8cp7nsd2zEjryNd6VZq2Ql9nZlmHO0BOJ+FH1s6va3WuQt1f8IiLmzyKk5LzL7S/tLilKvBbZXjmTMVBtdiOOktMy4Bq3EWd1CeAnpJJj3YowuhFM2WUht9dgtTa1kjFLTCn8U9G7v4rrpA2beYgC8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOKXoLEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCkUyAJp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOKXoLEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCkUyAJp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668895HO2070465
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 09:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBT/T4Ffy31Ybn+2PA6r3ScLjie7ihMoXzSbe2k22bo=; b=hOKXoLEKO9srQd24
	IbH6CRWjcKhMIKVLxQXlXughE0ppcdUwEdCiLcHUY9I+CJsRMPqfYmYDP8OWidVR
	ZtIzRT8nv4KT/a/79MJGIof1F+c5y0LXKHj/4fJ2SMhRvICD61jLRQATWvVd0P8f
	IooJv6OMz+rIquKkwG+dDlMzn72gcJZfCWbCUyOPJwUz8KBW/H48a45jmK4Ga2pI
	ZMin0OTTqc+GkVgfoFTkG7CvkJhOFUayc5ySIwOFlcEXZWwNo3iqA/MJo6m3qEx2
	u9Z0z3NJSGHx6kvPMdPwJA3j20LbCSGNxoAbV7YYPV5v50Cc5zgsxiuWOmaS6C56
	32BcDQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5a1sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:48:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c33f48ee4so5358141cf.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 02:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504132; x=1784108932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBT/T4Ffy31Ybn+2PA6r3ScLjie7ihMoXzSbe2k22bo=;
        b=SCkUyAJp0heJmVnq9AD1XnYUZEWxX0lSrrRP2ehoVjFnZqVvqjrt8GPcfstwJe69tz
         n1cS2/haQ4/Ccx7zz9ORuSE+GatLTtoHXi+sjDNopBm1cAwEnX0R2ltr3zk6uSgv0yQL
         KneA3+EK2aDbUek5nU+yAxMWTnXidp+sHNSPFkk1UNnBRCdhVfJZlN63Cm7zxa9wa+Gz
         OSZVblRpM5EykvzTubP8ujSmNCnOVSyof5z6qLzwKAfvHG2XRleRSIInQmiMdQtgdi+l
         Zwz2bgSKSZ6IV9nuEgq0pVZbxEAGaUCTkdgjfMjXxl7si+4+hiAFiq8HxjI4Uj3L7gas
         sMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504132; x=1784108932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KBT/T4Ffy31Ybn+2PA6r3ScLjie7ihMoXzSbe2k22bo=;
        b=Wr4U6Iu64RIrmihgATBhMsVhViEZVFoKNq87iHQ5rsisTUTUri9+BlyGqQ1ddNvuqd
         k+BUVItwdQcRm17EONtSVaV9Zl6ivd3saOO1FSf6yZnhaO9cOrbzcRlUNx16ncXW+uPz
         99DMMD2jkbVucL6nOgMtMJFSbIyR/nZbGGT76wcpUIp3rddNJjWdATe0lMJJl8TnJ68C
         SWRQs+6eJPsszWLTrZ4QT3tfTs5NmNy7E7caQ9RQ2uSi4LVdcE9nWm+bWVi/YpJYXLFH
         QEEIYc6GRGcLjERM1d2HOZtpMFICtLtrGJGAI161fBej03DzL1MIy++rJ9fdhxoOYdvs
         4dTg==
X-Forwarded-Encrypted: i=1; AHgh+RrS9J3v/Z5VoHR2GG2Fnk++uEHB1aUhLB3+fY9QKeWHfrNp12HvdesUz3XQ1uEDNEwi26ueNZOKczcU@vger.kernel.org
X-Gm-Message-State: AOJu0YxA9lBdBGlx1vaOgGtKiL8c4xB+t3wS3tFrZU3d/3zowo7/WWvd
	n+9251/FNC3Zxtp9/nvYbwYQ7Fds4wH0XoPbVC/d6WS4KSNfB3qSqpD7ZDIjyZOmjAlO5DKy6+A
	yDX8Q8Dc6tm/2aX/FtpmIeW+zFNcBON72gwStsoVyyi4C42LiaPJ6gbj6bPHZ6beM
X-Gm-Gg: AfdE7ck5KngbktSbZtawA3YVw55NTN5lI0l/MvJ/ErIKHPgdxRGJq9zkIkEUC31FP1W
	TEuD57JQHjNAXDq/qWjK/FtjOb5zps56vdguRwOQmZf6NOkynYbG9SeXjMHpCnsREEA9ytsnVa2
	v2umovsbpK96yjuqN5LNyTqofB0kvMXJNIuowkGYm28ckz/pqP3B3dw/JIYPEwnVSqXj7tmnvA1
	Z/TcdpQcneXLQv4EGAaiWPzMp1eFLk8uwCY9OI3M57GOenDolnwnfVJ6bl901XttcDJ6AxiR9Ed
	OdjV6aqagP9pXybtiBHaGToUZyYlg0eu25ZEWFG+GYUSiPUJoqMQss5K6ZB2Nl8Im/s+GXd4+QJ
	Dz0ioSJNFZzgcQyNCZC08AtBqp7sEXN1t2y8=
X-Received: by 2002:a05:622a:13d0:b0:51c:4fba:5b12 with SMTP id d75a77b69052e-51c8b549328mr18157341cf.46.1783504132542;
        Wed, 08 Jul 2026 02:48:52 -0700 (PDT)
X-Received: by 2002:a05:622a:13d0:b0:51c:4fba:5b12 with SMTP id d75a77b69052e-51c8b549328mr18157051cf.46.1783504132121;
        Wed, 08 Jul 2026 02:48:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm114258085e9.3.2026.07.08.02.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:48:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:48:39 +0200
Subject: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-camcc: Drop
 qcom,sc8280xp-camcc from "if" block
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dt-bindings-camcc-required-opps-v1-1-ae0871774210@oss.qualcomm.com>
References: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
In-Reply-To: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+vT/E+tWHZB4AciEso/RRvrs6oCrmcZom56e4NXWz3Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqThz8RE5I/GM5fk9P5eI/NN3vbRInOctpDPd+Y
 BN87M+WWHOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak4c/AAKCRDBN2bmhouD
 11bDEACGZnNsy8R0OzBuKqblRiDFn+wbKnVMm5IPUlTBLbwhPIqpCHkGLZBi2okQ9Rq4u0rUATK
 LCKTw3B2wallVFSHWnV1PFC++TIJ5+XeV/fvgfb9GnjbeVSTCn1zKxQ48bGSb+trITflbfo+/pa
 67PsVRKqUmC2ociNhlDfTRngvXWMsquEY8xxCawbAsIHj0ZO1SWEGHE1s8LLt+3iakAPUmLhaTP
 RGcAVV32s8qr5JX3MjyhgvOVIch/IJlp/ICwWOQEKpUXZnOd1Zj1VKfOiMXhWUxZntTyng4mQy1
 4+eRCG/yvY3TOQhLoFAm6pmWWIEhKj3cOp13s3xuHoXVC6MLx8yNmBWaEquzNRuJwYrLFJFho1x
 OnL7Amd7AcXqNo0ldIm+PZhGSK3a4nt4+0vl/J2fXv5jm8Nn3xBE4V1O8N6hP1og8SAhTE2OMcu
 tOAKtuUBKnAr6bhCKIe/b7Hst4GP2JpIUO2MXI9WrTxZ/WCA0MK+arBKoWKucCDFQSZ+9QLAlDS
 C72dpFgZ8pBJAbWeq0oURDt8s9Ui3Gz956FaVQKOYwQ8CY22dpN1MJWypgshzrHWU/zBMXzbt5J
 kv7+oGV6xlXucL/6ZY76CaoO+NqyHD9Z2VatEAcgh20dr+N+G13O9WYQ8iSIu4HHNaNSXeruIxC
 T2Rv9tbxbN3e6VQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e1d05 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gQe7VDfzUBWdSbS88OMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfXzUV8c4cgZ7Vv
 DdnHff0uweBPO3CBPfviNX3snot8M0byZ7RF8c9lGO4uJN1MIJ17USLIvXin4K4sK3ZY9O0Ws2W
 BdtO7fTEIwVPq53OcfEUbH6ezSAviGw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX1VEStywVKiA0
 dmwL3stcvFFS+LK4pLjF2x6Zm+9LrJZXxlcwXELnkT8c/cf5/VwOdIezxSheU3ha7zOPVZCxVxT
 tJXoNa1KqcBPe0zXZ61MADGQSTJkDoifKGO+UmOjEUT6bo1oBULUiMQQXrvzh1+ybJbu5dVbaN0
 a29v2xnBy692wAw0fCzd7PF3zN3ahiGXW69zfeoUpm/DOc1omDRc/KFm1yLbqBK8YLbFvyOOFHP
 DB2k0wmzVHuvHWZryKygfu3APbp2sLVLW79YkP1HARFYFFNhPga2owNTdOfLQTk8gBUN7Xu8PvH
 Vi2guYmKyVx8ABTiycz8MWPc+wiVPtdjCB6qv4VSKJ7DOYG40ILJTaOhfjrBvlpJiUtCTgfHw/j
 sK8xlikHYa1lWbAd8RYodYLkacx1k4sNu1a02gxtiKVs3ldqUeqqStjm8o8as6gJpN1ylIXdxpg
 Mh6L+IftBIJh0LiqVQA==
X-Proofpoint-ORIG-GUID: 5x2owkGqw8LxugLQrbZ7-Yqg47awanvR
X-Proofpoint-GUID: 5x2owkGqw8LxugLQrbZ7-Yqg47awanvR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080094

qcom,sc8280xp-camcc compatible was moved to own binding file in
commit 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move
sc8280xp camcc to sa8775p camcc"), so cleanup redundant entry in
"if:then:" block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 8492a7ef7324..e6ffacc81d0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -74,7 +74,6 @@ allOf:
             enum:
               - qcom,kaanapali-cambistmclkcc
               - qcom,kaanapali-camcc
-              - qcom,sc8280xp-camcc
               - qcom,sm8450-camcc
               - qcom,sm8550-camcc
     then:

-- 
2.53.0

