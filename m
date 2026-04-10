Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1963ACF13
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810315; cv=none; b=Z6dnYDAYOOsh29lQimBoXU+jAIgHbe6CKzqCbezRaBrz/fVE7RS9IGYpXyW17AGE2RtcIrP3M8cYLWE45fdRjmClrIN8XVdLSzWd372Ny3PWx7PseYEavHxzGCI2HEp9ydziVkYsqm73Qtm002+s9N8gBhYLCjwDdioLcPLA2Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810315; c=relaxed/simple;
	bh=pcK0cy4d1QLHKuoWlb4imXsxURLwhcTmKyJq3/4B8m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgjywEwAWwW110H3/8QZe1cm4odMnToeaa1yUQpeUanZl5xke2V0eT+aItKDuxB75Ce/1W1yHMaW+fMaOw1sIE/acKNcX+7L5P/JtRo6wPGu/wwMAHu4RO3mc3K+jtmI9VtjOp/QOcWnWVLFXl8BoUicaHkLjtYW283Kv32dlwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNnmzlkB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MspDM5Bg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNnmzlkB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MspDM5Bg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oeQi709301
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyF6cs0TT9c7KJt5G+su0PloFsHOpnqMxU6VEDcmB7E=; b=dNnmzlkBDk/e7TbV
	d0mw7EEVXK67gANahGZyJNiObTHgT45/7fgyMHdrRjPKQrPCnThFaDmpeORjuP9r
	9i8NWnVZny5Rb1wf3Dyi5DIOAeBVwatqVrGdONwr4eZ4Mw+tsXQtvWf/J2RiGavY
	1yHXHFOMruU0QaYhomRB6tbHIhK4TrfvE0n8mulEtisqVLSnq/LcNcrQPIVBLZsT
	bmCA2N0DtHKmXW/7uIue2XyqVtAd5jS3AaKSjq1f7yr0wmYNTyLX5uMVMkn++caK
	qVh8xzCYKCpZ0kRY8wjN0VO4L3qnpMNHx3BYD6M6l6U3rK9MtTJK6iyLV0BAE0bm
	rrbI7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj0k76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:38:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d57516c889so2343685a.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775810313; x=1776415113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cyF6cs0TT9c7KJt5G+su0PloFsHOpnqMxU6VEDcmB7E=;
        b=MspDM5BgDKkSLBUi+QE842FMjdreDqqTv+hLVKz5KCcXpf66dcOsjJlONvNv5Nuy3P
         CPPcpq/f/iPDZmG6Zu94WLSOlQx+yR7wnWzuEiwKIb/xsIIFmeTbK4pbBEGMvSX/cnCo
         mQzQGX4Yhnfrq2aAuYX5uq1vvEaqeUzIZ1cJjybuoLuj0tdZul2H63++Rzfb+H2qmwj0
         hC3GEDb2Q2ur8A10Fiqg0i1T2LNz+zQm1mIT4zdwv8VHR0Q1cBnuHnPwdKRjt4Z0xefF
         QQvxa70U0OpVaCuSVkgY1Trj3nXwlK6rHONQnyvUXDDp2/Y5h842zU4msREdn17h929+
         t1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810313; x=1776415113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyF6cs0TT9c7KJt5G+su0PloFsHOpnqMxU6VEDcmB7E=;
        b=r+Bv2y4+fOyPdalVUETYV55lC8ypYW/WYkpP+OIk39gjCfiWhirwTV/EJ1vXU97hqC
         go2UYw0OhbAZshqoLwcdyCXTbU2XmjKapE7nNaSNwr7Z358ho2xyAj9JxEppujgv73Us
         KeZKDgSlr28ETYTCdqgf2HpKS/dmI3zE0eJxNyrzB30TxbCk53n1agFbiIbUK9/FXqna
         sIdWxhlsXoR8EwKppbSj5g+D4WQ50+u16Ps8mlyFZ+UpRPGiq9pe3Ev86vlx2UAg/7Qp
         xeJtz/DguQXtTq//KxvJZaT4AKUozkQdERPUOtj03ZWFwkc1g+GYT5pu2tZgp7lTp8rs
         EEmg==
X-Forwarded-Encrypted: i=1; AJvYcCV196pbDD9sTT+uvulu5IzTFlw+17oUZzY5/SYAdumeNkCcreoZB0o1laQlIiC0B0qLXF4gFjipgzKl@vger.kernel.org
X-Gm-Message-State: AOJu0YygeiFrYpU4XU+DLg0ww/lmPQqudW8E5EuiyVOXuOMqRc/IuocJ
	9tG7KW5xvVe8cewSVPRrEiIkc65uSflsx5kMTVlJ1g+UIwLezZtcAbNE1HDPW6uI+doAoKl7VAw
	cLyvwA81iBzesolfrndp6wQQGEgYb3SjmmJ17y6cjg0Wlx+Pl/uzKtm1FYskB8rIF
