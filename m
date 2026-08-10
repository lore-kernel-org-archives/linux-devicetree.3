Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F739A04D
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362161; cv=none; b=Ca56qif+lpmOcRNnNIMXWuT5qOCwXvI1Jz11nJAAkFQpZHVMuA7iN3F/RwaAvKjNi8iNK7vS5TF8ZUYP+DfVs9tuoWV1zwZg/kvxy28d224n06yZwyXo/aWHbVXHkOVEGZRYeFoLXWtYCfUczs7aH+Ia31jfFTJdmfUAg2jG6q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362161; c=relaxed/simple;
	bh=AVCqVf9cUb6onN8q/nZVHhyRhrReTtaAp8rhIRv2URY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fp98V6BP6un9mSB6SpTgwC8kd5YEMRoDOU/OCd4H6VRQSiAdwuGl2McrfxAqfiXb8o7kNK4MIzrN3zpSCTtRfTmgrCQXe1NaD48+twedIQuDZyg6Ms08PJUX+710QiCtuTcvS6oMSbW5owSzfrNpMOKbnd6wYvQXjCbqJDSBmR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVIAb8KJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXLOCihX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVIAb8KJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXLOCihX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SPnt1486575
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kM7XsYvsbTlHzN5NeePXFj
	cCpwDy8mm+ntXcnUV6Y54=; b=WVIAb8KJTo6GT1JYwfmIOpXSqjxbHCSGvoepCv
	nBYcOA8NjZ6eUPKjZQVhTnw0vctuHMOuiducaYis0llD4JzgtbFsGsPRZRSd4Bqw
	LmzQVI2kTO4wuNiwt+W37yGJR4X8MO7Q69zOltSAsmQk3OpBJSpicnFpRlCw6VWS
	L5BFBygGx7iHccf6NS2vpQmYTvkuhcfqWQZuc8ZqjzVfT0AP9vv2PeTbl/PRnSlf
	gREO5gAG+F0BCGTMSmxHJXu7uZ4E6sYxfgho89p9COF6BTn26JgtK0oBKJx9C4qE
	sC+Uin6uKMBQzwHKAiNonRXLr60phm7xLmfCY2SDfYznsjaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xtbrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso31287541cf.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362156; x=1786966956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kM7XsYvsbTlHzN5NeePXFjcCpwDy8mm+ntXcnUV6Y54=;
        b=KXLOCihXjf9UEQQju/I2hopsAu9rCVyLCvfuLEf2Y2Bb+jA1O/DAPOlutMU/COrDl3
         m5Yb28XUUp9sItBFcQeGiLNvceZcgKWTESvi3ywzo6uo+DkrWTQHFGRNDub7Q0mWyAL+
         n5abV9HTGcn6/unAJjkELQhHon0dUC75U03FE5zCzlo6FXPE5Pj3kVm4hTH1vwsYNkcA
         b2KN4zRbhqBphVdRuNxc4FOKJo+ciCyhieeWImdMAZ5tgZdjVXGeIejK52wYyLusfLLE
         P6AIpASkHIpc377qEFuJpT4a/TDDrLc1xa3KlV4n9OhUPB9wbo7K0TFNY/jsBrwldaWp
         eIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362156; x=1786966956;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kM7XsYvsbTlHzN5NeePXFjcCpwDy8mm+ntXcnUV6Y54=;
        b=EBsMakFBN0Wz83jjAopibTyuejpTwyBnZUwi/GznGwlPIA7+TZ5woBQkKiQ/8qJbrc
         84K011nyBm2pksNeh0zuIl3QwmaYWWW+M1Ui03Q/7y29n7qeA3EGuwbLKigIhHnvGZTx
         237SPjg+8+EXz+odYaEjf2QnnSYptfLJFvXBmPyc2nisZHmR3cIvXI/rrZpEmQJP+Vga
         D8ovw0Z83/La35ZbJZMklqpOaF+RyKrmHbnZ0g8ytXti8BD8rQZiEh3DAVjOzTxEWxoT
         8m0/+2yGGueJ481I26AzIdruz6L/iAsfyo2j2zzstDA14AIrriyegVZMxyNjoFJWpthd
         9dFw==
