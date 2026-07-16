Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D3B42BEA6
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211998; cv=none; b=PAvfPg3pH9ffzVyclOGfYjpaaorYwHFxASEFTo3mztEQ11iX16DGCv4OdahVDlATR8uear/iEP+3BER1ofEjmVVHE7rdmK85QoJGkxA40irZSgM4JQNJpRjfu/Vsbl2iqFaQSVueR1tcyXkB+iFbhKR84FynVdjixbo94AHiL2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211998; c=relaxed/simple;
	bh=S7fpr3OXJiC9hT6kjY/96Bc/I1lo5ks9tED3YRO/kKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tPegA9HDgUR0VrqrhrVKtvivxNfLsov/xPx8pCZWgibXLZpwyiWDanPpvroGl2PgYIxQzWLkwd1sX1toI3AXD2akAXliNezUfR9uiwba3Ecp6K3JHyGzuWXi+O35J9rnCVa5apSBAGEuZ/FFX8adJTa/VpkNd+pKXg6zFHyvxXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=geYvBDiX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/NPQjRa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="geYvBDiX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/NPQjRa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJnCX2837987
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eyYNPQ83WlJMGSyeWeGNnucqSRKcwjrbokU
	YHIq8vus=; b=geYvBDiXmrZa1lnE6LglnHjD2YKbjMsALXA8X5IdAs4GBKebgDJ
	QQYzQOhyjgbPO9bndMhyjDsEzpKsPqzV5z8frpdbpuTPMrELNqXwvldf4jazAQ2A
	aHcdIH9SgJLO7OL/+YC2bkdenvlaeIcHpBJ+dLQ0CY++XhDxC9yEvVE1C1QpxvTa
	fMB1tEPFPkpQzrqRRYIIYdOHv+H+61xWmFmcTAyEPYo8NDHpAUbCtkwX5/56dwOD
	xQRxBoQLfjyH85Tv2wqqrQAGIQLp1PaDhCxpGoxIC7KA0RZpBEUI2AFjTreTyxMx
	Dly6xjUXuqOAnizSGzLv0KTYOrmrzllk3Ow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqmc52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:26:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so148839431cf.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784211995; x=1784816795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eyYNPQ83WlJMGSyeWeGNnucqSRKcwjrbokUYHIq8vus=;
        b=W/NPQjRaAFd//SouLpx+HIN+Ptrch8GWVDscsnTuYaS6V+mJ/F9FBd4rpGPos5aG3q
         2TELk6XLkzBjpa0M6RG2BIiuoAu591fvmoODzPwae0jifuiKbL75iZTdbiggHlNaLS05
         VveELGjQ+KYt6KlrBGpWXPzIO71nSF0ffX5iN2uD1pTYmI0vBTlDReMAo09JEcrsx/db
         /KdWgVEDwzd9qpFplc4QtPSm0KZ30YuaNzubj42gH30FaxKWDdr8D7ix+te8UgniQlHH
         if6hUb2oyzgrBQEdZP4LUwXQNCRj10OYMU9sMSO8Ba0FfVM0uVJGkpxztZ4v73Gx+isR
         FkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211995; x=1784816795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyYNPQ83WlJMGSyeWeGNnucqSRKcwjrbokUYHIq8vus=;
        b=MlEElcUBAxDIn1jw2/Ta6b0t1CD82fc1pjUcF8bUoDsp+LUrxlOd8U+OpbXcIinpqA
         KLM7LXX3WjcQ2kdi82MX2c9NlNfo6SkXd3H6q3tnstO3U3JEasklCdo3Zl6mrP7yXaxb
         Gl/Y8ScMiLZWrn4/Rs8xW2FY20gTIqZgDe1/anl7zwpkWBY9H9G8M+asoKxp8ObuIVad
         IKJkwfgOeQfine6pIsAb7fGvblW2DRKF3ho4y8xgLYfv3bktta1zaEIMN9701CNCFWFF
         qzXER6qrXGE73M4pUwj1DQxK9K/t1BGs95Qhs/7vNlUK5+FuQNgE99Zfcj1gGTpvjdAv
         vL4A==
