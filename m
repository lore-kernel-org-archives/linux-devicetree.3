Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4713264FF
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934681; cv=none; b=oxcgFsrz0lBDhz14XWWKFs0Sw7Y0vn8b3AjnYFPUVV3uYBdN/z76HzgPbqgPPeYEcCvQU2wg5AQt/0q0H4UMrnnZrE6m9qmnhK177rfBLRLtnpxfRDWH7owThO9aPGwjbbVvY+clbK0jZ7F7QOEm336PaZsbwgT/ddXb8ofDpDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934681; c=relaxed/simple;
	bh=DQH7CAYitZ+juEYZvf46+Zoz7KVh9etDiLX0uFcUOB0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KQxr6eEfc/lWW9MpCUOPLCvoN2EuLx3lOeqgMaFibGqoz/2R0At7DPwTz+BmNs9RYKSgII367Ak+Gx8rYuVghlIaC0hsgYaEeiU0FA3DiAUR57gIfC54H70NTVWvNQo92duMuC668dAGNAcoN98UT5NVG9uRaN+kBVAFhsbhHyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRyi8v/U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etFqwCxN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRyi8v/U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etFqwCxN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UNlqC93539570
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QoFOUwzIAy7frpXJeW7r6L
	JjihXSEvQzpTqYsMrCI8o=; b=cRyi8v/ULmLBcQ4lnEESu6O8er8OU0beEckgKT
	zDBUHs0sDylXtMLLGbbbz5vCWaKEY2nthac8M5zv2evszWSk5XnN9bhrFVXnU0pk
	vSEeA3n+sTBmqC1pQgZyv1OFh3jM5NE3RAnueHSHN0iRQCLE2wShQ2vewkuTC70q
	i8xEpHcMMynxtk46hOtZxDmy/DmBisV5pezY6Bk8kVl6RpJm+LXddvtdiAriFCv5
	5NL9qLuLlky9QDVSVXZjhEumht4pFw90wlAzBoJqHqyTGkfMuX+0ni/MF3WhYr5Q
	MiBJ/VOH8QQIHOs0t8cyAdpvMNLlJmcvH3UtF5x889bRsH9w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59uvqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:24:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c6dd66f6dso8936646b3a.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 22:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934677; x=1775539477; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QoFOUwzIAy7frpXJeW7r6LJjihXSEvQzpTqYsMrCI8o=;
        b=etFqwCxN8CYFdGtFn6euY/DOXz3F900lCdfXZ8IpsW5bXhfAjm9v+Xy0Nz8hPPnILs
         Y0HP0u1LShdG0a0y37imyBnKL/HnE9WgFBlyHuSMDg6qKT/uDb4TyjMCHglUkZj32uHR
         9uZHJiHlqLe3l6VaO6p7ueFo5B6nTgm0PSWbnJ0aG79UK0+kFKoEuVS7+aqJB5tUVypt
         VtVih2BZL0L2j2We+rWfc5BwioYD2XJIFvRGqqfHv9im9E/gMLkYbFAo6g2oEPhufJRt
         UxBVnmFq2i01y3GTyWPF/f7qqZRnYNXNcIuxkmHTddzZeJ702HotnpePDeGOmo14ihGs
         IFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934677; x=1775539477;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoFOUwzIAy7frpXJeW7r6LJjihXSEvQzpTqYsMrCI8o=;
        b=PCBqzJgIbFER10Me7HI/nY5M9ZXOYT4N/uE7liqP6tBV/ER4xd9QEHyfT4MstAPFb5
         5ic3ADauO6SLMKKxUh8sWnbsvEVkWk8byAzJyte2ml4yE0fLjg/EeSIw1pshsZzacJ7e
         UfNXhfr4+oASGu/cF7sFk1loj/Ql5tETG9MxRXFJQi/+iij+Bx0yBxqBYUM45B+8aQ8q
         BDroA8XVK3Dh4MmG6q9PZG3XgiTvZFbZy1wSo0R1pT8t7l2y5rkH2/yfKe6FVmm0eD4w
         FCKtReoUjP3IGNY4M26bXpUk6+bvTPA0pHS4FcdqsaaIuYG6Dj6ntRaWcIqOtHKLBxow
         eBsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYgjZP+hBOxWv6u0CDDCSfEbu3nt5SqrsMldtBFFrTJpfz2ZYytI9RQn8dJLN8Xoka4ra98g5SR1hU@vger.kernel.org
X-Gm-Message-State: AOJu0YzU0gcXPvWK3uOWTaBkf3pcOwPF1/Rxbnv03P5kpb5VVeWkwK77
	iN3q5YxzB3uLH3ZXp0wnM1aOVOjuE6XPcjFojlS0S8dc2c9eizxTcc6Er9F9Ha1YTgWmHumNu2K
	P8ep385a1HnwoJ8JEygsR563vupq++/MmOkq57rBIbqX+aor6MCWIuOj9zso3JUbZ
X-Gm-Gg: ATEYQzyzisSU6aKt2XaSMMC+M0FW9fW1e6yJZQ/ZfSnZMQWVwH5pvCYkVKEypOozpIX
	hiEONvoLJISHqxd7HByd3rso9zaMjT015j3FQFdN6upUZZFvRKRFQMnObzVDupUPTHPr5pRzsBI
	BuYjhyFQs3YMVatlrxNx/v9t3fYkWdyBS3lm7dYToIuF+tUeqX9+5CuY42m9xQ5dzOYib6ZncXN
	70zUnZ57+xj36i+nxGvR/gCr3pTc5rvdh8sDLsXIIsyJwssW/gwtHITOQ9sObpHqq0lVezzXfcd
	c6O/be8yu474EAgyntj1k73RdSzEYJnQ0ZEoTMwBfI8MjPm5tLuO2ZScWbC9jCUCA4+SyTYgyEm
	BPfM+KfAYFqbV1Gkowbj4bI8MDe/9A4Ye8o08hDU4qkfH7Bq15Oig
