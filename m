Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01BC33B955
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410843; cv=none; b=VPn53y1XAKo56OR0psdXpGAtYspsWWmw3OELYYuqycT9UG4pJwkdcQAmv7JFUrpACoE+wwKNKlv53sT/dusqXi5iVbDv/2+VHl04tYGeJnn3jqD3fIXAT8j4b36VFjGxeXeXeSK7TfGfg4sz17uQWjqmkwM67wpaLWRjFVi84r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410843; c=relaxed/simple;
	bh=aGwblQ8MTVxhVkZVi/VehWS08eG+FZhNVgCkIeUD9MQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bhZHPgZvonnxDnf1Iy9ZjzRNZsqY8zZRTCFU7IFy87JofVSqHUuZzyaO2Fp5jEzoNjv22mqMqAG8qHD4d0ABWmQRzYcVKMFBvP+Tf4jc7Oi4mZbQ+ZGbBLUKpd3stMsM+1DGYiMQmI+aPJKxR/c8TPWvvh7Wnb/D2Y05Eh1zB9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqAXGcxN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B8BjoWiv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqAXGcxN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B8BjoWiv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCfGR989047
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P6zYDve/BYp
	t3VDchEmqfBfV1L4AHwP+iHj3eBf/rX8=; b=VqAXGcxNaMzx0itDBixjO+G/IyW
	aWZX1EWkOfFYWk7Thyh6FTpge6684EmhE/JBX5QTg0uileA6kd5/sKfVRKjQfg3I
	bPOIJiVQPnPgZ9IKrVqMutsi18zBYtzVMl9uhbN9SBDWdJiIu/qWIo33M4X98RaZ
	yTyeQrhsdiQaKpLEA0xwrUi4kxReK55iDlVvNvz7/H3aLbS+SEOnvBbxFfCYHdwa
	9TYlh1bF498YTCxMyjaTx0IMLp5lz1Ie4xaxuUDFPTrf3zFSdaul+ZAyU/VxcnvH
	voemQurH0b+FOwao/S+dIkADLBXRERvWMyAxgiInRUOnUre7g6GcIMS/K/w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m2xwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:54:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c613194caso1133010b3a.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774410840; x=1775015640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6zYDve/BYpt3VDchEmqfBfV1L4AHwP+iHj3eBf/rX8=;
        b=B8BjoWivh45Vja0NcR8IYUiF7xjNqqtpbGT98T6DCJHJI3VKjGl5BuXCohVcj87yhs
         AgkVrmDJLrxF+JWg/G28WO7lW7wcp1i0evJ8/h2zRhE6SP6erO7aFMPjjEpjSGSp+wmJ
         WL13o2kEj4vq65bNCvPzbbq4mjqSOp5ztSntb0EAI2VdbsG4jwuULmPgB2ikGFIP1DcR
         dHdlJ7Ubfmuf1La3Ly/qrqWkErEPDPB9yEmtE5/tisDVeDnMteMvdY5Q2X8KWUF3B7cp
         Oc6oC5j6AynQGx+LlqNJ/15ljp63lp8nwe9UGah5oAduabK9CVJUz6ctvBicyHNtw5YF
         K85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410840; x=1775015640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P6zYDve/BYpt3VDchEmqfBfV1L4AHwP+iHj3eBf/rX8=;
        b=hqjqkLJC5xWe+AaGzOzY1RfQyh1xiIDBEYntyKVNz8eUL2HwCFVlp1ccsJesffVmCh
         myIcmI6Sl5bAc5AR946xPX/8rZJz2+HWST3t7Inqz294G8duPj/k8sCIdMGLnODlUBT/
         CLyxxaDw0knrkpX/GvyhAIMNNJF2pDnfbMaWHJFNdmJHfDrVO/6xNuBeJFJyCJ8NlMOX
         OsiZysy3TG7l7AZK95I+DZvUa2xN0I02rTYSCitM8S4JdqfkXCuSRAsNqgIYDCdHWIDs
         YpEV7oxgtYtIYJQEPWxLLopfKBSC+GJs3gTgSrvnFLySCJrm9qDDM5UZCShEJEeXGj1g
         8hnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUK9b2/N0qyD6QGcNA85KyqpVjm5sPmQP9L9tfsHdfzeoda3+8pTg9TfKqbiUehxvnGQIe1GrVbCN9@vger.kernel.org
X-Gm-Message-State: AOJu0YxFgTJ8sYnHdNvx2EwuTXtxSpAfy2aif3I6NA1BYJllA2XC0Lg4
	LL1keIFrRP9Aar4uBU6XVoQRJdWYU4oEyXIPmVbxzq+R5fUQ56hGggbs6sMq5svfkwCSyWlokNX
	646GiK1AJA+XlZSAk15OwikBBZ8lYg/SKLG9fizUdE5Q+tWIdIof3CFqCqXwJeZWo
X-Gm-Gg: ATEYQzwsKdAiU5EnSNrhVXsboswKZSxocahelECFL4ZQVN10FbpSSoQgglACRe5N8Gv
	5RrpsURJ2OW9ayA0SmXduti5FS9OGIDRklAynGffG9Gw4BbzjorcbYmvy1PNOWUfC/ERIosxrCa
	CqSdkD9ySg4lR5S+SkjjRMuhhgZ4tqo/bNsA9YEH3nPgUhFr6ApB/1kz1bpOhAzFQIDBRkqlMVU
	UjYWeU7Em2+xuZkZHs2CZS1eHXWvOjZG+xarUh603C7kLFiBNA45dapB/I5OdihsTKB0jxDjPjj
	uCqm2aj/Ji0J8gHjGk+CThOdy2mV78jv/FLbg56+hcOdW8UA7uj/R09xMhE12RBTGmWSVKRO4Iv
	2/qcPwsqfO3y+0JRef3CvEDwJiPNvKANuL3LpBm/am/f4tCJ99pFJWiN435NbLctjCSzgVnqJdY
	YvezVh6TmnVDQs3VUeK4CGlmNiOSjvNeAodGrh
