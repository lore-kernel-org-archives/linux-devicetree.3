Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542073815E2
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673140; cv=none; b=hEQ3OhzJDIK/nGFjbGS40hu760xiGMKxW7NIALkFXzjXqILXBFq+IrZlmps3mZhG0s0oRgnIeygo5Xwk6oD1wlHDsqEIYHlHkGTTiex+cAG5e2EmBSWFwN3uav7uKErehn0X2284aRKmRIWjAcBdWV3sIgdPaCReQjA/k3vonPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673140; c=relaxed/simple;
	bh=JWFU0CWiVaxC4xWODTFg+xJD//zWSKELvZIYum5kmrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t42NgHI0WdXQD3KD3yjGtMeTdAhn8HspF60xns80bQ4xw78oFjdOV05wpKjcsDvvpBHKKhuKKtZyb338yMMeEX68ISJpRxF7t2ENr3xmN/mbN+zV2he+lsjhTJmv2MnHEm23pMY0oKWeAp+0jiYGXr/dz/xV/2yTJXkcivbZPf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LW78j4gU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJ6RFWjG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LW78j4gU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJ6RFWjG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K6PatP699874
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8cub26kj783/irTOLcCnYOpgCqB62wW8DQoP4ADbaXU=; b=LW78j4gUFR1F2nok
	OJ6E3Z03SAI5hv41aK85ljUZLx4TDF2ql3oJloPPQNIpVoZw4aS38i/lY45seomY
	4VLmxngNH9NCw/S1Vbr1d9zI9QJZ14G/mkXH8B2cmygO5WoniYxF51aefuWQM3aw
	YAVGIT3WAbcTIoC8IHxNsVTTIkDuIdVilxBgKbjEQ1YDbQmcPhl7WEAj9tRYAfU+
	MS79r1EiYgbqt0exvgr9c4E+Lr9axdWjcbZgO0LMN4xCVzDbROEnR0GodS6wDpmf
	zW9GrbgJqwXykouPCG0FG0PP+P6UP/HS+EaSJ15NFNWSiWoAdCPDVAwkn7Uj2Sm6
	OPs7QQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34hcsg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:18:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca4966fe6so9310876d6.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776673136; x=1777277936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cub26kj783/irTOLcCnYOpgCqB62wW8DQoP4ADbaXU=;
        b=hJ6RFWjGzwmj/CDziP7TV8kB6RtnxEtQV4lYM8iTJgCnGd9djOchw5KXIbXug1xJv9
         Jxk67815aFn8Nh9dfgWuIYDBinPZOOotTo6Xp6mAu10YH8VWcxgTR1E7FoYbnHv+ZwEM
         TkqLCSAkY1f1JdGZGH+0Ma3h5QymgLPJPXeVipT5yLCFc4R36ElKUek32TZVRGzR5dd1
         gOC/MkXvjSaselUC+oUnpC/9EgTEyATHTG5aMv5NlowI9PsNUpQZ7oSZ1z1cncygj4wy
         wzsg6yyn6nilVYkbHWSs3sDmN1wDWK1P5aXM8HgBuEsYlzImkg1Cc9RzQaRDfe2WIL1/
         ++dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673136; x=1777277936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cub26kj783/irTOLcCnYOpgCqB62wW8DQoP4ADbaXU=;
        b=LUJ9AQ1FaFhwBc5WFVwvbel1YsD2l5Sf6JklMw9udil49+xSrwNhDXFJN3om1jsyB4
         qv8TsZHUhV+cHmKncqqJ7DIN86QRyoYiPXzK50Z5NYc+5iHPpTgOzpmXXmTeC/85mGiY
         eVsX3BN3T9x0ASgw1NR5ULtno6WwuF0bmeZ3xtTJjv8afojfX1BAwFzfzMDI6I021ceW
         LvxysWDk5NHR8v7reWqd9s524WMngysf6Cqx8SWYISXw9j+tlwDddXmK1kUKemmbrm7O
         d+JZRmfxqxFVAB6jQKOuiIzrLZPX1tjNHySQDFCqWwpj7C7xRY9DGuciO25hv6vbIFWl
         s7Fg==
X-Forwarded-Encrypted: i=1; AFNElJ+BnsBeqlxqil+RC5IugZH7GjCRLysX+FumpUdOhf/kljxkzP7NU/pFYRaJRPYUaCa8jVx52JpJsppN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx94vzD1hGJ1DqJhL8H/N9h7HzvUzzIW7VURvgUO+cqDyOBBKWZ
	h3d+BBOYpLMmUiuySG7KJI29T7xrvLkGvi4jL1H2fIESD4bAUjPCt5REA51px4jCn86DdWiTy5+
	ucQCvACO/VLaK0pUE3z1pxWIBegqUEC4j/RcQjFWw6JmIxeX5jwEPqBOevjDAWWFV
