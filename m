Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781397;
	b=DZ19OzNbD3b3Udqm/jIL9P5ulIbLjoSbpReVyQyZmjws3umrbapBl07nC6FFQlcz7ocm
	 UFYWX3E9TNl7xC8X8VeYxYtGyEaLeDInCOu+GB+05tG962r94MIWiWY1WxR36JUS5CR1F
	 yadIhKEurL5yxrOQ/dmqIGNbC97U1ud2zZKOhjPVBk9DY14CBC68G3x/ddpE9eSdUww8Z
	 BVFWF2EYeu6p8iGjd+N2GRP3MuRiiMWCeuywAehWfK8Dg0sKwkNsTd6Iq8aeSGXAwLWAT
	 mJN5Okt8+GunZmfNzyRzdt0mTIiBPM4RrTZfrw27K/goS4V7IiWLSdnNhHgF1gKR5fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PQ4LinK6QHDjKioOmPQ+jXCD4vkH5b3yBrfQAIAIVJg=;
	b=gM2c+r5WUTftVBVTctiIarnofKSUp8dTpj858q1/IT4rLKAx6oi//7RLf0D69WAQKkfH
	 h69lRq+M8jZOx/CSCBPoYEJPH2dPme+j9ESmLFi7ZM9b68szVHnHp8c4EJL4VMAvZJUh9
	 uOgShcjYTUD8f7itNwZVMEcJCT6zwllA5aCU4tvGCw+4urinS1cxZnbeErVUIcZWrQ0VE
	 9zJF1oqJH6lYAybrirst8Y9ILoMhyhsSeRx5vlsVd86kRij3+ZrKu4mvj6KZGOlztflWf
	 k+p6pA0TuMSVl9K0Z6KLcBoItQAhiPM5Gc5gTYr6mo8svIGsdZoyHTofkUMAfspxfrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbhK8BM8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1yVSKWu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3941606A329
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3941606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbhK8BM8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1yVSKWu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KiEi175444
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 08:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PQ4LinK6QHDjKioOmPQ+jXCD4vkH5b3yBrfQAIAIVJg=; b=gbhK8BM8tMhhuj7k
	+5bSBMqQ3ZjaVWUje2lOUX0TsYEi9w/9QqWznoKL3Xkn3WkmMHiERtpA5mZUTvF1
	d2qksPWt6NNW9wQgQp5W59THeO9ULGUn7pZhP6+2CsX1GmpwMj52S3EhotynXLYp
	u6lDjkHiqcTW8Ha4RdJGaUi2rMQZVSGrEMUwbagcleLdiRwxS4TUuMigzje0cnc2
	ZgZAGt8G/Sg+e8TiDYMwGq3kBpLjW91MUFmi1dMdbeTAXNsCYcp6VztA3Q3icOyp
	6EALMXfDWHbzk/pLTYEtQrk/BILC+3GnlcqKLjFZ65FFeeHJsCqBW6cPmSePVun2
	K2UQhA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbu2db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:36:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5476f5bd009so1389261cf.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781395; x=1794386195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQ4LinK6QHDjKioOmPQ+jXCD4vkH5b3yBrfQAIAIVJg=;
        b=P1yVSKWuHPn0I9HTe/wdzcKBD8CUwMCUAl57+2hUBxkFfMK6x76WWAh8AcrEmuusDM
         l7ER5iOb56Cb1mWOLllxFuAermXM70+FaCC3D8P06W9hS72yn+pkpqaJB8es+XXUa/kj
         qN1oLxM0zCd3ktcFjGVPZQQJisR04C9GVPaBKd+G/v3xjH36SHsiSScKQAkQMTh+LkWy
         MI5TDnut3RTn/n0lMa0brE0d2sPgKkHeE2AC85v0b2Eg72M0W37rZkTRlpO4UttTZqEy
         koqx7mXgdOXqVylKeipBKchZwCfIp9lDoLUuU17ZYu/Tv7L4CyZmselQ7fDvS2YMdU0+
         up4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781395; x=1794386195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQ4LinK6QHDjKioOmPQ+jXCD4vkH5b3yBrfQAIAIVJg=;
        b=n2C9AiBexjACzjZHlP+058NKQMiv0/SWOr5qmmYDYQQlXtxjwTlQLbvZmIfphANP5X
         cCNc4eeIBcoo/16MgYrHC3QIRrXbMjjjjHMl5motNAYUfS0Ju/4Ww36yt5qTMECq752z
         yLgIlJEdiw4/fZfe//DHOhqj8/7TWCW5F1yR2j7LI27EaOdXPeQnReRAe3lKpM+ayINg
         vm7IqG0jL/kiGN089hId+tLSrhsmiQ9zI++6e2cvrede8F+wcgDBZFULbGodE4GI8Qmy
         6MD7oJJhUaYOf3wEyYbG1KSX16tHFXhUMEY+50DCMwr710A7g2eBv459NjsxMU4ts/rQ
         yHEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfYv4+nO3z1GRUKf3PG79ddZPC82Ns9pRQldpEcXxMPLBFIKgw9JfPd/EkiplncKo4mAtAjuG6wgzu@vger.kernel.org
