Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCCE47F2ED
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032801; cv=none; b=uH+BTlrNOy9+Agez4Sa7JlGTHflyJylXj3FG4wYadKYZg9IMI68plhOSF8I4ix7Um3yWnDy4xn5wdLjQehKdS9TV2AXHUsQmZxfFc6cRr5hzTifp0rXbRN17riS1SPB9Rnz1FSzREL6MxW4zjnrg4rjGBFVovz1u5Hq9duZFMKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032801; c=relaxed/simple;
	bh=Ao4k8UCAQ63pTsAXW+nwl6jaANXflQZYV4NF+HzDpas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j6CetDuGtTOQp97imTWkCKEw6ADbZSnacdkxNa79LNBcSiqQjdqTzRPfJeItfaHA7AThCKkvEwnJmhTNgGhf1PKzm+g7Bihqh5OfgT0pzVmQDifiQb/bu8aP9ML5h4sO9rAmZ7aEuKudAn/DRf7UjQbIfb9GGndYO50684662sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gB/OLAD8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECz3tHyW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gB/OLAD8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECz3tHyW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676EmNlq1553304
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 16:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tx+tU+JavHm
	9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=; b=gB/OLAD8jCO7oDNFB1DvjJBwl7K
	6mwSy9f9tI8GsZeBzOko+RXYNLzeXRHylhpUBjGU/ziir5WXfhkyJfoQM0AqoCXl
	L0cNBsN0u+03ArxdXD00QGiBUjEMKUb5Lzl0bNGwRQJF9Hb5RDC22Y/Buu8yRTJL
	Jg4BUEU78jUwfX6W/pN/MxV+1nlWdKKMtQbeJfizRTQp65lbDOYUhuEZpvhFsEEN
	t1w/v0Lq4P+1z/3h7PrNCDsrpfQNn/EbME8FpdU/mKuxTJF9JerZ62BycFYetUoZ
	uMK8FYGcAooTpMKzNuWMn7YA6fwFV6hLRPjecTQkBhYXBCdvMSBQL+Zc8lg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvv5b0mh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 16:13:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2819996a12.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786032799; x=1786637599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx+tU+JavHm9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=;
        b=ECz3tHyWiwYwDEjasSuGGxIIwtRRtxN//y3FgrhzSMvn85R4tPfjXDcHptiwcuU5XB
         lDOlbmULcMBMHKXoz2JU9PFgUrHnlRmX5yhoZpo0v4irSV6cADpqGTAlmwSMe/qF+hti
         H806E9VtA0yK5eWrnZYO0F0cJEuCX1vN4UiKvKQOeKjQ9koNPBnxcJcJmSY8qf1HK121
         hJfr8nFFfSHbUbbgphCzDp7NafM+VzaOWVv5cilJ96V/i4kwxzT+jMLbdT1fwj9fT8Ee
         y0FxvzQQqoRR3CiNa3d4tEiUCXY/WOpA2OGic+RwJbMspYXk1kQrNqU2VRpPU8jDH51J
         acgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786032799; x=1786637599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tx+tU+JavHm9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=;
        b=NtEx+wTbKncpvf7aPDTFi04QMjkdYE6abKpO8E2sLwYUwIyFOuZ4o3LY8liKYhB/0v
         S7mDWzoYwzD30CAy3Av1LFgUlxLvsMfTqx7JJvLlyOIJOX56pn3BgXK2K++sbxzktN6U
         TScHV/x2IDooWq0Yflvtj5G2fMmu+kxLp1AUpLu6IB2+APEPgJghyEOWy4UV9xXKN9Vz
         z3W6cBbgrQt6b2UbG89XTsifoNgkeATisvl3pb0sFeSwZz8t2Bdnrgt9ILL7UzDT7f11
         B/lpidsnznkvUWCtdoG1eOgHztGXN+tqcVvMo/EiEDLE384cufVS/H1xx5Zj9plwehyy
         J3jA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9xZ2jqFflcQAlwsA+CpAcyR99h6f9i0PygH3h0oaBK3B8u4GgblZd6umvMIucY9pNge1RpeSBMibR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9zY3SwjmEQ2V1TIHqWUsYPABiX6YT6Cw2Q1rrsn4mJrzpLVcg
	PGOLFLe4FZ8ZQO9KglO1DSqT+R9OWxoH+0bqaorJ3QVTPdeivLvKXTkj/EsCMHHfrdmTnI83uKI
	yMbSCWFGfCF9AJiV5FZbgDyDSB72scSOd/iKEqlXIX/CkpXs2XeE4eeZKr8Xo6PS5
