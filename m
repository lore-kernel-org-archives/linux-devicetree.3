Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD529427F98
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890519; cv=none; b=dCFys2sHc3/kROeo8edRlofBZ2pBPMo3HgonSlywes5hgg/YViyZ13R15N6HujwGbNJjGHhnXvnoluB4WlRCRV56LYfY+FWId4oDev7uDgRySfKgJRKOq1yTzqcswiuT6miA57xPEir1TyVyjaDLeYcqF2B4+ST7NJ5/h1lHugU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890519; c=relaxed/simple;
	bh=8iSjo6XwHW+3iMcgE3t1IV87hUjtmnhdrqErBb55VUY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FnSNeDIUvWjQsnXfnyGnPuLiWSN5xNj58OlCQlnMiEu3KBQZybW/xs7ubNOIxC7Zy+234b9YI7/QDQYRgUnI/Gj9NC1VxqHousDalOVePhN2IZRZK/nQvom0jQKT7/Xnx+0fWjT3FTrpxKPHmDgctWz+3eHByFhp6gpKI0Twgp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B28n/CnD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpONIBlz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B28n/CnD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpONIBlz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADaOd3889401
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sds2CZkxIDlesBTkhv2jGp
	HslDQ6Nba5/qsQhGuCRsw=; b=B28n/CnDh5UxkbHO8/m6uPAkSHs4HBq5f/K3k/
	oZ+LzPAFoXJpPWlpQwzt7LCEQzP17swhFn3bMV2kU2QH7GcBVWV3hPQm5xLiShlx
	OdUqMrnz/IIAfLvyHuWSFlnC72pISOSA5DwrdbdB8HeLtavjkn7REa1WQkZEhIao
	NxxLPt7D760mXdFxzQSX3fsDApHm3er6hhQNb4B52n6BYZW/EMWXSX5Om1/VNCu+
	tlF6OwZitkkQ8OAMq/AUPiKDesO6D7Ui6sFhmlBbvjr/SjFKxPsscv/LvnfJHlGn
	sf3PFvgCSfnB0fqa5KxprUPJwcMD3/L/1Q9csHF/CBE1EIZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5f68ac9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:55:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so6405875ad.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890515; x=1785495315; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sds2CZkxIDlesBTkhv2jGpHslDQ6Nba5/qsQhGuCRsw=;
        b=jpONIBlzvtaDvSizVDRlUd43IO7icKbTS0iQAwMbsc/qzP1u12QTl0o5YOIMDlNER7
         t1VlXGYCTobO/yiGSq9t/NtiYX0mw2f67eHQIdXozwIVcldbCpMwpNh/amm71xBQGe5l
         Tfl4b8BeqkX/XDNrt6qB5wLMqhg2VsxEBRzb6wzp32YLHaarhGtpgrWIjaEtRQuv4isz
         eX1xr+xw8OqPyZ37oE84zkT6ZHYSTiSLQ5SIFroDBpkqJaPZR130SA9Ic2vcU+egy7fj
         zwGvXPMN39SfVa9o6selL4wmC8bHIkfpUQmu8NpJ4RxniXjIURdK4TB60OTNTDpKy0DK
         F9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890515; x=1785495315;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sds2CZkxIDlesBTkhv2jGpHslDQ6Nba5/qsQhGuCRsw=;
        b=lydGdT08xH0k9TZN6m9eF1gocYozVO51fmIPkFu33zuy5pfhUyMs4D+8TR0uXmdfxS
         uO4ZlWH3fKe98wNgFSY2M0T7/v2mnhdBCM0dOGtjachd9di51jN039a9CmZqsI/DgiuO
         BcvnUFvwtFdpYxOkxZIOo2oRVIWHmmMJzeaQ9Tfwo5Vn+X6v3JWigcDb5hBl9Xa+Lhdx
         pHu6gOy5/kNdheHZozZMFK40ZACz4sErY3I5VTReUnMVk4nSaTcEkjPO5F5mGo5PRlDy
         UKLcw0Qt66yV8NX0gCaaZAlNLOt4GwKT1i6hJdP+TkAEgGuBXDiGagvbLuHEs2qqj8Fr
         66eA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0fzzzQZ0EnfgyXLpOrGaLcNx+05FVW+u+4IhQLOvf8kLr4UXa17NSLHztTJBCOyO7rBQKCuXcxT6k@vger.kernel.org
