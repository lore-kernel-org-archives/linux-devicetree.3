Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6756C3EDE57
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106868; cv=none; b=lELAINXBNEfT4L9DQ/w2oEO9DVAIHUbawtAsG+6duAsg4E+eRU7iFLmLWe//E58yo9eH7o+ZOlFeAd487+nWskfuVW2zN1NGWLKpOyDd+wsLWEmhCgwfs8HQM8NOoao1nk/e/G4UKraCIDQ5cU7LNoPI1WRospzfNVeb9koaoDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106868; c=relaxed/simple;
	bh=FrtG2gkP3KxuKTYbRKLNUQjyGMw7MD7TpHf5dOoXG2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6N6z41A+PJxKTXti6OrHDizXybLZCCw8Rd59xFMpkZQEmN6Ek0kvAEKhLsDIFg707zvj1jIrXy3EERBqZFya6e8bgqHcrhzIfv0Hgr9xqWj08UQE1VESpRWk3J6CFmtI5B9ndJJm8qK+fGYuWs8OAI30ayFmobRJVI8s915O8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XjnoKjmz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ev9sIs/s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjnoKjmz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ev9sIs/s"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B5JBcC4002409
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	92p9olcewNpiXQhBlXX5ZljBZhuk2ttr8gGw+qUMRWU=; b=XjnoKjmzzxZrTvB0
	MTcMQ9lNAage+v+MGUbTcRXo+yx6vSrVuXG3ZEQyScU8cK07WRK06kar1i5thQVe
	Z5iX6YYsxjtgF/g3WqTmqK7qOPEnVBtjjQfdfX5xEpgvvMjWtopI7t/ewcBCpKau
	WosEgOON4VroZb02VAscLZJVN83cdgjiq4LBnoyudjRjGJixsz72m1tvFMP9bv20
	UoVspZAexYwLAeThWCnlhMEAF9IUQ4iHZztcT94QsHE8lhwFYYVJjjJ23IFxnk4r
	JQ6RB0AJyF5qPlfGgQp9p9AX92DV8xCPQf7fMjdGLg2MCleC+r1Bm9W6UDA6Yezg
	u3fV6w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3857h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:07:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso703610a91.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789106864; x=1789711664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92p9olcewNpiXQhBlXX5ZljBZhuk2ttr8gGw+qUMRWU=;
        b=Ev9sIs/su67fgilJqPqaDXGWtrMFce3pvuarrA+Okspq9YYFwpI4E+mqZ17Z6P9yY5
         6jwydtEawHk9n9woOrekZ5knHAheVFx8a1NvRsHJyWdBAky230DnvNQUvej3xayemaRT
         MNkaaLf32aFeNwstnogFz0leN3uv8orI48vYPAprBU9vNLM/nqGw+fhPzsrODUI8xjT+
         ignguDFGWyHVpBjGI0dgPea43BAPD2pSHfWuZ3hJQFhH55wCvs439qyFxygHH5x7Si3m
         UYHrdFf5IAey98ZsjgDicrJ+26MuibUjuZCmsI0fFKkBECqh/srCjbXan4AjWs98E88S
         lVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789106864; x=1789711664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92p9olcewNpiXQhBlXX5ZljBZhuk2ttr8gGw+qUMRWU=;
        b=YR+5IKzzBsehDV9dmn88bg0TrM0Mp/pIvI3gtDMU4aoB/YXANPv6WQh3/J/oIKgikb
         Z4reRk0r9KQq8fNUr6n+v4TNDW8iTh/mQk0jMn+df+Gw7Ds66NV3kSXotfLyzAmLRmVe
         9HAmUq6umNgyJbzeXaXMxsmngZbcN8EHDZ35MUT6gfebGs2gCVHUUZhetqsBmBE4wgsj
         F+Ak0Xy06hHK2vFPtVqqDBpv7FsF4tN8onyd3KmPvzv9hqLKOLQTSv+gX71HXF/QJNKa
         6HcnXQUYIOaivacojS5QUF/FlJf0KhsI6ITIgUrepiMDmnJ+Lid/P4+hMko6//ZoorY0
         sEXA==
X-Forwarded-Encrypted: i=1; AKwUvBxiYAD0MM/bczVOEFmTK/Yya+StSQ5/Xbdn/HEetIjOwfnFfhKC8QSp427/CXDmPW1hoTg/CqkRqDnP@vger.kernel.org
X-Gm-Message-State: AFuF++ngSvBosKNZ8qrK+0qZEKLeUQQR1bf3DJy3xZgPCqB8eyjP0kn5
	lD1ipNqc/rSsiPCaTuNekvc/vPwhObv7GnXBHN1DX72cxPXhH90pUmtzd64+TJ0lyhODk+MpOe1
	3Tr/X2h0K8qRqaFr6lsdUi7cwQ/IvRCYRe+FmW+m802naB8CB3we5WngtP8Ne9nGB
