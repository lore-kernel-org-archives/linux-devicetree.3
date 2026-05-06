Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124F83DFC92
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057373; cv=none; b=HbOkeSR56v26JD2C1yAoVob1dSl3kmPeX0EH+ZgEpQnDOJq/Zed/QNV/oRIgJE6ifdY8PT9n4lGCtCgTp8+Vcrkj81hrOq5O07RWh9iqGK+vrB419bsRoJggGfIZ15ZSQa59PbBKiwJzdQpU9T8Q6d6w9LLVPy5D2cCS35MPLxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057373; c=relaxed/simple;
	bh=eWYUYSqjEvr/QMLT2YP/YpMa6s4scjiSIzUTffaAKkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BMJklWp1h8MacWWMRV3PtqzCw8Nntfx1mcsi27+h0lk+8gqQDMg2Dt+6w0DJEqBMH4wpAOdp38iAx4Av8jPtfHT28SLeZftweFFPqfMgRSNx9chmCVgeS6F9iAjCgeaY3YJjU0q0uhjNQIiQa+2tzwoezZS4Ci1JI98DDiy+EhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmhLMP/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfWxnkKU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmhLMP/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfWxnkKU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467ib6I248294
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 08:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YH4OPVhdNQZCgKS3VbLo+nyuFWSjcm8vt56FMlPc0L0=; b=nmhLMP/ykkPgHoPY
	6fq7dTjcMeENgamh6y+u0mSScFGAucg172BWIDP8CLcEv05NdYwsOa/7BWFi51q6
	vLV1cveXf7SEvRg4Wa5f5HkzmTUXTKHC2RXI57GG7yIXYVrbpYeg3BCp8ocP/OT6
	sFJ6//pI9SvGpATg9EEAfbTEqfBt+Tklz6IdNEDVs0bX/V56I+oKmmoQZRpGsJrx
	+Wty6irZGiwRfet4EnPWLMosDvgwMuIq3rvJlq4NGmvdbCraFxKiXuSFTdBBIDbn
	5VAtkOC+oO8vYwioarlmf5UBWlQv6NlSnbVzELfyWqmMmvdKWy94EOw36AfWDO5W
	WHrBfQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyjq43p5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:49:30 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so565540e0c.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 01:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778057370; x=1778662170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YH4OPVhdNQZCgKS3VbLo+nyuFWSjcm8vt56FMlPc0L0=;
        b=VfWxnkKUDPPg0XGH3V7PtkggN6qX6vVQxvxaCciKQxnJ4V/QpHpKT17jQBAnNaXqAi
         XiKz0hZVTCJ4XW9JJ3gibLBym+ET+r+h5ggdSbj8O2G9MQVg+s2fvF8UwMDxclzfo+WK
         k/Aka7gK129QOQRkNXp8uIU4QqfqfXS54YGG8Iwka4e3ytyzV+Q5vxZ2LC1sWFKWfDHX
         RixEOT+ADlJ3eKL9wBTh1W2L2MOqm9WPdvFgFXCDpjW+RqzVhpPneCXq2Q+AjGE2YCe0
         jfksdn+68rwJ0MejzJQwIEvNrRMJgsI6qud3c7icQy/97PaXqHwrEZYE0SlHTfjj1yiY
         i+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057370; x=1778662170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YH4OPVhdNQZCgKS3VbLo+nyuFWSjcm8vt56FMlPc0L0=;
        b=MNQ+3TRV2TSixdL/kbTLkFcdBdIwIS83X4G6y/C4jjQ5rmS1g8yAowhZJo5hvYvIhc
         m+/PoTU2FjBSUIFAyIM3jCUjOPurYhooVCm11vpp0fagxvS35i8RXpKTbhqVqp2nt9Yq
         WUmpE2RS6HgzfVLOnjNLoP3LIEyjo7hmuYnpEYvFXfKpjg/FPHSU20WPyBoVHbw3q6fs
         fW3FmDlY3YSxElg4Nb0z6n9N0bt+Ou3U8oSYhS0AN8skVEkUtPS/lCizX5II7dyg4caS
         iWrt9wfk9CGIEBFvt3kGzBCxeXVUFzHs73KVBjLiZAiDokS2qtm31ZGBhCeJxk5woVm3
         Gm/w==
X-Forwarded-Encrypted: i=1; AFNElJ/RNtziNWNXxQ+E9Crz2Kg5sFrKtvcpdt43xdelg82quzcCFpg5FYEYwLKHCh613K6y28X1h7kg26+7@vger.kernel.org
X-Gm-Message-State: AOJu0YwsHAdpChVJv8CASU2B+dU3PGAvUkj/9n42FUT0ID6kv5ZTFoDc
	IwWvJqFHhDPTyn1tlsupVr5pKWTkIdijSMD2wysj+SXUB98PVy8gi+TaWX0kdINCo6ftbp+mLMX
	5rnju+e5A371TVQTaqCgH/OSVwnCSQWiz/IH45AR24r6MYXM8V0VBgr/egFGSEhiQ
