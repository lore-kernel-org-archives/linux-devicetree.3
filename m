Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1965411FA6
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762570; cv=none; b=ciqdXOuM2K8ho4h9d6dsKj/1JC61GLPkB+KoiAjWDKYxeiAekiMR8yz31n4vMy8TPi6hbJbGjBtGwOIAuGH1zLhCy5DPhVfp6yn7/wVuJu8KI/HrE40E/vFm19+iH5fKcUOI2h5En4PXmeQrVlJM4Ebet4YyxnrX7Mf4h1AjrO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762570; c=relaxed/simple;
	bh=Ao4k8UCAQ63pTsAXW+nwl6jaANXflQZYV4NF+HzDpas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mk0rlk2To6NOvWjt/04cngWO5Qi5ihu5Mp7VNHkbSymvXu+hMwHiI65zoE8V8sPtNCb2dtDr845I9qs+u3u4Z3ZW1bAEgBFNKqNOzlNoKmF5ir+BauxGG72t7voc6l6pGQE6lV9WsjpbjvsD33HmqU3Zj4lkWpq2ANtsH8Vc6dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4zX++W4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGwIrGkS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4zX++W4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGwIrGkS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4iuu4143471
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 13:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tx+tU+JavHm
	9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=; b=Q4zX++W4DpOC2XJ2Hlyk3E51ssf
	KnA9bGQ8/Ln7WojVcwbba25OUr5BVB5g1WRiKiqyXbd/KN8uEJ0Q2Md/1SIUMK6A
	o1G9c753HmMVSfdebN0C3x9v/+xDVrlgqyujKQRKjVnJBna50s5Ho+qZRROFPGZM
	KRaAqlLBbaP1YQZ7OhSoz30tnEZGctYYa0LJphUYVrvMdx9oiGICqQJ4OPywV2sS
	e3ej0EWkdyVe7gmP7OmOvPH7WCRDZECSaFvgKhHRQNvbihYn5U3S+MNOge1J1ewq
	71OkQSjm9NDh/H6NwfYoUDQiyyzuFPWMzcK1+Gw0xTTpBhn69cLs0jpoGwQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmxau3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 13:09:27 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b59d85dcso4395614a34.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785762567; x=1786367367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx+tU+JavHm9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=;
        b=YGwIrGkSytuKt0QKfWrGEqZheTOashl8ZX2NgI9M/cQzZxoyzr0XqaqsFw4WFj3sVV
         gbAiq7Gm+IQXZB8pL2mXY1aar4K1SDcI5IYTiQT4cebp8xCLuy7Icy3Duo5eUt3uYl3B
         lQWi88rsnJxjHFxTtpUjwNUUsIJRq0xCBtOkFJtsBTF8xVZHhcbAunyl1s7O4j8GkLng
         Yf/xDBfbAeQOmqLN9nrTt8iDZlpgZRrv5FV4dVH+EjL+vdch19mqKXo8iAxYkpt2mnuZ
         v/Nn+gOKxQt2fO5I7NDHcyMkLYBfF+BC7YBatf7iG9Kl2+1FMAssq+gCS8P7jcb1l4Co
         +S1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762567; x=1786367367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tx+tU+JavHm9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=;
        b=c6nL6Ui61l6ac4oZxCAhhIbaNhWkYA2vWvgLuzbVcpwVqxWx1uAvE2W1hStlH+EmEU
         Oq0MbLbhnlVgQvEDsTX05G8liXew6NJMt/TGgiB4oiP0pw/HihMgB08TEYYl+a+XBbju
         0bddy6WqUyB4N17Ve29AHoauxC0QMJeAXkpe8TARJrZZ2Y8D4Y6IkxfzqXS9LdijyZFp
         Xj7a7ltJeekSkGVhoon18YAYHuskxTLPbJo/ch0EZGmUrfqjKO8jvBe9yZq8W39l887o
         D4I0k/Y3JlG3R5GeCYk02cINHN80Lc1+D0h73YVjnXMzimZtpaK8mQxWP8lzMtCa5Fms
         SGDg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2TI7xg8vx2Y5e/d4PGvI8tlouz9qZDJ2vfoD5l9dwuBpkgokvHuf1Fcw+4T6nk4w7t7cYsNvZHCsW@vger.kernel.org