X-Gm-Gg: AeBDieunSERIPV0N24LDRoeHiBLKfP69lwjMMPo6yHEGAM8An+xX48hWq22K27q4lk4
	ZMS4c3I5IJ21fMIidCKtsF6Tko2EhdSVZ4LMNQA6vZ49xJRvdUFGn4K/Dg/fdjDa6znK7aAocxZ
	iJtCFJ5ohdSXSvXMoIxcK6XVKy9LxyLUpDswtH44k+uE07Gm863j3PHIyufpPNfJ1R4RD6MCNXI
	MMvrP9izKAxMZ/FzP/dXnGi/PFnHOZ2ILhPC/GG6sQMLaHJ3gC6X82RoosSP9Q2ljBf/9hTgscI
	EPD9f1wJivz7YxLZROYAL25AcrE1YLn2d8A0NaERJbPbw1CZP33uWWfa/fMAp7WyFCPnzs9oJPx
	a2vUfSKsmZcpZE11hH04CN5EZXhVXhyZVbJc4dtf1nFNImhkiexF1jcFxzeGtTNDUN7Hv+JY66X
	SLEKx9gjJHSCYIEw==
X-Received: by 2002:a05:6214:21e6:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8b028002f45mr150460826d6.2.1776673136608;
        Mon, 20 Apr 2026 01:18:56 -0700 (PDT)
X-Received: by 2002:a05:6214:21e6:b0:8ac:a797:ba39 with SMTP id 6a1803df08f44-8b028002f45mr150460596d6.2.1776673136212;
        Mon, 20 Apr 2026 01:18:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4550468d6sm322957466b.52.2026.04.20.01.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:18:55 -0700 (PDT)
Message-ID: <1b40b1a0-983c-4eca-bdc8-6a64cf76197d@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:18:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
To: Manivannan Sadhasivam <mani@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>
 <rqjdh72kncyjfkpfo5ymd3uvyy5bzrqzpomdbggobk2spcfpwg@irlwojm3eme7>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rqjdh72kncyjfkpfo5ymd3uvyy5bzrqzpomdbggobk2spcfpwg@irlwojm3eme7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e5e171 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7OZ-WDDc3zNUe51q9WUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: _UTHDZ0a10QLi1ce7EgZXKaC0I5c2mJm
X-Proofpoint-ORIG-GUID: _UTHDZ0a10QLi1ce7EgZXKaC0I5c2mJm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3OSBTYWx0ZWRfX9lOCGeZiG7bq
 SZCCuMsGUAbAJmIJsRQw6/SLXPOL0Jfy7P3cj34XUhsD6h+pWKQa7vyFFxy8NFFfKveTo5IO9k1
 bLF9JjYA7Rw1Eh8Uv7wYcpBX+A5XPsZpz5BSEmzlZQGUY31QA1Ymimcma+KewRu+vpTNYqXvdfD
 xYecEeucDZmuKX6UqujUAn0201y5zgrWHnUv48nMhcM/Ocfhk3ODpu9JmXE72Ay095UTYeTJwtq
 +GHUO79OIhvasd7qjQ9rVU/bemrEWxinfcPDIXuopvKxw6eh49M8yG6FvtOpiQ9F/DUy4CzAN4P
 EBPmlW1ACrz8fGHBF87d6m9TZvIvcw/dughDh2GgGggSvlPXdIFIqpBa2l3b7sgma4K46UV04jj
 J3gY0YhL8gd0uFDhp88/5Z1tmAaZoolYvppAQAWuaKqnVB49tAjHPgw+rpRLPPA0mB+qRPzRsTb
 jiIPJITNH5RukL6iNjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200079

On 4/20/26 10:16 AM, Manivannan Sadhasivam wrote:
> On Mon, Apr 20, 2026 at 12:01:41PM +0800, Shawn Guo wrote:
>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>>
>> Document Inter-Processor Communication Controller on Qualcomm Nord SoC
>> with a fallback on qcom,ipcc.
>>
>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>> index f5c584cf2146..0a86230a2b18 100644
>> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>> @@ -28,6 +28,7 @@ properties:
>>            - qcom,glymur-ipcc
>>            - qcom,kaanapali-ipcc
>>            - qcom,milos-ipcc
>> +          - qcom,nord-ipcc
> 
> What is the difference between this and the existing 'sa8775p' compatible? Are
> they both representing the same SoC series?

Nord is a gen newer

Konrad
