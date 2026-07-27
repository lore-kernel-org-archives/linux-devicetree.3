Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9047440DB49
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164082; cv=none; b=OJHIeWvqfeK6Z9gm2VoKDf2DNlMUvATSDM/Coe9Gf5bdDl2DwllZQwVVgdRCGHIgDbpp/aWtjPC3w8GBpiuO5mM+JTJ0UVx+fBmo/6skoMrBxp35SlhhknbgpeXV5Yn91/Y1kXRsk47N/OBepz3Xn1CQhU8NnEPiKgcOQRvnGfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164082; c=relaxed/simple;
	bh=xXyzJdB6YbkE/YtuRRtJ751/jp1klII4hawODy4l0h8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V0e8oQV9LRmlva72DbbX8BEaGG9LZsgNFClDUXb2oK3n/+XDpPXRSFQLoUY/H5oxYC7P+WkDDHs6k2rPUbfFpdccKFTYQVDEzNM10nBF6Bh2MTDIcG0LIh8gEG2fkcTyjKuhWveb8gY+iVbNVfZOgH2uiQjtA37d/PUfod2dbYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaXkVkLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LltRhTwI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaXkVkLy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LltRhTwI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDldil3414105
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yzqSchz4Oq5EuX/YsRclpV
	0d0k7mwwAwfJEMLNIbdkg=; b=JaXkVkLyEkv279PkIphyionoeFHvZ6mEXm/pyP
	W77RrM/ci/g5hKgV1uDoe6509gzJhULgICWNq+PsPP4zer++r63lxHLqYD3CNad2
	F8Dza3KbIL/n0PDL8WDwd7NjJwvYpUptdLb2HekFu9sE5P+HZ398uD1wVL4SBhkE
	rYTqZBKxhN0RiKJaQ1zRqEfm5Xbr6oeaGqcX749KgovHtcP8oizYctaLIJ8Di5Nn
	7yH1YTIds5ZzQUa8Jcy/VMH3eni0qJsCLNHv3XPpzVpq8b+0nXee4JN5iSWFV/Zn
	8wR+vgKJyLxLrA3QyIUb08mii1nvD66ZPWstJjsyVJyEqaFA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v696q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:54:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-529ae8e96e8so18944751cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785164078; x=1785768878; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yzqSchz4Oq5EuX/YsRclpV0d0k7mwwAwfJEMLNIbdkg=;
        b=LltRhTwISgYOf6QzGC+0YKOGkICkzzRcDoYzcXUeKzkWvowC2X122RSFDsP9Ur8hQx
         EfQLPFIr27QTn6HxYYuj/h0jMoc3StozKqWWiVQI7BvjDi1B48LnCc2ZfdSHP9RwR2MY
         iQ3ZcAz2XSS6oEl+lB/r2bOy9OT0w2p2A3BFZ+Y1+4Fyq8/dAmUSu9Pzb0E6HzZv8m/n
         HTBzqjtR+EqZ5xDHS/7d72OymI0clojKGbkEJpKt5QEE+Une/ioYkTJOPlmjhmCmxmFq
         6Tlw5Rvs7/+YmQHi/XjsS7dTuEn1vrWofsGmMO7A6p9CNYeyfwLL0JTBSzZBPm1axPBD
         TacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164078; x=1785768878;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yzqSchz4Oq5EuX/YsRclpV0d0k7mwwAwfJEMLNIbdkg=;
        b=H0pgmcIl3UNC8RREoN+HHt8h7Q9fdJi1zKrlUN7IXZbZht+2hXEZamLFAa5EwAmhha
         XLCrhLvBeE0JOhmqzQqD4XF/MQ63Ho++YFbMWnZYtXAEDfFNAe1f0+tpb00LLnLLGTiT
         g/8xJHuT9f+uSqI63wXUX2dXeVwCALKWBk8faMCFyv7fmW+Dx5bmJaf7XG+9vxN5a02p
         fOhJGi9NeHZIlnAl0u3pY3CgK8vozLrmvdkb+J6pb83uCmUDdddkH5pH/hN7AXjrdYEi
         y/tx8AYESYtIs5RKugPOncMETDMlXVC/Aiwd18/70rFeWAwAZxJ0sxXc8saYIMz9GOrC
         86eA==
X-Forwarded-Encrypted: i=1; AHgh+RppEN08dxFEiqrJtDfkeKGwYpq51yDLhzabG5E/RmL8eF9o64ajEjh6M7P9pUmmj3ciCVz0qvvOVWkP@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJjCV78i/uVZ8QL7AIPTnhf73K6Ae1JQ5KHkBjfpmCfb33MkL
	Uz43vGo938ptSJr8nUHmOApDnJh4GVDLNQ4lcnWFgX16mUeox5GoyTmiaJU8pCNBRN/tJbKptMe
	FU3ym5dGKUL0QuGgw8rPuHe45PtuU10KQv/eCaFpgbW7dfejxI4G9HKMFKJzhwagX
