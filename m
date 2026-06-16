Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C7A43D4F7
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611098; cv=none; b=kedNT8tIoX6gUfInCDpq0q6Daq82IqZSNkEdgQFDReNdmCBKlLPLo9EEw/m+9n7203YHMrUcC02COI2RePP9JvDTpstLMDewbo9KcMQtftm0YRpbC/nTyGs/UztZ3BCRIbrSu0RvTDdBJQagBBN43E7cSPc4x7qTQfEFtJrcaKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611098; c=relaxed/simple;
	bh=Yr8lXVIAWkXgrBDr2OgS4iUFMLjDYwsygBnWvJVr03c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DcbUb5SflPPWueCjzSShHSQ0RAYJ2X30pDinrtbh4DUP8vIRVt2SepfUvg1BuXLVZVSooSLwZ2sF3pJodGPH9sb1g+PauB6+pW+oSzmTRXXLPPgfI5NBZee2OGRHZ+2CjbCvJIIVKnqNHZgAOdxMADoRrtw9poIHL9APxK1LwKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsscBhV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=afAuqzi8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BsscBhV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="afAuqzi8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABn4v3384132
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6cYPSFoG/0e4M1JnmPrRoWDSlgvk/AWVR1/ScU4SAY=; b=BsscBhV7QwZc1V6C
	biXaOgq/iUL5gzyyiVMI8VWox3n+1L+X+FscBoa6QxScpl/DnDXlhNJv5BbNgam0
	wuRrPnxKm/ws8gUfGcCBU/PcuF0qJKjmnz05A3z2S4NstV71ZAehxKTpRltH814U
	CKAts9oN6CZjx1ydDyAjtGk2rAYOXsCKwvdD+MJmlciaUcoerdQsnIMu/8gApqq1
	Q7IW59U6xhGJ/+FTZ65fQsGWRNKkrDQ4qTrvvH00flnSWY5XxU+Ev6kduh9vAC8x
	eOv/MdIuaUyeAxT0fqherhdilY9eacjqT1BalLHQ4GV3RxF0WOuzflteyo+pZJxl
	H0mEyQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep990t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:58:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915ccc2d4d2so99264185a.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 04:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781611095; x=1782215895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d6cYPSFoG/0e4M1JnmPrRoWDSlgvk/AWVR1/ScU4SAY=;
        b=afAuqzi87XlYhJdN+hTKYkoY8QeWTbHZ3sxVCKbD7+Z8aaNp3SU4rAw7V0WDlpGOIV
         r6+NrCoGK/djQe249V69aKT9F8xZC3xCHkwEP0ELk3PspRYcF1nLarQkdrVMzO7Gx4J7
         FJi7s+WfnQwQyPpB9e4IwOSsRDC+wNc9+d5tX3xT3GtWZljFfV9afEx91dWP7ZXZbbbH
         d8PnBFrR86Q+5cuZHG7UokhLlKtLVmff1Enu6A0WScdVNaiA0sOgpzl7NpWHM74jENzM
         iLmH9tHiGTMZ+DrzXqBvwk4wx9cIF6MyylA0ITfKVaJPY7YBQZxDBzoMKZEHjoh33kM7
         Mwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611095; x=1782215895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6cYPSFoG/0e4M1JnmPrRoWDSlgvk/AWVR1/ScU4SAY=;
        b=nkquXiEQiulc1Q+PlStXrgA+pcQHtHDxotnGP4+lYaQIOC53zy1INk/u6Ib8Vchrqj
         lnGc6BnmkzXR5WT60ZZgQ13jdYhrPYP/OGzyiLce5ug/vOcAmLW6xyBTCbfs1VgA00An
         VB9hxoodCjRz5wUBwGKRa2gKeqB+ZtnyO4GVjXIXsy1q/YSBzcu/s1/VlV2r31Fe9TUa
         aKl4H/tlUi3FupYPNfTXltOEXQwhAXhh4Zrfc6pHWUEYM6gSVHYO03PJfVSF8ieXEpBl
         i/7XyZ3dqgSWd0HWJqmscCFnASMMpSWY8qbI3umQ7OAr5s20xhVLF0PkCmUn324GBFOT
         HAkw==
X-Forwarded-Encrypted: i=1; AFNElJ8wKWLPY4ugsrkdXUA5aqaTaWI28A10W3+UFQ9/Hr6fZJKmKv+CQiADxzaCwzeMFuDf/mndpRlOqqAK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfi3IKwgxushsfbiLiEIcw9z8SHx975KZy3lWtjRty9JjXxalB
	/R9TCk5j0mMlHYv1y+sIpSgoYaJxZWJIi7uH8eKh+z6W9xKMZQmHwtxkGfmTpBFHFfU/HyegimG
	mBjZ++cJ31YzXBLAtjcsKXAGSkGtp+IJ0Z+Q4sBYqo6KXGK7iVanZrcR96/DW9PZ8
