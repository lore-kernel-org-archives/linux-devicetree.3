Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D54C4E8E19
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 17:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542990; cv=none; b=EJNoYGPMZBWT5hHyxhYmq6yV89S7DTHEDRf36p8HPInqMjV6v1vUeKKFehRtuzmxOsUcWZaifXSOcJLh4EDVQ7A0SZ5HpMUcH6S0wTummH55MK3C23rH/avFkCaoCwtTQv3n5TyahFcuhxuylcTIE2verhBLCZIeNEl2urDE1VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542990; c=relaxed/simple;
	bh=7rardkyifAR+2AT1JfxqXWVC4DUlTbqXtnaIiP3Z28I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dh7bAttmm9QoKCId3fUr3U1tiJH52Vg4MBNd3a08qawI6fpPYLOxPLO0nvjDer8PAa3Q8CKG3cGvItvtTibx8AL7AsP56tZRKJjRb0Voj+0NyaoKtMJO2AkqsW1JndCC+xAqO8pjnl+VNfvOKG0rAbwdVst3q0CxjfeDhTmiFaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inya1+Uq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJQztDRD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inya1+Uq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJQztDRD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HIYE7016339
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 17:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=; b=inya1+UqMsJliKpr
	w+dFfqK1aasCj7jZifHiYaM9epQDYIZfPlOJ9avj/iSA1c1ya/JKtaMP0ztLn1EA
	TFRgguJLw40IAQ6fkxRWvEz3X1YPULLazXZWA2ybehn8jJ4w4gK14YyWpdJYIa7H
	4ucKFX4L4z4UlkDPg0chXvj50FhuoY0IWr0Et5WhkgDY2ZQTkonlfAntXUhdAAEv
	lI2yVxkE3+9waYaHOe7m0QwOR9sG91nVCj/8VdyX2JsBC3DkBaHZ/sx4S/nUhhOh
	/DucsJ1Gj22f3LiM2we7aDGBdCkAqlKBGIecEsoNWo65XYk0n2aUCkuoJW1NbQQ4
	CGSHCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd3bu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 17:29:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-384d033f7f5so261609a91.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 10:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788542981; x=1789147781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=;
        b=HJQztDRDmkUjeMRakNPm7rJC0T8zN8ARStLv1ezNOWyrI/D7diXfOLaQi7qdctcbTK
         wJh6FLfy8RnHRyPbXONRL1Vymc6QNboKuxSNEF5LtIMQ0hp9y/IUFAbXlC8wMK1Kld2I
         3Ct4gYeXDKRTS0TW/pkFPNHJ2qmPmQonSIBiS11qp0rVPpz4xKXT2+hK/uYUEpYqFwNe
         T0pHtBMUdh1WfnOjX0jgePPUVdo7JpWS1GisbLRAXb75RigooHHiEhvR0IvPmAubCl+C
         ridGfbD8YBeb7Inx2AGa6ZHXCgPP/7XgYHoPGuJmslWLyVg6hfoyY0YoA7PMM5meVh9L
         VKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542981; x=1789147781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=;
        b=qlLFe/cn3X6iZhUDGITV+WD75T5MO9G02OUFInZ3ZMZmZuUwBovoHSrJVfb8J7pg2d
         a7uSgYXCRh+ODd5EyePjXk6zG+jIBN2fTyroM5s/VRBw0bAyIDfRk6MV5+hEECN6raWg
         2Q+qVz34IDEjF6Y3TZ0Wkaz1oEbWZWSOM4RXnJH3/kvMOPVOUw3w6VCAux0fqnF9HEWz
         hxUloGtCDfTTzvU6rIk8zwBRc2DrW1g9eciDejPVOro1KP2AiYDzjiP1XYEHjDtuWrlR
         ZCC8JIvN95kFY78YVXLg3PeI0xXmGUuoIq5Fi2b6zts3RUHmEwZEmD8iJOPHMsDXRMPL
         XsYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrVqSBzR1YOYK+LlH7UChrT9PoNB3R13F9hUoUKqLegnVZr3BBds7+LNbXTxaqLDuQPHbH6zLwfLRS@vger.kernel.org
X-Gm-Message-State: AFuF++nSl6nkaSudZzOy9/dbrKEnzOpe3PUca1G9ve0P6vZmRy2XevdI
	mEpSF2fd/YFyuKeXtrN+dXHQuIZCPNJxg3WnfAWs7d8d3SocmTxTw+DPWZh0mxtQHIzjPu3BZTM
	Nzx6/3jOh+O1HdBauWHHrinfDeANh+Xe8E9kkujET4nxplU64sFSJpbPv8AmgwGEM
