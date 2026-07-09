Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAC73E9F96
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584891; cv=none; b=lfBJxkgsldBJzZkY4vzgJJvzeHbM4FygiM59IlSmg6Ktx9joP0WNWeT6CZAU1gSdv6PRnt9Vp4OKHIINyhcE/zI+VcD1zYEIf7DN2WYnYIU0X12qApywVUuBPW8Vb9lyec1HByaC1+u4J6hsWWxhkvxOw1WidJMNJRlP3neUmVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584891; c=relaxed/simple;
	bh=iAyUCdNWaXnAKuA8rgTe47CRvWtrwdezN/415NDCKxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2Pu1BI+szc5B/XjbsC5uAfBq95Zfembb9D7Ss1ol8kTs+4Y93nRuNak0eMzuyhWXGl8aBp2iPma9NwWjNN8iPkPSeRL48x7lhfLSNhI5B5LwOW/ynRKTYmQBtSIKbby+o52JsH953wcy5/Sbwm+zNL9T38eyac9D/73Bv6/cC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQJpSQ6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hg2f5APw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQJpSQ6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hg2f5APw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960GDS749745
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	joNEaelkajH+iuUF1ilTWr0pEfxT9XUi7l965s0DVuA=; b=EQJpSQ6rYTbrFkbw
	Ro2bW7BYxF0nxAbQmBSaN5IoHwVN4WVrVAE3c7wECTo6FbMhetMy4KaiLUywmSgS
	90hOr4w+h8x+2ZcyI4vG4rr2wqgcSUmE2DtFzkPMLPrGZz5d5IZQRQ0TvB6QVt4r
	1GnFInXmEFA72LYzSBNYq7YRQWpQQyTmULRymJC1BtBoYitzAaXB0CeKFkTt8NFs
	Iradr2qZBdsdDkhfowpIbt5NyeyvM80sO7Jf7LP8/8ueEw0AQBeZ19Tl1vLyXDP1
	JOFTKCPwv5btm4iFOixXcrriWDlAncFEVQSSaXsgV27vXjqD79a1v7DyEdvJvzpq
	g4rNTA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwft2nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:14:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so1121202a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584882; x=1784189682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=joNEaelkajH+iuUF1ilTWr0pEfxT9XUi7l965s0DVuA=;
        b=Hg2f5APwKvJ5fNZHJ/+fYh8doyvL3rGqUOevl45NfWlqgsk+O/6Tey0c36ruJs2Dxd
         j4uc+C0WkX2EwSCFWaGt58KVwmtBFmtOcOkslkSEyjiPwdWu2JqpU8oRDXyk2+5p4aa8
         QWXMujn9cuIERIHLGX6layvUqXyF7iotl+/NKHqYr9OP6qfbJ9YQLBweqY2Nv/r1Xv9n
         T0g3lvY8UmKQU8fAUjnY23p9CWXefCYVf+ZvejjGGmaXkaNb8PQ8XuHCyE7na5L9RUSh
         ApT8dHRMIh8sVApvwRo27PiI0YP72eGqRpjfVqPlj9bXbj2t5xI66L4tjKalWbWpIKNc
         1/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584882; x=1784189682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joNEaelkajH+iuUF1ilTWr0pEfxT9XUi7l965s0DVuA=;
        b=S9KA5FpZIvE3WzMB1qilAX7DCveW/A18aQAdHDJPP4bUmkGUqdu0E8l3LpwVd8RxpP
         TMO31Ci76esrj/RzWBLrJOgO3OGSzcPjsEW9BQfpPeoCwu6E6lxSLjiE7QXJ7zNSrVo1
         Ndr+1Uyvj2IuH+DVdp46rQfLxXfA0ZI0ZMUJ8lKMEYffszJqVHskCMic45heS28hPl1S
         aZ9j+M7aAyoHTHy3i0iEkgTo1BtDNhIdvTOLMwm4ew0euwolxTsCdyBESLNT9zcc4IOB
         vUCnWgn4EuBGgqF+pExkikeN2+y/dOpd3Ku+9MPylw/BcX+xOyg351U/Lakh5/ZOrKZv
         KKzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5Zr5rRZBna5vZgGYMSY5aB4TvRD3eVp1PITNRh3on3MINfuoFBM3m6zKIbEX1dcCKoGIM1DvDm72t@vger.kernel.org
X-Gm-Message-State: AOJu0Yy310OhUYVeerZnP/MRLP4jSZCVSZvg7wqBlkq6ArIjQDZobexh
	ZRBemEZ7wuagY1twlWl6cUlZnGUzmFhRQ23kd/aJ/havtcsQXc1DJYNHaK7hQm9+pezqg/p7OtZ
	Z8wqczqN41zXoCduC+hA+kS3DA/GD4bXSvcORLWPBxVVWmwRc73hMeIOV43568MV9
