Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C783876D5
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877159; cv=none; b=B0JFf7z5mEM3iF6D9yhmQTq9B0LoqWDz5+VKjjxBd0waS0Y0xZx5TC5uQUZWy0uAYx++9tT+HPIwyvUrTgrayg/MhgtxGXs9D/h0PdK4R4opogrqBTG0iaAKxWKy1jsVRi+m+Whsth7qBoGCBmq2sOMKe1CavTBxhY62vF3OeBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877159; c=relaxed/simple;
	bh=AihcmDk2VyR0rLrDcXmoxpO9Dy0ChhiWDN8sIx/tGh4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XSqqzMPNtSIr4Yk5EYU4Q/pB1izQoetciEt2UfO3ygJixjiu7XH/dZZmvbtTDUVdnWfNQfQOelgPRr9J9Af42ciToyoFwGtfivj/h+SsMP4uGBpHD+kejEtiGP5VeTAL0TGj3kJmJ23XphQR6cJzkASjPEc2eMlVvdRf7DVq2bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUwJIzcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSguxbR/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUwJIzcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSguxbR/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCZQB82961221
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bTkKqjb3febqgGGkY27aCe
	3TOl6iz5FKhdgqauH7KP8=; b=RUwJIzcRBuqItOygHor1zOFtp6PncwOEx8X6HM
	txhFgav2Jy49qNrTS2rQrgrFWAD1zPCcIfqumNCZbGtQtoobO/dYRR4gsPSAJuDs
	Z7TlpCzwQvCaQg02Z2Qfze2/D3bVsyVgT4u4M88PxIUKAQqOQokOdR4TnFvhJepP
	+P3Aj8nqCvE7IpjIDbm/gSkRNDE0FWTBEtGouKmQCTtcA9+YKz8zPfNf/f0XrD/M
	2B4Ffo1eery72rO0PVOCHKoozRldsf8loHmt366pBzqs8lUDCQ1dX307/JX7WcYT
	+N/I1kZylA6HgAEx2ToOIrK92ehZTaSvNbMqtG9O0EEtnqVg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmmg9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:25:56 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-953b90636a7so3094203241.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774877156; x=1775481956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bTkKqjb3febqgGGkY27aCe3TOl6iz5FKhdgqauH7KP8=;
        b=cSguxbR/P3pTSS86iuqELBRYVYVnN/oOEyEOhMFMsNkWAS0LUEIPr21BB0HjePAw5e
         nBSz4bB7KI5rL7J4a8bYat70uRnY/+F8AE+ZPS3tMsNJgHKJ11D0VoQGtsWkEpT9Zy2j
         66mbaVZwPQ25vLEazfd5AX5slWb70URJ4oUsqSehhbRraqD3Rav+4+HosL2l0e1mcj9K
         +GARTYjL5LW4Dck1wU7hCARPSKz3xOBkmGwguhPB8y0yPRvP1Nc7+12sdQwMeVCQxBGq
         zJLKzLG07kIH7rvSuAGnAa+g0EkF7RZVZyzdQ+PdW+Bxk+eb85sThphaf1UQvONEutib
         jsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877156; x=1775481956;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTkKqjb3febqgGGkY27aCe3TOl6iz5FKhdgqauH7KP8=;
        b=o9BomJXVAL9Mz+KLjZmf3QLN8AVmkgMEW/Gvu2JY6cFlwHBXxX14XNu+Ci4yhlffHt
         W7mwyIqrbOyOTWyfqiOoaSvH7xD0Xoaq4s/z1XjcA7mv3nej9F3xD8eUSRUZvOu6mrrO
         2gEvGDGVroOLcT4WXdyCFXPaaEJlJP4xWKciB831I4Rc0wX3Xie6XXWhxs8WWcZBq1OD
         fy8W6lNrHiF3yDqPuijF/3Jr/OlSZ2PizEDG4Ch81CywXWNk3dn34Pqp7owPKyPm61L3
         +t4a7YAMxKMB05Er0mUbajB8zpSRbXUKsoZs/cactiUv/J8GK/KdECrGK9X0AvjLC3/B
         2cig==
X-Forwarded-Encrypted: i=1; AJvYcCUGlNsR+aW6q8OLb92rJdF3gTa7LeISRcG5m1Qmh0/KlfXJwZtZDACyZEei7CHVLaZjolQ6UOKkCsCl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8W7SP8zX2ynFDopm7WzzHoMRBGhAO1lc+gByv/9d3IpRXPRKl
	IAAR4SyDZKPiU2BNF8xSaA9QXZSzGix4CQCkkRFstYnur+BuftHNCEiOPBykuMAeR2rrah15Vc8
	ZjZaJprTfZ2nuvnWu9EGe+Jp8Vll2dhlKRCzR3e3yD73oc+RRQO5lwMkVgWU5kmKn
X-Gm-Gg: ATEYQzxYYAtZpASHo3cbxbEJSJdDv6aMhfPHhetVAaoJHp/Tl+zV3Nu0ns9zlRepEJR
	JRgiFuWuunSk6R6+CUC+gDYVuZoK5Eq7zdPaTC078LSouec9xjreGmXOboDGqJMixi5LTTE8Odh
	R+r/e7U3rOVXHU2fP46MdGjYG09x+eoiRAgIEV0Ud0iscLe3MJmnv4kjFbppTQKDPhXWnB8NxcA
	whvHb3ZAlFFYq0ZirWbTY8d5k79fXH41jp5yYxbgbb1GIKgXKeBxKExLcxH1JOp6tdcrIY2Xc+Q
	Enj6hF8KPvjg25VwjV+FFGlG6/UcLv008TF74xduBOcO9WY+6tBYBC2FjcuYTMEYZP2BK+hSEbH
	GwF1HQZIbPPYxwxEj4s+9cxlVdutpRxDK2KJeLPt+oaQHCMRBpphw6KFX4Iwdho8vZ2HQAYhl3s
	7halF57SsFc108xVDRCbTWM8x9dEBH9EeuqWY=
