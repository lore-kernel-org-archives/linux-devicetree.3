Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EE2410D2F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675693; cv=none; b=TrLffAFG5Lot7qMvNc4Q1Hz1sEcTSYDETGmiQj2qJ/XmYW4Jvtv/CqSvVMaj3QMLGDtUZqYBQcME8zvywVv4CtsM8ksbsqj2dHeyJrgpMNnzlZjRTMSXCKJ2Z1HwYmdN0KZy4Jc8cWI4onLQYuRz1Wv4GC3yY+FIXfSXpyDCFjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675693; c=relaxed/simple;
	bh=QYtKt3xVT767f/e8GatW4qi1b551mF4Rul2GLUG2IWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDma/LIlCVMG1Gl43HXmd0WctUd7J3q0UjEsWKL305qu8+CaumWf7wwYbMWwtbp2DZvky+A9b4PwUG0OrEApsKMBLrSiBpXYOZ91n2eeuk/sBYKUBInkigeJoRECERgR0/8AFn+qPMOyt2NTqPgJCCLTBJD1l1Zb1z/LL/6+elo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I43MYmtQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AjXkG4e6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I43MYmtQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AjXkG4e6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVGas3430119
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=; b=I43MYmtQDcvGEFsr
	bItGmK/3BjfJ+sown/zP4syTUUTvr7VS++Ev/oTzo7bDrTwbnYoKHwSP1xulns22
	e9u5sHN9en/phQMrfIACbm1OGAahi/dyXaWQxUUf7qHWXeLJjTRinmFkVp2jmh7G
	6O7Butt/5kGBEjS6li5ef1omanx1Q/pvb5derpUzj6Eo5H8p1dsBLyXSUuEez4FJ
	AGjC8WNp9FAvuNlBcaDiypOxjzEgw7AGyqvd86y6vtMzwMcdLVrm0O9dV3x3i4Uy
	Vyr4Ejrue650loSYh2YuoQVVB6K+Gox1qSyLONT6btzd+pC+tkRibA3aPQkuea18
	/uUAwA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcgdnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:34:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6329c1a6710so2240193137.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675690; x=1779280490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=;
        b=AjXkG4e6YgSm7h+fHK5q6EDGQNRGfLsQ9P1TS2fqIS3IBN6PgNs4hI7PW6Ix2D/ZvT
         wDeAELx3xkqHcerUKupW9LwtjwdJkNMQY/opTU+EMkKhZONAWcpKLd1zT5+shv5uqvlT
         yrhxfKu0OI/P3OOVw9pZ6xvjshGjrWEFEWLD91RpeJeVipzQGEe8WjgobRKRpfPiUoYN
         NkeMeYchqoKbqdjKH/AmxSmRuMGwbFMiWkIo1ZF+AM5qAaMa/0GyF0bW0hXUNPmz2Lbd
         evqZCaDU6IRnYD7AEPG31D14Jl1X2aaB+T0+W8AzbkwF24PgRTy/a1FTXj5KBWDp7t13
         o9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675690; x=1779280490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=;
        b=FPZ9jItH0cbmWHGiVCwZGP1ZvWaZNQWFCIAc2pJ9BA7aop2WzxkYVCe4oWiqBpJbnI
         b/0pS77WI/6uJg954wfuN08nu5hkXpGUSrFPIguFCzbe26Sy2PSX5WP1Mk+uNCeigt3Z
         Vzs5XrQdDMXD7iym9OwEYPktsRj+t4v61oeuaxch5MROaBIsp9xqeeTQB8QMGa3Ptkwo
         7VvcOlzVkOlyEBKGWxlupdKP2ZOwwnyvxRmNSu6jQuBsopbZJVu29nAXzf2TW1OrUfRP
         TTuGkYTxUG5ioSbmBuuy4zRcLH7bJu46e4BLjdpzrHBNRPmu6CpyDP84fLlK6Sq7P5Gn
         EB9A==
X-Forwarded-Encrypted: i=1; AFNElJ8tCMnP6OjVpiJLrLAUbmpZK8d/DZTlcEgsM/cCch2XOQycHfK6m+yM/+M9qAoiZnR3+939zlenqPMa@vger.kernel.org
X-Gm-Message-State: AOJu0YzccjiVO5hYpwaCBhWCWQPIirtHsO748h6DVLt91tNg0zW0zOiv
	Df8ZmIdvOcmGGRADVe7AjrnjedkuWEgl192Y/sc0qkdFtzaXHj8CaaoRaGUZ/jTp74ayTl2x2yz
	grWkHLtkyMP4hWMCOQA1XaVEOPtpFxXZFQsvjSAZq4cnCl3wsBf86MlLEiQE+7Z2c
