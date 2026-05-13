Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863093E6DC3
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686072; cv=none; b=ZW8ibMACaIgoYdbMA201jbCt2A+jRswfMwFEO1mWbtvAogRCYbdwQ+vgLjnGoYZyBlz0J2ztxIGgVXuPcUSov1G/MoujAYMFxm3MxWh9YHjufjsp7BFD9I3q31uCfBl6ctj64TXLFenmEmk31zeuJcCRxo1d7exD0KwM2YJ5MpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686072; c=relaxed/simple;
	bh=xW5eze9G538c9pLng86D7qiRJfzInYX8HsnIET2Obnw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s5JJEuSzHaQNtjbmgpIC2oioEVvm2gHHMd9AfpDjntLTUU/uBxmn+O5PuKjTF4IAz6oq8atbfXc8LXn9UjZT+AFynVBTAD5eEZ/Uq1Irulr+ukNfi7zKcswl/bg5sq2I2TWa79P44U00eC7Vf2qgTVlr1UwGKuowL3E16g+xWMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvpdaSqD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABTcZvlH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvpdaSqD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABTcZvlH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEm9Ii3474831
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PLRVRXYe5uxCYuxI2XGDi5
	MFd0LhFIIf1w7B7feNGuY=; b=SvpdaSqDEuf58NMSIVLGrh34lNxh9ggqfW0V08
	eCMylx2jLky9u1WwsE14Pr2E+uXUSDkZoF2A4dumhbT5RQ5jlQhmq/KnIpz46Fvw
	welp096pKenb0K2VikdluhG3C7oOi20KC4FF/BU+YLPaBy9QxTtq20kcYNJfLngt
	i6iXfv9R1QC+pEr60/jV+YWCQFXm94wg9kiSUjYARn1Ril2jdzqnNTXFr0Ous9+K
	mWotc6Wnvb+r2j6XTz5s7DhpTPANGFUD269YjCLaCrIK7a6VjEfq5CHrSVz0tdej
	vWb6s2hVa0xjypgDGJ/p1/iE5uY8ITRfojaucXR95ZK+VdUQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p419jex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:27:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b458add85aso73800435ad.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686069; x=1779290869; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLRVRXYe5uxCYuxI2XGDi5MFd0LhFIIf1w7B7feNGuY=;
        b=ABTcZvlH4UUqSFtl24sbmt9GBPrb64HX8q5YTXWxmwCUbUfGHqh1b5ZM0u5EUfpk35
         xoPxv2pjIIia8cFKQi6s4r5FTfDeW+61IFTmaEYuarRb8GpcplXmObX2o6v7LWXDVrnd
         ryTiecHeGzLwD/p2oiAIL8yuF77TOizn8PaM1h59PcWnUJfMyxI1WYxsZB86zMCpUDFm
         ZquRtHfm4Ys1CqMeJE/OeZTW/n37OZgMxX7VhKRkYZI4eEf5Hb77d07/K78WxNcg/hBC
         IIo5Q2FoJS9O65VEg8cl/X8OgdVElKG6htaOfkJB6px676AO4SKxmWVlOSQJM4gDNBZ5
         MdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686069; x=1779290869;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLRVRXYe5uxCYuxI2XGDi5MFd0LhFIIf1w7B7feNGuY=;
        b=sqdOdLxXD8tbDH79sf7YnH8KjkTZPuWuKaI63Gpfp7ouWaBnClRUPYldNqZ3NRem0r
         DP9fGh3pnKK/ZFQ2Dk1E/UNfr22pz/G3MGok6lMrgbZZaTP+wLIwkt2S7ldldvRdBz1w
         n/RluPZzF3SVGoxN6XTn9hEYagdWaeytAJNvpSmQX7VL3vT/myBUrMtRKA4fwe3WorIt
         Xb1jtOLGPlwGeCoT+40kBlk5rsirs8576iiVMvMMqffxG5Edo7NHNWYUC0dbGrP+t3rA
         T/en0BlulL7zWVMUmNhR7DcRilmZRhR/HxMVr4ENevWxq5vX5kQzoFQoR45AkRQvzYCE
         bExQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BeYYZG7hXEDqE4XteEfESNnmDGzRuh6lwU9enrZjazBXR9pNqcJ9dvEEmenlunfxvDuWuC5vjVIca@vger.kernel.org
