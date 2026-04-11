Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36809344057
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909453; cv=none; b=UCQaZwbZ9s1ySus3tRWxqKvIe13hzNlDKHPPI2oDS4HApwLT66YNviVS3jzEaGcrA0UBm1IJN9WHVDmDHwJNaCqdyUUYjQ8aDgNSyX2LU/kZss7s0BS0aUyhamXMTFrYYSNmygBVSFqNkpP+NBU9dW5HMLnm90RRDOz3BJsK8Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909453; c=relaxed/simple;
	bh=CXXPzEZBwQFoyAeoLk/sqEJFPJ8wqdICzZMEUpK6xc4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LtnmDAlS5HAOl2g8Ejf+DNizoW2tROHGCbaPdJW+L0VgtipnxFuxdRrtSIrU2NzUxQN277iAU2dT8Bv3NjYh0bi/ULNizn4WbPu6nKKI0wszdlnaoUgJugOpE2wp1rd79aXpKXKejKXBaXp1IA2VPow3VhlAhZ9t64h1WLgdTlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGXVTkKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1IeCJKH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGXVTkKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1IeCJKH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B48NSC1201965
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5O/dxjvokdyBHMUsNmLLbX
	Mzc9mz5c+6oNW9h17WMCY=; b=iGXVTkKgXSxictZ7WEfkbaw1tn8n5e44v06nT+
	64yp/LLrdZ2Le6+DbrES0iF8QMiB2I8iNfN1Zc2Ajp3SlSqsx4raO6sO1m0zF0rd
	9BMHK8UMYpXT0XsAwayGoT7k+SlPFY2pLEIKiI9Z0e4V4WL72mizeBCgTo7UZBWd
	AjB456yobLJo9/CRhm6tr/6z+5xxHLdZBIiI7dk2LI4AraZV38Yq9HW4Hdanboso
	FLHKkzIfiDIXcrQJrx4+HVUmc933rYmcDEEx4/Q2jZFF4BN5QgW7N8RGyr6nyEHW
	KNOIwu13+xT+W2IhxNV6gkDmHZ/XyavBygBNEbAopuZIuPZg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jrn80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b323c43fdso53417921cf.2
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909450; x=1776514250; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5O/dxjvokdyBHMUsNmLLbXMzc9mz5c+6oNW9h17WMCY=;
        b=b1IeCJKHYjGirK2Hhr3kmhf4kEJVEhwp1gzBNCbXSCXbRmB2FOHAQEJpAnhViFtot4
         rsKCZL09TOJOeBC+pZqveyFr6CqTYjb5HgsUuA6SydL8sh57M21j2feIe6aGA6VuBDdp
         h6H3Ic1/0fsX+g+qMMkjVpTzht970mmN3FOOWdoykx737TSDmbBpElv7704hMYAo0O0f
         VY2oOVy4YRVv/Zd4bFuXSEMegfhbtDScxrckcZEUXDSjRbMAu254An0yujSMlZ4aRXDm
         mXUcV5RgdkSrlpMcb0Kn14Jp7pNJswzQWqeEmHiLGgAYlnIgK7smm9RmfjQjyaH99pmj
         8kzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909450; x=1776514250;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O/dxjvokdyBHMUsNmLLbXMzc9mz5c+6oNW9h17WMCY=;
        b=Imsk1KUMAZMJgMefV9Rc9MG7Gk+QaeO++FUQpMWqZlFHaVAe/lxKK6w+oKx7GS+0GA
         iQW75TGuJdDoPnritZRdv3y6cfPQPmEnT3pBx/jkxjn7XfJg9HGSO7rxb1K216ueoSCT
         43BB4vkDDO0ePkiV7nAAkfUbsra6D+1Nw3QF0wfq52qmJca4OZhkcBlXSw6bhyyTktRG
         8r291p81MA4JR3r9Di/SVM+6F6Kc1Wp7TJLDf1UI6mJJNYQ3gHgzvtvDh/UxKIb5d3A7
         eder6Ult0b6zvm8bPzZLBMpEzV604ztIq4nNw0Jj/UaGs1PeDUmnQtXxPT7Lgwno/THS
         U6Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVSgZP+ZG6ae1sjZPwfcqNnJnw3GYr6afotuTwq0XCs/P0eQexvn44/i/Zhg1MD+4aVKL5YoIyyDuEQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzA72hV5vx/NjtGmF/cWaL7Usojd5T5Q6a+LKr0opos9WP6Gdzc
	GIALt4oaMaSynM7923Wgv7rt68gbwkFAoDSwn86N3Cpa+mECV8Zatn2Wsuk3Qz63jOZl371wu5m
	64qlY9cJG5gEghnba5L8p67EJZKL+tZO5G/+bXQAfGevthkYkbC/hZ5n0OubMaOum
