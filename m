Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025AD3F4DF8
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096292; cv=none; b=SW4glPii3cKOkqiiEec0mXJxaecS1NM0++SbuFzmiVemjDt0m4CoCXuV3ATYEd/T0h1oiBinwPZ9qjo5a3s/MZH3BKpF3FQWpxgzXySDoIZw35jqgiODeFuDvSs4jSB6NLt4n7Gav07bONIWyeUR7AJZu4qCY2T8dWsttnFfyXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096292; c=relaxed/simple;
	bh=wFbQPVCKxbO74ZZ0CWng5BBrvITVjoU/F0l9ICpytXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b07LV2r9dqlPC8nJ2oWQ6PVu3NVGdZwI69tlLgZJqvSwPQAvW9+gX+tifHMRvTMLJwe1d0Y5ro6lQBFq/OAud8foSjoot00IY5mHIs65x8wOGejOlZDpL7VmCjiBgumC64oPX6GyH3GJunh25cQtkla+jUlN7AQgdrKOiy6tRsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArqqCiqb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnIBXp/n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArqqCiqb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnIBXp/n"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67780uVe3564471
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 09:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mqeBRaoeTGsGRv0bW1Rp9Xiqb5WJK3oVB60OTitxaA8=; b=ArqqCiqbvPZbtCjB
	XHf5H71+GU5qzWUWbdRwzumjGX+9DcC/XLbVuz8yF3Z1LsZ7Gqvh+oaK+9b5yVvu
	9TGnzfO9EVjp0LfGebLrDWaPZFTsVcNS7ZP2IBVXdkGgMhLHnMsAyL5qhjOpztUi
	GXKWZerrkE3zI/dsogGaSmZbcsMtZ1KQr3XnODUjAdZe3esXR0Zs6tr4wgM6TeWR
	bK4TDHcE/gWqXKNiIJHA813+Dh5XoMAJubT17C8F2A8zALxCx04wd9pH81aY8hFz
	+DQ+IxGQl29Myb/2bRhYDlAHL2szCgOVwCrQBkJXjulBrwC043dOheZwHoaCfAem
	7ZInyg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6ju7nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 09:51:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8488ac68185so7849776b3a.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 02:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786096288; x=1786701088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqeBRaoeTGsGRv0bW1Rp9Xiqb5WJK3oVB60OTitxaA8=;
        b=MnIBXp/nVEKJVGaOLXF25ui/JPlmDG313H9KI9M28Q7ZUjbIfgbcpEraEcbIz+82qa
         KWTxT3MyAFi03r0FYdZ6CS4aw3+35vUELEJOgJeQaBP6t3c/s0TVzd+NosdtREOODsRZ
         EhWw3OXe0NwV6JADvGckLPt9YKODkIHwRYznLOCsTF9ZRmOa5mRkMB0ui0gYbpudaT/5
         4pFqywkHGg8B/aKr+YCQrMQsfN/6ZrheIisBWt4rwgVoPBh78xEIR0mOSsUOaRCB5EV9
         TPz8h3QOG2hu22NkHUJHHuitHe6mL/JCZWmBcPJ2oQJVNjnZY3HJDZ6unvU5vOCz3opM
         zbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096288; x=1786701088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqeBRaoeTGsGRv0bW1Rp9Xiqb5WJK3oVB60OTitxaA8=;
        b=HzqrfJh3DcMUpGKgFbCvoNRPQ1avGMPp8nTWFCape7lBU0eiYgEg1qvbGJ1UShtnTx
         vX+uelMNP0Nmryu12uoGo/6J0/sGFB+PaCRiGHE072TsnV66Lu4qqK/yEaV++8cTFRlR
         AZ5jWRKXCCMz1dn3GyZihipeYzGqpyzb9FbTlrntoStx1Nj+I+b1cbGVky5tmXipMURM
         TND2QEAlZ/C/UZ2VlQWBOv5jcaeq5NtUeVFpn1H3AVccT7yddLNGlSEfp2pR+vNEuzBU
         NzpUSsBBFyMpIzM+qy9h9+Xfi7aymQo/Sgb2cqXj5IwNHAE8w05QQtZQp1PspSsL3tlQ
         +D/w==
