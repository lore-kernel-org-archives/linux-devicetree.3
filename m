Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1DC43B6C3
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357042; cv=none; b=MXrsmalzufgA6RQbaDd1DkMiCYyD8qVTcMDDOYHuBIXC5+JTU5t5iRCw4sRsfv0X8HCQz5SzGmufYpPJA8rhICLG8yLY6t/OIizvHFNzo/JBtcxpf/cg54g6IPmyGltwaga0oXzj/ER75HWmsAWP4zsaGFgiI4O3RuvbmsIvX38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357042; c=relaxed/simple;
	bh=wbPY7V/FOl4cQCe5O2DtEsw3MYaK7JiEV4us8ye3x1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u3fBahG1IAEjG1MKhd72pAiAJg6H9IgDSL3P1V/UczNUxh7rtlQQfZR9yiQfx1dkZRotlCBhXdE2+Q5p4cgunG7CTRvTY8mmo50gJE1OpGpEnaN556RXOEc9OvQSo/8gzewhU2sLwsL20fVTkSlpEDgaNq9iy4Ie32FEJO2Iq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xc2Q1tBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZP80XTXt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xc2Q1tBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZP80XTXt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF0tY825599
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 16:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LlsyewBqxauWJCEQm7ANRaFSqV4fDdt46wPdk71U6iw=; b=Xc2Q1tBd4ObuSVGv
	Z2uWuZG/ah0C0okCAzSaWsmYSqLXRHVShTyuVimtessLLVDQSDdBC0m+yRsrdsAZ
	Cr5UW7Ltudr9r0M+T191BnRUs5vhxUD49HLonGX2zfl62+emnRDaxycOqYHLeVcb
	wc+Hv71lQ8Fp1QXhlSykLaFSUdyNxvcr0sn0C/RSYIscZwrkh46LUbveP83M2jZg
	HSI47RDxtqeFGMJ/WHZSap7RjmktmAUgCN9hrZMqy5K+KFVh1DJ5l3pDVLvRc3pn
	CSajoF9i6Jbk+rd5c5DXVl1UtTMI5zNr/4CUjAxiBaPbI9Ubn90FAI+kjjvoWIy0
	Er+8Pw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8aah4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 16:57:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c98a4ded1d7so2931984a12.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357039; x=1783961839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlsyewBqxauWJCEQm7ANRaFSqV4fDdt46wPdk71U6iw=;
        b=ZP80XTXt4+puUqpSajBPpKLshRyk3JL97/wyimS4LjVJqHlyFFA9gnbItoAiiIwnjy
         JuidT9OtC+nAagJsm/EldKGvzoI16eGnwfFwcY4q8GfYHvHS3iNzC5asJRFVkCDa6MJZ
         gA0mMiIPNLqdFwGlG54JB8tu6xsSi1fRll8mDWANTSDKC05VHMNkgdubUCObx1eZ90B6
         tC01RiG8oLCR0x435Di7OE4qKM/fl/A3uAfVBbYtGfpTva5TzhhyfOHFCkTwapz8ouIE
         sZT7q8MNAbdiEAgninUV5vMYEKAB19zpGD0qIfoFwqlv5GxCAnyAX0ooxvzf6ITYqKCO
         HN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357039; x=1783961839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LlsyewBqxauWJCEQm7ANRaFSqV4fDdt46wPdk71U6iw=;
        b=ZyEaIhff+Ah4GLy/6OUNbepQEIpF48eA9uLyseykH4BMB1YvvPrJb/Xx/9ziutgaFB
         NCVzFKHjS3m3osVSvBRRusBrigRO70Enq+wzBgHUuBkMe+LPC7bEPh1tVMsg/pKFsIF5
         CfeBaBGvm9nJ0CGpPdXyb60EDesz5FD20jxMo+oDa6lU6bLuiEkanHg3BL/fIQzUnJR7
         uThlXPFQK2m0ZHm/7MI93FYMrB8mlRPntZNRhTUy3RkKkGGVt73STDMWqa4eJJ05IcwT
         T+erBHHKAUf51IISaaQLPDW8qVjgIGI2Azb4JSWwqNjATgeOzdxXfJD14zm6ut+J4oJK
         Dzlw==
