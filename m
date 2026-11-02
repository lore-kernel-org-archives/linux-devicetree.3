Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625680;
	b=K8YvGuVlyVPoGNH3X9R6fZnEv1v0orGNAvs0YlLEyMMeaRw4NiJICcivNA9K8WzIuHQa
	 cNKOSITHk1cJoT10LQ0njvnJ6bwdiRFBa6LR71mU4fFTV7pDHiHJyVZ38S/pLzsYdbHzy
	 qLtSivqGSNlOvNgDP5MHESqqULfag7COL9D9uye9/wy7IDYhGFPUnbyiEtWLUrMLB0cWj
	 Q/spr8N4Cul2FRjT/Ef3EvLLWP7vOYq0hEHa6yLv5KyW2dQR2jkLDUVauq/Hcto1JeqY8
	 ihXkdsJGPE6F5+SMYDD3h+7cmroIINnorV6S49QCxgepgAEQbQH17yDoi9mVw3VDTCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Xbx1BUgqsVB2CQb9oZczMqbiDBgubPx546cwvRO63fk=;
	b=R45iUnRaVPUIzbkYBKzuJX0S7sSEjbxSyOsV+XI6h+wMRV1IFXYFRoeudK01xnjvsywp
	 3ydN3Y8Me9/5tYT8FX1MZXd4aT+tQrFLooUHRg7EjO+vhFjftlqdAqgElA4XHLm3QmFL2
	 ol9Q3dVXSFKPxR6VmNz1V/6mjnM5FmSaFPbhWeK+XI0OnRPPovwmB9yIZnA0flnJwHxzZ
	 vpNBkNFewDWFsF6lITMz7vqIciEf98E3ZRa2EexNgz/eg+EOGI7VcEhbIij5OI7IaxuXx
	 ozXydqLRZNQ80VtwD2TZBnEuh1148wxMj6PE2WF9r4Ja3opqWI6zXbbrHILh+XtRaBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3bFrcGg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e57XM+xk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DC1606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87DC1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3bFrcGg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e57XM+xk
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAcwI3014637
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xbx1BUgqsVB2CQb9oZczMqbiDBgubPx546cwvRO63fk=; b=N3bFrcGg79MFD7ZJ
	l89G978mD1C2ZoUWvkUTWFP7/nJzct3sr7LB5USoJJYXLZQouqSAKCQVHsB+mW+5
	sKobtD0UsgP/BRdaanP/iScNWvDBQiCtqa5IOjvfS22gOLa/9I5D4gDieDXip2p5
	0rKznQutRyRb7wHRCuBsSb3ua4PL83VOBFROiAr/+O0e0+BYvYm+NceIgqJM0X75
	1yQb5NuyFJ1h8P8W+3IYX4FVxCCptl778HPFnLur5kJ9MJlIZBb9YrPcowRrkvUm
	tkncXX2ZTWzLCZY0l/h0WQaDuqrb5vKTu+qQw3rUQbvq54gtoKP6my8Ts7wXt876
	0qmsSQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhyt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:21:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988c723394dso50926241.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625678; x=1794230478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xbx1BUgqsVB2CQb9oZczMqbiDBgubPx546cwvRO63fk=;
        b=e57XM+xkm7vUpMUpP5yTpjlqnOurMx6kd1tqtDTExJ+aAT2RGra26UTvv+S67+JRYH
         751ltjajJ+4W99rgy5wurMsvS34YfXZFDhGm8qjdUWfWka/ln0ZNcV2gHLcd61y2vxFP
         KAcXE1EGRs3ejMvohPdin1cYlahtePIX07sL7xtQNc4wTIiVFvbaoYo3y+w05yNTLlYU
         CR1Hv/e4ekmV0N1ZyMvtiYzli0urCv69G7ys8cuHWEtkuqoQOocffxceoAXdvxuoUEzf
         /HzAtsI8eq7o8C+oTr5WVlB2GN89cOEz06OWdzoCbNRMCYON0ad+gbKTIpAdHZFIs79B
         +n9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625678; x=1794230478;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xbx1BUgqsVB2CQb9oZczMqbiDBgubPx546cwvRO63fk=;
        b=EhhSMHEoRJT56VXkf+LKJuulCpPo6nYT+czdwUXdNH3+tHtWUu28mbP0uhuek/Vko7
         hYOQlgc3xHdY49aBzy34GCNk0Ha9Sh/b7RX5R9C6BlrsKcVdBgJ+3nyfE0+OnH/UNfvL
         PhILh4TAM4hTmT/12PObTMVQK9L0zo5G7s/Ie/UJ0WZi177S93eORlkKJJaihYd5xmjF
         d+pnkx86qX0Xfuemr4K3Oamesr6P09dV1wahWZY/gZzbc7XZLBo5/wM3qlgW7oQ87efL
         p+k4BBjGnpfcawcs9/8NiToacpuY/QTx9JTLxJU4J0Hh+fHKQiYMZBIkfrtn1vixOoHu
         VCsg==
