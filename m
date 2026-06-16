Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63806332EC8
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613442; cv=none; b=C37JytYy+4xFa3QKDJHAk1hblFBQ1H3Oae/LEC1YRyeMvJW4LmyrLe9WAbShmlNr8zstuNehs12BUiqrxF2iR7vgay9zBwNu/gOJZZveYAs/SqxeZnrboMMZA3xbMkZUjUGPKALkZ5z8ICMtXPrnVOycnIkdSh8bDFuC8WOjChU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613442; c=relaxed/simple;
	bh=ZUKAmdu7SA4Z/fH5vfjt1yDsTtcQZWO2kRL/RQErU/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Is/g8KHQnN6rThM5TdY7KwGnoaAjlkSg/m2TyAwoL7lSqRLUS7vw7xIOhziHawQvN0+tNHjDXsfofDn/oy9mBHoASqL69o9AzI6EN8+FRRR+CIzOTq8vF0f0wPQYONG+auHBLLEkhMguHAomBBzCNeYXmrk4aO3yD0wGDfZxCjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evrZHDgq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+RMMMGD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evrZHDgq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+RMMMGD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC4mL3257104
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXzotvMtmJL96WvoN/75Xemtw+q8uV6JsSIbWf0ZLqU=; b=evrZHDgqMBI20KDj
	GuceyVt3+aJoiNhuAIJWMvF7LqTHO5u9dHDFpvkH2GtoMJq1EusVElJ+YcFTAXFI
	rrPrVG8fvbL1m/4GVQi+kMihOU0s5wt5QIGwO0vivpjag5WmgKt81pLeLMhSzvLa
	XeSsZoEQnxCNz383My3B8gFt3JDcuIBp1lB3YejtOp6SwQIt8zst3zyRZif5IKAp
	oaG/u4Gc1dR29Y7FHUeKG4lF2KyC2rycIFfI8247bTAKdBhBnCJtL4abRE1jo7mT
	pSoyd/tzNBY8Y461wVRkUEOCzwD01kt8qDqt5zXMK/pOzRlIE5Cq6QjCxtNhmKoV
	+scqrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9r5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:37:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-917fd2bafdbso75207285a.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781613437; x=1782218237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VXzotvMtmJL96WvoN/75Xemtw+q8uV6JsSIbWf0ZLqU=;
        b=L+RMMMGDAHEJ3BTfH9g4dfwPUcxAeKlxj61CioIQXK8JSQ71zOniEdJOnartGWb6SY
         eu0QVz/QNVSkMmdXUlaMpGkFtbzfdwshakrt1YAvSAl6OZfP+WjTRkJsheLMlQLMYmER
         BZyc91L5h4vnqiJEKeEqv8zgoSllnQOM7Y4ifkB1RJJU6yJgzc/cbbCqSMf/IhRvTYBm
         H7xrf5wiTacmUFHl7IupOuFE8dTSyIwvJCTfq7b6QIZV2yIkUFTN77LXGDcSxDOoZB+H
         T+gBkxdO41uN9vYjDYBzDY5+R9HsBIzEXIGyVPDIY80ZK/rCCGKe59iNUtWWJkODqQYi
         5VcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613437; x=1782218237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXzotvMtmJL96WvoN/75Xemtw+q8uV6JsSIbWf0ZLqU=;
        b=TGr2sirX1a9QcT3A0iE30p1qZdZ53BBvoENQvX5qAT5nu5P5L7fzQLe6IFRxXwmQfL
         vi91d/TDnRBiKsVjJV+YHosfClL9SsOBu8A28G23g1PSMkJMxE2tbfq8QhU4C4OdI0ap
         ZieVmRtRHKQNV3aG/dDsyxR6FpBpzkJZWRdoyo4OV9wLuxZOw/ymxAXpv2pXgDndOOBS
         Ob+ekHOpIZrQEQDtVXhaoQtlHl+9bZwojz+VBwAS5zPn1BJG77l/Ulj0KNTlqufv5HJm
         OSQ81VrLtWeesXqsFXZs+mDyPFzYnzCPDCi/ov6MCvs1edIlp3B09L32s1aYs75rCdxp
         iHWA==
X-Forwarded-Encrypted: i=1; AFNElJ8Io+vtSdwdui2FYmvNeT+uKKrNIjDqW+l8tv3H0KYj/X4+NNFwzaNqigor2zIktrrlOjX4RCzqx72c@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhx5lW0ZfThlBkdy0yWNXsHZurohRVt7UZifxXJojPCdGErXAg
	jeGzfE9Y5NvnbvDqGw/CkxX6fSY6HnwcARmhO9Gwba7PmDY5AX//C0X0o6ET4lurX+Zq4M54mN1
	B3crvo9Ty4yCW8XnmQ2ORgmiRxwtwAJ8/2HfnRC7bjNdP2HWZdKbCsUtvbr36dCyK
X-Gm-Gg: Acq92OFWjKT5gZwsQnSKQrBzi4wP+jRSMbAASHVoiLGfVUpsqWw8AZS7OZr8+0aXQnK
	JfKvatVySvVbki+Jzft7z2hoNyjlWg9k7KeIahxrNa7xe0MgPUSEP42a06MU6MhIV85i22hagkw
	4TFXtn86KCMN94+JEf1x1Z6YMtbyFoKrUMGzTCPal+uCidukM/B/PlrgAYT5CvVAcHhgOyy54kx
	auG+/pRjQQw60Vcaiadc4DjFNRgwT+25rHvvqyDlySCfn5sxi+rF9/DClYuedjFPCdWOPQXEiYl
	EemRiI6KDuHrhWJ0SQP1MjPWnS+Or2u8W8pg9ZUbTQ0LxBnjxm0qoCObWSMndqsFdr3tCzs6vFU
	InLB9lrTdHgBl8jZGJx6/tvL5IZLT3LwX3pM9KeFLz/bLSA==
