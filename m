Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAED456E19
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793963; cv=none; b=u3MaD0vI3+0hRbF2+tTmvEX1PBk0JsMavdXyTc11qFK5RCm1DEi9qpp+krxCnvLy7j+h7/EFWfw9fcUppa+hlb1GvtwrIdb1mif3w697ORogt/V6ikR3fwoJoGYNwdERDFyjpDL3+vQ0rhGCfoFxtz3DST6IAWF62aTqZR8ezJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793963; c=relaxed/simple;
	bh=17TGkrOk+IXG3R2qouvLuEtZDXHHU/tNRL4Qyw+91Og=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fW2SdsA+Z1d9XnU7ubJ/oqS/hQzgiId7bnHbBkXTLusj1hPknVHi5sEMKvgFwOS3DprKoLIy5owue+VSGO5yvK6x6E8ECNmgxyu6WsG02+4+YngklZWwnK2f/LkhbFaqEUb4vwyo10Kn5vGwn5Nz/c5QUYkkTXOrWVJYfcQuSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kv0Mp+bR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgtCQe+8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kv0Mp+bR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgtCQe+8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8LEZV1754774
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HDeVLW5vrcC10CbNGmlYGy
	w8sZ9HlDHmo+AQGRpiE0Q=; b=kv0Mp+bR63YRAC7IU3n+6UmzzsaIb5oOzCHRW0
	8ud8zUXZKH8LtpHsuIxBv1Dz60pskKnP+aFgvaAfzgtZzSzK5aawbgYBchGpI99x
	wNY5F5eA+KNhEYjcATDBY0wz9ke5WJCH7QPZl+zPYRCEXoVSD/FwmIsJKufQ78q7
	TA+nU/28WxzD0Fg5oolfFsDXhTy0TDOTXzorCPe5UJAffrIGED+QoYIv3+bdF5wc
	dMSp97Bs8Aza+ibb/R3D6+EEcDjE2aQHw88asnh9DILNvDzGXLpDbs1hCAVjnrMv
	iK4Tlmx6R8GCLSlnVPe3lW5tuVfpygpQkrzTGTKp/uQt9Y0A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j711uvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab868fe362so1532712a91.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791793960; x=1792398760; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HDeVLW5vrcC10CbNGmlYGyw8sZ9HlDHmo+AQGRpiE0Q=;
        b=MgtCQe+8OoliwbPiedY+CxZcCIdd+Zkzxeb+goU3h3QslODxhIOYR2QXRpw8XI+4I8
         yk2y8FWvmHnxBRKbGIYeFjyftRSC+bjxrPUByJMZqeMRHJcIRBeOnUr+y5j0MvOJJOUS
         HUF5Fl8BOW2zoZO96wJgVyK2PP1QJBBjUE8JLl6rw/JT2OiCYkfVS1UflHzJ9li3k3h8
         CM2Grx6moLClxVOA2HNoInIWaQ+cwQ/0vshgRZXL2dknlk7yjvnc0zV6UrDiEhpf6f1r
         1ZpNUydqJd7GvBUyooK0bwrchEP/DlGhTBUxFcFJIDkjiF/a4D9O17a/cCsfuzzP+pf1
         S9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793960; x=1792398760;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HDeVLW5vrcC10CbNGmlYGyw8sZ9HlDHmo+AQGRpiE0Q=;
        b=QKxbWVrtXvOqRytcll8om3dJAPz4vqn3mbR9PCDbW4+hWP8SONSoSep3KQCJtSeaGE
         iwpD7jDq7dvl2Hapl3yIYCPfdPDi2Ltlc5q0D8t4XHRNOg6XscepPnj0c2LxV6+5XONF
         Td8F14hkoNAxPMpQn126Mz7g5+Qx7BJUDsgyjVHqlkQXnlxfUj++pVgLfkcO1V7aDpyH
         DMhsv4RNnx94Y2kDcqmH/bw4SoWZ8P+SpqevPn80ua5FHgEC8U/OnEadfWQanh9i9wZU
         QEz5lsUiU/zWrVLeWtDsi3B5udMxEWGvx669H7MzLDBrtIufNO7u1OFVlMwb4qEsXQis
         EWEA==
X-Forwarded-Encrypted: i=1; AKwUvBxKJec4/ktyvy2PlwcDtwoal5K2BOpefALNxhN4uIIJZKXXpAiDq3b0KLJ1j/F2FpxN7W+8vCV5yMyI@vger.kernel.org
X-Gm-Message-State: AFq9FYL+GMKCQdxKCx2jFz+ft9Jg5b09Po5DC1aymF7oB3uXUXy1glRo
	Go0r2XGO+NmqDk8INSmrE+EEi6VEYrIRJ+oLjXkZamoBL70izPTGktPvei7i5xwC4faNmiApCm4
	VKZrOAopJkkg66JwgoAhF+t+RXgGpCzCjHH6ZnZaGTEA+qBbBROArn2Cjfy5Oh4GHqMbkmT6SEn
	8=
X-Gm-Gg: AYBFou3Bew+Jdda9WQLpL15RTJCa2MqVgXIMyQs0Wr2UxCoNKSl3YH3XtsomAORZEVn
	2z+XYGlxdDP8pHxuDjHZbrrVLL2VXyyNGA8fBwE5w8RwE2xBvfmJOBtN+OdN2Y+sIKRg7XrgHBp
	17vm8dJRN55XGU6RRfGTzGSybukEEYRMkKBEIBuQi0/1i5XGJTv7avnUWB4h5Kct8xI8tYqjnQ5
	Sd1xVFTIrOFyTmCS97tq+LS80pg4IqiyGr0IL4ATGEwTo2+uZCXUv8ocPkprmqU4sc38AdlvaCp
	2xHNXsok6abeH3tdVTfO5ErtJxl5yVPjHjh8N+jRAnz6Wmvu5v1ra5FGGRzjiAGFdjd04ILyUf6
	E9mL0HWGbgu2+881ue9jCwL4CqlsClOZl2sKmkRuFsJo+mDjTJA==