X-Gm-Gg: AR+sD1384N35gkEoXjntbwwHTFbblok1j4DwGpHIGupriyvlv8YvZdvsfcmM4233Nzr
	V/dhfQKo17GkLfQllWEp66ZsQzSSRN8jEzPwgL+7TLNcYnuXkvANl+/i5zJiHXnFa1L65kktRU+
	1oJgcfPc2DRUb5aR71d5SySO/HIbjvtpZZTR7GPuU2VQkPcHfjjFTvA0x7skiBElCmbO6jzWi6a
	6vnPM/YdpOpHevcR81C02sOv+LoBICqDle4QDmYNbC00NDtE0W11QS0/Smj2nAqPaphSN6GptWk
	Y5TxYKfBhvXAlh4NHv9INSIiRlCd0XF0JFwRdQ/9iiNT/Apye4crJCvwjjttgc7VMk1VT097i5+
	auEwIC0+E3d5dci1m/fw98BCZNoDw3SPZ
X-Received: by 2002:a05:6a20:72a4:b0:3bf:9142:ba3a with SMTP id adf61e73a8af0-3cb85ef7460mr18750418637.26.1786032798817;
        Thu, 06 Aug 2026 09:13:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a4:b0:3bf:9142:ba3a with SMTP id adf61e73a8af0-3cb85ef7460mr18750338637.26.1786032798360;
        Thu, 06 Aug 2026 09:13:18 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b761asm43074546eec.1.2026.08.06.09.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:13:17 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY compatible
Date: Thu,  6 Aug 2026 21:43:00 +0530
Message-Id: <20260806161301.1010876-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806161301.1010876-1-palash.kambar@oss.qualcomm.com>
References: <20260806161301.1010876-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyNiBTYWx0ZWRfX2P8QLk3wSMKI
 5OPVmLZzUtwsm1haYjhObgCHbG1YjOVMmW29bib8IjFA2BSPVM70BAwSgVUmWeWSyvd5rw1A1cP
 FDqoOQ1XT8t2RgMfY6WLCd8vp5E5sB0mTBapmzDKVRP0ENPJzoUBnVDoECCDiH+ZK9h95N3C+Qz
 4aNVvPzbNTri714+0KPvCCDTLk4AVkxMn216lkq8GyR3K66EivFfrq49yPR+Jotf6K6G4amkiXJ
 g1k+vXnlzZ8D1M7R83BhWWNjeO8fJdbqs+CMLbu29g0TdTrQNzpLaLvu60OYfbpYHYab/I1pRbd
 siraDe1pwbwk38KzQjPSIz7L/NOns0EeA7kiUwYUKIXVtdl7zGwqMFaLTGzWdTWdxKneinI3jad
 a0W5y5I9fjgVuCUJeaV4UJwcrav75UC7S/pST4HoKUyFfIyOHmdw1IMOrLlk8Kw7IksmEBm6X2u
 3ZkajEGj9YInIm4N1Sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyNiBTYWx0ZWRfX77dAqcKGo4of
 ubu6jqFyqNESGdJR4fxAf8BYQIK6xydUNoAtICPQmtHTZBP7sC3ng8kf0nhRRarE/Mm+tH5vi7v
 tiirzq+2+y0k54HyMtzQL2X6NYl3UbY=
X-Proofpoint-GUID: xr859kzvPDd9_AhjWYhabHXaKvZQFh6x
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=6a74b29f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=MMZtLZuhhDi3SW52_uAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: xr859kzvPDd9_AhjWYhabHXaKvZQFh6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060126

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document QMP UFS PHY compatible for Hawi SoC.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index b2c5c9a375a3..4efe40c0dc97 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
@@ -108,6 +109,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-qmp-ufs-phy
               - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
-- 
2.34.1