X-Gm-Message-State: AOJu0YxTd6i4md2MjWpBFXxcPYd8y4wffEBzHqcio6XzRaZZaRa1PSVk
	M25/7cGXn7/QHPVhxWabmy4qkln6dSD8oaTgpK8Uy8bneB8lJBy3Sh0T5JJjP2ndNH1qOBFrXwq
	3WYLtUI7TjOQZkc8qHYvNK0bvVhAO2AH97K4Be8+YaSUXSXHp2RTiMxXxMFuQQyAh
X-Gm-Gg: AR+sD131rs8O9tbfycO3Eli6uI4Ocf0dmgR5zeE4T+ksfa/Nj1miBwKkcIoSsuxFMOn
	UoLXGPJkRPnjOK+QeFPNzO1OodKQXVggJkOkqqtnQ6663ioofbaxnwE7mb6evYMfqw31CZVWCP+
	+UUDA91VWVFfLL8ry/mrE23JWttuBpWvvaUJWyEQ62Nvu4rOM9IsFgMeafP5xsQ9zlq/XTQmmq6
	S+RADy23CIHUxY8ROgMoyu9iD8wn3qBQLWvBL/lsY95Q3c75saGEXdXf4Dog+BYxv73OJvOzIQE
	78hcPCkVOCOiUpp47nIAZtxm6oFcVu8WEPAEA16x5d1YBnGs5PIncf+bOy8Y4JzYITwqKQkQn/J
	AjyCITuqNKZgOfFZYEL/ZrIp8
X-Received: by 2002:a17:903:41ce:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2cfa7435a14mr75830005ad.15.1784890515089;
        Fri, 24 Jul 2026 03:55:15 -0700 (PDT)
X-Received: by 2002:a17:903:41ce:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2cfa7435a14mr75829745ad.15.1784890514652;
        Fri, 24 Jul 2026 03:55:14 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f310644sm49314775ad.55.2026.07.24.03.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:55:14 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/6] clk: qcom: Add Nord multimedia clock controller
 support
Date: Fri, 24 Jul 2026 16:25:04 +0530
Message-Id: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhEY2oC/23M4QrCIBDA8VcZfs6hN3Vbn3qPiGHTNSG1tKQYe
 /fcIGIQHAf/g/tNKOpgdET7YkJBJxONdzmqXYH6UbqLxkblRkBAEAEEOx9U7KztEsXtuVaKDS0
 ooVD+uAU9mNeqHU+5RxMfPrxXPNHl+nWqjZOH4EaQvmG8ahvCDj7G8v6U195bW+aFFi7Bj6iBb
 gnIBK01l4xxySn8IeZ5/gAOJDow8AAAAA==
X-Change-ID: 20260620-nords_mm_v1-9b7dd4f92d6d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfXwlSPZs0DBIxF
 k/iWnftfJZW/hfDZYYF3kW3rNPji6jKVHBYQ3QaZx18RGBdL0RXWuqYPtukC5DRvmZtxm73gHTG
 rCj7l7pnz+KKTX1cjiNJ1gwjnaEg97c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX4CZQ25n/HkMd
 W6sphbHe6ClycP18lwNi9V2+6l182tx9i5jC+NR3obTKSmWWutEwG33UrjIpqJ+4wlFemoraNdt
 lW1z3+yu9xi/SH4nzj0WTAQyj8sbvqvADhaM23SBCQN92vw/qqoA/+2VU/yEPH5dLD/xDUKuCk1
 s1GUc5n8vko5wR/CEkuC0cmYL0GnpxcRjsm2penr80WDxoh0k/RUs1xPFtZLPsC+SO6zkelI5JL
 L21paR3rxwSZ+lm4w9uIPtxtKsOQ9shOs7+MMzPd66JVomExI2SgqJQE/rf6pjLe0pp8REhf40e
 K3U9i2DpC88ewL4r8/twxPsNh3Mrl9E9LMvDD8fWk33/G9D6R2JEb4RchBosiHfrodzT5tXXQpi
 o+uVZha89rMLnCMpQ+hBPM/1HtgK80f3/6zgongksJiZel7++WcxIainQRQGkJzJ3XGXssnbeQS
 EVizygc3poPV1seOzUw==