X-Forwarded-Encrypted: i=1; AHgh+RozD2RCCIqvI0o+dsEP73X7C3/lA0/VWXL7q1KNtnqAkhqwLXE8EzUsA7eQkNdJ9K1/0v1FdRVOz9WO@vger.kernel.org
X-Gm-Message-State: AOJu0YxOiBK36H2BMxmN2GMfsj58RlXn296IfHUfXgE551J0+i2c2j3P
	auOH4BA03zrLL3yVYQbfzG2I/XTNY/eqtLPiwVY0uGZnGNsASn6HS/zBJPqIoJFFZQBE+WWamBF
	NegKLa0lJPnuWvf/Tr4WnmKbqxX43Ymm5fbn+jfG/LcOBHXb7XMdlUnnoSTqEj0VDGSabzLi1
X-Gm-Gg: AR+sD11ecIOxmDJzneKtTsxjrjgYUT2YwblGB1wZg/8Tmk86NHxByDtOEXj1hzT/BMq
	xvpoPJ1r51ztNURM91oxWQdRK46VoBLYfAGKpMujl6alQdWBjT9sXi2UDIgSZOvFMmAN70oYQrw
	m0rPuyS9AKVDUJlWH6kjnGIFd4gcAyVTl2cHv+9Pw9Xyi30qzIJrhOapLoGGBFDOKQh+wddTlSF
	4XVgssLz4o8wIX64y0Qj9Y4prI+Y/UEEjajHjeDDkchi+32mca/im+Y8EI0TgFC/CpZlfA27NOp
	AoaBX5oi6Q4Qyu8GJ9quOVgYHuqx18oz0NOXLfu+aabU5932NjZFFGEYiz5nQANABrfCnqm3EZF
	2/cHnA+pWvx/krLmxKGMxLWoakyZ0ixxj6knMUdl+pKvT87WKQUAmw9bo/vL4784F45YmM9e/Wq
	bQovSZke0AsyEJBA==
X-Received: by 2002:a05:622a:2595:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d0b00401emr342790731cf.5.1786362156088;
        Mon, 10 Aug 2026 04:42:36 -0700 (PDT)
X-Received: by 2002:a05:622a:2595:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52d0b00401emr342790291cf.5.1786362155717;
        Mon, 10 Aug 2026 04:42:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/10] ARM: qcom: enable USB3 (DWC3) controller on MSM8974
 platform
Date: Mon, 10 Aug 2026 14:42:30 +0300
Message-Id: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACa5eWoC/2WNTQ7CIBgFr0JYSwT6B1zFdAHtp2ICKNCmSdO7S
 62JC5eTvDez4gTRQsIKrTjCbJMNvgA7ITzctb8BsWNhzClvqWCUuOSE7GoyJVMR0UhWyUZIZiQ
 ul2eEq10+ukt/cJrMA4a8O76LCK+pdPIx+2UU+osEb4KO4x4jUoxcVm3d8I6qme0yoxOQIThns
 0Ielnx2OmWIuN+2NyRV00HaAAAA
X-Change-ID: 20260810-msm8974-usb3-8591395891b9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2235;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AVCqVf9cUb6onN8q/nZVHhyRhrReTtaAp8rhIRv2URY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1blTg0hyZevNVjmZTFv2vxQmp3Zh6GrXizzIv8Glk2x1
 6R1TX91MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAizzLY/7v/ujk1tt1CK93s
 +g2B+cLs9WeTvAo7Tz9qjFzimj1BWNJ4lfhNaXUmvzuznm9S+ZLbz76wxu+GZ52TkBXf23we5kC
 Hi2++BHw4+9fnT6D9QqUGszt3pzRviDpn+GKCnG3DFZPAIEPhI4aKfMFvMnaLnC6odXj45cfG3X
 6Mjw9Ki/mw3O05JixR7bE6y8a9ziGneLnhe+P0Jw8FF25QULr0VIaB8f4Vz89c7h9YMm9PbOH/u
 StSh2Wpe/m8p15aXXIPGK+WrzWIKaifve6uycfDeuW3uR//Oux0OcxkQ6jcym03fM1rKpf8eRg0
 I7Pjn2CMEuvOuadU366LX/dFsDNrQU/F26LsjsUSLDMCAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX8a1BjOLZoVBi
 6W/Mg3QFRxSdUrJR+0LXta5ZdtxCL9XgoCJ3JO3Beoe2+YfFnHa4kAcRxAyLuMGuKBGfzRnkcfb
 mMUoiuUz01kbKsl4xVvblj33QBnCiCU=
