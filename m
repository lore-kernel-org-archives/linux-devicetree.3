Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233F13AE188
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144511; cv=none; b=O6AGT2tvwjOfnJwNCiwNZxQ68EoK4D+mljsIYuYtfKQCmDNXjpTgG82M3xzt9b+eSydJOsFgfnS7L7hzwJx7Wrg+KUjnUILsNVisRVnXs0if9UBS6fwOudIP45XCHnqrCZYpxF1szoUOHtYSIXc/zM4Guvr0Gdwzten+NH6WYyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144511; c=relaxed/simple;
	bh=hC8gKxPAIzgcAiCj4HFnCCX8CcpOJ7V8eE3rHascLoE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=etVM5gh5Csg+22eMv62uo/KNiy0tFSDfrBjfh98lNFMG5tpaQmRW1VRTUXDKnR32P1542KRq4ENlQUAm0/sQq8WKggKutelz5rM5i75HuYhXQ0Sx2klSjXs5r78IKcWZPgaqH6Dz6i8UhBPV6k0dfhLPN6VYuliq7VMgw/L/qQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBHwSjxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Brj7PLn0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBHwSjxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Brj7PLn0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wbB81926382
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 09:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QvsauNTq3rUboIdRUovFsE
	quKr6TllKsvzUgfaR9kbo=; b=aBHwSjxS6EJ2z88l7pE4wXiR0iON5CG+5SY7ze
	rOc6ER0R4wQLE/c08P7ZPW5zibUnSxtoriKanBGCmUg6qBR7erkNQM0AyCJ3AF8i
	O+XZJTtbK1UsaCQH5OCiawc4WDX46+vz8VtZGHDL54FEFCFOHbOVkYJT90wVnWbH
	r7lOf3vz6EPsxq5QgPj7M8kzSW4AatiJRyFU2OuZsU5f2AL6RZtH7nqvXGtox//w
	lZRrHRlw+h8fK9XgjYt9hW40xmyvSXp6Di34uS7WDgIOJ58wXrAOVVFoyNU/4Xlm
	GOMh8xyVO540xPNtANvqXTx/8HspWBAIH8/vVFBDONAquP5g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g8pnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 09:01:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-62ea6ff1ca6so448152137.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144502; x=1778749302; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QvsauNTq3rUboIdRUovFsEquKr6TllKsvzUgfaR9kbo=;
        b=Brj7PLn0ITlc6USAEdRcwZ93OXZJ0Cr5aKv5CI9uPrZOEctNJfqolY+yD2McM6h1qp
         0375RSJDy/IcTEsSPW+FiB+HXtlf2kOR2bsDFri9fxyrsr8OqAdt1Lj2JLL7jop/dm+l
         vIsyoMVgnuMT1DOIwDYW3dUUAq8DVNF387C41TPHdPTGFzO6rX9GiS9uCIEl5Di3AUdH
         KG+9EGMPBs4kdFboGSzj1wta+GjaA3X6M4HCPoB2nnmOB/FsMMvNKIGjmXU9rx5VQd7C
         3WbOsD4C7qLf6cMkJ76pmUgl50wcMKpi8l1RSJI3utbPKmOnC+yIUU6Ft/7QWPiPq5P5
         /tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144502; x=1778749302;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvsauNTq3rUboIdRUovFsEquKr6TllKsvzUgfaR9kbo=;
        b=NP0oR5aqewp9gR+b580S177lRx8z40nV3VjyWziR+rbq7sCIN9WSEmdwZjUKI4q7ub
         G8RFp7yFSlwk3zDJjo3BlXq0Eq1vp2yj9lMM/56Ja78cinLtc4zsDghjQRiwR7AiBTpq
         6KPy0S8w8iAZeKhxc7rph4JPvI9cQqVPTEEIDlE113Lq9If7qLDFna+EivPc9r42Wl+/
         7HF98cpjhD/xLKDrE3dAl0mHIUeiEiAOhk9TuAiIDHNAKRcCsCDnGhIoniOInY3OKiMF
         nHray/tZ/BYaQJkP79C2ugzCAfaYUgaMJOVOhNDckT3af4JxXxdCP4CPBCGivpSB/NuS
         PPnA==
