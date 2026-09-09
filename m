Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F63E56E072
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965820; cv=none; b=TE7CRjLqE/WR12+DEkOhuXU/A+9sxlNWmFwCzCPCf9emAb4ugS61rrkRWEn5+izd8SBBGWsm2Vtdytdxy6r610UQ36M4oI35GkOfNCbw10mFyTUQqG6145JZ4aJVJyCuOk1A5f57aEi8q7LsGXS7Yyem1Cf4vNOFd1sdqr5zzrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965820; c=relaxed/simple;
	bh=4OXN0Rl1IOzPKZW/swSOZm42BNSE5v5u4Sg55/zk5zw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XxxsjG6HbsK0qsWgyNbQ+UFVG04/glZb8hplhalJRcK0eX573wp80XqZHVe6SMtboISo8MYNw2f74Z/TEVh2QUdOyE/soX6+ljP3JMVxksSr8eNhMu68uc1ssib1avYxY6FIM/9OsFRhaWVAXwYp0VSNWHSFpyvwioAfROMoa0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0YpvMx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjXZ4R/T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0YpvMx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjXZ4R/T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CChI51400900
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 14:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Wp2blfNSiKAYO5zA3+biPV
	ntif31YKgd1gEoQ6yved4=; b=d0YpvMx6l0iCCXgDnDNtdbNlXIovDRKG02Cwjc
	AD/UMcp1AtS67+GbZ1/lBCsNMFrXTkcxfEDjPSP8Pc4HwcJnXy0zQ5eQSeEwrk//
	t1gUcPRU+Cn/wKQm+QdauHYiYGtVhiW6FGPPIxrf0hNpbIb2AXPhISMmvluJXHTb
	PZTpE5R6au9Fl4rBqzImf41rYBiu5ORPm0LONzrxIV4EpRd+8wG4+Q+N+SECOb0d
	q2lbH/38+XQSMgbiJ80XtcJRE/Wyj0NIBlSw4KS1HfScaKvE8MaUHLnp/09+/7Yg
	GV/AmrdehkqZecV2/ifE8gkwY4LQCMo1YEmR2GxWeS9GM6IA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x0qxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:56:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fa7ff1a44so237936137.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965816; x=1789570616; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wp2blfNSiKAYO5zA3+biPVntif31YKgd1gEoQ6yved4=;
        b=FjXZ4R/TYh0JMul7Kl2tfbtFR5l9aYvYjp5TEui9sWaQf4DQsrTjRJgr4JUKiAQ/2O
         HN5Vb14ssPhkcw+EJ5rtcAMSK98vIvZxrxXmukL+Ucu6U4zYeBROFinD5lTYIkrONOre
         rjgTzyC0H5hicR3lzJ5+tAJhtZyJwnJ9ISKLCRxyb13ubEOc1vl0xvYCdMdga4sUysCc
         P4rA+6jLfYnYvmQhg8orPsiQN0/GI4JGLBdF7d4N0GMmBEAe0IeLfBpLcV1ajAY7uOjn
         KyeqaOAXCMVth47DqXvx9qeb+pkg66cx4YN3Dk56yoStrA2kvOfFBwXg42SkSCArLixA
         Pvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965816; x=1789570616;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wp2blfNSiKAYO5zA3+biPVntif31YKgd1gEoQ6yved4=;
        b=fZ/WK5brfjfQm3GuRENR+T3aNuuPGwoiFGTKwbMEtxCQtYpK5wL+EPlF8BJHJ1ifk3
         BwetZxy01z8nURdAAUrNMxHJPEP/edCULrFIK5Bsail7k8mk0ujY4DrbJwbAShGZCHl4
         Ik+ZOh1qhH7IgS9TULCJDVIt5FMeuGZBm9Yaiw8KRO1N5A0S5DHga1zmlXX4Iu/T3dvh
         BAZjCqQ4BMjeJzINLYgTm2DXaY1LuSgjBrDU4G4zb1wS7hDTk8HCUYRMv8sK9zpdPRqS
         Fk9riw1UZiCTfmgIUD4tBiyyXi0WiZDMw5FjJQJQvp8hRqQGLm8O4A/2d0jfoIwDnOq+
         B5YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRsp2lX2mq+8c54SqhJUffK8VWS2Nx/xQaQ5nrGw7eQeuftEnHe2lgKFH7wXg8OGz7cs1QwWJPRTlT@vger.kernel.org
X-Gm-Message-State: AFuF++l35kulAHwApVxmSSfRHYbrAZ0x1e+S5v3eDFfimKPhE+Y0Vky9
	STw4I/ml+aNS0q5W+vH5uy6NPl/JMOb8SK9D23QD7Bxyfm7klZiEiawwZLj2Kz503eJnma9boby
	d4VFROY0i3ACM+qgvlRT0JfmAZwFzesR6W+R4OtGSu5TQwHWkiYgTyAyfeEE73Oxu
X-Gm-Gg: AYBFou21H273RUN9fv/sMh1Tlp9tRgfxjkx6JQgRbvByLPqkLPoC533xUl/hkgAtvb6
	zaA26TPWHo1emmyIHsFvktd3L+zvBYcx7JgzAucxrTw6hIF/qxNAsTBZPDl5xpsyB1mxCpL6Gjr
	POnnc4twOvpfz8vsdRjmREuNyjWSYQTYvsMpjGThM1ZD7wF5NC9u5j+nKPV56OoDfn13vOOwP9K
	mpNT0oyyqxsVVHXKSooj9l+J6SWV95ttUuhM0Thfu9BV9gaM5H4SOkiJFFS4UR9c2ny31uLQZCO
	3tFC3bXtkZ04HIUVDoRFOCV7FQOIpPY5WeQ3/Z7m9x1xchYlwaHRxa8PxLnxs8Ii64rPcgPTKPR
	x/ALX/AhySYVX5A==
