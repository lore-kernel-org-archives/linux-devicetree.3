Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD7444BCB5
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520347; cv=none; b=UNFwOtxfa+X6heAkI4TiFyK0NbsgjnuzqPwEeOiB3+8Ex0EbIOXsLxsC39YTES9TyYDZoSPSyKEhXipwj/f3imDmkKN3ADTFoH4pLIpqQ9z0jYBoFUIDBo7Chw30Y5JyXbaLDNqxXHajD18tvwod/5Nl6NE9dgAUIgwxJjQzVgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520347; c=relaxed/simple;
	bh=D2sAHGoeZqQFctpwP5qoYf674QKPbhInAf6VDEiYhAM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TW4BbsRbSkxzc29PbVLanl3JNfSUAG1lC0iESVl1e5sKnfPVjzBz8lDNGCa1R7ditj2PvewRboJ+0jxIkdH2A50ZhYeomfURaVUhGSplgkywlkhR8AaS9NwPyEmK2XUNK2yBbHsv9riQ3wqnh401DUFeq3FlQSvIWEdQIXFtXyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrRlBi0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTkoDNGt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrRlBi0h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTkoDNGt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3LJc2579475
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OQ1iP1u0PkKvFv/dSIZu5A
	aQDlJXSHVHnEZSWYIrLjc=; b=jrRlBi0hsZgndvDo5951y+mVdN20Hsmcw9GYkk
	wgJJHrHeBBgmXn6XmjzDHa/Com29z0uyk/LtnRyf7LyyKIiuNLrPVOE+x86fPQXh
	hp5SH7ORdvpWUYHemBGQhU60XUgzeFME6uGN2kHxxWlIKFteLAh8/WprYe2RHtFF
	CGCn918Oo7wM100fqGLxTdTb/Ty7svWrscLR6G5mRXSKyp3S17dfGdSBA+4c6lc6
	KruIqjybbMTxl5uJD/pPVQCD7QJA+5czNsBgVHtNByo1hdqxSxaiXPSHA6YOb+n0
	HGR4epSCbl1QpNkMvFKH6IFfY14C5rxFFNkK8goHHq6Tp0sw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gb4p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:19:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-736e9030d93so658001137.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520344; x=1784125144; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OQ1iP1u0PkKvFv/dSIZu5AaQDlJXSHVHnEZSWYIrLjc=;
        b=ZTkoDNGtr8eDcHCmnmISRPHbmJzlJUuNdK6VEJuo+kHEdSSf4zVyVcPC6rPeeDCVnU
         hD8QAX37nNXEqsVeu2QsR8FkYIJTbUHKAC0q6pEUfUOVY4BTB0eeYc2LD/DaRbqql20g
         lXFVSNK5j7SH9LmeuGhVD2QgTAsf5bhWDbmByJM548OBaC+czyrmJ/WtUBjWEA69h4Zs
         emkaKUlCvHJUsl1ei65Nu4iVK+Srkr+d5peTVR66QLU0+/Nd2fAtm5WUj0kuHzP0gVXl
         +tHizN/OtOhydSnaZAF4vDfm1bziteMyIXmcBn8n2ng4AUxLN8Dac2R7MRzRZjXdWEEA
         GUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520344; x=1784125144;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OQ1iP1u0PkKvFv/dSIZu5AaQDlJXSHVHnEZSWYIrLjc=;
        b=P6juieWUQ7mBfJOCHlULJv4ko+Alkph+g6LT7SCY7mSbDHJL0+wWUXyeQZIRhhctyO
         o20gKQdWtVvAEvc/GGucaO6DsUfAuiwmZzIcgCtBb/fcwFGip55n7mBSqN9iLMoIm8OA
         3hCCkjFk3Z44eRKdrdaTkGUL/W+ZjDBPZe7gO7b/szYBtf0KjGBE7w042FYgTXjOb+g7
         iDAc1xOzTlx0X5hLe+QxoiAtSJeFmTLDPDwd9mapiGuo4NuOyLBv+hEN0FMY+8f9mmLJ
         x/KQU3UOmpzQfCWpYrqH+qAKz9WYUtMLBDqovEvMMqqZWajXvMEUhENBD5to3Rh/z5aw
         cZag==
X-Forwarded-Encrypted: i=1; AHgh+Ro/+wflNFN8F0sChT5BGB7lLej0XVbZuWtbODXqzQZhRhv5XLl8/i9q0SXYGhVbRqXNJYqHIeOMi3/v@vger.kernel.org
X-Gm-Message-State: AOJu0YzBEOgjiywSk+bTcvBRdr37Is7efsFaPxHG4sZYwQUDv+CfUhHN
	TbxLrr1Qr3k0ZmvoetOEm/RoKRFC+Ocjx8tIB0HIMwkZSBIZpKgoYAIPpZIZIW7Iqj7yV+5YXej
	rJoq9Ti9qzwsqXyhslrnvd873vh7QIk4W/x5z8o/mPc98DrGtgVUD3NcYYBghtz6UQYb+oFAiXm
	s=
