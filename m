Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE00639A7F4
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120840; cv=none; b=GJ46Z/18tz+kccoAMR3L2D/bwGpkJNNubWdkjQ3tfg9tWgvvNKZze3KqlkeuMpHLtWIndUenxh4DGroW4udtjTJgXC07Cqcvq78mrNOY/9V+zZJ4k4ExRJYdUC1UdNgFG9gVkhI1Sc9FQfGl8P94PebmKyPNYEwm0GN0iBPJNro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120840; c=relaxed/simple;
	bh=0iGkx5cwZg7ESD/ve9ZgPq335l/pOYBudqpoC72Vk8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoZII2vHCqxggakYZTYDoVcpeCx39AQ9hEC97VvAuckRxXA+ml2bnlTBvKXWuymJR1zu+lST2bY+/6xv5yv5Z1AWq2IysnVZh5K4qSc9fvvSU/+wxbTjpCFPwSMij+P4jVCgjW4q5RsNuDf7EjBsrnjbV8nnybz6rCtYXVwQf2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtUjeRPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bn8wHpyM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtUjeRPR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bn8wHpyM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59QPx3800850
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bYutGgsfO2AN1trsSrxGaYnXS03MJi3F08rSkRm1PWk=; b=OtUjeRPR8VNetq7W
	YmycshRN3TdLLy+vKtg7/eoRbgn7FzhbshagB8geZRZcwCHeGoKa2iWqDv0BKl7c
	31EdLyTCjMnks4xCf6Y65Z03aN8Oqp6uXOGbdzVJYsN7gNbuH2+i5cLF/+zsF4cl
	7XJw7I2dbS0hIz7poR7KxABLtWO1dEWW+qsFi+F3qsxmoMkXPEcZ0LTBxnwCv/Iv
	A5haOm/a9I6hoqgxTithxBSWknn5Mm6pwIG+dM7FRmzvET5+f5HD940vuwbzi/51
	hCZGzqet65hekVjYVlZ1QLHu12gT/6Le9WXMWFmTjCk2lRoHPTOfY82SF80vgEVz
	lNB0wQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k5prj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:33:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dd70b510a3so9415686d6.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782120837; x=1782725637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bYutGgsfO2AN1trsSrxGaYnXS03MJi3F08rSkRm1PWk=;
        b=bn8wHpyM7ZZeNIKOqMCh5h2vIQnMayGmcPTyCCv02QtCoc6HZdwLyp5QdrJPQK3ueY
         PweteTzRHUYNBIOZzdyAcMv4jL7FoQ1H/iCFeqlPe1b4FJXYnuRlI+HuDH/526iHdlJM
         clxsn2VORGM4QKEyr8D/FDDZbL4R5QjJzoMGfzdG377VPMfPiEBZzfuJTs33lpYv6wul
         hVed696laXm1vlbAt0ne7fqrBQwTP/cairBCpKMXJCF58GsHcIPpetZXAfozsWidH9FW
         o1HZSbf7ENRNlXW/s5NsfHALpppGP0PkCdw2OtR6UBlJhctnOW0610xFfq8FfkgnQaY+
         eRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782120837; x=1782725637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYutGgsfO2AN1trsSrxGaYnXS03MJi3F08rSkRm1PWk=;
        b=G+66XdX5JLhaQ6DRH2tJrJ2bhTdOSPL1njNOor9ollNlTfjg9GANvhhEAspXcSBJ/C
         ZDtiT/r28Ap5Kq7oIwa/aPAX+PhuKcIje2Br5W4W7X1b/XHAECnxFOtVeGo6rPJJG7X0
         UH6rKq+dr/fHVYUSEmIFrhJw3jFt0Xfg6ggXBOeEX8pI5QCT/oLYlLN/1yc5r3N/sXkU
         vF0G724pFWaAydBNcZI+qdu/T9aetZDI6GLWFN8ieGzwgWfieyXJLBWTwQ64TzqxD7lF
         Pe4w7l39DrKGXhbyM8wgkLKIfuGcYMVk5kc8sHP01asv7uEONDzZ4BYhaVo5w/qOCi7U
         GZTw==
X-Forwarded-Encrypted: i=1; AFNElJ/hqaDFD6wSUZlPN0mQCzKK3NGqG/maXbLXMG5ES6V9wimsBxOtSHc+XnMme5koftBD80OUNrwSfOZb@vger.kernel.org
X-Gm-Message-State: AOJu0YzLWuqFzv04VwWcTZdYEPt8xj11Cmd1lZcrmzcrovInEeaz018p
	bASwHhLUHxeW8dBJXn35V+HOGypc514hSQ/whhnAtRLZ2hURdwwTIFThYTi4jAFS+Fd/sDmiVuv
	tVT6t5ddH0DzHWWI5NQpKU7jC2xSE7ngXtu/QtYQYbJCi/f13nMEJzXaXuVH0AGAi
