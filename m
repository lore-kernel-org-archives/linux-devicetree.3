Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07C436F405
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161801; cv=none; b=aiz5H7i86+/cjRNo4ITheHN1TW//zRi4wB0AR1amQaNggngZ/RBbW/PBFChllTnaYtsPG3Oa/h5QXM0q0MkUKMKfBtnmsXTJ+8bX9rGpzC25Oj8aLop5jxwjWvPoVJUJiX32jKjp2DfJKt/XDz6ZpfqYV1ugc3lDDcx6WNcmbwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161801; c=relaxed/simple;
	bh=MzCMi/u89b6ENxzppj4pkL9lmnVb7CCk5Bl+93vkVcM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QF0VOPtfWYzA+C2GedzgLrx7LcETNZakRCy0L4puqPAK9Mmjl1GzUEv2qCFAXkCJuU0NGBwdDmNbG82hQ11oa2g3CSMwvKQj1RE2mAnqFNXwkNxKB68DtwA0pTCLujoNmhSfUwMPuK89yjYgONTobXORZ/rWA2GRAAdm+ukzB5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5KZ4xoS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZV/Bx+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5KZ4xoS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZV/Bx+4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDm97Z3823628
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bmYIKgWcVyOLqclc7V7XCN
	R7ua7aOSEctfJ9wNDIB6E=; b=c5KZ4xoSBhj/hp/GBeI5zBxOi6TIe3FMSFJQJD
	Jf54gURXjd3AaB07cwHjmq6CLFxNtZGzOYv+AKdaLNJ7J2AWEzC+XiK79WWSIrOn
	wxhir6Qy+WAi9oJjEvo/HmxJt++NTT4PtPuO1TpzJLbX8okCfK5n4fvJTYTbzleA
	uN6JgCSoerJH4P/wlcM70UGmuOzdd+abETAm617J6mQrg4vxepBI4NOP+j0s0V7H
	IZrK1EpA7aqyAg6Z8rdFq5oWVu/LqepjjFTRiwAlkFQB8Yxs2K64ZsbTli9QM8vO
	d1cEZamX/9tkrP0JS85fGBUhqB8PQcJQ3s/vSVp2SNM1bpcw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbs3h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:16:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38de4c60f0eso849941a91.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161796; x=1785766596; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bmYIKgWcVyOLqclc7V7XCNR7ua7aOSEctfJ9wNDIB6E=;
        b=hZV/Bx+4mtMnkzqCLj45yEi4hlYmigLv0KnTsKrBQWc3rtEP5q2/s9vjwcsFbeOBuP
         X8EqJJKkvQknOP6TA+XKAl1/Ci7SgXCwRrnIemZ5ogaHkwHUjtqIt4a6u88CkPaBJiF1
         K2XRYhOJFzPmszqNY2nTgQGMtiAiYAPBydHRIai3xqJ/hF3cRiemKYt4bEYZliKf/Lre
         pTqI8xue7sTB/W58rTgTOUItUNeSwCBJ4VUZuVOWFsl0VBcAHOUezmHYWPLxj7oh2bdR
         euv3RTy/IF1qKnFlCG+JrU0A0i3qkS4TaDLwF14B4yartvBVqyGxPDzqdjsHWsox3Vfq
         Ok0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161796; x=1785766596;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bmYIKgWcVyOLqclc7V7XCNR7ua7aOSEctfJ9wNDIB6E=;
        b=eTjCPywSCoAe5ywdLgza/hY03Xpu4Df2ATHXPJcyw1jEdUV3rUJk28SjLIYdu7AjR4
         PbLStUQ3AAeiGALqHC0XXN6WrBaGjisVpExJvmm8mvwtTUp1C8/aFh1kxsyTjKw6UDVY
         mKpap3iVv59RPLy1Nx1bOZbDPGQCSjzx2REFb8r4rnvc7UGAWKcOO/SCXhRogwwhFux7
         DBc6tTwx4yvLoVi6TBVymCYc/utP0LEOu31vQtVIq88ew/uvLIZlqE+cJFFyQZrw5TFL
         z9Jx6ZvhhWTbJPUx2SOXAIsHVzICSvGDdnrPfR6Z0h9iVtz7M5F/ePSlyX2Cz8Gwvxwt
         kVIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqoaXnRXqbMrVSQrF+S+CSLFUZhVrLSLVyDtr9Vi4bpDwfIXXdDOa+eH/sezrNObErCQA5Wx+Eph5t9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Oc0+BIAamRYIF57fiEtzggdDyCDwBegfIEJOUvzWAMC7u6v5
	52EaFlJUEHS1htLFt3PcqBvq787S14Wr5C3WvSNZR0uKFM3A9W2PlMz82RQZecLFH9GnBqvpoje
	PKO6ITkOYsIxwgd/KRFFGGvnBH3XAmGHYyYG9H5E/rprDSL7vUTQ8cS4tv3X4ghXW