X-Gm-Gg: AfdE7clMBNieppnKH2Ite8cMsRSgEuTjhvW7IWHSXXh6DcX5lqOlM0hqr6GbDSdySj2
	aob3RTY9RNxP9Vm0UGyxCXGkJHdU2ZBaKlFZFzLoxVtw0+JqdlvCsSSigj1HH6q6QN4cJ3VNrw7
	SB7eAd7QotazoyBdCaugue6KiruQO088rBBEcXEKvQmgzD/6lZxpmFVm3BChw/42B7Oy209QAn2
	cxW5aAsUS7Cpd1b8z9tYQAH6gp4erTCAPNTS4jvWebdGJW2plNTs8Q+Gv8INY/G3xEmNwWhI4nD
	Q08N+l0o/9wh3J0DHtge4cFi4xieJObrcAj2MA2+n9BuGlw+O9COD/DLMNNpdHLgRgSN9IZKkdx
	kDS5USBNQfVOVurBEbtgVCT4mYTanpOemf1Ga8Un2cOApZaEGwXCgx1Nu4WOxce5U6QUAG9eCs3
	xoRYFh2ht/UPeQ/GiyZbeD8s/N/VgQ5yB/mFCHPgFfcj5brKNSIPsxMz/EWJWdhm85o0Eh3phmE
	1RVD1vUL65FFJDPTVxA
X-Received: by 2002:a05:6102:5486:b0:738:472f:2cb3 with SMTP id ada2fe7eead31-744dfff1839mr1525701137.8.1783520343814;
        Wed, 08 Jul 2026 07:19:03 -0700 (PDT)
X-Received: by 2002:a05:6102:5486:b0:738:472f:2cb3 with SMTP id ada2fe7eead31-744dfff1839mr1525656137.8.1783520343329;
        Wed, 08 Jul 2026 07:19:03 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:02 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Wed, 08 Jul 2026 16:18:59 +0200
Message-Id: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFNcTmoC/3XPTQ6CMBAF4KuYri3pX1rqynsYF6UM0gSoUiUq4
 e4ObJQEN5O8Sd6XmZEk6AMkctiNpIchpBA7DGq/I7523QVoKDETwYRmWljaxu7taANlol5YATr
 31ilLsHDtoQrPBTudMdch3WP/WuyBz9tNZuCUUeYr45kzpefqGFPKbg/X+Ni2GQ4ya4P4Cobxl
 SBQ8LwAViiDR+k/gvwV9EqQKEgDDr/Jc6nlhjBN0wcfvguSLwEAAA==
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX3Aw3ucl4Qhl1
 a/TsV7UJCioI3X+bqPeaX3/3eQpvQ9bQx2uYqRqiG53uJo3/b+Y0IqckSaXgeUNDyZWphKnE/Xc
 /tTyhBroPZLQrcXutfukzv96pENwO9Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX//Mz5yb4ojzc
 XTd7LqESOi7Zni2MewppCNIqrN2H4MJ7PmRfiX477Ai165fu0BXcEFYL0xIunDj23yDwVQBU+JE
 hjhj0GBryL/QNYOqk5Snxnb/YtCrxPGOomnwcSZTaqp75wpgffH2ooxb5sguSCzLKzpcgq1zq41
 iuT3aaLy1IOcS4C60ZyKOPABJZF7/KE7GSOxMuklFui1s43zj1GsFdK3FXHFcnR54AJvPL4AQ3T
 wa2KiS8EOXrteT/65dHovQYcofONUP1wKLs8oGfacyT0hKn5WmNR8Eua8hWieLCqTLhizduYtD8
 pqPr6bj1/+ULwOx5N5m4C3NgfUx5CXJhrnaO8P1I2AARJZKy5LtZma8ixVzKDSSQB2FAiQqDcTB
 TznyfXp4NleTWcmA//ux3EGlk5tSMst3JJeD30aTs5yMpItayF8FjgIDEANOc0nEahUDaCjzkvN
 27w1XAKnL3vUM3WYxJg==
X-Proofpoint-ORIG-GUID: nQ_QlfJgErlnyzNOF4YD0LGvM3d7gidn
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e5c58 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yzvYhh2-rlWI4r5pe9MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: nQ_QlfJgErlnyzNOF4YD0LGvM3d7gidn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080140

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

 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 108 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 126 ++++++++++++++++++---
 4 files changed, 323 insertions(+), 22 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

