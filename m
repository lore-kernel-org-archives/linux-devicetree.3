Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D44374E76
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846127; cv=none; b=rljXsZu3dwiNJ7TzZ+5xjiriT622wXtqf/Fqbq+lm/v1LOeecwg/wGZJH0wNRzX+4DGg2IYEflYfvsi2SGUM31V+uoheXBhBMfAac6Obxp0n5TjcCTfGGqgIC/izFra4ZDfXZ8oXZHrHBo+49bKHqYdQHK+7hdT1vznPUeI7Mls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846127; c=relaxed/simple;
	bh=gBWoRCWmc3NVqJdziYQIe284NuCXpbfFOVvQjjM+Egc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHcJ73+9MWm7s5I83fvrtmOscpEjCMedBDmEXfv1XmW0DCfPdkvgV328zskrM0jTw0g57rk3Q6wz2fa/9vndKDdS5Os9wcCqtysLkBk5GeNz3ost7sdH+SFmHQ0TDiqU+DKY4SPiHxi1Cs0m8m8YHq7ArONpAmjw/LRX2yy/z5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/FLEoTi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zw9KxF7u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/FLEoTi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zw9KxF7u"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748BsvH3016113
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCEt4VezC4Mrr5q4zAeSzdrkdi7o3q+oyX2WYTTsB8Y=; b=j/FLEoTi6vDP3DFz
	gE2I2p/e34SRy4XrA4dqSGDwJN4V85cS7RaoAw9dfcqblGqO6tbyj3wo4xgIMUUp
	PE+2NGOg37aUF1J6J8zaxQTtWgy7Rt/fGai/eyVdFekYoCH5vmISxZR5imTzMJYH
	k3rO2QmjXca4oJ+Z8Y5hRczIHObtyG/JClqpTIMA8j8E7H2dB2w3vWgPcw3mRAzO
	8LymdK7OztLLNvwrI9/GIiHqg79soeIvP+muxs14Gy+90327Bd4xosRat01jlJTl
	S1YPsbh5KqLhFF8FNxTBHm7jAUQlilODuCJ2BQd4dNloNDEsb+IB3gg6ry0T2St5
	oq77qQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu7272a5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:22:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso45248191cf.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846124; x=1786450924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCEt4VezC4Mrr5q4zAeSzdrkdi7o3q+oyX2WYTTsB8Y=;
        b=Zw9KxF7uNFortJmQZ2oKxccCPnJlLZH11QLV5CWXwcYLDZLkJsMsq1bFh9PdHJebbO
         KkVpEIYjJJQElLDhX5ranYvY6D6/JMYxFH5l4IWhb4j5NQSIYN+5FZoX7D9kJjHHDQxY
         cgHdNDTb765St22W9+joNq3CT/RrCXojq4csIksmbfu3TwLUiKU3xBogi0Z3CTugujRc
         HFB5cUzGz8Wl+Y+66uXIRL+6pM3MVHYp7ZWF/pjWUtga/uAdIIJ7+2OjmaDPMudjV1on
         XzhlzN9KmN+OOZnhx0ZnqPjzRteShU+Fhnj7PfyNh0i1kU+Be1CZvWn5H3eYECg5xGLY
         zjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846124; x=1786450924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCEt4VezC4Mrr5q4zAeSzdrkdi7o3q+oyX2WYTTsB8Y=;
        b=S0Lg6URWq94Jca+anzIt3eMpGFlqT2kyGbgo8B12Ce/2LLpSnTL2tOxiPQUIzL7Z00
         Kp4IKxc8GXg8bn1a9jM8/BgkbgqDz/TLaLoksdDV47d1bJybRFWFtG1HMi7wCMNkoE3r
         cVRHrsz9XzYIU0K9DWbB7yvFCLcf5IbC85bTmjNSkI/vyZZJDk7kzN5oGPAEDhtEy2qp
         7QwokfeJU6+fLlOCDKdDrOz90tbLlsQaDCGHib6r+yqLBYa35CxzwaIA+dOF9wlm5Ebr
         /C74/rLLgDR3l68RvK8NzoFE064pvVJLK2+SCu0srCsYsKB39ajUN4XU6uyNKIzws+uu
         zKpA==
X-Forwarded-Encrypted: i=1; AHgh+RoHJK4MWdQZO9XssiLJ2aXIf/FkEuc/LMFNZXgyqBhnhL62u5xvTIAxejITezDBR1xGPb2wQX22siDQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxWfqa5Op0jCpXwFzc+PtI6t+oLtSkbppxUTL8fMwuTQ6HtzAQS
	nnI4RlO0r3sHYLefu+sIj7QE1jFvr0DFRuIQ8lZyNAuYaFO3ij0tCpyaDCv7tweo+B8DHMiZG5N
	iv8ZAdQDyqg5nG3fblWZGeiHzjkh5s+omSgQMH/wfM/or4BVKqvfpwG0IOdlOgZ3Q
X-Gm-Gg: AR+sD11FeDXxeBWGRzY8X3R7ZJ8D7FhsOqAAe/olwtM65R7IC8FntgfOZj5T/MnFkCK
	scVss9dBnMk2QAYbJxKRHpF2z0/qRIU4ZvmvAIHAW3Sm8EvlvpYianmFi71b7KOO5P1rU2syALb
	S784eyP6Ap+4/5iTb8/nUDSFzID2pC7XkAwpPLSMauaFkpRm21QeENY/K2IrtKcOK8zkhFQ9rN3
	49kL+WTW+pNnRm1NqcbiEdOOplnfj9nU6KiNTefv4FDZvm5/0lx8U2Rd4Ksd/bN4VCdP7IgNlWz
	sKjUeXfgwVx1XaCw5vLqRtDS5+4eaT+TvV0Z/ZHk1Zx5a+kjKVsjvQ/PvbZtOAHKmdmaJGx2yXf
	hK26qpvE=