X-Forwarded-Encrypted: i=1; AHgh+RrvZdWHaIkN+JV7N6lGxZF9JaJr5BPP3AttzmVR3c/aZ91dP/A6NSfbGJ6eNuC/OAoNtk/dnmpplHau@vger.kernel.org
X-Gm-Message-State: AOJu0YwpgKTlUJLBLL+fQqfq3yVphn12Xm2gLjxs7yA3nRULUqQ4szJ3
	DH2B8XG1kCAJQQFNJ05gpp7bftjvtwIfsFfXkS8FgjzQqgTGmNYPopGPShC1kI4JlGrHLD5eQMx
	9H9TaH5TSpUR2dzkVEXTmVzout5sHfZzbXXdgzvIvjqcDyLHmQ1J5wzN+SWq43zPI
X-Gm-Gg: AR+sD12eQ42ldUePlN+4217VRveSmBVOB8/CVnhhsaRrFuWcmu/WrYkrow2zm55gMU9
	y08bcsXfzNbt4gb5zqfvV8FL0BH2jFu3RWMj7fzQgKlVOVTL0GTXLQYApbNrhOp7sHS/cjdS/9a
	yGva1dK7TDUfGKRX1R8m1N9MP7r9nG7v/e51NbRwXq69c6NBrKqxv6bw3EcOLo1KXo9OQljCHGf
	vN+VemDPNm6KOfLE1saiDnXQ58MWv1lH4QiX0RutwPK6H9VbtOnWotHXL3EboTH7JzEuFLigsM8
	ingX4jHqWbmV1scAcrGHM15JWIeCbj2aNTag550MUXs8tR33wlQX9HSgrIAVzjqrHBzoZKHpi8Z
	Gr9UzTuJ4Dj8AiUaGreEF+Ux5Tm2FtMElWdRYQfJUvfbCQao=
X-Received: by 2002:a05:6a00:4143:b0:84e:244a:98e8 with SMTP id d2e1a72fcca58-84f2e0645a2mr24443336b3a.30.1786096287565;
        Fri, 07 Aug 2026 02:51:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:4143:b0:84e:244a:98e8 with SMTP id d2e1a72fcca58-84f2e0645a2mr24443281b3a.30.1786096287130;
        Fri, 07 Aug 2026 02:51:27 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cad9dsm743785b3a.23.2026.08.07.02.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:51:26 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 02:51:14 -0700
Subject: [PATCH v9 5/6] arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy
 with dedicated pcie3b_phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-glymur_linkmode_0807-v9-5-dd1c7e236e29@oss.qualcomm.com>
References: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
In-Reply-To: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786096278; l=4440;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=wFbQPVCKxbO74ZZ0CWng5BBrvITVjoU/F0l9ICpytXI=;
 b=kS6ENJ0SFHaxy/e85UgstujIskCGDkMNgHeG2hSfcxyj89IIHKQJO38At6yRoy5JUhcsuCi3N
 2yMx3LY74ggBavf2HuA0Kz8HKiacQFtFSmEa2uSLwwZZfgYfvdOEfGa
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a75aaa0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZTTPuMnDdfme7OPWMlMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX1CN8WkmM/odi
 hOxjawxtZX4HJmJphY2WeessUByDxBNW1+M8JBjVEtkLSF15+WrunCxHqRWdYtx7XgDkV0TGkQG
 bslLNg5OTnbjNoPGOUwsp6rqsBT9I/US+q1EpJX9dg3e8bVKPvBhdKTtXE7NEgw606O+mMDndxM
 T32iS5/zN8sSpLGPLh+0VkOh/PII8WiX5Wa4XgMP4tawR8LV3o21WXwzk9JQU2c0tiqqoKp1+oW
 F/CFek59WC1QuhSsU+pNUwUReQVxT+zv9E5sdRnRrE8ysIG/+Iaa7+hl4uRT7Y/prmmDSRlE3YI
 55JVZQpV+PpaShKLCze2jIhqTIdFCElMgDmkk+CZXTkyVGaTnNT4QNmGKCzA82E6DNypDr8ZK85
 vSAFUmeTZwYMDENaxesT4vVwyCOZUZM/LAIk8dssRyS2cfliZHss71jjDZNl/ckU09fCsp+9Ve5
 WrvZp4x/Fee3tcI/YGw==
X-Proofpoint-GUID: WoLLb7fedC1bqfwmUvozFlXo02wapJAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX9qyjKM/13RHk
 Hikt0zJ18zdFDOrP4qmBm5JffSeI9wOzsiS83ujNWt9TUconD6MVFk4czmnUUxzqGeFwlcCzzjS
 5ASEaf49Hxymy1CV1nSalrz8j5f8FGY=
X-Proofpoint-ORIG-GUID: WoLLb7fedC1bqfwmUvozFlXo02wapJAE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070074

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

