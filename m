Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BE51C862F
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129210; cv=none; b=FtwBeoyjJ4ZE1MGCFfyqlnRmNVjZLfKAw/zNSmqQnTYilcOWqaxF8ZziT2fIpF6o+UuZQlxdvd5Pwp3xdo6NISk8wnWCIxzH9wADWKXrwjTpmzkugg4T2qcodDXG+tbJn9EUC5aVpxiecsvLTmcey1GWcep59IZqyM7bIV38c7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129210; c=relaxed/simple;
	bh=NcWZWhO1qD0aNBbSsdKSzCwLSE+MeyOAof6ic5iyPLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnMPWjxQN/Os2jtIXG6H6pKAi+fkXjb+4UMF4XyL/gJIatTRwqvuVpe9ZW6PqS7cBYuXv1DRCN6N0dsonz1tDRuKZcL4xgFlIZVliXA/i/nGmJhzrkzzxFofTEDqYfydh+Ppq7ewDl+ZVwpDXScIDqwdlLSe1Z/Vsr3pc2eTZVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WizqUXr7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfaBtFCL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WizqUXr7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfaBtFCL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNLQW33493204
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZuPBbTuh6jcL63oGp/xiDfNJDEf/RwR5WXUqqiAY08=; b=WizqUXr7dL57igFB
	kSz8dU8kw+6NTP42LekJqTnTJ+Z/RNrgOStHnqdnZaFRr1/6iab+RYsuTtAo7oRa
	btGiWvijEG2fN1jom0/8/i6i+tLwZv6N4stf8omZL+XAC/s13/+zMOZsL2+ANs2n
	bFqJ+tvWdTyrbm8cuEM7s6kPsEnQTiCbP3jcuMNlHM+wnvDYeqHXL2C2PuAlHdUh
	r+eVxguROE+MumVHAsz8Hdu5NLrhIW2bYMeE58KTi66gy+vbPBu7KKTpBW1mU0Ep
	im5tStl/HL7G0m7utNw27B1Zi6P7M/ouF20RfOuPXhKqWb1kpvq6ITzvCEbL/XvJ
	xZNTPA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wtpnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:40:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so7423688eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 22:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792129207; x=1792734007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZuPBbTuh6jcL63oGp/xiDfNJDEf/RwR5WXUqqiAY08=;
        b=DfaBtFCLaOFP4X1DTXgXRwwitUP8aBAnDgQXDaqnhVLhzuRVAW03ACd52cWnvtbYLk
         T1GEbkbicH8QHSb6U3BB+CdxAbvzv97/4Wgz1+098cUE8E6/7RTjvHYOAw7+XA9+v026
         4iCrZHd8ebxE6rP/S7bE0T0zJwqJv/8/4SYIMhrUyx/s1aHiUCNrJ/BUQooAmJVpEoet
         nZvtajFeiAbPyLV+SzDcXyaeitFvcqJtyOQvsEiyzBzVt6bQYpAyPgQCeTPDl8qsPqyM
         f/22YxYSud5/brJVo2qphR0w4RE4jdHnxSYxRbiIIATwlHrFbyGUkLTYgpWxaUFUfhQu
         5sUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129207; x=1792734007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZuPBbTuh6jcL63oGp/xiDfNJDEf/RwR5WXUqqiAY08=;
        b=ookO+q2ghm364rupFDRuvHpTUQxxCMbJOEoCci2sL+9NXKIjvAFF/sRvNfWzFi8gbr
         ArMuV+XKuQZUCluo487znslQO0dj/jkDFlJZqySNLvdhRkzvY8oMruyX2qI//uoUfNXf
         yn+2fqLVxTpHMW4CS4urwAR2pV13X7W16kl6kvv0WJUZ13dQibBNel6s9Lx6iPoJkZvt
         YyIPa5YkpaljyTkNzZRU3I4WH4E54sU9yBV2QVtdH2n7nbpZ5fIDLondMArg0JP2Y5y4
         OZ6V8OQ2rJHfBlWFrIaVz8sjjL+DgOeCHgLcQwFsRN2MXQeHuH5vtqboE/BgcUzfUIH9
         KEFg==
X-Forwarded-Encrypted: i=1; AKwUvBz/qJdlpwsjS1x99rXjm6QndOb15NduzQuToT/CuzO1UqNtstG17odgD7Cgaa4XpwEfRk/nvcHaM3xK@vger.kernel.org
X-Gm-Message-State: AFq9FYKLdN6lhAAi6jdlriiBf5sD5ZLTfvKxNHpraqNapR9J1bA+zNU4
	OnvVaoyWbUHZICpL31qWdsWTtoTudD86ifbCO8CYATrJ6C83uYauHKgTyN4veZkuyL8tUTvqhU7
	JWI/sXNnSRFEFc8Td7MGrdnNXqiPdssb38Nm+Y3wub5GWY+HSSPRViPw6dKB0KyHA
X-Gm-Gg: AYBFou0G2NvWYCoZAbpbS4ckU8mWjif2S6Sr8pkhHR2Nvxvy34LnZwcsrtdmkCXChYI
	A0zcKkGIdV3ru4hqjcoaCTaebBC4KKPAuFIv8bQn9JtuNj0o43i0Fzgf6ZjULm4Ne7EV1JsW8R8
	ryC1mt5iEeqNcC3ll8F2sPg6BPAO6YHmxue1cRrFP4TlldyPtzzhuWw4BnCt986hvxwh4cbPEON
	H5ssKdkY5DrOluLMlYo7Dr0lavSWqRDTnKNXA58oLAOpEZLbQSPL9Zx+3kHVyA2Vt8/VenqESST
	CJF5WFoYq4xNIudkswai5q7s3uusVcyUGDrTe762lr1Lmn+pma6qjT1j72yWKKBXiWyF1PZYOfi
	eu0CivdFwYpBE9wlWNhPbJ+UvcSQ48UW+Fb3p