X-Received: by 2002:a05:620a:280c:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9161bd2835fmr1772200685a.7.1781613437554;
        Tue, 16 Jun 2026 05:37:17 -0700 (PDT)
X-Received: by 2002:a05:620a:280c:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9161bd2835fmr1772197085a.7.1781613437120;
        Tue, 16 Jun 2026 05:37:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6de98sm642143266b.30.2026.06.16.05.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:37:16 -0700 (PDT)
Message-ID: <593b7024-e986-484d-8837-17f08990575e@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:37:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
To: Konstantin Shabanov <mail@etehtsea.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515172926.16597-1-mail@etehtsea.me>
 <20260515172926.16597-4-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515172926.16597-4-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyOCBTYWx0ZWRfXxglgGMJ7bMY8
 /Ql70J/Zbl3vx3nuaOhm0+j64c9y7hlmuSwqkO9Ra/ttsRBpgIqgGos1JNcjRH0B4z7pAzIQVFe
 jOEruG8VpUmUDwq3V2khw3/xWfTz5j4=
X-Proofpoint-GUID: gsa1gOXPWcz-C3MpMh3eru8WdL4Yub_Y
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a31437e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=4SG1UvOAAAAA:20 a=NEAV23lmAAAA:8 a=UwPxW2lQh7-G_fGdwzUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: gsa1gOXPWcz-C3MpMh3eru8WdL4Yub_Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyOCBTYWx0ZWRfX3VSWaHXCLCm0
 US67e89KZkZGFkQ3etW143q7zVifQLQZbuPTr9/l/HYNRYHai9D9AiJzYew5Uq5UUPVVLEn+ErV
 faeOLiMSlRmI3DqTx7+bpsWtED5AdBVxLc8rKW9o60YTLHMOSE4H3aytsh1nr9wMt3gpVMKbROd
 B1RDw4keOt1atwa/prCrHl0pU9FgLvlginjrzjPcdhOSWHbA99Om4c8iBE+qkzP8bWC7t+XZOYJ
 6TnoWvEzXPSjFRqW+V6lAVdCVKyA/AHSjuZw/pzID5tHtMrKtOLON8jtf/YNstVr51YhC2vryWp
 qPeV+f9Hw58xYANC75FAHCRkGyxx6H1EQLi0JqJ3vQiMTPpw9lAfeRcvM249EUqAjPLKsLQUoEd
 UW79xcEG8laaq2dotdMrdVlQO8TpIiHhRpEdASePy2l8fjMzIU7YJ9jP6FkF4lvaLOED84AUL/g
 /zB1XOVXuSc5G6Jvrww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160128

On 5/15/26 7:29 PM, Konstantin Shabanov wrote:
> Introduce support for the HONOR MagicBook Art 14 laptop.
> This version is based on the initial work by Kirill A. Korinsky [1]
> and Valentin Manea [2].
> 
> Supported:
> 
> - Sound (with alsa-ucm-conf config [3])
>   - Speakers
>   - Headphone jack
> - Bluetooth
> - Battery
> - HDMI
> - Touchpad
> - Keyboard (with backlight)
> - Touchscreen
> - WiFi
> - USB-C ports
> - USB-A port
> - UFS
> - H/W accel
> - DP over USB-C
> 
> Untested:
> 
> - Camera
> - Fingerprint reader
> - Sleep/Suspend
> 
> Broken:
> 
> - eDP
> 
> [1]: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
> [2]: https://github.com/vamanea/linux-magicbook/blob/x1e80100-magicbook-6.19/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
> [3]: https://github.com/alsa-project/alsa-ucm-conf/pull/755
> 
> Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
> ---

[...]

> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-CRD";

This should point to the actual name of the board, then you can make a
""symlink"" in ALSA UCM (there's a file that binds compatible soundcards
in there)

[...]

> +		wcd-playback-dai-link {
> +			link-name = "WCD Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
> +			};

'co'dec < 'cp'u

[...]

> +	vreg_misc_3p3: regulator-misc-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_MISC_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pm8550ve_8_gpios 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&misc_3p3_reg_en>;

property-n
property-names

in this order, please

[...]

> +&iris {
> +	status = "okay";
> +	firmware-name = "qcom/x1e80100/HONOR/MRO-XXX/qcvss8380.mbn";

status should be the last property, and it would be neat to keep a \n before it

[...]

> +&mdss_dp0_out {
> +	data-lanes = <0 1>;

If you change this to <0 1 2 3>, you should get 4-lane DP working

[...]

> +	eusb5_reset_n: eusb5-reset-n-state {
> +		pins = "gpio7";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	eusb6_reset_n: eusb6-reset-n-state {
> +		pins = "gpio184";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};

drop the output-foo properties from these two, they are controlled
by the driver

[...]


> +	wcd_default: wcd-reset-n-active-state {
> +		pins = "gpio191";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;

ditto

[...]

> +/* usb1 covers left side typec ports */
> +/* back (towards the display) typec port */

This is already described in a comment near pmic-glink {}

[...]

> +/* MP0 goes to the USB-A port(USB3) and FPC */

"MP0" refers to the first USB3+USB2 port on the multiport controller.
Is there a hub inbetween? Should we describe it? Do we know if VBUS on
the USB-A port is controllable?

[...]

> +&usb_2_hsphy {

"usb_2" < "usb_mp"
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +	phys = <&eusb5_repeater>;
> +	status = "okay";

Let's keep an \n before status

Konrad