X-Received: by 2002:a05:6102:440c:b0:604:f640:301e with SMTP id ada2fe7eead31-604f90dd722mr4919589137.12.1774877155860;
        Mon, 30 Mar 2026 06:25:55 -0700 (PDT)
X-Received: by 2002:a05:6102:440c:b0:604:f640:301e with SMTP id ada2fe7eead31-604f90dd722mr4919571137.12.1774877155382;
        Mon, 30 Mar 2026 06:25:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd035sm1698928e87.18.2026.03.30.06.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:25:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/panel: simple: add Waveshare LCD panels
Date: Mon, 30 Mar 2026 16:25:49 +0300
Message-Id: <20260330-ws-lcd-v1-0-309834a435c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN15ymkC/yXM3QpAQBCG4VvRHNtatqXcihwwBiOhHX+lvXeLw
 6fe77tByDEJFNENjg4WXuaAJI4Ah3ruSXEbDKlOM22MVqeoCVvVZBa1QVtjkkOIV0cdX99RWf2
 WvRkJt3cN3j+lS7W5agAAAA==
X-Change-ID: 20260330-ws-lcd-b65c03c5ac17
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Joseph Guo <qijian.guo@nxp.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AihcmDk2VyR0rLrDcXmoxpO9Dy0ChhiWDN8sIx/tGh4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpynngccZWm0WT+tgmV6loKdff1Ed9IH8jGTT/O
 Y++41W7GPKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacp54AAKCRCLPIo+Aiko
 1V17B/9xII+jDJmOps0JIIYTMZY7j2t7dc0PG3Bkt2H4vc8kALkhEFEmgNomRCA7hgv5xMC0k5Z
 68j2JTF2EXZ7g6u4B08XQ/AzLul1tw4PieHAeZd0MTV0CVHRgn9p4wSplQEUXFBlg0N2yvDczme
 4gRDJbGxD0EqCRGXrrIgzLBGmkKkwb7jha+FfXWnD/Hbjht8J1G0/jyQnN9cY49DTSe+grX96t0
 ttw1IGEXWK8Xieb4hDVFPHJnHE0ezyfPGNedM4PprFSr/QZdrxr6nMH/xmCY3dYwHbz2OU7UdNJ
 EJK10zi9Bq6AQTsh/hqKVnO4QikczbjgytPO3k5V0aLNrTbI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNSBTYWx0ZWRfX2q6aws2fIKKl
 9h8mqC5nlvudIB0gPyjPX/2N1E6ycWWF5g83H6EwHji7x0OBNurH/Troqtf2Oe+amkANqfpWvLJ
 4yNxknmN5aT9UCx+DlcIh+row4HprsAurUrg7j8sRx6Pyugwy6o/ZEPi43Gp4dfgtLBCg9eMkp3
 mpj5HXxWyeHXhGWdJ2/1nC9SfJnUVc69KprupmTWgeLYeKMdZEvZPFndAOIHzxM13q3AJU82A41
 5TFnA+q2AItMgr4PBWn9ANDShUfkZpgRwRqX1dLPxkm1sc1oBT0s4KdOO0CRDX1XYCyevgQLnp1
 Od3/GmcJV94b1GKlDbrlAbMRm32HcHKfmI2o1F21v5typQwvbEEy6xxz7eAjQ9cHmuD3N7pryX5
 XTx7dUgTgCx71VomUQwjKqNRVGBvzsXiepE2TxC5Odr2IT6c4RCgVvTDryEc36JsukKSeEIq37s
 doAlReW3PUiS1kWkf8A==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca79e4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Lb5j-gmOE-iAMMu9PAMA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 6xnkDhzbcUG5pt2alAP6HE9e3dZYNdTB
X-Proofpoint-GUID: 6xnkDhzbcUG5pt2alAP6HE9e3dZYNdTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300105

Waveshare have a serie of DSI panel kits with the DPI or LVDS panel
being attached to the DSI2DPI or DSI2LVDS bridge. Commit 80b0eb11f8e0
("dt-bindings: display: panel: Add waveshare DPI panel support")
described two of them in the bindings and commit 46be11b678e0
("drm/panel: simple: Add Waveshare 13.3" panel support") added
definitions for one of those panels. Add support for the rest of them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      dt-bindings: display: waveshare,dsp2dpi: describe DSI2LVDS setup
      drm/bridge: waveshare-dsi: support DSI LCD kits with LVDS panels
      dt-bindings: display: panel: add Waveshare LCD panels
      drm/panel: simple: add Waveshare LCD panels

 .../bindings/display/bridge/waveshare,dsi2dpi.yaml |   4 +-
 .../bindings/display/panel/panel-simple.yaml       |  28 ++
 drivers/gpu/drm/bridge/waveshare-dsi.c             |   5 +-
 drivers/gpu/drm/panel/panel-simple.c               | 381 +++++++++++++++++++++
 4 files changed, 415 insertions(+), 3 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260330-ws-lcd-b65c03c5ac17

Best regards,
--  
With best wishes
Dmitry

