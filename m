Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953653;
	b=c10+HqY5myUIte3ZNoU0zRPnh8wqEOMvDO8RcmVP7m3ImUNLbAFnUZbmBXMOvSIGrhN4
	 9iYwEnx4rirXm+dGDvkeyjUebXoRxshbI8+yozIu3VI2puoXPV1ljn36bZDYEJwwgFjDe
	 6Yib455fWqR13Zp7sx5bE91101dQPvzDsZC/V27Vsuiq7rDQPWReIwc7Qm1JU1AmAjKtT
	 F5SMSF5PO5niGNmNBFUin4vPrkP5si1fxx6Nf9PMHMTAuLW74d29STrmqDguvsZVwKy4I
	 V2UhjqxX7TeOUm0fPix/fpsqRCQVjcWcUiXNs6bn5GqGsoFqXUHtM9nwEm4hc7zWm6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Sx6E2eGRV5SxQp5i7sVIsOeukXm/V4zepzrSLP5HDw=;
	b=KxCqKFyMuHJTRvodgm0pw2j/NKi49sZWcwuacWPp4oyjdWD9pBbD10ivDPyR7RVFaGBW
	 4JQuSmCq9STX+eUz8FL73vc6DNbiaLZIfH1QG6QHfNbYZs9k3ABVkj+8FxSZaja57Ond2
	 6CHMRZ+kpssEuC6VjbF7rF8w6v2/aw7P3G4wW/f6Tav608/iThp8KPRQq5iJefrrKkgqJ
	 zLIKM5egQTHH8o8gUKbo9DdCc+hCfrV2dmfNaK34+QPO1NwZvyirHTTh8vEw04XzMyfl0
	 iYLjzs91P7suiuEvmbRu4CdAQlpo1pXWdsjFprDD9wJiQj4hVcx9Tx0jWcGHlrT7M3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWmW4Vqc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gx3DMGuH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC254606A338
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC254606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWmW4Vqc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gx3DMGuH
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHKf9q71847284
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Sx6E2eGRV5SxQp5i7sVIsOeukXm/V4zepzrSLP5HDw=; b=iWmW4VqczE3QyEmb
	Swbt8vC3VUy+iyYxwzkQml92CjoJCXL0YeWGLkWxyro296gRj7V9rvvdRkurgB1P
	yUcEbN1auMsw1st8lbi8CoNldZy3Jk6JxdT1pS630Ji6dFjleNFQYFkyuSKouRvp
	0KGv5u0emOa0MY0DiNgZ4L77UQTkYBxabwuyWlrDoyQSVx4uT8LKSpfB7+dEO+8M
	Lw2UDd/pA9vF6xSU7pmYyTSlJK8tfe2xnsKhrwT4zkwbPUZhbQINvbXHwhjyg0u6
	phN5s5aryd91ARI4g/hk97PaCFJjUM4EV7OrbiPVQTTREgOHO3wKcY8HaAUO1KpL
	qEa/9Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0s9t1qrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:14:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so344661eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794953651; x=1795558451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Sx6E2eGRV5SxQp5i7sVIsOeukXm/V4zepzrSLP5HDw=;
        b=gx3DMGuHpXqs2lDmqIvNAXqohkHNDifNlB1ZnYFjfcVkqz/bOyyx/HPL6tlYDu/QcR
         PM4wDidIbpW73OcU9ZemxiYDyQ+t8cecj165oY3eN/2BpTENKWc7Sg3ls2ZsdKYZA4JY
         NdVmJqIVA+0sElyylKtzeNPcG15dPwkMrmhlAWHB0dEJ/MtVaQIpsAbpoUJhs75KoouB
         i0Kl3De18PCayaDPxgUXzUALo4fwviehNAmJP34lG5J1dbxF4PDyZzhqsWJIzhr9K1vb
         sjq+yHKo9l2ho8+sGeFuWmbcZ2QLp6MuNZPA/HUhvwtUz1StwvZXRoxghWrBhzwioAWA
         nAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953651; x=1795558451;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Sx6E2eGRV5SxQp5i7sVIsOeukXm/V4zepzrSLP5HDw=;
        b=bfN2Lq1HsQIk72B5GlogPWiiqZC0v9djHQ4gUdsmK2/jQQ7Qh7Y21zTcOqZkrsIl2v
         H5d/w3hxbaehXuIvzZyK1D3fM8P8yYz8EUEYVFbjju50Sku7Sw2dIBO6Kt9BcuwiiVTp
         quFwln21sHpfk6vgbwSLgr2LD0N6tlK3ZtsL5UP7OisHsqDsrDnBLJ7SyEZFhOthcvzs
         SP93v8aaXNJ2ZBvHiDP+JSs71BllRwksxqolGVDkFegT7J+kUebBpjejazq877XQSWtb
         4suxUpXHsI3AJDkUCeFKkVNRUxtZWAv/NXooUA3S60vVG6QtZAVf36a6yYodxEdDpbpO
         UOtQ==
X-Forwarded-Encrypted: i=1; AL+hErE7pmUhooZiJ9Cw5aQLeTzcu9jV35TF9L96sMM7BKqXWwlQNV9uuSFjoFczKO5blYjbs1xYsHEOIwnU@vger.kernel.org
X-Gm-Message-State: APuU4Z/Dt+4ar/NC2eBc5rbQ7a1V8G8g4ifbyaZu7SQndciNEeNDdz13
	y6xkHtHhqEmXwj8GFU5GMKdQLS4WbiPnvjO4vcwrlbXytiTWqwgxkZUtu2BCw0v1kYTfylx0xSY
	HdWRJbDriMmAfPCWgW3OA8CuabZbxfdvgUAHiEYojr43+7lVPgZ/OxcYyYedR3GoWs0ggKfu+
