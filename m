Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C6643BDA3
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053575; cv=none; b=PzpyJA1vCtHRWBvptfmumYPxaYqHMY42CdoBwgoDuXjHq0MW+ugiiECfg1jq9Ewt1axZk6aaH7XKEIALoXcni52JhCsi9AYvjKE7P0gsVbEpuPWnGT9uOyG+Dg8NOaZYsZt3Woen1e2scKmOqXictqPJt8Ec1gdErF+N79QH7VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053575; c=relaxed/simple;
	bh=cUEtfwQBEjXbHcPZpAOE6asYzQd+8XLLUM/ii4eK1g0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CnqQYCdb3uIIjM4LDLqUD/cq9oLhhcITgShgTKyx9Skk33GcmROuSUAGc25K9RYHVYZWmQ2AcOvQsN0EhGjgcnmfaJQQry93cV3QtP3LBl9EVnFGoHSGzIGnFFBdrSj4naKYr8x3bMgrO1pWMBrZ/15GF6DZ5pxvWnitlqdYtvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gyQ1aYgq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gygTnm5S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gyQ1aYgq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gygTnm5S"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F75VKn1672414
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6Q6tXAlLgKwWbpNrJrxKLX
	H3X06JfKu+TnwxFCItEVg=; b=gyQ1aYgqQMLYBXI4000PtLvMurwL5ZdAfZzJiY
	zZX2yxkphThiiKghL84pVEc4CKAbMMJvmCmzI806fXnYgFG4SvU22gSxXg6+zQW2
	JH3ji2dR5SqFqyhMkLo3tKSdNIJWNHQAgjiuRMM1UvCWqy3vZgeI6uZMKoYFw0Tk
	zkBhgmF5b7XKT2NLDoqEGIrzIL3sNZnK9ccDlBg4gCK7sZlg8Z2qhG3YJPxhsoZm
	z7i8R7MSkJDgSwz0dfkWyZSSUkh0r6Qzdn9Gq/R9Imyko7lxkKTBWvfhBG7mmETH
	akTu4svbyC3IWxNbCJ9dYHc13ivb+sqDqi1Vra4s+SD58LHg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhbeac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:39:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a109c937so16533456d6.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792053572; x=1792658372; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Q6tXAlLgKwWbpNrJrxKLXH3X06JfKu+TnwxFCItEVg=;
        b=gygTnm5SwsiELNaUA00VH7ZwGhz5acPgh3q0ZUK0QrvkQxYDAJsbkqHvOOEiOK+fE0
         0e0o0GwLfmECAkcd821WJHl91P+4nxfQS/rrlSV7a9mvI11CjHYcd8o6dsfe95l+J9oS
         cUD7fPVtjYkmh7pG1Fklz+3uFvrvaoAcm7gZ1m8vETFpJXNcIP+fUQMlfBY9xtVASXYw
         blVU/UFhgV7Wu8S+qpNbL707Xeb+9bDTS6W7ShmTTGv6EA01DmoA6ujnL5WY5MoU4YU7
         efz0tkoDnup9BaOUtXRcnfH9sDmhqa2UDKTmDXvfXy2/nu6s8i/D0+VFG9YsiEF3q95T
         4SYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053572; x=1792658372;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Q6tXAlLgKwWbpNrJrxKLXH3X06JfKu+TnwxFCItEVg=;
        b=WyKckLyzydNP1SUKtuoXIwE49W3jTb3J6mMMu2zDdIqK93KztscVcf1BkQiLVNgkwU
         HN7fiCvvoFvT7vjDGuW2wHWtUTrZhraGEwQhyVMdSTBxQ+j1SuB/ClUhmex83NWBHUo3
         bxOQGHMtSjVer1Bqq6ip3Wvz7pzPJXKZH7uwSc7XVBNGbGGm2w/8VhngLdvkH5+j1HgF
         GNYY33uoglINojZTfRnomauvoXoHQ1bjStbpGs45KZuTEyRXnbdnnaxNFGexGQWen23x
         oqvAqiLsnfhFguPQeh26eNAnCAYLnwmQnRpmaKg3dqXBnUjAHUIQ6EuvcRkqPmPL/zoS
         vnrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEI4MCjOoaoAg8GA5qZHrcEcW09oyTfuGJcsiFB0TDpvXlqEsvSPpl9GgYNCLTswn2adbWVfDHVBM6@vger.kernel.org