X-Forwarded-Encrypted: i=1; AHgh+RrM2gYHYce4OqRwp+fqa/XgCKipRT/nxmqOWX/lCLwFstUyZaO5vVHRl1p8ZPCVSrmstjXhYuaRqxSH@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXbbrYrG3B9NzATKKAjVMFRD4oFLxLSDX9PKc3sQLKyB+hDB6
	mG0mRxioNqQvl/8xf2qmG9fOriAsENZk3YhlMIg1Ke4AWi91K3QQSUtBE8ejsT+1UWd0UC7eKiQ
	dXEOoQiY1VHJyjCupa+REwenzC9AQs+EiNz27jOej4fKTFkWf4+FXpuGrIv9seoWWsnceeTBA
X-Gm-Gg: AfdE7cntnkg33N61KT8cnCE05/JOnAmasEoXVlMMoDxl5SPB3Xv9RTFWs0ILw91T6RQ
	GH/Omzza2WdQFGYofKbR27XSNZ6aETZp0Gvk4+K/5OEp5L7ZfVRPLqNonvhA42fnj9fCnakOSJ3
	LGIP20ZUR/G81heP3EvMKa7vmQGK/jSq5ZLv2I8fjVgyMaNp7zapgUaFdFu8Ou5BJFXSDhjlRwV
	dUOjrSo2Q6oL8AyuKZMjrhvIhSHu18Z/nLqSv6sEDpmO+HNieYXjuxuqfdv2AdcxS+1Oo8t9mOF
	brILFe5EBWhjPviZ2eBHD0054UO3rwjDj+wp0b2HdNkZsDMGbHqHO68kClDg2QdNXUZ55sXYcnV
	BaGsoig+TETIZy508WS/I7mCJdsFOL01tbh8iF5N6jA==
X-Received: by 2002:a05:6a21:118:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3c08ed0f40fmr1869367637.4.1783357039220;
        Mon, 06 Jul 2026 09:57:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:118:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3c08ed0f40fmr1869330637.4.1783357038743;
        Mon, 06 Jul 2026 09:57:18 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:57:18 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:39 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: talos: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-6-afdca0125a65@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
In-Reply-To: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=992;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=wbPY7V/FOl4cQCe5O2DtEsw3MYaK7JiEV4us8ye3x1w=;
 b=uIp4SJQdb1agf7l0A1zJf93Xn7ky6npMpVlZAoLLOlESlUMOfaywlUkQrpjdFuhJvffGiF/zC
 Wp42e5jaL2MBLNqPZ4dOCIwPH4FLxkvnx1FF0fFlDAOxJ32l0G6R0YQ
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX5pWY6byQ0l5c
 kNQSsQ1HWFeJP9i0CEsjV6g8U194ALTCLhNhbZYCu0OAYZJwM0xxMOfoMhEESZgbuSmbRkWz638
 CEc6tAhpCM22nCljPerbHxrnpu9KeBA=
X-Proofpoint-GUID: gKTPbdxXcEgl6IbgD1wD5L1zjIIi56iD
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bde6f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: gKTPbdxXcEgl6IbgD1wD5L1zjIIi56iD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX96j/5WePwxkH
 wHzsUqH3ApTME7B1gs+CvGhEFxPAho6qkekgtpBhx0T2aPEk7B5kzcuqulzAhPHpWsab7D31uKp
 w+KjLkKCxuUqaqOf7d0dhcAkjN04oh+d+uxYhiQ5roABZejEFJITdoz2nPKBo+OcMYLJ4qfgHpw
 xZcgRoGpS2ZbaZbH7/ArcE11qZ+jhCqK6CXkYGn+LSMxWFi/kEZvzQqv9uGywhlkF1czA7aMa9I
 3TR1rZQ30/4geU6QtUMWK5p6Ekgm4yBVPoBnBB1CKFfqop9gi53q4yIzIjwdnz5kk+mhNV5HIY0
 b5nFbo6LfryBLJHjMvFs8+CMGPK2r3nD0SP3Jnn8Xh5L9+z1CM0AnS+02t69AiJicaJJvH+rnE+
 uPxm4X15dXTOCLUGVGmpSzpzsGEvDClnZUVDUrMS7L0yYGbtYFJUItspUy1yioEhLc5bHv4NkFa
 v7nFpFDQKHukrx3DCVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060170

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index e506a16c9070..ec7f2c78ad18 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2090,6 +2090,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1

