Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2403BB105
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622366; cv=none; b=lDpwtgtjxdtO1pKXYnmE+lJbxf0aFsD8jk0BKo5VsfCCf8VR13ehbpwlajL/w1LuJqs/uNUHgphZdWjEhT/Yo/OoftOBRKQaoysDNeW+t1efWqVW2Y7W2PXUJamMYB/eW8kv7qhWohU3jWrp2zsTrujB0cVnOJg4H+AI3mev8Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622366; c=relaxed/simple;
	bh=PuuE9E7ZvzP87W76cdczRVwR0uCaeNPsgy33spbpPBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btrla38rtFfjOrHe9Qm0sv0QAazOtGJOObEp/HfuSFQvtjr6MAn90rNuvuo0iwD/8ltq73fvdugc8TCwp+sVBfqodcwSq7NSNOJh8FUa64nd45mWEBqu1FWZQ+4fgS8dTCS8BPfwH7v8zyXSqoB5dwcsUbUC+FEgPPEyXSVx4Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lotaO8yf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4aTMEWC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lotaO8yf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4aTMEWC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6ZQJm4150314
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/taegp0L/e9Hk2Fw5ohqL7ginUxJjHRE5690Rptan8=; b=lotaO8yf4VHSUgfX
	MDn+92yDcri/flBxMebLbmD0Oxo7gzuLGdAmO42zL421rlDOCuixqiZLxccQb5aR
	MbNIkSkJSuLZxVjQigEysEwLvv+CQQno7/+hBlUMjb70JtrVNMNHHl49oqHNG7vm
	E/pCC7zi6K4fE1jEfRK5X0nfk6iLw4PYC4fOXpfrWMkvGg7pYaMO5vYhW0ncpgol
	p/quGU7eOdCODIw0t4IOHwuQIHzbuKS921kK+nH+KaVytGfxrEogBjj5DHvjc51m
	ddf0Epe3LDXApXG3Pl8iFu/NMMvmHOz4aPReQB3/Z5hNAFCYehrwCSqi9AdWNsfm
	obG1og==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff3cea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:26:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso107298031cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622363; x=1785227163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/taegp0L/e9Hk2Fw5ohqL7ginUxJjHRE5690Rptan8=;
        b=E4aTMEWCMKxcUcyvBX+fhAXY520uc1n4DMfePDnAEzmBWXLWT55n3hPR3op5Wl86Xx
         xygvhIK3K3vK5+m6wmh0osy5Yikh/CNNJZNQaH+cIy6IbTDrlEAikd8h333oeEPNJ7iz
         2XS0sQ75FW8GcbbEHPqnQNWYzsrRU7cDcvxkJPSbsTdqFyCnSnmCqctTHRyxn0CeFVYS
         XNQVfd6jcmhLPqDGqbTGugfm4ltcf0nFW3+YQ15liYshFX3a7Plf05TO/omcwEnI7F9X
         jAdKNt8lfvTtCv+/pBa5tNFxXRok1ggPf3Fq35Ht224m97hTZXSAZpbAT+fdTRMn93BC
         WAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622363; x=1785227163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/taegp0L/e9Hk2Fw5ohqL7ginUxJjHRE5690Rptan8=;
        b=Mu7cVwt7UVG9Z8MF0HSl9MPilMRlFFv7KjzZwxgAtcTjEhHYSyP3OF4x1jL0FHGl3h
         5CeEoh2gagf+9EPJXB0Uwlv+esHoP0jutx5CAYq5kq3wih8Fb7IXOlmtpNpWkTjPFYOc
         4Cwr8+B/L+TI+9uxzc7x+GzWsuMFx9v7x4KbAKVi+de4Y4M/jUGiUimCC958ZnDtrzqc
         pE3L0X+HtJQ1Txor6mQScIHX0cgoxseCvYsp6Rqk9eXqTFxHTCKW/Ug6fomg1vbpN8io
         Yh1nxNGh4eLQn+sOQIm/s9TPYgqHbxMv2OT/y3JO61X70sHnPoMoaNMAQBTCxIVmev3N
         0dLw==
X-Forwarded-Encrypted: i=1; AHgh+RrYIMTG5QyJKS+lZs8PwWFguL6PwSRhWGkNHzoB212HhJU/+7eleI6UUq/z6Th054XNTbsbiC5Ytlxe@vger.kernel.org
X-Gm-Message-State: AOJu0YzSuSvMKCKZ8yIGZlSxOPN/utRLx0xRzglmL31FffjzZQq3V2Vg
	6SbymcpFFotkn1bADNNP6UOj7teZp+rRIUDz35v1cxPgX5AJnXvvcs/DkbzMpc0dgMt2wlrBOml
	Ykm4d9HjaEgnUptKRuLgjDuXiDmmhZHIuM/do/dQNfRQeDGmKcu5XoPI5vfdp0RX5
X-Gm-Gg: AfdE7ckbH89wRa4B6BOX3G9U7vecGd7dlOCX8OnD4baeN6f56UaFgOrU9NHrRuaxPLX
	SppHV9Fw4bMxMAuQ+iQvpf4HCDw8NtXCokHOIOZEdCd6hNp7lzOV3Ova9GPy5sugU8yesuNzEYH
	nKVV3qEi3thDTRFCUlKOReLWcnJucsn8HE+QtumOlNxx/gbFdEnJ3/x4J3870zmFnxLpXylNCe6
	AWIuQdHBhnH6//RzLaD+aboRuwxnzvBDVMmXOzzoCqexlioBAm34hn761Ufkg6FVBKW90+1yWW8
	KnNr5KWPxKmW5yzMVYpUWgf+RAz9rUFYuA3POhQfOSylf8/5dv1T+WiiufyiTYxPUVTkKp8f0zn
	lfoiisoV9
