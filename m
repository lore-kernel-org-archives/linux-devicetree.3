Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB5E3B38A5
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607093; cv=none; b=ZelBMC1TkEtfy6dmqUy9nuvySl095szhM//WDWwnuIwe39nkMmIl/HE95DV2suASkjUy6xnB8tPUCCochKS3KnaPA1TlfA5P7QJrCEi/uo75F3iNc6rHJCQxE7uKwjiT7HLpqUJogOuTaGt+71fQihWp6xGiMnyfLyO1eudhU2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607093; c=relaxed/simple;
	bh=10fzlebEz+tiEIKnYlb/0ADkVEcnq4RaKhJy10754c8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FyfA3E2WcQRBXFGAJaUMhaC/zAEQ1vv+sKZimowl4+vQIsqH70nvZg7O4szTaRo0fL7uDEjB0lN65Ajq5k0BygqN54PznfkVNzYDD65E/QZa4t8IL65+FYYyxuYBwZPyV0aY1Sxab4zj+bwxGgNTEowFW7sXHs8g5MQfR+c3Kww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oice+M68; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XF1DOUor; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oice+M68";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XF1DOUor"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w7ai3132138
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gY0ycYZfiYJWhSKhvNMdpW
	cE6pCgfRJY+ho+MWBwPt0=; b=oice+M68OpIa6u78SOk9tGI923GhmUT5q1HqYG
	+PCIenRk269/AJ3k3hxwAh9AJ//Hc/aeVpSCxp3bMf/8ABLu4TAHU7AKiSYnQvLr
	dggEwCO6AriETdVsP4szu2F6VFhjsT66d6fi99pUb3X4zEgWiwWJyAVrVl0NdkIk
	nMh8GAz7IhgynQHRxN//8so79fwG6dmq+nK84gklmHJMEwkGA6BvbZ5VH+tqK+31
	UqjcskkXPAKyp7ZBiLZW12jC1Xto+AvzGu1bSRmj5t0hiSE9Nyaz7spzesjGSsEw
	uoLpXPPcXB486t+S2x6o2o2vY6LU0/Ki3oRLEm0gytLuw6zQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s4321v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:24:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso1973734eec.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607091; x=1775211891; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gY0ycYZfiYJWhSKhvNMdpWcE6pCgfRJY+ho+MWBwPt0=;
        b=XF1DOUorOgzhXgDcKc5KKF9NszWKsFMj/Z1At+ws2a9JlwfQjWc7Djb/CslooM4EPH
         B8gZPYWRuru05HRdQkh/a6fk2BPPs8KEUkwl2sczu+qBDuw/t7ZJDK1MX5BbI6D4XcMn
         lizRWIelofjlW6oukB1xI6bpXB7WO+ajL+H9FrG9wo5gLAKUTm/XJaTPcl9eCzrzuwVY
         vJJQLNrSfevIqEEnnmZTIdaR65zYc23JcEXidBQJFevc0WxM4Dxzkt+CwcXRKJaaWl7K
         LDVc/5ZoVLjdxSFkFeq63+DBftsLUEAsF3fQZS6RcdeU1gqfFX+bQoa//Zv3sANBvjRf
         J/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607091; x=1775211891;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gY0ycYZfiYJWhSKhvNMdpWcE6pCgfRJY+ho+MWBwPt0=;
        b=kcGztNRnUeijGJgI8pi03tdOuvgfu0C8/3AX8pCNITsnfGcDfbqtRJSt/ncucQs7cb
         uIsqiTZ5GfjSnk2mWUIWOfOQH2zppYuP4nG/kB7f5tFoG8Zhpv2yUSlnu1otMRFvOeQY
         FFKG/RkZhW20nWMrBv6Nl5dcWFWKFhiRtZ/bILxQIeawtfmzay+bPcLTEihhFao65rnc
         i49oavSFt/CEu1q/hyXNaj7a0uOG0YQM4AMV7CcnAdpFhQKY1mC1Q8N1MrW/rfHF0Vg3
         c9oQODCJae2d5g9dNutsj4/qX5afNDpVw9emk6lIOggrbnF2CWBnlPbG1NRpdlZyB4I+
         XtcQ==
X-Gm-Message-State: AOJu0YyXugpjK9kUtJKWmSD0Qh3UBD+xZW2oUgwAWf90ZkXOY1X8rRcU
	GPz+lYiNOTDVaRKGw9ompeaxlRMGHurQA76IdQnJJ9l6XYbiDXRBJVsJZBVbpqHj7gSuYflP5bU
	z64OQ6tR2rx7plihXTOTCPkreJyxKbYGN+XDhz4RIhmfW4MzHmUV/zHel1Qj0b3pn
