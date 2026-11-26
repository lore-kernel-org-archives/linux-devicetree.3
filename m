Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690833;
	b=lQ8lT0/b0/x0tULM0ndBVY7MZmlFOQc1r3t2eOdJ7kz+8hBLtCBlMlvR2GNKrh7i5Jkz
	 0Qff9CtNHAChCvPMGdHD3DxsUna2p5z54Wc1LgqLui8vsL4UmP5SQ62K0x9TdeNq5QKMe
	 0boSRfOAvaof22N1zXChcjSO931GzWlAR182PUQ4oV3hCjS6MpxpMmY5MOYD4rVH3IY1B
	 1VOrPAPDJpreg4SWc+ezEZbeECExgZSLLEBLfHNqrOlWblORMaYGMuGN3UhXhYN+Jqvxa
	 XHp3dOOJfFC0ZCZaW5Tq4IT9/XwGJe9FnL1xz35qZ9FWq3axLSo+TV/CUWWhw3gwEOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l5SIfcklw084WTI/zcukrT5r8aWMbpdgCAh8jjCi+mA=;
	b=IQEsFUNW17qi8pKxdh3O9cBaiLMmTEYxLsLa5Jn3abjxvVuigyTn6AMLmbcK532DMTx3
	 H71kkzWIIeRejAvD1FOO76/ZZd/z2A1I+rH7tPTe7nngoCPNftRnpjuczI8Fi8S7O2fFo
	 Pi6l6XTwDydh2SNI8qzHqk+04LW5neNdslGuZsGZpCMC6k7HviT7ZaLq/NIw8o0RjoUxl
	 +KUTe50lxYwlC9Z6LShNYtBN3tRgwvuSPdMk4XMiLnFi8rDR0Y13VtmY/WLN7wgFRWS+9
	 VlPLLW9grom/7cCuu3sPwjgy2d4tELbT9O0QKRMKc6Rx5+/XLSKMc83jCu/8miSr2/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b3/RGVBq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P+xtYVry;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5599606A33D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5599606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b3/RGVBq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P+xtYVry
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXRbw4001417
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l5SIfcklw084WTI/zcukrT
	5r8aWMbpdgCAh8jjCi+mA=; b=b3/RGVBqmwgkxG15ypLBBHxy1hidEDyQoxKEUo
	62hFlQbhy8mk9SXv5I6vuOOCIEuX20A5Bob4HUvh6xBOF18t3NzKGADXASfRwBxy
	wabRNUMOEyBXZunrm9TpDy4HzueBVx2Qx5SE7O2rWupQAVJhp2V0rqSL5c2Nx/yP
	F8rv4n6gfnekZEQqy9yXML5nwbQTJFr+uxMm4Qh6U/f4c8XBGXVAaP5iSptdHZHd
	0CTiyompt23prSSR3wMamgtIKGFcCJJtXkWhqa2vYlC46CzRsEk91AOk5Cqj1kZq
	B1C8T9PnAiZAM3LJlKX1rsDuLyOHz8OVFvjvJcY41QTF7BOQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaumd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:00:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f0381f07a0so70142395ad.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795690829; x=1796295629; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5SIfcklw084WTI/zcukrT5r8aWMbpdgCAh8jjCi+mA=;
        b=P+xtYVryvzT3hPOUP61EgX2ftwcVnoe13r2YT2P4mYTwi5nFndUfhuBdD4NZf8XCgU
         nAn3Mp8bw7KnLGsapEqXBIU6u8w2HOVkfbGBTL9nXUdBKUPojaUCcTcy1f6xY1DOeI2J
         f0XpDfRWK+1AJ11K7u3NmwnKuaqjCt4CRxkhLUC67W+IKI6SmNBpzp6gGEIaQ8VOa+9K
         Gs/PtFSAG3bLNWRnAhtTJjX+ijrFJVuJF4NOAEdc9JnBZz1/NeThHgRI7dGFYMsfcsRb
         F6QlgtHe0Y+3WqQrlem9FL8lTfijhFK1ao+JxSCkK0lrDE+3v8rnW3NkEEqxmn7Y1KVi
         QLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690829; x=1796295629;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5SIfcklw084WTI/zcukrT5r8aWMbpdgCAh8jjCi+mA=;
        b=gbz2auhynmwnuPLsGSyyiu9P9INuz5vvnuqVtTuPdK95pO21V6tfOFknPOEtHIPDXE
         psuKnrExaYoH42EOV0zHPjxsZbJJfFunzTwpLpTR1Wb6Fuk3m8JsRpQriIVafChsTCxm
         zPKCMm1qbtKgcIlUPItEtiOJSC3RaoKsOtm59nMZ8Qg0P4/hHvY/59TeIk/GwaFMI103
         1jeGqS5ToG9DuBbIhD2anHjfI9UGJMxCvYau14rJd1LtmMFzrCPam+klB0te+cwfRXn5
         kxV8MUYPMCn//eGNzJYG4znKAPcetKm3JTVrWWPhCs3ElKxxJNfzA4OfNhjRSufSFt/r
         AhmA==