X-Gm-Gg: AeBDietNv1PrSURfLIWcTBXkFZ08EoSJeJ6GbhaJvys5O8MLIV+CMJy0GaRFbHxN3PO
	CwGqRgb+rQLbbmHMo/Bydetej5tcQjWR+nDUnpr14GdyYZQENIA+gMx/yLOYPgG/Z42FdrCrZF/
	aGhq2RsTnpHbl26j+i7Lf/o28mfCe59pCtfcHlfX/LZMttyo4t2o7ojk12ivwHQydduYKDhOysr
	G3Y1ieldzL0ShonplQvCI4n04vNXDprTeB7+OIiO9ligS9xTfUxfID0/L/LV/cwIOCjk7sNG+LK
	3Vz8G+KHXnabHfJdyWKSi/bvukYWEOuD4UL5v2DqIJcYjl1VQJRXxJBwReuodv9KweFUO+SyNz7
	/PSPVZ3480rRr/iagPz6EzdGnJpnjclVuuO+KvHieYuv2jBf8aKqgQbodAypH9H+f4GF4dEvQT4
	djXU87bOaHv36rZ1+ojxgzSoC+eM5k2MP2cLk=
X-Received: by 2002:a05:622a:a18:b0:50d:6557:5caf with SMTP id d75a77b69052e-50dd5b05425mr105146731cf.28.1775909450293;
        Sat, 11 Apr 2026 05:10:50 -0700 (PDT)
X-Received: by 2002:a05:622a:a18:b0:50d:6557:5caf with SMTP id d75a77b69052e-50dd5b05425mr105146011cf.28.1775909449759;
        Sat, 11 Apr 2026 05:10:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/21] drm/panel: support Waveshare DSI TOUCH kits
Date: Sat, 11 Apr 2026 15:10:20 +0300
Message-Id: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACw62mkC/32NwQ6CMBBEf4Xs2ZJuAxI8+R+GQymLrRGqXagaw
 r9b8O5lkpfMzFuAKThiOGULBIqOnR8TqEMGxurxSsJ1iUFJdZSFRPHSkdjqQKJjJyY/GysIK6w
 09r0pJKTlI1Dv3vvrpfkxz+2NzLRdbQ3rePLhs2sjbr3/hohCipJqxLottcTi7Jnz56zvxg9Dn
 gKadV2/1V9Gkc8AAAA=
X-Change-ID: 20260401-waveshare-dsi-touch-e1717a1ffc40
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3793;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CXXPzEZBwQFoyAeoLk/sqEJFPJ8wqdICzZMEUpK6xc4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpE1KjblteWFTrO/ZNvpQl8RnIFiu1+M1eRo
 jMPZx/hGwiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RAAKCRCLPIo+Aiko
 1aSHB/4oAN2PUYhWkqReBpp3xtgk843VREa/honY2sAf+sOMSVdzA2C+LJlF8f3Mtu7nGuVNYbj
 M4UHxfmsGskNBhhOv+m0L5WBugfEH4Lp4H9tuXGIvJu80dKvmBLHwJdX3dX9XA9V+MCrExAIz7s
 8Dh/Htrx44bJEwDlQ+hUOAR7MLKEyFVCV8C4hLba0EnzNCLZKnmsnku/oARtjBnUu43MszIAok2
 CZfSGl/mdKmlJz8Q6BJ/9H5/+rCXo+b9gGrWZ9mAQKiWDikyu42u3cudTyJ27msY33u/cuORCuW
 WHubAuyxSD0cZbxJir63RIG0crZgtYKLHL0FStzYdap8xaS9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX5vpWj3M6U2kW
 r+OMtAwn6GmyrsU8jztNISynjGFdCraljietV3zMEG6dVmEOZ5bpcnuev9y6oN/EPApRhFb6+IA
 DJ3RocXDLBeQypDZGCWWstym/XFObJDs4cefHMevl0yXROQYys2l+7V2R9+qh1Z0jWcJa2XwKV7
 DeWKXLQ5WAQGT6XHvqvTWcD7XN/C1vQ7LWz0tTGoEASrKi/nxCzf/HMBy8/xDfWN6F0Wy+0zx5H
 XIWYm/psCaevZUbn4sCDbhCeQJQBPMXhN/VzydgacO54EMg0qdMQc0MZEyfHnJNrvWsm10RaDhl
 vWC4GB47LK4km7nQ7vwhz+TikKgi4WyYCq7fXWop/CBpBIe3MPAxmlUjjqR+8FIdJMH0U9xjnAD
 ol0DfFjODKUM3RKIuYq7QvcVIkOsOLuJLmMTtLCW+gbolzNvOhh1KA865hHenJFqJ5ZAKU9QFbN
 ZV92B622TvtgH4GVu8g==
