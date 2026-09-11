Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CBE415B9D
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141026; cv=none; b=UTNsgmIMtl+ksP564uhrkZ5GibCQZwADgtgHv5kt5OFnqpcJTcnIkJCvkFQ9foOWYXBUF+kg1AD1KH1gGTAcxCdgynT2jvcvWzmER2Pyn4HchwaUG6277MkKBnzaAFhl2ouDqcY5TK7hWqxkd2vpVsMTlDU9mfPfZtQfE5ZqPoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141026; c=relaxed/simple;
	bh=uZtos5GcxW16bUgCP04imDNSXk4Y2sw1hsgfG8ryyeU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bPrZhvQi7Ghyhz6rSo91lHU67gqhf0OSFSir+vApz+hMWtMq0DvwdmeLh05gWd+YfvbyRE9a0iQYxpuNx1GVWNotIE3EbSgAHLwx4o/RRqZ9dNQXRj+tkyQTXzOpTPM9nOmEqWI48lXo3gYEfBBIf+gFQHRw0+HLThM19JNdZN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=es1DConp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HuyghwDq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="es1DConp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HuyghwDq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmDpG3251970
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NoklEjEHefOp4rYdjJllOB
	/b4jWlzIWDGBqgFGK4+ls=; b=es1DConpLm07rfbb5R8DWZa0t7NaoJSlylMZOn
	SkS4sG7SJ2vz+Wam55KL+G+rgxIbnJc6Ep1blSkhhR3CiFF4Hy7BglscniJ3GgMP
	zN+OG53cUjaZOknP10+Q0apmJKe8mNwHvj4KvorISy/D42OgKwudg5YKhjlQPKTj
	D2faayLi5hDSFzhpq9SSdbpJx86EVAo2LJ0iQg1oJk3nBmbvu6p2aFSaWwR4BlK0
	JTXKort3qx2hVZ7NIAE4X8DojI7YmQ6vG7pbuRU6RhTFVJIQFVdUMJkAi53C5M3G
	6/oDNfKL28EwPi7Egap/M92LcVWtal9Nw0uJaZBGwsTJizDQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7ucka42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:03 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-448d51840c4so908103fac.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141023; x=1789745823; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NoklEjEHefOp4rYdjJllOB/b4jWlzIWDGBqgFGK4+ls=;
        b=HuyghwDqSE4nctG3dhN2hUcD06c5BzXYj/yIzh3ruHFz4yQfOOYHv9EhL82DS8Xos3
         b1FXVDm0t4T4zwFdtg+mK3Nd0ON9cR1V8dZxYk6M8KC3cNRmlbPLjNdPukauKv68V45S
         ATWLnOViEUa3jZs52H1RqaVHgOS8EoAvwfN+TOQ3klFpOjhQf+6mM0G6gSasuvk0yjfX
         /9xJn+8zR4oV5zQBc2Ec1+tTWRm02dFFUw2py9rIb1OBGRhoxevZ9rQNdctXb3FdXiwa
         JtRFwArRan1xbpOk9CRS6uy2TUHj16uy3Z0w3GzBKlCJZ8Wj2meoeaSN0ldHvX6vmzeE
         aU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141023; x=1789745823;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NoklEjEHefOp4rYdjJllOB/b4jWlzIWDGBqgFGK4+ls=;
        b=Qu7t0+MDFx6hYsPW2v/OgSTwX/bFa91/6/m0YUA2pWUP0CvHd+3NgJPdvK05xUiUiE
         ZqPoz6nssWnpGExbC6cfWFdn7/RK0+e7vOdEddffzP3yUyemGmEczYj3Rt1hX9d+Zho5
         Q83afaFh/EiTRqtddPIlRAKkRWK7IClXmldWj0RMdeY+Y4C3cDc7qwc0QqS19/zEyopo
         tSurVxsvaPYyX6D/EcmqKEqG7be76PnbVTVn4M9mrsAamopFOWv9oly/aHPF8wOqVtnZ
         EkLYomm27lrNY0YUaN13E1Ep4g/gqerQjzfb/4nWqAKxfgZiIH4rarsXVBDVNUV8KlS7
         n2tg==
