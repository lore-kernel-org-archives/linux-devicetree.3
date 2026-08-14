Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7130D34750B
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786685131; cv=none; b=ZAzFvNpW9aRkcUDCZ1yxVGYbW161ZkU/KNqutrZMmiDO9skU3g8XNSenZbIdl/ESWnXoprkWRmCIroRZdeBN+yFu77mhUz+b0yiWRLOzzrsf2gEzACHZcU7cFrOBaGMHQgBi7uHYUrZgfTbyydc4IK1jzMcD4XHZgHupypFHS9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786685131; c=relaxed/simple;
	bh=pazSav7RKprkmz1Mmx/rVxatkvi1ozlV9Wr4tjOqULE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6cVQI/6hVakiDCxBlaQj9qspCgFpWfF10RDwveA41rhwv3TgngDe2ukTBTHJ2duS22fReGSajLOpHBtK/GvUyCpm0Itb3IQb19VVJj9sQ13DK2Z0myPMk6KmW6ACS039ynq6YhXQHu1QJgTtVj5Jq1eaNPhreSKT3n6xwQT1h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDqkPxan; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LtDXqHqe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDqkPxan";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LtDXqHqe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QWTI4043014
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtRAHnir7bPWxS4ms70wOZ+2NIR1lDRXxWBVrJgXdhM=; b=eDqkPxanpsCjQw53
	jmwBmY1gU29szTVUTNkaQ3yyCjss/iM66nfcnqMs8rfTdAah3mdqV8D0uIVtTU/f
	PcZ+xvKJNmzhwvM9YCdyDivzK7dGxAY3XcGAY59LQGMO5y+brOkiSkeA85skW54W
	6ZA0lmxjAAvYiMDRHhKmdHyOE6cUB4nwA4I/A+R1uF/0b9uibgRwA5Wg39qZRwpx
	xi7Y7fkMX0hGivTH5YyysZHyK/uNYbXZHuucSeI9DLjJ8C+/S7ib44jwAaWDm1Hy
	2Eg9xqiqPZ5t8VvpG0Rj67bWnvXdcG1hG4+kpeGkoI2l8SmUlbfuanxf2qsTWoRM
	zGNtaw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42hsqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:25:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca9da7b6c3so1578715ad.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 22:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786685129; x=1787289929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtRAHnir7bPWxS4ms70wOZ+2NIR1lDRXxWBVrJgXdhM=;
        b=LtDXqHqeVfBlHfmeQZjuW04VNOZjBOxSjI83U+IQvqTMKd+75jGTPMuOpMD10DKYx4
         qnWMZ/1FyUhEbjxXcl8Hew2tCxY6M2Vi/Ekg7O9+71KUG8mkF+JrtVOt/olnKVBNAsgs
         oWdssZt8O908Wwcesd7V7CYXK0Jo75Dpzlc8876+fIEHCrq3Sh/SedwEmzyVZoXGCKcH
         Hgvny/in6BGlLoo5/eFG+LeNHDSX1zzeWZs+C64TWPFQ3HtVKDIDILn2PDHHPwDODAYC
         yyWuEAEOWnNmLEAk35cZJxIo9FhevU4dvWs1a7/RAqCFyYsmumsb81Cs70o1cnBhEjTm
         LnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786685129; x=1787289929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtRAHnir7bPWxS4ms70wOZ+2NIR1lDRXxWBVrJgXdhM=;
        b=ejYeSfWVw0SPCxSYHLyhMDNBzvl+g4HtcfTeWGR8AOISS728/UzsldmvKv6vTTtJsG
         BX8bgS/8OwOlRBwjJwUShbXkfcXPpOXpWBIYSDlsG7n9TZbzYOCk3+st6kwF8gi1tYkj
         SdWwrHrgKzJZzotli3WYj01Xq4mBMNmF5aPmTZ6bYquVKdQ3jLfVGmGilgPOSJ9aWK6W
         DEBxk2Hfz8vUpjHD9ERWPfYZvBe2Nit3UBGvqC0q02iI27W6Hsq1TmAjpjFAnqLREu0E
         yy0QPNNhBzTqamPhz3+hcu8vFuU4RvWF7WoIR7wwJV1q7S11pmF89+ruVMqiFp5OEHsb
         rZnw==
X-Forwarded-Encrypted: i=1; AHgh+RpgpP5y4bF+3f6jSBxxANSCElAdrWX+kOJSlmdUczt4agZ6VpcHZFF0lJxLhk9F8XblryjadHIJ/mRS@vger.kernel.org
X-Gm-Message-State: AOJu0YwXbmV1J9aVEXHrTVuEMyLwBM/hSCGFp1lXsJYRGkqdvvhTcpJN
	vPkVVC51VXD2hPd8i9wb870j3PSFlFBoW83kYm77FcmCv5KRJzbDpE1WyCSTu/Aeb6BtksUiVqB
	K7LAI9+CNGeF3CQBeU0EnKZsvjlEzUB8HCYnc5FuGBISqXHNaqdbI/qFXeC2ea9px
