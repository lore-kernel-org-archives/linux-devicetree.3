Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0FE40B6F4
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821054; cv=none; b=KOYoWDb/1ELW7jKe/ey+AwOepLHr/lhhejFYiKE41jUR4io0LFkjq1HBnoC2jU58C6ZVGdo5MMXBvRn3WVOctt0rdIsmTq9JU4yROjw/9EAzz8SZsrSUSOGcmqY4WfpuY7zCrcZVmlkC8rEnXx9kCyzQAgLFokexBWfmKNiWgrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821054; c=relaxed/simple;
	bh=m9wxtDMZwdDXxuS8fkMy1CcuHIeHi+XXMXrjt+8e1Vs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HpQgZ6tCS+wwUDF9rcZlpaW9d/MBNIkSsGUvBe2sTQV/tHhQ+H2FU6UMAIjevSvADY4pKeOvd57FRoiNOEL3n+Xw+wsn9MIeLmrDbGvOXWXA5aLWRhe+bhaxZGeU3jP5Z0ejx4mQuUpknKj67PNZMFPiz5bEzRHl/6dj/IUnCM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPUpIaqm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5f8bv/P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPUpIaqm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5f8bv/P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH18M13086572
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5FejAGL4pNOnrqngeFle1ZA/WbYFf5I2uXT
	jAH4zNhY=; b=cPUpIaqmJQAbB68fG/JKpOcKxIdFKDOOh05njiRyblFpG7H89jq
	r27aiW5/t3MJ4drypijutHKmZkSdgkhBaeqHnHmmQLQXWuBVpViM9oTVzelJU99C
	JPPSjL+b+jAa5SIGAbDMJWilECd3T9RVDBG8N6U3hWCdDoR/jDHRhSIjpJelO8sr
	JUuMDJM/NId75z8qZMKAJjQvfZdQ9LnZZ0CpO3Ax1p3t8DSi3gUmNqud0l6FLLBU
	+3xrGD+I9v8wE0inVHVziObF6sowj7TedhtOWmL8PosGy8arv2zvXL+4GD0CpLke
	SlGvHC0jqoeTCj/kg+3Ecb7ZOph7tAiLYig==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edeff0t6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365df4b21feso2927594a91.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779821052; x=1780425852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5FejAGL4pNOnrqngeFle1ZA/WbYFf5I2uXTjAH4zNhY=;
        b=J5f8bv/P/1U8RfIQMzSGKjtdp3nWNhgfE7he2pV/1H5Yp/CfvMwHfbJtxO/UWXSZGM
         a3H5z/lU2MtRiOqko2QoQTbzmR7NAeM6SpCbimH7PqBRLVq1fQAkGak6lE6GXno4157E
         AY1B64STH6rnxTOeue7r20CitFkVdGGDHupp/exhy8xnVcTWdaP/vA/O5eO4MrzDkxA1
         ikn7ogbOiexxpSP5JDYvDvG/pJqxq+sNcME92C/8xeKP9oLwUxdo7/hn5MkB29thoaL1
         I2rfLOTUkzknmers94FpV/ArW0JjSXJdN02wrGM3FRkvuPvU73mIu1EoguKA1xTuPwtE
         gj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821052; x=1780425852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FejAGL4pNOnrqngeFle1ZA/WbYFf5I2uXTjAH4zNhY=;
        b=eDG3qqAClkQJPr1ux9axXvTSMG/zdGgP/bYXR/woLXb5jkuyqH4IZiqwNj+rFcWt+C
         A7hM+dbp/xVQyzCrFJYvM8sqweonFX7FCTwZun70uEKiNXm5FJXtANupMxytNk5pVvoj
         kW7exip+6AGrKQp3TH4jQCXri4LhQn707Q9gmnnx96YSbiLS/Co8GmaBdp7ROUlBANdP
         y+sCZT6P3pUnp9IRPyZmWG39X4nZufrZLV2Qn5lRekVKLipgkziS1v/AJWh5qhISWUoH
         HEap5gi1SM89N89ugDDsVTjydLv+3Buz2nd2sI+hEo40SMO3sMcyMkn4/GB3CzrWH6rw
         YybQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hkgpvpKI2zh3dPYYYhbh9vvyRyYJh5A8QWNOSW+HIfJ3eEK9HQQduU4m1tOgOI98GtwLpwNIi5E6m@vger.kernel.org