X-Received: by 2002:a05:6a00:1da2:b0:82a:fc5:fb81 with SMTP id d2e1a72fcca58-82c6de7391dmr1624244b3a.5.1774410840424;
        Tue, 24 Mar 2026 20:54:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:1da2:b0:82a:fc5:fb81 with SMTP id d2e1a72fcca58-82c6de7391dmr1624221b3a.5.1774410839694;
        Tue, 24 Mar 2026 20:53:59 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410870csm14220689b3a.52.2026.03.24.20.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:53:59 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 2/5] arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
Date: Wed, 25 Mar 2026 09:23:35 +0530
Message-Id: <20260325035338.1393287-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c35c59 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=NZoh-cpM5xcobfd524sA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: tRBETJtZthLu6Db-C8y19Jer6MXqlaOj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMyBTYWx0ZWRfX1WCHJzxbosYY
 D/EstQfCa/tEu6CKBywREaMd6978pXvGhdah3JFLc+XzTBjiVnyPofQrqmujzA58SrcKcJxYhjZ
 bSaww1A3SOHiUyl4AshWtS0zraV6i3ruTTUWsbRftzL2LD//iHqUsZ1RN39Q7kK3WxNDjmv5MkD
 //L5to0sCPfc25w3yZ1CRiP47lNZXFVWRJXfDs1A5Nx+peUG3hA8sjId2sh6/0GWhfEKmVYuZli
 xDW03klFJZ+sJInHaqULkuZ6tXDOZRrxrfoHPN7qM4ZozWudAToKtbmQU6Cq/bhYH7cptOCqB7g
 mNzvlEf7RuIIQwsFTK31wsPsm3ggTzaaSIcf20YuDxPiKwvVyE0GrjWmZRs/FpJC1Q5dnkJNRQ6
 3RbmrZiek/35mOUuIxbLS48DLN/sb5CRaTX7aS3MpHm1Ffl1cwMj1HZ/69BFOlEDm/41cm8CPzy
 AEgAYBiCXQNgB7JCaFQ==
X-Proofpoint-GUID: tRBETJtZthLu6Db-C8y19Jer6MXqlaOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250023

Add remoteproc PAS loader for ADSP and CDSP with its fastrpc nodes.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 286 +++++++++++++++++++++++++++
 1 file changed, 286 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 2c9d10f2e987..e571710de40e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3705,6 +3705,122 @@ ipcc: mailbox@3e04000 {
 			#mbox-cells = <2>;
 		};
 
+		remoteproc_adsp: remoteproc@6800000 {
+			compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
+			reg = <0x0 0x06800000 0x0 0x10000>;
+
+			iommus = <&apps_smmu 0x1000 0x0>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			remoteproc_adsp_glink: glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+
+				mboxes = <&ipcc IPCC_MPROC_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				qcom,remote-pid = <2>;
+
+				label = "lpass";
+
+				fastrpc {
+					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1063 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>,
+							 <&apps_smmu 0x1087 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+
+						iommus = <&apps_smmu 0x1008 0x80>,
+							 <&apps_smmu 0x1068 0x20>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,glymur-lpass-lpiaon-noc";
 			reg = <0x0 0x07400000 0x0 0x19080>;
@@ -5910,6 +6026,176 @@ nsp_noc: interconnect@320c0000 {
 			#interconnect-cells = <2>;
 		};
 
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,glymur-cdsp-pas", "qcom,sm8550-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x10000>;
+
+			iommus = <&apps_smmu 0x2400 0x400>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mxc",
+					     "nsp";
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>;
+			qcom,qmp = <&aoss_qmp>;
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+
+						iommus = <&apps_smmu 0x2401 0x440>,
+							 <&apps_smmu 0x1961 0x0>,
+							 <&apps_smmu 0x19c1 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+
+						iommus = <&apps_smmu 0x2402 0x440>,
+							 <&apps_smmu 0x1962 0x0>,
+							 <&apps_smmu 0x19c2 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x2403 0x440>,
+							 <&apps_smmu 0x1963 0x0>,
+							 <&apps_smmu 0x19c3 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x2404 0x440>,
+							 <&apps_smmu 0x1964 0x0>,
+							 <&apps_smmu 0x19c4 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x2405 0x440>,
+							 <&apps_smmu 0x1965 0x0>,
+							 <&apps_smmu 0x19c5 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x2406 0x440>,
+							 <&apps_smmu 0x1966 0x0>,
+							 <&apps_smmu 0x19c6 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x2407 0x440>,
+							 <&apps_smmu 0x1967 0x0>,
+							 <&apps_smmu 0x19c7 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+
+						iommus = <&apps_smmu 0x2408 0x440>,
+							 <&apps_smmu 0x1968 0x0>,
+							 <&apps_smmu 0x19c8 0x0>;
+						dma-coherent;
+					};
+
+					/* note: compute-cb@9 is secure */
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+
+						iommus = <&apps_smmu 0x240c 0x440>,
+							 <&apps_smmu 0x196c 0x0>,
+							 <&apps_smmu 0x19cc 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+
+						iommus = <&apps_smmu 0x240d 0x440>,
+							 <&apps_smmu 0x196d 0x0>,
+							 <&apps_smmu 0x19cd 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+
+						iommus = <&apps_smmu 0x240e 0x440>,
+							 <&apps_smmu 0x196e 0x0>,
+							 <&apps_smmu 0x19ce 0x0>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
 		imem: sram@81e08000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x81e08600 0x0 0x300>;
-- 
2.34.1

