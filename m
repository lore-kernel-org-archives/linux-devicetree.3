Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2869437DE9F
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 07:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028410; cv=none; b=fhGl1n7DDAhuHdX8dIcZ8rTQMXW43K8HorIAbyJvOn/XmFWfCylmsnziX66gACktMXPgJq0Y/Km8/cHWlE20PFnnmOEfOWsbd0sApKGcb8ADy/vwgbdgus1ebzctV5c9SBTE0kL9ryYT+84wPHzA489figCUL45ftxsGQsGJ59w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028410; c=relaxed/simple;
	bh=yhP4V2QbDZyJf1WM2vX7tIqhltacQlU0i2WT1b2Nhzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AkopMHHQ/Yay/lfFjP6Pea9ACtTxCxS66GuZXyl//LWBy/UKKU92Fk7tR5ZsQlD/PKTX2F0kiJbqei1KdEkHihycNKmjzTzPi7rS23VkvNEEML6381hlv/g5EgSItPml/ar7gA1+Vi9x6sotPhkq2bGHMbf/sTr9CkFUV6pu3AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0dPc8JQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgKq5lSM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0dPc8JQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgKq5lSM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312IxOZ1005237
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 07:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNv+a5JUOkvD13PQtmo1wRsoE/3FPaE2XhBNcETttd4=; b=G0dPc8JQ/45NbXvB
	GoGCDjbCFHHc9lsHFrhnaAAI0TMkLT28BdeC9sndHsG+HSxhrF33RkgMdi4vaOm6
	ROVHMkmiNG4hmP+20mEZHow1vMVwWA8memHpAzni9TInX5v9YnVRBTdetEcKQUXF
	LOkhYCdMmT/ccWBHwmsNst069vd8JnsYyVHrZYwclBt8Ktz7ZzeJzcRbB3erWqgZ
	4mo0oWcrqpzdSnskAVFBnejSI5dkQotrZtGRkgEqJXl9HxEItjEF8KJWyePxxtHD
	7sYeWc4p7L0L8FCR7QoqzTb7CI7mWigrRpV29vDrKgyGnjniSc5acrwhsZUuY9KW
	vzOQjg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjh32p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:26:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b52a2d70cso197020651cf.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 00:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028407; x=1775633207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNv+a5JUOkvD13PQtmo1wRsoE/3FPaE2XhBNcETttd4=;
        b=bgKq5lSM/I6Dcp1S2Wpr4nYpbNnJm9KxLS5dc0L+tneJjjaJdtNEjxfsmX4Df5qou9
         CsgyMX+bEXl2PioHJKsVcqwuCRDZLUUyZ/hxOKCoo3QfDEs7JyRsjkICxgCLuJPUqoqb
         GRWj6HX0VdWKSl6+Yh9uJlmGJp+PYl1vi0o4H1rcwu/ac6EFJ9Pa+k6ph17jdAc/exKn
         KUoqOr89OfEbTbLmovCOKZNGg7xtHdXtpRhAcAcWP+x2KzLZScWsPkx54ENLhCrKDCdj
         uFP5+gCo6a2vDpYeeEsaQ9y7lJQprxu3Z+mV9ZG+x8pIiB1WAZQ0vkXv44JyW36QFRrU
         Zosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028407; x=1775633207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TNv+a5JUOkvD13PQtmo1wRsoE/3FPaE2XhBNcETttd4=;
        b=DSacl2HHAjF+fVnbASKrpdBPXsGuDIIOhX7C8ir8tzXc9KsEJPKa4pOS7heaouh9et
         1EKXwKQ5yXqA4CZD6ymRf1QKAMHcWB2B9fYp8OIcSffkK0jteSpNOKWIJcDqqgNb1HwX
         tihx3vzR5S/TYfER+YUnRCbevGFlRdre4lOCZ99J03HynAq5Z/rJ/N8vfgU29ucK/gQc
         ZI/kyd5nmot8k3nxKgYBR5w7rsqeWJtCrtoUcvCTK5wnhTCd/p2HV/Dqzl6VsSYQlAqH
         XSrwm5y3y/QTGd7I1SFZKKakrTTmHgX0MqRe9+kUwAb7nl1J43l/tKXQ7y+Hkt/RtWlT
         a4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlVS2iDSW+JVESIBk4LLE+gfhBbjm9w+TtZG02+8IGpAK0UccroPysKQkdFEkqyco7pFx1MNUuA+7u@vger.kernel.org
X-Gm-Message-State: AOJu0YwIvd6pUnv2XKBD7NvJmbgNr2raa/Amaw9AtEnKFRXBfLx4HUXk
	/xnIWWsRfxO8LWMcqmzo8ap3BqbZnooCQOYUGMamXGB7MfdJqNHG75JEY2S4T9KPqckNtUiY4gR
	kL9IqR8Ac1jvm4FfNwaDF23EwunV2QGBYV0WRW+9wUvE4wOQlEDj8Four0T/9v7Ri