X-Gm-Gg: AfdE7ckcxjpoHjH3xLUYRaEps+oNeBUy/TvTCYeELGO5w+xjBk4jRC8dc9Wd0oT3A52
	mKx9kI8DrBKW8PLAdkFJuv7XVsNRaJMNEFLMEKTfvKuEaLa9k8SrT6ufBeQzxfORhFIN2HO6k9g
	ZZQ878yqVjXtx1y+Vv1ta4Yf1j4hRzHoYLEG7NmJn0mZOOHLQZEu33I5zuo2tZobEckLrzG53rO
	bW7OkwfOEkAPXbPE/EuGpeZ8cpIA8IGbTEfCfpvUxOfDVw2WmChwDmbTW73NpLel2gP4Dx+gANy
	N5uTlGpeVdtCpwlCSs3apsxmlH63RVa3nUWs5qzY7T3hBFfR2gUGjaih/EAinna3ePl4oYrCjAP
	WAHZVVdCj/IpNMqY0CHVqQbcPoslUOc/gkIX5r/wCZsrBGgAerX2cb7gjmfRwxA==
X-Received: by 2002:a05:6a21:a345:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c0bd0fa266mr6481174637.37.1783584882313;
        Thu, 09 Jul 2026 01:14:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:a345:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c0bd0fa266mr6481139637.37.1783584881773;
        Thu, 09 Jul 2026 01:14:41 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162d3csm3392290a12.18.2026.07.09.01.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:14:41 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 01:14:23 -0700
Subject: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add SoCCP for
 Kaanapali SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-knp-soccp-dt-v2-1-6e2bfca96088@oss.qualcomm.com>
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
In-Reply-To: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783584879; l=2747;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=iAyUCdNWaXnAKuA8rgTe47CRvWtrwdezN/415NDCKxY=;
 b=kHHnBLlbqPNSSmrsTF4ZfRxW8ZVhv7tZ0xv5L3ccmZE49d3CffvHu6b+4CeGoUqsH84sySuWj
 he1ei332Jx6CUYqCIPXbWdqu0uQO99HdUDABiHo8avlSbDRKHw8e/M4
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX1YmeNPkcOZgp
 QnznXUe33H0nstzp+FVoacSQ0izMUjg5zkRkeq55q6xWct+XGDP80EKXZLdZv7QY3su98dELc1g
 WfjAbVwUqE+sJHHE4zoDO5CbB1rT2GkkVcMHKlLZ7JwidAScv4xvg/NR79mKQkAKAbndtrFU3vr
 mSI0fkFD6bsplDqoCIN3DioFb+g6yxJxHDd/hi2DxMJtFU3c/pJ5+E1Y93vW9DrrEJZjWx8j4Vt
 bynOgllVubSVeHyjiwoUNA6unI0ntafrtMEBM3v0cjkU2uu5tWGyObUwN+3VEWn781mXixA9mCT
 3yGGw2S9HX23fTFDPD5QMNDyLclLaba91eNJZKQEoIhAjhjw8wHtA5o/oF0CydH0KA782PxFQBJ
 REMV8mDr/7nuZfhwV9uJ1Obho9npVy6D8Q9yxIMlVDaGVkSPHE5ykL38MU3M8RrtEjrepJJ5rUK
 9IP0l3CvY1wFQIfUgfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX8basSIufWr3Z
 9H28COD04Hv4iT2T/x8wVjFnHbPuvuZ8CGnZ7blCoHXPe2J+euJUCRCAAldVMDkB58IvX+AG8YO
 rEk2jSeH5RDNrgMxpcQLsHJWAkrd4VE=
X-Proofpoint-ORIG-GUID: -4HKYg2tvVoEpyVRMPXR8zhP8rOUSmSN
X-Proofpoint-GUID: -4HKYg2tvVoEpyVRMPXR8zhP8rOUSmSN
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f5873 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KmcovkxPpf8MbW1-iJgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090077

Add remoteproc PAS loader for SoCCP with its SMP2P. On Kaanapali, it is
brought up by bootloader.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 70 +++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 0518488f358b..ec5330297c7e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -512,6 +512,32 @@ smp2p_cdsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-soccp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_MPROC_SOCCP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <19>;
+
+		soccp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		soccp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -1521,6 +1547,50 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			compatible = "qcom,kaanapali-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "cx",
+					     "mx";
+
+			memory-region = <&soccp_mem>,
+					<&soccp_dtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		rng: rng@10c3000 {
 			compatible = "qcom,kaanapali-trng", "qcom,trng";
 			reg = <0x0 0x010c3000 0x0 0x1000>;

-- 
2.34.1

