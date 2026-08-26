Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F161A2F8EBB
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713198; cv=none; b=sJpUOm+DPuwNmYcSXwbEzaKFhWtfpEiXTZUgUDkTpPYTH3KVk/vnMxLN1B4XFZ0KXJ7Zy1sroBST+DaIZaqo0N0tB5GQnEDfZ9UEGit/AfkUkU/R5vo34USDprSdSyGeFZOSl1z9fTpjBj7CxJWJH2GMnY2X2+nzx2aB2semxLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713198; c=relaxed/simple;
	bh=wFbQPVCKxbO74ZZ0CWng5BBrvITVjoU/F0l9ICpytXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tUgDl8xlKaV+UWM8yLukX9ufM98h4RobVVoIl8kPQF+QZv6y16+SqHVWR9TTl5P553zpH1kNTXa8OazxLDm49j5h8lgmnsR1bWM2N8Md09xPqXQV/jikt3ViJz82Gp+3jEh8TWzrWUr4dalZHdgk4y4dDuiU6gmAO95P3V4sHEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cT3Mt3uv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhSYjv9D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cT3Mt3uv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhSYjv9D"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q07JcQ3470329
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mqeBRaoeTGsGRv0bW1Rp9Xiqb5WJK3oVB60OTitxaA8=; b=cT3Mt3uvFoIgYoC3
	QJoT3nlR4IqjIisEVUbabmTWMaF2mZLzY+sfVoLzCUCzNMntE9vVtLSX3e85x3Zz
	LXB5NniE47f5yPgbZFRWwkcoT05qXy9J6ZY2+g8C1M2whkfVVfHfF2VIHZTx9EEL
	NBhU1T75d8fOB9K+8wQLObcGoTxUMulEtLJFEeF+shISDdTWlI0LvhSY7srE8Z6/
	Cp31lMnD3ORb/ypE44ZXsW1MsEj+YwN1JJULY8RIbhw/z8MpeBtJ8jps6JJ0JAj3
	IOQlx3mvTIvWMUWWbQP9bgMjPEuNkR6OQOsKwjCfrYP8IpiPVF+xalz+tMxAEGOu
	tiDzwg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bkuay1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:59:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so1835341a91.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787713195; x=1788317995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqeBRaoeTGsGRv0bW1Rp9Xiqb5WJK3oVB60OTitxaA8=;
        b=DhSYjv9DJ+4ncurUq2MZE80fbkyq78h9EjVrCxbrr2Ai737/vryjpF8QhDPT26uyYh
         XAYZvomjOrzA8vG9llcYroYYgxTQLubroSvInEHzwvFV7j6q3yxcG92XSLXG1F9tiSi6
         jnyM8gVvQ9Rg88XQUUA5zXxK7h62o3ial728rr85IZzuIRuVqlke9gIZXbdzPo35GSOe
         KHHINeMSGDkE5nYFNAlzssVNWb7+9g87j5JhE/TCIfRh7YJ9bXJ8gJs0trwBEA1WlqgJ
         o6/mRuD31vA/+NvZhiEU0F/ApDluifjUUxw4yaso2EhcM33S8YnoTcxRR2RalqD63xM+
         Jnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787713195; x=1788317995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqeBRaoeTGsGRv0bW1Rp9Xiqb5WJK3oVB60OTitxaA8=;
        b=ejIsAPO2RdU6XY+fqbxsWa+BZ1A8l/Ak+1/n/fQpihbIvzv1V3lTBgZDdmFlKIXk/f
         UgUEya5CF0xhwmliMeAWr0sJ96MmjtWc/69dCQtm3BLMCZvBHh2x51FTfd/1qe4Qp32a
         VwiJW5a1gvubB4iICje3Y/b6P3BT6pnRmWqpZtjZmQZeUOls9HpUR5hfRqJxk8ozhxJa
         TC3eUF3hEdXuxJuEHarPVIwpGZFIPtnt9lfg0/aDekqgDnBko+64/9isdvLl5Z06HO5b
         PLzo3yjoACpoJobo3L6LGPVnbF8m26Ktpf/EJpm5cW51nmP2Vr96bqFVNf9CpEWxO0W4
         o7gA==
X-Forwarded-Encrypted: i=1; AHgh+RodqTS72146S+wrhEb0CVWgunnDF+xqL/7VOGYxQjlPD5oFvznkWmTni9HlMh82RR0M5bPWmC5BbK/K@vger.kernel.org
X-Gm-Message-State: AFuF++m0kjGEhNAcH+6c38LQUTsvQN/eECAbz/5e+rSjnNNXszV8bZYG
	ZuyJGKVh5GcdArjophj+niLULXZpGKgjphbNtxFkE+rLT+rA9y7wtnlvqJslHvymXAvQpp59Khb
	jp1EMnbqFp0PDRiw2vq142KoY+vL6gUJkdNVneF/OilYyww5DpT6jWxfJMEELcdha
