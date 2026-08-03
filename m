Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C1C3FFAC0
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756409; cv=none; b=qzDM4jqsw05WVYgptjaicG4v+6dF+d5zxiL6iwClE69AQ7E37DeoetvObR5esK7h5hLPqbUdmVbQvjuK+Ff3lg2OZhF4udqR0DxFpGOgpdD9UKJD5TQyqT0roYtyDBMx2IXt+0w5aT/5E8e+pAl1eAuxaJQYXh+EKeQ2jucZVsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756409; c=relaxed/simple;
	bh=Z54fp+A8rhz+1JCSRByQHylHOkiRPkAicem9dXygKt0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CGdDtEf4AcuMiOgLPVk3ztN72+7uXn0cyKp6JbRxW/PnipAsVAF7FiWWQ7Dv8eSeL39Mf24bBGM3rr0GXNARTMTk20K3jKzqhh+OFIQwDq7Ks5ui2dW/8cYhC2wokVoIQ3jFHKhtGv3PZaWIEUKnDFsqf0XUag286XGWScSNQAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Doa3uNbY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQXzWK03; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Doa3uNbY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQXzWK03"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673BOfaF2215161
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 11:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZTV+8epRJQLqhCZuuHJEWE
	H/PCZ+clp0qR2Uq+u3jfA=; b=Doa3uNbYqSeGHanwlz8iLwlayQ+Ys8JwhjFsst
	IlkEfOwOSU2Vr3O6H1jiy5yG+3GosLdzIV8NNoDaId2XU9bdGFWA1anPu83r/9Zf
	0olCXdrNHrlFemLvSfyZHi3aJYEHTh93umHAADHNm0AD1fWtFuqRKzFkHXCfeQs9
	Z+udXQpy3iZGsqJfzu6DmNPh9N9SmajvT414XnJxHO8gh+qZKSiEL2SBWngd5iX7
	uvZ/ih4nvQwfGxVfe49XQjcq9QLLv/me+OzvvnXSU474BM1DrGcJOEndQmOU5wUb
	MPQ81ffcy00C0+GTE/oCp/p8CbOY4KlHApzpPB1KJuISV1aQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmxaf50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:26:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so4231576a12.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 04:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785756405; x=1786361205; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZTV+8epRJQLqhCZuuHJEWEH/PCZ+clp0qR2Uq+u3jfA=;
        b=JQXzWK03VJXVIkbt1s87/BECEh1m48aem57BjQgufknkz6fRG5Oj6Eggvsr13kkP8/
         F/Jfyx9F7gmbns0BeKNLmtttLyIFBuGsQ2ubMqbtnmGaQg3CFTsGvCAQ6ZIvvDDY53RE
         zVPCwcYo35ioH/NbUSlCidxR6Q4WleY7SnSdyk2E9Uk7V1UuRlUHhwmTMXRxj7e7GwGU
         NHDBRBXg64KzAXSQ1FbMZSgFUPvvASMWDf9UpqmLG0lgekUs+uxzjGxxX60v7iUV4ho+
         l21xGQuT+atbVeVfLnYL+en4QhHdyrfBjTgR3L1NezHzkXEOvQYX2/51SlXr/7gQ9WnG
         pxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756405; x=1786361205;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZTV+8epRJQLqhCZuuHJEWEH/PCZ+clp0qR2Uq+u3jfA=;
        b=j/haeSHPuPgXDNQ5bYHC+WNEuoYgAVtIanoFzP1cEfLlQSM7rQ7bXIAUIDB9C/mEso
         SzXSSNNwyMezRpfi0xiCV+TM4oP592Dc52Vnrq52e+vTsiZ2mPP3ZHgAgMvHIL6A9eex
         0y4TcOu88ZDVztUwM3Sy+Zqjzvdfvb4JZGnUvEU76LsRqB/ggXUmaX4pRuWntqx++x90
         3sgEey+FxPaF3QKHDtHNEc4gVpt9PiklpS6QUSPZIzIdWvJrLoYYdrFFhDZr5NhwLC0z
         zYn9hq1vsxXDWoXUgpSDLt0MmR7YYjbxo8v1gYmHZPGk11caepF7gEakm5bbQqez5KLn
         0xOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFnf3IQIpsevVdmPyWHwNyZJSVlpAiJlzW8jRTc/BCCu/qhtCNmFtTOn2/1FecxRGCivhVtbFbUpPa@vger.kernel.org
X-Gm-Message-State: AOJu0YzSE3hPc9e2Eg1fvsHHWCG8chc2Bdr+9lXf2/dfgTHw0I4X3yht
	qiChRvFW2kFlMJCcTEk3p2DKgiI6yYSpxbG5f1Fti97a1skKQYFnlsi2Bw92354urzGOQwAsurD
	DkTSw6PHzfmr/XSjlJFQVw9v7Xn5n7+LFh5pQ5JbaLfl+E9afNXvhyvxEX6eTHaGz