X-Gm-Message-State: AFq9FYIZSvXhghYS3ijota5WqwZSHDoo+xLbn+nnIMFkHCcVywxWJFau
	Fl8mefjNFb6mB/rJT442dzn1q6ypZXxZ9/kDyqFocitJ29jVtVzpVobAQZ51LCA8pYkj/74pM4a
	K4COvVrvPxZo0XKTwGshi95sjbk8M1TwXENgFdyStYtjxCS3rN5OyOh1Qj7d/6DZtnMzbdOWc
X-Gm-Gg: AYBFou2XkeN7EFzTwRtuY7Tqgci+Hrx6aRu1m1cEF5DsPwLIh2KM1RxBqI6YMoGplnn
	QcTNXnJeIkOGe2MJazPojiAo+Y8YtBYAKxe9u+EluP70VSJZ+OKeKy+vccv1UZ9PiSqMchd8wFB
	DnydYnfjtyEHb8pJib1Q89l1eCbAkznKIm/bNm2MeLS67o/5x4N6kai9otVSDmLHm6s3a0HMJni
	X0fekSixMUORSQ9ihPkyFlasccXZWtlDYVv56ZwAaXt3L2YQsXrqt/ZSllcgYqEvLeeKQUMJAMs
	8n6xoXmjHghulNQgxXQhT4fL7t4bWnEVGKCusEmi5xTtWyV+cKGMjIyi+kid8/WALYb0Ez/Wb90
	gYJB2BJnWLL5L3Tr8vOjyGXeFOw+Ciaz4GkNXciyQoZecxDn2H/AmzjzX+BRp9xxmBgEL12AB+g
	6eWRdvXnav21BQ
X-Received: by 2002:a05:620a:46aa:b0:93e:b729:879e with SMTP id af79cd13be357-93ebd211b26mr3271331385a.23.1792053572009;
        Thu, 15 Oct 2026 01:39:32 -0700 (PDT)
X-Received: by 2002:a05:620a:46aa:b0:93e:b729:879e with SMTP id af79cd13be357-93ebd211b26mr3271329285a.23.1792053571408;
        Thu, 15 Oct 2026 01:39:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d702a5sm1175500e87.15.2026.10.15.01.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:39:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/5] arm64: dts: qcom: support SDM845 HDK
Date: Thu, 15 Oct 2026 11:39:07 +0300
Message-Id: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuR0GoC/3XOzQqCQBDA8VeJPbeyM66jduo9ooPuRy6llltSi
 O/eahAKdRn4D8yPGZg3nTOe7TYD60zvvGubEHK7YaoqmpPhTodmKJAEIHKv60wmvNJnnkuiJBZ
 KIqUsHFw7Y91zxg7H0JXz97Z7zXYP0/bDIKRLpgcueEZkIafEGpvuW++j26O4qLauozDYpPX4F
 UCAXAkYBNKilKVEG775I8RLIVkJcRBAQZorLTSQ/SGM4/gG0WdZQi8BAAA=
X-Change-ID: 20260122-sdm845-hdk-9466530c4267
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3240;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cUEtfwQBEjXbHcPZpAOE6asYzQd+8XLLUM/ii4eK1g0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JEviP9RdeTirXBNA2pdyhEOltu2yhemYxfHV
 L6uBxMfk3iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCRLwAKCRCLPIo+Aiko
 1fu/CACI2/FqRSfQEHGxwfJmpINESPG40bjGiqCq6KnndpmBRewrkpuTbTnM7HVTTd/lJ9j3cHR
 iYmH48sDDRl9HXcamw2wZ4z5romg5oef5uhnjZJBGSPyKGQT5cc2CMyhjy2sBj8GWaAVjDceTV/
 H03eC4geCCIe1FgJ8tZBHUb7dY1pRGjJnjtZPv71CTMYICUhrhOKunuN5mgB5gYH4N8t72NdhZy
 Fly4YkJXyTI7AnoOdLE8HeYNDlwbQX10lTESSHyruDb92VAU+McC/W9h/KSdpBar2fxzi4r40Cm
 Duj3LA0OMUnVF0jerGvPDlVZqveyjIuJYZaOyRhK3XgZseXt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: KATiqLPNKhjtfnArWv3B6Q35x3IVtmh7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX/MxMegFcSlx+
 u9JkVhVXoPmGz+/a+513qkmWVhygRRA/7OfGvwglCyU+Zw8HixJa7TAfmnOWI1SzFeQRa+df05n
 B3IlDPBqNImw9KBI+T45/qM5XsdKoSY=
