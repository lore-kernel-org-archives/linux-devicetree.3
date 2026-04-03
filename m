Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF7238836F
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216365; cv=none; b=dcjRYPZx0434eJlksL78vWZMaMs1ma2tbm62qL/oB7PB/YjROaHDlgbgLFUeEBIpQhlF0sprcdJdc0W13+tWoDiJ5km1VXJlcNO82AvEjWi3UEtQlmtAdqhkgx4XwJMhqVoMyYvE0Eg5wCortcG0GkkLNV2QjpIR0pRqGUM1zr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216365; c=relaxed/simple;
	bh=t7FMZglK2+2jzZa8/1V7/2Es9cmYaXdet2+pFupx/iM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tvx0f5dnnQ7YsFwmJvJNkOIsXAhqeV1QsRuMBawrEdTqVhaEUmDJz09NaGQrDen4XcAic1inV5eHbp2BXMQgRXOcxb6pv/UzsjoWzXhV8xiNnynEEm1O5JGWr6XHpGAtXGJtMYitErUUW3d4y7Jerz2HFsu01C184KlHZ+U7G+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQNnEMKG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIQnprji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQNnEMKG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIQnprji"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336CGYC3772506
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 11:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zNRlukmz2e0NPoVz1cn93h
	uf+OC841eR9ihg676N1oQ=; b=aQNnEMKGuDKfY0S4T3Yb15K3OGY15qqW5EwTm3
	+LuhN5ejSlN7o9OoMnSF2NwsDoXiSZz2jx5LNtSZHJyLFYui5gRl5CerixRj7iS0
	omTh9jNPYuCiIs30iPV92wssxk/Jqfubt0b4JDFTj7jlhtPWC0f8u01s0tXriYuy
	mIaRwnvzNf0jzmEQNKx7Dhlozdle5LqjE6Bg1NQGEMeGm7BFr/Ur1Om2eE6mFeV8
	b0jDHOtU74QNQNm4ZtbchdnWFsxY7K64B9l3MTRhVx3rHx/5cnnqa78A+wGeUr16
	wNV+LgYQ/VaQkSpg6ZUCJ7nSVPih7/+NRZd5N7qcXDSEgyWw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs2rbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 11:39:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so2345531eec.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775216355; x=1775821155; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNRlukmz2e0NPoVz1cn93huf+OC841eR9ihg676N1oQ=;
        b=CIQnprjirQ5I0ceLNupfIWsz/98xprUtxubaENdGXTQFyV3fjikxF5LvkqAtlbZC0P
         dpRbfwtHcLa8Uu0dlNLrE0JZMBPp1e5ouWHHdWMf7L++hh4GzWy/cr3lRXxtPJhozsn+
         IGEso/jDUfhDY1bk0q+nSCEhka+/Bchx+lllupYh8atpPBrFiRGX0Ok31LLKZCdq5/6y
         4oEfqR/KrEJ5hpyYL0GmCLe/vRZA+E6mm0vUMeekAOmRWk8zcCZoCtkuAv6GO9jbkqGS
         WEJqugV2W9En1xP8qLJX5R++YxlWWHdZjOxuzddVmZis2rCEXb6nu6+E+Csin75LGIgt
         kuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216355; x=1775821155;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNRlukmz2e0NPoVz1cn93huf+OC841eR9ihg676N1oQ=;
        b=mrnwJ+KEI88NkJNLCg3Wkl5FFXnoavEFKv20o1b1Zk0/VEbHs2fUPCMDJRFDYYnAX6
         cieYnVamzrgpdbB3Sp1Q+6YY0VJf4qJgE1qBvaAGlZ6wuxrdT8XVaFansvRylakqjfwX
         g35cvD1GqieVJZOegoCUCYJdQTIKawP/nTxwA0CClOlm//FsyeBpYiHdgDNznGfgqoBE
         nN1nIB5acB4zbvetnmbJf4JZJZQ6QRWbewz1tp3w58RVjaD+Yjf83f6eOzy0bIDBEA9E
         sN6V+k/Wrr/eGfo151qH8sCqqfKoCCqIaf64HnX/Uzl+WIho0/vDO950sRrbTy1wcow+
         JKEg==
X-Forwarded-Encrypted: i=1; AJvYcCU/rsgvS3FVrZfuVUc/wyvBHqYWFZIc6KvxoAbKXKmeDT380fgNicVhU4SMZ3gYYQBt+IVZNRFrTYyS@vger.kernel.org
X-Gm-Message-State: AOJu0YyDa2Cxzzy5LZrhhSYGCXLYevsi0XkQWXw5bq7sNEmkphCXLK7W
	LMK0eMduLZqidffKs/Q2oHRfyjp5jCiWKa4HJ5/hgcHThxISAAJC8o2WeOVt3tXG7JrNIfZgO2U
	xEBrCpeTL5ec3G8WrQ71T2FThaV4BRaF81uc4nsy/wSK1GXmgaKE4jZeI9lutaxVQ
