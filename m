Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7324F560ABF
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881371; cv=none; b=aNnwloHSKb6QQyhrdBvj+4mVEQgoFVbePYnQXZlNI5QPqESHSM1Uutk4tFgeoYmvAgjEfLLDLV8pYhi7kMlPS0DeBuwF/jkQHzFeeSNCoXpEqbxVR13OmhRg2O1IvPvxZPqL5sxas22q/4QDimO3WJ57eRsNxhjLuneZUes8r+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881371; c=relaxed/simple;
	bh=t6Z5sjaDxX6xGekJGOZPq41x3m5eNArj55TVt7VRYR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZE1aDZ7DCooO4AzUnog4lQWzJ0DmS/s479Vtvnz/k+0Txo8d99PT9+48w/+VhG/j2gJ3L/hTpQJz2zDknNp8ciuny42dwOVCKVq+sddZxcmh3kEywoRnydIP/zrc+WIzelCMkDKIAofxDgDU/drrEUUrHORWciGb5JtwET3mtSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzNhWrCq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXpkbPF/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzNhWrCq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXpkbPF/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FOaeb2866033
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 15:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5SDhJCZBKrKqnQBt/dW/LAOkN1QohwQG3Wjy6HEB+M=; b=NzNhWrCqsxOFWoLX
	nNX6k8ViZ8KTFKXRX1lhbRhdg3YvjaU9KdJJ/VTKBKw3G9+72KvO5CYF0ANt+2pB
	rFbmJNM5VRNvyzD9RSobDxOa86rlgHI98rhaJNAndLXGuPoRVJWZ2y6jmRnW248A
	iSSO2+Rqn1UvqPP58t5vdbu11TMMzSGOZMTGhrVcyNcOIfD/tl3hxWJHFEplktCU
	H8pIPJF6bA3CldvhAWDGBVeYHIfQgER8ZETihjhDg56jnj1JkRcaSePEbuZCVFx3
	aYOcv4pyyHBM233F0zjLDmxGkeFbTqbrkXVdCVBTzd2c0VwLHzDPT0Uy3lz+XUU9
	gwB6JQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvujbfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 15:29:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-74748e3a5b6so5192719137.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881355; x=1789486155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5SDhJCZBKrKqnQBt/dW/LAOkN1QohwQG3Wjy6HEB+M=;
        b=hXpkbPF/3Avjxe4C5ZoRJLZLI4CNBC1Qff7WI2h2c8gOMqR40B0dikUH/ljw/wXvJ9
         b0+kMjzf1L4yELnUmnlC8TKYv3BVbi/xmW50OCt6QAFRqUEkG+yN1woik4tF71FwBxgX
         isSDPOdAjW7ihtRyQJnh+iPkQD+/lea8kqSoXMIxRkb09rFi9LJWne196I+3zZehjYnU
         /1PILNYx839n8A79pLtcnudbUavJ7+kiv2MqPw8hRQ0sfKen4ReKimBH973SyE+cjMjL
         BROPAXlP4E3IqFg1qf8nvfJ2oOL+SooIGkVd/ZmR2VTSckIQvSkv2Oap98a54P/TqWd8
         DZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881355; x=1789486155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5SDhJCZBKrKqnQBt/dW/LAOkN1QohwQG3Wjy6HEB+M=;
        b=fSyIDb38iBMjGPpEStU6K2Fp6Kc2EoAtfnX5sVWOFbe+ZuYbEAO6EO1KEmettWEbnm
         oWWqiSdDtTvMsZ+zRVYUv1jq9R6ZX0J/tt5y769bW0satrmBAGpD3PyIWXzeK/d36ENy
         HgkskT3KR4sAoda6hj3eWyGpAaS+rtNQd2Ov+ndCojIkNy4iyuCN8oTz1WuVl0SRjQB0
         2BXbTA6ekF9pcMETbZaFifLLBELOuwYbQhCAhgaQFb0ArmIKyzGDRkixDC1SJjC74PUL
         UQOUbdYCxOApZ+v7loGpUAjmHoDVeTbbFXv5fWhH5NnZATLw7svjd26dIgnquJ7s80X3
         hftQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmKNLPVIIu6RTpmTGlX/e55UPUQAgW6Fra6zeq/MzPyj4yTslLQFyYAVIY+RfN3AJzdN0J2xJWLOn7@vger.kernel.org
X-Gm-Message-State: AFuF++mFbOcJ12eVPt6TwoxkQIwZvNqmbaF1VY9WyWzMK9cI6hjsUDOe
	nqb+e5ElBvJTzaD7erT6EWId40TBu7lpEK0eGWhcuR8vEDoAfC+9l4Epv5hiINAdCVuONDpFOf3
	sMI4C6ZXj0wcVvdVazQYlkmYit6LO2aMZBB1WkVbEbke7tC/0RvTc4NhFK5wKP+T/kYpRZpIh