X-Gm-Gg: AR+sD111ea48g1LuCni5TPQWgSSanU0oMzRheU7edS/e2WZfy5D4lKjUvebZl+9cPe0
	u1e03f/PTEYlf7EQto0XzmaahFUQp6ucNe1BpxEyOvbykaYAX7hFGdR8Cy6y+gOlYKAaYLkseoB
	aTGTJNNb0rYS7QGCMb0RmahkF3xwnOO+oAC1F7sPTx7mDoaMsLJI5PwtpA845y/kTD01RdKBYLH
	2ABnaBbwf3a4thIfFTEGQatTvycgHJJ3RiVG9rb4OH5nYZQlvMEv5VT5YPU408MCOiqItrO7vnn
	0/esXUh1hSUMmTNho8OOCSVRzujRmwuuk8S10x1OKf/HRWMm9et5wZ/IR6T+CpbiEwckF+gLoJ2
	1f9jTaWVr20hsldMmqyeNf03ebEiHEDimMHWQG2LAw+E7s4yu14w=
X-Received: by 2002:a17:90a:e7ca:b0:38e:89ec:5254 with SMTP id 98e67ed59e1d1-38f628d0e68mr309371a91.7.1785161796307;
        Mon, 27 Jul 2026 07:16:36 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ca:b0:38e:89ec:5254 with SMTP id 98e67ed59e1d1-38f628d0e68mr309332a91.7.1785161795815;
        Mon, 27 Jul 2026 07:16:35 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm88012281c88.15.2026.07.27.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:16:35 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Describe the PCIe M.2 Key E
 connector for Monaco EVK
Date: Mon, 27 Jul 2026 19:46:30 +0530
Message-Id: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD5oZ2oC/x3MTQqAIBBA4avErBso+7G6SrQwnWqINBQkCO+et
 PwW770QyDMFmIoXPEUO7GxGXRagD2V3QjbZICrRV1JIXFu8nFXaIcUTL4GxRmO6ntZxlI0cIJe
 3p42f/zovKX0Jh86RZQAAAA==
X-Change-ID: 20260727-b4-monaco-evk-m2-v1-dd56eb997378
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: KxIj11OoEE3yEd7WbRi7CpywzX7-i7O_
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a676845 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zz_lQt2UcqaARhYooj8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfXwCd0sbD5dVLj
 Ak1so4lJ+2HhirvU+U6khPBsfBphzR6UGEVSuGicJE14NMJ/jfS7iiGEor3givXo8izUq34Qrfe
 4R0rAN+t4J5zY6ggoA6tRB31Vk4bZ4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfXzsaBQt0/v7w8
 bZNHPeX08xT/0b/rSSOS2UnVS/vIWEhp5sE7zxPyi06vtLkE+2ntBe81ZzDOsSqtuRsxi4xQMh3
 qM1KyJL7WGOg44S1W0lyfDKr6H6nEhcY3Pl5MS+qqI+SnoehnH8n1a/LoL0q2dAxE2yqcsuqZON
 G3UqJ/PSnjqdjpgPD7p73E2HFEINVD99HfiVOXD6m5sewEJ7+K6HHXlYVIqM59g3J+rNKLxtJii
 ZI2noiKWB2ahICWwu1k9jP13ddZVpaW7qyfAHV8VTWUh3sMry3tMlfJm0cJ1ma13MbLI99pcFGX
 GqJ5Lb4PSdv7ni6kmMGg3NqbaPhZe6QqQVizggJYfEajq0fDPiYhynX0WzdlHLkkE8GwTH7hukv
 nqosRWrqxoYoaxJC1kzT3mKbPypAamel3lLLsL1KZh7exKbW7ZLbFLF1t3xIVeIYI9d52/gY/35
 11P/YBJJcyQLsJikabg==
X-Proofpoint-GUID: KxIj11OoEE3yEd7WbRi7CpywzX7-i7O_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270135

Add DT support for the PCIe M.2 Mechanical Key E connector on the
Monaco EVK, following the same pattern as the lemans-evk
series (already applied by Bjorn, commits 67f06acf/a6d4bb0a).

Patch 1 adds 'compatible = "pciclass,0604"' to the pcieport0 node in
monaco.dtsi, required for downstream DT nodes to be matched to PCI
devices.

Patch 2 describes the connector-3 node in monaco-evk.dts, links it
with PCIe 0 Root Port and UART2 via graph port/endpoint, adds the
vreg_wcn_3p3/vreg_dcin_12v regulators, and adds the serial1 = &uart2
alias for BT serdev enumeration.

This series is based on next-20260726.

---
Wei Deng (2):
      arm64: dts: qcom: monaco: Add compatible to the PCIe Root Port
      arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 73 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  1 +
 2 files changed, 74 insertions(+)
---
base-commit: c5e32e86ca02b003f86e095d379b38148999293d
change-id: 20260727-b4-monaco-evk-m2-v1-dd56eb997378

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>