X-Gm-Gg: AR+sD11l2UerC8kl03uVY68INIBjh11y+hn2KiiiZGk2GEgpr42KbOWjZ0yHgqx6Rbk
	Gs2pFlTPvYF/kHpOh2JPf2GtUlOj5Qk/JY6nncKsKFdi5zp/JXPbBCMULVZejb8L2RgpzRScHvm
	QsyrAVcCRMqESFTWgHnMJ+GdA0649smbeO4ID4IVgtgFgtfMj5a0zb3wIs9yNa6qO9v/7nPLHpf
	NHLUZcCsjiKpFgucxOfkSmrw8BHv/ITJ0icuTxzog/hLlCii02Hbo08gvRY6TQxKfdeYdyNUjKI
	TCdFePX4i2Udnt0WYcdIAv9V7ZGAyAyPiebMZMMxkQFqy601q+QWZ47iRilMaW6VErwkr4ZK5pd
	n9RXkhOQGhFAGNVCcth/nZHLSBsHybCPoZoJDOO4EkdK3nyk=
X-Received: by 2002:a17:90b:1b0d:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39645b445d7mr13854492a91.19.1787713195187;
        Tue, 25 Aug 2026 19:59:55 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0d:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39645b445d7mr13854453a91.19.1787713194753;
        Tue, 25 Aug 2026 19:59:54 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm5222405c88.5.2026.08.25.19.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:59:54 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 19:59:22 -0700
Subject: [PATCH v10 3/5] arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy
 with dedicated pcie3b_phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-glymur_linkmode_0826-v10-3-56ab597d77e4@oss.qualcomm.com>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
In-Reply-To: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787713189; l=4440;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=wFbQPVCKxbO74ZZ0CWng5BBrvITVjoU/F0l9ICpytXI=;
 b=4dgtzX+dkH/OHLDuOot5/FQQw7M7qfUp33+YYSqChDp4fseRhdwYtZ02HBr3pxOVglO8BJFo4
 Rg++TneLaXLCOi/lCjs/Lq3HGTkrR7la0ICFIOgyRog9IhY5kiAhFID
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: aGdCuQrP7FkLhyKf6-iLsq6VXcA4qEVC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX3SwqJFGgo5CI
 mLGbW+7Xkpyrdn7efBZz7I1VqkCCUEygItWT8iG/YoqSeOyYkjs/LmirEYjNjATnUiT/9zFpT4M
 er4l2IZIYDRNZSWvl584/m+Ol62/Gt0=
X-Authority-Analysis: v=2.4 cv=TZGmcxQh c=1 sm=1 tr=0 ts=6a8e56ac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZTTPuMnDdfme7OPWMlMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: aGdCuQrP7FkLhyKf6-iLsq6VXcA4qEVC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfXzemMOhjXGtq8
 gN38SyskP0fAo4mQGs4NtK1RrmBQTTRKLlN240eqcD8ZHV63iwovvMeir9MSvAlzPCRz3niaVUm
 V7+eQgq971Y35zAgWOVrtnX6N4EsFu/EnmWIuwlYAiyUkQK8tf8GxBg3oES7ySE0BB5VLAWi2kW
 iCAiUTRClE+9htpYGVgdy0/xbaY1syleBt/za1U0SDvhzWsB5UMdD3WoJgrXSj9Md7Hku82oajf
 nsr1a7aa5qQcCPMjHAcdm69wZvMeYD2hvtnskSq/+rCH4L/WhPMT098UHUdscccQRukymsiSQWG
 6NrRmB7eTxpSoZYQ3cUdHTO2nW6zxirKxG9Hg4FPMFBFMACZxxU+JYWmxeiQwV1xSKfjc8EN0aL
 Q9OPYnaI75iSsMGLe9l1EQeXdCGOiPzeE14/wUjkjC3PuhLHxvJwgZjlc1y+gpwjhgtLiCTnVWt
 I7HtaV6FV2URPo3TPMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260022

Unlike Glymur, Mahua only has PCIe3b wired up; there is no PCIe3a
controller and no shared Gen5x8 PHY block. Delete the inherited pcie3a
and pcie3_phy nodes, and add a dedicated pcie3b_phy using the existing
qcom,glymur-qmp-gen5x4-pcie-phy compatible.

Point pcie3b_port0's phys and the GCC pipe clock parent array at
&pcie3b_phy instead of the deleted &pcie3_phy.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 89 +++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index e6c059708912..a59c5ed7b48e 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -22,6 +22,8 @@
 /delete-node/ &cpu_pd16;
 /delete-node/ &cpu_pd17;
 /delete-node/ &cti_wpss;
