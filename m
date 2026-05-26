Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903562BD11
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779772423; cv=none; b=E/ZixLmSzDYycnds1p32MqgdEh1HtV9f9y+1TazsiBP0+L3J8UgBRSiIz0I7b25UIVlQo7nugykZRezMQCgpWUDyw3EX/lc+N0hd78gkrSHBxpQ9DywgGSADqHRwIuDyTstmVmRtGEtZbEj/FgbxmBhs1gaAViw5qMyzBjSRaJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779772423; c=relaxed/simple;
	bh=TaGuHrdQEmaPBnA/CUl1CYmu7x8Y8fKi02IHnxAa4Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rx6WO135l0Y78Wn+br7FG+YstV1sc6LsFXc5UFDsbW6420jDKC7jFbqW8/o2eV+/qwyC+fIJjVOCwhckd/7TK0me7zyIjBFnEY8iIloyVZa+3NGYN8sndFkISMb4fHurMeSZ85s9jd/wzEytNFcjmWR/m+L932om+kOrPiFxFoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRssZgm1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nx7WF9x5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRssZgm1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nx7WF9x5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q10VAi3603990
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBqNg96OP01am6zFjoma6HdtE7tav/kzE5YD0guBimg=; b=QRssZgm1aCeEJDB+
	gghw1McaO2XxghAuYmS1adcDor9rVHOM/ulQUBClox059vd+YhzM8hbQ3c2oYfpb
	ccsjOt7rg8ueHcCd6wMpYfDagSZhk2qN5ypIEvIkCmXBIqWpcv9bYYNedBSwjyMz
	SUpHGX1qUQnXCWe5e6vdpnzOq82SuzywleixmotsUIfnp/jOPMlNgM1eUIPB5t2Q
	+AwO/nKDzSRzbygvmJ2wb2vpucCez0qUl6n2K7HWSFMH5W0YGY7tZM+llVxyVbka
	hbFg3oiLAufYyracHuTs2lh/IW23dkPORC35DyVF+khAXCFxtzck8YlIrySz/l+u
	btlVpQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqjc3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:13:41 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1361d52b3a0so7763314c88.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 22:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779772421; x=1780377221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBqNg96OP01am6zFjoma6HdtE7tav/kzE5YD0guBimg=;
        b=Nx7WF9x5pW8YMHMLUhVwG7HMeXwQZ6uSI4pt1h9D6gwnDv35NK3bF1cmmZSHS4OJtw
         Lm9WK9H3jTIdCRe2W0bWiunx5f0kjyjQiUa6b/v1Rmbwu00F1A/RlFImSoDrTaWtxCc3
         VuuXaChT+lOLo5vP12MaPMe+3tY5B1mDCHwc8iCUGczwB9JfuRbcC4txhzH/I2Y2jkSB
         LYwewxmLslKWk7Tq8h12BywUnFLAYAHiaJKJUazyqFWZvb2uePzLk1WRpm3oiB1agaTr
         Zo20GWWke1ulz3eNHmH1AJBGNq0xEBb2C4Qph8HDSEUKm4r/8ijUfzyGKj9/bXPKxMpa
         GGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779772421; x=1780377221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fBqNg96OP01am6zFjoma6HdtE7tav/kzE5YD0guBimg=;
        b=iShKRLmR7xtWyv+zRH9EY/fWLghRqjk+bjNa3ve1qVu0j7wBnebfPJvNJ1FtISKyiS
         qDK/wUBxMWj3WmJ1uDd+0Ut1hkjnh9QDhTuxT9tVY1PrgyKtGw1M9iyl28Ra7S8MSeuJ
         JXnth0hJGYL9SEFGNEdRjhQKFTG+th1PIjv4vE4mObfdgAaaSmSPxQA7cP8AdQLYXRKv
         km/i3/A478PAYZ8+wPbzrpf8HIHijoQ/0tIK43KyQ6WDUKThWo1FAWMl3NZ/FL/wQ9lQ
         bB5/Yp6xpbVEZgfUA6HUEATRbeXtM0DuG5J5ayI0146jFhOfXUSs+Lz7IJzPd9RnuRNL
         zzfA==