X-Gm-Gg: Acq92OHorbq0bbY+TZhO9kPZQmWZ+LBZakA94xbDt/rMj2R+/DPg3oU52gU7FHV0hla
	5ZtJAaxJ9E5hnHr1KvibVSMjzt1zfZR0SKuUFgFqj4ubHoHP3jebemkdogqDV9KMRJLjg676QFR
	hdqPFK0ozsWHoOoV0ufuRwH6QZ6sj9eYh0NQ1r/Ui0JqWBJHPnAf5SjTxlJOiDKraek+ttR+YFW
	chQQ4v+4QgNtJakq1OjNeHDVnEJR+WrcW7O+owWbEkomjsizVgHRcEEWGig6cIBOHqP++ID8mCl
	msgM7qQSbKByd4oFv153isAamh5TVkH/k1vlnOCkelYLnvGMW4p0i3chvYC2yyvq2cBofo1nPJh
	XkuWUTlCLjB+UF3l81abw2oOgida8J/flp79ziCZN3PT/FuBVqGrnZOSdW3gpZFcSoDnzg6ef6d
	TH6Vz91Y3xocHU3FpwDirBv+BgPzXmFm5R3Lk=
X-Received: by 2002:a05:6102:370c:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6377239d295mr1216074137.6.1778675689762;
        Wed, 13 May 2026 05:34:49 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:632:29a5:2b28 with SMTP id ada2fe7eead31-6377239d295mr1216053137.6.1778675689222;
        Wed, 13 May 2026 05:34:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:34:43 +0300
Subject: [PATCH v6 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-sc8280xp-v6-1-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
In-Reply-To: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QYtKt3xVT767f/e8GatW4qi1b551mF4Rul2GLUG2IWg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/lDI25XetRzV0C0illHa2FiXU20q7jvnhcw
 BJbZhxV6g6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5QAKCRCLPIo+Aiko
 1SwJB/44JcZ3uKZR5+uHcBcVBeGWzwezV76GM0FPxWeqoH4LaF1OiZVndsrxR2RJRoWeqENFT15
 1OKoWa/fQYjIA8gOlwaLB2CH1q7PQxXIi6ozu3OHuYe77zvpRp3IQV28GK7ACzqvUu5PEwzimTr
 mE+MSSL6j4kMdbaYS1RG+JzKTIvmEOSuI0sNV9M2tsnJBa6aWQw5Zh/5IQTWUI/7y3a/V8tJxHG
 h3P0jOEhwHBykhFNxZWV9SuqLo1Ze8J1O1ePTR9R3vLiUwgHafukQoRrUABpL109wrMqmGQu1Bo
 E1R0TKj3hEYTQEgaPT36CiIzWUoWdvGHC0JSKCPxcureuC2A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: t4BKc_RUjU2ScKi8n4rXMJ8yh5MbKA-h
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a046fea cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=DuJnIZi-_EB7d9bgGRcA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfXzPPVoN9TACW5
 EZO5JX8P7iK5OIvdFmT316Junuwxs6Wn0IQZUFHQMUcsAqX/CWoorTVfImiV1nGTo082zHUkItb
 RZrUtpT/eMVnNRgzYDgLdMGLhDb8moyB1X4c6JGVeV2q0AXFBBwO9tfBvHCu/YaA8OGDLWJTQjX
 dGPPoG4HPQjk/s6SSpU6z+9MrbZ70WXA3O2IviTboylUxnYOpIx5BkRPgj3y4D3+jfm6tO3DzuB
 a7BTqYP6N5Q8cxg4/bgtByRGVWxCe8hJaHDu/1IgaSwJbjKpY8Ta56Sr8rrBx3X4js8NndS+3IC
 Z/tf2CUSIfPVdg4J1G+tCRcKRaPQyfp3y5VLP35J0tFjRWUhDkDkeF9UAmXoMjvi1HkMb1dNNy6
 LLDweROY/xZ+T9yLJUcnX0twuma2jtfkohCer4DLmF3JU2mLUBZdbaihxKKtKTssjPVbZbsw0Iv
 eLLFgocIuTIcYNAo5ow==
X-Proofpoint-ORIG-GUID: t4BKc_RUjU2ScKi8n4rXMJ8yh5MbKA-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131

The Iris block on SM8350 and SC8280XP is compatible with the Iris
(Venus) on SM8250. Describing in the bindings that the block is Iris v2
and not Venus. Document SM8350 and SC8280XP IP cores, using
qcom,sm8250-venus as a fallback compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index 43a10d9f664e..aca748e42aca 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -10,15 +10,21 @@ maintainers:
   - Stanimir Varbanov <stanimir.varbanov@linaro.org>
 
 description: |
-  The Venus IP is a video encode and decode accelerator present
-  on Qualcomm platforms
+  The Iris v2.xx IP is a video encode and decode accelerator present on
+  Qualcomm platforms
 
 allOf:
   - $ref: qcom,venus-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8250-venus
+    oneOf:
+      - const: qcom,sm8250-venus
+      - items:
+          - enum:
+              - qcom,sc8280xp-iris
+              - qcom,sm8350-iris
+          - const: qcom,sm8250-venus
 
   power-domains:
     minItems: 2

-- 
2.47.3

