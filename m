Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625676;
	b=gE7sXifiacOEhjzpbPQgCM2X3oJTpX8PJ1N4j2+PNJJFPHuihoDR/XuPirUe1CbY4RXt
	 gPl2fKkOyq6a/0b7J4mDOEYmcKa44B/dcMS++/MSVim9QvXQxmRFT85ZOaMVHk5IipKg1
	 z2EWbmtd41zMQ/eJu8XIpICyG90igmL3KgiKSHEP41pXDyDrZ703TBLXK0zkJVSQGJb32
	 27OXdKiO6FTAXpdObx/ZTU5dSOcbtTvUGRct/A3bGA0uJ1AqOSSHJjL3Cvv+YFW0gRvZO
	 P/FnEOjIkyaqk+Aj2Lxl6dak3c9S7ZceGTbQTK9DOSMF3HDNWbQhNL5k9DmXdbmiZ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ntm9sON3wZbXgSR0FsNnRT0Ebj0apKXl+cIgJKKSV2Q=;
	b=xl/vMtNMPs+bMuqrLx7sJGfjsAvZssSVjpIGYrWwUR3RCMV4+7S4RphVCFYXsd1wLGT7
	 FoZyJ6nGG41g7I4oBO6MlqF9wiodwL7KEWeMVdGSbYLA4ctch1KwFUx4De3A3jKKLaeo4
	 M2diAGUXAZ7hNdRIqRwUw1Rdm4+X6Xqifu8jhxXAf4vXP/drOfi8Jfjw2EBTXY95UO4yv
	 gzi5xCBljzepSa54XjK9A5EoziX0Jp+Me8TzM4EPDTpJ4mAUkUyYsWRxg2vIHLPn/od+l
	 YRGmiU3/UmUjq723CxwwfhOw4j7l+Y7Cv1qPAVQGO6srLLJQs0vkT7Q4fGl8y0ABfOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0XwmSAP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bug1BLEg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D11A606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D11A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0XwmSAP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bug1BLEg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAJ9x3423280
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntm9sON3wZbXgSR0FsNnRT0Ebj0apKXl+cIgJKKSV2Q=; b=J0XwmSAPxt7213lS
	zEjTdYY5EPeftuAPPqXcK3rvVsgyQ2iTrxyRfuVR7SGdMEtFnbtzF+1ecPPncPG4
	US3m9DcXbJuXpvAh7qdR/iA610ZE+6I4dxIQPsLyKx74XjQc5qtjOytUE+gqanYM
	6mUdh3rHInYIeC1IC1MpSyJAySaTtJa2MxMTdLye1M5AeHyYMzb0eVIaXiFe51r0
	cc3GLNZQ5mknVtpSpKg3SfH3jKmA8nKtaLhM+tFxCQ5jqrSC1SeJQAqp20W10HN1
	uncmecfYxKC/O+6ZQFroEsORpUy+ZDOiBUv2h7/jLg17E4y1HF1uT3JnoBDgOpfu
	bkkvgg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrh02g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:21:14 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso160297e0c.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625674; x=1794230474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntm9sON3wZbXgSR0FsNnRT0Ebj0apKXl+cIgJKKSV2Q=;
        b=bug1BLEg7UIaNz7p6DbeNhk9pqG5H1h85WBCE4Exf3O7LujG9n7dZKNI/up2tHXjlh
         C0QQisdCiPnq8bCn0gqyzF1vblxtGpgUp1fksgHt0T5DXqqBqQMxQuCSDPYpXy2shjnz
         Zii/HXGDqMudtWsFVvxiN+KSVhZVYdFHNDeDExB4sjJo5pHVGUI6N9AAO/qkgRgHALMS
         hcs2pilhQ24W/bHBdTfUb2TNAGtHU3ThfRbzeYdYnfvaz4/DHJph/zJ5FW6pfNzqiDXW
         OnshkDMjL7Oikp5BauZeisRxxUIEyQxIBCfubOdZlofJk5NjVF8WZG+t/z0uBQlpQYe4
         vTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625674; x=1794230474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntm9sON3wZbXgSR0FsNnRT0Ebj0apKXl+cIgJKKSV2Q=;
        b=ke9ZKPDpyt6iZGmby5KD1FRpVCJ9NtjF5XY+3jovTvBdzABMyev7mWxwt/LSd6LqOQ
         6R/nw5V7yGC92YLJDVaajQ9rDIxcuYjVEhaVH2NpoR6cjEzaizzf+ojrXQ/UdpwVnqrv
         wVKjOuhmobfwxAxB0pmHYoO5YWoP35VuRtZ4Iym2Vgf/BgdPPiiB+gF8DaqVqgtH5WMg
         /d3JdK/sWQdd/yVPxt23sh2aW0ftXViiwpHRh9X7Q9wU0rXuUhLz87aiVQsAZnydleFS
         h65NZjGSr+lQmt5AKsUbcSmPgQD6P4qhNGp6zqutwspfGgz/Qyp0SXgXRYFAUs26jnFc
         G2rA==