X-Gm-Message-State: APuU4Z/vPmEtBZBxOQt6sMT63Br8ZfSuHhSLo4uw+DWxnsvOwgDTWHEi
	611LCpk1HEr2Jz07lZbqbVojRlHxNnEWwJ+T46/ZALyQ6fHXoESGvUr2F+ck2D9BIKCBCt9oB/q
	EvkqdGheY3AJFpO+Nokzf/kHLK4K40+SIGZE6zK9f7hzN16Jf/Xy7UOYnJGrLvxfrN/jwy/fJ
X-Gm-Gg: AYBFou2vo2aapl05n2chkY8El+uhbnBVp0vWAYN2oXLmckYsaujksvwOVwxK+bZst5j
	2U85A51uBZsouC3LQdgIJVSRLGwzfDEes/6v9LMxvR0m3lZja16p52RPtdgVJXQNHcZkWxpTdXN
	sYt/fWb9KyVJY6JhnoadaH6oebot3TYQ/st4lIdxZOtIuK/bBn1wzmF6l/6Oc1q8Nw0+GpwxgVt
	swOv6TUVbfowj4bEDlRETNYB3SYyvX2KpqFrCfVSLZzW1N6FGPyxe07r2T9z0stOo9tlk0USDNg
	ZTzsjeMzO8Jj6eoDR+IUYiZPBywaXKMx6suIDPbMhailEtEjfICeofwvdiYumqDpCm5OUXuVEXT
	EZawWeuRpd4d8/IaoVqnKNx194VJkX3XcoSU3SyhSfbTqxIpCCJwCHMbVBoGBFe4bKWth
X-Received: by 2002:a05:620a:2319:20b0:945:c5b3:6356 with SMTP id af79cd13be357-945c5b36c93mr785272385a.2.1793781395171;
        Wed, 04 Nov 2026 00:36:35 -0800 (PST)
X-Received: by 2002:a05:620a:2319:20b0:945:c5b3:6356 with SMTP id af79cd13be357-945c5b36c93mr785269385a.2.1793781394523;
        Wed, 04 Nov 2026 00:36:34 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e424c34sm46273066b.13.2026.11.04.00.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:36:33 -0800 (PST)
Message-ID: <ea308aa2-8a2d-468a-ae5d-ec9a8ccdb2d2@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:36:31 +0100
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
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sc8180x: Add Microsoft Surface Pro
 X
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede
 <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20261104070441.74127-1-val@packett.cool>
 <20261104070441.74127-3-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104070441.74127-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OLqQr8HkRL9ukeM_n6vtexHc4jTcHxXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX8h9hFQ5QIxpP
 +derVVoE8xTvonHiO9GZsZx2+7YBpdgUfx+9TMyFWI3eyiQUwWh01I1pIGWtKh5LZWcWrZYKOOm
 /N5hlswHRZocJhL8YdHIDi3uL5ThmAJw53z9oeUwfV+7d67Y/wwxZz2To7tLVhGTv/7VsMfQE1w
 upuf7kZ80wj4UYTtCkVKyLsQ0hH0NSbJn5V5UYFiR1ZPznVhuXWMP6n9KItjwJWzstdX0JcpZMF
 ANPX5marAmmBJs5TCFdVhid00EpPSd3y/+X3251A1rYsqyFz2Q/4plSPkMIVJsPn8R30suFnUr3
 t1aCshO0CObeJkDaKlozpwo9ODlGx3DNsIf1oInmmxUQYSIADPYIB7z0e6Tum3KE2sR1HzJBlJA
 tCm5+uYZUqxY5H7wCA62blyG3zlVwokUa0/hMoQ4E+vhrO3Vp5E0JRjsGhiHe0yUyMfWo0cXgIg
 6oouwngZtw/hxN2msvA==
X-Proofpoint-ORIG-GUID: OLqQr8HkRL9ukeM_n6vtexHc4jTcHxXo
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeaee94 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=S4lLRux2dGMH_Q5bArEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX/kKBE88sVksI
 0onmuQPzc7A2yjvCrj1OS44+9fNQvbIrq4aHl/jkijRhceFtAw6lJj9a+udcs7qlfOfVu6Gt42j
 otQMlISZQRvujdTAz+TLt0Hi+aKfwCQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040034

On 11/4/26 8:04 AM, Val Packett wrote:
> From: Maximilian Luz <luzmaximilian@gmail.com>
> 
> Introduce a device tree for the Surface Pro X tablet in all 3 variants
> (SQ1 with cellular, SQ1 Wi-Fi only, SQ2 with cellular).
> 
> Currently working:
> 
> * Display, backlight (eDP panel)
> * USB 2.0
> * Wi-Fi and Bluetooth (WCN3998)
> * NVMe on PCIe2
> * Embedded controller (Surface SAM over UART)
> * All remoteprocs (ADSP, CDSP, MPSS, SLPI)
> * Volume and power buttons

[...]

This needs some sorting etc., but let's tackle the bigger prob first


> +&mdss_edp {
> +	pinctrl-0 = <&edp_hpd_active>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible = "edp-panel";
> +			enable-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
> +			no-hpd;

Is there really no HPD? The pinctrl above suggests otherwise

[...]

> +&pcie2 {
> +	// XXX: pcie1 and pcie2 are multi'd together, for now use just one
> +	num-lanes = <2>;

We should be using the new phy-qcom-qmp-pcie-multiphy.c driver I think,
I'll try chasing down the right magic values

> +
> +	pinctrl-0 = <&pcie1_default_state>;
> +	pinctrl-names = "default";
> +
> +	// HACK: Remove "global" interrupt

Why?

Konrad
