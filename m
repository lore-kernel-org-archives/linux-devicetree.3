Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793244475;
	b=rVbkSkZoSPOrlxg4wu+j5nXyCkQozuSuH+W4/UhjCyK5diod9pR/smnCUT38/mnJ3YJF
	 NWd2Jq+Ey7qpT/2E8GozUrPCo00I55wYSl51Yh7PmVrt25bEzbBPAZTE2I3okhXUAiGkj
	 SbJjqzb9Tk9oCSGK/CSUAO2hR4xhihGKckvEs8/lYDIFYkfNEPLAvnWQrJyolIgskRfRS
	 LpLTrkUVpKDEBNbm6PMIy4UWD7ELXj3hw1TldSQeBBVKxr4iOvXvi8PwqZqSj42bEWxsW
	 tRdzDe3lpnOB/Xy0GjUZyAo2Sh9hEOuQeq4zJtbx7dZEotYweDna5srtuBWVm4lXbQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244475;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IwMAPaLlLiUuoEsFHqZElqUlGj5P6ZenhreeAQP+akg=;
	b=H+jwwH25T8jnxJG7wk1va73WFF9Bzch8w9d8eh2EyYkVnEPlse6OJ9m0hBBWAaW9l6+6
	 T8MQ6yyYf3cDkYSt2KVLa0Q5yaq7+moufaSOEZTeOMbDT50ozIRe+VTbQaCkMyTAcn9oU
	 fBycl6KNab+WgfpkjV3QbbL0nLgEGy66+Mk909cpx7ZGUtRVa3jTsYhTCcenmgBv6fpuf
	 F/jTVUuEZfI144qyhtnfwkNMeJyByZQLakkqPib5Nbwe08FToNiGz8yyjiAJFT/B8Aet5
	 dRfqHGLJC32vA1SDc0S0UtwGrPzKlVUx5l2nZtnMiWpnIsnfB7Chy2JsGNOBjYK2mHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gYHsIv1N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbhzBsXQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869E6606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gYHsIv1N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbhzBsXQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jbvl1340157
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IwMAPaLlLiUuoEsFHqZElqUlGj5P6ZenhreeAQP+akg=; b=gYHsIv1NKRePU59Y
	9555y6anHD995DoIJJv7WhyO09xHvQxdRvFjJhkx5HixMUF1Fd4rwjLCyH8y3MXi
	W+3gG6Ez545ztoyahx20ZZTM+79U7gmGoHUL3oblVtbG2QKDVPGt0A5NhAkeo0Nw
	fWzRfz7+JKLEM4Tb/ojNpLh8Vi/PK0KjsoZVkQ71wyXnwMaG3fAznvCFTGJIu/xs
	/orwkq2Ro41wbNMUUxk4MydN0abkqLUuqbVrfVhleA3OQbFS0EK/QAg4NOmFPA9i
	gAwvML7SQmhcQt0GMtmYHL1erkvw3x77NESE9HIBTFhbOiPp210w577TAzCFwcmx
	z7X3Sw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnk3ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:27:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so1596346a91.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 20:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793244473; x=1793849273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IwMAPaLlLiUuoEsFHqZElqUlGj5P6ZenhreeAQP+akg=;
        b=MbhzBsXQgb/jjo88cmo65JbI2G74qP767UJDH0riA28KKauwL1yw2NKjLOKMlYWU+/
         l7zE4q4v8UCYV9/emC5LN5Z9KrByEQ4FWvSSvhCuxZ7YiCq6E9wBQRh/QAEWf9Ag0lOP
         fNCzzt26L1sv3/cGuvyxzJH9tKxPCr+ZvVrKAf16o0BaEWRQ7yuOvn2zsKnLi21a2D1f
         qTi+O5GwUWhhj/2VbIRnLxL4cC24AjwD5NejrFXuZImP3fOZ33AB99Hc8cBNlBxJIoee
         xoBMyGthTqr3nEdFcuxYjtaCHe5J/CDzcYJmsuKFjQNyReoXXf7+vkVY+VTRbHXIASqB
         yJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244473; x=1793849273;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwMAPaLlLiUuoEsFHqZElqUlGj5P6ZenhreeAQP+akg=;
        b=SvZRdC/nnEOMUSWcuWaLTvYvgaMmfmhawN+GGaZgHjk6LZgTlwQU+5cRnLWAOjTmZc
         XeVWt/mwTOI1Ib+djxZ/S4rmMCSmypu1uVlM4IUBuGnYhFJ3W7ZaFIahzcM9+J3eX4h/
         oY8sDpLdKWaCVIqyWfscVOjpaXQ4tdDbWTNx2DLudTPDOqmxNKZJ5ZYhzM4flC4Mw1W+
         agfVAsy+R05i7bTcU4Gr+yUDVzXhbzBhKbRW+sB/SQJ/21FsfVu3Sb1OBaOedbRoTi0z
         p3jMUuBEr4BbnS3O9on1f+A5iRYhWEuxGElOoGhNYSNL1LuX6e48U3fESSPEXKKuwXQr
         FlJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIoQa7xm/jbxmtmGEet8dbtx7pgX5tq3KpFpLlDgtWsjxp45DNMV3wI85sSpbXHcQoMNDPdUJsQA0s@vger.kernel.org