X-Gm-Gg: AYBFou0T0XzkDqWJ0QLgr/VNbeWLetzX8ZI/DuQBPQ0QSnrzqCgjidV2eegY0GQ3MzU
	4Fc9zHa3XbGIMcIC9ja3iHB6waSw6FnSVzaMHbbnwsbQ47kWLUE6DzVTaXiTlKUmxO+tSmfNxAS
	YjBjS00koaVd+21FB/+WV810OfZn6/+oUsVHAqTKUuj/VunxSKmRQV3Ld4Y6L0jOCr4At1eNr7D
	yeaI2rFg9EThFxW8Fv/bM2othcE04fGvTl3t5rgAhx5DXA0V6nr6sdMSGIp8J2Zlmgfkbuf0hbX
	6B2C5rI18mTOmQRzQ+JtfEZVpmyd0/QPhLd0NVmDU/pM9/g4GG60qPozNtbRRmAY/j/0r0HIlnV
	soyfNjdzgVvt7rUtbxscKkvWdXEtGCt53RT2OsgiNu0pLxOaHXX2Z0zPlXSMcdYp1zUJF7lM7zr
	owK0+kfMewIIEYwwmOZ9JL
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39b264b24e2mr7080397a91.0.1788542981174;
        Fri, 04 Sep 2026 10:29:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39b264b24e2mr7080342a91.0.1788542980707;
        Fri, 04 Sep 2026 10:29:40 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm12396019c88.4.2026.09.04.10.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:29:40 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Fri, 04 Sep 2026 22:59:21 +0530
Subject: [PATCH v8 1/2] dt-bindings: display: bridge: lontium,lt9211: Add
 lt9211c support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-add-lt9211c-bridge-v8-1-36d66168e176@oss.qualcomm.com>
References: <20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com>
In-Reply-To: <20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yi Zhang <zhanyi@qti.qualcomm.com>,
        Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788542964; l=1545;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=7XMiXr7D3fC2Of65x2F+DhMxVAnk7abheQMCzBYJB9E=;
 b=kYhjbJfhi4tdf5UoHfJgq76far9xQsD3X5MeAsAZnleqmu4fUPtdapPrjfXwWRK0+aVjZlLwa
 g07Orgf2xqXC3UjbnwoncdZU6X7jFoBMm8eokQWf+KGd3Ypsenq9Ca9
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: yyTBOyf-JbZC288J4t80ydo4ry0SXtcy
X-Proofpoint-ORIG-GUID: yyTBOyf-JbZC288J4t80ydo4ry0SXtcy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1OSBTYWx0ZWRfX4yMI3UHr6B1m
 uabQs0FwwBeKyje+V8Itm5pFfbIgyp4FTrEJL0cuKCpVW41Kjtq9IiOcj3egxj0L3bRn0HKjfPB
 pcXOB59mG+S4ZLjocQkzWlHOViJSCRw=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9b0006 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=UcubZVdaWCKl6vSfqw4A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1OSBTYWx0ZWRfX7LXPDytis7Wk
 +M6Ulrr1G2ZSkKx09pk5+/Ts5YAilo3axUyJRWDCqXzIrF1pHNgcKT3XSX6E20j89p8ecRvna+Q
 paUkDuO6rAEiwEG9XeOA7Ftbr9EdGURtSqPrEG86owLOJcpud4Y6SBIT+TmZhJfMYuX/DzaHU1d
 Y48qnq4S69eWM4D8Hcf/I8t94Ac9jKP5XPaRil2JDCG1oQkuXsqncoKalMG4TEyHl9wHS9we2l2
 RAskfP8IjIJcdStJlFkB2YryNKUKvhkQj/4bZ2lkkc3OBvy8Yup75uORkch3zqZpD+Ydy5g4LDb
 1wO67b2/cyYL+IPJ/oaqUw3OQkogTjXsjHkV2pZHDJ5UFIBMiNRfuObua8sOdNW0StyvNyD+HeP
 UNDmVI+e2/oPThAKHFXwRS2kZl/nG+7s7ea+3AlowRfh+RCnGK1zz8G2E4B3I6nzGixDXui8CLQ
 oX84Tza/bazoLvP7TBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040159

From: Yi Zhang <zhanyi@qti.qualcomm.com>

Add binding for the Lontium LT9211C bridge chip.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
index 7cfe92a8bcd7..de61bda09db9 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
@@ -4,19 +4,20 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9211.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9211 DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
+title: Lontium LT9211/LT9211C DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
 
 maintainers:
   - Marek Vasut <marex@denx.de>
 
 description: |
-  The LT9211 are bridge devices which convert Single/Dual-Link DSI/LVDS
+  The LT9211 and LT9211C are bridge devices which convert Single/Dual-Link DSI/LVDS
   or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
 
 properties:
   compatible:
     enum:
       - lontium,lt9211
+      - lontium,lt9211c
 
   reg:
     maxItems: 1

-- 
2.34.1

