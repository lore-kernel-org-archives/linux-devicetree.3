Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C413A16BF
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510436; cv=none; b=bpUxqoifTiWJJo6G8CqdEqK88NGXtdPDykwdoZxzAJ7Qz1N39wPdIknTL+nDuZspSFYf7FBtUmMeTmXFUyn8xzPZzetbMdZ2aeH7h6P9fyWzuNaxqvKlReDRguLh4z6g76vtfSy5qV3bY4uClyfgdLExuvgrOlBk6dHwZz/Gs0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510436; c=relaxed/simple;
	bh=JFB7JC2tVqIvLepWGTYj7+r8PPtD5vD/Hp89OUL7d8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V07yzhnc8dVVgyqWn9uTnMRmLa/bKy5OjNRTR3EU4DH/H0SRuEYqxiNNgCvV56qZ65lFmmxk0cPtusHM4z69QR+alHzm/O8F8gdjCxOMl2UmlhYyoaKp6g5AtbnHJ7Kg45/m1yQ5E3nrDf7cA/cinKsgAnMSH7nNqQcTNXapzb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b520J/ms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHsZ8EYU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b520J/ms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHsZ8EYU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BA53cw2039514
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CKH4pqHO7nbXG8yzTHWH0x
	Bt1rF/NDK+c6CZIGwQrUw=; b=b520J/msy5qlRglrR8tKuJZ3BkOhRkysrDU5of
	YGFVtPKWYR2VfE7DIEMwqWKxiUwa4ygvESuPEXb/Q45ou/zYR/s/DuaH+pp994oi
	sX47APYor2ynffTcgWN+O/60CoyT5i4Uq/Ai3mqb8BgokgZQK5Bp07wqIGeWv/3v
	Peu01wmcEVHuNu1tyuDg39c2RCUH0sf5z1JRJfrHlU+zQ0GB87U0eU3gzJBcaqKm
	kyBA/p2YfKCYSiih/hmrw83YHDszh6QiCNTfnD6tlzwUmUKZWUrIB3+HQIdOKPCV
	OSTa7JyJDzSQhnqVbj7fNgH6yzMqxsvSj6MAbCh6R/oX7jUQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3d22s0x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:40:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2babbeff9e4so51688075ad.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778510434; x=1779115234; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CKH4pqHO7nbXG8yzTHWH0xBt1rF/NDK+c6CZIGwQrUw=;
        b=cHsZ8EYUsPu2rXAaHoFDDmBECaXv1V+n9M3SXQfzO5HNSP3G6PKsRarvE/FdGufcY+
         U2U3W4lhrKOZSiuwbEgZydFsrJ1I8GB15aPfVPwkAN+m2gmk8iygKr4b/IpfY0eGvCbW
         OqojgU7ISU4zY5oK0kF5O5hm1g2t9pxS6WvDqMC5nODuOX3G9aJP16WVW2ttDX7k53BH
         FXWIWdT3GKz7AxYQgJTifTQXTR/tCdXC7c2Apzzq3z0qldo13FODr3byaMEY8JQyPTD5
         A088Vo87xAat90MyTw9+Un40/YVPYLc2rHVXUYIeqaBO3FuyearDYs4I8MvN4GCuf2Ky
         0Hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510434; x=1779115234;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKH4pqHO7nbXG8yzTHWH0xBt1rF/NDK+c6CZIGwQrUw=;
        b=qyOV1NeSnB/yRoeIJEoSyJ18T17RWULeggUNaTN6rCfosZSetJ2uQ3K4OTBQB68+nN
         MQkJ/SYkJXp+JndCsFBlC+N5JtLMa4bMJQgiD3KYtkcDSg03XlRh7spuUAZxS2DosWKZ
         llfUMc/P6O4IixhAafWl186IUaaiKJwUNSw1scg6IYBDxRB8VDbJf6EE2eouJv7YVwku
         h8KYpowfhgSz4hitWnghdKhzNAMIC/zOZC7kFtfw/SUhdP8akzTmZe2ChPx+aoBt4QP5
         66aE38S3BvUN0uhhYG8XVmM2uHLrW2nk777F6foXPDfeHQpoJMHGzH7Rtr7N+LgN2X+t
         BIVw==
X-Forwarded-Encrypted: i=1; AFNElJ+3Th8i5w+8YvKk49P77VULEtblkAjoXzh8EpFuK5u4xlDC65AvHwHmhAcIdXjaZZkrk0qhy9Scgyti@vger.kernel.org
X-Gm-Message-State: AOJu0YxRVhKjiCspZH3g1zOqsWdrgwU/1sLUR93y8jgawO/7OXlIlqf6
	tnSDVWcw/sqzXW3ZXJ8VVUkDkwWI+3bTy8ukZ+/Lry/l90fG7S2zOv7wBuDKcdAL/SJM+WUzPhx
	7Y9/QK5yyARPbmS//5oagoOx1xHF3cANhSgjAl/DKrsySkX7nqk354HI9owArhX4k