X-Forwarded-Encrypted: i=1; AL+hErFwjptNSq0VUAzyp3g+cyMjXKzzzIDMaD+FmmU5uFXOR/slt7DoCZcF9nZn4HcwwFF1uj/oMBcSm6yr@vger.kernel.org
X-Gm-Message-State: APuU4Z8e99UNwuSJpAwKNiaucB1cEBgdzhciKkUeoeW+L2gvSa4toX19
	8Uz5aH82/AIoiy6Qv/t5k7S6H8p6iikSn9JrsCtvDy0risC/2uLUQiUb4t9T66uHsWpnzaMpEdT
	HFs40X4IFKJJiED4kQp7bng1uQ7XA0vgsU7dqrkv+DTFjvod+VVOudDUcM8wxYDMi
X-Gm-Gg: AZFdTZdNab3jAeXoBicPybVnXj6xRhuwtrhIXAks8l40F8t+KNfve8w/ZpQ2X5CxEeh
	yKXjqfDLCMSWySLjoL0nvuMDj8sS1qhOUb/S2o9PsR/FYk6KOJHdrWM38CRk4WvB/va31HsbW16
	S4oOsC8sW0XLGfsTmGQykgTdveIfAYCAmuaFGJh/IFQWWzf7zxJPF5iAIu5B9/dERDXwunU/PqA
	5CuN7fM+mSicCCBM8mUSYXQGnVhXqB2HKi8tIqzrt2BMyLSo/8nUu0ycA5+cXDT2n0yTzxe2kqi
	OpalO326fQfDfQ5Ol9ca0/hGSxU95wr/Eitd24JjPDMj3X8Xnv2pKLpsw9giB74LEnacFdEijFt
	t/11+kuhr5wJsHJV/lnxC0AYjtnJP6bm2DSuT8q1qotSnrEAXpvgOXlaA3+K8x6wPlSCtyTcjdJ
	U=
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr174815085ad.28.1795690828053;
        Thu, 26 Nov 2026 03:00:28 -0800 (PST)
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr174814435ad.28.1795690827206;
        Thu, 26 Nov 2026 03:00:27 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm101400615ad.17.2026.11.26.03.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:00:26 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] power: supply: Add SMBLite charger support for
 PM4125
Date: Thu, 26 Nov 2026 16:30:16 +0530
Message-Id: <20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEARCGsC/32OywrCMBBFf6XM2shk8mpd+R/iIrGJBqzRpBZF+
 u+mde9m4M6Fc88His/RF9g1H8h+iiWmWw20aeB0sbezZ7GvGQhJY0uGlcFd4+hZbfPZZxZSZvd
 BclKsF1y31qBShFAB9+xDfK3ww/GXs38868b4e4KzpZLSMMRx13RSGJS6U8JRcMIFpZzQqiWp0
 Nu6b/rQkjWwsC6xjCm/V++Jr7BFkXOS/xQnzpARF3TqAmrkYZ9K2T6e9rpYbOuB4zzPXwUgle0
 XAQAA
X-Change-ID: 20260827-smblite-charger-for-pm4125-d3168a705520
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mfd@lists.linux.dev, Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795690821; l=3185;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=Egbbn6MpPK4SfNFKa+uRss7dEExa4CDRxOxDLWL7XEk=;
 b=MJlKqNEhwCiPRU2v7OBEyMqj7RJreMUdouoo6UPR8Eh/K5j7FyEhbHlS4tEBFLc5v3RN1+1+V
 0bPxMxOHkzcCeIGRFX/tuNQw4LarCCAdvCOVXP3m9mWhmPogIeNFpIE
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX1UiIiTvgZm9D
 al3KrylpDZ4zcqtPu8AlHH9i9r7JL1Yc5BxYLPuWT3KZO2XWPK6zKjVtJRDjRwG8kHHPr/1rKYa
 /3rl7r9FUUQC3D9DseRPfYUBpy9WiT0=