X-Proofpoint-ORIG-GUID: 94rIOC6fXs9R8ZDxRfiPzpepCrMAz1JI
X-Proofpoint-GUID: 94rIOC6fXs9R8ZDxRfiPzpepCrMAz1JI
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79b92d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iQ4cL05PARBYzk5mw1IA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX8Dxeyw65ZD7M
 lvCT4n/OrYeuGRZA4CyDGr3om7Djb6Dj90nbd1Yvd1dfh5gXfwPstzbulgTgOenyiwZxeiY76Z4
 PLw9RF9agdLynCz1dkV15pyoEcILvTVg/+FBY7hH7l19KArWPmIg4Fhs6NmKK1/XZty2ZFJdYPz
 sVI4BDn9OvzVGkk6yihgf6PaT7pP6wmZUl1t+zlJ1hzODum0H816X9e9DrOu/v/Gd6Skg2Temy2
 x9xpGqfenFo3tk8ExVsAAqKytB2YIkx0OYGDHQAag4ZcRflT36v4jLtftA5V5ajXhJFYcNZLfVw
 NJO2GI0/YurQNbybvy97fUIvHEo4xZDAqQGjUP6DmT5n4txybBknt3JLIKT3bIQiGbNWZJANAIO
 2T4BuM7PHD0AdEFTV2GSPzAPyJg8Z+8/A51dwgvQiug6IqciHxaAQPnvEFgndt4kYe24jbR/wx+
 pyPe5C/N8bRrajebf1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

MSM8974 platform uses three different USB hosts: SS DWC3 and two HS
ChipIdea (normal and HSIC). Enhance qcom-ipq806x-usb driver to support
HS and SS PHYs used for the DWC3 controller and enable USB 3.0 host on
the MSM8974 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (10):
      dt-bindings: usb: qcom,snps-dwc3: document the MSM8974 controller
      dt-bindings: phy: qcom,ipq806x-usb-phy-hs: document the MSM8974 HS PHY
      dt-bindings: phy: qcom,ipq806x-usb-phy-ss: add MSM8974 SS PHY
      phy: qcom-ipq806x-usb: add MSM8974 HS PHY support
      phy: qcom-ipq806x-usb: fix the SS PHY TEST_POWERDOWN bit
      phy: qcom-ipq806x-usb: fix the PHY_PARAM_CTRL1 field masks
      phy: qcom-ipq806x-usb: parse the tx-deamp-3_5db property as documented
      phy: qcom-ipq806x-usb: support the MSM8974 SS PHY parameters
      ARM: dts: qcom: msm8974: add the USB3 controller and its PHYs
      ARM: dts: qcom: apq8074-dragonboard: enable the USB3 host

 .../bindings/phy/qcom,ipq806x-usb-phy-hs.yaml      |   6 +-
 .../bindings/phy/qcom,ipq806x-usb-phy-ss.yaml      |   4 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  19 ++++
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts |  61 ++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  47 +++++++++
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c        | 107 +++++++++++++++++----
 6 files changed, 221 insertions(+), 23 deletions(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260810-msm8974-usb3-8591395891b9
prerequisite-change-id: 20260810-msm8974-onboard-usb-98d293645270:v1
prerequisite-patch-id: c26539fbb2d694a92439cb1e726212918553475c
prerequisite-patch-id: 4ad3db6c6ac190b38705ed8876802392c8d7d339
prerequisite-patch-id: 3478affb2dfff9e7ab10d3021889e8b18457533f
prerequisite-patch-id: b646868cd0435307c98f9f5befcc6b19f21ec0d7
prerequisite-patch-id: b98cf68875fdf3b81fdc383e1b69a3fcc35bf986
prerequisite-patch-id: 4af06591492ba21e53d415f18de59488bfc3c2d4
prerequisite-patch-id: 5177cabe40273cd97110295567ff2cccbaad02df
prerequisite-patch-id: 1d2ed9fb3f5d99c6ea828eb5aec1412f4b46467a

Best regards,
--  
With best wishes
Dmitry