X-Gm-Gg: AR+sD13aBQRzk6DZGWH57AZUdUnIuwLcfrMYao5ho7MtPoR2TGHjjOWQYJDAEVTPT48
	irPgxv6Q3mKFaRWeJuDrvqCD2LS4YThD1KiRpE4GGO47LbM/1if9Iu6PpBmNoIAeiSgXcGPrhl6
	BrGz1kOWvfSGd1k4WJQqcWEdDcfmm14r0PFyuaVXu+RpM+rZ5rRrh1D3Lf3CQfx1pSlpfdcIagy
	3rZ2Dax7oVYCMgThla8WhL9Ha5ZesxKZHfNmlHUaKnjjN6aCJIYsFkuDZVB2vpDbHTr/3CZyb4e
	SvqgnDnKl4DUVn8/T3Ut5n14uQrGOstqEVfCYZx/Ag+RfEE1tbAtbdXf0Kf1rl03ZxWIjFRDFSG
	BctzbUowOKHrAnMHfq9iTZ5Jz8ZFEEMD3JTTH74ZeBxCvg468Y1lkq2NveAkysiTk22+vZh7fiS
	UcClsRUy0WqjUczJx9jLxUCw9djhLKdAc/CiWXrUAOZzTTZs33+QQI
X-Received: by 2002:ac8:7e85:0:b0:51c:f3:34e3 with SMTP id d75a77b69052e-529a84c3aefmr88731781cf.28.1785164077467;
        Mon, 27 Jul 2026 07:54:37 -0700 (PDT)
X-Received: by 2002:ac8:7e85:0:b0:51c:f3:34e3 with SMTP id d75a77b69052e-529a84c3aefmr88731251cf.28.1785164076769;
        Mon, 27 Jul 2026 07:54:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm3027582a12.26.2026.07.27.07.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:54:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v8 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Mon, 27 Jul 2026 16:54:32 +0200
Message-Id: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAChxZ2oC/3XRzW7DIAwH8FepOI8KDOFjp71HtQMYWJGapAtrt
 K3Ku4/0siA1F0t/S/7Jlu+kxCnHQl4PdzLFOZc8DjWYlwPBsxs+Is2hZgIMFFNgaT8Ov45eYig
 UwUJUBq2TltSB6xRT/n5gp/eaz7l8jdPPw5752n3KzJwyyjBpZE4H5PJtLOX4eXMXHPv+WAtZt
 Rn+Bc14I0AVkPvIvNR1KbUjiK2gGkFUQejo6jXGCCV2BLkVTCPIKjjtMGEHEpnfEbqNwFkjdKt
 grIYABsGkHUFtha4RVBUC1yC91ymKsCPojQCyEfT6Cw6dEz5FZ80TYVmWP/W+S7A3AgAA
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX4Rm33XV/jnW7
 0+s/HOQ8hvGfpshG3+JTFbHQIcIEIVv7qC+StbCbrTsicEqQ4mYXpoFd2PZl3w8kAyc0b+fPnkW
 uvnkY1c8WyVxyhVzxqCIm1bwykT/1X4=
X-Proofpoint-GUID: AX_bt5AQx4_xKIgykncdESWKNNU2NR_1
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a67712e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TplmsQoH72OTL2-p6AMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: AX_bt5AQx4_xKIgykncdESWKNNU2NR_1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX30ZCMEf6iB+O
 sDW7a82NgQdzS+j3esU6TwuuMhRJ9OsBWlUH2UngiNmNIXQP9Az7nkJpMFr68kn16/oAgbHkYHD
 jNqLPd9WI59EMSmTvzOvHamg1wQj6pnH/kNpTx0SZ2BR5fyCPuG364LMxYBQWTG4z2QbnqqREDe
 dy15FOXzR+biLThVBnQrUBaXTcjI/Ti+ycnGVKCln7GLgXm6p2KpDM38UoyIBHKdYHxNPwAHA+O
 pMkClu5egG7O0jG3lPg+qGUgDsPyUiAJ0CIfb4Pr22e0GRn9Z2PbhWB3CwRmiUhFuBS6epeNQx2
 Moc8E/AoJZEqvVhF4Ym62pVSNQ33UYvH+Y5he8iEA6GdCEbVdr8eoo82lVGlWCwH2u+i398Tfvh
 KWFYY67DLVL33QMfpJaLKt6yeBgN3d/JDnK7SbVvHjZMQsRysbhSxeSH1mUHSs6mdQONid3FwiS
 f3PWx7ADRnTuz1Ew7OA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270140

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
Changes in v8:
- bindings: fix indentation in the multicolor example (Krzysztof)
- Link to v7: https://lore.kernel.org/r/20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com

Changes in v7:
- Pass the channel/led_num explicitly to pca963x_brightness() (Lee)
- Drop the per-iteration led->led_num assignment in pca963x_led_mc_set()
- if (ret) rather than if (ret < 0) (Lee)
- Propagate the real error code from the reg property read (Lee)
- Comment explaining why the global power state sync (Lee)
- Comment describing the is_mc detection heuristic (lee)
- Reword the init_data.devicename comment (lee)
- Link to v6: https://lore.kernel.org/r/20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com

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

 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 108 +++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 189 ++++++++++++++++-----
 4 files changed, 361 insertions(+), 47 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