X-Forwarded-Encrypted: i=1; AHgh+RqSqAESL1V2NkJrzLXcIM/JwbVJOIGQIeclV0PoHD58bRbPArgq/yW+qNCi2ktJbLPyEaDNz/UnF/y3@vger.kernel.org
X-Gm-Message-State: AOJu0YzlufAIb/O08SX3JUZ45/AT0r61ZPgt0pHbL2M/HOvqmurOqV7X
	WGmuQy1gxMZjIeg6BbE+2g0qStgHX3HpvhboOOwGypy1vDds66gnDMiiAEuLWiYdqxIcYegPTnB
	F1VeiMihE3shnVzFLmK43hzDEG9CnKz7P9zpg844K1y4AdBUMNUEQUBBueJgAzrnw
X-Gm-Gg: AfdE7clUQL7gXtwzt5hc9peiRjd8Z/fs40qKmfq+lCN4N712MUzhRr4N/zUxvht81dY
	YkKZhM7MipwCWh4/lZt6kUz0QJtXM7u2QRnJUj4Qz9W2oL2jAB8b0VivH8AbU/ekkuro7hF0JNG
	sPT74son9Zl/qp5wkWBHnJsH17UlH8hsGmbxLKH4CKhc0/XzF+t9ni+YQAfXC6Jtrdv0TzK8/QJ
	NQKlhnO4QuGo4WNZkzclRe/ilKp7Rw1lO7VbLBTNJV6fpcVPWHrLHwq04nInUeyLFP2pgQ1Ob2a
	bSZQBUI69YS8AkNAbniSpCdDEuaarTReOkL0S3hIxyon03KqPcsBmj30/7jfW9p23lko92UBTAZ
	q7oYRTfZ6Wne7EoVdXzcerpQfC5YcUT20u86XPCbza/ie1zCVkimjebtWuFw6
X-Received: by 2002:a05:622a:11d3:b0:51b:60f1:689a with SMTP id d75a77b69052e-51e4ede2408mr78943481cf.7.1784211995389;
        Thu, 16 Jul 2026 07:26:35 -0700 (PDT)
X-Received: by 2002:a05:622a:11d3:b0:51b:60f1:689a with SMTP id d75a77b69052e-51e4ede2408mr78942901cf.7.1784211994566;
        Thu, 16 Jul 2026 07:26:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6ed34sm152869121cf.4.2026.07.16.07.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:26:34 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v6 0/6] Add initial device trees for Nord platform
Date: Thu, 16 Jul 2026 22:25:55 +0800
Message-ID: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58ea1c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=avSFmSnnVhJmRsJhiZ0A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX2NYTCWOwIIff
 OlqKtE2eHHVjtLD5es1YTrkG+r1UkfshbXfRCwo5eIlUSjsgqYEH6sYrF37USuRsM7uQ+y9Xg96
 vfSgP+W7A83kWqW0Y2j0P7P1bz1Zmbw=
X-Proofpoint-ORIG-GUID: 98Jjtkbj7e_2zuf9v3tG_9H9-cnk8LpV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfXwLKXqIi8/mgo
 MRO55nVTRwk9Lp2jjA/SDVQ4N+u0AFAN8ejvOpPGev2V/tbj5czdGLIsOfaHTm7tv1D2iGVYEII
 xWlB70boo9KE4xWB55KwNzlIyDyfCCAjTLKT8PoyIL/E1/WuIju6JJ6aEdvbM5gMdD9PyfbsTVA
 ZNiJSj1A7pfrjjkoRgJf2OEV1Q08WxUOp/c2wCEzP8Kbq+YNT/yNL3LYA45Im23C7oNlX3liRiD
 OPNWYZPf5gXRMR3s4r0bf425fmmgvQhu2XygpDl6aNUF0Tq9MN7juke8uPV+U6ywCVq4IAvkz/a
 QppA6igrgqsnWG+Bi76FFAnS5fk5+5HJLPxeXQi0P+/0aW6MD5kWu0nSYGxf7TuJxezBDz5HOt0
 zsTHJujIu1ypr+dd/u+PTodpHB6FFD731IODepNqqD8C1FIdfX3nHB5nhIrMX7Fv8lNUyeOD6sx
 rXqk6lfKBvHFaZ4ocIQ==
X-Proofpoint-GUID: 98Jjtkbj7e_2zuf9v3tG_9H9-cnk8LpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160148

This series adds initial device tree support for Qualcomm's Nord SoC
and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
for Robotics.

