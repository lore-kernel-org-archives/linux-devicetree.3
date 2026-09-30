Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE074D7D38
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772381; cv=none; b=Hz5bjCJetjOpYQ8zkoAuNuIRBl3JI3lFreIfX3vsFlrVtapX/j8WH76rVo1Bec2ShQsXceJ6U4opeOCkNMjjma/eoCl0vJ1F0u8PkXU/I/4hbGu4MZISWl8tNXjsA0B64Q4KG584IRDc7fdzdb5zNDqofsffDRBYyneFpBAiEko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772381; c=relaxed/simple;
	bh=aTL4lw39PtnnQyOMulEmRhSSF0Yf6RJS/a2j4gCoSSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oosBgxMtDbmL1zZ0sckoVUkkdrQLXU3AhWEauo6YDATHHjyQmzNT6YSGGM4I9XMRUSGCxRbZY9xpEfWlweaeVN3nHTkzDBz+248ZWYlOiBIoEy6nW5X4Gsn/n4tnTKEjhScuNo64eU8P24As6Zz3MsfXFtWHM67j7qlYWc5zpjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljaE3gmy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ji1U/keT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljaE3gmy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ji1U/keT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7ZYi2019627
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fidXHPHvwOp5wic/6WE7FT
	nm3CRScksILO2dTzE8xLw=; b=ljaE3gmyCtsc5PlvfQ7o8AU0kGlJR7QhNpvN0B
	0TlS2HTIVtev723ZN5SgUIRuQhVwc3RXscPUg8XCazhwBHt6Bt6iolh3gbhqzL0c
	diPTFiSAsIiHbgBKxEI5tCxN2Ppj5Cqp6jFxSBwTI4icbvvT0RyCNSQk2uxXmHTu
	hZgUADJ3ecjlQFFvIP8+huzbSweLiQWWQAMA7CdQgEzi0JJeg6jnvHNefHvBpc6g
	L6XdceIgSlGUSYp2TE2ZV3GZPOWo/tYIf9m4SkPAYca6WI28jHhQXihltFPX//1s
	Y2R/NWdcpT9H6jTykGEWGrkTfQ1Y/lLIQlyY/NLHiDzObIkg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c1bmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:46:19 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf21ebcc4aso176066137.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772378; x=1791377178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fidXHPHvwOp5wic/6WE7FTnm3CRScksILO2dTzE8xLw=;
        b=ji1U/keTePS1gH3O9qd+Y38IYm3eXUIidhIhDb5lV10MD6zpURY7fzO0f6KyluqRN1
         LX0tnTbskC7AhzwZ29NyS4cTOMM/NC9Mc1luHlKnDqvx0nMcAh1kPu7TTiUaZsBFFKyt
         iTMdooON71JjFVZAmVMzuH8e0qV4yp8dK9Z5c4D6Q3u8/Xhddc1BEvAUQSFKB0E0oMFm
         tAfdmJfVGvDuLBIoR5ldGiu4w/7P8B4ULs7ex0SNAoTIEtBUOtNl+b66DvkGkbhiTehh
         ZKwiKOX/Zyg0F3OVAj0+Bfu6i4w0kcgO6/1trAGhmF//Png53oN5zWl74mxvKR+xfRfI
         aILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772378; x=1791377178;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fidXHPHvwOp5wic/6WE7FTnm3CRScksILO2dTzE8xLw=;
        b=OurD8BDiBqjtnUTG66MgU9FlLNHB3UbxoaJmLYKOqpXZfhdKL9RW+MkZJZOaezpwjB
         2UVNQlXpG0zjo7kaacdXT5RKg9p9WubOHM8ounalY6aj/5RLt/gOLbmAaF4UVW5tXLmx
         qpg4GJkDRagF5FXuPjBpZore4oTohG3jDp5xPqzL+yWMeVaZXOFDj1rBRBJ78WOQHDdr
         el8aK3hNMQmb4ON2i9iZ4O5CEyUJaC2aoLpRkz7yCkTeHqFh219RranBidzY9g7SydQb
         41OKizSFDdr+wqCtRXfRNbTVdt6er3FTvfehisSyzdG4F3BMAn+aoKY1JhJZtvgNdgch
         j/7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBVbZxt7AP752TSo+CRwmCkq8ZtgizsDOXRw+P9Ay4FoWi8q64IYBKSha+E2xW0KiCoaKVGskr8hsI@vger.kernel.org
X-Gm-Message-State: AFq9FYLkuUH727hJ5z0YVoz0y5TpjyUkl8yA0ruLJnncWoj7lYBTsnik
	SR63Xq3zdFzcavbTVHvVS1rt3LWqr1p40s2kHHm3J/oNYV4M5wafCEP6B5Ev+IcpxPqVMhtNqD4
	Lb9Fc+I5m114r7bbWCsgsbOvrdCEJgsAkGPHK8WQUvWLi0voaNvVzLjjJH1/M5z49