X-Gm-Gg: Acq92OGPO8hU7eIDISRwit98MwIlSQTUieccanM0G6cVcbRSlYqVQtBTFBuIfpTAftE
	kg48JdaXZSxRmEvwdWI1nYM9wkp+Eup2z8gSw5+nONmg+UYBaIME7z2Fh9F12FOkBiCGR9tPn5m
	cuv0IL49AIBMqXAYPib8iLDjFOa6LdPMpuQyONpSZwbNJCrUei+rUDm4SN/hlN5FiUU8Qwe1twV
	K2wDjNLSW4QB0MBGI0vK8oo/z22xldfARovHpFU/tMis1NeBVgKn0Kn5Gir/6yCj21w/+JwQgmQ
	1UjfSqLDH+7Wwx3J+KB99p+0wptnUzJLCN7ZwtLSQcYE/KdAKUan3htwaaP+u6i1jv2+yHCi7A5
	7xJAJnSEIM7YdkHnpOhwM9FOSU8DliOYMvOAi4f4NSE/+4Q==
X-Received: by 2002:a05:620a:1a20:b0:915:f92e:9b with SMTP id af79cd13be357-9161ba94c2dmr1711723185a.1.1781611095356;
        Tue, 16 Jun 2026 04:58:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:915:f92e:9b with SMTP id af79cd13be357-9161ba94c2dmr1711719685a.1.1781611094894;
        Tue, 16 Jun 2026 04:58:14 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb83420e9sm615905566b.45.2026.06.16.04.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:58:13 -0700 (PDT)
Message-ID: <ea116849-718c-487d-ae9d-50e839e44c6d@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:58:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, rosh@debian.org
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
 <20260607-rubikpi-next-20260605-v1-5-7f334e16fea6@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607-rubikpi-next-20260605-v1-5-7f334e16fea6@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a313a57 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Wdb1h0LgAAAA:8 a=BqodYhQyOslAVxcsot0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfX5G9dqyRQjEnn
 V0E+QFRIVRWi9e4ulqhrbI/OHMBd6udQ0J4+bJSEuV/9iabC+Vb78rae2XtjkOFaOKyYUiD1IJI
 yXx2UNHwnHEWNCDHwkmIDzAuvjpb+vA=
X-Proofpoint-ORIG-GUID: IJqzxCBwy14Wn8A4nYU1m3rcn9buIhmE
X-Proofpoint-GUID: IJqzxCBwy14Wn8A4nYU1m3rcn9buIhmE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfX/EFCqEJDD68y
 Bfa174ZTDlgk238vtl1kFTrbMXjguFRBmhv8I/UeMHRFUH16OZvqQCnZLcxNnD6towUqfeZqZGI
 JGD7GD6F9C/mziHNxXIgqnGkXvINifazIW4htLBI/CiBZj2/EWLjO0GfL9Y7qKia6Hvb4QBTFfG
 965tH29t+cARfOo5QOQ4Gwc7xOV+WT7vkZRMeuETlFDDd6WS7/diEf39kyqJgHiOApQ4NJUtyHS
 UtbT7D9abUtj8j0QjUTN8ajMW2xV/sW7LyC7fvp2sK8ncGUplOnlzVVlKkTx88NVPv8MP6XvEi5
 IDjvtSKO9PuJZQhQwOiqv+6L7tLHBq1iLQsd2Mxzkb8qoTsB67tHD8MahAWcVctRuIrhhNXlj7J
 7R8OeFrxA1sclAEaOGkFlC8bpK3yuWNnvpocz6w0sydsqGLAhZ8t3b2RiwAYGOJ//vKOU9PlkQ2
 kbGrJ3ixTYz8qMsp0Ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160122

On 6/6/26 8:58 PM, Hongyang Zhao wrote:
> Add audio support for the Thundercomm RubikPi3 board.
> 
> Enable AudioReach and describe the ES8316 headset codec, the LT9611
> HDMI codec endpoint and the SPDIF TX/RX endpoints exposed on the
> 40-pin header. Add the sound card DAI links, LPASS pin configuration
> and ES8316 fixed 3.3V supply.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +&q6apmbedai {
> +	pinctrl-0 = <&mi2s0_data0>, <&mi2s0_data1>, <&mi2s0_mclk>,
> +		    <&mi2s0_sclk>, <&mi2s0_ws>,
> +		    <&lpass_qua_mi2s_sclk>, <&lpass_qua_mi2s_ws>, <&lpass_qua_mi2s_data>,
> +		    <&lpass_lpi_i2s1_clk>, <&lpass_lpi_i2s1_ws>,
> +		    <&lpass_lpi_i2s1_data0>, <&lpass_lpi_i2s1_data1>;
> +	pinctrl-names = "default";
> +};

I'm slightly confused as to why you bound it to the DAI node, others
seem to couple these pins with the soundcard itself

> +
>  &qupv3_id_0 {
>  	firmware-name = "qcom/qcm6490/qupv3fw.elf";
>  
> @@ -1006,6 +1061,96 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&sound {
> +	compatible = "thundercomm,qcs6490-rubikpi3-sndcard";
> +	model = "QCS6490-Thundercomm-RubikPi3";
> +
> +	audio-routing =
> +		"Headphone Jack", "HPOL",
> +		"Headphone Jack", "HPOR",
> +		"MIC2", "Mic Jack";

Let's keep the first entry right after the equals sign and align the
other ones on doublequotes

Konrad