X-Gm-Gg: AeBDievzZtHBZD6tCM24peJdDYwVXu5LALOvpJAqbeYCcXhr1KpfTcDWfZXdNntqLgh
	nUzhIBmU8/7s1SCv6tPxhPL7fieqSHUHwEZ3PujwXmqZoeI1YeqTlG8JWFo5J/Ny3e5kEnX4RzO
	3w/Bs5I2LGNY5YWtWNSHwNHQIOuItAgrWTlJ1XiIzdL7KVQ/r9Gy5IVYhbGFMCGs1bkIDvp62JK
	XASiMTWOew8/C4M0HmOQX0M4pN6C30iPQAHQmdrY2hVnEUOvBCmugGw13pjs8Q9KGmVO09EImi1
	3EE60EIwPtITWKvlcVodPdNluYClE1ehpLNYch6f3P6ujPtdWzL2XYrmWYecfkbNHflI9QyzgN9
	96HnyZJSKfjRrAQILxAuMBsXOt+HtTWcdU0XKs95IZUbNXG1l/wbJG5Q+qZLWowv2YjO1xOoh6m
	8CghH5IPv6KteDyg==
X-Received: by 2002:a05:6122:2671:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-5755b4125a5mr189678e0c.2.1778057370373;
        Wed, 06 May 2026 01:49:30 -0700 (PDT)
X-Received: by 2002:a05:6122:2671:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-5755b4125a5mr189669e0c.2.1778057369976;
        Wed, 06 May 2026 01:49:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55b590924sm56572066b.21.2026.05.06.01.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 01:49:29 -0700 (PDT)
Message-ID: <0028dd41-d039-4ef5-a9f7-deb730a05b0b@oss.qualcomm.com>
Date: Wed, 6 May 2026 10:49:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>
 <20260506-imported-emerald-quoll-fd1ef8@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506-imported-emerald-quoll-fd1ef8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MYxcfZ/f c=1 sm=1 tr=0 ts=69fb009b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=R06K5KwXynI9bCKs9J4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NSBTYWx0ZWRfX7mBO7ZOiEB8B
 OmDRIrDIosGCDQs5ISTVeZX5DRZd3KrsC5Sr3y4gvBPxyUJpGkUA4nci83m8QLomILf+iGsck6Q
 yxC5NxuDFAYXmNRX4xpQ3Wb0zQl7/W68fnTFRa8Pdp4OYV8McT8tiU+DwU/UUoKlLud0JDD8WU3
 s2J6bQXxSymz8h2dFoRgMCDUZccoPlsyIqCpEm5S0rh1EO1T/Nu46XKrtlsXSLPkG6w/S1y5KUY
 TJ4I7wc+FBkctz3W4iJN7ReHGWvUY75rPw8YHTGbSUyaO0+vXxXfO4LPqke8wabVD5r4ANjj6Co
 cquHDwvTHTzzLr512Vm7kwNfLlQnX3vvSyQVGmoL9oR5Qv8DJzisy2Emmktq7822uWBBQkMNwOA
 bQiJpmGdLWGT6VMDXA8t8Xf0JfvTt/+jJ/bZuH1ij1uUaHsRRDFih3wUK0EZwhcjMAKdkOx6flr
 JVp+1B9Ey6xD0eO6O8A==
X-Proofpoint-GUID: Dd-3wYs8hrZoa8bMmTBQA5fgkNaMxCcW
X-Proofpoint-ORIG-GUID: Dd-3wYs8hrZoa8bMmTBQA5fgkNaMxCcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060085

On 5/6/26 10:25 AM, Krzysztof Kozlowski wrote:
> On Mon, May 04, 2026 at 01:00:07PM +0300, Abel Vesa wrote:
>> Document the Last Level Cache Controller on Eliza SoC. Eliza LLCC has 2
>> base register regions and an additional AND, OR broadcast region, total 4
>> register regions.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> index 995d57815781..90f5a54b76e3 100644
>> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> @@ -20,6 +20,7 @@ description: |
>>  properties:
>>    compatible:
>>      enum:
>> +      - qcom,eliza-llcc
>>        - qcom,glymur-llcc
>>        - qcom,ipq5424-llcc
>>        - qcom,kaanapali-llcc
>> @@ -341,6 +342,27 @@ allOf:
>>              - const: llcc_broadcast_base
>>              - const: llcc_broadcast_and_base
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,eliza-llcc
>> +    then:
>> +      properties:
>> +        reg:
>> +          items:
>> +            - description: LLCC0 base register region
>> +            - description: LLCC2 base register region
> 
> LLCC1?

Unfortunately not

Konrad
