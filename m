Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620750;
	b=UOvLlSdEDWciDSvej20Emi3+qSg4B1SM7qh1b8tLV6JT0xChWHFOPVSyG+Gs7Bvd5NwT
	 QvPdNJkT2jdDAVp7V1QxJBq73Stfils4JKQN7QZqc897TbN0D16tA+G9Wu86xBjSZZeRT
	 J/9G7w6Sb9WJMbUxR6dZQzG7RnXTwppREzbSLNL8b1ubQkouoPP9AoJ/InVFY6tQG6IyK
	 +3iEyAeMe1ZJBuEFikXjXDvNIZAYOO178I0tkRuou9F9HH0zFP/aBn5TPqLRkzIG4zSOo
	 S8qaXnZ271cxZdkknFerJOoWU4dy39Dxy4i8PY/QcL3IaETRga02LGAPoSWzxmjMpeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620750;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DuomeWGodFcFCB+pUEnfFnd364QVXgbamwtQCw4VVDY=;
	b=dAxJEZCo18obe9ani227MPvGC69W/niHiY+bDcLTzui8KfTCiZd/WYMbta/o+Pk5d7Si
	 eCXnJLE+3qBGzM56hGbejGosqkdFdZAEs5Ay/IgHSuFIxCzMmX45+wr69rtnE6ygTVU2r
	 AGTzeF2SZ5EqkC+GZdpOwNknbmZaPQ/8aPC5M3Hw7oJTe1sGaLf8JNl+iTgmjNLyvhN6u
	 f0/iPFS1d7u+VQpC6pU2gjpVD/JHkdGNE78qMtmok3ywjCc9wZe7SBOPHW7Z9EKFOFuBZ
	 mzygVLLrFyzH39GM0kUi85XknD4G/4goTY05jhnLW2mQIS8bZvarCzkFKI1y/Divxkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y8oQ2vyC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TJaXw/rM";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30D9606B177
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E30D9606B177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y8oQ2vyC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJaXw/rM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOpp3086536
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DuomeWGodFcFCB+pUEnfFnd364QVXgbamwtQCw4VVDY=; b=Y8oQ2vyCnVpJLAoV
	Led4OW3bjQvC1mj2Qu2bSWaQpBQdXQKp3KzJ3heOvu8tyByCf21b1XEZiakNeCAE
	UEmDXpvrblhGfOfVO6AzcMOWjwsA3PEXZJei2M6RDV9iR3b4diFzWPkfBQZKfHcq
	iGJ1vKqhnF4fEC3DbagpVJ0hmLN8KERLnKhPifWCI0MweDvJ/HLo4GCFPtuws4pB
	tRDK6w2BfJL2iYEPEaVXpaU0Tq/aLe/jgneSLiXO8rBFgjnY248zHiC6dU7yDNcO
	fLKVb6IxcpKzTVB3mlBaUTZCfQPO1IMSC25jc2XcyaPgAtYRXLnS8Pvo1XK75sVt
	mC7VmQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61nje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:59:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53630cded29so4744251cf.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620748; x=1794225548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuomeWGodFcFCB+pUEnfFnd364QVXgbamwtQCw4VVDY=;
        b=TJaXw/rM8ByzZWujiZNoAEf8tdZKi6QXE/T6FddaY9cB4VwxGoLmiKwaYSryjLRSbG
         ookcoHWZjLopwUzGW9Amf3429aTCTkWSElKvTfRuqCzCgJmreAS9wlYptoJHuEaDZY5P
         lDYMZVOA/ECELe8eYMz4ZqghWocndBJPt4rcvEsMYcUs1wOFO/MRbIUEP4u1BvkQ6HBM
         WihpPQDOOzyT6ejqAPGijmIO3LCk25M4O9PTZ0D5gQLjciFfF6+EKVC2AO23qox2/h4j
         07iWkmxyYvs6MqHE3vojwfEggzYEn3b20cuZDYyK2TMNNutTJ1XIGvYF2oWYwFQAgVfW
         OILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620748; x=1794225548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuomeWGodFcFCB+pUEnfFnd364QVXgbamwtQCw4VVDY=;
        b=GTCQrPTwF1U3wr0bnZBu+Ry46PFxWfVALvOOGGJWaQkJQB1fqNW3QMUSrMQqtSPZgg
         Np3RWnAydsSHLA2qWErZEe1UsXSEGehl4NzDBLbBL4PnYBopRA3NiEa8PHReXldRtNO0
         TX7q+x4T6dRjm6IeE52Q7YS/Nc+xjcIn2oaKk9UngqDwcittGwPk4MBzRfJRDTLy6PK3
         wFmaH9AtBJ90D/1fzaJ5MrfrixSsKs49f0d3GPO2RkoiXsiSkPTfSUjOZYnYPt7rGV9O
         x/34BIr+Jpe3PLqdV34qJ4e8eQhRB6/AFNygjC1Mx1yB/WsRNRBxqA9Uhw7HAMUnfxI5
         MhiA==
