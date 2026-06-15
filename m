Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0135A3E5A35
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525384; cv=none; b=X9hJHh2jJs4Z4lTAhG3Wxv0wyAIvJUR2ocH+gyFtmNzZ++H0DuMESNE83vmq289DaFMh3esaEctKXFVCyik9FDDtLDMbi9R/ye+2qEZEj7tsYwdOAZzlBj3hCkXrvaNdyj3h2lY7oT83V6NRY9PI0fZp+/CMItQ1HjFGgQsYFys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525384; c=relaxed/simple;
	bh=XtO4iL05RYNP4mvns6ypWCaRum1PPnfMKppbq+fRd14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWDQLzxHysbxsZc7maKRddc/OH6aBxLW18rHd1FrE1DsWStH356sHgunFTWBQydZjVZdH/PefgqEBLxNLBaAMMKz2zUTfezc1w4RxSrqkwe5pnkvu+sZR++WWBz08ZWrUaCFFHTRnsyaQWvrmA6s3G4j1Cim2znCSpDxSBTvMHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YC9mLsns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6Z+OMh7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YC9mLsns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6Z+OMh7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApC2I359119
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdDWVg67DosG+2rRxU7O5SM+Su31reMdjiRDO/KtZV8=; b=YC9mLsnsBWNLnUza
	35EprpEWuy4EUuPlGtPkw2oBFoFTHspuHoZZGLy+poR1XlrffUCaYeFhv2D786qt
	JgdMWOwo468rj5TzwhTugvM9yKS+3YDCasvScg852S2ZnDRoWSqwGIB4eqaFWODO
	XDdyu+aTtiH831iXuaIyCxqvqqbGCWdLolI2FydcVPag53wvAizQq7WW2PuRxtmo
	gHWeNmkzmjl3v1d+zdnrhY7OVQuBEgL39gsyAHamPqa1M2FBcigBsJENm1OWDdjq
	wFf//cIKuiCyylcFpa/CoWNwaZnvY/bT5N6mkuJ/aeQ4QELgQyKtsBxRs/47SMmd
	CKe9zA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c927m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:09:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccd9683350so13366746d6.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525381; x=1782130181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdDWVg67DosG+2rRxU7O5SM+Su31reMdjiRDO/KtZV8=;
        b=V6Z+OMh7/NyoXjM1PVtEKa6yg5DPvkI7C8RcgVxnO+0Myn5YE1QCUEkObbQtvnW7D/
         CQnip+0hmnJzrTDt/kyUi7i5rKm+3p3mSPrO+163zxWV8RhdH7/1vc/JXKaVSUHNqyYb
         o0ehtmrVDBuJipeNg5opJmperr7tQtD3++0bxKQOcnkD0KDSkCZUIF24KvsIiyHALQTj
         A/JIt4KNH0i/WrUUZb53Ddpm9/KJuU1CZS/poRiphNdmog0UfKzWw9E8kZnlhXIUFN5q
         JwYLXQ1Z2EtfqtItlcz5kV5yPMYNFny4B28XiERm8Ihp2v0CJFihcCqKVcakWnpoVkbB
         8efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525381; x=1782130181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdDWVg67DosG+2rRxU7O5SM+Su31reMdjiRDO/KtZV8=;
        b=Vueqn+QunWo0Wk77KXMv6zpnm9OlwmjLqbuMNRAV5L1QHG5msKCns2pY1PlGbkHxO0
         eeRad4vFsXYwas2nV+Cwi4u8BuYgawiPfkTSrkA1wZZca7KSS8KKOKQNKW9d6RvaZHsS
         U8PRRf3uibLcqhuhP09W61xVCZ0nWPsf8yZZAsIMHUQ47YajnOM2pdABWjzlVtfhjjpe
         bXHDFbhkeIAZAK5nBmKxvPItDlgjusn47ywzjy/wCJqGjn286XDIdvDzQm/348LOzL1H
         nAC6VB3Dlc42yHPeqFXZIb5/Da4SpFVxh6SVF5FJa/mA9kVfEENFlZvzBr1eqcPXsw8s
         s++A==
X-Forwarded-Encrypted: i=1; AFNElJ+6XCcjp8LVBD5pP5zWNsAAmRMo+1fShe6/M1wsEbTo41OoO3ZIOeDW9pnKENuVE+Bkfkl1xK00icY6@vger.kernel.org
X-Gm-Message-State: AOJu0YwLjOA3OKWa+hRCYz4RlvKGQYUkMPTuncwuYpgZqSY6mBOlDOxl
	PgF+3EYJQYaky/lufUXU9sCtylZ/ez/LA8/7v414PXcoDxDG2I/Y13Rm8LZBsFOOS8p1m4004Qd
	ecMgLcIV5te09gUMAlLY6mg5PEULibV3iQAZ/+RZzsnbQ7ZlHzY66aUrRxIM0dim8
