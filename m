Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F7A3542E2
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615676; cv=none; b=agPWXD/yL1A/Ar7FYoMSDsNAi/5uFuOwN/D3dWF0Lc90W4XecrtVYxjNaLoUxyfThfybt3PuwQn0quc+7ixpkN2N7xjBWxXE76jVkkhUFs9uINe521k1GE//8ebrLEWllHXM4z+3ouy0UFY3HzEJErzFOyRBERHdFx7wXfE1jeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615676; c=relaxed/simple;
	bh=vA3uN2ML7GJtaLvb/dMgvC7ai+cMTjDlNlylEH6lWrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3eQyQ8pQOUr8WG357AILuzwYjO5OWQTDGLvB/HUHD+EWDouErJFz6KkByFZLqh/NGTmKHxcRzZ5Icoyv82QEf9AQH3lmdpgX/DiT0y7PnEZ8GdQ1KvtXBTxue2rXaX0Nen+A9jw89WY7ClOM7UBUTbWluCLy4L9HPASH+FZTw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p83FsuCh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjD+9plg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p83FsuCh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TjD+9plg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vnfn3713718
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WKEUDRkSeItXtXpqPiTHpqAYgm/9B9D7SnPy3ACdn0=; b=p83FsuCh5RKXu+ba
	WXmOcvqyHEoR8zESFxFo2DdKsMoIHBZPYf2WtMBKJ/jrwxkDQu47tkyxSZ2miQqC
	WYNmrdz+5GRO3gAtjsxud4Vb577CulPsLB5zGBk545pq4TUjGsG2zQdJCNm9vTul
	7mduuZZqyxi+Ioyc3iR3YKaRt18rgdnGsDpXSMFrKevpbuB1i61InjKSLcTv4qEY
	F90XvaxqrszDYSXf5Eb+FHEVpkqXlhiKiu3c8IJ6e75LtjLcgciXd0hJTtMeIalK
	+TH6I7igcCfRiTxkYGr2lcePK+VdtSoYA4hIDbhfP8zAS+Lw1YKL87DnqjQ9EzzF
	sIayVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5hapt423-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:47:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2d15c360so5148281cf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 05:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615674; x=1775220474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WKEUDRkSeItXtXpqPiTHpqAYgm/9B9D7SnPy3ACdn0=;
        b=TjD+9plgX71qnNdHaNpJO45u0mOaPXm+FwoFkOHViUYWxXAliQ6PbAL/eNyPZQjEwV
         cT3Y9g/WIS+L2SiUM/5XwwzANOl0wRVhXjdoA8JLftkoWlmcKIrWVMEy7lCyihNeZW5a
         QzorXckmMhppYrvFUb1kguuwoHSoAGSvQvd72LAcB/NA8nfu/iys7P8kkEu53FBB47In
         9IOvRuKRB5MBkIsDwAIwZ6InBm5FjYaYbV9k8r1YPJej6RoTrBUE+2JcKZFLUOEixB0d
         6AU9rr1GbBIlmRJIczuBPzt2gvZytdH4nNBmjqX0DI7sdGFxwDMLop6VhTqr6fZgFDFG
         2DSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615674; x=1775220474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WKEUDRkSeItXtXpqPiTHpqAYgm/9B9D7SnPy3ACdn0=;
        b=SXLVT2QuId/f1ULc8oaz+YVsmdpYEzI5faS24VRkXppBoOPhFFfW7HNUPc4NZetHVc
         xrvz7x06DFTKNzTaT/RTh53bDDZWcBym+8/W08KRbMC1lYgHGToVM5mzwnNpp5AK51gG
         a1b5s0fz9qCGR3by1vxeQ6FkpblHNOW+u+/gupJWHbzPFG3l5DPicR6OpVSLwz3xisrR
         +WkUUidN2ge8g8eoDqeoGkkzKqS7nD6R3Z+01+QZLuABRD9Q2/R7WDf7ymAVU9SUDyDW
         nACRKXYrYvECO026xhihlAPzBxDx6Yazb2xK45cltdZLWnoDWo9GYxJ4E2jAo863LDyB
         ur7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgehjRpCj9y8m/HPfis3bipX8hypLCQugXBdgKpnIoLLFe0u3j6/WbrHV+5arq2zjkmL8ds1f4wdQ5@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMCqom3BiuoZtJpHkeUoaMKU1qa1BFqvBdRtpfUD3nU49cjRQ
	yTwzJqgm/KUutAY3i0yU3+jfyfaY26CmHe58bIXSYkxWd9vthXhG8a/v2DNH+RMlf0mGq3KZu+c
	GIw6JFvS8YHHlUfEoYBRzDUn2jS0yMTZuDkQCaMjpS2KfecY38A4fHU6HEqlGzJUJ
X-Gm-Gg: ATEYQzx/nxxEBderbOMYHliZ1ZpQXC9GMKSQniifm8NaCJJMUB4Vy+aXHYGzPa+7WPm
	mUXIhQ36xacOWQgYg+ocrNuXkxulr6HXVb/LF6dC1A/AQCRpeIxeBiVRPMtbQPsYyw13L0QVe/D
	TA3L0zPHOoelZlxm0FDOKmGW8OMkH/HnHLWIJucJlOEtzJdpm9KbGtJ1Wlu01oJP96lUEgYSloC
	B/Ny8IHJk+cg+dCCK/BTqy/1mFumDuxYbBGsItSp9UKRAnRQ2TtVzgGawwh9KkuKSzDPoSdmBUe
	YYV5YnVQAoUi9M1cg0bT7eDRQYiQyqOlL4QDrki1vT8yycwAKOJGmi0/Phpt8Hpq2hGs8nPDQoL
	E0g/sGYMWviyxwf2lzF6A2l9lo+QBsNbjduDmOJpQf4Ux/XQo5lhR8v2YMHc5LRVKDkqxcC0Unq
	Jos9Y=
