Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE55238837C
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224450; cv=none; b=tBydweLcY2YSxz0mYk+x2dXXCLwiFZgbwhw3oBoVydOf2/e9H+xSm8l7anDNfMs6sANk8CUSgxHRA/tQlqeI6K2S37WFkgmZNuZFcwEwwxRLPbn1FqqmqvR+91cq6vKNkA3MfRx8gXQQXHJuQ5l6bi/erjhPA0+/ciXgly/BnZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224450; c=relaxed/simple;
	bh=FzhEUWjHP3o8g/+DPx5TgUlyQOpbAk0y5s4ojI4Qdng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGR2+CUvcQZNeTL49/bWpGWYgAOyzRcUGMnyC5D1AgICxSq5rYhbrWl2aRzvvrK/eXR6+9fFItSNQ03hdvaeC8WnD8n1IvOYK+8+9utiliDA+L38M/EQ/l8IL88zvbUlqjZHUr0pBMA713wHv1hjTbLmezVbLSrSJD7xMHutw3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J5exkKSq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVghJfux; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J5exkKSq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVghJfux"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdbAY198036
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WhS2hzp0PsX/0PWvkNyujKa83Ro7eUTPWWorD0OWYck=; b=J5exkKSqOvnD6rYT
	MNsLej/QK9Ht0vk+ry1Ize7bT+/mH6bq8Rr/k5o5V9unWioQKpHuHhv95EOdwLNr
	SBXRrTvXPSAMgcG4GbiGXBYmWHbiA+AJZEDo8EkWdOqIPbCgq+PdOl/RifoeAaMb
	TnO/UsPYzARqwIgerb8OXhRbsEygIoiZnC5vZZ7LJxcnqjjwhEQ3S5LQW63N7kFw
	icxIogQM2l7CYOqWEFNX+GxEb5zlPNu7FX8Ro+c8nyCpcSNjdejKXTwsV0pfLJYn
	KWutgA8p/cQpjA30Y8Rm5uICSMjByLS8C+VkI28hxlNbfFQkyFnZZ4jAduAGtycs
	6lCFng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ch5th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:47:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d7e0f3b4so2558592a91.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 07:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789224447; x=1789829247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhS2hzp0PsX/0PWvkNyujKa83Ro7eUTPWWorD0OWYck=;
        b=ZVghJfuxSSVVIA6OCHGkHGm0LNb5sUNzu+tbDVjfNXauqC96qvR9ZGI7fdvKFzlSHb
         bN0fXJ6BSk3pQ9NnSvQBWz+VgNXap4Z89oORcql1F6J1q0UGgi5gqo1Drn9pZDm+eMy7
         /9rCIDm6MUZ6xUkTmK3CSCyEqfS1sXaXthR4wxmIzPlD15WqLgrAcHobKzK9DyzBoGti
         js77benGniqCte2ngNmHKpokrURoc2VJDE3lH2boXOZGlj9kKd45/sswxuzb08P6WM9r
         t09BoDEBLOFHMct20O2ElH9DOMa7y7Kpf7Di7z9SL4DlNvL6Tp8fqGg2C2ywFy+Ut/V+
         W3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789224447; x=1789829247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhS2hzp0PsX/0PWvkNyujKa83Ro7eUTPWWorD0OWYck=;
        b=g6Oh5LZT+YnteC+HXPsIlLo3YnPP/V81rNlRDJCAvYqwVjWnT01lH31Z3xveJT+MEF
         vqhU/awNGiSHw8UrgrnPx6C0Qexhu/kdx/BtGzOD/z0jBuv4wXNMFNxnuAPRaSTJhfjI
         BCXYJoV6rPVfaRYgrGfStxtkc7RngiPYDhQieH5xWWdy25ud9/upkPrdp5z+ql6jmVn5
         D75gbGfZM5h+HYrWc0iy6qnxki6/5OwaPzISgztzhxTziwj7fzKf+0MZxTCyRhWdsCLw
         23Lh5DyBvdZXEtyIG0FEVoKsz68ByhY3ivRMxGwa2BJcMWrgsUxE+YVWrvDkmCRYcI8K
         FhYg==
