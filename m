Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219718;
	b=zRSZJ61s8JyeBwPnNa5FDr9mW67IZXc8fLbqoYTVHoItfiUZGPPwxricZVlTOTHcK6xj
	 P2XIzgHvVMKlpvc/cQpoDokbrntNHzlLK5EDoh7AIQkqVajKJd0TI7msIFahxNa1BirLS
	 fRohEHlJ/ItV6Lw+bN9s2WXC685XX6AewrflnTJ2khdOgKM3OUDD0p5c1W6ZQWuP7QRWX
	 8eaL9J9JhyNF9R4LToqXVW29eIuHBhcQwY4uxoFo+vcTy0jH65E5oG5MCzi5JZSr7lH55
	 Po/UiFeCA6SZId4KNZ9m31PAm1z4l3vQz+DjIrDttCl51Y7U2Wiae+h5+sR7cbK/43Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219718;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tXrXtlQCSd9l27dDZzkaCBWWQ7huOf1nA2Nv9XiEhbk=;
	b=EkIQHekiwsmbEvDZN1OgK1DzC0C11dM0dvae0Lp7MY6Xs2E1SaM/WKc6DUUZRdQ5OeXm
	 PNnJOGGgyfKcbn3PqQwe4M2Sy8F1gxIaGKQFYUoRpl3Wm6bp4e7GP/DY2nJIKv1T8KuJ5
	 4js0JsqaS/xbRNuoxl7MGfdWIUDJlXW5IweZneNQeaOm/+5jBkxRKoEBpgZXWgoykCFE7
	 KCb1hG4D9da7rdHnKH4iEEDgtfwoVA4iR4AFwh0Ydih3IgEk3pnF8JnStfSS973+30IE3
	 KAP5Z07jU1AiTJCiF4e3esi2o7ayp93xZ8Ky5L5kI0TZTLs+aaQQBSeqRRgLR485/gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J7IVnPk+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dchNHW3Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E801606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 10:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E801606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J7IVnPk+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dchNHW3Q
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v0eV3164520
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 10:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXrXtlQCSd9l27dDZzkaCBWWQ7huOf1nA2Nv9XiEhbk=; b=J7IVnPk+ZvttqHVE
	1ShK7YYJXJ5T5DuVWct3V7U7ie1ys0Q01RRPpg/qyngr3THIHLdIsRKOfZ6094/e
	wbIUQuAq+ngCYPNKPCwpVeLoOQ+3a+KfBz9jm/+ZtcMfvee3F/V0qw3Ka2DbmZUf
	m510ibhRFGJXouWOiV50oeOlmcVWZw+ItA9bE3FcOI5zjO1Yyy9w/ANXkTa936W1
	3QkCleFz3WEZUYNwsE/mneX8ukpn6GuKvu/xDpaYt7HA+vZeZ8mWUugQew/0iuiN
	NpBOJaXoVmQjwA9vX3dXtByuaCvmhNr8gkgBLFmLoa3v/WQLtx94O5+hrSolrOI7
	hKCxYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99nnnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 10:21:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9460411fce4so11802885a.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 02:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794219716; x=1794824516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXrXtlQCSd9l27dDZzkaCBWWQ7huOf1nA2Nv9XiEhbk=;
        b=dchNHW3QKdrtsCKkTL+vy9l7Z46Z1Z5g+dxGSmq915YXYRh/qWqWIwDEXxN1eifDc+
         MTO1LoFMGx8oh8KsVnTYyz8E+XtKjeK0TtKpO1yrFNOABgKgADHDsRARNidpp0XdV1+F
         ++ShccSO8D510vjL+v5OpBmNlk52xqvAWTpPhR/o2fdtPYeVLXHc+7bf/inydymzfcP5
         dcuxc6AcosA4e+zrjR1hzW3kjGH9/OEWlwZW7MhZTAkjYHXmufWvAITSTFPA9XSvFIkn
         MRCgQ4MNUU+9Hiy6XU3HmMy+mQVljibyqxuEW/QNcWLUvAJz9ib7xPfQc+utK36amSN3
         ZoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219716; x=1794824516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXrXtlQCSd9l27dDZzkaCBWWQ7huOf1nA2Nv9XiEhbk=;
        b=RQrmpuNDMkjal0glk9xtnEqpwhM+DSMBqD7F24XpICwiVtCVVpedrvVI+FDt0gRCOr
         YamZYKlKkqQ+yrIkMwMPJ7NNnQ72fZl50d3f9W6n6hQnPeaqJGBigzbgBA7MD8xvg90/
         6Gqp+U2WNHhk0ha+/lG/JfC/gxAgxnr4LgUsj/+jHEDRBdsb9DlV9oeBomYNAmeSOOb6
         rwy48F+CxTqBBTNNnzk2MW3WmFFgbjiziel2d90G3ISF4xGEwxKHvkSdnZMVNFhWPFF0
         uhPkUwKbO2tYbc791sn2cHH3lws3x00vQW+yJtjlfh8RA93+vn1mMysgb3WRN6GzJtQf
         rw5A==