X-Proofpoint-GUID: KATiqLPNKhjtfnArWv3B6Q35x3IVtmh7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfXwhriX5bUsi3D
 ftueEqK9w7ugZaheerkUIEOtYu0Q+6OjaX0Pe9SDY6UWoBIik3rH4uZNtuhxMI/+vfWjkHQnQ0L
 w2n8fLAI2C/aP54WgHH5yBnu2wyOhiU1A7alx3WxOnGD/kkvifG5ddtHIjCBMtwT4ToOayw8Meo
 j9e1Urbgc49mRgwIuthceVAm7RE9Itmdk/DdvE1rTfE/2vs6gMQ0avOK2DN+1te7gU7aqUzvNTs
 TPCeLSsCM6/DhpUwGrfQbtB3hDvAH9L9d1M/EF/BgsumnRPjD827PmJ+t7o8PksFQxcVv+mljIZ
 zGyMSsKva1JQDa1ASYO7GdXlrh+DjUr2coES+Yw5J4RowWFdY23cPN3OjyO6Xa/y8GIFRJvHkT5
 AiCCG7SRxXt1p6C7iup/p76IfhAmx50MFeq1njFoxQVBb2o815oZV1OxeGdFPHOOszKF0oMYNsx
 V0nlIu3AZi24brMJpvg==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad09145 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=WDvwZioAV1Qa1_QZ0V8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150034

Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
version of the chip (SDA845) and provides a rich set of the peripherals
and connectors. The DSI panel is an optional addon, so it is being split
to a separate overlay. To (hopefully) ease merging, the overlay is split
to a separate patch as it depends on the panel. The base DT doesn't have
external dependencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Dropped backlight from the panel (Sashiko)
- Corrected GPIO used for the Home key (Sashiko)
- Corrected USB PHY supply mapping (Sashiko)
- Dropped backlight pointer in the panel driver (Sashiko)
- made driver more robust for a single-host DSI (Sashiko)
- Added comment regarding USB OTG
- Link to v3: https://patch.msgid.link/20261015-sdm845-hdk-v3-0-1c179cd0d16f@oss.qualcomm.com

Changes in v3:
- Dropped mipi_dsi_device_info from panel_desc (Sashiko)
- Added comment to SYS_BOB (Sashiko)
- Corrected commit message for the display card, dropping mention of
  mode select line (Sashiko)
- Link to v2: https://patch.msgid.link/20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com

Changes in v2:
- Dropped MDSS reset patch (Konrad)
- Added panel driver and the display card overlay.
- Link to v1: https://lore.kernel.org/r/20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Dmitry Baryshkov (5):
      dt-bindings: display: panel: add Truly NT36850 WQHD panel
      drm/panel: add Novatek NT36850 panel driver
      dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
      arm64: dts: qcom: add device tree for SDM845-HDK
      arm64: dts: qcom: sdm845-hdk: add display card overlay

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../display/panel/truly,wqhd60-nt36850.yaml        |  98 +++
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/sdm845-hdk-display-card.dtso     | 109 +++
 arch/arm64/boot/dts/qcom/sdm845-hdk.dts            | 825 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36850.c      | 351 +++++++++
 8 files changed, 1400 insertions(+)
---
base-commit: a7d52d51b31a58da686320f5e4edac74e2dad682
change-id: 20260122-sdm845-hdk-9466530c4267

Best regards,
--  
With best wishes
Dmitry