X-Gm-Gg: AYBFou19vNFKEeGrJCjGSJP9V4EKU2C8+ms8tyMXeS5SVTmyecRpYt5HZDZBy3OLCf0
	lE5fKv8KJ+puZtxnEbFLvwIwfXJJOSzZqPlX1reqdxvz6J2Y0pfRS/x32Ja+yXmak5RMjq0bEQq
	RhS2tL8vYz1YOugUX3EZzYp+g/xgJ1HT86TzZlmWBo5pD4KleFHPsvLmw/EuvJ1wJLyWnYVUDtW
	8YSHdu413l3ixbWdus4QFZ9tjrGImTgtuM8RjrhRCFwcQC+Hwadl+9FGhbmVYxGtKiqayUFms9d
	JmDKNHl6k8MRu19yXhJh2Izn/M/BMGz/Bj3D4bq+sE0WgKEsdmXI9NPjjrlGxQ+nQ7Yc+bD655i
	KlIRfUHek4a9F
X-Received: by 2002:a05:6102:38cd:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7be7457f41dmr297918137.32.1790772377998;
        Wed, 30 Sep 2026 05:46:17 -0700 (PDT)
X-Received: by 2002:a05:6102:38cd:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7be7457f41dmr297889137.32.1790772377494;
        Wed, 30 Sep 2026 05:46:17 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/4] arm64: dts: arduino-imola: add support for sound
Date: Wed, 30 Sep 2026 13:46:02 +0100
Message-ID: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfXxyy9GA5mKrJi
 FDy/SLQFyT8x9q3fJTXSp8yxFh/bpFVhH6cy/3UK1mVr+YRTcXPv5bCZrfg6JVigiaSZVg+J8GW
 UIBO9MLPSRCBJj04t48LTy41FGpWFsU=
X-Proofpoint-ORIG-GUID: wZRDvWxfOB1X1Ry20sQBKPjgiLvi7j0H
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd049b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qC_FGOx9AAAA:8 a=QeQcAra5hdC8VfecJqYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: wZRDvWxfOB1X1Ry20sQBKPjgiLvi7j0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX2rl6WtKNuhrU
 56r7sDHUQ0EjUj3JdWue4zgPGz/m1G5c7ggP+dq+iHWNw94H5vugaNvZ/MvwCbSA50XNL1lk+eY
 GTgM0Q05yXe0vN95vH3RKuDbXkzsmrEnwxsUJbBj4FwMscGDlcnTN4TCzxPtLqKJVGbcqkQ/3yJ
 xjxZOUoN3PHBbGRxKWvLnqlMkBzINmHK7MRaze8IC1G8HPG6ZfHxIy4pQ5SQz6zhgJuArFvXjkn
 MeeTCnFhhz9aXA9dPTB+GdpCCESnbg7u+++BRAf1a0+JPFMaSJsIHw+KSPtg7kEcFfaZCrOa74O
 IQeyxcuq4C16ZRMtmrdeTtwJhqAKPLABLK7yuyPM3ZzohBt80C2cHklrq0Ll6NhFDB+L4Z2dzdn
 neeesgV6DBu6qm0zNfqMPbUS8GwP1CfwVox4qFosrTlVCkrHbM6+x6f2eEMxOlbAoEX7dlt/S/+
 nkm9yrYlbIhGbJD6IPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300050

This patchset adds support for audio on Arduino-Imola platform which is
based on Agatti SoC. Some of Alexey's patches are reworked and sent
here as per previous review comments, mainly on the dt-bindings part.

Base SoC-level dtsi bits are picked up from
https://git.codelinaro.org/alexey.klimov/linux_next_tracking/-/commits/rb1_audio_wip_v3?ref_type=HEADS

Along with these changes, add sound nodes for Imola and a defconfig
change.

thanks,
Srini

Changes since v3:
    - rebased on next-20260929.
    - dropped "clk: qcom: fix SM6115 lpasscc register offset" — now
      upstream (689364ac19e4).
    - dt-bindings/mfd: rework the audio-codec pattern to use oneOf
      with the pm4125-codec and pm8916-wcd-analog-codec $refs,
    - dt-bindings/mfd: fix "pm4124" typo in subject; the compatible
      is qcom,pm4125-codec.
    - agatti.dtsi: fix lpasscc node unit-address to match reg
      (@a7ec000 -> @a7e0000) after the driver register-offset fix.
    - arduino-imola sound dts: mention "Ear Out" in commit log, per
      Alexey.
    - arduino-imola sound dts: carry Reviewed-by from Alexey.

Changes since v2:
    - dt-bindings/mfd: switch to properties.compatible.contains.enum
      with required: compatible, per Rob.
    - agatti.dtsi: collapse each <&q6afecc ...> clock cell onto a
      single line, per Dmitry.
    - keep qcom,sm6115-lpassaudiocc / qcom,sm6115-lpasscc compatibles;
      Konrad Acked staying with the established practice.
    - defconfig: carry Reviewed-by from Dmitry.
    - rebase on next-20260917.

Changes since v1:
    - updated various register ranges as per documentation.
    - added a fix for sm6115 lpasscc driver.
    - updated commit log
    - fixed various style issues in dt nodes.

Alexey Klimov (1):
  arm64: dts: qcom: agatti: add LPASS devices

Srinivas Kandagatla (3):
  dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4125-codec
  arm64: dts: arduino-imola: add support for sound
  arm64: defconfig: Enable pm4125 audio codec driver

 .../bindings/mfd/qcom,spmi-pmic.yaml          |   4 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi          | 157 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm4125.dtsi          |   7 +
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 134 +++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 5 files changed, 302 insertions(+), 1 deletion(-)


base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
-- 
2.53.0