X-Proofpoint-ORIG-GUID: xS5QRIlQ5rMWI4iqa7qH1O1Bvg1nOhjh
X-Proofpoint-GUID: xS5QRIlQ5rMWI4iqa7qH1O1Bvg1nOhjh
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b08114e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DxrESgKfosCQc-jqPugA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX0wZ/QMsv/sac
 KcUJMYV1LmVPgYWH5Wyw37oFY44GdOnZIhgPiDCzBKSPl15qu9Au1vwfiJluWuoQAUBZQFtACKr
 Yrj7PahyjZDaOzQfYE5xI8e3LC/ziIPsQnTPfgZvXqw7u9gPW7YiSB202TBAhQJEEbyRr/aprbn
 PMc5Uo0x31U4QWUTxSD8gsw18Xm4/mNw236J59fnAzzKLg54+2TFq6O/7NFjYDnqa6avlUp08Jk
 fKmQIZ4xKJv1rEdaBI2TSo2UuV56/+NcuFL9H3INJShwUTikeBcn46PeE80wBh69MrtytcJ40H4
 zCzfHQ+swdsqIyPQHqqORM4OqQ2fbHJemvm3os9XPJ8T+NJCjj1ynGpxGh81zpU0vR7xK6nI5VK
 6LYsjX6YKuACXut/9SIp0UD0+QW1v1vCjzRPk68DZFQ1jUX+J3cDgbVbdm7KRsfjvU3UUiVPjS3
 vbhAxYDK/hxDIGMGSWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260042

The PM4125 PMIC, used on the Qualcomm CQ2390 platform (cocos),
integrates the SMBLite switch-mode battery charger IP. The existing
qcom_smbx charger driver only supports the SMB2 charger IP found on
PMI8998 and PM660, so PM4125 currently has no charger support at
all.

SMBLite is a reduced-feature variant of SMB2: it shares the same
SPMI bus and overall driver model, but uses a different register base
layout (five separate SPMI peripheral bases instead of a single base
with fixed offsets), a different battery-overvoltage status
register, SOC-based recharge instead of VBAT-based recharge, and a
different JEITA configuration sequence.

This series extends the existing qcom_smbx driver to support both chip
types side by side, selecting the correct register bases and handling
logic based on chip->type. This keeps a single driver and power-supply
class device covering both SMB2 and SMBLite hardware.

This series:

- Adds the qcom,pm4125-charger devicetree binding, covering PM4125.
- Extends qcom_smbx to add SMBLite register support, JEITA
  threshold configuration, and SOC-based recharge, while preserving
  all existing SMB2 (PMI8998/PM660) behavior

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
---
Changes in v2:
- dt-bindings: add per-entry maximum bounds to the JEITA threshold
  arrays, and a dependency requiring both or neither to be present.
- driver: defer enabling SMBLite charging until after float voltage
  is configured, and explicitly disable charging at probe start, so
  the charger always comes up in a known disabled -> configured ->
  enabled sequence; leave charging disabled on probe failure instead of
  restoring the prior state.
- driver: propagate JEITA threshold write failures, require both
  soft and hard thresholds to be present together, and check the
  other previously-ignored SMBLite init register writes.
- driver: add watchdog-bark IRQ wake support for SMBLite.
- driver: treat missing battery info as a probe failure for SMB2,
  matching the existing monitored-battery binding requirement.
- usbin_v is required, and channel lookup errors fail probe.
- The USB-plugin handler checks the charger-status read and both
  charging-enable writes.
- Link to v1: https://lore.kernel.org/r/20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com
- It depends on charger type detection mentioned below.
- Depends-on: https://lore.kernel.org/all/20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com/

---
Raj Aryan (2):
      dt-bindings: power: supply: Add qcom,pm4125-charger
      power: supply: qcom_smbx: Add PM4125 SMBLite charger support

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    1 +
 .../bindings/power/supply/qcom,pm4125-charger.yaml |  119 +++
 drivers/power/supply/qcom_smbx.c                   | 1081 ++++++++++++++++++--
 3 files changed, 1089 insertions(+), 112 deletions(-)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20260827-smblite-charger-for-pm4125-d3168a705520

Best regards,
-- 
Raj Aryan <raj.aryan@oss.qualcomm.com>