X-Forwarded-Encrypted: i=1; AKwUvBzPmSUquTcu8KW9QJ9BuY3EU5c39oiWGkaHXnkKk0yOV8Sp1jBDtQHGTDFnBZtvsLD01KgM3abAfohQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8SWSJ9DEdgd4kHdWSB0sJvOjAvtg9cyWUVWyQN7hbJlR/LPeN0
	F/s1hm+ZseF/HjJUtkD1U4f9rVNwae7hL3z88ADHmwpebic4mFlOGsbUKFZZ5CLQkDzQyYIwDih
	/5yLHCexAdxRFSKFlFiqWgNywrLVf5XDBnLrZ6QrOVVyNcu2wNNrRoKJfMPu/Jmp4
X-Gm-Gg: AYBFou0lREj0+7mKhYHF4mgDH+9sMmH21PcboRfoUoBFiQBYwAALkgxqnrnlZTjutzz
	XIRInsWT6lNgYkP0RZgNViW4RGAO5HImROfUCIyEV+UX2cunYEjz9u+bEIgDBv1V+do7NEdCyxX
	dAPreN+2KydCCWtOOuM2O8a2w9u4DOTcjrpl6TbqztG9OWj2qTmen4Wzvo1kA4/h/LdG2xhDNik
	B/Jo9EN0w/tDIgTcV20b1CLaNZ7JEVZ+tYD1+/Xik704Jl0CVOD9t5PJB7msawJES+PuNKfYvzw
	1N5inHyGChfqkW7i0fJOVcz3KMAw8ei6lruWSJqyB1Xd3W2Tz2MUz345eNSzF3vPomEBXTga1+X
	3b68/JgFSo/EkyALPB4dSHkyr4ITvJh2gSNttkS5gqwaj9KEGoE5b3l72CRn9EYvsjdgSHSU=
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr3850567137.3.1793625677721;
        Mon, 02 Nov 2026 05:21:17 -0800 (PST)
X-Received: by 2002:a67:f446:0:b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d072bde34dmr3850535137.3.1793625677256;
        Mon, 02 Nov 2026 05:21:17 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcbb0sm3395230a12.19.2026.11.02.05.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:21:14 -0800 (PST)
Message-ID: <748ff335-71de-416d-b994-b97a24ef9bd7@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:21:09 +0100
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
Subject: Re: [PATCH RFC v2 5/5] arm64: dts: qcom: nord-rrd: Add sound support
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
 <20261021073633.2163128-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021073633.2163128-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wdgL5iNAyHLHfgDQqEAKeyjUfzeAoz6P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXyFtdmyrXnPTc
 t8bCtt2Za/Xxpb/4udsB+0SR/WJ5anq0sm41mhSzBq9iJFTqbVztw9fJw8yoyi8Ge/NdaP0ZHSE
 HjvUSrVwijG5F7GDb3X1ECTNfFbhNR+hV4h6GVezn7NAeB4zks0f9L7OwROz8wBVPwpnkPnS9N2
 E9XRChcAauEOi8jAJpXZvNI8E86IKErhRzg0HXuo+6+Uu1L16KxwnqAQQZdSNFelVz3gC1zWGpV
 CBqai+M4SUaJPNiFVkKcFh6+yE8jk7R3ECWJK6Ww+xBlBACw0lb0Nqt046fF8zWetFY+LP3K9Xd
 sF6Jf7VcC35EQE5GNFP3A4ZIGFy/suBwTyrMRBrY96lCE+fkudHBrTytlPAZL67LUV4QFNjhlqC
 NXxJYvKU4/ZNq99RiJZjiQngo+LV/bgjYx6diQlDFtkULmvaFc8HMIJNIbxNmN80Gm5w1Th27K8
 DBmVnFHYqcWwTU9Wp4Q==
X-Proofpoint-GUID: wdgL5iNAyHLHfgDQqEAKeyjUfzeAoz6P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXzsb14xJ1cPfS
 tJZt5UdDcYvN9R1c+PCbctLo/1dKZ4WGXrklc3O4/3vdQWm3gPLvfzC0UROKfHYdO09x39JM7bK
 J8ITrp0QKUshTwgGXMM1Fi4bKXY3vKw=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae88e4e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-Q6HcSUBdirZEqn3JksA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 10/21/26 9:36 AM, Shawn Guo wrote:
> Enable audio on the nord-rrd board. Add a soundcard node using
> the qcom,nord-sndcard compatible.
> 
> Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
> clock supplied via MCLK0.
> 
> Describe DAC_ENABLE as the enable of two regulator-fixed supplies
> (3.3V and 5V load switches) feeding the PCM1681, and the two MAX9892
> click-and-pop suppressors as one simple-audio-amplifier on
> CLICK_POP_MUTE_N, routed after VOUT1..4, so DAPM controls the mute.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
