Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E52F546D
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123074; cv=none; b=HKc52lkYMZ3Bhejn7bXM8MQSbO0o394peJFnhZQH9o5RUEyTCKMbisigD1SMppyo38ln6NePLarQxvNY+qSssOTi+DgViBicuEKhZNoncpfoAPbl7UVofL1T6RhUtAUnjFv/Fr9wamq1xp3sEkqIAKGdD0Mv2nyuUDEdudVtZcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123074; c=relaxed/simple;
	bh=4T/4q/GKcuXdMHDGzev5LfJPjRNiNnzaYIn4FFK8R8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aOi0vDY/ObFfNlCvB0Li4UHPnSD6BSn+Kc3MkTsXdo4eKJ9ARu6p9Jy0AKwcZpjHtSaR11IoC31VxlrGLaZ4LCjMRw1kCBtr8TqyyM9ElmjnRNf+/1yHS3gnQJG8pv7CwoNft+/5UmQvPtfSp6oqB4Nc8ls8d0Ne9WoGwlelMR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPkjc+ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/4JaNka; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPkjc+ub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/4JaNka"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FDHvhb3852184
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HjdSK/FcnmoQgdARK7EzP+
	X8SwoN63IAkBGR1xi3pEU=; b=LPkjc+ubl6Wpz42InI2PEn+HIn41VcHl77/od6
	DfC6iZG0tvCP3IgXIu/ezH6VEr/afVwfF16p31ny1fCWxtECsnqlZNwQ1cyenTjB
	g4WSsY93vRimid7XiPqMRHwEdSiTM/dcH1MrlvEdt+wfXoBKoAv0Kucc2Y8E/gyE
	95V3nylq46E8U3C0KF3TOOnxFveu53++TJy7vMOJiRTCsoqy4BZuTnrSrOsP+wcH
	s0o34/Vg9ca7ur1Wk3mmbU3/cqgZsUwOQn6zivHS1Evlrbfg0huS0hUDwcKTh0cs
	hC8FepNEFJkV7YoHETGeIYGSU8pYeHy4aMaqDqfcobNpc11A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feayfg3ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:44:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1c7f135bso41229601cf.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123071; x=1784727871; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HjdSK/FcnmoQgdARK7EzP+X8SwoN63IAkBGR1xi3pEU=;
        b=E/4JaNkaoiCNWVuuwSRRLKY5dE5AB/DK/3OcW9OiPhgnwFxiEQ86N+3PcaPXdRP6DI
         6PXR8VNRQIVsQgOA849prHu1eEMjpKjTcEHuKdAII+i6l8/f/Y8zDbSC9ROwb4MPM1TU
         F4/Z/4ryfdhSPnhtf6Y7hB6JbPBetMwdtrMUrYFvRsSeYotuFeUmpzqYCjBj+VuPhzNr
         +V/28ix8ZivanXIxsS8Ktq3NFebxxODU9udgcndZeKNlgRyG6Znhk001wfBks5ji9tUI
         dXATwRfRvWtqAaJwWZd2uV59vM8wkBqTfzIYvubFUlYe2kZglWLzHnXpMYv309enivVb
         4eHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123071; x=1784727871;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HjdSK/FcnmoQgdARK7EzP+X8SwoN63IAkBGR1xi3pEU=;
        b=Ox9WfPdp9Qq+0jLII3UW9WivAv5qRhlL93cNFDwRzjNRKKiHryWbISJyZHsLI7cfp4
         fcFg/dxS1AfWP5Qkg5KguSydQJYK4HX+yeH58Yuy92xUlTGkqwNpumK72iNfeUX/rszg
         wfJvCw7CXMhOnmJqu++LKAATJKPqEJMDKPGO+5d4wAxfjy3l08piI+AH55uDGlMj4J+l
         DF9anp6U2nbinEqHJQ334Qf39manzFiHAXWb8KYGLTHb2S5Z7fzUCJq0Km0sl0kTzyXO
         hV2Z1eRdLWTU02lFc7abE2hDf95OnYdsp5X9sXCw9sXpciHVSEV4UirIgUhAfjvqZzBJ
         gSvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWaPOJ8E86EnZU82j5FBMWXgJEG44cl7rdNnNiGeJ2xoixgrmvovXRSUPix9oKk4+WzpiEWHv9QtQV@vger.kernel.org
