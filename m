Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C84A30ACEE
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 03:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775102062; cv=none; b=M8V/cNkujuQPFvVzIVi2H7hXUB/JrzITOdEvR/IIsJX9GLsM0VSlR1LW4FNYPA2uG8J7HEsHEXnpahGf820d4hpEHoypHDeF9ThVI59hda60g74ookxg4Hi8bTUK9XEBpsbgL1p/meYSPeU9IihTLCq9CEtd3Q0y1tybCI01tTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775102062; c=relaxed/simple;
	bh=evF8UelYqeYrz/mPFVVwmW3vrS6iJxnqj0DMj4NnPfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V1sWyLm9wB6JmSKh7mTMkZeIwYaiUWj4G53Z48l7RDxP4X39W1oAYAe1AEsCodngYEq1cE+Oo0RlC6KkHVVvRGmKT4Era+z6/txEAcLrxYyCLrqq9ylmvM9IB5RYA6SxiQWImi571uMlsTelEEKjrWWTUo417zYtQmtTlxmXSPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+UYTIgU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWmEjTd+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+UYTIgU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWmEjTd+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M47Fk2903859
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 03:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=; b=M+UYTIgUMZrH9zmv
	egLUbU1MCT6jsyUW6xUZUq2aAAjK7Qd8dEDAz4EYaHY2BWt8nyw3q6vGEmRfOTB8
	luZsv6LM2hwb7hMxmPBO+HsXMP1dgJJkwEBpB81VzN6G+qqAaPCz8kqPaH7YmdW5
	7mb/I9mI6tNCa7TS8KeHk5B3SmGG4NunhxxMbrjmZBA9hfAfQs6BQNPkeVh77xNd
	CsKHKXDkJ827mMOYc+AHVWXjPdEaDi4tosz+UxT1oukMVy6l2Nh6W+FPa4uC6mbX
	OlBzal8sHf1RaBWVoTFXBGiij2xs16yhLJ9NeqRpjTG7ooLXPtsCOy5gFx6CcoaR
	h0JUpQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954canqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 03:54:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c613194caso258367b3a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 20:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102060; x=1775706860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=;
        b=PWmEjTd+g9epBRNl+LUQyu8GD5cDOFDT5/JsXJ32HraoK2HzJF2nWn0YEM4fo+7QmS
         dqNgXFbiClsHm2a+udhRjC20DVxkDXhZs7WW5+zqimwbma9GuxN3Vego7de4lHGObrei
         RNLla7p0s28l85hOrn2hKExBZ++ZTfIOLY/Bj2t2WZj7avpwnjhXYbOySRtqp+oRgsIC
         DgbHknVVXm80u8X8sCt9WMq0JA11STEG+Vdi/jYtLea7jjyfoqZ6Xs+53Lsifm1GHI8o
         cHvfu9xiKfVkULrYce/BfELJB+J2A7RwqQMDiqdRK+xLPZ2ODukx7gvCbkCLl/IUvLtP
         qfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102060; x=1775706860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=;
        b=Khm5glCQ85fBBtO/IgraLbf2nJ31Ib7Tz4JBzC8h90SsrSHlUJ3jU9YpO8hbJmx5eW
         aonm7RRLU0Bo+n22iXankCtOGRYVWz3x3MReIvR9FmWyMguulR+JqBm7NYDGOleNvG+4
         AkVrz00wJON+3sZlWBfVpuxeJj2mkhg/LcMDUErvfIWkkVo0Wyo3+gI1vIMUAIpKMFrp
         +gPLgGgnjaSDV+DNdPj5ToEDfjRWiJVMdv8FfzPKPr+H+l6MH0jSUXoMtzoKpRMsW4B/
         eJ+ca5qYsybm99Ovot0uqJBEtl7kHVtzRX3aUNekAqvJ6sjwATF8qiP5pEFeYIXBw6gq
         cr4g==