X-Gm-Message-State: AOJu0YynYDcP8HhJWyBp5PJEmb6g2S1g4CgA3PGC3rqOpG2+AXHRShXL
	517u8IRUDd9ltfxUo+Anh9ZelTLuZJRnyaxFKkOCFFl0BNd/P9R0xAV0kN1lAY0iMwetS2bRKtk
	NAAYw4LXgG8MMxKGD0Ayd0KBLxZUY3G/k7Kr1w6PQ3CR9dIJfEAkYFjHyvIJ4h88i
X-Gm-Gg: Acq92OGFpW2RIMvmRYV71z9Gv7SskXdca5i7XbXapSaeM5/7ZZuW3PMJ/gk4xggXZWa
	R8HMrkNEip7RmLyKV7UWWcl/b6wyNzKck8jtNiSRwSnhCZ2PiQhChw3xkraIyZtaDqsptg1Mthi
	+z/8W1mKae+VFMe27e4XKi34oLRKE0jqrfpjdwvCN83mAxpWHipNGoCUFmqhp/wIj9qgoVHIR51
	OcGgZyGt9Dvq2n2ho/YvQguz+C972WdiDfCgqXgAR8XIme/Ud+qtc+yC+aJuqBOVn3Oub2nxz1K
	cTEcr7mTiB3cs7kR01qQmb7DbtryO9WyCLlY2sbOLQpno5tXySJGGEVgmt1U2DprWfzzUFrvCHS
	pUpk9D24ZKdWcb0+P5qQyY6ByKk8YHrc+51Oahlgyr8qbRg==
X-Received: by 2002:a17:903:22c7:b0:2ba:4086:ecb9 with SMTP id d9443c01a7336-2bd3032f9a5mr37432245ad.36.1778686069434;
        Wed, 13 May 2026 08:27:49 -0700 (PDT)
X-Received: by 2002:a17:903:22c7:b0:2ba:4086:ecb9 with SMTP id d9443c01a7336-2bd3032f9a5mr37431695ad.36.1778686068872;
        Wed, 13 May 2026 08:27:48 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:27:48 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v4 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Wed, 13 May 2026 20:57:35 +0530
Message-Id: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGeYBGoC/3XMUQuCMBDA8a8ie24yt+myp75HhOht5YFztdWox
 O/e9KWHCo6D/8H9JhKMRxPILpuINxEDujGF3GQE+nY8G4o6NeGMV0yympoBX21jbQPQRE4VK0B
 IrTslDUlPF29O+FjBwzF1j+Hm/HP1I1+uf6k0jHbAoNJaqQ7KvQshv97bAZy1eVpkEaP4KGUhv
 hSxKGUNQjENfFv8UOZ5fgOZ6B+O+QAAAA==
X-Change-ID: 20260409-eliza_mm_cc_v2-701c34ddb74e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a049876 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8HYrQF7E7KXWYYjJzRwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfXySPAuP3uk/cj
 xT9QjfuFC8iwzkBwkVwHcga5x10mdRmgr1stLXHPmPfLEexDFanueIHBJ3lO17sWmbjt/RoOElk
 vRK5cQJivL8YIztnsibw7sQzpwqv1tK7NJBAsXQ2kcLKyHHSrq6qDGtGb1UsrKuX/KpKlBv8m+6
 3buEcOoioSd89umkO0DyYvYxxjuEPYcWVQBJOjXABQiCCg7mm+RoJJRCnA5LALVWeNcum7dHpde
 PwUsKxJhnhSfjp0chquNAi+GwIN3lAWtiaaz7jeyOByHCgdXaD0wO440ZM09JvccqWe4bx5iw+p
 BTelymUoqjdct/YsKGoBa+xeB5uJ/6btboDlfsjrSGi0EN5Z+0y7mr4wu5Jsgh6FR1b6zaVGdCq
 bOgecsFP4HNsQI8BAQKKxIH0vqVpFFJDmFerl+nWykAwhl5sr8NbD38pHOiyPSekXyjVonnL9g0
 QzUs6AYtkg1tl7n0Iwg==
X-Proofpoint-GUID: yaDjIFGLl2rFWeb-MjUbngFCf5Wsbp2Y
X-Proofpoint-ORIG-GUID: yaDjIFGLl2rFWeb-MjUbngFCf5Wsbp2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Since CX and MX rails are already ON when APPS
is active, explicit power-domain voting is not required similar to Milos.
Hence extended the Milos camcc & videocc documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   11 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |    9 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   59 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  621 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4677 insertions(+), 4 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