X-Gm-Gg: AYBFou2M6UsDQ1hc4U4MVAfzcl2s7Utmxis5GravhfRWu5mN5DhVKHBzsVh5GLN0zLv
	/1W5Chl7T3+KTxbwt79YYKbHue9XbAXK7t5yboG4KBhH6HR5ZiAUNsp44E1a8Q5gqQCeXc71JF+
	7QEypa7oyrlDUoi05N1PN1oLw0yAt+RG2NrKVThHzWgynoZwNawa6mafno4M1TwRWx1+RncsYHA
	WCeIre8hIlRk9udNMs+9Rkf+ZQtUuQousctV355sbPfvZ8aZ56Svh/FqreZpir15KYukdxKtls1
	PuMNrHgc/PF7Kwqndr8GXZiCeBp+v0lZuEiNOx0pkgrLmi58NjLqO1Qxc2jGeMmtH2vvNUI+aeG
	fxH5QsQbs4qXf9Fk=
X-Received: by 2002:a17:90b:3a44:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39d9bd923aamr4577992a91.10.1789106863873;
        Thu, 10 Sep 2026 23:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3a44:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39d9bd923aamr4577908a91.10.1789106863324;
        Thu, 10 Sep 2026 23:07:43 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm2989933eec.30.2026.09.10.23.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:07:42 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 11:37:18 +0530
Subject: [PATCH v8 1/3] arm64: dts: qcom: shikra: sort /soc@0 nodes by unit
 address
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-usb-shikra-v7-v8-1-851ee4bc0eec@oss.qualcomm.com>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
In-Reply-To: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789106853; l=11250;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FrtG2gkP3KxuKTYbRKLNUQjyGMw7MD7TpHf5dOoXG2E=;
 b=2XW+BCU8vSRQErXaASIGrQgs5Nsiy8YfljLk5VD/DC+7f/13ZrUSC8fkS9c9s335qmEkbUhZa
 J2Ddl0z3CDhD31d6RXqmVd3BDWQQO1QViJnLcMHOER0ZFeUqDiclk6m
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa39ab0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tCk7SUNsVWS_J4BNN7cA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: pY0hweu8R4N8bq9EyRxWGbS_ki9cIgb5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4MyBTYWx0ZWRfXxS2IQ7+v0ekE
 EoFooFz1crUcLiirtU2YWT/WTJgBR+3rsaV9RXm9E/zdgDvKye0mMeA4Qlpl5ce8Am0dqvbKAHB
 nFB6rXT4mAji5XmvDY+zH8fjoNXd1HU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4MyBTYWx0ZWRfX1GPh9NFjYnZt
 eWDgIMoq2SLKYsirCkKurPP02XkGDrhV+hPbt+lAXuFo4PYfnNJZtL2JYajCNdhkyKJGTQx4c16
 JedVXERoKHGnV+wd3yONnzXQrtv7EYAp7K8LrZdYz54I7EALycRMau+62pMEL46371elIgbp/r8
 RHCOpWpsvo0xL0oN4PXYEiaMiElbWECAbrnE8kp9jgya9MewGea1TvnginXfM2+CfYcqe96vZOg
 YxK86LgUf/bYTyKVj4Tuakrq8Oe38NeRMhAxGxxQ7EHmTpZIvLrOOAcayAX0hZwo4rr8PeLZjkc
 BRKy7vODQavQMt90pZ68yoygU9WpenNEjK8Eo4L1e0SVV5JJ+JGmvn6uQTt6l98s7fSJFynSOL8
 FK3TiL+heS7yfC8PSM4sOCSbf/A7IYyk66CAetGH+1PSmwRDO9sRlqgNmge7u6dgQTxMAq5V8Rd
 1Fo8NDBNSXF/Ffzu4Uw==
X-Proofpoint-ORIG-GUID: pY0hweu8R4N8bq9EyRxWGbS_ki9cIgb5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110083

