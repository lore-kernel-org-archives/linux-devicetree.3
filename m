Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F694D7D3B
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647947; cv=none; b=hvylO2Cb6kYg4lPZNapwkE+yX6Rx9S0w4mXTLNND2CtcBiIlcz0bou7GrfijKekHKqWO6iqqkOH172TqTs9MGcPS+bpEteHCFs8KCACfcLL80FcpMFXlODf+JyIX/4Fb33lYO5VU7k43ciXMrhvVpUBYq+ywb5mDaWizVwxrtP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647947; c=relaxed/simple;
	bh=lFHvKJvyJDv7+zSbwdY8vUIHUfTmZwJrlA3iMdoC4EI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WB9E6leSPtJpoD2RABL69ZdI5YdmCyZqssQ6Zp5PkTa1gFyeEiEbqFrm3g80rYcDW7e3q1BqirYLxOBzfIoMxiUi8pwe3NnKi36PDxEuhZ8bE0xeM8ApZ6ec2Tb6NvexHOAZ9iMcgw9v8dwGJX7cXFHB98RhkoRLZWupFGB7W3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8RDcWYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gf0lBnUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8RDcWYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gf0lBnUk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zb1J1257832
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FUsYLk7JZY0z9QihTm2c/a
	uXCxkRRQvTvHUjHq4NJhY=; b=Z8RDcWYTx5bGUbIjn3VVAKt0bxyb9Ld3LL1B04
	WA8Hak9b9lokaHRAfPIMo3dGeshQB+4P2JcbC+DYq2hD1zxUC20kphZZ3v+QhmWX
	NrjHbPskMLrRR17HWVXJL6Rb72F/+wANo2Zu/XcEPFKkqqgdnnKLltRoV9I2Qhrq
	lXviv3/c+yY8gEohIwNILXTtsvZjA8UfkJ9dFOA/DcXmwZQ8z5HGE5cKmypaoG/h
	1+z7HEbqGHXRwfmHn5BDBmcNRgmAyM2/FNYB5ntP3z2PucnV+tkiDVnoXpsK+isG
	UxrDtZJwmm70Mb0whIHcdylWO3B63XxUZJNpkunq4pt26pog==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgq89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso907893a91.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647935; x=1790252735; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FUsYLk7JZY0z9QihTm2c/auXCxkRRQvTvHUjHq4NJhY=;
        b=gf0lBnUkt6ZRoJEEm8317CFWAF5ZVR1b+l3JM+2tVO8EdD6NdgcpyTRb58+alQZ0fB
         McP+5Fel0zFfirzGrnmcr/eEF7PoQIzqzpOfiXGuKZeM/d0Dh4SJpLx3uv3Mw/h0ukSX
         IGkQkjpROs02D6IpsrhxMrQ9xl88J9ZaqJIgiiRr6u4QdDMDRJeE7ekMUeOkf1ZJnzSP
         gUwv6U+uMCARWa9hudZalboAMILOgvtjvr9PED8tRecTnd1L8bZimMwtL0QwAu9B3Aw+
         c/+324i2dqzn11QlW5RUtwsxz6vMOZJv6DWTC6+XNxwOZsA9b9HfjiWoo0tdXEbLGZ/V
         I22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647935; x=1790252735;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FUsYLk7JZY0z9QihTm2c/auXCxkRRQvTvHUjHq4NJhY=;
        b=Vpa18G5XUe0K6GaD+e8qgljLuCbkaS2mHnMURWQ632jjrcsYyyu1x+fb4Vgvki+5Jp
         lj78EwPRc/sXFbMy5p5giv+cCheKIlfHtt93tIEe61Znxvsyo2Q80SkEfa3utJBWSO+A
         HHsPocFgTou6HlRZpS5JpHsT96FGCeUwPZHEW00f+OOmQnrnzbgk4wQzE3M6aEF6rBd/
         Pmcxo7EUMxPk0rTlL6gJXRTWNlz5avWd6Rhp1EkH8OFy+tJl/G5j1FsYbekcFuOt2zUB
         gBrTesrBE3Dh0j6eMjW/EfFaZ/ss25LasfAvHjMY1xS7m0/9vVjgrcVufmTMjt5YpQCm
         BoAg==
X-Forwarded-Encrypted: i=1; AKwUvBzuPt0Sp9tlKVRM2DBKXOgkp8EsuUAJdthafQ5g0I9QHbfT+tOJ4IdS4nsjGZs26CGsxv6Z2VsLpp/2@vger.kernel.org
X-Gm-Message-State: AFuF++kgNTS6JbvTnaMlVwVk33+xxB9Mc2WEJxNk8D0IGreoWyspcsI0
	1u3cuLsVrUhTmMvfNVxcO9FxvosOKilEJNzhkaj+UL47oqaDKbSz1KqdiIgJmG6oz3by+NfcFx/
	e4p+w8E0daU4qsjOwbt8hFtONsONzPhmsu4qxoChdUOOvKTZwMpQFjr6G0IT1hRLP