X-Gm-Gg: ATEYQzzF05tXm/Odc25djMsr1sAV3iWmxQMkPSlNarD2gyLHAt4bZ1sX6BWd+aPWjYJ
	MpJ/w17R46ZJPV0Gh+0EIe5123CNx2lkPa24XB9eVSFhSwg4g8iqQhd7l5DiWlSoj1A90/hLSht
	DC9T8iVFaVkaQoOkuafZL16ueiMRD+0+8TlPFHhfzC4m8u7OzRkbRsmMBsg0mxqbxxdGV3s+pcB
	ixDWNBQt/Ln5M5f7KfaD8kzPel7lgffqfKGsHOzP7GVXycXHd39Km/8EYpkHlGnquxRI+iW2bZM
	jUeh5O1TFWzbZFWjsm16hd/Avd0Hwa7Z/UjxZp4RZl5uv01vxcKuw2ySO4C8vXgL1sAGtzggdLJ
	PrIW7xVNrj0gz2v656xeNwEidETRAosMkMxrtJQV+nQ0Yr/5XKQOpVy6oRgr22IapbZJODjQ=
X-Received: by 2002:a05:693c:2c0c:b0:2c0:d04c:a6a6 with SMTP id 5a478bee46e88-2c185cdd1e9mr1119855eec.6.1774607090548;
        Fri, 27 Mar 2026 03:24:50 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0c:b0:2c0:d04c:a6a6 with SMTP id 5a478bee46e88-2c185cdd1e9mr1119839eec.6.1774607090054;
        Fri, 27 Mar 2026 03:24:50 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec495b8sm4756173eec.10.2026.03.27.03.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:24:49 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: add IMEM and PIL regions for
 glymur
Date: Fri, 27 Mar 2026 03:24:34 -0700
Message-Id: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJaxmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNz3fScytzSIt3M3NRc3aS05DQjIwuLVNM0CyWgjoKi1LTMCrBp0bG
 1tQDgAm1uXQAAAA==
X-Change-ID: 20260327-glymur-imem-bfcf2288e5f8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774607089; l=1181;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=10fzlebEz+tiEIKnYlb/0ADkVEcnq4RaKhJy10754c8=;
 b=Fb5RCnodPN2nRvi1W0qL3rLkgcHVVD23hLaKAkYQU6fnjuqI8oA9wvugrbU/wqMwRckquurSU
 Ph1lFIOfbKbCrRx4pLJEbNB5CLm5g405ffKBf5avHMIzeIAk2tguIvM
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-ORIG-GUID: mZ9dvb5CKvcyWLzN6v4LxLnuGKonco_7
X-Proofpoint-GUID: mZ9dvb5CKvcyWLzN6v4LxLnuGKonco_7
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c65af3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DAI0kpoKW5vxLVcNGS4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfXx/ZSHrUVwHDQ
 8HJIajRphbhmYayPDjuuUTnVNnhPg9/ySGgBwJofTbdvHh0C69RQSMW4+3k5tarvTbVXMAh5kIJ
 rV7+m9KvcO4Z6hDvJI6AhhUUteFBr7/p1rO8RBehFf6YlSOIBETrcmVd58eBWtTsutvdg3Gi5UN
 tDY0zbN6FjT0JoaaHQuv5oVdPQPv5BEUpUCubjFuYtYqzoIvQqCsnAKL/hSCyjmfhtglhksNGRt
 xMAbuyLnXt3Jk+r/vuGONcnjlHRYzuzZYGWCoS7HSUk/DpNjolGlUdQPvx2qOxhlgzZDOVEUyj0
 Bx+ZE2DHi96w1PUJcotrtG0C4ZeAoxWfZI04890i6/1dDdPwRfxCifTCfvE1VMY8WafxHK5EUhu
 BrQRUYJ6IQg+5/yoVInHeykcD530I8oimNJ4rB8n5S7YjE4KdGFu7cirjKMSydJmZulk4q0cN2C
 sC22kj54c3PQM9ObNcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270075

This series adds dt binding and node for IMEM on glymur.

changes in v4:
 - picked up acked-by for the dt-binding
 - added dt node for imem on glymur
 - rebased the commits
 - link to v3: https://lore.kernel.org/all/20260129071435.2624252-1-ananthu.cv@oss.qualcomm.com/

changes in v3:
 - moved dt-binding to sram.yaml for mmio-sram fallback
 - link to v2: https://lore.kernel.org/all/20260123101501.2836551-2-ananthu.cv@oss.qualcomm.com/

changes in v2:
 - alphabetically sorted the placement of glymur in the list
 - link to v1: https://lore.kernel.org/all/20260122093319.2124906-1-ananthu.cv@oss.qualcomm.com/

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
Ananthu C V (2):
      dt-bindings: sram: document glymur as compatible
      arch: arm64: boot: dts: qcom: add IMEM and PIL regions for glymur

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi             | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: 6b346ee225a1747218759fc4846aacf203e1eb35
change-id: 20260327-glymur-imem-bfcf2288e5f8

Best regards,
--  
Ananthu C V <ananthu.cv@oss.qualcomm.com>

