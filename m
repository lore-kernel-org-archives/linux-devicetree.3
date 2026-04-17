Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DE92D9787
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776467790; cv=none; b=NvW1o8/IEdldDLeBQzHvIGZGCfirWAF1GeK5MWs4Yj0VDmXrpu+3A8TLJ6ZaR3D0pG8b+hqHizFxdbqpBtQqElquclSaSXbHrB7MoyyV35ovFkmUuZQFjwKCh+AY0sQCbD5SHWm6NdT8qJ6esJcVKlKbQ/YLYnUQh9bNxNbcEDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776467790; c=relaxed/simple;
	bh=1A/TJwuFxWd+k6ydq9PlXg+2s+xDZdLBjpZDlNrDZmk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LJmuHpfrM48OAw1TzS5Z33oc0paFEEyER6/lOtceye6ZFNIfl1s59vAbInRvpmBeu0tOTdW9jr9rUp1Z8oGb0YWBLEzjA1EfpUe1Z3qtZ7jEzpgC1eXZUHfsbDpxstlK0m8OUvSIQDAvsauUhMK1vO0t92o7zIdbUsLBomQC4Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gyhnYDER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GaJAUggT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gyhnYDER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GaJAUggT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4BSL3929310
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=662gIcwEaIIKEvo6iC4Gxy
	eWYPAbQm0eUxv16uFd0gI=; b=gyhnYDER85N4wx4997fp/QNxPaUEiMwYvQUx4t
	xYOYqC4kRu7U4RkiB7Db9WKfL4F4EVo0kvS4DUceCo+6qPLlPLYiugTdESDHcf/9
	Kfwfjp1tQN2tCBic6xECk3s0WdMgBOwGM/paMYg61zTlInFGG7yn5lx8rrlsCREf
	mFYyzbyJfsJtbx0U8r07K0yg4NWQmxE+zkn6zPxKvaEquRMd/gwaj4PA764doTwh
	9eMnmlNXmcUbNXOmlnJcrjWvJa2hagUPKkcihlcLqgqXAayBxdQCHkvDJ061ZW0Z
	YeSIfZHyUseH69TNP56+5FmoxygdCqxtqewSBW3tNm+eLPgg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkqujh4u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:16:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b31cff27fso12338391cf.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 16:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776467787; x=1777072587; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=662gIcwEaIIKEvo6iC4GxyeWYPAbQm0eUxv16uFd0gI=;
        b=GaJAUggToo/r/CFZ7J121bxAFfjEGUgQ3g1Q9j5v9+DQv5spL1mpGvdWzKydDWRGtM
         9Y+Q2L+xBERVphzd7bLdHOjjS9W5+mh342Dci+u0WEBNGhq+VasLqf7vP6u0MhTTuiVB
         u7ZY9pOFx/Sgu0GNdFlt9Dl5B4xy9wgUuceg9OC+f66jqBQ4R1UnensikvBjEbctZsdY
         K9r32zgoUqRRQFF2Io1YUFMZpohbyhVbjLJRrVdlNdoQHEh94dT1nyF3W/RZghh2QJLL
         JIQHNYKLA93joVuNSaDokm/wPK6/AdK8ZQav7CBfIpZCWpARKORgFaDdA+1kKgHa2KTV
         elZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776467787; x=1777072587;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=662gIcwEaIIKEvo6iC4GxyeWYPAbQm0eUxv16uFd0gI=;
        b=XGVTQD9ua37DS8FfYDKaM7DDa/3nalq0uIi8sYSSyOtluSjkqrp9zD+Dv8WYbotFKH
         ZIeHOPuzmDGoFiX6andQ/4bqCRuOcXjJHgJpR4XsBmS4YVhOY8R5ZOx/0hJk/7DhHCSk
         VWrQbJI44j+unon7of4cjBsP58r/1WHWDlmH1lSrV0GfKeXf+YMutjwgocmWR/eO9q7b
         S3T7WYOWqvAehi6OmkXyDVuJ7HiBnsXeih4QU9aTfy05nikVs5z2YPLCtIkiH4g4QiWE
         skx0oqhOM2KIO7zbMY39Rn6MtdI+2jaT7GkXOrv7PsuTnFewggcV7GLRxAR0ciIGgSUj
         oRrw==
X-Forwarded-Encrypted: i=1; AFNElJ//IvBWVOzXfyPvCkf/6gAJROa2yxfj5zUEdVk/E30CXSbcFsB+MVGUVdyk7ITpbIZF1Ct9LjpUrL0t@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfz3karSsD1ypu002VD3TEk8MgTB5fwkdjKPXXGrNMnsO/mV7a
	jleLVe9qrgA4oRNXlJsFaLGPwbSTJn9Mzb/7mFAmmlarRh/0W7itpCx495h4cA0YW+vqfGHeyFI
	Hr1UOW3tc7PPWp0eSQZZY4+XjBIQSomfFoOiPz0JPDR6403rSeMIX++3ZDP5pu6TJ
X-Gm-Gg: AeBDietmdR4Unp+/Oaa+PfaMFvnTjfRStzZ68EGsMBfstoBkZcOoDj3zvXuxnt30tqT
	Q2XnU2WNCY3YRUhElIGpVFDdLZsBgBWf1/0RR/HDA3khvP6p8AgJ2dyE6jdZwu34aseMTCrtOFo
	oDXwG8GB1PnPUlEfd+2kaGbZlxTuspsWz7jW3KQuUgSF9lmsRxSY/B5EpH6toVpKmCCoW3nzTPT
	nDLSfsPoJH5KGI8JOBBpOGycIYiZgurollRNRdWZYiwk9mqYEef0yqntJGNLtSVl1AGAEL9mJrA
	t2JySv+jpmulFMoatRRFqzOTQfF/Iy36Hg/ocbvY9vmZG6xkwUaHimq/m0cPcXIYVUXwwaPUjtS
	rfgyJtIUQaC9X7gdf6QDRZtLzlOiGDVt1fUgm0s+zH4UrNhia2eNEzMrJAx6+sGyaejvUxAZghQ
	9XsYGHeWES/pDNyQ4u9d/d4HhqSSHatZ0aF9vcMpd/Za2OwA==