X-Gm-Message-State: AOJu0YxZqDO1IGvhF5xjr2JCJsUpWYJ0d1IlpJm+uWk1FWTJzAf/EzUb
	b4U48pKZmyiz0o0vatUBPf08yeM7Wn92umdbllFgZHPHfxUOMtyg2+lxL1gEACQnNJkmz+chEAE
	OUJS9LPncMsHmTDiQt5Ub5/hbtVPRzAJNbD01uLhnfVNQXga8qPTGL8HhSpY9RKOM
X-Gm-Gg: AfdE7cn8bW/eG1EWQN/YdZ+XWAGcrdJC2G5av/P8sVDip/tHIeCyrHrcTCg4H8HjBfA
	THyUPUnpS+U0O1tTbEqvWkMNucPo6ayMXAsya1lziDlea3XeRrwyHnCF7sZWdGarda/gswjXnfj
	iJ1Ir29Pd+Cu86QoIC/nQffulB/zLuNFELPG7Dtce17CfZZx6UGNAbtUqacUJyzrXuaK/6X6ZKW
	9XShMFt2R92h6eo+jHmWWWAaRgEjmL8Rd6b6Wgfbms/PZ4CdGbqe8ghhUeF60ZPCj8YLJlnaJTT
	FtDTWemYycg8JL1Unn0MfHZSTEYFBzjv/UtFiH1Up5MoM+b+R34gm899ZMvFf7K7R4KAFO6hu4P
	6sqMP53OMKHfajo1lK0VgrBRt2ruEJ0elxKnnnPwju0lH+ETsOasWqbQdzlJpRiBs9Y+lRi1Ie/
	1JtTMaf7/iSnR7aBVRjZbOJbtVx6WivOk/JCoZf4q4N9yDz+q4qRAczsTRIwL1oA==
X-Received: by 2002:a05:622a:190d:b0:51c:196:98d3 with SMTP id d75a77b69052e-51cbf2f9fdamr175540151cf.66.1784123070824;
        Wed, 15 Jul 2026 06:44:30 -0700 (PDT)
X-Received: by 2002:a05:622a:190d:b0:51c:196:98d3 with SMTP id d75a77b69052e-51cbf2f9fdamr175539821cf.66.1784123070337;
        Wed, 15 Jul 2026 06:44:30 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a17d3sm3041215a12.12.2026.07.15.06.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:44:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Wed, 15 Jul 2026 15:44:26 +0200
Message-Id: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALqOV2oC/3XPTW7CMBAF4Ksgr2tkjx3/dNV7IBbOxCmWSEzjE
 tGi3J0JGxKJbEZ6I71PM3dW4pBiYZ+7OxvimErKPQXzsWN4Cv135KmhzECAEQY873L/H/g5NoU
 jeIjGoQ/aMypchtim2xM7HCmfUvnNw9/THuW8fcuMkgsusLUogm1Q6q9cyv7nGs6Yu25Pg83aC
 C/BCrkSgASUdRS1tnSU2RDUUjArQZGgbAz0jXPKqA1BLwW3EjQJwQZssQKNot4QqoUgxUqoZsF
 5Cw04BNe+EaZpegBvv515swEAAA==