X-Gm-Message-State: AFq9FYLRkeCML+TA2voXlW46OiNA8DMmQEl24+rWJeFSpnc4f2iKmCR+
	k2aVKzT6l48B2hvRQ7bIWd+yWTdFzbMBz75c41m0xi2ma0T4eQYmfKs5pEFf7jbf+Zmkzxwslxb
	71z4heah9KmOMxmZfkbMRklNeWc7jGEl9CE7jKBYNRFqqrOGGPqtjDQRp9bUJooib
X-Gm-Gg: AYBFou00azocjVq6SJv1G2VBkFnZ1z1JpUHF5jlV5MfjBQdko3HwolQCizObya9Ep77
	2GypKhg+L9auQdNU5o97B+AMNSfAiBsXbPcHpCU6r2lDJJvKFyz74oVp8el82tAGLkNo2fRKNJI
	1pANe9/ERHf6kWfC6ldY3lMgAsY929m36AGvo58X2KSXOCJ/Vy73CesgeTwrsX6lGLqhh8MpvB3
	9p2iybgu0HHxF36yBdHbAoKTuINmK1hw3utrO7gBq4kOZx2CnhsSwMgcKxv/a6qGitYZK3y3uNo
	ONy6v+4FnsBnJBPull5UrqOXefoHvflAYNgePgDUltt0zdDlTfZJXitJK/qul32O/28l+ulJmB9
	FJmqYdSQ1WNZrQTWzn6oOTQyjWQGAVQW63c5BghdKO4dfdpLnruZEIRdUWBbFQqPIHvmCMBrEny
	97D14BEEAtRjgH+w4uC+mPYmzdNBMAiir5U+SV
X-Received: by 2002:a17:90b:528d:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ae580cda50mr3543165a91.22.1793244473012;
        Wed, 28 Oct 2026 20:27:53 -0700 (PDT)
X-Received: by 2002:a17:90b:528d:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ae580cda50mr3543143a91.22.1793244472548;
        Wed, 28 Oct 2026 20:27:52 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a6dc1sm1885033a91.0.2026.10.28.20.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 20:27:51 -0700 (PDT)
Message-ID: <55e20ec8-d6fe-4613-b7c0-d748f2e5944e@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:27:47 +0800
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
Subject: Re: [PATCH v1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio
 link
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
 <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
Content-Language: en-US
From: Le Qi <le.qi@oss.qualcomm.com>
In-Reply-To: <01b4728f-a78e-4932-96fa-795283e91cb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hj6XFX_SzqEobcs6Hluqq39Xw5KA_5E3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMiBTYWx0ZWRfX0Kh3XtGXSmoi
 EkLjByesX+jsQOgVszlob0o+lX+5QtNmv9dFqTr6VBDHOZ4QLFk6mcw1NV3rPRx/Gx5kPAyUIFl
 ZLVmcZUROCtRtbOz0U2ZQoRiXk+brJqmx2qHuFdWdMep+F7iUy7UXnvbp1n+WgAuaVvIZD5L7pB
 HGTsWY/Za38KOsk5ybO1QyIKDUutaM0dWikykiL+F9DmWHuavBh1JWhJzzAYDyoawHwMrutaVWq
 1jiNv3+TSRAoeAKcZH3DwcxdAaoVc9K7MafHXfeGEz1JqUhqqacIM4riacWO+oQb63bTtzu3+Ns
 7EmIvI3ZMPYhKnVnEURUrqCkjv2UfpM55HVwci8RBLwgv86Kb6nq0uyLz5pCQtwImCdPXn58A0c
 8SpcU19daXrVPp3n03ORMU36zxsPzJQ003EhrFTOIRBzjWuFflcetZPqr18ccsEMESpSO8BXtVj
 bDbLFuZoLAUFn502c5A==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae2bd39 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=e3FvKZFSWGuFtYgZOwkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: hj6XFX_SzqEobcs6Hluqq39Xw5KA_5E3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMiBTYWx0ZWRfX8WLts6JZcyBT
 Ke2/iNng8GGYP7/2DDWVAgZidGRTE3hbt2Bm+4lVf9CPKe2dK8dG0Di1bw7kmh/zR5IfoHP0Aou
 9stQdRvV5sk2HcLIvCDL2Z4uR0WDODw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290012

On 10/20/2026 6:14 PM, Konrad Dybcio wrote:
> On 10/9/26 5:04 AM, Le Qi wrote:
>> The DP2 DAI link is missing from the sound card definition, preventing
>> audio playback over the third DisplayPort interface.
>>
>> Add the required codec, CPU, and platform DAI configuration to enable
>> audio playback over DP2.
>>
>> Signed-off-by: Le Qi<le.qi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> index a811d8ca2dbf..93cefffd1f46 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> @@ -641,6 +641,22 @@ platform {
>>   				sound-dai = <&q6apm>;
>>   			};
>>   		};
>> +
>> +		dp2-dai-link {
>> +			link-name = "DP2 Playback";
>> +
>> +			codec {
>> +				sound-dai = <&mdss_dp2>;
>> +			};
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
> Srini, can/should this be in the SoC DT?
> 
> Konrad

Hi Konrad,

I think it is better to keep this in the board DT, since the sound card 
is board-specific. DP0 and DP1 DAI links are already defined here, so 
DP2 should be added alongside them.

Srini has also agreed to adding DP2 support in the audio topology.

Thanks,

-- 
Thx and BRs,
Le Qi