X-Gm-Gg: Acq92OEaZw665rogdR7a1RSxbW3DOyX8BiIorSjTnS07woe/VaQf5ZbhfPkMEhOq8dx
	XrYuu6TIttS/TXdiL/0SsnMMuGg2a4UubMKWzmpkKcklQpZTZ4qDuHNxzusd39aKhDWabXIKe8O
	a8oolCRNFXpzQXgSLN07e+BVmXM2NOJJ4lIL0bcvKB4C7Ef090DFe2D4oFdr4Rovuu710sFdkB2
	6plQy/7/cP2dX1CCDOGZ3eW90BDim28YBHmn/m2A7ZyQgbJ2S/+rGrXNxp3BNRjkjj1fIbVp6YW
	Oz03q+HtcOZ6Mo5mWTZfn6+8Ja45uTpJkFZ+WhrgpWY4jvvTquK29Y6LazmelF9DKOSUcvjf1Xc
	eWE4HZK1wZ9bOv1irI0i4N+uWZaG2TxuOYwdUVUk8DIw/41xxLjt/VWghxMK1P+tCocujVczS7C
	MWgVOmrgVIYvkiHf69/sy6YTXafXGWYEZ3Rf6rEhztWnqgf4GGB7kVn++1
X-Received: by 2002:a17:902:8492:b0:2b4:68c9:302a with SMTP id d9443c01a7336-2babd4a48dcmr116656155ad.17.1778510433691;
        Mon, 11 May 2026 07:40:33 -0700 (PDT)
X-Received: by 2002:a17:902:8492:b0:2b4:68c9:302a with SMTP id d9443c01a7336-2babd4a48dcmr116655865ad.17.1778510433189;
        Mon, 11 May 2026 07:40:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35eb3sm107928495ad.41.2026.05.11.07.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:40:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 11 May 2026 20:10:23 +0530
Subject: [PATCH v2] dt-bindings: watchdog: qcom-wdt: Document IPQ9650
 watchdog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-ipq9650_wdt_binding-v2-1-dca22892d3d3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFbqAWoC/32NTQqDMBhEryJZN5IETGpXvYeImD/9Sk00Udsi3
 r3R7rsZeDAzb0PRBDAR3bINBbNCBO8SsEuGVN+6zmDQiREjjJOCUgzjVPKCNC89NxKcBtdhwm3
 JJddXYhVKyzEYC+/ztap/HBf5MGo+ro5GD3H24XNqV3r0/htWiinWTIjSiIJLK+4+xnxa2qfyw
 5CnQPW+71+42xQHzwAAAA==
X-Change-ID: 20260511-ipq9650_wdt_binding-06f96b6d80fc
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778510428; l=1233;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=JFB7JC2tVqIvLepWGTYj7+r8PPtD5vD/Hp89OUL7d8U=;
 b=hht1YkGSLtojsMv/3xTmaizOwbThS8DBBSya0UxtUX1XaR5ZMyREBH1czdCueHIa+OG5heENy
 d19L9M0eSfPCZUZcw3g5Yp5XXjrqzKEibLBrQDZxIRfQoV5ok+tKfsr
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=EaT4hvmC c=1 sm=1 tr=0 ts=6a01ea62 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=w4RUFeMe5Se8zSgF3B8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: qGa9GCmJHET3yPDvxNHNAGfE_oKO0HZ7
X-Proofpoint-ORIG-GUID: qGa9GCmJHET3yPDvxNHNAGfE_oKO0HZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE2MiBTYWx0ZWRfX1p86epFM9b73
 kKxnhu4uDlZL6GRJ4oBtn5l5djReVT7b9kaOgAXl/hz/8gkCi6FGKCdDaXBDt2spKsUO6Xtr7OS
 9TR9j8KfMTIjIh7cU695EHZsE2DNIPVMKW/o4X/IXQf3q5G7VVSMRpBaAmBzhKJ3d8XlXaW1mxg
 mDNc8Xd6UwV/UuU5qgsPygmJ28SoHvnOptHBY6QahjOlOzZJRY/NiBs0XdiOz33iUQeebyQTVZN
 1UjBgjP0Jxtt9KRN5VSsIcUzezroEv7Kj3sqRWCut11l/5FCnAbNSTA6DVvzP68wAPLv+uIkyLm
 GAfPrlWe+EatNG+YxHqgHazUKiABSF7/3RTbXMx67/2sxcXAtW6hKes3WWYuxOfchn+3TBUGwPN
 DhJ4MLxsGUZiBOiDMRH6Jt1p3rC5zLP1/24T3/QoWg+IVMuP9zwQww4rJfU56uBws7tSw/8bG/9
 OJaKKyMSj50doWAeQvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110162

Document the watchdog device found on the Qualcomm IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Fixed the commit message title
- Link to v1: https://patch.msgid.link/20260511-ipq9650_wdt_binding-v1-1-d2779e756bf7@oss.qualcomm.com
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..54b2378525c0 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,apss-wdt-ipq5332
               - qcom,apss-wdt-ipq5424
               - qcom,apss-wdt-ipq9574
+              - qcom,apss-wdt-ipq9650
               - qcom,apss-wdt-kaanapali
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-ipq9650_wdt_binding-06f96b6d80fc

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