X-Gm-Message-State: AOJu0YzEI/yPJvUFxneSd6X2KssUsZkXu8Ilx7qEenOJ+RIzvqHj3NsH
	cI3F68361sjsDPxFItWAs0u01gYjCzHz2UJQ77YOrU2G1Hdm0M1YE/IY1R4/h3BTkm5GcZWtkBK
	dX/YOjoqwPZ0ksTWVLuAoJ75vtmMe03bvSW5A7857Tw+7AAsJ7Q9ZTHWl1PKOCPio
X-Gm-Gg: AR+sD10u7Ds27g54mNF+BReekhLlmx2w4f3gb+B6sbrriRAJ7WLH8nJYJ1Xqunkyk+3
	iztkrueyVc/ozYMfTM/ByOtA+2UM0/sATp0eCe2cI0cmznnZRmn8UiZXhMseLwKRSRaClbLC30S
	vQP3SZ5ua28g/nss4L2/iblFHe6Zkq+h8HVrp3twiS9ttxwrSXSLkWsaggLQ6raa5b2zQljClSa
	+KCr8DcF9xnRPa1DiNqNAa5rrk0qq1RWvXvyBfEBzp4cIYx1loSDCh1rleiASKc2X3ivrxgCYbN
	TXO+a9ZHLIHN9iJXw0hCe60hOY1rP7Sctu0gDtElCaDaXLM9N+gizoxFk+hyZ/MUzPgEWCVfrrT
	wjBqMyGmCLpMelywA1F0zssJsx+OqEINj
X-Received: by 2002:a05:6830:8299:b0:7ee:3bdc:9205 with SMTP id 46e09a7af769-7f1970380c7mr18910790a34.13.1785762566984;
        Mon, 03 Aug 2026 06:09:26 -0700 (PDT)
X-Received: by 2002:a05:6830:8299:b0:7ee:3bdc:9205 with SMTP id 46e09a7af769-7f1970380c7mr18910128a34.13.1785762561654;
        Mon, 03 Aug 2026 06:09:21 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f0d6ef6sm7366929a34.21.2026.08.03.06.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:09:21 -0700 (PDT)
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
Subject: [PATCH v5 2/2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY compatible
Date: Mon,  3 Aug 2026 18:38:52 +0530
Message-Id: <20260803130852.1432714-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803130852.1432714-1-palash.kambar@oss.qualcomm.com>
References: <20260803130852.1432714-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9ukymBa1GcCuWURx42N3Woe6ButByTBv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfXzyx1jFlFhr9c
 MEivOcAxZu7oo1LqF9HHUvTJB5A0WO9xaUh9Nxw+lstAUfYVLApTrA7mLflrZRSJWzDirHhwVq/
 8Jafpd3QhXWyy+Jo+KyXSOYir1znD4fEOEfXcCuTB2TGUjFwYWW0Ws8RBUep83TBksyueigvPRt
 IW/+YO7s7z09JEBd372xsLN9+LIAPlbivNnI0/KfK6AMb79+sGU4QV+P5DhpA0A99uAHwzxl+UP
 72WC6fwkQZnMIpUBMf7/nEZwHRPu7p4iDN5XuZqLO6Whi6o4Ae2q43l64BtUs0yKnwGCbtfUIBR
 eHsm+8Y31JQbCHNN2k4lz7EoIu/cLJytptLGb7usy01WPVSbf1BubD6TjI0e61TbTA7EmTpx5k8
 sYJJkKwU/rcx0y/wXcJe52SHY0G/X0P6tGxBuOzuXBSP0zSRdfOCpuFyArPC3Re2nEjm5CgRPtv
 1NFAencJd1/wI4yFidA==
X-Proofpoint-ORIG-GUID: 9ukymBa1GcCuWURx42N3Woe6ButByTBv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExOCBTYWx0ZWRfX9YH/AQSI4r2/
 BMTTo5Yl+nhQcEMdoDNjwFEOk+Mcb/69KJyS+8RubWr2ZEipeoveecQmBPHYvJgdiMLGHrlZxhO
 0+Kr/mUiUKaC1vmfZo/0QbmjEXIw/94=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a709307 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=MMZtLZuhhDi3SW52_uAA:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030118

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