Sort /soc@0 subnodes in ascending order of unit address.
Reorder the misplaced nodes so their declaration order matches
increasing node addresses.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 350 +++++++++++++++++------------------
 1 file changed, 175 insertions(+), 175 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..921ae2a5a3eb 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1234,6 +1234,17 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@4748000 {
+			compatible = "qcom,shikra-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x04748000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+					      "iface";
+			power-domains = <&rpmpd RPMHPD_CX>;
+		};
+
 		gpi_dma0: dma-controller@4a00000 {
 			compatible = "qcom,shikra-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x04a00000 0x0 0x60000>;
@@ -1262,17 +1273,6 @@ gpi_dma0: dma-controller@4a00000 {
 			iommus = <&apps_smmu 0xf6 0x0>;
 		};
 
-		sdhc_ice: crypto@4748000 {
-			compatible = "qcom,shikra-inline-crypto-engine",
-				     "qcom,inline-crypto-engine";
-			reg = <0x0 0x04748000 0x0 0x18000>;
-			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
-				 <&gcc GCC_SDCC1_AHB_CLK>;
-			clock-names = "core",
-				      "iface";
-			power-domains = <&rpmpd RPMHPD_CX>;
-		};
-
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;
@@ -1977,170 +1977,6 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
-		remoteproc_mpss: remoteproc@6080000 {
-			compatible = "qcom,shikra-mpss-pas";
-			reg = <0x0 0x06080000 0x0 0x100>;
-
-			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING 0>,
-					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
-					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog",
-					  "fatal",
-					  "ready",
-					  "handover",
-					  "stop-ack",
-					  "shutdown-ack";
-
-			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
-			clock-names = "xo";
-
-			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
-					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
-
-			power-domains = <&rpmpd RPMHPD_CX>;
-
-			memory-region = <&mpss_wlan_mem>;
-
-			qcom,smem-states = <&modem_smp2p_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			glink-edge {
-				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING 0>;
-				mboxes = <&apcs_glb 12>;
-				qcom,remote-pid = <1>;
-				label = "mpss";
-			};
-		};
-
-		remoteproc_cdsp: remoteproc@b300000 {
-			compatible = "qcom,shikra-cdsp-pas";
-			reg = <0x0 0x0b300000 0x0 0x100000>;
-
-			interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING 0>,
-					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
-					      <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog",
-					  "fatal",
-					  "ready",
-					  "handover",
-					  "stop-ack",
-					  "shutdown-ack";
-
-			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
-			clock-names = "xo";
-
-			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
-					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
-
-			power-domains = <&rpmpd RPMHPD_CX>;
-
-			memory-region = <&cdsp_mem>;
-
-			qcom,smem-states = <&cdsp_smp2p_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			glink-edge {
-				interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING 0>;
-				mboxes = <&apcs_glb 4>;
-				qcom,remote-pid = <5>;
-				label = "cdsp";
-
-				fastrpc {
-					compatible = "qcom,fastrpc";
-					#address-cells = <1>;
-					#size-cells = <0>;
-					label = "cdsp";
-					qcom,glink-channels = "fastrpcglink-apps-dsp";
-
-					compute-cb@1 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
-						iommus = <&apps_smmu 0x0201 0x0000>;
-					};
-
-					compute-cb@2 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
-						iommus = <&apps_smmu 0x0202 0x0000>;
-					};
-
-					compute-cb@3 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
-						iommus = <&apps_smmu 0x0203 0x0000>;
-					};
-
-					compute-cb@4 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
-						iommus = <&apps_smmu 0x0204 0x0000>;
-					};
-
-					compute-cb@5 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
-						iommus = <&apps_smmu 0x0205 0x0000>;
-					};
-
-					compute-cb@6 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
-						iommus = <&apps_smmu 0x0206 0x0000>;
-					};
-
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x0209 0x0000>;
-					};
-				};
-			};
-		};
-
-		remoteproc_lpaicp: remoteproc@b800000 {
-			compatible = "qcom,shikra-lpaicp-pas";
-			reg = <0x0 0x0b800000 0x0 0x200000>;
-
-			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
-					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
-					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
-					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
-					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
-
-			interrupt-names = "wdog",
-					  "fatal",
-					  "ready",
-					  "handover",
-					  "stop-ack";
-
-			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
-			clock-names = "xo";
-
-			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
-
-			qcom,smem-states = <&lmcu_smp2p_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			glink-edge {
-				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
-				mboxes = <&apcs_glb 9>;
-				qcom,remote-pid = <26>;
-				label = "lpaicp";
-			};
-		};
-
 		gpu: gpu@5900000 {
 			compatible = "qcom,adreno-07000400", "qcom,adreno";
 			reg = <0x0 0x05900000 0x0 0x40000>,
@@ -2302,6 +2138,46 @@ dispcc: clock-controller@5f00000 {
 			#power-domain-cells = <1>;
 		};
 
+		remoteproc_mpss: remoteproc@6080000 {
+			compatible = "qcom,shikra-mpss-pas";
+			reg = <0x0 0x06080000 0x0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING 0>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+			power-domains = <&rpmpd RPMHPD_CX>;
+
+			memory-region = <&mpss_wlan_mem>;
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 12>;
+				qcom,remote-pid = <1>;
+				label = "mpss";
+			};
+		};
+
 		ctcu@8001000 {
 			compatible = "qcom,shikra-ctcu", "qcom,sa8775p-ctcu";
 			reg = <0x0 0x08001000 0x0 0x1000>;
@@ -3485,6 +3361,130 @@ cti@9900000 {
 			label = "cti_apss_2";
 		};
 
+		remoteproc_cdsp: remoteproc@b300000 {
+			compatible = "qcom,shikra-cdsp-pas";
+			reg = <0x0 0x0b300000 0x0 0x100000>;
+
+			interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING 0>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+			power-domains = <&rpmpd RPMHPD_CX>;
+
+			memory-region = <&cdsp_mem>;
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 4>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					label = "cdsp";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0201 0x0000>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0202 0x0000>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0203 0x0000>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0204 0x0000>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0205 0x0000>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0206 0x0000>;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x0209 0x0000>;
+					};
+				};
+			};
+		};
+
+		remoteproc_lpaicp: remoteproc@b800000 {
+			compatible = "qcom,shikra-lpaicp-pas";
+			reg = <0x0 0x0b800000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
+					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
+
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
+
+			qcom,smem-states = <&lmcu_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 9>;
+				qcom,remote-pid = <26>;
+				label = "lpaicp";
+			};
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

