Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FCB2F547F
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935367; cv=none; b=XNjh5xLzVAx9uh8yHe29wAJVXkUwcczsCV4F/DzDuZmMsOJ2Sk/muTUg33ZQXxmxQj63CzBbre/gr6XzyFPdFZTpPH0TLW/Kzl5WQI9MAisX4nVYBnfDz3Nj59IhUQLvu31A5e5E4147HeTh9/fHZ/MX1bWurHiSxHzMmfqykGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935367; c=relaxed/simple;
	bh=L15VMw5XjEqY+cGy21QzrxCEV9EwBH6ZN6g6Z3zkoU4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EvyTs/R1m7Qb+8Lg7SBQHTGJdQJ9AVTLkhTDroiU8Kle9JSXtcAXpFUjof3D0nO6EU9PFrTGIwBSehui1rwj2ZEIV79cGNY4e/5Wm2SrfCrFc4YWWuAchakeWWEq1co+LFrWeIZL8C15pfhCqRwTdbxG/tDWGMmlClZxA4Zn4ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqtOeXEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FRfAn2BF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqtOeXEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRfAn2BF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKluAr125524
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vrrd/LevLkevsPOqrPyadI
	p2nqDCB8i/YVQP0+reWnY=; b=kqtOeXEu9CIlizPxPv5NP20uMkRS6ci/LmmLe+
	eQ9wDVOwaWFnfgptpNlPqPenNrkhq7InmSdCBGc+5xvrR/8HM2R3do0jRNZkALI/
	X21NZG7rzxpbr/EJhz9DdpD4vZ4QQCFhDlldeGKrqnE/imzNP/U96qzGQ+rWKeL+
	GF71GbO/ngvau7M2xnsIKBJ8IS5z+vSynzdo/5/dZLHi83tHV+T5I56SwnRJahyl
	pfwhUwYWkinrD/uI1GJVZ7aP2FMAdbTTi2OfSJcJgyuH+o+6OstnJd252ZN98vyL
	cgpHaOHs3yvpECOg4oOElvgFTMFEVM/Wch6bO8AbC9cj6RbQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yagyca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 02:29:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304950e5901so2131262eec.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 19:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935364; x=1780540164; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vrrd/LevLkevsPOqrPyadIp2nqDCB8i/YVQP0+reWnY=;
        b=FRfAn2BFosyNT4myUat5KEXap0PsKK8Azwt7xejKWXnAdQcLFSiHo9sdBd7/lVVdd7
         IU/qSQ+mwXZcEA/W+38HsPiHvaQJbLMxDG4k+ttI/29bhY8esaomc6ERYqxxh4esfdqN
         0no2VfZjGUzckLf0RFIjY09OmJSde9adwmBt7zfZH16expeRbk72FI0o63KtlcROZzC/
         2lSPTEfLJceRfApwZ6Df09g0tZ4Go7DdWJzSSQBXu1IZNxyF3PQ48Q7DWd2DKWV/w0Nm
         91GjmMKw5MrtQ3f9rwn2UxKMxw64etGwt6Ote6B5zQPE/FtTkFUcR/7CL+BymTrZCJEM
         OoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935364; x=1780540164;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vrrd/LevLkevsPOqrPyadIp2nqDCB8i/YVQP0+reWnY=;
        b=DQfJlqA4vWBtClDm7PD2/n6BQnCAoMGNMzsabdpuu9kT1qS9Gv5ZrC7xlXxxMMpLK2
         74bUvzbBzud0NK/6n6SNAnjLSlGkVoqWfI9or2sjA0uwX8WbmhRZCu1zRyRm9CPBXu7+
         BbSEBY51Ma9xDxKXqFoNLaYE9hGiO+YnwY83vITctZBGVuIGVRrWBl1GdtmJhyrBV7LA
         4xKUBrlzU7qYJMgjnNpHQk03bcz6qLGilqcV2mG2rXo78PI1/RLwf14kKWtLVF8LTiRK
         VPt8q3kbPLLOJuyjkAasD/FMaKBsJsp7PYwT95AFGSsBSkMI3T8vPRxwH1oIOnBpGJoM
         ykAA==