X-Gm-Gg: AYBFou39t3EYhkFK6SOzdohM3T9myMksb08+LUQJ4OTS9zOS6OBB+ZRLo4JTbI/GJQB
	TivFtzzU7vqax9/asVgaLI9ZghACnQYh+CmaWETw3FKSaW8NQIzBGN07qEivAflA54mQlkvvUaz
	68FmtGr2HgIRQo4dViS5Wz0xIo0wjgwtdTCBVYKc6sMTDvlcCFAYqZBN4nVC8gke6z+3/xNjXOd
	Y9GJ2rV8D+hBTzf20Hp5jw7VSgyZo8im2Wu+wIGJ6i9g1wH/Ry3awm5RKx418EBqLZLcxGSTvcY
	kEJH6S2zPlKyYtTccmqprjBZBoG7kk0bumWqRj4TTZcOp1/EPSeVfwwAAyCg1ieA+CmVV9IpoIO
	JrDxMjwCdDtsKLF6AFV2WlX16N5UneUWy2Fc=
X-Received: by 2002:a17:90b:3b91:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39e1e380e12mr20735521a91.11.1789647934722;
        Thu, 17 Sep 2026 05:25:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3b91:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39e1e380e12mr20735434a91.11.1789647934095;
        Thu, 17 Sep 2026 05:25:34 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 00/15] arm64: dts: qcom: Move PCIe phy/GPIOs to root
 port nodes
Date: Thu, 17 Sep 2026 17:55:14 +0530
Message-Id: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC3cq2oC/0WNwQqDMBAFf0X23EDcaK3+ShGJcdOmB6NJDAXx3
 5s2BY8D783s4MkZ8tAVOziKxhs7J8BLAeop5wcxMyUG5HjlbdkwZ20YFuvCEJHJaawVFxIrXUG
 6LI60ef909z6z38YXqfB1/BeO1i11Qp6dmVTNEX5G2A1FM9atKLVSXUToj+MDRI8eq7QAAAA=
X-Change-ID: 20260917-root_port_v2-adb5c03a24f4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=7312;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=lFHvKJvyJDv7+zSbwdY8vUIHUfTmZwJrlA3iMdoC4EI=;
 b=gr939+9FXtPlqwLZCC1Y7Uv9PEP64TvtikTtlo/seAEirRtaCmWoEH9UST+I7Ia+Rb4extzE8
 9jYTODX0N7mD8VmDSg2DxS6+SLlu81T2S6Ia7BcMggWZfbUQpIGpjVy
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX5bvbl2nzKfSF
 DphD2FjxS6yJPsLn2VuCf6ToTtmn3m/tD9yTo/tz3/Aj2/7oVOZBh4+/oiHK+w3C+xhnA6XLsSa
 rTQDwXuaF8kGq+ww+MOgmIvFsgU1aalMGciNHNZ8yc2tslpu0fvSF45xVDHL0JKta4jMvpygNHU
 YcZKyqKB/gTAAGgkEdsa/f/uQnO40dsrmZ/3lq6IsuobcxP84Sn/fW6TbnrCyv496BIWlpC4Qd6
 o6Z02BAvalSnlQuuCEK6m8yGkl+B0tJwfJyDdzt428nG7bMM7R8iw6+V3+UYRe828S9dAEEDVcn
 jVteZ6ha6LiFOCo6ToAZCSqgdvJTN8/cpHpX5Zcy3EKD56VWHR36kSYbMCArb3CD6LrmeoiKWVU
 drh7jm2l5DK7M8wT96xNPzfLb9pjXN5wOo4omdKPonS+trLUjZApJ/l/wuxNWCXJGVGY/b8phu6
 iMf1piWoF12lbPSynog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXzZyFDzoVyNRx
 fbUtYu1NWTnlDesVyDRC1iMWpu3jYinXHgOpIRsbFFrQDoN03EkKIZpT5tCWo8amCdmk5H+ny9f
 xbPMw+qc0q/d4ZdLnm58iJT3rrS09aI=
X-Proofpoint-GUID: wDqvxMWnQt8yqgIek7QVkAw7wiqndn3x
X-Proofpoint-ORIG-GUID: wDqvxMWnQt8yqgIek7QVkAw7wiqndn3x
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabdc3f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=kFW3sJ3c6eZMPR0ECUAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe PHY references and PERST/WAKE GPIO properties are defined on a
per-root-port basis and do not belong to the PCIe controller (RC)
node. Keeping these properties at the controller level makes the
description less accurate and prevents clean per-port customization.