X-Forwarded-Encrypted: i=1; AKwUvBxt0uu8jI8WovLutOHClu34d20S1w8zyxj9UC7s31+lGhzP/YKqhIB+o7Z/Gg/Z/jfqtQT06PlPaYSG@vger.kernel.org
X-Gm-Message-State: AFuF++l459vj4znrRCtjhBFFD/MlPyFMFUtM+R3D305w4HGi39Qd4s7i
	DUIdOS7vKr/dp14JTyBvbVcg+ytMiEjVRYix4YpToicrjTXbouD6yoG9eVC6gIsyJD5DfegK60l
	pgipH+n+OV8/YYdxsssIIdTUUHS/9bD53zXh60ofgoSoB3XI87cutEkUgdCpC9H3z
X-Gm-Gg: AYBFou0347WpRE1w4qJefbS37NpALYYVIi27YeBiNZZcyI6nFXp42dtpOq1Ph+Nf4m7
	NYZ2ka3K2+jsfUxe8uFgvW308H9lT0CVfSyQTRwG4wyIZTmXbvbCrNpDXwRcQn0a5GBVuLG33DC
	Q+tC8OAxcKS3HloKI0XPlBiD4Uuv0BlQ6G48J/zABDhq0S5tvpzSpsSEAu/cDwvFQp7tnvgSPHp
	K0AQo8TbLDZxM/fRjNkTG6rCKJqQN7YzfutawO8jIeRDRg11qKXUi5JdAJPppj4YozHL3SSKBd9
	YHpT5JF3/bYYD7C8uIUgGr1qxrCe6wGz89b1qVwoG0w/pWB6qGz0EQMiHWaMcjTl4SMIOQNfxEe
	bljwkMk0sVcX0f5owADRZtamyIG4=
X-Received: by 2002:a05:6871:828a:b0:475:e0a7:9f2c with SMTP id 586e51a60fabf-47de95f77bemr3653767fac.26.1789141022753;
        Fri, 11 Sep 2026 08:37:02 -0700 (PDT)
X-Received: by 2002:a05:6871:828a:b0:475:e0a7:9f2c with SMTP id 586e51a60fabf-47de95f77bemr3653743fac.26.1789141022347;
        Fri, 11 Sep 2026 08:37:02 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:37:01 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH 00/17] Add Qualcomm Nord display and eDP PHY support
Date: Fri, 11 Sep 2026 21:06:31 +0530
Message-Id: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP8fpGoC/yXMQQqEMAxA0auUrCfQVlA6VxlmoSZqXNQh7Ygg3
 t2qy7f4f4fEKpzgbXZQXiXJEgvcy0A/tXFkFCoGb31tg3MYFyUkXZEykg2dd0PVtBygFD/lQbb
 79vk+Tv9u5j5fCziOE7EmhCBvAAAA