X-Gm-Gg: AR+sD13KGVPbI0V9sgdhNxPFZI01ApgGCp+FDJyLTOZ47+wzUc2gBtIDbbvLM/who/y
	irPUUlXCfRMIJbbPvWkWaef7BbiWbtjZwgD90onOnHPi8gjCNb6w2yvpCFPTU9JgAtj7nCIdjPd
	27dRq1a3bqoQiy6RjqP7mlHzoXfqreuFV8+1rnIgTBqVUf2/2f3EPyjj2oPC5ProBvLpssD5p3s
	ywQqvZCJtxrefVpt2PVy+xMsd3j2JTAQkuU2Vb/m7LZOFg4fhOXYCx0i7aiZ1iUfXiHZMge1+Qn
	NRv1A5+U/qF6e4gMq1Juf8dHkPuhw3J0AfezBjuZLi/IdI4hJgsLyWtMaReVNe6+0ba9QF9IapK
	oLjMIuwmT3e6NNJc=
X-Received: by 2002:a05:6a21:4e02:b0:3bf:6c08:fb88 with SMTP id adf61e73a8af0-3c92a8b423fmr9502912637.56.1785756404927;
        Mon, 03 Aug 2026 04:26:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:4e02:b0:3bf:6c08:fb88 with SMTP id adf61e73a8af0-3c92a8b423fmr9502862637.56.1785756404493;
        Mon, 03 Aug 2026 04:26:44 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm29967043c88.2.2026.08.03.04.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:26:43 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH RESEND v7 00/10] arm64: dts: qcom: Extend Shikra device
 tree with peripheral and subsystem support
Date: Mon, 03 Aug 2026 16:56:29 +0530
Message-Id: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOV6cGoC/3XQPU/DMBAG4L9SecbV+fzNxEBXBhgRg2M7xII0N
 E4jUNX/jpsOjaJmOenudM8r3Ynk2KeYyePmRPo4ppy6fWn0w4b4xu0/I02h9AQBFUiUNDfpq3c
 0DLRlFAyG6LnBqGtSTn76WKffiXsnr7u33csz+bjO+3g4Fn24Li/DJuWh6/+m6JFNJ/dTxhJEa
 8mcNdyEyrmnLuft4ei+fde221KmkBFnBoeFgcVQVSUNAy4D4ysGvxkK2MLgxYA68toEG70wK4a
 YG2ZhiGIgY4IDSCucWjHkzdCAC0Ne/mEZc96iRvArhpoZTCwMVYwqRlQycGFttWLomYHLn+pi6
 OCtZQBehXDHOJ/P/+fvGfhkAgAA
X-Change-ID: 20260525-shikra-dt-m1-082dec382e7f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785756396; l=5056;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Z54fp+A8rhz+1JCSRByQHylHOkiRPkAicem9dXygKt0=;
 b=KBp2hE4W079W9R9Svcn+Cv7xOkFttXolbWHLRKDmLhF39blO+eGlF74L/UqgPqA8Ul/vWtQO9
 +11+sFBmJqMC6XrTnG2I/LBC4Z52mrRop7AdWUXB4EgsLlr1J+M17wt
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: Pe2PbxAHQ3OiXlT9PONQaL0U3nY43A06
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX/RkH0SRHyCtw
 PZ3KbLHTD0xRoqvfi+khk8kh0vEs71L7K2OnrlAo1sFHpTZxOG6IzM1TCizHD8AHYOBjdEt7uOE
 vFDypqSZY5eFP3jM3Z8j+hDV6gdPa2AIJefM8Ix3XdwQ3d4C47GnaMije784E+3mJ3uBhhbF8I3
 7AmolFUl5JbSeFu7b5n4+6XWO1KTVAF+3pdawxpDqq+cYrkwoSNNlLR8aesbgnAVIz+/ogjYgX0
 rwbWYq/Ui3wewpR+XcBkmNNe5vvST7VS1IGwkc59+kuOMSWE0/H5BYjYM4J4GZTTHwiRdGnsvqp
 B2jJ+58YSecWKMpUge8nWBRR1kuM/RF7BJiT06RsURuj7Mpq8ujWRVvlJGnG6WhYuUxZJT+YfBw
 yD+dyTO4UlwC444TlOER6aF3LbQsUr8wPBIen+v4EGnIvZ/yh83Qb1OCGfDfH4RB6ehCnoRYt3n
 UQXRsUjqE87vtIK4+hg==
X-Proofpoint-ORIG-GUID: Pe2PbxAHQ3OiXlT9PONQaL0U3nY43A06
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX2z4LhW/7TwtG
 ck6su9wSWcb7+3SnvB8FszdD3w/bAAGHsbOpiSSgdWJWnpbN0K1K+kjDNJPJjxki1v9f0jkXOr+
 tXikw1hydI3Wdla7RQ6yVnNRvVGzFz8=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a707af6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=esFleGvXc86k4vwuY34A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030102