Nord includes two variants, GearVM and Embedded. The GearVM variant has
platform resources (clocks, regulators, powerdomains, etc.) controlled
by SCMI server running on a VM. And the Embedded variant has the resources
directly controlled by the operating system.

SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
on Embedded variant.

Tested on next-20260713

Binding Dependencies:
- I2C: https://lore.kernel.org/all/20260707095708.3801043-1-shengchao.guo@oss.qualcomm.com/
- SPI: https://lore.kernel.org/all/20260714120226.1788391-1-shengchao.guo@oss.qualcomm.com/
- UFS: https://lore.kernel.org/all/20260716083313.2367249-1-shengchao.guo@oss.qualcomm.com/

Changes for v6:
- Move ufs_mem_hc reg/reg-names from nord-embedded.dtsi into nord.dtsi
- Enable crypto by default only for nord-embedded variant 
- Add a comment above each SCMI 'interrupts' property to clarify that
  the IRQ number is expected to be updated by the bootloader
- Improve commit log of Embedded variant patch to be "directly controlled
  by the operating system"
- Merge two board binding patches into one
- Rename sa8797p-ride.dts to nord-ride.dts, iq10-rrd.dts to nord-rrd.dts
- Expand RRD acronym in DTS patch commit log
- Fix copyright in RRD DTS file
- Add firmware path for qupv3 nodes
- Link to v5: https://lore.kernel.org/all/20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com/

Changes for v5:
- Rename nord-sa8797p.dtsi to nord-gearvm.dtsi
- Merge scmi-common.dtsi to nord-gearvm.dtsi
- Drop "qcom,sa8797p" compatible
- Add Nord Embedded variant and IQ10 RRD board support
- Link to v4: https://lore.kernel.org/all/20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Rebase on next-20260706
- 1/4: Drop useless comments from arm,gic-v3 reg property
- 1/4: One triple per line for qcom,pdc-ranges
- 2/4: Improve commit log as suggested by Konrad
- 4/4: Drop 0 polling-delay as that's the default value
- 4/4: Name PMIC thermal zones with prefix "pmic" rather than "pm"
- 4/4: Drop 135 C trip point from PMIC thermal zones as hardware will shutdown
  at 125 C
- 4/4: Have trip0 at 105 C as passive and trip1 at 115 C as critical for UFS
  and SDRAM thermal zones
- Link to v3: https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Rebase on next-20260525 and drop patches/dependencies that hit linux-next
- Improve commit log of "Document SA8797P Ride board" to explain the need
  of SA8797P model compatible
- Fix the real issues reported by sashiko-bot
  - Fix unit address of pdp0_a2p node
  - Add missing compatible for i2c15 and spi15
  - Drop GIC_CPU_MASK_SIMPLE(8) from arch_timer interrupts property
  - Update commit log of "Add device tree for Nord SA8797P SoC" to match
    code change
  - Sort sa8797p-ride thermal trips in ascending order of temperature
  - Fix sa8797p-ride thermal zones with identical trip0 and trip1
- Link to v2: https://lore.kernel.org/all/20260519063505.883379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20260518 and drop dependencies that hit linux-next
- Include SoC ID changes into the series
- Include ICE binding change into the series as the prerequisite change
  from Harshal [1] was merged to qcom soc tree instead of crypto
- Improve commit log of SA8797P Ride binding change
- Use label in nord-sa8797p.dtsi for referencing nodes defined in
  the base nord.dtsi
- Link to v1: https://lore.kernel.org/all/20260427023455.236410-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com

Deepti Jaggi (2):
  arm64: dts: qcom: Add device tree for Nord GearVM variant
  arm64: dts: qcom: Add device tree for Nord Ride board

Shawn Guo (4):
  arm64: dts: qcom: Add device tree for Nord SoC series
  arm64: dts: qcom: Add device tree for Nord Embedded variant
  dt-bindings: arm: qcom: Document Nord reference boards
  arm64: dts: qcom: Add device tree for Nord RRD board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 1726 ++++++
 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi     | 2911 +++++++++++
 arch/arm64/boot/dts/qcom/nord-ride.dts        |  240 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  612 +++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4605 +++++++++++++++++
 7 files changed, 10102 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord-rrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi

-- 
2.43.0

