Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27513033D8
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328123; cv=none; b=cIKpp+f574dhlFbB4QYbMGAc/U+02yW2xb5T8mC5ulkwtG0qBMRqYbITa+BcGe1w49j2XYB4MYf7K4Wid6XVQAisHrppu5qI83nNxuBaj2BsIXJFh/NG+gA8eUQWRusOrY7G3KL/yx1y8B4rp71oDasi9EOamGN6EVqmmL33498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328123; c=relaxed/simple;
	bh=VwWzfAW5Y3rtN94V8GT+TiSFlqqWwD4sFhgs5ySHZ+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SMqTA878hcUy8PqTDgKzHAFaawbo/mA4HOpRVPMYLHQ+imYc5IRlfDoMXZjSsz/+nMJokmwyF3z33aNhbc4t+m6M5QKNuFAyzulF0PMFKY/fnTe5CkZDC8WcPGXmwklbv+PMky+XauzyZuloZosTBUQkMPtyIrIDS96P47lrJ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBmqaRTr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnjND9mD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBmqaRTr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnjND9mD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj2Tb3860980
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bcLj/8grHtyEunak906CP6boFR5bOdJvWa5
	DwUNzQYA=; b=YBmqaRTrsnQ4Ez0Z227rNEchLw2VBUhRvOb5VbXVwMLU7xTFGpH
	Dy9u0Aa33RqjJyp1zb1/31/q2Xo3EPQbSPz4XlODXxNsXqs8YKozyQ1VUS8uCB0B
	KaABOIyEPB8ubunVIRvskg5CaDMqBXgOG+njg94mvmc5iVQEjomyUF94DMAi1gEc
	tKVV0cJwSqD3fBsINMxh2ZkWsU/1mSAG0z6zhyrP9C37/f+piUTG20oq+U+myvQT
	Ke9F/v47H3vZ22r0YdtGhdoMzB/qI9yPj4z8TLqIfn5X/jH4FCyQOk1TOatfUuv6
	8vjhVtdCvRr7IrEwRBQ6P+xRaQ/iEYyiowg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq2sp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:08:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8453cbd38c6so1284700b3a.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328119; x=1782932919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcLj/8grHtyEunak906CP6boFR5bOdJvWa5DwUNzQYA=;
        b=AnjND9mDRqwhQCATsUkHaH24oblxUvFqjYWDNWzjwnTpXcpR1OZ9RpTER3WbfT1Jap
         DT4Wkf6dUX9EgfJPSb5/BWwAdCOybN2j0rinkRPrpgFz4LSc3EAJeq+n8nsL3TxZFtFr
         lmWDnln/3IZGMlwvlmGjv9h8FVq2Cuh5MeY7DSVEThJB58YdNsJT02VtkSPkS8KbSP1E
         Jr6nQp62VbG8K6aRkEI1uEA7GnzzRnXvuWtqAwajQozFx5wO0ICRYQDx4H6a6OU56jNQ
         jsilXtvyvgEcFs5eVfVPoZ7FgeEQ2+9hTKBIgUQQAS2x/rLPNafFcTN2sMag88VWHkyB
         D5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328119; x=1782932919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcLj/8grHtyEunak906CP6boFR5bOdJvWa5DwUNzQYA=;
        b=qsSdONh4Cw5EBNNpbC8DzfiZ8929xhEVO2rg4l7VJfC3RSnHVp7xBMvS1Qfowtp/Uk
         PQ/MLUlHwMsXBP6h9qhY7Pou4UIXqbeQwgMz0kOJtvOLoHvOKv8tOObnYam/DHx6P67u
         c6fW1np3gu01Q8MtnMal8259Mlew6ssIBlcZ+nfifeXcq9We3o83exyZEErJK+ewPr1U
         SWH3BtlT820CZ9/d63FtvCuhu8f+8mECQWvvrkq1HEcVsPzoxWc+0o9SwKRcmQQ1x0lc
         fffIFA+1j35jGQuZA9/lyvrxcaRfH34Yewt7QiIPOCqZ0pM52w/kAQ6ESiKyNEl8sjzl
         f6Qg==
X-Forwarded-Encrypted: i=1; AHgh+Roq+nlr3jmGM/6PBvwaZbd6BLZz6VH5RoSHJFTYD/XQszhxF5elVUVoPxg5rY5HjJlSscVZ8/jbzYdp@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhuEfCvS0sRZtMRpbaiowDHsIhOb4HTVAyy0lSBnuaJrjHs46
	OF2mZqRCHZRubW6w7UfgcLz8ujeCp4pjdomajz6sGTPziMxSjJ16AECBghi2n5Z5wKmvOvkeRzs
	jzQmZ3ZidB/WxloIzBnYJ1l3WvT6Mdkfs999d9FEgxoLvwWOQUAHrKRzdU0F2It1F
X-Gm-Gg: AfdE7cloWGlaiYiK2BgJK2RYGwgHysJUx0LMnF9QcjOTNu/uMtDuc7m9SkOty342suB
	URZuHnIbux/fxjKQNgjhun1Ujyxxi8j5Qdbn3m4267FFeoQOW9v+U5wXPmClZ3VdSlIF5HT0X+9
	sZhUYQQTl+akAZkM+Xalqsf2rm+aS8BctK4nKYJWt8oZd/UgiB3AaYt3j/I3+ac2ojGfZK9qo9N
	96U9pWltK8E28z4m6xRGpcQVfz4s/ZFsC/9VBh2dfQ2e6I1pmnwrZwARGGUhdekriuhfaKfkGdC
	6OI8KTO/riwwWrRHfY29+LUQ+Knd23RlzKgubrJrFeXgfqN95ZLSQ/9qBQL6MWtPzvUNOmmZA4Q
	jRuT5XM/fJyAdxB5eJn9BGlubrPhP3RMQlHz4wQ==