X-Proofpoint-GUID: PutkEHXNvjTvTmpsz91eNQ1FL1DF1rwb
X-Authority-Analysis: v=2.4 cv=BNeDalQG c=1 sm=1 tr=0 ts=6a634493 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vI_4KLquzuGg7hnt8WQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: PutkEHXNvjTvTmpsz91eNQ1FL1DF1rwb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240099

This series adds clock controller support for the multimedia subsystems
on the Qualcomm Nord SoC platform, along with two fixes for always-on
clocks that were incorrectly exposed as controllable branches.

The Nord platform is a multi-cluster SoC that includes dedicated clock
controllers for the display and graphics subsystems. This series adds:

  - DT bindings and driver support for the two display clock controller
    instances (DISPCC_0 and DISPCC_1).
  - DT bindings and driver support for the two GPU clock controller
    instances (GPUCC and GPU2CC).
  - A fix for the GCC-Nord driver to mark PCIe link AHB and XO clocks
    as critical CBCRs instead of gatable clk_branch instances.
  - A fix for the NEGCC-Nord driver to mark the GPU2 CFG clock as a
    critical CBCR instead of a controllable clk_branch.

The two fix patches carry Fixes: tags pointing to the original Nord GCC
commit and are candidates for stable backport.

Changes in v3:
 - Documented the qcom,nord-gpu2cc.h dt-bindings header reference in
   qcom,sm8450-gpucc.yaml (was missing from the "description" list).
 - Fixed the critical CBCR comments in dispcc0-nord.c to correctly read
   MDSS_DISP_CC_RSCC_AHB_CLK and MDSS_DISP_CC_RSCC_VSYNC_CLK instead of
   the non-RSCC names.
 - Picked up Reviewed-by tags from Alexandre Mergnat, Krzysztof Kozlowski,
   and Shawn Guo.
 - Link to v2: https://lore.kernel.org/r/20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com

Changes in v2:
 - Split the GPU2CC-specific clock and reset IDs (MND1X_1_GFX3D_CLK,
   FF_BCR, GMU_BCR) out of the shared qcom,nord-gpucc.h dt-bindings
   header into a new qcom,nord-gpu2cc.h header, since GPUCC and GPU2CC
   are separate DT nodes with independent ID namespaces.
 - Updated qcom,nord-dispcc.h comments to reflect that the header now
   covers both the DISPCC_0 and DISPCC_1 instances.
 - Dropped unnecessary <linux/mod_devicetable.h> and <linux/of.h>
   includes from dispcc0-nord.c, dispcc1-nord.c, gpucc-nord.c, and
   gpu2cc-nord.c.
 - Link to v1: https://lore.kernel.org/r/20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (6):
      clk: qcom: gcc-nord: mark PCIe link clocks as critical
      clk: qcom: negcc-nord: keep GPU2 CFG clock enabled via critical CBCR
      dt-bindings: clock: qcom: Document Nord display clock controller
      clk: qcom: Add Nord display clock controller support
      dt-bindings: clock: qcom: Document Nord GPU clock controllers
      clk: qcom: gpucc: Add Nord graphics clock controller support

 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    4 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    3 +
 drivers/clk/qcom/Kconfig                           |   22 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/dispcc0-nord.c                    | 2004 ++++++++++++++++++++
 drivers/clk/qcom/dispcc1-nord.c                    | 2004 ++++++++++++++++++++
 drivers/clk/qcom/gcc-nord.c                        |   37 +-
 drivers/clk/qcom/gpu2cc-nord.c                     |  545 ++++++
 drivers/clk/qcom/gpucc-nord.c                      |  593 ++++++
 drivers/clk/qcom/negcc-nord.c                      |   22 +-
 include/dt-bindings/clock/qcom,nord-dispcc.h       |  115 ++
 include/dt-bindings/clock/qcom,nord-gpu2cc.h       |   47 +
 include/dt-bindings/clock/qcom,nord-gpucc.h        |   48 +
 13 files changed, 5400 insertions(+), 46 deletions(-)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260620-nords_mm_v1-9b7dd4f92d6d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

