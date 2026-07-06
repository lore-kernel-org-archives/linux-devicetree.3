Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0D0435AA6
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357036; cv=none; b=SE3Zd7Tpf7zZOq5l/Ybfizj06LQguoLbwGVUABbXR2QjtkIeReBwKkDefw6hBq9P/CP9lirBELG3vsOdGaGv4tbcnaxHNjKNnEeYEYNrkoFw5NU7cUMokGSjOXwd58vg2Kb0OHuYwWTIaM3tBM7QBkjGGPQFifBk6zkHD7O3+EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357036; c=relaxed/simple;
	bh=jqUN234mlgaPq8CBPF9A9IY6049dMha0UkLsYYR2Tvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkvC3HAMaDa61ZjOR68GkouKpT6EHmbvRBZ+dZFxDAtDBYwvs41uem+oTP7dDul3lmV7Dsw6boR9TVDn+H85R+vNmF36oXZVwRLXeDxP2zwAR/jmiLAaZq5kQG8oNQpnqIhRAMvTxdWU08rtazC9T/sgXnesEsz5fWQnz763xT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhQbgbp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRrN70kG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RhQbgbp/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRrN70kG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFN7p972706
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 16:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWIz119etuH+575UYAm8u+FQxHrd3RggNnFu04wufqE=; b=RhQbgbp/Gc3Cw2k1
	FM+795kU1npAxorRu8Ca/uqJcSQZP0gcrzXFhQ2dOBIbEEbC+2+EYyhd0lOSrPp0
	jSUc47Ilph5EI9I4oOXTdJtKRcitfTiDnMJucWUVt+kr5xGDI6DKpdZtOxbk3Oh2
	psaBQ6AaHmmCjO5afJnSgvPzloFBJISWQyCKfS4+aeh7fhrHkTzmuhZpKXdsyNsV
	Ti3jhJVyIwitGgAs29xe2a3gTBzY4XmdLGBfS0r9Ok+uENmwbl8EBIcjCltytoVm
	JuYDTVMgoVfhnV8dCq6mdTPPqD0y5Qa120MKngGEbma8XcFJ0daQ0G2GRaI0Aweu
	il+ltQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r1wqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 16:57:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88d7a75507so5376641a12.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357029; x=1783961829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWIz119etuH+575UYAm8u+FQxHrd3RggNnFu04wufqE=;
        b=bRrN70kGNEfbhEsP0Tc1LcDCIEe90/nVIs3fmavqgEaOWzriZpz3ONjWf93fgN18Mo
         7qSFCYjgTli5W1cm/6rxRdxq8b89b1s3xNjQzFvtXH3qDM8iQQKsvWRC23+YVfK2bdUU
         xGoGd1ScqlY5y7XMpfQteV3zgGyZpvVNhdVq/b9eWoNf2DA/sdf4aAvJ6IzkIQGdlb1/
         igkyapNFQlrBAePh6ZvmwKpaOzYSptP/dScVmxV30vdz+jYNzcVq8WRvPbVU5iD0vRqN
         yxCEppx+Hry4vYEaBwvS8RL8EcL+9WyMrm1/ZJq695ActzHXypb6wdBnlDkngqYORdWm
         WoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357029; x=1783961829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWIz119etuH+575UYAm8u+FQxHrd3RggNnFu04wufqE=;
        b=HRgmsBXlEpCeOH8dXPveRort76u3CFTF1QPDkfFDJUn8WYQHUrmCvOkYFoF+qNIbdq
         vn691Ged+j5pQ/yjaUIVTia3HCcFc17m9slADZGlbFQvdd4ilU1a7ULziCgw/CBt0ySI
         dBZsDH0LNhAfgcm0iR7j7faiMKMbiPN/jtLDgNcj6Mo2mApFHT/tg3eolkEJKHV2bJu/
         rnPJ7ZCs3iaJ3+1VnhGdR01Nw8rWnBKeW+cALBCB7AAn16UP0gv8QKrzDRDMqliRrBwH
         /2PdqFNihWxeW/KBC4l19XUGByLLl8NrhY7nC0pCcYEni8MFe+cFwfBKujEPBaKudbLc
         C5jA==