X-Gm-Gg: AeBDiethjPgKz4vo2txjbS5CTUnDk/BPu10qR7D5XTkivHfXTgNPpTUtrI93sTFB0oX
	2COZ6AXollEG+b/WQ1g5X/rJt1BDyMtdV09pLEACd7uO1+T6XASi0cT+Uw2WuWyH+RP/TCk0kMz
	H4lMYPy2xdFq1tWn25hy/WvCRvFcNpYYX6q4lx627KE9niqY4Yexj5wMzEiE4QtDezsk5cGgWWF
	FxGuJUS6wHfXu0PtTp5nkS1o+kRrLzg+06fSfqlrWcM/7Jzh/apIN3qAjmD/hvMVzdl7jElfrpA
	pUbX0qJU9TMjfBJ5Cm/hp06/CYd/2nHZ9s92rkEZcqN/7li8dLSeMQIDiCSxQefLj9bpIO6ySzz
	ztgycVnHof7caVpp4ko85g97/xz57XyuYz16edTpYps7PWo0/c6W4EQw4cwiBZoV9PcCyMUA=
X-Received: by 2002:a05:7301:d1b:b0:2c0:dc7e:ed17 with SMTP id 5a478bee46e88-2cbf9afb1edmr1436578eec.10.1775216355289;
        Fri, 03 Apr 2026 04:39:15 -0700 (PDT)
X-Received: by 2002:a05:7301:d1b:b0:2c0:dc7e:ed17 with SMTP id 5a478bee46e88-2cbf9afb1edmr1436568eec.10.1775216354705;
        Fri, 03 Apr 2026 04:39:14 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20b195sm4905005eec.16.2026.04.03.04.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:39:14 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 04:39:05 -0700
Subject: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANmmz2kC/y2NSW7DMAxFr2JoHQYaPKMoeo8iC4mmUiWeItpBi
 yB3r+xkQ+AR///3EEwxEIs2e4hI98BhGhOYQybwx45ngtAlFlrqUubSwLn/G9YIPCHOoNHqwht
 nJGmRKnMkH373ue/Ti3l1F8Jl23gnIt3W5FleMTEQs909bfaxa4wu4TrOb0e3wF2BBFtK1JZMS
 Y37mpiPt9X2OA3DMZ3PbdtZJtg+YWkz10mvTEOFR6VUrauqcrVC8mjqxpAtZF3kOaE4PZ//8lO
 tLgYBAAA=
X-Change-ID: 20260403-glymur-soccp-2ca25f3b30e2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775216354; l=3114;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=dFPY0H1JaBHk/xYfZOnRkRZDP/3sJqYBg5AFq3lCtH8=;
 b=9rppjBP2DK82xX+MB2GijNXSZIuHv5Py3RaMgMMY5lQe0sP209+T5sL9XKkZBJ4uxyrNDK2Zm
 PzN5HVJey1lBcfjqyRKAT3rsO9ZkCT0xtpGqsKww1ihKQEsqA4sZEal
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-ORIG-GUID: Nloaz6uxRisz44aR8gPj3ERWUOxLMR8c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEwMyBTYWx0ZWRfX1UXlZIJvlA30
 wcTBoxxX9P0J5Vvb2jC+EMyGpIQzNDFTyZzdpPSdLjcr8xd6kqjQKZqNIGopCBcVOsm5D3xuuFf
 3dCLtug/JK09MUqqnCp2JmS+YK/zKIpJJbdzXEUCtfInAV8hHluRg2pH9h8vGx9IGgHchhhasph
 +tAgjrNUsj2RkxrWT342QrbAK04N9/Kc5twJGW3+0867XvQqWQWE4jTQP3zaKr6836pgeUw3sBn
 YZ7JLwFXW2BTNSbYJPom/V1D5h0ClUD+uLW4YNbwd6jECB2E/OjBFN8a4ZWWl1No0VnmfqiHMY/
 +grN/AGlRAPlWWEO7+KSg9uP2G0FnAqcIss7sOY1E1IWs9f26qSj0wWzFizaSder1xHKnMAiUCu
 Xlc9IpvFiL3Qg79x8PbaZSr9W7HU7sLTf1EPR0p0aeTlGDgIbwvipqKjyQTEYQ0zUSGlDNFO+Tf
 JZ4y0qafl+6aw90QLCA==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69cfa6e4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BYW15FwYW1ykoKNPTzIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Nloaz6uxRisz44aR8gPj3ERWUOxLMR8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030103

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 47 ++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2852d257ac8c..3fdf8dbbde02 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -560,6 +560,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/glymur/soccp.mbn",
+			"qcom/glymur/soccp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..f7f3374a5e08 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2264,6 +2264,53 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc-soccp@d00000 {
+			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
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
+					<&soccpdtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+
+			};
+		};
+
 		usb_hs_phy: phy@fa0000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";

---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260403-glymur-soccp-2ca25f3b30e2
prerequisite-message-id: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
prerequisite-patch-id: fa390011ee531589a7ad14250d158f497622efbd
prerequisite-patch-id: 93e7fca58a5c06edefa624ec2b006dd80f4749a8
prerequisite-patch-id: 99a3b6a7fcd061267b40097ad25f652ebe0a4c7b

Best regards,
--  
Ananthu C V <ananthu.cv@oss.qualcomm.com>