Extend Shikra DT with peripheral and subsystem support across all SoM
variants (CQ2390M, CQ2390S, IQ2390S) and their EVK boards.

The series adds:

- QUPv3 serial engine configuration
- cpufreq-hw node for hardware-assisted CPU frequency scaling
- DDR bandwidth monitor (BWMONv5) nodes with OPP tables for dynamic
  DDR frequency scaling
- EPSS L3 interconnect provider node for L3 cache frequency scaling
- CPU OPP tables to drive DDR and L3 scaling per frequency domain
- SMP2P nodes for CDSP, modem and LMCU inter-processor signalling
- Remoteproc PAS nodes for CDSP, LPAICP and MPSS subsystems
- TSENS instance with 14 thermal sensors and thermal zone definitions
- Bluetooth (WCN3988) node with board-specific regulator supplies on
  all three EVK variants
- WiFi node in the SoC DTSI with board-specific power supply and
  calibration variant selection on all three EVK variants
- Gpio-reserved-ranges to tlmm to mark GPIOs used by the SoC
  internally and not available for general use

This series depends on:
- https://lore.kernel.org/all/20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com/
- https://lore.kernel.org/all/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com/
- https://lore.kernel.org/linux-clk/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes since last v7:
- No changes in patches
- Added Co-developed-by tag from Anurag to 10th patch
- Collected tags from Konrad and Dmitry
- Rebase on latest linux-next
- Link to v7: https://lore.kernel.org/r/20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com

Changes in v7:
- Dropped cpu-bwmon DT binding accepted upstream    
- Collected Reviewed-by tags from Konrad
- Minor nit picks from Konrad
- Link to v6: https://lore.kernel.org/r/20260714-s

Changes in v6:
- Collected Reviewed-by tags from Konrad
- Reworked WiFi/BT enablement into SoM dtsi files, including WCN3988
  PMU/regulator supplies, Bluetooth and WiFi enablement
- Updated gpio-reserved-ranges to document reserved GPIO functions and
  drop GPIO115/GPIO116 from the EVK reserved list
- Link to v5: https://lore.kernel.org/r/20260702-s

Changes in v5:
- Split the WiFi hardware description into a separate shikra.dtsi patch (Konrad)
- Moved common WCN3988 PMU, Bluetooth and WiFi properties into
  shikra-evk.dtsi, leaving board files with board-specific supplies and
  status updates (Konrad)
- Added missing CPU OPP entries for 768 MHz and 2208 MHz
- Added gpio-reserved-ranges for TLMM on CQM, CQS and IQS EVK boards
- Collected tags fron Dmitry and Konrad
- Link to v4: https://lore.kernel.org/r/20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com

Changes in v4:
- Updated commit message for first commit of the series (Krzysztof)
- Collected tags from Dmitry and Krzysztof
- Updated wifi fimmware name (Dmitry)
- Link to v3: https://lore.kernel.org/r/20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com

Changes in v3:
- Add missing interrupt affinity cell (0) to GPI DMA interrupts
- Link to v2: https://lore.kernel.org/r/20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com

Changes in v2:
- Collected Reviewed-By tags from Dmitry and Konrad
- Squashed cpufreq_hw, EPSS and OPP tables into single commit (Dmitry)
- Removed labels from CPU OPP table entries (Dmitry)
- Squashed CQM, CQS and IQS remoteproc-enable patches into one commit (Dmitry)
- Added WCN3988 PMU support (Dmitry)
- Squashed Bluetooth and Wifi changes into one commit (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com

---
Bibek Kumar Patro (2):
      arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS nodes
      arm64: dts: qcom: shikra: Enable CDSP, LPAICP and MPSS on EVK boards

Gaurav Kohli (1):
      arm64: dts: qcom: shikra: Enable TSENS and thermal zones

Komal Bajaj (4):
      arm64: dts: qcom: shikra: Add cpufreq-hw, EPSS L3 interconnect and OPP tables
      arm64: dts: qcom: shikra: add WiFi node support
      arm64: dts: qcom: shikra: Enable WiFi/BT on SoMs
      arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm

Sayantan Chakraborty (1):
      arm64: dts: qcom: shikra: Add DDR BWMON support

Vishnu Santhosh (1):
      arm64: dts: qcom: shikra: Add SMP2P nodes

Xueyao An (1):
      arm64: dts: qcom: Add QUPv3 configuration for Shikra

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  |   19 +
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |   80 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  |   19 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  |   19 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi |   88 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi         | 1682 +++++++++++++++++++++++++-
 6 files changed, 1893 insertions(+), 14 deletions(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260525-shikra-dt-m1-082dec382e7f

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