X-Gm-Gg: Acq92OHbeJDL12gm7MjqzmAiwAqNIOL4pGnqKo2CumiOa5z8vnZmBLM20Y5f7hHP1gd
	g+LdAlNQRVZ8zvC0vqkv3uedxSGJ+whkFIOnFd7IOUthbfdL1bVpaAabHhUWfdm38cGGK6fyBzJ
	3nUYfwhdfhPkfRUEzvdIkMbNU05fQFp/VO0hWUd1LIVU5bSYOWjKN3zkyBtLnq52zV/fyiSRjLE
	xMpxUsLSB+aqC/0uYXBU1t45f0iyGT3wClUKP93RM4WMlj0REG0/sdnlj/WQkXEzm9nlzcAcEPk
	Ij2V3lm+Ul06XRkSpKZAIGhiq4a9JJxxpoqmI+Q9gfWnkAX/I7SBEuPr8W3k37hQhqtDscNZIzF
	wluDaITaz5tzT1YBBV1nmPs5U+DuZpjSPRZQ7JPCZJsdnOw==
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1284101485a.3.1781525381220;
        Mon, 15 Jun 2026 05:09:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1284095285a.3.1781525380675;
        Mon, 15 Jun 2026 05:09:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948fc99sm3452000a12.23.2026.06.15.05.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:09:39 -0700 (PDT)
Message-ID: <ba0e9f93-fd2b-4895-b8a7-8e38eeff9bcb@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:09:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
To: Luca Weiss <luca.weiss@fairphone.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
 <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX8ZPSpuBnyPHd
 lO57XDk9m2qMNCROl4TKOQl6/q/E5q6AgDiURWmWbUudpmckHMdr3Jp5r51syIknnu2IlMXKHZr
 dKPGMWAqVSdigAs9L8GYm2ZANMeYxpXIOiSjeWBQzmyOsi21GbnQu9Xtd8D3XcaeY1FLSpx9b0Z
 UDFsmcx2e9fnqAFjGRnxVFC6iucobgNDM9tcSp4A5xniahfBUqbUr4FsS63a23afNvMltFHhEJJ
 BNeX/pfUU+4jOloEG9pitDAobuoh3qNHFoEcGQ3xa4u2om6LlshkheT+AXw+mpBoRSUjR6WYVqe
 0Pshl2QZDb/ioyobPyM3qpUINcaMWCzH1ISD6wrWsPf04bYkA0Ne6qxvC0zT/nKV79ONvK2O/+C
 6uh67WDAzlF0lKwsUTR/ZOj0MME3+i0F2wEN80oJ1PC/2nT7v5zNG+LFfevAKoh9l0Z/mhsZMtN
 86mN8grkZdHEUqlwBeA==
X-Proofpoint-ORIG-GUID: iz4RJVbQfpnFrbYYgEWItKzwvn4QKHw_
X-Proofpoint-GUID: iz4RJVbQfpnFrbYYgEWItKzwvn4QKHw_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX3MPIDepFJ9JV
 V/8NCvlFQzlHkClD2gC6dSN+K8yNv033uXXTFMIJOKzLbGcarOUS6cnSEPOpBT9CAPiC5t2C/Fj
 2mpbD2f29iwTop0Wk8LJI9kZOSvXUD0=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a2feb85 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=VS-BQLoWTPCgKDwiL6sA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150127

On 6/12/26 3:46 PM, Luca Weiss wrote:
> On Fri Jun 12, 2026 at 2:59 PM CEST, Vladimir Zapolskiy wrote:
>> As documented in the "Devicetree Sources (DTS) Coding Style" document,
>> pinctrl subnodes should be sorted by the pins property. Do this once for
>> kodiak.dtsi so that future additions can be added at the right places.
>>
>> No functional change intended, verified with dtx_diff.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++-----------------
>>   1 file changed, 691 insertions(+), 691 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index fa540d8c2615..62daef726d32 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> 
> <snip>
> 
>> +			qup_uart12_cts: qup-uart12-cts-state {
>> +				pins = "gpio48";
>> +				function = "qup14";
>> +			};
>> +
>> +			qup_uart12_rts: qup-uart12-rts-state {
>> +				pins = "gpio49";
>> +				function = "qup14";
>> +			};
>> +
>> +			qup_uart12_tx: qup-uart12-tx-state {
>> +				pins = "gpio50";
>> +				function = "qup14";
>> +			};
>>
>> I understand and support the intention to keep this change non-functional,
>> but this pad "gpio50" is for qup16 also, right?
> 
> According to my QCM6490 data sheet, GPIO_50 has these functions:
> * UART for qup14 (OK)
> * SPI for qup14 (OK)
> * SPI for qup16 (no pinctrl)

"no pinctrl" meaning "not defined in the upstream dt as of today"?


> 
>>
>> Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63"
>> for qup16 function, I find all of these are missing on the original list.
> 
> GPIO_54:
> * UART qup15 (OK)
> * SPI qup15 (OK)
> * SPI qup14 (no pinctrl)
> 
> GPIO_55:
> * UART qup15 (OK)
> * SPI qup15 (OK)
> * SPI qup14 (no pinctrl)
> 
> GPIO_62:
> * UART qup17 (OK)
> * SPI qup17 (OK)
> * SPI qup16 (no pinctrl)
> 
> GPIO_63:
> * UART qup16 (?)
> * SPI qup16 (lane 3) (?)
> * SPI qup16 (lane 5) (?)
> 
> But the GPIO_63 looks weird, is the data sheet wrong?! Where would
> UART_RX of QUP1 SE7 go? Maybe it should be UART qup17 and SPI qup17 and
> then SPI qup16 ??

GPIO63:

QUP1_SE6 SPI_CS2
QUP1_SE7 UART_RX/SPI_CS0

Konrad

