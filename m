Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E8D38BF7A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643658; cv=none; b=jGlYvopsW7EqblcOjlxIStluN/RlocsqfAL3feuExIe0z0NIcEbNY6TOK75Id3hOVGkefUv+lTlOwwZQZszXtlCZ9nQdUIKljGMriD5Ww96mHaXwEXJI7n1B2yjH9DzaYdxPsftf7rOe+PQJM49lbxLrLMC1VSY46XdA4C7Ry0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643658; c=relaxed/simple;
	bh=hmVH207YlGjgeVjOv0IT90wUrIgGTRNdBGVozjlzgXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGQkkpGuJN13CVswcSehdWPx/ObCorD1srwis0yHPnK78jI8KQPqT5exo3SaGHnvRJeREB4hYhkb+bNjfKGe8HIEyKlThYAg3/OxHuIfQMmKqrJbGIPMeCkRkvwEotLqt9T8oc8LGSYuj0MjfND6N/zOY1RWI/8BY/iCc+IXLaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2N0ILMF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ou652KuP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2N0ILMF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ou652KuP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfoMB2962562
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SgUIL4Uc+wDbNliZD528Ed6WpNW/XAQCpiTmjNJxz3k=; b=O2N0ILMFKqo6o+6z
	ffm9QwvAysxLcYKQtvmJUT2A3lebjmhQ++jnjIttEFnNfcrD2+zlLkLLeYqZU6Wd
	apbUiEMDP1T/hbNnK31D1fwz2QC/PCCs+R3cS0PfTst2wPvyqVZlXDOI5o+dPGeC
	K1cDPFGFRSj86TFVYa3ra4m7bXqZChugdSbwWzgVkpAwY3xyaBs0TgYWaeg84Bzl
	Bng+jeeaSgXbkRuZ2ttyOlrf4Z51VKajAA3Pco9wLjF2gAb9oOlotTQkDsvBTis5
	jyoY9spRT9JOs7jNwQor9/pajvauCygs8iPamTHOoa8VsCO8r2ziuxFQBsdyjYOj
	EUKkxg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nss76t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:20:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfd1772d8so19024751cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784643655; x=1785248455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgUIL4Uc+wDbNliZD528Ed6WpNW/XAQCpiTmjNJxz3k=;
        b=Ou652KuP5Rh2W/4gIJ/qSkeYmVP3rVDOG7zVQktDApN0yHoHgS4hZbdaACBARHVEWh
         gLULkt+K2dS1yDEHL0te/PpthNdr7MnXoEpSJINZAbtdFYVREpoLX760GQ+B544LX1RO
         SroCPfSDz9ZsTyqzFAdDAdoi3byULKhOSKF9eprEdjSBGFebKjv5DVAn6kAgEaj7M3xD
         8dVgAJC+tK+4ys45iW6/w2ioTnqnIz38A7IRBhPbxdY9XCkxugIgth0ZhwtKaxaAYTLG
         /IF6ZIYfOPAChE5nrrZDE2uk6h4mMjFmwKVSevQPPShtTHCC/Jh3FrnkYMjpN0KFCXS+
         IrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643655; x=1785248455;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgUIL4Uc+wDbNliZD528Ed6WpNW/XAQCpiTmjNJxz3k=;
        b=KFP+YjmhmJCmcEmhHdrs7BdOu6wGLUeDSSU7FJUy2cqZhfQdZgxTF6OL3wnosnijl9
         2S6b+Jv82HfhEBwGnmjhjdeScbbqwSCfLWF87wyad3S8DbypQOH32mAaaYQ/zZKUWTvI
         obpA3BlO2D/5Cr2naPjP61Il8+up9cVv+DNI7XybduJIDG+2+CZMJFNHry7LUwjIl2eR
         sz/jPyfRrwp2FXRVDiQyzDhzxexcKL78e0v0bRDkRvsXyl45RQEBh/xH6Ch4IK1wEelp
         bAmInQYjjAaqrKKyQzHdI5IncCBuR1YP9UgeI55edqQECSRysah1V23SvaSH4puQuMPU
         r6yQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTOPaOHuxNmyyLujgqOeJ9hq9hQfrwLADXYf8RcTj0/LBQKK+I3W3jX2XzeUYlXeOQLvMuOqGFl81L@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1iNRNDofXp6Byn5IsvQf51RPyUyvIl9y0oQn7zo1+edoE3y4F
	vGy0LQoYzjQbTKwyFZ+wN8LEiq/mGNfIBfps6S4XpnWyJIfepIlE5BPQxuAsYtr5l2ICrO8NoDz
	SyCZo1VTU/TbwaBQpx+06avFIXpxVycW1Jb45xqjm0D0rBdCHnESW0UAdjl2/ehZ7