X-Forwarded-Encrypted: i=1; AFNElJ8iZMQDlXSbJ4juMFR9EzR5nxTf+P95DlM3qSnYBaYTTyhcjwMwRUmpmIg0QHjgITwN3yNp9Zr9rb3U@vger.kernel.org
X-Gm-Message-State: AOJu0YzSgnPs5rvpjWNrhOEfmUy8XDqJV42cTH/xcj6vYpa81Jn0EeIt
	+JinI555xESmdW5K0tMmLmO6/RfE9HwLzuPnKMStDSjn3nB9dNKcseL0cXX0GMUyIz61CNAvV8M
	5SUpJfh8qpGC8VbLEy29VTHymUL/JdLu7jRIjEgc0r44v+NGTR8baVjM4iRNxDYMD
X-Gm-Gg: Acq92OFEanN3iD8MYWS3zOsPFBwCGrQrKFN14KUzLfHwunQdeGQTm2qhXCMe1XGXq42
	K0drGEbhFZokWXjxN5meJ/etwyxaG6K8EU+7tGuCJU2F0syaq7945MROoKXa8aGBFkSiA5BN/KJ
	YanJwiD8VN42sleTOsIAHzTJRjy4GodEpxgTEilpn+X0BDwIjVKNBTDDgunQDvQ8rwxTkaW3RP5
	t5xLKzlPqzkUNAKH59Es5Zi8ixr+TnNOv9l1tCt+SPKdbW6LQD0sedu1ljYIwgmzEyjFMbi4cV+
	MtAjVWEwhaEgTBhSvgeFGDKwtD73FO+4akSJaxIVOGov8wK1nKR4ra8sBaz8MAgt10WUa4iZH9U
	bMGaqsjKXwyRU0Ho/Zno3RQ7losNOu8xKJFJE5uAsQPF2UNN2I01gUfeuECQXFtP/8j7y39KoVO
	w4DdQ=
X-Received: by 2002:a05:7300:6ca6:b0:302:8cb5:af0b with SMTP id 5a478bee46e88-30430e3fadfmr12632600eec.13.1779935363879;
        Wed, 27 May 2026 19:29:23 -0700 (PDT)
X-Received: by 2002:a05:7300:6ca6:b0:302:8cb5:af0b with SMTP id 5a478bee46e88-30430e3fadfmr12632577eec.13.1779935363331;
        Wed, 27 May 2026 19:29:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:22 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v4 0/7] clk: qcom: Add common clkref support and migrate
 Glymur and Mahua
Date: Wed, 27 May 2026 19:29:11 -0700
Message-Id: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHioF2oC/yXM3QpAQBCG4VvRHNvaxr9bkcQajAM/O0jJvVscP
 n197wVClkkg9y6wdLDwPDmEvgdmqKeeFLfOgBpjHWGiNiO2Wi111ccuDahGjDIdtOBOi1v4/IJ
 F+Vv2ZiSzvRW47wds/WHAcgAAAA==