X-Forwarded-Encrypted: i=1; AFNElJ9K9PRguuCwiugZC9FC5QiE50+L1ESJYxtW3lhwMtZEvGsH76nHu6YCGppQnwhwUtPjmVQ1Hg7N5pbj@vger.kernel.org
X-Gm-Message-State: AOJu0YxRFLmiW4xwy7l7ZuKUmZgKVhnD9ywLqjCExi5bqcnrH0CuIdD2
	qFiPsKtDbd435vc3EujG25f1Dd72vnrNB6inLilNowgEK00a99AHYRD5LCp1ciOUo96cHgeriHv
	PlBvAaGGmiGAeqy/GPZFzV2BIN/uI25IjYm4aPnAsoo/h2DjF900hEKbS0juVSkKz
X-Gm-Gg: AeBDievdbxvj9sdjnUo0m75MFAL7Xk7YNB9pDdg7nDxnshCtWX6LZMq6P6lbtQGVzPi
	OzrQNAkFvu6n+SIbuSoY8FljtNHOLTnjPgHjsW8V2Y2RazOVZ1+zx7wmfCXvWmCt/tNSfr4JNBh
	ACCsC1cfroKtphLtykPMhbLqNb3drHZmNn/j5zrv23HKeTvKpBHcpVBKdLsQn7/6x+7R2TMgyok
	9MUVR3r2a+KPzn2F6QQcib8Vzf4JffxioojXHUx3HeSZt6ChYpeE4Lbbg0ToeDLSdEHILrsTeX8
	+o7NaboM2qhxeorKpDW8BAKTgEsZerFnYiShQCsrmUcZh0B0YhDBcP1wyVkXBjNSzhY85u4tJKz
	L/yQRGDPYBaeEROgB+pvcq683/IT0ep1aiylDFcv3uM6UB1zTW704PD5fv5S7ZWgNs3l/3VMNo6
	o1C0BCVZshKFrxBvBFCLB37Owa7qD67HvubRZGVwofO6ETYQ==
X-Received: by 2002:a05:6102:84da:20b0:631:23fa:38d7 with SMTP id ada2fe7eead31-63123fa65c9mr117646137.14.1778144502466;
        Thu, 07 May 2026 02:01:42 -0700 (PDT)
X-Received: by 2002:a05:6102:84da:20b0:631:23fa:38d7 with SMTP id ada2fe7eead31-63123fa65c9mr117553137.14.1778144501588;
        Thu, 07 May 2026 02:01:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a870f96cb1sm3480516e87.22.2026.05.07.02.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:01:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 0/2] drm/panel: support Waveshare DSI TOUCH kits