X-Received: by 2002:ac8:594c:0:b0:50d:9f02:86c7 with SMTP id d75a77b69052e-50e3682ee36mr78878311cf.13.1776467787155;
        Fri, 17 Apr 2026 16:16:27 -0700 (PDT)
X-Received: by 2002:ac8:594c:0:b0:50d:9f02:86c7 with SMTP id d75a77b69052e-50e3682ee36mr78877861cf.13.1776467786685;
        Fri, 17 Apr 2026 16:16:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad12asm815695e87.1.2026.04.17.16.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:16:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/4] drm/panel: support Waveshare DSI TOUCH kits
Date: Sat, 18 Apr 2026 02:16:19 +0300
Message-Id: <20260418-waveshare-dsi-touch-v4-0-b249f3e702bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAES/4mkC/33NQQ6CMBAF0KuYri3ptFSiK+9hXJQySI1a7UDVE
 O5uwQ0LdDPJT/683zPC4JDYbtWzgNGR87cU8vWK2cbcTshdlTKTQm5ELoA/TURqTEBekeOt72z
 DEQooDNS1zQVLn/eAtXtN6uH4zdSVZ7TtSI2NxlHrw3uajTD2/i9E4IJr3AJsS20E5HtPlD06c
 7H+es3SYeNQlDMKflAyUYW2VYnGatCbH5SaU2qZUolSBkuthJRWyQVqGIYPVRLORmUBAAA=
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2372;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1A/TJwuFxWd+k6ydq9PlXg+2s+xDZdLBjpZDlNrDZmk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4r9IfeFB5EOEVa4K1JmCLmN/GaQxsaO2+HxDi
 QnnP7pz2BmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeK/SAAKCRCLPIo+Aiko
 1bkNCACXs/uhyIZ1gbwpd/VfscDcICcbYvqj1d9Em3lRChF2v2swu6uUGWP6tYS/UUI1oYVbCpi
 xpdHJ9FhIf5B/yMkHZjkWr0Amm/5USULE1MMK6Krtp+DUj8Yb8fEMYwK+RwRO12ldXgRBOwXge4
 qEJZnHYBd79tBrX+439pC+oGjS7CI4ba0lxkpWxZITro0h2q5cLS0kq7JUp3715s26bK4UEf4NZ
 jdzjeEJI8ZRd9BAruoH7mWBbJqX5FlxrWOMIxC3nsRDhJkKv8mF882vLi7ZkfeXoE3ntV6XoRsu
 tRXwwG+zkoNlorwr5yjRVS0R9OI7/QpxYjASDhUL+ywSDVp4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMCBTYWx0ZWRfX4SOHJU9iE3gL
 ZegaxmB8APOaHJzzpp3/0zb7hFJmvkF47+I7BgPZeB6x1+/WCghn9c+Tvfft+WOL/iYmJkpXXgy
 2ipyR4Th/jyf4E17YZdWhv0NPaPN/5UoRZ/De+PMEHj1Rkw/jFCYx/rXK+X/pDGtebjuoSYRgtj
 3gukEoRSbNgVANsUBm+VrbL6ZlLoJMbRrUF6LDx4ABynnqxUWrgkfsdkiKmO31xGEZOsz+8V2aB
 aI0nboge1JPbU9l1cpDCzPdbJW36aWyD6fQxK7O5It08kbScMOh/BASR4qEdeFrV0rFKGt0E37l
 IDGBU4zN/keU4IX+r/0p8sDGGMuRu1qbUBHxv7sxLwpZJ+WToAim18jwv+ZsCVr63CE835pIrba
 qShpmB2MNINT89t70WAlpXjJ9x51CRKahjKgFm2JvH5L0JvaUELE25WeO25KKdah3EuGZ/f+WTY
 +wkgMbNFJfZ2v9Nxfbg==
X-Proofpoint-ORIG-GUID: R_hFiWBwJmDEmoZFWrWTJwuYgYMdYe33
X-Authority-Analysis: v=2.4 cv=FP0rAeos c=1 sm=1 tr=0 ts=69e2bf4b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=woyZ9DH24JpTQh7i3M0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: R_hFiWBwJmDEmoZFWrWTJwuYgYMdYe33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170230

The Waveshare DSI TOUCH family of DSI panel kits feature different DSI
video-mode panels, bundled with the separate controlling circuit,
produing necessary voltages from the 3.3V and 5V supplies. Extend panel
drivers to support those Waveshare panels and also add GPIO driver for
the onboard control circuitry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
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
Dmitry Baryshkov (4):
      dt-bindings: display/panel: ilitek,ili9881c: describe Waveshare panel
      drm/panel: ilitek-ili9881c: support Waveshare 7.0" DSI panel
      dt-bindings: gpio: describe Waveshare GPIO controller
      gpio: add GPIO controller found on Waveshare DSI TOUCH panels

 .../bindings/display/panel/ilitek,ili9881c.yaml    |   2 +
 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    | 100 ++++++++
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-waveshare-dsi.c                  | 208 +++++++++++++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 251 ++++++++++++++++++++-
 6 files changed, 570 insertions(+), 2 deletions(-)
---
base-commit: 17394e05b295e4936e0ed50d2f02ed7f08fd4f7d
change-id: 20260401-waveshare-dsi-touch-e1717a1ffc40

Best regards,
--  
With best wishes
Dmitry