X-Received: by 2002:a05:6102:5e86:b0:78a:8a0:7116 with SMTP id ada2fe7eead31-78a4a6f61c1mr13893466137.6.1788965814462;
        Wed, 09 Sep 2026 07:56:54 -0700 (PDT)
X-Received: by 2002:a05:6102:5e86:b0:78a:8a0:7116 with SMTP id ada2fe7eead31-78a4a6f61c1mr13893440137.6.1788965813982;
        Wed, 09 Sep 2026 07:56:53 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm47846131f8f.10.2026.09.09.07.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:56:53 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH v5 0/5] PCI/pwrctrl: tc9563: Introduce support for embedded
 GPIO controller
Date: Wed, 09 Sep 2026 16:55:52 +0200
Message-Id: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNSwrCMBCA4atI1kaSyduV9xAXeVUDamujRZHe3
 VE3hepm4B+Yb56k5r7kStaLJ+nzUGppzxhquSDx4M/7TEvCJsBAMyM47WKh1+iUFtTf7lRrDy5
 JYRvNCB51fW7K/QNud9iHUq9t//j4A39vv5RjM2rglNGUXLD4yGbDNm2tq8vNH2N7Oq1wkLc4w
 FQRMwVQETJqUEFJiPyPIqaKnCkCFRW4lC5pCB7+KHKq2JkiUYmmicYYCw7CD2Ucxxdvjf4shQE
 AAA==
X-Change-ID: 20260731-pci-tc9563-aux-66a29d438f60
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: DAOR5ggUWNMZ6ck8owwR4Q65RVlkKwvH
X-Proofpoint-GUID: DAOR5ggUWNMZ6ck8owwR4Q65RVlkKwvH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX7oTjP3+W2GoV
 D3cnyom/eWVj1RfIHVJ5YVfCcfh7cfQv6Kp6pa+q9Ecqfv+7TWJ7I1VT/vRiZouYiNsg53dDE+K
 U2nNHn6cRxQNWflc7oTxWghN2IkhV14=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXwwnYCNgMGbeQ
 378UfpPoO9GnU5pC/Fx98LhXs1YhdEHDtbKahF5BucxkctHrl6woWIpI68/7+C4ObffJp1WkjnO
 oBHIfAqiDWjF/dXHxs6s0aQTXbAivyZamsY/8vYONaSgo44aL1Rwynbp3Pr+6koehKBxOgBDesv
 TjrEi+D9BRxOtqAQE0Zst3SJ0PmGthDZpg7EWCNZ+aINd/gEbscOFxfi2CWbLgPUOhaR2n5wFbj
 6UI1Z19nbTB2jvfuwaOA1YN69QPH1odrjo3miPcKq9FYipaBjDAOA50aoRPr03h27hi3wFWJB1R
 cOcn/kB3MZbAeOqtsdEETh09wod96QNmZmmrXMQE0/lQ7g6As9zKFcAcIRshESveeIgn1fUNXja
 4FEWIfBZ6h62pA8EKv01gIoxMKoDJ989o2VRYsGgvwTJTRBKjNYeJId+u2ayRY9wHj4eVkKtwb+
 KkWorov6Ico268CzZsQ==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa173b9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m0QktR8YAgtX1DuhF7UA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090167

The TC9563 embeds a GPIO controller currently used for per-port reset
signals.
Add a driver for the GPIO controller embedded in the Toshiba TC9563 PCIe
switch providing 37 GPIO lines. The controller is registered as an auxiliary
device by the TC9563 power controller driver and accessed through the same
i2c device.
Please note this series is based on pwrctrl upstream branch.

---
Changes in v5:
- Fix GPIO controller binding for Toshiba TC9563 PCIe switch.
- Link to v4: https://lore.kernel.org/r/20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com

Changes in v4:
- Do not always use 0 as aux device id.
- Link to v3: https://lore.kernel.org/r/20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com

Changes in v3:
- Describe gpio-controller support in TC9563 binding instead of defining
  a gpio child node.
- Link to v2: https://lore.kernel.org/r/20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com

Changes in v2:
- Fix PCI_PWRCTRL_TC9563 Kconfig dependency
- Move of_node refcounting management in tc9563_pwrctrl_adev_add().
- Link to v1: https://lore.kernel.org/r/20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com

---
Alex Elder (1):
      gpio: tc9563: Add support for the embedded GPIO controller

Lorenzo Bianconi (4):
      dt-bindings: PCI: toshiba,tc9563: Document embedded GPIO controller
      PCI/pwrctrl: tc9563: Add GPIO auxiliary device support
      PCI/pwrctrl: tc9563: Switch per-port reset to GPIO descriptor API
      arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563 embedded GPIO controller

 .../devicetree/bindings/pci/toshiba,tc9563.yaml    |  14 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 +-
 drivers/gpio/Kconfig                               |  11 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-tc9563.c                         |  99 +++++++++++++
 drivers/pci/pwrctrl/Kconfig                        |   1 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 165 +++++++++++++++++++--
 include/linux/soc/qcom/tc9563.h                    |  19 +++
 8 files changed, 300 insertions(+), 17 deletions(-)
---
base-commit: 028f86457e822ab9de5b0d6d23efddc1b8b54ae1
change-id: 20260731-pci-tc9563-aux-66a29d438f60

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