X-Change-ID: 20260629-monza-leds-c292e68c9a49
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: NKTkXyHd6lWI1MieyeA53d1TBF9iBC4s
X-Authority-Analysis: v=2.4 cv=WoMb99fv c=1 sm=1 tr=0 ts=6a578ebf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vowN3T5aPRO3JaQcBOgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX20ae025r+90N
 Q3oAVWoPiWKDAAGdB9M0NvFxDsCI0kP1DTUPsBhxc+n9Mlxh6/jWnK9jzleqxTa4u015jKaJ9MD
 ILyMTz0TlkguaS+liObn/m/2nWx/rsbmvhyU+FHn2Cht6eHoDLUcCAik0Uh5hB5sjRhwY3d1huz
 A/Mm3vlCAUEgiz/lcT71ZYXudnaIl/4UJ0GJtgrug4iL4f9t6u+tpaV2t7C8w11wNtFyhyeuuae
 VWuUBGYbpO05MqJlXVjiy0T6i3aY5AGl5wA5aAs/W2mrqTSHr/WwXvqXFDEpJk/M53eIFeyeMh+
 aYYWt3iU5zO/qde8WC+2PM36+BzLv6VnGUapqsiWImePpxRkF97Dvx1C0d1M1Ly1DYKclyqpwY4
 kn+2c4KnOVBCeG4lGrP7ukcvg2wyImjsAMO4Kmrzt4CClMqJbdFcIblADM+eCMDbBM7dxyiqsuI
 mSVlVZ6+2X2JAGIBgjA==
X-Proofpoint-ORIG-GUID: NKTkXyHd6lWI1MieyeA53d1TBF9iBC4s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX7mSmH8mn/PnA
 M0NOR2ewZCIi2Xff1HIlEiNON6+aY/+NuTs9xl3/M5vMONmYj0bIQKkdUU4ZXn+O7k7pKEZymF9
 P2wqTKfbK6hF8AtFOIui3OXwsONpLnI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150136

Some devices use PCA963x controllers to drive RGB LEDs, where
multiple PWM channels correspond to a single logical LED. Add
support for grouping such channels into a multicolor LED device,
using the LED multicolor class framework.

The DT bindings are extended to describe these groupings via a
multi-led@N node with sub-nodes representing individual color
channels. This follows conventions used by other multicolor LED
drivers, while maintaining full backward compatibility with
existing single-color LED definitions.

The PCA963x driver is updated accordingly to detect these grouped
definitions and register multicolor LEDs.

Finally, the Monaco Arduino Monza device tree is updated to expose
the onboard MCU-controlled LEDs (compatible with PCA9635). The MCU
manages four RGB LEDs mapped to channels 0–11, which are described
using the new multicolor bindings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v6:
- pca963x: keep chip sleep/wake state consistent with tracked per-channel
  state on I2C failure mid-loop in pca963x_led_mc_set() (sashiko).
- dts: drop deprecated 'label' from the multi-led@ nodes and use
  function = LED_FUNCTION_INDICATOR with function-enumerator <1..4> for
  predictable per-LED naming (sashiko).
- Link to v5: https://lore.kernel.org/r/20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com

Changes in v5:
- pca963x: fix multicolor power-state tracking (leds_on now updated per
  sub-channel, avoiding wrong sleep/wake state).
- pca963x: dedup the single/multicolor registration paths into a common
  pca963x_register_led(), with mc parsing split into
  pca963x_parse_mc_subleds() (Lee).
- pca963x: use dev_err_probe() on the probe error paths (Lee).
- pca963x: pca963x_led_mc_set() cleanups: drop the extra loop variable,
  use 'for (int i ...)', etc. (Lee).
- Link to v4: https://lore.kernel.org/r/20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com

Changes in v4:
- Narrow the led node-name regex to allow only hardware-supported addresses.
- Remove useless 'minimum: 0' prop, and add 'maximum: 15' in the default block.
- Link to v3: https://lore.kernel.org/r/20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com

Changes in v3:
- Add color to required multi-color leds (sashiko/Conor)
- Bounded registers value for nested led subnodes (sashiko/Conor)
- Add fix for PCA6535 reg limit (extend it to spec)
- Link to v2: https://lore.kernel.org/r/20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com

Changes in v2:
- bindings: Reworded commit message to explain the motivation (Krzysztof)
- bindings: Kept the "^led@..." pattern and modeled multicolor groups
  via a dedicated "^multi-led@..." subtree.
- dts: Renamed node from "leds-controller@22" to "led-controller@22"
  and dropped the unused label. (Konrad).
- dts: Moved "reg" to directly follow "compatible" (Konrad).
- dts: Fixed unit addresses to lowercase hex (sashiko).
- Fixed checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com

---
Loic Poulain (4):
      dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 108 +++++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 162 ++++++++++++++++-----
 4 files changed, 341 insertions(+), 40 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