X-Forwarded-Encrypted: i=1; AKwUvByjToYJTOy2ByHOAM/3gUff8SB83oAaznp9rX8iaInu6DwKXZNLOu+F45u36ysxkNHE32gFTkB6J2hq@vger.kernel.org
X-Gm-Message-State: APuU4Z8qNB+RHgGITs7RNmrMFSA7Fs967s6DEPa8KtFHx4VD7QDfOV2v
	SKwcV3ND32XoCHZBawvD3/OcO4nNDztdXFdFbaeENP6uZpNJkTOi87ESPNzoHLTAgs9iIvt6xgo
	ZHWqSTKS7MOUP16HLnBXntlRt4rbcCHO8yjfc3zvOP+XqHbYhiC6E7l6l0xFNoGe7CSED8rFA
X-Gm-Gg: AYBFou17v1tBHkhFz5BWSsLbTayVIig16FW0cVxp/RF3jAgkckb+aPsaYj1nRIRUJ22
	B0aepi4p7seYBw9Ub2aqxSBcSPXvLTy6b4FNwL8e+u/q3wvOfrNrpH4qCuVilfOXFoaKS5VIiso
	5l1wnn5SKlATY49E06ZsYNE/8Bitxf/kxQyTbZP3qx/1Z8RljcOG2Ovzh7J9hj/Z9RIt5WjAf3y
	sOQL6lgAIlQC17YEmBOiOFD4PRwBKzQX8S/KAOLjqru7u34CHCimIR9Jiygz3RYYU2XIHXggWov
	VAZbZjUnK+B0pYmFGORNVTCeyYBRWa/LNnk6Wj8VH1idposRybYBrlyi+S3xDxTEKFXTFFXNjpj
	SA9bds0quzIF5mx0pzMRnF9VnsCJVf3GuUKKPGkDFwcL5iTX1IICVbrgv+b5pbVLWv7GtWkI=
X-Received: by 2002:a05:6102:a145:b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d07255e419mr2961279137.2.1793625673551;
        Mon, 02 Nov 2026 05:21:13 -0800 (PST)
X-Received: by 2002:a05:6102:a145:b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d07255e419mr2961256137.2.1793625673072;
        Mon, 02 Nov 2026 05:21:13 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcbb0sm3395230a12.19.2026.11.02.05.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:21:11 -0800 (PST)
Message-ID: <20c50258-a5cc-433c-836e-92ed8ec1ce7d@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:21:08 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/5] arm64: dts: qcom: nord-ride-embedded: Add
 sound support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021073633.2163128-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae88e4a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Us665vxpbSFhsO2t51IA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: LouVOx_cgk8ynxdpb8_K-VgqfVtG2q1q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXwtn9aRQDDuZ4
 4YiZGk74oBHgwzvEFGe3qazpEprHVOYqRWXD/bYHaH0SfH/ssSJCh5QHxGqvGBMuxUowngfBNbX
 bd0rT5BNwMoJbB/MgvexZDsaoiIDMpk=
X-Proofpoint-ORIG-GUID: LouVOx_cgk8ynxdpb8_K-VgqfVtG2q1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXztT6H1O8ZvZb
 xDO5pTylpbeFkK1tiru0cEGKMsVtbGaPqzjC4QXDMJW0O0gbqB3GYdmKIBCXKBBdMcebHPLHWOt
 kZZUfgTaN1Jzw+jcPZYsQqGWANAM9oVt5IfdFCKLXFTCTj6y0pUdTCnmMuU3oZR0a++r3KTSijC
 6v47lE6m0VDXCOTjkE0Yqso9JQEnm/ZW4qBMLDsjcfee8IKsN/GDzTUlCU6afOoRCb3TYAmYf2F
 q157fTZS7vzgY+Y+18Mv+MsLOllZOgB1iSDellBb8muTa/hpodZI0dtamZM532yL79NCAXMQGn+
 qymf4/wucKD8nnKMk6KKfOe3sUoSVKMolvlLCbSydqz7TITmDHvYSSQW6eTNim0dOJtjLr1GF8L
 MQexIjHGaPZa4xaRqSEm3U6PPL4wj5Ya9It/Ds/k8mybK0UqMCLNye0n7fTt3hB8EJUOKUeWl1v
 wv228QY2MPBv7X8D9GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020053

On 10/21/26 9:36 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Enable audio on the nord-ride-embedded board. Add a soundcard node using
> the qcom,nord-sndcard compatible.
> 
> Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
> clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
> expander on the same bus.
> 
> Describe DAC_ENABLE as the enable of two regulator-fixed supplies
> (3.3V and 5V load switches) feeding the PCM1681, and the three MAX9892
> click-and-pop suppressors as one simple-audio-amplifier on
> CLICK_POP_MUTE_N, routed after VOUT1..6, so DAPM controls the mute.

[...]

> +	expander0: gpio@20 {
> +		compatible = "ti,tca6408";
> +		reg = <0x20>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupts-extended = <&pmau0102_l_gpios 6 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pmau0102_l_gpios 5 GPIO_ACTIVE_LOW>;
> +		vcc-supply =<&vreg_per_3p3>;

nit, missing space after assignment

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