X-Received: by 2002:a05:6a00:1399:b0:82c:9126:3200 with SMTP id d2e1a72fcca58-82c95aef936mr16041605b3a.12.1774934677354;
        Mon, 30 Mar 2026 22:24:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:1399:b0:82c:9126:3200 with SMTP id d2e1a72fcca58-82c95aef936mr16041573b3a.12.1774934676770;
        Mon, 30 Mar 2026 22:24:36 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:24:36 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v3 0/7] Add support for videocc and camcc on X1P42100
 platform
Date: Tue, 31 Mar 2026 10:54:09 +0530
Message-Id: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHlay2kC/23NQQ6CMBAF0KuQri0pU6HgynsYF22nSBOh2ErVE
 O5uwYUbNj/5k/w3MwnGWxPIKZuJN9EG64ZU+CEjupPDzVCLqRNgUDHOCzpO/iVptGic1lTLPiU
 2gjFkrWgEkrQcvWnte1Mv19Q7G57Of7YnsVivP6+AeteLBWVUAUdTCmxLJc8uhPwxybt2fZ+nI
 Csb4U9xdtynIFGoFAJCWSusdqhlWb6s6GemCAEAAA==
X-Change-ID: 20260331-purwa-videocc-camcc-d9700d0f797d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: aOcYpjZwGfnxE1rgTWWDaGX-HaUYSY1v
X-Proofpoint-GUID: aOcYpjZwGfnxE1rgTWWDaGX-HaUYSY1v
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69cb5a96 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-aA_EJKQ9c9Fm2tRs6UA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OCBTYWx0ZWRfX6UC07a0ysMCK
 h+3WuZRuGI18ei/vin234taabXpMaPZtWYBYCKgp+1lhOcc9bWHalu91ZslRSNH1FIoQCe9ufsg
 9aQ6/w12tGMGO1grdfPBHzkc66Ao+BqdZ6YjOzs+2bXzi9x9qjEBRlsjZjxnZHlo1EPjB+Kdece
 t7IoNhMO12U4xA5RzNaBUBqCGbp03X+s3AQKZeaNl3WUOQDKUk/Ts6tX4kBcsws23X9VCVL/2zj
 tTsz3GENH0xZxphl0GzvaFuKCkkl9OJ2gs2RRpp9gdfo53B3h1PLK5E8qHh1JVFT5rN/nqBvWVj
 dVRWVQ/Xayb5H4EqYyoFdgWsTe4kAFnG2mAeeERBQkYofSHIIdfOtuApbRcBsTIebA8AWfilyQ2
 AyYtCEVCDrZ5zgav9LKTPaNX8gJWL9hAQ3+JSyKbMAAfumdY0aFnqrZwlLPStUWWbWIorTNcbNs
 myOtKMSuHD0xbTd0uqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310048

Add support for video and camera clock controllers on
X1P42100 platform.

The purwa(X1P42100) platform includes the hamoa dtsi file
and camcc node is already posted upstream on hamoa(X1E80100)
platform in Bryan's series[1]. Hence included the camcc node
patch[PATCH 06/15] from Bryan's series[1] and extended it for
purwa(X1P42100).

[1]: https://lore.kernel.org/all/20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-0bc5da82f526@linaro.org/

The camcc node was added in x1e80100.dtsi in above Bryan's series
but moved it to hamoa.dtsi in this series to align as per the latest
changes.

The series also adds the camera QDSS debug clocks support for X1E80100.
This change updates the X1E80100 camcc ABI, so X1E80100 camcc bindings
and driver changes need to be picked together.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v3:
- Added a sepearate new header for Purwa videocc
- Dropped the fixes tags added in v2, since no user observable bug
- Updated the commit text for few patches
- Added R-By tags recieved on v2
- Link to v2: https://lore.kernel.org/r/20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com

Changes in v2:
- Dropped new header file for X1P42100 videocc and included
  additional clocks and resets in SM8650 videocc header file
- Updated commit text for videocc and camcc driver patches
- Squashed Purwa videocc & camcc DT compatible update into previous
  camcc node patch based on review comments
- Added R-By tags received on v1
- Added Fixes tags based on review comments
- Link to v1: https://lore.kernel.org/r/20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com

---
Bryan O'Donoghue (1):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition

Jagadeesh Kona (6):
      dt-bindings: clock: qcom: Add X1P42100 video clock controller
      dt-bindings: clock: qcom: Add X1P42100 camera clock controller
      clk: qcom: videocc-x1p42100: Add support for video clock controller
      clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
      clk: qcom: camcc-x1p42100: Add support for camera clock controller
      arm64: defconfig: Enable VIDEOCC and CAMCC drivers on Qualcomm X1P42100

 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   16 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                |   10 +
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |   20 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/camcc-x1e80100.c                  |   64 +
 drivers/clk/qcom/camcc-x1p42100.c                  | 2223 ++++++++++++++++++++
 drivers/clk/qcom/videocc-x1p42100.c                |  585 ++++++
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |    3 +
 include/dt-bindings/clock/qcom,x1p42100-videocc.h  |   48 +
 12 files changed, 2977 insertions(+)
---
base-commit: cf7c3c02fdd0dfccf4d6611714273dcb538af2cb
change-id: 20260331-purwa-videocc-camcc-d9700d0f797d

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