X-Forwarded-Encrypted: i=1; AKwUvBzuYg8uQbFKU/R4c3womxjPfRao105o4nQVcfQxMXrOmo5vDqLY0aRan1qMuFYN8coZZ1RkiZVEaw5W@vger.kernel.org
X-Gm-Message-State: AFq9FYJZULtWyPUUoBbeEyu2zTl2nrsaSfx6SJ4p59VqrBYx4uQRUjcl
	Pyf1tsErCMWsYp7gc8nJ05rJRDaSbw7SFhdhNKrcs9B0aUzDAfXO3u20qNWCheND09h0W0y7KKw
	72fQ4Vesmd+b4BBwnALRJRX5/sgykS+g+pirq228rOQjTRLCiJQ1luLODcXnIzimV
X-Gm-Gg: AYBFou2z7hmeZtkUrAby1w8YezKtB/UkDYRGcDcp0NawvxtW70uU1EXIsbIg66PHLGs
	LVNWJXyL5hEnbvDoJGAP/Q8DR2Ptb/cHrcawyAgzUZ+KAS2UKzYfXK+ujTv6GRX6RaPaGB3J3RS
	N4E02r2JUq9oKfA4zVshFcWDYqZeDHZKqo7u2tox+KkZxhFiERFX7mKo0i+IrZKDNje+kFnmVl3
	I+4xeAqFJ3saa14EITycEL/nIGpqMI/PNVKi8VFu5mcK1pTW6YcQaQvg88xBxf8bRx1gcHDm8LX
	Hgc949mX7JEf7SevX9hjvyAkfbsyVYD7gEsq48lWtx20GQvLkoJD4pw1H89V+e1frfmrtDBzaYZ
	7iuwQZHFbEnXYF2GVS3f2XcRgzF3yBuKaj4PgtPNJpCBZ8MllsfxXTNVniV+0b6+jCI9pilg=
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1610768285a.1.1793620747772;
        Mon, 02 Nov 2026 03:59:07 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1610762585a.1.1793620747264;
        Mon, 02 Nov 2026 03:59:07 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm379723366b.20.2026.11.02.03.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:59:06 -0800 (PST)
Message-ID: <d176aebe-bc30-4585-8b71-821a30657a0d@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:59:03 +0100
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
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP,
 CDSP, IPA & MPSS
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B6IsptsDI1z_kyQuK81uBt3BCckDok3P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX7wHR4kSU/Uk9
 lgJ1mJhB3YAk6yptHfCbgdB9xjXgulmZqmBb7Dk40ynEEgon4m061bh5aSU2Rl74UequiM6uiRT
 mV+2/i7ZfYLSbQRNibYrgyer3jYyVLc=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae87b0c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=JgZe5hknAAAA:8 a=yd_p4N631o0H4GjTUx4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXy3v22ukVGuQP
 J4K5SEhPiXDSV1LFDdTfhVo+/7s7xgJWTBWWC3zv77gDLKKc4rP9HypoU5F0jt51sECuTksupSk
 a/K9BMSpqmKOVyKqlwOd0eeyr6Q+rKPPthpmVrzmJrjgQh1BYiGhgtxqcixJER0G++mrTMj0lb3
 FVn6FyXgqUx1Gp8uKTiWsYjF+galK3HuhAgbYX0DXBomITyols6ry4o2A5CLfX9Jh0U0AlLsMsK
 JokmlcrS3OyJWOmpI4Ap1WY/dyMeNofLzaBTJUuh/WWY2wf71ct5RCsrr0xKrQDCBu0vH4eD9WH
 MbGjGMMwRxxA3On5xSlPtX+0fIujyE00FNyYayWu+gg3oVnjabuv0CQwEnC0I7AQRgXtUV9HJm/
 UUeiPFniL5qrD1qL1d7qsygNMfMKnBHbW687erOktS6DVV/WQLHNeQGGIkPZv0Bqf1fm496OlLU
 4ZjUlJ+oXKXdwzeSwQQ==
X-Proofpoint-GUID: B6IsptsDI1z_kyQuK81uBt3BCckDok3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> Enable the ADSP, CDSP, IPA and MPSS (Modem) nodes for the Xperia 10 III.
> 
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 1e89c9798edf8..ce351a3fa8727 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -77,6 +77,12 @@ memory@fe901000 {
>  	};
>  };
>  
> +&adsp {
> +	firmware-name = "qcom/sm6350/sony/pdx213/adsp.mbn";

FWIW all other devices have an uppercase 'S' for Sony here, I'd
like to keep that consistent

Konrad