X-Received: by 2002:a05:622a:1386:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50ba39655dcmr21840481cf.7.1774615673879;
        Fri, 27 Mar 2026 05:47:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1386:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50ba39655dcmr21840131cf.7.1774615673384;
        Fri, 27 Mar 2026 05:47:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b0e41fbbesm1568517a12.11.2026.03.27.05.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:47:52 -0700 (PDT)
Message-ID: <e1228e6b-64c3-46f0-9087-81bfac4aecae@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:47:50 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
 <20260316-x1e-camss-csi2-phy-dtsi-v2-10-859f3fa55790@linaro.org>
 <b8d00023-ebe1-4abe-82ef-c8dc20f333dc@linaro.org>
 <f5c0c9e0-78c4-4c54-be10-c252715c36dc@linaro.org>
 <85483caa-5e62-4c66-b3a9-23ff7fc16f98@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <85483caa-5e62-4c66-b3a9-23ff7fc16f98@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c67c7a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=-UYcpfoDvQNaV7eXuvMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NyBTYWx0ZWRfXyYpm3Ckz4svE
 UXfCDlPJUX+VvE88v2pRbGCZq/iCy6P12PRCsXkC+gljd+nrmDRMjVSw5UXOEVvAms9csTvMOVk
 qxVeSGRdTn3I8XAWTa3YtnHQ1EiUficPbfAV96jN7uXh1UQ1aRnz89oX5yX1YYE82QKB6375lkf
 lpHQQfbJzPQD+U1+uEjo+e7yxWRfJuD/b3UeBkrNOZ4+rdXo7JTmnyT+CzuOflleud9fwha7V0C
 4cWxWgEx0goPHoG6OeE1lG62FahVrpRjrIcTQAbHC29N4ZubdyrmOA1VjB75q9QnfRYeoomQeBU
 ULeAtyL3So01Cd5CmYMkSVHKmIM8kWdHgYqcBGDX3ojieEV8Ml8wxcI5JIsytcwMk5llng04zZ8
 Ru8T0ar/GzTRlbLssICaOXDpxj0A5QrW7rc17c1X9m1kGoAT4WpBJmo3SZMdGoptKJFU4TuAo0v
 1yU0agXvx1oonCczjWA==
X-Proofpoint-GUID: 4XfEZ9L_zcKAzEvu4joY-FDxtjX6rvBN
X-Proofpoint-ORIG-GUID: 4XfEZ9L_zcKAzEvu4joY-FDxtjX6rvBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270087

On 3/18/26 10:26 AM, Neil Armstrong wrote:
> On 3/16/26 12:46, Bryan O'Donoghue wrote:
>> On 16/03/2026 08:28, Neil Armstrong wrote:
>>>> +    ports {
>>>> +        /*
>>>> +         * port0 => csiphy0
>>>> +         * port1 => csiphy1
>>>> +         * port2 => csiphy2
>>>> +         * port3 => csiphy4
>>>> +         */
>>
>> Hi.
>>
>> Thanks for the review.
>>
>> I think the above comment probably isn't making this very clear.
>>
>> port0 => csiphy0 => msm_csiphy0 in the media-graph.
>>
>>>> +        port@3 {
>>>> +            camss_csiphy4_inep0: endpoint@0 {
>>>> +                clock-lanes = <7>;
>>>> +                data-lanes = <0 1>;
>>>> +                remote-endpoint = <&ov02c10_ep>;
>>>
>>> This is quite wrong, with the PHY in a separate node, the lanes layout has nothing
>>> to do in the "controller" ports since the sensor is connected to the the PHY which
>>> configures the lanes functions.
>>>
>>> The PHY should be a media element in a port/endpoint chain to properly describe the
>>> data flow from the sensor to the controller.
>>
>> If I am reading your comment right, we are already defining the data-lanes where you've said they should be msm_csiphyX below port@X here maps to msm_csiphyX in the media graph.
>>
>> So for example here is how we configure this before and after the changes in this series
>>
>> media-ctl -v -d /dev/media0 -V '"ov08x40 '2-0036'":0[fmt:SGRBG10/3856x2416 field:none]'
>> media-ctl -V '"msm_csiphy4":0[fmt:SGRBG10/3856x2416]'
>> media-ctl -V '"msm_csid0":0[fmt:SGRBG10/3856x2416]'
>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGRBG10/3856x2416]'
>> media-ctl -l '"msm_csiphy4":1->"msm_csid0":0[1]'
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> media-ctl -d /dev/media0 -p
> 
> So a csiphy is a media element here, so why implement it as a PHY ? and there's a data link with CSID with should represented with a port/endpoint relationship...

Does it need to be a media element in the first place?

If it's just about configuration, then we can (?) make an assumption
that the PHY is hardwired to the sensor, and if we want/need to mux
CSIDn to the sensor device, which would then trigger a change in the
PHY (if the PHY even needs to know it's being remuxed?)

i.e.

the above sequence would have:

media-ctl -l '"ov08x40 '2-0036'":1->"msm_csid0":0[1]'

Konrad