X-Forwarded-Encrypted: i=1; AL+hErFTVTFHYEl7rkdwEpAdTn0k14C34IqcUpYVu+IINC3WP7NhUXaBQWszByfljQlWp66yn8+bzXyhNanv@vger.kernel.org
X-Gm-Message-State: APuU4Z/9IdLBXkbqd00mUZsxvGBcW2yJ6ACc8gxyCU/yw6W51EgzQU/L
	lhRzdypnixYxrB28LZibxcwcxAF70ScbI3KWFV02mSyc85dZC4nC0n9fNp7iEV4EZyQg5ORRuN4
	IZX3knVp2jRNppVxneTalQi+DTaUHjaN2M/5vYJvj2202NNGbizWEeXpkHmOI7kyI
X-Gm-Gg: AYBFou3YH5Tr1F7y63jLsfJe8yRaWupoHBK9bvYeU+zxOHa3FDgMWq4kpr3B2nA63WO
	wJiI+7C3BjKDbgKKSIPuIeRj94HM/v8CNIScdj4XYIeTo+TV/ac3KQNou1uxpjWziZRjddQCoAM
	xOSmZZnOIwfleA07PLcCPW3B/WNe6Q2ZwDqmWLzHQHzmGosxmLTH+EXY8xlJkUyiFPsqaPB1a6n
	tLnqkCrttharK6DTTYipGUERybYAiM7snMHW5bzLoNWvBK2J/bGyREtCji7x9Gqp9NS3W4xn/Iu
	Cv3nRpe2zN4v03mIO0MMjBrl2vtixHcAt2To2RAPPbMMoJyDRRByaKLCoy/1X+bA+1bfzvd/AP7
	aNb+byRHe7eI13NfOTssjYcTiAu6woy2NTIefSXDl9SDxlUSvtpUAJtTdCOtMQ4j9a1Sn4A==
X-Received: by 2002:a05:620a:a2c8:20b0:945:db0d:9cc7 with SMTP id af79cd13be357-94783fcd83amr526950585a.0.1794219716414;
        Mon, 09 Nov 2026 02:21:56 -0800 (PST)
X-Received: by 2002:a05:620a:a2c8:20b0:945:db0d:9cc7 with SMTP id af79cd13be357-94783fcd83amr526947285a.0.1794219715892;
        Mon, 09 Nov 2026 02:21:55 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474e3dsm148159066b.42.2026.11.09.02.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:21:54 -0800 (PST)
Message-ID: <099aaf7d-f0a0-41a8-be75-98912e11094a@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:21:52 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 touchscreen support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-mahua-t14s-gen7-touchscreen-v1-1-d638ddd34170@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-mahua-t14s-gen7-touchscreen-v1-1-d638ddd34170@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uR1vIW428Vv6jE0kjDiD1BVrszk4qWRK
X-Proofpoint-GUID: uR1vIW428Vv6jE0kjDiD1BVrszk4qWRK
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af19ec5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PEJKZ92eUzn2SXrnmagA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX17UCaSh+yUCK
 PooTSBm9kRLpjFPuB1mDZvB/pa4XdTIACnbQul+VX1X+aauT7lpx+01+/S+3vg3kmABMwV90xly
 zfz7U4ieSQ9lWaimEWEI/BCu14mkMmOQKdANYD7KukzA0TdvWEb/U87sk9KcWrLzxAeAcacYrf+
 I/t7NV0gH3qJ3ILo1nfZYwHfPgBEVdHCWotqoEZjfWGiVoaF2AcA8O5eLkE13XLKNcFmlrJPZ/E
 PhcuGPhHV77vAiV8DzbGuU5ZtFgpiDCKj3NTfCAExRSwf5IA2YZOfcRCeuBX0oJ2Og0+/A4sGd/
 oYhkYsyBL0dj36su+XD4iQQ7BucwJRgzEJAQOjlSxYARuYUXVAS+fGYC8Uw2XqTMZB5Z9tJFFSX
 d6r8kCllilHdtl2506foZozCBgClu2kuh2aO/gZ7pVo8jU8ym3btEC+Q/u1EkbIkfgBooAnL1Dd
 iqcND7/IIxpt9pi55GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX2YO6VAUPEQha
 tKqqhrXvB/E/ayKaAZds3G2KI8CsmUgkxM9Q38O9lfCLzY+k+Xt13miR+QkSkA4EwQoZQbIAa3a
 C6yhjpm2fSHMU4YEw7zTGdy6sVmXSmE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

On 11/6/26 9:47 PM, Abel Vesa wrote:
> The touch SKU of the ThinkPad T14s Gen 7 has a HID-over-I2C
> touchscreen (Parade, HID 1da0:3009) at address 0x24 on QUP i2c8.
> Its interrupt is GPIO 51 (level, active low) and GPIO 48 is the
> active-low reset line, which is kept deasserted.
> 
> Describe it so the touchscreen works.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]
> +	ts0_default: ts0-default-state {
> +		int-n-pins {
> +			pins = "gpio51";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		reset-n-pins {
> +			pins = "gpio48";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +			output-high;

I'm afraid you'll need to add specific bindings for this touchscreen
instead, see:

https://lore.kernel.org/lkml/82a96d57-94fc-470a-b7eb-f0fde0c0dad6@oss.qualcomm.com/

Konrad