X-Gm-Gg: AYBFou1gIZ5mo/Zgjjkp3SrpB6wHFo/wGk1F3pvx3yQBNACaunqd8GWE6xh5DIiJtpy
	R+p4xrjR+K6F+Bp/+pSG0LgYKfaY54Z2TCKfKOi3SKw8YToOPKdxZzodh0O1y5ALjtavkvqNDND
	eO6NwNudTOHVdxAn2KnGqcq/DB7CTPlxcdArJrHOPnPF0RMip0WaODK4F+YbZzqqJuRaphofKRH
	Y4Ow5H4tEs6Sq7THhybuBMdVxCYaaAyAxqpelam13S28on3SGc3hmtKmE3ktsmAR26vni61Rvdz
	6sL/wYqg+aiRrK7cXf8YDtqzZ2gs4lCi+orU1kfkxBssr50WBdBTixpW/Nw6J1PHi1TcH4vpWDQ
	4s9K2NB7yV2BpUw==
X-Received: by 2002:a05:6102:30c6:20b0:780:c9c:bfcd with SMTP id ada2fe7eead31-78a2f00e2a9mr6734432137.17.1788881354957;
        Tue, 08 Sep 2026 08:29:14 -0700 (PDT)
X-Received: by 2002:a05:6102:30c6:20b0:780:c9c:bfcd with SMTP id ada2fe7eead31-78a2f00e2a9mr6734419137.17.1788881354502;
        Tue, 08 Sep 2026 08:29:14 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm338914105e9.1.2026.09.08.08.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:29:13 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 17:28:38 +0200
Subject: [PATCH v4 5/5] arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563
 embedded GPIO controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-pci-tc9563-aux-v4-5-c7fc7778292b@oss.qualcomm.com>
References: <20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com>
In-Reply-To: <20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6aa029cc cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=kuerolza6ZzA2jZXMEwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: kg4pl_xst0Frv9EZocOtnoB-GBM6LPwH
X-Proofpoint-ORIG-GUID: kg4pl_xst0Frv9EZocOtnoB-GBM6LPwH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX22Ei0gpQpO/p
 aiV22Z8RjamGdWZX/KiN+CAhl1FDEWIphgiuVuKaykK5fmmpFVoSn9zTaZQ+Gw1UbGCwTRCvVI7
 ItKbWCAgRcOMlBarLaXaE1C2aIL3YLlV0X681CUNdXpRNYGGzIu3ZH6t5gu4H9126ieqL+HOdnZ
 I/LhkQoKpmSNdxroVlkj6AFhVCY3dVV6W/gUUSixM9HK4+tXC1a6YIbtT0d+oLfJrZ3ziscg9pT
 D5W0htl4+6plJkKHFtboF7XO3BJUyN8Q+Xzl9dZt8eJmGIUymp97TSxGT7kxVxtvmFwwftkYMpC
 lBvWGX1kx1r4Y5P+C4l1goiQN36IIGoV2iN/oUVzGi0C0f53F6VSVTWvPIap7d2MUpssbJHP3+3
 tbQO48hnlOkHRCsYRsAD1IHAeQ01mBP6+TYYlLo4lPgnsZkLC6BxW3xMGy0o5dnmvCVHE/Jmfl9
 fqfTuUk3e7QmjDDm6Dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX9EluCyujsfGu
 bWDBZXlvKr1+WnBnDHRlFeYabNEpwZr+hNuvMHp/Oy+sK9VO3Q07phnjWAaCPlCPrGYy8xcvJKo
 CbvBk16nYHv9DX3Tjxy/Pc2fr2J/ynU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080167

The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines. The controller is registered as an auxiliary device by the TC9563
power controller driver and accessed through the same i2c device.

Describe the switch node itself as the embedded GPIO controller and us
it to drive the PERST# reset lines of the two external downstream port
(pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
switching to the GPIO descriptor API for per-port resets.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..4da7342ca90d 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -867,7 +867,7 @@ &pcie1_phy {
 &pcie1_port0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 
-	pcie@0,0 {
+	tc9563: pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 		#address-cells = <3>;
@@ -891,6 +891,9 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		gpio-controller;
+		#gpio-cells = <2>;
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -899,6 +902,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x3 0xff>;
+			reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
 		};
 
 		pcie@2,0 {
@@ -909,6 +913,7 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+			reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
 
 			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
 			usb-controller@0,0 {

-- 
2.55.0