This series moves the PHY references (phys, phy-names) from the PCIe
controller node to the corresponding root port nodes (pcie@0), namely
pcie0_port0, pcie1_port0, and pcie2_port0. Labels are added to these
port nodes to enable board-level overrides where required.

Additionally, the PERST and WAKE GPIO properties are relocated from
controller-level board overrides to their respective root port nodes
in the board DTS files. As part of this change, 'perst-gpios' is renamed
to 'reset-gpios' to align with the binding used in the PCIe root port
context.

This restructuring improves DT correctness by properly associating
resources with their respective hardware blocks and aligns with the
expectations defined in the PCIe binding.

Tested on Talos Ride & lemans evk platform.

No Fixes tag is added as no functional issue has been observed.

This series depends on https://patch.msgid.link/20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com

---
Changes in v2:
- Seperate out the wake patches (Mani)
- move pcie<N>_port<M> after pcie<N>_phy (Konrad).
- Link to v1: https://patch.msgid.link/20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

---
Krishna Chaitanya Chundru (15):
      arm64: dts: qcom: qcs6490-vicharak-axon-mini: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sar2130p: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8250: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8350: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: talos: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: msm8996: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: lemans: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs to root port node

 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       | 15 ++++++++---
 arch/arm64/boot/dts/qcom/lemans-evk.dts            | 13 +++++-----
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   | 13 +++++-----
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 12 ++++-----
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |  5 +++-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |  7 +++--
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |  4 ++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 21 +++++++--------
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  6 ++---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |  6 +++--
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  7 +++--
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  5 ++--
 .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   | 16 +++++++-----
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       | 16 +++++++-----
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts       | 12 ++++-----
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts     |  6 ++---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 12 ++++-----
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  7 +++--
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  7 +++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 24 ++++++++---------
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         | 13 +++++++---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            | 12 ++++++---
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 14 +++++-----
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 17 +++++-------
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 30 +++++++++-------------
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 16 +++++++-----
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 14 +++++-----
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 22 +++++++---------
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 28 ++++++++++----------
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            | 16 +++++++-----
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            | 20 +++++++--------
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |  7 +++--
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |  8 +++---
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 +++-----
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 11 ++++----
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 14 +++++-----
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            | 16 +++++++-----
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |  6 ++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 +++-----
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |  5 ++--
 arch/arm64/boot/dts/qcom/talos.dtsi                |  8 +++---
 41 files changed, 272 insertions(+), 239 deletions(-)
---
base-commit: aae784d015003e36c9afa54b95ce5ec160643048
change-id: 20260917-root_port_v2-adb5c03a24f4
prerequisite-change-id: 20260910-root_port-8237b5931fcc:v2
prerequisite-patch-id: 808f3ee81c196022cb8a0c4ff21cf6d55eb72a8b
prerequisite-patch-id: 5cc0b60f24754de15d6b19834811021a25fc3e20
prerequisite-patch-id: e265adeed25e12f519231c6ecb412b394a3e7208
prerequisite-patch-id: 19ab4d7891463df819e8823b90bb0e807b03eec8
prerequisite-patch-id: 99594729d7b713cdf1e863cba09efdc33b8ab271
prerequisite-patch-id: f42c8f6bf9a454d95196e547344e72f0f3816cc0
prerequisite-patch-id: 24e9934ca6e477ab3dfce85c0e3c52c12495fcc8
prerequisite-patch-id: c65bfda6a26e8f63021507d858f926b5bab32075
prerequisite-patch-id: 4d84b7dab673e9db76d48e5b143d9af4f219cadb
prerequisite-patch-id: 60897b8cd4801ac6670cf5dd05bca1d1f6015afd
prerequisite-patch-id: 322ca70304070a26b1cbcadd772f3379d69e5a50
prerequisite-patch-id: a153816352cec7a04706bced5e6a1a1c80d515c0
prerequisite-patch-id: 3246c182419e27e871a6aefeceedd436afe86c30
prerequisite-patch-id: 275632b8a4c7ce3db65fe9ebdb0fc1154f4650c7
prerequisite-patch-id: 48b40ea0f7823a83481f731dc6dc8413672962d9
prerequisite-patch-id: ec76805210e9ae10675bd8c5248c407e6db3f1de
prerequisite-patch-id: 889dd2b038b62b53ee483a96410715753a5f586f
prerequisite-patch-id: 67565ab8841205e5c02f2bf79e0ba08f35753c9f

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