X-Received: by 2002:a05:622a:4010:b0:528:15e:d1cc with SMTP id d75a77b69052e-52b56737b19mr286018701cf.13.1785846123900;
        Tue, 04 Aug 2026 05:22:03 -0700 (PDT)
X-Received: by 2002:a05:622a:4010:b0:528:15e:d1cc with SMTP id d75a77b69052e-52b56737b19mr286018131cf.13.1785846123348;
        Tue, 04 Aug 2026 05:22:03 -0700 (PDT)
Received: from hackbox.lan ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cf404sm42940134f8f.1.2026.08.04.05.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:22:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 15:21:40 +0300
Subject: [PATCH v4 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-dts-qcom-eliza-add-cdsp-v4-1-fa593983e486@oss.qualcomm.com>
References: <20260804-dts-qcom-eliza-add-cdsp-v4-0-fa593983e486@oss.qualcomm.com>
In-Reply-To: <20260804-dts-qcom-eliza-add-cdsp-v4-0-fa593983e486@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2954;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gBWoRCWmc3NVqJdziYQIe284NuCXpbfFOVvQjjM+Egc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqcdlfJdNbBx+Ugep+xxZMrzZ8A/WaK01kWdVbD
 YY52qef6ZyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCanHZXwAKCRAbX0TJAJUV
 VvkoD/4oDwgoZaXXFy5ugxeEBYWwIiwerh5gYb3U+wqkH2kL3SArejA/ZGU01yOiT6N7Sdi3XLG
 QsPghHBMxSgHj/d4jS7Z2kCKdbkDW7doDbRBlrmf74QXt/B29WMBqhEkyrq+IhAMkjNaWa7PXIf
 xTilRce4rg9Abnd+o8FnsSKVkI2mkHjQNBBoiU9ikFrrRWllgaZsBr1/e3mtr0O/wDedI6h6qs3
 sBlvw/cA3xPhu7L7Ofc2Idnm6LYKuaRt3qTCBZIUhAHY+AJNzf6jwHGIJ6TBUZDapVm2hfODvol
 yOgaOV4uTtTz1WtFPslv2IS3LmzmUZO9f/xk1KJJdWt8VFbD9zcM1XIQ2cFCWzVcYJKHe1Bcbzi
 i/JgS0NoAgNiZAUGelpJL/G/jbLSZpoDdJvO/CHdoC6mUeSSReM0auGN9F8RCn5Rd4QqxLhK7e7
 CMZv+ap/rW3OMWn+ueaGASauMrB9sOjfQoQP7C++nSIA5ZK16uc+jYk4Ku9tQshN0VEYFO1q9bZ
 kRj4CuaAl0srhC1zBlTKL+pnMJWHOi8NuxXSSOBD5FOeSXdBTHGZQzXq/nERgKnZD02orlsmsVc
 vo5o9glruN0N21s3BQ2mBQTsGwjjNywVC1Qahny2Su5uvIzb+eyzRNltTUn6BqDO04j+DhjXlNi
 bUcQ0rZb1p5njdA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX5u1+xmukPsEv
 YjYO7wr9scrwXMiWV2U0NTeMim8SoGl4O1Rp/Q3KHQF/an5nNKhGbdgXJlRBc8eu0EUdnawbcXH
 3Zo09Kysz5eN5FulbTghlUYBkM8K2dA=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a71d96c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2GlqV2yqP6Fn-iQxV0EA:9 a=fTrgFlXldL-EUvLj:21
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: E_AyiccWMWfvzaDQsKprBN8489pGgKmA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX3IRgSWuvJ5pl
 XxnTT819R3YWUcx4EB3dR1/3JNn/15gVAUKZ/T4/sP6Bbr2/iGhpewbIodqOgEjQIKX2iHGgn0L
 TiArTnnsktr/1vS53a96WjAtrkfNqQMMnNh7j7rC8TMJoTEOkzLJb0JxaIuVq4r/bbBdYyYH6Tp
 vF67V/vYixyVh1wr9L4HGkWLvOkDvDUAADv5leC7P2K+gwpaUba1fRpJiGncNwVBljojI6EFGcG
 2OQh0ZeJDf58l0GW1Cg4MQSXU+zxF11sLxscWxe+s1PivYsnW6iIPRhxsYrWaNv18EDpAaiAUxf
 CNdAEgPPwhJxdc6usciF56I1Lj1SqWu8o5skIG+mhfOZIuzGNiLRXowS2T76MIVHppDT6X3qOxb
 h4UpgjFPcUc4mysZs9i/i07b6CbJYg5PPWV2ClHNOYSJDlj3D4EEUssa7kbKRR992U1XZWFRQmu
 HLlE9/H4yRtnlWn9ggw==
X-Proofpoint-ORIG-GUID: E_AyiccWMWfvzaDQsKprBN8489pGgKmA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040099

Describe the CDSP remoteproc along with the glink-edge subnode and the
related SMP2P. FastRPC subnode will be added later.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 75 +++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73..1585f13cdcfe 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -636,6 +636,30 @@ smp2p_adsp_in: slave-kernel {
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
 
@@ -3975,6 +3999,57 @@ nsp_noc: interconnect@320c0000 {
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
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0