X-Gm-Gg: AZFdTZcD9qXVwnR93gCteR+50OLqlkN/Kq+2Yy8bxVhxEW7YeHzNyuO3x1/WaNV/RNU
	KCqCdgpHGFjB7nYqJzqJIJZ6qt4p3GM6MnRttnm6D+kCSjLPeZylJi8VNATyHX8nr3nv9M5SXy/
	qwsZkgt3x+hER2tib0it5oEwgjJ5L2nZo9bi6WgbeMc2d2TSoFFfGwvTr86CwJCtiBC7dGOpBkj
	5tQlPQfbqr3uJldFzdcdy+sC0VGijgNCoTRsGKnaMuJA0rvpnAVq9F+SppJo2VhyreQ7q/wEBkP
	OWeCKxkED6QRbjToReKF6yXA8d0auh5WDjsnX248C+ZP99IImPL87Br6IiAe3Nh3wLxnqOHvyYN
	x2MnWqE14RXhtgv1N1wf3iiT84t6dgHLN2f0VvVgxDHCEDi+iEx0GYK814z9NWegi6gX1vBQ7fA
	==
X-Received: by 2002:a05:7300:d117:b0:36d:394d:e690 with SMTP id 5a478bee46e88-38282cb705amr578478eec.40.1794953650652;
        Tue, 17 Nov 2026 14:14:10 -0800 (PST)
X-Received: by 2002:a05:7300:d117:b0:36d:394d:e690 with SMTP id 5a478bee46e88-38282cb705amr578453eec.40.1794953649982;
        Tue, 17 Nov 2026 14:14:09 -0800 (PST)
Received: from [192.168.1.12] ([106.222.233.152])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm1066399eec.18.2026.11.17.14.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 14:14:09 -0800 (PST)
Message-ID: <079a8518-bca9-4f2a-89b5-eb2d17a910a8@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 03:44:01 +0530
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
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord: Add GPU cooling
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-4-a06a6c57bde7@oss.qualcomm.com>
 <assC2v74wpr3AzI6@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <assC2v74wpr3AzI6@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 48ch59VLCx-onF0y5F4AllmiJO175uyN
X-Proofpoint-GUID: 48ch59VLCx-onF0y5F4AllmiJO175uyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfXw+Q09PpzRVwZ
 7yiX5bNqE1rP+/a4aZIotBcqd7GtIrJZHD2/EQMfHtN+hVfKvACojudM0CYHDheiAcLObKSyPUz
 QTyjjmDpkx7yeL6dxyo5von829M20JZxJQ0KFLf5FPWukXo94h6ht8AXB3ihdmR3CNqux6/DqSn
 vsECfCa3SIRTBi2HYM+99nCsjtoRPIpOdcb6vIVa9jyoGwKSmJw+4FaSP+XIjqVK6o/QjgXLh7e
 JinE7JMSy6bZOJJZDOUbR8KV5g3DDzIUUAzCNFPRy2dRE3NmTf9fLIrNgscjbtl0UodYmnopCPv
 bNGw5u+9Ty0wfN4O0Yf+rW0uSp+Jc+M8PcMkfOfv7PUxRKGvTmdNGbHr7CfNXILUi682bagHLz9
 Ibd2uD480Y4qnOg8d/RVbmp7SsrKWInQmUH6ZCigcZJjxbTwMwMd0CH1uB4fc99E0NfWIMxdoc5
 uoCmXm+6xQgtw7srRmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX+TPIrK9jg2nD
 FpQJGAYyy84XokxGTbDzcInZuErQWkukvn5aYIIkg0AtQFI7Svj6W+sxbDKldSik5qo8HIT4beL
 G+iqssTJDiXUdz4GbowtHyIZIlBCUO0=
X-Authority-Analysis: v=2.4 cv=d5xgWhjE c=1 sm=1 tr=0 ts=6afcd1b3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Q9FbUFTPKQUszr4Og8UIjA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CYWSrXY8TNIhK36ftfwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170088



On 10/11/2026 9:00 AM, Shawn Guo wrote:
> On Fri, Oct 09, 2026 at 02:36:38AM +0530, Akhil P Oommen wrote:
>> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>>
>> Unlike the CPU, the GPU does not throttle its speed automatically when
>> it reaches high temperatures.
>>
>> Set up GPU cooling on Nord by throttling the Adreno 753 GPU when it
>> reaches 105°C. Label the GPU thermal zones and their passive trip
>> points, map them to the GPU as a cooling device, and add a passive
>> polling delay so the thermal framework can monitor the zones while
>> throttling.
>>
>> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 177 ++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/nord.dtsi          |  80 ++++++-------
>>  2 files changed, 217 insertions(+), 40 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> index 4379092b7bf8..23370007c974 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> @@ -17,6 +17,7 @@
>>  #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/thermal/thermal.h>
>>  
>>  #include "nord.dtsi"
>>  
>> @@ -2042,3 +2043,179 @@ opp-403000000 {
>>  		};
>>  	};
>>  };
>> +
>> +&gpu_0_0_0_thermal {
>> +	polling-delay-passive = <10>;
>> +
>> +	cooling-maps {
>> +		map0 {
>> +			trip = <&gpu_0_0_0_alert0>;
>> +			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +		};
>> +	};
>> +};
> 
> I'm not sure why this is Embedded variant specific. Can we not just
> update nord.dtsi as needed? Would that break GearVM variant in any way?

Only Embedded variant support dvfs scaling. So passive thermal mitigations
should be limited to that?

-Akhil.

> 
> Shawn