Date: Thu, 07 May 2026 12:01:31 +0300
Message-Id: <20260507-waveshare-dsi-touch-v5-0-d2ac7ccc22d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOtU/GkC/33NQU7DMBAF0KtUXuPKM7Yb0hX3QCxsZ0KMaA2ex
 ICq3B2nbLJI2Iz0pT/v3wRTjsTifLiJTCVyTNca7MNBhMFdX0nGrmaBCk/KKJBfrhAPLpPsOMo
 xTWGQBA00Dvo+GCXq50emPn7f1eeXv8yTf6MwLtTSGCKPKf/cZwssvf8XCkglLbUArbdOgXlKz
 MfPyb2HdLkc6xHLUMEVBTsUVqqxofPkggV72qH0mtLblK6UduStVohB4w5l1tTjNmUq5dG0vaZ
 Goe82qHmefwH3TFB9sAEAAA==
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hC8gKxPAIzgcAiCj4HFnCCX8CcpOJ7V8eE3rHascLoE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/FTujaLZhqlfcwayX7sT39yXXp3nnbfAwrNYB
 MNe/6xhaHqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafxU7gAKCRCLPIo+Aiko
 1ThICACuFYxF7qCax7SDv5ziEm5eOGVJeGWP+9tZXlWlKK7NvYNaNHOnmCivZN+0/u/nhYJCsva
 w6G7P48wuUeeVjexqKW6DlO4nIhNh/1GKpJl657YW0DhnK5TmEUpaPuWvDDI0z+FEjHZWxk72Qh
 nEvbLK0MiFWDIOuxveejtaPqSSVmCk3tpNEYA5cM9LDMZPOEZcLaXVHdprOSp681D/jLGxjNHTx
 R5m4cpZthxG0gP0ng86u+YoT9BidjySLMVQ77cbBO3nP9wyuHxuSt/yVMS1KyhT4qaoVF4tBK/w
 nqOuoAMwn+G3R6hNsbOc+8Wjlt8byBDC/uH//rWXBWKMvb9d
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc54f7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=woyZ9DH24JpTQh7i3M0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: KifVlKz_-2tWeVrsCa4u9ByCJJV-OEia
X-Proofpoint-GUID: KifVlKz_-2tWeVrsCa4u9ByCJJV-OEia
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4OSBTYWx0ZWRfX9AcL5av0RwCC
 86V8ZKrp93K9+NH59dqyZMUhT8gg1ex4zgTSO++V/jp35O0pInyxWMqX1RIPA/14DncgLqnn7DJ
 h7K5m2xRy6vVIin+Z8qU/2BA0HkuMGElJRxpRkHF6UMPj+hNDcxy+u6mpTc6a7drhjwck8czu23
 lxS1tCCClyYRks3+BpikGGyC9+kO1pNwJ11n+mSZaTpoce+WRKMx0siu6N1X4DZEBhvt/XFeufC
 rolbaxDJMkMzcreFVGxTM/Tg8ztAZ5gwZ12X84Utc8Q/H+rCVtSevTqGUnM9fnifz7N5tveMZKF
 AgllZ0O/1oHa2+6hSEelSOgiKRBl86ovFx+OzQsuNrLK8y+MT9+nxEKHbxwK2YMVmt3DhYBdm+x
 X9yVwSjYQhCsiWkU11zP7URYtXpERmO89cftijjzFLo60xO8DoXqMObzAPbHoyRkYoWqUMfEazg
 V55BPVJpj6iSnc3e3kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070089

The Waveshare DSI TOUCH family of DSI panel kits feature different DSI
video-mode panels, bundled with the separate controlling circuit,
produing necessary voltages from the 3.3V and 5V supplies. Extend panel
drivers to support those Waveshare panels and also add GPIO driver for
the onboard control circuitry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Dropped applied patches, leaving just GPIO part.
- Dropped panel example from the GPIO controller node, it's has no added
  value.
- Link to v4: https://patch.msgid.link/20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com

Changes in v4:
- Dropped patches applied to drm-misc-next
- Link to v3: https://patch.msgid.link/20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com

Changes in v3:
- Fix another typo in the focaltech,ota7290b schema, sorted out voltage
  supplies in the schema and in the driver
- Dropped Ricardo's T-B from bindings patch (Krzysztof)
- In the Waveshare GPIO driver bumped max register to REG_VERSION (Jie
  Gan)
- Add a lanes vs config check in the JD9365 driver (Jie Gan)
- Link to v2: https://patch.msgid.link/20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com

Changes in v2:
- Fixed errors in focaltech,ota7290b and waveshare,dsi-touch-gpio schemas
- Split the JD9365 patch, making the changes more obvious (and
  describing panel classes)
- Cleaned up GPIO driver: moved NUM_GPIOS from the enum, switched to
  guard(), added regmap error handling, dropped
waveshare_gpio_i2c_read() (Bartosz)
- Link to v1: https://patch.msgid.link/20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      dt-bindings: gpio: describe Waveshare GPIO controller
      gpio: add GPIO controller found on Waveshare DSI TOUCH panels

 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    |  73 ++++++++
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-waveshare-dsi.c                  | 208 +++++++++++++++++++++
 4 files changed, 292 insertions(+)
---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260401-waveshare-dsi-touch-e1717a1ffc40

Best regards,
--  
With best wishes
Dmitry