X-Gm-Gg: AfdE7ckDCuG05RAKL5c7E/KofDSeLrivrByBbWfWn8gI5HlB6A2quye03vDWW5ODjnd
	YlMKPpr/dMCRIt0CsMROnctL0eHypzGvUrbaxhIrSBuD82EHoSooF2lgCXsD2KHUYDCSmNTyfh2
	j+Yskkj64t3hs8erQDanyRIYzY/PYzdnE95oLVc1NG7i3CUc9h+7kRUsLLmyY+XYAGV4fUeTQuT
	frgntsP574qHiQc/lZE69/Y+2okrLSJ5i7s5QeVfMDtD+gDQPrFOJv69Gtx6M010gPOcyXBa0aM
	T64OfqJ8lJ1iKIMImvQVrhwAKwiziR7WuNM7WMj5Jm8luonVT11eLliV7i295Xb2Wcy/OCvdM47
	hW55NDCZkVmaXS3KdsatiyfnkCiNTNsaA6DY=
X-Received: by 2002:a05:620a:27d5:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9208d5f227fmr1213620685a.7.1782120837083;
        Mon, 22 Jun 2026 02:33:57 -0700 (PDT)
X-Received: by 2002:a05:620a:27d5:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9208d5f227fmr1213618385a.7.1782120836583;
        Mon, 22 Jun 2026 02:33:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e48ddsm333515466b.50.2026.06.22.02.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:33:55 -0700 (PDT)
Message-ID: <32948426-7148-424e-91be-0a313aa8e0d3@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 11:33:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
 <20260620-glymur-send-v1-2-fc4a2cfd107c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260620-glymur-send-v1-2-fc4a2cfd107c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JyITAPoUSzQCAzGsnnm0rnxel2DuI9nt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5NCBTYWx0ZWRfX3dTGJFl9a68C
 0CXsTd4xZl27rjfr8j0G8ZskEfE1VwU+LKJl8aTN4zLTfK/CvNQLGGt1+VX3cDaxbqVclYFKTEN
 rSrCtgkI6nlL+DxPRKH3maYBsUPiVJM=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a390186 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=cH6R9-kdAAAA:8 a=2HuRI5RJ3cZe6tb9nYkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5NCBTYWx0ZWRfX1QYOE6S9E+6E
 ziNkQ+EjQD3K4FjQe/KU27EFz4K8j7JjDNwFg7JsmgjDwlWJnjbuFurdmydxyFjCAgy+Esvfap1
 cScrP0qY3m6roLtgoZYcaB0FqnmVTLxqFXLdbOog1pfjovmVlNcO/D5oQOKkG6XcMo+RnPT7BfP
 mClgssMdHkGkETDdsziLwoSfpSAS/puyyLkqTdU17FHf8BzcGEMCUzFf+h/f14gdWNmyFdwQ/u8
 V0pmCHW/Wuo3XIOk9jRTxHzI1R1fUa5s6xekHy7DwnK20cg8VVUQBadqPuAyDbk5304jl1sT8qL
 +2MpYcdqvt0wybou0j61KISz1aTXs8IRNYfPxoBiocnH+janLLcECJTakWs1n5kcrtbOfyOsugN
 b26wDPZU8/bPueI5xbGXoulXT/t9l8gI98UK2ZrgeDc7KHGcLYTNS8bT5jCPTyROu5rMLm0nRR7
 jtQQrSaKa7Kht98V0YQ==
X-Proofpoint-ORIG-GUID: JyITAPoUSzQCAzGsnnm0rnxel2DuI9nt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220094

On 6/21/26 6:50 AM, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> 
>   - internal eDP panel (samsung,atna33xc20)
>   - 2x USB Type-C with DisplayPort alt-mode and USB
>   - chassis HDMI output
>   - chassis USB-A host port (usb_mp multiport controller)
>   - internal eUSB2 host with the Elan fingerprint reader
>   - NVMe SSD on PCIe5
>   - Wi-Fi and Bluetooth
>   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>   - audio playback and capture

[...]

> +		/* Left side display-adjacent port */
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_0_qmpphy_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		/* Left side user-adjacent port */

"left/right side port?"

https://support.hp.com/pl-pl/document/ish_14499364-14499440-16

[...]

> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pmh0101-rpmh-regulators";
> +		qcom,pmic-id = "B_E0";
> +
> +		vreg_l1b_e0_1p8: ldo1 {

I find these voltage suffixes not very useful (although you're free to
keep them if you prefer)

[...]

> +&i2c0 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	keyboard@3a {
> +		compatible = "hid-over-i2c";
> +		reg = <0x3a>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&kybd_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +
> +	touchpad@2c {
> +		compatible = "hid-over-i2c";
> +		reg = <0x2c>;

Let's sort these nodes by address (i.e. touchpad@2c < keyboard@3a)

Konrad