X-Received: by 2002:a17:90b:3c0d:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3abb39f450amr3166395a91.11.1791793959814;
        Mon, 12 Oct 2026 01:32:39 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0d:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3abb39f450amr3166379a91.11.1791793959332;
        Mon, 12 Oct 2026 01:32:39 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm15749423a91.0.2026.10.12.01.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:32:38 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: Introduce Maili platform device
 tree
Date: Mon, 12 Oct 2026 01:32:29 -0700
Message-Id: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2bzGoC/02NQQ6CMBBFr0JmbUlboVhX3sOwGEqRSYBqB4mGc
 HcLKzc/ecnL+yuwj+QZrtkK0S/EFKYE51MGrsfp4QW1iUFLbZRUWoxIA4l2ZmFk2VaIVaWwg+Q
 /o+/oc7TudeIG2Ysm4uT6vaCktLvWE88hfo/HRe3yEZdW27/4ooUU1pTmcjGFcUVzC8z5642DC
 +OYp4F627Yfcwk3eMAAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791793957; l=2679;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=17TGkrOk+IXG3R2qouvLuEtZDXHHU/tNRL4Qyw+91Og=;
 b=QvynMEakRHxX9ojhhoEmf7hfq2A+0tYuwdxXteUN1t+6koOKfXglHph7CsJZeTcNo2/gJ9pio
 5z1Lue+kmtbAzgAVU4/b//lIpHbm6mXAU6khcnxOzBG5itjk3Jp/W5x
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfX9uc2k7offM45
 rJ+0kWAiW/4KJ0RjaS/mnVEhpekQBmtQXmcl5qeI0R2zCoCI0QgGJyVABAAhdGA0EPdvkGSbeYG
 NScZhtMQVtSSHiHe7Hg/6VmmR76nv3U=
X-Proofpoint-GUID: ZdSUDwWrbFvlKz96pgRpjiF6HDpbpV76
X-Proofpoint-ORIG-GUID: ZdSUDwWrbFvlKz96pgRpjiF6HDpbpV76
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acc9b28 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=PSjTE8wPq6y03Cg0TIUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfX0QJdt3k/3ZLK
 KT4tI0i61km7v5xed2qcliQbhbkUYtq8IJsHa91jFPNNDmaKhEgPR7J86nusCbPOj4Vcbo4YlT8
 tRbHOHzbUneKTrNCmneERRt9+MOrTT39yq5+vHDqN9haNq9EBaPdR+mSGbk4hjfriNkDdfNoFUg
 dyeiA4XmyXaA/q1H3+Ji70NxcrsPUIzAMemBFOuXfFmMclGEYIqg+6VfkPSQPxtQbP04ZwGeU7p
 dZ2C75s8Tmd1aGKhwlrnk+a24PatwG1/KnhK4WUrJA2hJRCj48K/WLT7/moxEFssWva8YjqQbvm
 GtTRX2Q9ccNXRYXNJJfb70qPGrwcT9RnRI51sjdexiRvXzbxuTcpAEvOncJDz5Yga3hOtuXjl+R
 sj1g+HBB8KLU6j8wGEyI9YdtfHG08icecNZAV//5mVcPbHhnjEak+gnXsP36Ln6OAEFzgBakXGB
 nfaI+7+lDaS2GRN70ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120033

Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

Add bindings and base Device Tree for the Maili SoC, MTP (Mobile Test Platform) which enables
boot-to-shell with ufs, PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc.

Features added and enabled:
- CPUs with PSCI idle states and cpufreq
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC/RPMHCC/videocc/gpucc
- TLMM
- Interconnect with CPU BWMONs
- QuP with uart
- SMMU
- RPMHPD and regulator
- UFS with inline crypto engine (ICE)
- LLCC
- Watchdog
- cDSP, aDSP with SMP2P and fastrpc
- BUS with I2C and SPI
- USB2/USB3/type-C
- Modem and SoCCP
- SDHCI
- random number generator (RNG)
- tsens
- PCIe

For convenience, a regularly refreshed linux-next based git tree containing all the Maili related work is available at:
https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/hawi-maili?ref_type=heads

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v3:
- fix qup_uart22 gpio function
- remove x2 OPP entries from pcie1_opp_table table
- swap USB QMP PHY vdda-phy/vdda-pll supplies
- patch rebase
- Link to v2: https://lore.kernel.org/r/20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com

Changes in v2:
- fix the size of mpss_mem
- using 2-cell specifiers for iommu-map
- add reviewed-by tag
- Link to v1: https://lore.kernel.org/r/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com

---
Chunkai Deng (1):
      arm64: dts: qcom: Add header file for IPCC physical client IDs for Maili platforms

Fenglin Wu (1):
      arm64: dts: qcom: Add PMIC support for Maili platforms

Jingyi Wang (2):
      arm64: dts: qcom: Introduce Maili SoC
      arm64: dts: qcom: maili: Add base MTP board

Yijie Yang (1):
      dt-bindings: arm: qcom: Document Maili SoC and its reference board

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/maili-ipcc.h           |   62 +
 arch/arm64/boot/dts/qcom/maili-mtp.dts          |  960 ++++
 arch/arm64/boot/dts/qcom/maili.dtsi             | 6930 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmg1110.dtsi           |   57 +
 arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi     |   57 +
 7 files changed, 8072 insertions(+)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261012-maili-dts-605d7aa771af

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