X-Forwarded-Encrypted: i=1; AJvYcCVmy3J85UVIc8cGdCohofdFPtcc4/r1rJV23fLJxSy//kwJ1VurJ4mXWJKyBYfprGUxNdvQHJXZh/6Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzSGsdEP64wdrII2cM2wHpO5EkQU/1Wu5g5zBBt6LGpysSXE9X6
	eqBP8KiOHWW2dq3mYZjkijj1WUWM4zhZewQTIXcLyzy+6wGfNBvTQHq8cGSkYBb+SfK/Gj5hGIw
	0YoUZ6HcGxl3c/S9kyR+QsHeJPk+FQTdOvTow1+V2hD3iXWhMHag+Q+51IcXWmpuP
X-Gm-Gg: ATEYQzzEZ6rkWxaiqFTM4DjoI2NFvw2YjMCH/9MzMYWsOGN8z8A4lRiXww2Vy6o3CbL
	zWMY4nk17aJQuPffXIkx4Ye97ZMOsbSuDmDyKldKDvborTRK2QEURdol1N1vsPQoO5mUsvEu9pU
	5KkOPkRs7mCoLXrPUaHORJAJdIHUnSpI07k7ceJHgxnSOXhJj3/3OqpfQMNZWJEG9rh7q71BbkL
	n0YJylt2nxt3Cep8wlOdHBn2kGLRr/3q6WGLd22iZQhr2emxM7bSg7uVtjc7Je9YFj540+oOWch
	jVd/QFasMZCN6KE5uMfFnjrK5OO66ZkFVI4HpS9RBEFgdVfvOyaXHimegYtx6kwmed4UlXjx9Ru
	MmAQhHZrEgbY+34roF+Yl3x3mz+FnJnDYheF518JxZiKL6CY9SQ7gbGcwemThEjyBgj77Asvjx1
	BJIJXoXGE6bvCvv+ZgElESmQYtLXWTvCwsxevSI8U=
X-Received: by 2002:a05:6a00:2d1f:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82ce89b5662mr6343743b3a.39.1775102059873;
        Wed, 01 Apr 2026 20:54:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d1f:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82ce89b5662mr6343717b3a.39.1775102059413;
        Wed, 01 Apr 2026 20:54:19 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm1456189b3a.12.2026.04.01.20.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:54:19 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 09:23:59 +0530
Subject: [PATCH ath-next v4 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ath12k-ipq5424-v4-1-cd1e0f0a6c88@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
In-Reply-To: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69cde86c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=HmtOZnpMNtbFe9RdH4EA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wC1rNdrqjVe5CEAx5xjVNRuDPPcArjLn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMSBTYWx0ZWRfX7i0QgCRdU7iv
 0UjXR6Y1sG/IokYohyHw6pyJz40KrYMMi1JN1VD1Lv9aGk9TQjDibDfXoM4uUAZXmuG5IQjUKIk
 M9ce0Ds1J/7H5JjmhIE6rWtKyiAPkYp6aW6aZSOEaNTZE/bxRKCTaivrwXG3mTZ/jxwQXdlNj6L
 n7eVoQmk+hV3qmiCCqnE9oynZVGWTksgiuRn66CbStI/xe8FhY8r6xFWKF8hf6n9efkDEFxH/OZ
 peacjitdr49HReys/hYDk2y57SLcaBEIYL6x7SGG1s7gjlmoUN6R3T1ht+pc2gh5ME9g6OKXefX
 1iZdl79WpWPzKkKH4BXiMVY2e7FfBG65uktFhx/YKI6Zx/2445Q0ypTKNF8u5juU/SeYYIGl1nJ
 HYyrNMVI0LKRIJ8+EszBmQaLYSSVkrBSBf4IF51lEOVSwwv4zyVN5Nb1c1P3dI2Gx2vjLJGWMQ1
 gaEBGRlECr1bqh7dDNA==
X-Proofpoint-ORIG-GUID: wC1rNdrqjVe5CEAx5xjVNRuDPPcArjLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020031

Add the device-tree bindings for the ATH12K AHB wifi device IPQ5424.

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
index 363a0ecb6ad9..37d8a0da7780 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5332-wifi
+      - qcom,ipq5424-wifi
 
   reg:
     maxItems: 1

-- 
2.34.1