X-Received: by 2002:a05:622a:8cd:b0:517:91e5:1086 with SMTP id d75a77b69052e-51fc1f564b1mr194705611cf.38.1784622362888;
        Tue, 21 Jul 2026 01:26:02 -0700 (PDT)
X-Received: by 2002:a05:622a:8cd:b0:517:91e5:1086 with SMTP id d75a77b69052e-51fc1f564b1mr194705391cf.38.1784622362324;
        Tue, 21 Jul 2026 01:26:02 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm66664595e9.7.2026.07.21.01.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:26:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:25:48 +0300
Subject: [PATCH v2 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dts-qcom-eliza-add-cdsp-v2-1-e1e52bfb3c12@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
In-Reply-To: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2598;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PuuE9E7ZvzP87W76cdczRVwR0uCaeNPsgy33spbpPBo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXy0TfVRyBWZmqQwKQ/c37dFNP1SENnNBxPWL/
 LNIaXaEKx6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8tEwAKCRAbX0TJAJUV
 VvkcD/4z7qRlco5ln84ERsQAb4xRelmyj5qNEJBEWeNUpPdS3nYCHefaED3/52G9vi5tIzXbe3k
 P8CT2PFi+6lNtE/QwkkRwBc2+xWuCj9FGiIo66rFmYEz206oSeh7/gb7m0+QYx9uV2zDRJDP+Ga
 BT4tUKZKYbYpOlPPpD/sfWEeCncCwzYs5ZhfHqckVeOfuWERBjpHg/AQjHpTTrs4KijOY9vxrv5
 Ln1XJqU/zz0yGChzDXKqeBSvAoDAlOhSzCVkEmERIvuXxi7Ro3HEbEI3J64vn7WkHP+VAZ8dTo5
 Tx8MZCh1L7umC6liSVmE6YDxmbYvf5BT7rMQZRX9LMv+hE30jDPBN1ROVYerddzz4JxvbdHtkR3
 IVUf+0mcpPCQ+IKsRgTsn+U3KUpFEyNLQnVRgh0lHaxg0zlUf+zegvvU8hBge+bovihi0r7bzhw
 5A4Yb9T9aY1eDVRModtTlKYDKdFuZpHXANqHbMC/C2VcvDlFnvYhvKHgdaYcJoBDZvXnyrQcpY3
 K8HHPJxLLlg5ml9VK4KCYP7RMAv9WCPzgkaMqegUeuK6C42Zrkk2iJz0jX5cvJ/U+6b3oV0jA1f
 akOyGS9v8hBwFxPCTG6g2Ue/plqkq1Ot1icpqchIf8e3dZv8bgl69DmcgsoYAiPFNUfi5dy4+lR
 z4pFazAtzxjxrBg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NiBTYWx0ZWRfXxgb/NENOIeR7
 KkLH7q9dzpjx6atsbSLhVNSYJssW4A2Rt+6MXXIBB4G8Bx0xW6vjn5dhUDobF9wxVGNCM5znVv3
 ZUY5oN5Bd0PK4mlgYH/5dR5sMyxFl6U=
X-Proofpoint-GUID: sH5pwOvkNaAxSeRO2QBsJSbzlEYx-f39
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5f2d1b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ka7fFnpjcXfis0az0GAA:9 a=xoDkV7_e_mntWQL1:21
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NiBTYWx0ZWRfXzxyNQVAhX6Yn
 p61piug7zkJNzcMYgs+vnWOTdAvOEguDTCvuyI2xfp81FvWwnq2nQOSkEs5oRiFdPTLUA76PJcc
 Qiov3nXp0zuxFxUAhVyrK45pEqdIjTr7EFb7PiwSrqbyUAOZx5FXHGO++fd87FQTA8htzKa1nAd
 ErIq4sg4tvFZQv6NEKBTd0JiKIqypZYoNd18+2aIeog6ur7DhbZVBvMxY74vvmnzlqUw/IRVQ8V
 L4eEjYW8uyY2w/W6OIEtHES+pWCSUI3mTfmyvFA0EIuvrJnQVXzCWTV4MfJdTK8uQoG/5AgX1iB
 6hvZLadcb7sOs8YstKExUSUIOi3UcSiMa5/ZTKdHGS5fP5wW9pe9YAkH8UrqchpW1/QiQ5P49TI
 2DI5kmIbd5OlgxoB32YBqDvBfpgFbQUXUr+D6RQEh1FxjWS2PDaHz806yqXJfv+bYEJ0LJgKmY5
 BGxWg8R5WbyHCpMIeLw==
X-Proofpoint-ORIG-GUID: sH5pwOvkNaAxSeRO2QBsJSbzlEYx-f39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210086

Describe the CDSP remoteproc along with the related SMP2P.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..0c6fdfc5a4cc 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -626,6 +626,30 @@ smp2p_adsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -3737,6 +3761,46 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,eliza-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x10000>;
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
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mx",
+					     "nsp";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0