X-Gm-Gg: ATEYQzx9zp4AEDfeCpnR1cLuJH0cj1fyhsymT0uDwodILnTZYU6UC3KtxCKw+n5k2vK
	6IpXeetbehVjJ3iz08F/AsnJbrx8tVChsM7sFO0+cnbv6eD5Y4814zldILMgK2HyDgicCSRnWaD
	soHRRYlbKQzeah4/b9fmtmmKDKzcnphWV27T9nI3Uue7Ohi3RrgMLAvIXtrS0SEYzrrQNIT0Jx2
	YWApk6ztTpv6TCvKPRE4+MqFDuNcsRl+nQemWqoc/xxVZmOOZfkJ1d0MEXuEWFJOzo9r7eI9We1
	ISPrYDw0r4o0uHtlnR3SpL17m9yxRnzRfkOipafQ6h5TQlBfHvipGpJMKGsW4x5+E8ICUu7E416
	Arq6vfoJW1NjNDaS0Atba9npLeD2w8gMyEyfWokEVJGOEzf5MordvdqdJr0RkL27aSDOcZLay3g
	xQkwjq5FKtoK1Xx99xae1eL7TlljCI84wFSc4=
X-Received: by 2002:a05:622a:1190:b0:50b:3895:c22f with SMTP id d75a77b69052e-50d3bbe4931mr32293381cf.26.1775028406739;
        Wed, 01 Apr 2026 00:26:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1190:b0:50b:3895:c22f with SMTP id d75a77b69052e-50d3bbe4931mr32293141cf.26.1775028406296;
        Wed, 01 Apr 2026 00:26:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:22 +0300
Subject: [PATCH 03/19] dt-bindings: display/panel: jadard,jd9365da-h3:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-3-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yhP4V2QbDZyJf1WM2vX7tIqhltacQlU0i2WT1b2Nhzk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMirbFLb6Baak8sFkzHlNdA4IIkaehp7V4znF
 gWdYY8j+seJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqwAKCRCLPIo+Aiko
 1espB/9PREhQL7BJDveKAw5tO27VKyrw5BHFLVpBB4WXTy2SgPayno+Uz6Aqpp/LxuYUg/v45PR
 7zdCuTavjnDDTILojt76Fj7jn9VByeHKOToCqKFB554AwNx5rq+3iG6SKEL4FcImZix4DJTf+lk
 UXwLIME3Zknt8jwiEw6m/ve2pq9UWWfVN10cY3bld9+GT1gfw70avMmCRpbe30qZytYeICB3ED6
 8jSUqaTHBRn+iPFduDiK5b9XpW6+FVcfVSUNiADxOZaZNRJUGxD9bhxxmfdkLruF7REkgTHzN8f
 Xgo3UGueIUwF/HhW3FNu9Jksy7i+9N1mJXi4UtKbnU5f+m70
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GqvUomTw3EQtnodPimOd9A1G22c26LaG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX+nfkYOB++BHH
 5lzuIb6VwlXz8wm90h7N5UBKsd4KDL0RccvcpzanioOJAW1TERAB17VHnGXcED+XYYjqS8ZEoTb
 eGlbOD0U1iWJhcxyzLl78SK8ujCHl3zVdnH+hKbHduyTZdBfk+8pL7p1j4DqoZfeCDIq4A1Kg4j
 AfjBtnHTdhDbxTYfidBvb/Ubk5qQ5tmnYHvu7EVsvponN78h94zzUsUY/boEyxK9UH2RUtD/7UM
 lYfFm/Odacj4qzqZbi86Uk7JffTlmGA1N5pHpN7jBwgVJBGPjSg6W9O+5UMc3xJFaqirGBTFSVn
 c0d3fDjh9hRKh9MERywrmBZ9KxSM/yWkNM15/GBzkyh8D4Yt+4OOKHq3nydw3VSPcjIi7084Vvw
 Jd6fUJI7GjO753LSSukCVbYp1GgZLziM75Dwt91nH5KhtPTh+YMG88J1JXz4BGOeCwUl+8S7ygH
 D9Uiz8tAQgooH2uezIQ==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69ccc8b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3ozaZGYpt45I3yT0zMEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: GqvUomTw3EQtnodPimOd9A1G22c26LaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064

Describe Waveshare DSI panels which use JD9365 as a panel controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index e39efb44ed42..4eae802de9fd 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -24,6 +24,12 @@ properties:
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
           - taiguanck,xti05101-01a
+          - waveshare,3.4-dsi-touch-c
+          - waveshare,4.0-dsi-touch-c
+          - waveshare,8.0-dsi-touch-a
+          - waveshare,9.0-dsi-touch-b
+          - waveshare,10.1-dsi-touch-a
+          - waveshare,10.1-dsi-touch-b
       - const: jadard,jd9365da-h3
 
   reg:

-- 
2.47.3