X-Proofpoint-ORIG-GUID: qAyPQcQx2kTCyxt1vBwjH6PDZWvLAHGL
X-Proofpoint-GUID: qAyPQcQx2kTCyxt1vBwjH6PDZWvLAHGL
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69da3a4b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=WOO-qr4TJnSisU2av9sA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102

The Waveshare DSI TOUCH family of DSI panel kits feature different DSI
video-mode panels, bundled with the separate controlling circuit,
produing necessary voltages from the 3.3V and 5V supplies. Extend panel
drivers to support those Waveshare panels and also add GPIO driver for
the onboard control circuitry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Fixed errors in focaltech,ota7290b and waveshare,dsi-touch-gpio schemas
- Split the JD9365 patch, making the changes more obvious (and
  describing panel classes)
- Cleaned up GPIO driver: moved NUM_GPIOS from the enum, switched to
  guard(), added regmap error handling, dropped
waveshare_gpio_i2c_read() (Bartosz)
- Link to v1: https://patch.msgid.link/20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com

---
Dmitry Baryshkov (21):
      dt-bindings: display/panel: himax,hx83102: describe Waveshare panel
      dt-bindings: display/panel: himax,hx8394: describe Waveshare panel
      dt-bindings: display/panel: jadard,jd9365da-h3: describe Waveshare panel
      dt-bindings: display/panel: ilitek,ili9881c: describe Waveshare panel
      dt-bindings: dipslay/panel: describe panels using Focaltech OTA7290B
      drm/of: add helper to count data-lanes on a remote endpoint
      drm/panel: himax-hx83102: support Waveshare 12.3" DSI panel
      drm/panel: himax-hx8394: set prepare_prev_first
      drm/panel: himax-hx8394: simplify hx8394_enable()
      drm/panel: himax-hx8394: support Waveshare DSI panels
      drm/panel: jadard-jd9365da-h3: use drm_connector_helper_get_modes_fixed
      drm/panel: jadard-jd9365da-h3: support variable DSI configuration
      drm/panel: jadard-jd9365da-h3: set prepare_prev_first
      drm/panel: jadard-jd9365da-h3: support Waveshare round DSI panels
      drm/panel: jadard-jd9365da-h3: support Waveshare WXGA DSI panels
      drm/panel: jadard-jd9365da-h3: support Waveshare 720p DSI panels
      drm/panel: ilitek-ili9881c: support Waveshare 7.0" DSI panel
      drm/panel: add devm_drm_panel_add() helper
      drm/panel: add driver for Waveshare 8.8" DSI TOUCH-A panel
      dt-bindings: gpio: describe Waveshare GPIO controller
      gpio: add GPIO controller found on Waveshare DSI TOUCH panels

 .../bindings/display/panel/focaltech,ota7290b.yaml |   70 +
 .../bindings/display/panel/himax,hx83102.yaml      |    2 +
 .../bindings/display/panel/himax,hx8394.yaml       |    2 +
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    2 +
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |    6 +
 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    |  100 ++
 drivers/gpio/Kconfig                               |   10 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-waveshare-dsi.c                  |  208 +++
 drivers/gpu/drm/drm_of.c                           |   34 +
 drivers/gpu/drm/drm_panel.c                        |   23 +
 drivers/gpu/drm/panel/Kconfig                      |   13 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-focaltech-ota7290b.c   |  208 +++
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |  144 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  279 +++-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  251 +++-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   | 1563 ++++++++++++++++++--
 include/drm/drm_of.h                               |   13 +
 include/drm/drm_panel.h                            |    1 +
 20 files changed, 2801 insertions(+), 130 deletions(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260401-waveshare-dsi-touch-e1717a1ffc40

Best regards,
--  
With best wishes
Dmitry

