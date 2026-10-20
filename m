Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484809;
	b=jYVmuem6rb/I7yQkUnvLgdkLjj82qq2Cq5FUgpJkSCwpv3O/NJq007hgLP3hRXlYA0aB
	 bEBpVMHTbQVuEW7ppWzbHIP/5aH9NwuiIhYgwnxF4BV8BuAEBVdI8NKRfBk8ebzX3tXZI
	 uHUQUcJ4RVgb8pelDGkYdvOsphh13k88tohFNZQXTc3bNP0LyuuqRV2moup2/+HipjM4Q
	 u3+syxmeIswsHkewv61xK7mikLeEpKmkY6fiREZuGicMO8K5ccEbmfcFDHPSepGOEMCxA
	 0P8Beyb7ecx3kCUd5x5GilgDhL9aZormyZdkT6IlC0FjMbAUqyzcn61SGkxHT21vKsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CFtFxHbDFiRPlcasZEvlvzwpY6ZQE81kNWfCGg2zSH8=;
	b=4bE4KMl2aXsz+qUxR4mO86W8QAVoMfkf0KfGSXx3NAkWytmHCHZyoqcHhyLo8qVFU1FZ
	 5d1+XhagVr9Zpatu9WevErgePohsR4qYIi3Tx4c3N853kRN5bgaJ1DFkihxCfMeg7EyzT
	 eU+spDZHZHbhT9cVrcCV7n3nw9kpvzNW5rxp5hpknRzAbh5rWsC9Cmy1UEOjYfrgqGjkJ
	 w2ox/zlqqy3rNqwrBPgLoij5YHiDVnymYU+pHO0EqG5XAxAEuY1gvfsB1P9XceBenUgnq
	 oguXjY+AxIhhV3hlzPL/FWZfxVHToArLOzoEutrvW/AnPP7yt0YxIA2R9bPZ+qtyvwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hg1K+ht4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ylx+hLwn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4AB606A332
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F4AB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hg1K+ht4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ylx+hLwn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K87txh1254986
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFtFxHbDFiRPlcasZEvlvzwpY6ZQE81kNWfCGg2zSH8=; b=Hg1K+ht4nvw/TKTR
	9pcR4obxqTpo2pNkEVYwC2lCCsWlKZMnbinoxHKeE0L+Ocnw0HbuSECOW9RUMO1W
	Lo2EnUmLxiu1Sb5adHWt3+h4dMcWjBUx4TVetLZxdxHHDysJ51cqn2jXZuI2tKWV
	wvbjrRkiv0XAyHKaf/CWOmyqJGymABRY7UEbcjGi7AFwliLYwa+0GTtkhjJw+tNT
	MPVAv5fwRJKdMl1ucb9NsnGk4PTuJybr+8iYHsFzECBl214JdED5Nb0pJuBiM0S6
	MmE5iunWmRQ/JlKSgC7WOQv3Cpt3EdMIkkyT91olpkWsd3ritEiKBNUH4fOgaraT
	NqlhWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9kpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:26:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so342352885a.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792484807; x=1793089607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CFtFxHbDFiRPlcasZEvlvzwpY6ZQE81kNWfCGg2zSH8=;
        b=Ylx+hLwnCgHlPUu+q+hmV4ugx0Q1UkGFoA+aPNCvwSHk7C8zwk+yJ6+4jCYKDheVc5
         pCghVfweQxZHYGFdZK2dBu0BIYHzyq5yBnJiRbq3MikSeEmnd9T5yFkF2f5wWt0ylKjR
         BPAd939X/76paGsuilMfqwdgeVYzDOhFs8Mx/KVbpSx3hhcwpFn8a74AGNao1C5SQd0J
         Y0fLn+lxH0EGMVf5Y41x0+ybLpCXJ/nXqxAe7nFBHZESkKbvJSw15nyoxZJuxHik5elr
         VKUUGxeNMKSxDuwe+mxewA/Y2/pgHg7OHeQDcrjh1MJfQvmfPP/xMHx6Ct9KQv/OFQGH
         mPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484807; x=1793089607;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFtFxHbDFiRPlcasZEvlvzwpY6ZQE81kNWfCGg2zSH8=;
        b=eE149lDoKYfH6Wqb0G7kHk+FAuC1CClSJ/IfyrbGz7FSOB+0uJETIp5+ehApcU1MMJ
         IRz6BcxwWYU2If73I6A5HYJXIio85aLEC9b2W7HGXragiWCcGx4/zDtyTTi+ZmVHnk/P
         oE9RYz3zBPJUxLpTjYJRj8Q/53Ln/tL/5zvuk18Eh+amCh49cWrAi66MbkpIhEvQxEqb
         9+8twTuWU5EXGuqrAWk7qZjQgn5XM+DdCPEHdPStb38rlKzeNm0nol7KyLXtUH9qO/c1
         Ta7ReD+fdKBMGcQyS/zUHTfJ5k0vcgcMYPSIoaaIN7rlpizAKepQrDiPpGyl6HZYohyv
         gHjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoAXt83NjD5WMHYYAGKkmaiDbl3FFgErtcOmpv0Llv9pjibptqvHV2dqxaQLrnQnIiVh32qVXb4hiX@vger.kernel.org
X-Gm-Message-State: AFq9FYLA06gd8oBa3T7QyObYLI4otXvvnKsFuFqFPKnFUQ0b99Dtr7yi
	stn7YA0ZYmXcdlF2Ru0tTCrRhcs7Z4lTSq7qghNrsD9qPY4hkzDo0RY52KpCbbwpURrqgSOJ9Vc
	uI+xgXgZFDvtJtvSxwqszDMY+WuXPp4D8AL+sLewYXs4Qj9M/M6il6YFwV8eYWdc2