X-Gm-Gg: AfdE7ck+T3gA9Q/8gLw3sCvWIbn1Z7tEa/i3s9m63ZkGS74Cxh+aDc+ZQcpZdnDr8Fn
	AWE/HV5HZInDRdjmVZBupELMulSH+WnF/vjXqHQGxocgqQDD/xyb6q2EalH11LCX+TboGVknbbT
	8Y9ODpbK+q9X6Ia4cH5tvwPzaOU1matKrx8yB0fnrLIJUkFv14jJlJnfMIFHhGd/b+To1TV6jLr
	5nZ4OtCiDTx0eBryDPUWNeOBSeN3dSI6j23nljnMiwE6hLZsUd3qC8pYqW5V6NGa0yczOjAbBlT
	/ALE2jAEuXeeS/PPqip0DOYqzVZ4Enc7wHX4ulV8ayjCJjQUjZPccxRj2/D9kJDI9g4MTC2qujo
	UooG6WuEst66/C6j5tymYxdh0
X-Received: by 2002:ac8:5895:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-526756d20e3mr26098131cf.9.1784643655091;
        Tue, 21 Jul 2026 07:20:55 -0700 (PDT)
X-Received: by 2002:ac8:5895:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-526756d20e3mr26097521cf.9.1784643654329;
        Tue, 21 Jul 2026 07:20:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a09a4fsm603476066b.18.2026.07.21.07.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:20:53 -0700 (PDT)
Message-ID: <5ab6186c-fd8f-4bd3-bab8-b42457ab5833@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:20:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (sheng)
To: code_0002@163.com, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        map220v <map220v300@gmail.com>, code002-2 <hiez832670@gmail.com>
References: <20260721133204.902-1-code_0002@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721133204.902-1-code_0002@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XF7EeirXGkk057TnFN7he2FdpBxT1Lo4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfX4vGtzSdP/bU4
 GfIXqZDF7je+ZzYwGXpjaCoxlaT9Mk/4OtJtPO72pr3F9S5F2hmNoiMwSe8wJmvGW83jWpTQ/h4
 HbxJ1oSqou8RBIkcwTzP1DzlqHC15PM=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f8048 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8
 a=pGLkceISAAAA:8 a=fTb0It4u4e7bpotUsQUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: XF7EeirXGkk057TnFN7he2FdpBxT1Lo4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfX/nvKOBYs0mbL
 AOk1zyW2HMg0hvz+VZxXA2/XojudWsBtlvBB2xEld96j602c2jIKVk081Lf1ZVxpt0hu3INuJ9E
 bNAoe59AUPB3948eH2ajLK7rIvMLqP6cAjRve3bQdbU0rgA0dZuifJ9KxKjMfVJcfo4zitgKsI6
 GUmKRwfuMb6opt/aobioaaYzLlMQ22nfGKEtbTyrYYPZbrkZ2P7VE2rN7z4D4bodRZwkfWyBAqG
 r+Mhh7l2JdluPLS9bAz49eCbsvOozrXMIfq1YRLlDgoljfcVJjLj42UvprYbrK0cv59BuD465JH
 PMWCBjaicbbERiiBQhxrEpA/M65mYLJdvYlpR0fzGI4FGVf/XJeoJ1fzN+ULwQ1duJJZhn2wPij
 9L8VKaC3aw26YaGciDsxq7R5w3icn7cNx47/XLcyoIoVK41006gQApOxTRJMIl+ev0l3KXAhKto
 FXixzWXN7F27fYQTQOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210151