X-Gm-Gg: AR+sD11qFEupy5H5llaTditDcvsowQEbHBBGYIM2xJt5Z1kqp+puLfii8rVEF3Ddd9/
	7KiVQtTR1zWE5g3uey1ndORi80mE+0mGF3dR4quDxmRj9GvgnnhA3FD/Fd0gBeFoPeeARTT7gGk
	YqdkfDofVktqdTu3RvNgvjGxB51Iwrg/AOVGiNoOq6V0GUCuErK1wuDkOUtb7yIkCYjmrwVUTap
	pm8EuKMv2umjdsQTgy3XKITtcyrdMYaaNRnYr3vYnoRrRVpJ51/RpOMEvp1QLAvkjnpPJs9qBt8
	BLp0kwPErUDftGnSrcwEPVwQHHfyjFACtdvkV7Buhg5gJyHyEI4NbQyipj4oBQNbAxFaRgK9BdQ
	X6SLfWSzyYmxe/YHl4IHkgamYkcEyyUXun4yoolM+B55+EsBS/AOgFRtM3yqG0TtPv7w50mtCSd
	Wj1HomqWKZnnXQGsG5iBkJ
X-Received: by 2002:a17:903:1b2b:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2d3b0739429mr26779975ad.0.1786685128685;
        Thu, 13 Aug 2026 22:25:28 -0700 (PDT)
X-Received: by 2002:a17:903:1b2b:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2d3b0739429mr26779535ad.0.1786685128175;
        Thu, 13 Aug 2026 22:25:28 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb2a0b4sm4545835ad.53.2026.08.13.22.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 22:25:27 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 10:55:13 +0530
Subject: [PATCH v3 1/2] dt-bindings: display: simple: Add boe,dv215fhm-r01
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-b4-lvds-panel-doc-v3-1-1ad152a4d3ec@oss.qualcomm.com>
References: <20260814-b4-lvds-panel-doc-v3-0-1ad152a4d3ec@oss.qualcomm.com>
In-Reply-To: <20260814-b4-lvds-panel-doc-v3-0-1ad152a4d3ec@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786685115; l=1225;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=pazSav7RKprkmz1Mmx/rVxatkvi1ozlV9Wr4tjOqULE=;
 b=J7tKtEj3LU4J3KwwUVyJBM0ZqGTKrMmb9CsTLDj89MYijHZ8VrpF6CwivSmyngqbjzRT78nwO
 49tX9g52MOICcA49rluGoZ6BU+xOSprp8QbaW9UAnSc82e0NJz8U90d
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7ea6c9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fMfOcokNL7symIEKlBMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: l32xEdhbqFfGoJZZsrR6bHkAgNPSLHbe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAzOSBTYWx0ZWRfXzBalUDR7g40n
 nE+v9Fiqni6LrZ8weQIRleqXQbHWotamJIgriPOaDHk9aDc2y8mGlrSyh8oq4HDci/0rYxKdDPh
 1WcTpzT8JPjb7xa8zduhzhNp8RpTNAzUcY12wWeekYUlt5PU1J/NkQBscxNa6JFpjruzmquZgQH
 cSYqnrw0yBMN0Nu45GgpJ4urUl0SKSWNnMHXq+3YbNPZ2gsADA9b4cLskm+qvWidX/tbCK+SpN1
 KKH+oGV5z1E+rL/nPGQrLeCxl2k6ba4h4XHbZM4sjHMfPOg8Ga3it5OHSL1/18IQVnDQysaNelO
 aQq1WIuZit1wqXX1LhaZQMuPzVQEfi/gmFH4W6tKOitmifgGpg+mNq2DpnQVf0+oBxD6+hq6piI
 T0dkwti55MmRAAV95S7XB9EoEaGSYkhQlqnx03cU76GyYFb0N5JQI8g6axs21c8tHrnrwvGkM5i
 N10RB5QgMeoFvFUQSvg==
X-Proofpoint-GUID: l32xEdhbqFfGoJZZsrR6bHkAgNPSLHbe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAzOSBTYWx0ZWRfX0BA1Lg0qYoqt
 4aB8WgNZ6OLx5ghJhHtqJCHmrW7g5jwaXbiIK7Go3y/366Rd2+kKWsoc8tjymXmn5HoGCBjMURl
 D/DDawcb2n8VGdB+8hUyTl+OilBpGUs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140039

Add BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
compatible string to the panel-simple-lvds-dual-ports binding.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
index 8a2f6feafd37..68beb476fb48 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -44,6 +44,8 @@ properties:
       - auo,t215hvn01
         # BOE AV123Z7M-N17 12.3" (1920x720) LVDS TFT LCD panel
       - boe,av123z7m-n17
+        # BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
+      - boe,dv215fhm-r01
         # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
       - innolux,g156hce-l01
         # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel

-- 
2.34.1