X-Received: by 2002:a05:6a00:182a:b0:845:2f67:a0e6 with SMTP id d2e1a72fcca58-845a2ca7ccbmr5417313b3a.46.1782328119303;
        Wed, 24 Jun 2026 12:08:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:182a:b0:845:2f67:a0e6 with SMTP id d2e1a72fcca58-845a2ca7ccbmr5417279b3a.46.1782328118722;
        Wed, 24 Jun 2026 12:08:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:08:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 00/19] firmware: qcom: scm: Add minidump SRAM destination support
Date: Thu, 25 Jun 2026 00:38:11 +0530
Message-ID: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX0QeDuxoyUK9W
 U/CV0zl+FkOPp9MKrotDKpcun9ZpIH5hce3URQsypUBscRrzL5ZKa0FRhVxxg092dp5w8prsxs6
 NcX5rHf7tp1mxgDPvfCZPwkT0HWrmcU=
X-Proofpoint-GUID: ZvPtMxTKf6ag5WcaSQvZGOQHFVN5WZbC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX6UQ702yzgEV/
 XIOM75Myr0RH/lw1LOnwHWno3EyqrWtUxtcjF83tG+aeVmZZyfklA+wv6tw9hfBj7/XmENQFwhm
 mmFcwyOVO6be8dXQhUMHJhC008UtcXzn/Jg7NAd83iy2ZFXbWu2/Z274lbQdmeT2HdUamNczw7P
 xmF8gQ/5K0MPkclOr4PH/ZFVoiuXqF2BoaJwm91K6pxavoWBB7VTx6hylr8bnMS5oY5NSKvhhls
 bHiozPA2y2UXD8kRk12dWTjrnQU+iFfxfGpTJ4ppuIUT3DOhj9yb/4OOhk1dOm9UixPbZQecT+w
 yJgnJAv2CWJHWHnHY3IwKawcblhsoiegewzD1El09cpPRswczFVXrJxYwh0L7rRbQumnhfvFwSZ
 Dw9MTwjDXb6VoYzyFMbnmVgVYZRpRA==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3c2b38 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CSD38U4Wc0CwKdJc0hQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ZvPtMxTKf6ag5WcaSQvZGOQHFVN5WZbC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240160

On most Qualcomm SoCs where minidump is supported, a word in
always-on SRAM is shared between the operating system (OS) and
boot firmware.  Before DDR is initialised on the warm reset
following a crash, firmware reads this word to decide if minidump
is enabled and collect a minidump and where to deliver it:
destination (USB upload to a host, or save to local storage) and
OS is expected to select one destination.

This series wires that mechanism into the SCM driver:

[1]- The SRAM word location is described via a 'sram' phandle on the
  SCM DT node.

[2]- Add minidump-sram pattern property for older soc which supports
  minidump destination support.

[3-4]- Trivial change for consistency.

[5]- A 'minidump_dest' module parameter (default: usb) selects the
  destination.  Custom kernel_param_ops expose it as the human-
  readable strings "usb" or "storage".

[6-19]- Add the support for Kaanapali and other various SoCs.

Change in v4: https://lore.kernel.org/all/20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com/
 - Refactor commit text for 1, 2, 5.
 - added new commit(3/19) for existing  issue reported by Sasiko .

Changes in v3: https://lore.kernel.org/lkml/20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com/
 - Addressed some code improvement comments.
 - Removed example from scm binding.
 - Added minidump-sram binding which follows qcom,imem binding.
 - Added some more SoCs which supports this .

Changes in v2: https://lore.kernel.org/lkml/20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com/
 - Remove the restriction on the binding change done in v1.
 - Remove sram-name from binding.
 - sram definition is introduced and merged, so removed the refs from
   v1.
 - Minor change in the log as per comment s/find/get/
 - remove reference of sram-names
 - use minidump-sram instead of minidump-config.


Mukesh Ojha (19):
  dt-bindings: firmware: qcom,scm: Add minidump SRAM property
  dt-bindings: sram: qcom,imem: Add minidump-sram pattern property
  firmware: qcom: scm: Fix missing smp_load_acquire()
  firmware: qcom: scm: use dev_err_probe() for dload address failure
  firmware: qcom: scm: Add minidump SRAM support
  arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm8450: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sa8775p: Add minidump SRAM config to SCM node
  arm64: dts: qcom: qcs8300: Add minidump SRAM config to SCM node
  arm64: dts: qcom: qdu1000: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm8550: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sc7280: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm8350: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sc7180: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm6350: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sm6375: Add minidump SRAM config to SCM node
  arm64: dts: qcom: qcs615: Add minidump SRAM config to SCM node
  arm64: dts: qcom: sdm845: Add minidump SRAM config to SCM node

 .../bindings/firmware/qcom,scm.yaml           |   7 +
 .../devicetree/bindings/sram/qcom,imem.yaml   |  16 +++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |   5 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/lemans.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/monaco.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi         |   5 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sm6375.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi          |   5 +
 arch/arm64/boot/dts/qcom/talos.dtsi           |   5 +
 drivers/firmware/qcom/qcom_scm.c              | 120 ++++++++++++++++--
 17 files changed, 201 insertions(+), 12 deletions(-)

-- 
2.53.0