On 7/21/26 3:32 PM, code_0002@163.com wrote:
> From: map220v <map220v300@gmail.com>
> 
> Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.
> 
> Signed-off-by: code002-2 <hiez832670@gmail.com>
> ---

[...]

> +/*
> + * Free unused regions, these regions don't exist in downstream
> + * dts, and they aren't removed from DDR Memory Map by UEFI.
> + */
> +/delete-node/ &hyp_tags_reserved_mem;
> +/delete-node/ &cdsp_secure_heap_mem;
> +/delete-node/ &trust_ui_vm_mem;
> +/delete-node/ &trust_ui_vm_dump;
> +/delete-node/ &trust_ui_vm_qrtr;
> +/delete-node/ &trust_ui_vm_vblk0_ring;
> +/delete-node/ &trust_ui_vm_vblk1_ring;
> +/delete-node/ &trust_ui_vm_swiotlb;
> +/delete-node/ &oem_vm_vblk0_ring;
> +/delete-node/ &oem_vm_swiotlb;
> +/delete-node/ &oem_vm_mem;
> +/delete-node/ &hyp_ext_tags_mem;
> +/delete-node/ &hyp_ext_reserved_mem;

I think all of them can be removed from the SoC DTSI

> +/* Xiaomi uses alternative gpio's for i2c8 */
> +/delete-node/ &qup_i2c8_data_clk;
> +
> +/* Xiaomi change for Nanosic WN803x */
> +/delete-node/ &qup_i2c9_data_clk;

The change here seems to just be a difference in pull-up

> +
> +/* SM8550P doesn't have Modem DSP */
> +/delete-node/ &mpss_dsm_mem;
> +/delete-node/ &mpss_mem;
> +/delete-node/ &q6_mpss_dtb_mem;
> +/delete-node/ &remoteproc_mpss;

I'm not sure that's true. Have you tried booting it up?