X-Gm-Gg: AYBFou2JgKSwFdxjQEgUteYkjbMTJg74/8dLMh3C/Dk+f26L1rDwwrcOoyzZssjNbK4
	Av5icQXfnOgmO1EMxh3pkQb/R9l5YB2n94mYH624QX2P5X+2gJD8UOY6wf3GZxuG9K4wpwshtDe
	k2jkcD4TPMw5bFAqJxKb8eGlQJRg0teWzGBqa8TFU1davWIIsDst86e7DKPo5w9Q5YM1441H12P
	WlCiH3NXWgUi0XAgTVnJ/+SrcTN+uI79rxp6/Rd1D9UeBHUL+v94d7rRm88if7mdDLhZdXhsQDA
	wnwaWlNpIss1yOlUS6Xtoyq/JhZmdbnkmeqYsurjBaUpADxtbCc9s0YxjUsYgmaBMv96vSrjydJ
	ltibvVyAo/m7fZoeRzxNyxtm2NOT3FG0=
X-Received: by 2002:a05:620a:6310:10b0:93f:2ab9:729e with SMTP id af79cd13be357-93f2ab978b8mr1099291385a.21.1792484806589;
        Tue, 20 Oct 2026 01:26:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6310:10b0:93f:2ab9:729e with SMTP id af79cd13be357-93f2ab978b8mr1099289685a.21.1792484806024;
        Tue, 20 Oct 2026 01:26:46 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cd348asm57085425e9.11.2026.10.20.01.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:26:44 -0700 (PDT)
Message-ID: <3e5b7781-20ef-4e84-bb62-29a081c26d8f@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 11:26:42 +0300
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect
 cells
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com>
 <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sWVIfa9cDAIl00M8rH56BqXaXU1t1dh_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfXwJJmxMNR/vMq
 tJQ7wD9WcoyM9UkGESOoaabFY57n2oOd8c/NjrR6mPZrikViDCc/fJmlSET8YA0QkRMMFLaGcY1
 YtbMD7ZrDJqrHV94ebhELLd8PQ7Olh9SaYQhEat2gmla18JWpbgvMZ5BqynGvOQfJ0et6j6KDL/
 s8qO/2XLlSx0CUD1iefwM05e9zBEZ4HrvDm2gFqCv9uuGJD11rAYPp/0ogXQVQm0q/2kU68Kyhh
 zWnGcoqPL06f6W0g6OvqKd+2SbH8gl4H2Xfj7jXE8KSrnuoFi0ntY1XgEohKJlabKWfSNr56GZK
 OxuviMcKWqylEkC+ayODR6ILukK3aDCMphb8ui3Ue0RClk69GhHE9jashVqtzXwBrxghZ3IT9z0
 9hDcLelrXKNqd4u20OW9RhMnbnIs68Fghy7naH/ReIHIzHXixSg8WOw3kyCoBMfzSYTT7svxL6+
 1/HK2fJA8a+I1vqsihA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX0CBGvBi3pBPl
 oawL5sm+W+WU0xDnsok8qdXIRN0E+L2cvPqErnhnofdkEit8iI9cBpriejH2RzEyycYLHfnRj0R
 NCDzp/Ye3tI0lxuQRQLpG2LszbUPfuQ=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad725c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r4jdIUCLbnRwEHhwRoYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: sWVIfa9cDAIl00M8rH56BqXaXU1t1dh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On 10/19/2026 5:50 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 16, 2026 at 08:07:01PM +0300, Atanas Filipov wrote:
>> Add #interconnect-cells to the camera clock controller so camera
>> consumers can request camera NoC AXI bandwidth through the
>> interconnect framework.
> 
> I guess currently we have only one consumer, camss. Could you please
> include patches converting it to the bus voting? Be sure to retain
> compatibility with older DTs, which don't have ICC provided by the camcc
> node.
>

Before converting CAMSS I would like to agree on the approach, since it
cannot simply follow JPEG. In either case the camcc path would be
optional, so older DTs keep working as before.

OPP is per device, and CAMSS is a single device containing several VFEs, 
each with its own core clock and its own load. If CAMSS used 
dev_pm_opp_set_opp() on its device like JPEG does, every VFE would 
overwrite the clock and bandwidth votes of the others, which is the same 
last-writer-wins problem in a different place.

I see two ways to keep the VFEs independent:

1. One OPP table in the CAMSS node, used only as a lookup. Each VFE
    finds the OPP for its own required rate, sets its own clock and
    votes the bandwidth from that OPP on its own ICC path. The driver
    requests a separate path per VFE from the same "interconnects"
    entry, so DT describes the hardware connection once and the
    interconnect core aggregates the VFE requests with the other
    consumers. The rail level is not applied by the OPP core in this
    case, so CAMSS keeps handling it as today.

2. An OPP table per VFE, attached to the per-VFE power domain device
    that CAMSS already creates, so each VFE calls dev_pm_opp_set_opp()
    on its own device. This applies the rail level as well, but the
    virtual device shares the CAMSS of_node, so it would pick up all
    CAMSS interconnect paths and need indexed OPP tables in DT, which I
    have not seen used for such devices.

Which one would you prefer, or do you see a better way?

Best regards,
Atanas

>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index f975c2183269a..e923c74dc1435 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -4675,6 +4675,7 @@ camcc: clock-controller@ad00000 {
>>   			#clock-cells = <1>;
>>   			#reset-cells = <1>;
>>   			#power-domain-cells = <1>;
>> +			#interconnect-cells = <1>;
>>   		};
>>   
>>   		mdss: display-subsystem@ae00000 {
>> -- 
>> 2.34.1
>>
> 