X-Forwarded-Encrypted: i=1; AHgh+RqEjzuoUmKSEdL9n/n7A0A0chk/2p+xl3/OpCb20sPnyUxRgUK6oqd7Hd7LIM5ruybiJ3uutTfGRlRx@vger.kernel.org
X-Gm-Message-State: AOJu0YzX/eC6u9opRh1x4ByQahP7+xKaYDEbQodQUVi2NyOUQW4lSHrB
	803FafPbSgxsICFc+EVoVeHmF5gDWCtCDNQoMum6DbN1pLYzxtTWrcMGgoybEF/ng1Sz6G+t4Wd
	yUYjlrVOD7iHB7Vrx1ItWRSU9M+VwhAZi4u9UWR843wi7QlPS17LEQMh6eMgmhkk2SnYK6n5d
X-Gm-Gg: AfdE7clOFFV/TCaQFlHaJuYo+5nkXc9OXBR43X4HP/nS2I8oOlWEut+G1y+NbEvKmq4
	wnRXmG54lrO8QT9+UhkgKD0Yy8qBf/Uf95HnQbyW2BrWIkQPKD95l0lcWueaCDNm1Dethgf3rCU
	XGCbF4xBiiH0LNsHc7/BrL/34yUEwPM/KVz2AFTN8y/pf2P4zj4Mh0QcCEH/OYKznpy+ytgvM3+
	8wjQeMYEgt0r8/BFQdnDe0Km8o0Jdoll5Tg7Bljad3glR785/C9LmHspsEVCrKOAGkqF4klml3u
	ZcqdKjkl8yWbA7xsK9gPWlqmOeMG6asfZhn0efsGt/3KoQyiADRICx+f62IhG7aV/FMIAHo32Dk
	YHFeGU6rzg6mjikweqjxs8w9jswmX5ydpSAJB/CP2kQ==
X-Received: by 2002:a05:6a20:914a:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3c08ee0dd12mr1703403637.25.1783357028900;
        Mon, 06 Jul 2026 09:57:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:914a:b0:3b4:68e3:f16b with SMTP id adf61e73a8af0-3c08ee0dd12mr1703368637.25.1783357028421;
        Mon, 06 Jul 2026 09:57:08 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:57:08 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:37 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: lemans: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-4-afdca0125a65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=1066;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jqUN234mlgaPq8CBPF9A9IY6049dMha0UkLsYYR2Tvs=;
 b=1ji8Ma7hdzOxQlIfqJxCYd4J3ISJcrVHCJl+oAGjgiQX8DpK+re8r+OuerLb9O0po65oAjDV3
 yxt38Erb7ESAe8axkhSI4hc2FzLqGqjsLkh6UNnFGO8TVZ8yM5p+i7S
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX8nCqudFjsdJ9
 L6LYkGczA0AACdzcVKgoVxKmKiabo6iwfynJYkfxdrXcNCobtb1Sla4XKAepPO6+fnl2B+3f7yu
 8Oo0XOZi8CcRJoF4l0WH5pW0D0e96fmHdyEC8pF8eGoEUamB1sw9lKspfmdthJXWhh9bLz7KIPK
 XaQUyo3XpYEN/iz8D5J60eE/BE+qJiiom29ZYYq05jSi3+Lv+/JWMiNwY4ozQusnuBFKDXcW7sp
 kkRt/zYIvJOup3ahPVMVqFdQ6oqGul7oKXjIZ3qOIk3PPOpS35ZwsoSij9/YcJRcnxAe3DpkTIW
 OCnViX5BRmjtQIVsn1OfCOv8S2iAsxvoHGqFrISBuwTvx7OZz21T5atwnd0RvfWNjB3XBkpbAtg
 rOFYP+QutudQorjEbv1uUqVd/fzs8DSZPJbLBVEZB17AN2x0JtKVpfPSjeBqYj+MxACtwlHo3kN
 teT+5LPvQPP4OWQznqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX1wc/td3X+P73
 KPpm8yuBSCBtgwXJcz647O4GlGG6IAAGWaBhPWBlEQ+93nRAVQ2LxZLOZuUgbhcEU4yKoBnp1wl
 beCWZWFcytYn41cKlPRNbFCmbn5JqkA=
X-Proofpoint-GUID: QhZRwjqPvAatU9cZ0h8RVohStznsARfd
X-Proofpoint-ORIG-GUID: QhZRwjqPvAatU9cZ0h8RVohStznsARfd
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bde65 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index a10322c5bc35..167c33d14375 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4809,6 +4809,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		serdes0: phy@8901000 {

-- 
2.34.1