X-Change-ID: 20260911-nord-drv-dt-d09b21f37ae9
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=2969;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=uZtos5GcxW16bUgCP04imDNSXk4Y2sw1hsgfG8ryyeU=;
 b=fvlgQemdYfvMPG2C2gg7mIz0dTtNx1itQVQos4yxGflmCrffKnuOPCQ1TeWCAjmupxkjNdcad
 MglmLqvQIJMBgE50me0cbTbNltdvQKecJlrQVeJODZH2ZN/I8/pxFlv
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa4201f cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PFInfxxGytTXtyWs1EMA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX+bZ/zFl3tPnF
 oIszmYqil8LG98t4SlDG13idVjyDC4PGbiGaWRc12BpLnUSA99C/BdDhr8mfoJ2tkEEByXfFFAT
 ZDhTb4amP01sJ6+x94Bj+94WriZkbawLYAZzAzSUGigP7VVepRFfbhq9tDwev0vBBqNCvNPnB+v
 c0LgKKkCWdiNdpA2VnqmCU4Jf+pEu08Qn2qswnRGBnnDEvYy+3cUxoDVpBeE8up/peKVIVA77wh
 Amz3p5EWGMOrfobQI0hTgam45OZy1WoxL1syZOPD2YyEsbR7U3nYXVXRC9rgIFbJNWouKWnLRR+
 2c05NpVoj2dMDcZpAE8Mgvarg0tIc1r+J74iXtEFLaoRuD6MeVfdsGp7Wu4Lnky05M6yFgZnyD+
 wHqPdgX+cmEgtfNz8st2UTnT4bemk/dpoANMXtREVH2rAFsYK2sD0mcWZNkv8AqXl8JwUfnTdBb
 ozZn+Aor109hsTSFU5g==
X-Proofpoint-GUID: -cDvOWUBlYGBOQOs2_seq2XxKR5HSZQ5
X-Proofpoint-ORIG-GUID: -cDvOWUBlYGBOQOs2_seq2XxKR5HSZQ5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX4yWt50daUTIE
 KJtSmYwJx3mAESRinKrpi21VvLxUw9R1v/oDKyqcMmQhA6x23l7YkSc/k0d/ojgwcj73Mst9Igs
 XcpccvFTV7SIxHkl2/IZ8KfH9v0R6c4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

Nord is a Qualcomm SoC with a DP-only display subsystem
(MDSS 12.1 / DPU 1499A) and two independent DP controllers
backed by eDP PHY.  The PHY uses a different register layout,
PLL/SSC coefficients and TX signal parameters compared to
all existing SoCs supported by the qcom-edp driver.

This series enables the display pipeline on Nord by adding
DT bindings for the MDSS, DP controller and eDP PHY, DPU
catalog and driver entries for MDSS and DP, and full eDP
PHY support.

Tested on Nord Ride SX board with one DPU. Both MDSS and
DP controllers probe cleanly and panels render correctly.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Mahadevan P (6):
      dt-bindings: phy: qcom,edp-phy: Document Nord eDP PHY
      dt-bindings: display/msm: dp-controller: Document Nord DP
      dt-bindings: display/msm: Document Nord MDSS
      drm/msm/dpu: Add support for DPU 12.1 on Nord
      drm/msm: mdss: Add support for MDSS on Nord
      drm/msm/dp: Add support for DP controllers on Nord

Ritesh Kumar (11):
      phy: qcom: edp: Add Nord-specific register offsets
      phy: qcom: edp: Generalize power-on path to support per-SoC overrides
      phy: qcom: edp: Add Nord AUX channel and VCO divider configuration tables
      phy: qcom: edp: Add Nord voltage-swing and pre-emphasis tables
      phy: qcom: edp: Add Nord PHY power-on and reset state-machine callbacks
      phy: qcom: edp: Add Nord bias and clock buffer enable callback
      phy: qcom: edp: Add Nord spread-spectrum clocking configuration callback
      phy: qcom: edp: Add Nord PLL configuration callback
      phy: qcom: edp: Add Nord LDO, TX lane and TX resistor calibration callbacks
      phy: qcom: edp: Introduce Nord phy_ver_ops and phy_cfg descriptor
      phy: qcom: edp: Register qcom,nord-dp-phy OF compatible string

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/qcom,nord-mdss.yaml       |  98 ++++
 .../devicetree/bindings/phy/qcom,edp-phy.yaml      |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_1_nord.h  | 588 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |   7 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/phy/qualcomm/phy-qcom-edp.c                | 416 ++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h  |   3 +
 12 files changed, 1107 insertions(+), 13 deletions(-)
---
base-commit: 693de981a44b0e7e3b6a73f0b0bcbae9c8d068e6
change-id: 20260911-nord-drv-dt-d09b21f37ae9

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