X-Forwarded-Encrypted: i=1; AKwUvBwusXz7aAR8GRUE3TP3sbLzS4JgOdpU2W9+oUbFiNKRs8zUgTSy1QCBpZsvCypUkOFb2aDTjZSjqb3S@vger.kernel.org
X-Gm-Message-State: AFuF++n7B1ELXL5GfGJIC/yC/GNZh//rxord+VB4tB2sOzf+lR0aAj4m
	qYmiLTrZq03SaAh4GM7dov5ZC/cxxv9R+gqar6o9aSWxfbLYtYAp/c3ZcIzR7Wy60WVmnKOZAAp
	Cb0rSBJxHxvWVS1dvkAs/ogXdbK0IgHQdLNBeLNWmRr1F4A0TecF2rSx6trNJa2Tb
X-Gm-Gg: AYBFou0i3r9diZriPDaiyuYC9l7P1Q5i/Q4jBXbBc0iBTvoQpNSctxzXorh0VRpqDUp
	XIFgxxpRS8TWVb8jsZnrcsXi2ElDbCkd/tEOHM0dh3Z0jpjmLsyQvZULGZrYrPgT909JtfvVkWg
	7EwfUiKq85WglsDC74Umvw/90DedoGUEpz0PR83elaBd0kF93MyjiZUvUAsKz3fblWZorAF1C2V
	6BGbzNBmGa6f7mkUheMSZ3KVrGb56fP4LBnaxLT+g/xxMwN8QP3DsGwcQnsEfJvctWABzvj+qm3
	gkrmEbk22Dmqfep53mSi26L5/BpeUDyhVGMy5ZAyTzzfR4xpZvNhL27ki64OGrnpU9Hr99AIuC4
	hrUDrXQtxEG6D8uo=
X-Received: by 2002:a17:90b:4fc5:b0:399:149a:3f27 with SMTP id 98e67ed59e1d1-39d9bd71246mr16716143a91.9.1789224446813;
        Sat, 12 Sep 2026 07:47:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc5:b0:399:149a:3f27 with SMTP id 98e67ed59e1d1-39d9bd71246mr16716076a91.9.1789224446383;
        Sat, 12 Sep 2026 07:47:26 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm14344833eec.26.2026.09.12.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:47:25 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 20:17:01 +0530
Subject: [PATCH v9 1/3] arm64: dts: qcom: shikra: sort /soc@0 nodes by unit
 address
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-usb-shikra-v7-v9-1-c7b507a0ec27@oss.qualcomm.com>
References: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
In-Reply-To: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789224435; l=11303;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FzhEUWjHP3o8g/+DPx5TgUlyQOpbAk0y5s4ojI4Qdng=;
 b=neDY9LbSX/VbTmXeCUmKmWYJK7Aum7aWdiru3pMzq6XugFID7+EDOfodGLeszGyIsh/99d7/T
 f93ZsyRkYCMDbdw2fp/cgCE3tD3BLw1SKsFrkMgqpKTst9hLV08sthq
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfX6bONEp4VkQDv
 Lr1u0/W6qPBzRhmxr7xnnpLIt4rds81faKsRYhXhyCuhrrmQAR2WDwbBZqnqkAdR3+MS4FSGb33
 US0xWvOn0v5/3vYiDMnuS0Pa/5jblpY0rUluMkgSVf3+N8Bj1o62K572X0hDN8eBQEHJFCWEPf7
 iNAqrBBYla9X0wqN8sgTnfgFuOPHdmyfIV2/iL7hTVShIfJosuHsTiZ02w9nfUuyxcX7hjIz7Tn
 TaDOsD5pgdCqSAtVEG2fuB998DU7fYWEKqVhCYYigVWcjas1mo4praMtptW8/rwiVivZa+TSB+5
 aW4xQ/W7lKGwHhsL6UEZCRA7C8M2hRTXVtH36n8PO2cfKbAC+IHwMQwDAPubc1yq85idGmrTd29
 kIPnt4ebC1CrmPmPDIXOAzY3mZzESFipXrGUyqO81r3gP423PcPEYycqqsqi6wr2g3iLxdyfxXJ
 EUbIY9bqS3cSzFvZnWw==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa565ff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tCk7SUNsVWS_J4BNN7cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfX01itplKoaq+r
 ROix48eOhOs8qyRhP23GisXIjBCX1nRsfbTMvEj6hMXDNczHUkCF0Ei3Beh46tDfHdbux6QA4yv
 BZiK7D94UdDnjwhUJb8dsvTpbllzFs0=
X-Proofpoint-GUID: DJchoUf-ECRWO0UNVl_LNoSP36U5BWN9
X-Proofpoint-ORIG-GUID: DJchoUf-ECRWO0UNVl_LNoSP36U5BWN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120213

Sort /soc@0 subnodes in ascending order of unit address.
Reorder the misplaced nodes so their declaration order matches
increasing node addresses.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