> +/ {
> +	model = "Xiaomi Pad 6S Pro 12.4";
> +	compatible = "xiaomi,sheng", "qcom,sm8550";
> +	chassis-type = "tablet";
> +	qcom,msm-id = <536 0x20000>; /* SM8550P v2.0 */

Please define it in include/dt-bindings/arm/qcom,ids.h and use the define here
But you shouldn't need msm-id on non-ancient hardware

> +	qcom,board-id = <0x10008 0>;
> +
> +	aliases {
> +		serial0 = &uart7;
> +		serial1 = &uart14;
> +	};
> +
> +	chosen {
> +		/* Required for libcamera to allocate buffers when udmabuf is used. */
> +		bootargs = "udmabuf.size_limit_mb=256";
> +	};

Is this actually necessary?

> +
> +	fingerprint_fpc {

Node names must not contain underscores and should be generic.
fingerprint-reader {} sounds good


> +		compatible = "fpc,fpc1020";

This compatible doesn't exist in the tree.

> +		interrupt-parent = <&tlmm>;
> +		interrupts = <40 0>;

interrupts-extended = <&tlmm 40 IRQ_TYPE_PLEASEFIX>;

[...]

> +	pmic-glink {
> +		compatible = "xiaomi,sm8550-pmic-glink", "qcom,sm8550-pmic-glink", "qcom,pmic-glink";

1 per line, please

[...]

> +		secondary-i2s-dai-link {
> +			link-name = "Secondary MI2S Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai SECONDARY_MI2S_RX>;
> +			};
> +
> +			codec {

'co'dec < 'cp'u


> +				sound-dai = <&cs35l43_tll>, <&cs35l43_tlh>, <&cs35l43_trl>,
> +							<&cs35l43_bll>, <&cs35l43_blh>, <&cs35l43_brl>;

Please align (set your tab width to 8)

[...]

> +	wcd938x: audio-codec {

Nodes without a unit address should be sorted by name

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

> +		compatible = "qcom,wcd9380-codec";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;

property-n
property-names

in this order, file-wide please

[...]

> +		/* Xiaomi change for Camera Modules */

I don't think these comments are valuable.

[...]

> +&cci0_i2c1 {
> +	clock-frequency = <1000000>;
> +
> +	camera@10 {
> +		compatible = "samsung,s5kjn1";
> +		reg = <0x10>;
> +
> +		reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam2_default>, <&cam_rear_reset_default>;
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +
> +		orientation = <1>;

Please use a define from:

https://lore.kernel.org/linux-arm-msm/20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com/

> +		rotation = <0>;
> +
> +		lens-focus = <&gt9764>;
> +
> +		vddio-supply = <&vreg_l4b_1p8>;
> +		vddd-supply = <&vreg_l2m_1p08>;
> +		vdda-supply = <&vreg_l4m_2p8>;
> +
> +		port {
> +			s5kjn1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				link-frequencies = /bits/ 64 <857600000>;
> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
> +
> +	gt9764: camera-lens@c {
> +		compatible = "giantec,gt9764";

This compatible doesn't exist in the tree

[...]

> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;

Please rebase atop

https://lore.kernel.org/linux-arm-msm/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/

This is in -next already, so I'm worried you're not working on
linux-next/master.

> +	firmware-name = "qcom/sm8550/sheng/ipa_fws.mbn";
> +	status = "okay";

Please keep a \n above 'status', uniformly

[...]

> +&gpu_zap_shader {
> +	firmware-name = "qcom/sm8550/sheng/a740_zap.mbn";

Paths should contain the name of the vendor

> +};
> +
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	typec-retimer@28 {
> +		compatible = "parade,ps5169";

This compatible doesn't exist in the tree.

[...]

> +	backlight: backlight@11 {
> +		compatible = "kinetic,ktz8866a";

This compatible doesn't exist in the tree.

> +		reg = <0x11>;
> +		vin-supply = <&vph_pwr>;
> +		enable-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
> +		current-num-sinks = <5>;
> +		kinetic,current-ramp-delay-ms = <256>;
> +		kinetic,led-enable-ramp-delay-ms = <8>;
> +		kinetic,enable-lcd-bias;
> +	};
> +};
> +
> +&i2c5 {
> +	clock-frequency = <1000000>;
> +	status = "okay";
> +
> +	cs35l43_trl: cs35l43@40 {
> +		compatible = "cirrus,cs35l43";

This compatible doesn't exist in the tree.

[...]

> +&i2c9 {
> +	status = "okay";
> +
> +	nanosic_mcu@4c {
> +		compatible = "nanosic,wn8030-sheng";

This compatible doesn't exist in the tree.

[...]

> +	backlight@11 {
> +		compatible = "kinetic,ktz8866b";

This compatible doesn't exist in the tree.

[...]

> +	display_panel: panel@0 {
> +		compatible = "xiaomi,sheng-nt36532e", "novatek,nt36532e";

This compatible doesn't exist in the tree.

[...]

> +&spi4 {
> +	status = "okay";
> +
> +	touchscreen@0 {
> +		compatible = "novatek,NVT-ts-spi";

This compatible definitely doesn't exist in the tree.

[...]

> +	wcd_default: wcd-reset-n-active-state {
> +		pins = "gpio108";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;

Remove output- properties from TLMM pins. The consumer drivers will
call the appropriate GPIOD APIs

Konrad