X-Gm-Message-State: AOJu0YxkHytmjUj0PTd3ppJ74WsNU+1WknF7T8pNHYQVSbywmSZ0+pSC
	nFCkHyvwtkbdHCVjdNLlJi5o9Wd9J15cjBFtunlylpXh/as6SCWhZJc+jOeD3pkW/nyD4nvhCqo
	LUuf7+KpPr66VM/W7i9VWTNZ1cYDVpNqyswGlJFlIA/jq/Hz2/mdv+TUKylwLkMw=
X-Gm-Gg: Acq92OHB5Wqc0prMGYQscfFIycU9taylUeTITOX82iSxIJoA189d7r1tSc7DRChA8Zj
	osaUhk2Pyebsl+FzDR1jZi6ggYLT3gpi50hd3GLcFxX1RMOLxbYMnGrszuJEgtApoUOhbmvj6TG
	j1rqHcYzZYi6lCANl8FNI6OuqJfkxK6PxkPgOaIpFAKdrpB73qbfBLorC1R4URBndIHOY01wJTV
	DwUggUNTSlaqyChl0CvkGJQoG05o4pXbOT2FRj7i5IwETIAKGta1drxxi6h++rzSGYi4MMhtSJb
	pvR8QRivOSybEHXxs/rpnpUYVvOlHi710NiqruqXzTjJzrkJE3dejinKniZbKRuiEc48aLGXWSu
	AN6FXAKzl75dSG8w1a8w2Bx0/2fMbPvScD0vRmsrR6CEumv/k8T1T+v+3GSCN2X2x
X-Received: by 2002:a17:90b:2c87:b0:367:d436:81e8 with SMTP id 98e67ed59e1d1-36a6787ee39mr10816322a91.6.1779821051925;
        Tue, 26 May 2026 11:44:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2c87:b0:367:d436:81e8 with SMTP id 98e67ed59e1d1-36a6787ee39mr10816295a91.6.1779821051446;
        Tue, 26 May 2026 11:44:11 -0700 (PDT)
Received: from hu-ppratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm16866628a91.9.2026.05.26.11.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:44:11 -0700 (PDT)
From: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add USB Phy driver and binding changes for Qualcomm Shikra SoC
Date: Wed, 27 May 2026 00:13:57 +0530
Message-Id: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a15e9fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lodECODDCjcd_M0iS_IA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: VWLhcKWpmbC-Ml006vTOCOYGvpZvylG7
X-Proofpoint-GUID: VWLhcKWpmbC-Ml006vTOCOYGvpZvylG7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2NCBTYWx0ZWRfX+RfIgFL73lZI
 dK4RHMz+23ZWYe4dg9dHGK5+czcJJoti1pmNJ1LxVkzniLFOtbT0mmGQZRWcwjhx4LJ32dp8q1Q
 0X4TJ5lDfZbwJ2LkRMFQzwFJyAPyh2NBjg4SwmUokze/ZQhKzx+l54CKL+FpS+UHAukNYthVHDg
 as65Hs8tVp6qtWjr4iDYEHQh6us5VStLr4o6kDF98JPwVFdinswcQ1+sFt9ozmw5IMlFkNOwf/f
 DJ9k+20T7fOYeruEMmaScjsbCFwbt6QlruSf7q+7JAugzbgFgqpTqyJAugY0Qu1okCMYU1z9rxB
 q7yIoIRE6fllAzBU4+SSKmFWQsf37GY/37so9BMUC2hkaYh/2LedJma0K+5vkuCl4SokaSyskvT
 /GJIRd1+b+Ljvtx6ks3mFCCA4Px3L3hVicgBDYXevYPRkuOl4g/ds2wqJwQ2wUvUYbYicxgr+9+
 vcLFwbsFDe8+yOlxjUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260164

This series adds Driver and binding changes for USB Phys on Shikra.
There are two USB controllers - One of them is SS capable and other is
highspeed only capable.
 
Changes in v3:
- Moved to using qcs615-usb3-dp-phy since the DP Phy is present although
not operational.
- Using Talos as a fallback for shikra in qmp driver
- Add required "phy" reset in qmp usbc driver since its needed on Shikra
      
Link to v2:
https://lore.kernel.org/all/20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com/
       
Changes in v2:
- Separated the usb controller binding changes
- Updated commit texts.
        
Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com/

Krishna Kurapati (4):
  dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
  dt-bindings: phy: qcom,qcs615-qmp-usb3-dp-phy: Add support for Shikra
  phy: qcom-qusb2: Add support for Shikra
  phy: qcom: qmp-usbc: Add support for "phy" reset used on Shikra

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml | 13 ++++++++++---
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml  |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         |  2 +-
 drivers/phy/qualcomm/phy-qcom-qusb2.c            | 16 ++++++++++++++++
 4 files changed, 28 insertions(+), 4 deletions(-)

-- 
2.34.1