X-Received: by 2002:a05:693c:88c8:20b0:359:9302:a526 with SMTP id 5a478bee46e88-3599302a70cmr22694379eec.7.1792129207013;
        Thu, 15 Oct 2026 22:40:07 -0700 (PDT)
X-Received: by 2002:a05:693c:88c8:20b0:359:9302:a526 with SMTP id 5a478bee46e88-3599302a70cmr22694337eec.7.1792129206308;
        Thu, 15 Oct 2026 22:40:06 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm3811393eec.6.2026.10.15.22.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:40:05 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:09:54 +0530
Subject: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
 support for Nord
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-nord-soccp-dt-v1-1-ee13aef55d8b@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
In-Reply-To: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: yUGC4yNOrHnQBxlmXG7AXxrv-7WszICr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX08nAtQdit+JX
 rChUXopYVezX2FOKS0FdcXfTRCFRa1p559JcsLnn2p/JXxbD3mb9y8VmYf61biElryRtjJDkAlT
 sjKQewa/vAI4lzO+Wwfq29Sv0rKvdJwkXFExY23ir/ZbxA77HlnnQDJPSp+YN3PBlbP9/r4kSwO
 rdKIpyMz5I6jQ6hzA7dXOqVEWrEW8wrNbVzd/udpOB0q17qqgeNeKuNyGxchHYTNb50+v7im0GE
 SB8OX4xAS6pDzS0E2DPRDGYtz+NiFBf4u+bVVL7Vic/NS2SXOPM++IDL+SbTh0yFb8BA/7eoctx
 TAbQ4tJ0iEtws3LHswSW6QRp+m88UH2lxl9ZX5XU2Ystt1VNYxfgnwE8XLzL0QJIjYBc569lSU3
 iWPlNb3oXRrfA/+t5RoMyUmR1doTFxyNiCEPxQ0/mj1t8z2ws4vxWo82LgmS2RKsShVk2HZ71X2
 yzSh82+loCxpg+OPANw==
X-Proofpoint-GUID: yUGC4yNOrHnQBxlmXG7AXxrv-7WszICr
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1b8b8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=thEeB3zl8CAc6_OhbPwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX44lWdKx7Vg4e
 7rKBg+Dsd2iHu7FYLA0rO3wI1lfQ7DOTtl3hxKlY32wNaCka9+n9pKjDU5QgABX/oU6IjnuA7Bu
 BVdNjGPtRaRucTjrYvT5U0OKKNzscO0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160022

Add the SoCCP (System on Chip Control Processor) remoteproc node and
its SMP2P configuration at the SoC level in nord.dtsi, and wire up
the clock and power-domain dependencies shared by all Nord embedded
variants in nord-embedded.dtsi.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi |   9 ++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 126 ++++++++++++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..e21b9ba480f5 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -430,6 +430,15 @@ &remoteproc_cdsp3 {
 			     "nsp";
 };
 
+&remoteproc_soccp {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_MX>;
+	power-domain-names = "cx",
+			     "mx";
+};
+
 &spi0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index dfbbaf94a7ae..53c594281f6b 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1029,6 +1029,28 @@ smp2p_cdsp3_in: slave-kernel {
 		};
 	};
 
+	smp2p-soccp {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_SOCCP IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <19>;
+
+		smp2p_soccp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_soccp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1587,6 +1609,110 @@ uart13: serial@a98000 {
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			compatible = "qcom,nord-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			memory-region = <&soccp_mem>;
+
+			qcom,smem-states = <&smp2p_soccp_out 0>,
+					   <&smp2p_soccp_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_SOCCP
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
+		bwmon_cluster2: pmu@1014400 {
+			reg = <0x0 0x01014400 0x0 0x600>;
+			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>;
+			operating-points-v2 = <&bwmon_cluster_opp_table>;
+		};
+
+		bwmon_cluster1: pmu@1015400 {
+			reg = <0x0 0x01015400 0x0 0x600>;
+			interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
+			operating-points-v2 = <&bwmon_cluster_opp_table>;
+		};
+
+		bwmon_cluster0: pmu@1016400 {
+			reg = <0x0 0x01016400 0x0 0x600>;
+			interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
+
+			operating-points-v2 = <&bwmon_cluster_opp_table>;
+
+			bwmon_cluster_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <800000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188800>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <5414400>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <6220800>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6835200>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7603200>;
+				};
+
+				opp-6 {
+					opp-peak-kBps = <8371200>;
+				};
+
+				opp-7 {
+					opp-peak-kBps = <9657600>;
+				};
+
+				opp-8 {
+					opp-peak-kBps = <10944000>;
+				};
+
+				opp-9 {
+					opp-peak-kBps = <12748800>;
+				};
+
+				opp-10 {
+					opp-peak-kBps = <14745600>;
+				};
+			};
+		};
+
 		rng: rng@10c3000 {
 			compatible = "qcom,nord-trng",
 				     "qcom,trng";

-- 
2.43.0