X-Gm-Gg: AeBDieu59eiArM0F4+vdT63I/1Q0wAvsxcACixsuwtaRa0U8M9cahV8yToqVVugc67T
	NUCidlw2EwWcSifKQ8uhBbyVgGoWRDCcJSVtzsBhQY49cPClsynCOaLfyj5uP4P+85cEAbCWZHr
	cfGEjIwiKoeUJWXgZY/ZAqd9H/cArMk2VY/QhbH6dVIq0WLlq9rxQRF8DFGa8eXqNRYXKTIOh/r
	vmmJG8Tj8d83ADdrC2JZCi5vQbeCNWcZ4nm+dQBHToHNBLYgT+O158mLW+zxY0CuD61Nz09MolC
	oF5HtQNM0KOeRdi5PB47mAwEzuNIZAjzrpJQulbFeE0cpUrYLJWjydo5IP+dmFAfa5z5TwBVLXg
	jzygkrMhBja9MioEII9dREOmFogR7SbLaOVmpoPpiThbfa6k8PfUOaC6z8v/0Gv4EAoqy58bxtF
	aO2GnqmGt8
X-Received: by 2002:a05:620a:2586:b0:8cf:c218:739b with SMTP id af79cd13be357-8ddcd6fda32mr272173085a.18.1775810312782;
        Fri, 10 Apr 2026 01:38:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:8cf:c218:739b with SMTP id af79cd13be357-8ddcd6fda32mr272170785a.18.1775810312268;
        Fri, 10 Apr 2026 01:38:32 -0700 (PDT)
Received: from [10.111.174.66] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8de94216e90sm3026185a.1.2026.04.10.01.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:38:31 -0700 (PDT)
Message-ID: <c9cea1d2-a51f-4c38-8ae9-db868b86a928@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 16:38:23 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: purwa-iot-evk: Add camss node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
 <20260410-purwa_camss-v1-4-eedcf6d9d8ee@oss.qualcomm.com>
 <765e4740-cf13-4d4e-ab69-c1abe1c39d34@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <765e4740-cf13-4d4e-ab69-c1abe1c39d34@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: o3xSzaaM69QOBrcanzYvVtSOGHkFASsQ
X-Proofpoint-GUID: o3xSzaaM69QOBrcanzYvVtSOGHkFASsQ
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8b709 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HSoUWuXAm51uA-1-LAMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA3OSBTYWx0ZWRfX7MeU4qZ1wFpE
 KXcs2DKAS+KeiwS3S2BmlJSNYXxUlqvs8NMoQ9RrXr3fi6J2L5IS/qBG9NfSqHeqUsKz4eFjwg7
 K+6c8CrFeluZyF+etPGOj3m0rEFD6a9OR+I0Cxht2iNEGmVbVF/wnJwj2ZN7xWaVo8161PKf0kX
 XjZ1MPNMW3jLUZxdMEia4Y83NYt9Pd0crl4KEYRR85A/GfSSiTXnPLzdJNlaZWWxEcGWv1uPcAv
 LYVtNQKL++q4cViZGcuVBXWI2Aau7SvJbR0YqXXL9/KhhETzmjdUfoZ72IuHk9o7Adea656WBax
 noHVdXmtwJuQXAzDPp9e3db75ZfyKuYl8a+PWjRQ23zFQRLsswhJK/36fnAJaVvd/QvMB5gGG95
 P+UfKfK4fqtXc8ZMbreNkmND2PP1Aw3Qtgd0PbKlKZcdTY0YyJSdFj/6dgia4p0SWLVE1sXn0Z7
 5QAvqUAYh0dAbjTtbig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100079

Hi Bryan,

On 4/10/2026 4:16 PM, Bryan O'Donoghue wrote:
> On 10/04/2026 05:25, Wenmeng Liu wrote:
>> nable camss node for purwa iot evk board camss tpg support.
>>
>> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/ 
>> boot/dts/qcom/purwa-iot-evk.dts
>> index 
>> ad503beec1d3d8c671d3564942a74c484de762d0..eef03f1eb2a950c06294159be3f97169fb487265 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> @@ -734,6 +734,10 @@ retimer_ss2_con_sbu_out: endpoint {
>>       };
>>   };
>> +&camss {
>> +    status = "okay";
>> +};
> 
> Hmm.
> 
> I don't agree with this. Enabling the CAMSS node with just the TPG is of 
> very low value to an end-user and doesn't "prove out" the CSIPHY, TPG 
> and RDI path - which is the minimum entry point in upstream right now.
> 
> I don't support less than a sensor at minimum.
> 
> You guys must have a sensor you've used with this board ?
>

Yes we have, but both not upstreamed sensor, we currently have no plans 
for sensor upstream, perhaps this work will be carried out later.

And ack comments on the previous patch.

Thanks,
Wenmeng