+/delete-node/ &pcie3_phy;
+/delete-node/ &pcie3a;
 /delete-node/ &thermal_aoss_6;
 /delete-node/ &thermal_aoss_7;
 /delete-node/ &thermal_cpu_2_0_0;
@@ -79,6 +81,52 @@ &config_noc {
 	compatible = "qcom,mahua-cnoc-cfg";
 };
 
+&gcc {
+	clocks = <&rpmhcc RPMH_CXO_CLK>,	/* Board XO source */
+		 <&rpmhcc RPMH_CXO_CLK_A>,	/* Board XO_A source */
+		 <&sleep_clk>,			/* Sleep */
+		 <0>,				/* USB 0 Phy DP0 GMUX */
+		 <0>,				/* USB 0 Phy DP1 GMUX */
+		 <0>,				/* USB 0 Phy PCIE PIPEGMUX */
+		 <0>,				/* USB 0 Phy PIPEGMUX */
+		 <0>,				/* USB 0 Phy SYS PCIE PIPEGMUX */
+		 <0>,				/* USB 1 Phy DP0 GMUX 2 */
+		 <0>,				/* USB 1 Phy DP1 GMUX 2 */
+		 <0>,				/* USB 1 Phy PCIE PIPEGMUX */
+		 <0>,				/* USB 1 Phy PIPEGMUX */
+		 <0>,				/* USB 1 Phy SYS PCIE PIPEGMUX */
+		 <0>,				/* USB 2 Phy DP0 GMUX 2 */
+		 <0>,				/* USB 2 Phy DP1 GMUX 2 */
+		 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
+		 <0>,				/* USB 2 Phy PIPEGMUX */
+		 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
+		 <0>,				/* PCIe 3a pipe */
+		 <&pcie3b_phy>,			/* PCIe 3b pipe */
+		 <&pcie4_phy>,			/* PCIe 4 */
+		 <&pcie5_phy>,			/* PCIe 5 */
+		 <&pcie6_phy>,			/* PCIe 6 */
+		 <0>,				/* QUSB4 0 PHY RX 0 */
+		 <0>,				/* QUSB4 0 PHY RX 1 */
+		 <0>,				/* QUSB4 1 PHY RX 0 */
+		 <0>,				/* QUSB4 1 PHY RX 1 */
+		 <0>,				/* QUSB4 2 PHY RX 0 */
+		 <0>,				/* QUSB4 2 PHY RX 1 */
+		 <0>,				/* UFS PHY RX Symbol 0 */
+		 <0>,				/* UFS PHY RX Symbol 1 */
+		 <0>,				/* UFS PHY TX Symbol 0 */
+		 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+		 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+		 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+		 <&usb_mp_qmpphy0>,		/* USB3 UNI PHY pipe 0 */
+		 <&usb_mp_qmpphy1>,		/* USB3 UNI PHY pipe 1 */
+		 <0>,				/* USB4 PHY 0 pcie pipe */
+		 <0>,				/* USB4 PHY 0 Max pipe */
+		 <0>,				/* USB4 PHY 1 pcie pipe */
+		 <0>,				/* USB4 PHY 1 Max pipe */
+		 <0>,				/* USB4 PHY 2 pcie */
+		 <0>;				/* USB4 PHY 2 Max */
+};
+
 &hsc_noc {
 	compatible = "qcom,mahua-hscnoc";
 };
@@ -115,6 +163,10 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie3b_port0 {
+	phys = <&pcie3b_phy>;
+};
+
 &pcie5_phy {
 	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
 		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
@@ -143,6 +195,43 @@ &pcie_west_slv_noc {
 	compatible = "qcom,mahua-pcie-west-slv-noc";
 };
 
+&soc {
+	pcie3b_phy: phy@1b90000 {
+		compatible = "qcom,glymur-qmp-gen5x4-pcie-phy";
+		reg = <0x0 0x01b90000 0x0 0x10000>;
+
+		clocks = <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
+			 <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
+			 <&tcsr TCSR_PCIE_3_CLKREF_EN>,
+			 <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_3B_PIPE_CLK>,
+			 <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref",
+			      "rchng",
+			      "pipe",
+			      "pipediv2";
+
+		resets = <&gcc GCC_PCIE_3B_PHY_BCR>,
+			 <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
+		reset-names = "phy",
+			      "phy_nocsr";
+
+		assigned-clocks = <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>;
+		assigned-clock-rates = <100000000>;
+
+		power-domains = <&gcc GCC_PCIE_3B_PHY_GDSC>;
+
+		#clock-cells = <0>;
+		clock-output-names = "pcie3b_pipe_clk";
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+};
+
 &system_noc {
 	compatible = "qcom,mahua-system-noc", "qcom,glymur-system-noc";
 };

-- 
2.34.1