X-Change-ID: 20260527-tcsr_qref_0527-f83ea225903d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=3784;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=L15VMw5XjEqY+cGy21QzrxCEV9EwBH6ZN6g6Z3zkoU4=;
 b=KzygnUE57AY7PPGZW+UhA6KW3ayozlOSjdPeE8U4Wo7P3JCadEzomM3E0M8s+u6kfJJhd0xPO
 S7kt7+pmmemBgPMZhNbQZqTLgGSMY2Y5KYucsAycBd/r2RFntPHLalT
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: VZlgZnoelsD48WwXoQvHAPTwcl1JK6ks
X-Proofpoint-GUID: VZlgZnoelsD48WwXoQvHAPTwcl1JK6ks
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a17a884 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=DfkYS8A862cjZAK12kEA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfXzPH2SORmTmTo
 FnRLINtKzwS8Rm/putwbBk5mYsxhaLUAmsDuZS6uaX7V7ZIbcqN9SKmQhkBxYROtPMKV/XsmLQe
 hbYxhJbyF7je3LVvhQDS32PXD3IqyW0s2z0Q770npAzto33zTQuvokqpeBTaaXDuVDyCuJ8qSXo
 hO1GlNc9YnaYdqPezg33ZKX3rg1+YeBKKM1CaAk+XoNxoCP3f/9JYGvRb4kUu72CBK+h8luihJK
 viyc6cTyL2AA3zDCnfLUMuhdloaX+FMbYay8+D89L4up5dyK8AOmGFNCypsUquCRWruEwm+d5T0
 /5teBioyb5bfWVvJ4KyqL/FV9o1xmYnkPPEHIBr+Y5kXZJKVakAzE89SnLUsj4L/Dr42lJmnhOx
 uel+i1vTC8oUc0eo1rieR3+l+nof1sOWXhTXpkzFxanYBHS6TgsBIVGSconOdNzPopAh1mRMd94
 CyFhA+/mj54ihChYFrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021

This series adds a common clkref_en implementation and converts glymur
and mahua to use it, along with the related binding and DTS updates.

The PCIe clkref clocks on Glymur and Mahua gate the QREF block which
provides reference clocks to the PCIe PHYs. QREF requires LDO supplies
and a reference voltage from the refgen block to operate. The refgen
block itself requires vdda-refgen_0p9 and vdda-refgen_1p2 LDOs to
function.

Previously, these QREF votes were done in PHY drivers. In earlier
discussion [1], the feedback was that this is the wrong ownership point:
those supplies are for the QREF controlled by clkref registers, not for
the PHY directly. Based on that feedback, this series keeps the
regulator handling with the clkref control path.

Another reason for this series is reuse. clkref_en registers may live in
different blocks across platforms (for example TCSR on Glymur, TLMM on
SM8750 [2]), while the behavior is the same. The common helper lets each
driver provide simple descriptors (name, offset, optional supplies) and
reuse shared registration and runtime logic.

Glymur and Mahua share the same QREF TX/RPT/RX component naming but
have different PCIe QREF topologies. Both are handled in tcsrcc-glymur.c
via match_data to select the correct descriptor table per compatible.

[1] https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com/

Changes in v4:
- Add mahua QREF support (binding, driver, DTS) to avoid dtb check error
- Override pcie5_phy ref clock to RPMH_CXO_CLK on mahua since
  TCSR_PCIE_1_CLKREF_EN is not available
- Rename regulator arrays to topology-based names and merge duplicates
- Remove else: false blocks from binding
- Sort supply properties alphabetically in binding and DTS
- Link to v3: https://lore.kernel.org/all/20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com/

Changes in v3:
- Fix dtb check error: allOf:0: 'then' is a dependency of 'if'.
- Link to v2: https://lore.kernel.org/all/20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com/

Changes in v2:
- RFC tag dropped
- Changed back to additionalProperties: false
- Moved all Glymur supply properties into top-level properties so they are explicitly defined.
- Link to v1: https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (7):
      dt-bindings: clock: qcom,sm8550-tcsr: Add QREF/REFGEN supply properties for glymur and mahua
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Migrate tcsr_pcie_N_clkref_en to clk_ref common helper
      clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator support
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Switch pcie5_phy ref clock to RPMH_CXO_CLK

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  66 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  20 +
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  15 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  13 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 205 +++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 407 +++++++++------------
 include/linux/clk/qcom.h                           |  69 ++++
 8 files changed, 557 insertions(+), 239 deletions(-)
---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260527-tcsr_qref_0527-f83ea225903d

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