X-Forwarded-Encrypted: i=1; AFNElJ+oJxkEawNIR7EWeSUysbOGi4N/NkTMtPVPQ3M43V1L3sG+Us4pnfyMmOOUZ2tjCboue/rJGm9vcu9m@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr8rv/p3ukP10fRqqQKr3bWELwWL9Oge9dbC3+FKLceJNth8z+
	tgg4Q6EWmzRQY3JA6YNv6GDhg20Qd4XTpobeLPExthG6n/fNviHB+dkVn/zOZ/KTFKjPIj+/kLz
	vX1gWVumBnu/A2h8Kf+deSPodw4EWwFKMPw4GQfhSbIpu1KmQcnv7iFYrYI/ZJOtB
X-Gm-Gg: Acq92OGyp6lB+wcbwwCAgfqXH6DQSlBNpJVqNqafKiLxemJXuTNWWrep6Aft1yvt3E9
	OSjq669VUcGhwIOhXm6HlDiI9HqAx+74hbS3g7Ku7dzoruq4jp5Dk3Pc2MSD81TPP46CZdvHDPF
	ZbBo+33vINWBqSRk/+vqa91vCd47qGUHtWIAFOXMEQWBH2r/bvTr//jwRQgbOkH0kdcPLkE/OyH
	89Udop2q88cF1uC1BJKPahMdqi02Zyl43wasQTgtXtQnYCEUZAiAqdMp6SJvUsDMIwCQuMKQXL4
	yJI8Riat+uGxYDpRIR66hAtK/HrlJMPMyM7Ns+k/tQMxawNrF4Rs7yicIHSFFQ0z33Y1o1zhQYz
	4vraMssTtRP28SDqpDeH7VW1po93vSLawVLe/Fm/hf/fT1VCLU1rjtJijsbJxTXD+S9jFkvKF0c
	wOonOPGg==
X-Received: by 2002:a05:7022:671f:b0:12d:ca31:f1b4 with SMTP id a92af1059eb24-1365fa442c9mr6107838c88.24.1779772421111;
        Mon, 25 May 2026 22:13:41 -0700 (PDT)
X-Received: by 2002:a05:7022:671f:b0:12d:ca31:f1b4 with SMTP id a92af1059eb24-1365fa442c9mr6107822c88.24.1779772420559;
        Mon, 25 May 2026 22:13:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b3706ad6sm5423053c88.13.2026.05.25.22.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:13:40 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 RESEND 4/5] dt-bindings: arm: qcom: Document SA8797P Ride board
Date: Tue, 26 May 2026 13:12:59 +0800
Message-ID: <20260526051300.1669201-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a152c05 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dQQo7YwDhi1l8iBccy0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 0MQS28ECCWUc_SIuL55SddHs7YKxgqI0
X-Proofpoint-ORIG-GUID: 0MQS28ECCWUc_SIuL55SddHs7YKxgqI0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0MiBTYWx0ZWRfX0WdC1gVwpbk3
 NIhCzflRYTghFcBkPyQGM47Q+hN7U95sZQ211a2l4VwaRz2++1A6bmmfCj8rhtuwUdrobT0eTDQ
 D8w9XqXl1rQ5NrM6rMhW7abYqWiDKadWvnG7qvbp2dESaRcKYow1Z1OdTYNZci5y0k4Gsacmhcz
 OerFig9L17RiwUv3lPDzTtBssI5jit1VC7RexzfJfbpmg51KOw3AJIxecfL4ZJL+eg41Hmpijp2
 0LSmMVVJNvAzMer18Nl0GjA1sdopDxUJ8VL2AIvvwMWJr8ui5Nbl6bc1NboOCI4O5IncXtazxg4
 3OTX5JQHacWNjMK/zkzd6Etxr1lkY0ZZOxF5gSLQ5KyB/CY748ncKkDMzbjWlBPpYdd7bIFjsi6
 cYHuOPvKK0rtdvBHJLiBoqMBIino0xvx9BKhtcIHPsJ6/Cru563lNPCdeNHs0bsxyfQYS1pswGi
 QKKd81GtEkcCfGxpsaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260042

The Nord is a new generation of SoC series from Qualcomm, and SA8797P
is the automotive variant of Nord. SA8797P Ride is the automotive‑grade
development board built on SA8797P SoC. Document the board with a fallback
on SA8797P and Nord compatible. The SA8797P model compatible is added for
distinction from IQ10 model (Nord IoT variant) which will be supported
later.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..b10383ddb899 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -303,6 +303,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,sa8797p-ride
+          - const: qcom,sa8797p
+          - const: qcom,nord
+
       - items:
           - enum:
               - 8dev,jalapeno
-- 
2.43.0

