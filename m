Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8086734C9AC
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856170; cv=none; b=dCSsoyzUilumBjdl8QwLLczUCxC+u2mH1529D9C3IWBYCOAv4vrqWX6Gwu5EMXBPHBnugbwhRHeUhQ/yyo1xo/gXsyFPDiLyNDNS8gcx3jcJZOBoFOSutd0/Onm68UjdLz4OreGCI5Nd5HqluEAk4++B5QTZJYhfJXobeBOYpL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856170; c=relaxed/simple;
	bh=72JoqMwsltRpT3zFcFSpN5Ws5LAlNF76SrnTFwccfOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oclfle7l08XntE5ce0E+0QRI2EjIHdM/kxFKTRz8atSMJF86yHeev/EyQWVOwNI1kkLzyR+eZNppUbGdqi+hXLbWuaPpsPqgQEiRIm66z7EHFkytP8mK7ZhPZQzRabb3BoSTrRyyOfpJBJTtHB72wLe8A2kfoG/Gz08WK2yg71s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bu7XJdGQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKpA2hfr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bu7XJdGQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKpA2hfr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96oB41077703
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSwLOQXLC2qJRoN4Zidcq5xOfdg4BnE9srb5BQnSaBo=; b=bu7XJdGQ9XAvJMev
	xqha4Ro8U66PLjoQKupSdHTSGoPB2NT0LIuh/vH1Azha3SfmBSU+nfpRvlW3GfeI
	9+bLcrEeGSZd1HupMaLPWrguUPe0/8RPQVYmDgN5hvxu7CMDxHOOOTqvb/n75HtX
	rZnoXvyXnRRGHOAxvavMNCar59U7vLyS40WYjB7q6NFZhR2KVVXW8mFvY5NIoJPZ
	VQLGO6dfA57xZY82oupWlD9NqbdVLr3FrzQoJ9oc7N4pK5TzxFp5Qd+iOkDt+4yu
	pAiqD5jCYmPIXW5bMERmEMXbd7OIPSVP0jZLBHFdkasou2jR6TJSWL6Bdj8lGpl5
	yEZbJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng34t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:09:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d45ebdbc9fso99854485a.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 04:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856167; x=1777460967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSwLOQXLC2qJRoN4Zidcq5xOfdg4BnE9srb5BQnSaBo=;
        b=CKpA2hfrQaaNav4AoNsUFfbBPbAj6kRteJQNv/Sjf4yWTxAGNb0oAV7SOcmxRSZCLi
         qaceuo/pJkbqgRr7cel2uSQ4F/9SaCqaGvLHiDcaEGrQwKKcnWTBRgelfb6Tp6S9LNlD
         7dkJ0RyUVrE0nkC/iAkHZC+f/snpkjeZH8MFRu9yJ1pILx1aBjPnHNUwydg5EpZfgoio
         mM84Pa3dN411GOU2Md4eILRHOFmh+yIOiHT8YMwZOEpeli7xYpYXkqI04XOGS7puveqd
         sorUmNmJjPA/DIxtxAC5vzVcMl54N+bGqjnG2lxTTw1A0jjZdwIQ6tVYxi28VE3qu2Lq
         eYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856167; x=1777460967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSwLOQXLC2qJRoN4Zidcq5xOfdg4BnE9srb5BQnSaBo=;
        b=aImmddcbGEZk4mxCM5r0AaRX0sZwGeP+Ry3W7tvJk2qiOODF5V5hgxyJXuY3Ym3V7e
         iPdpBtVwRBLZDsE3WnpcHCZw+ixLsDeRNnZodnvubPaAyiJZ3dktWQmEha4bMthArHIh
         8SFdbeEShQ+9H0f5UxNhQiejnLPxNRAds1kzXHbkQAiwPKi9iP9+zeHteOraXnwEpIgI
         AO/hljanP7D9hqEzwd3SdJDIq+yJoWkeuwEYTtl/a4UZmXTAvSsHrZ125vZG2MfHDEDk
         gnJsuJcZ/ZA+ugy35g4clx/AV/oYoK1LVWAKJdYbhbTBrAsQezzqFtSGSBoJZJb+v2Va
         Xhcg==
X-Forwarded-Encrypted: i=1; AFNElJ/C4nyK3R7IhmD2uELZP4ujAhoeMorZwnqOnyVvV1O3v6oigbVZN5ZDth88bBBaQKAOqIEEvoj1XsCB@vger.kernel.org
X-Gm-Message-State: AOJu0YxhnR1biD4glcjYPwqaND6QzggTdl+JzIPKCcXy384+jn8UjYiH
	2ylJ8WdaNvpcVwp0kjA67BZJIRDIWzZXjqFauDX2wJ3GTn6KGPTdW6VtePmSKDSC3r2VP9941E3
	Cn5Q5EfzW1vyEWvaI1URJVTdjNVUIu6sptqccDTW+Owxl+mR7v0DCdsukLYhCE/4maSrcEZV1
X-Gm-Gg: AeBDievXbI/1m+jG1Ceo9YA5XXs8V2h7McOm5+Rt8d1CJbM25Yliban8vBNsQMVKzzx
	VooGsqPSkJezi+oPDCr4fBnRHO7Fzh5hrwD2JtaRlAPxaS/Tc6fEBp9CHuE64cAqjSS5SGOqIHV
	g5EigC74mpHJPin/Mv8D4NQ4ZbpIyUIL/s+6dF4X1MPnXs3utmrlj42XebB+srCDeG9nCSzDYDi
	O7OfOshzdHu4geX8BDLGTumLtZlcBWJFcAih4PYQp4DHHc89eM61ZOU3Jpj79lvSdUa+nlWOUkY
	uWhU+4iUiQUNfpU2gXmBmy2u6ug6ogP1/AdtK8pZPW0KleNvoJzkPitswQ63QbWqIIf/WXUn9Hg
	hLvZmqOZ+Y14iHxGrjx45oiDo3NGetnUUrN5dyKvgpFMRNspIZMnXQpP+BAo+xijNAX8BahxLlG
	oOBNd84GWLPfuUTw==
X-Received: by 2002:a05:622a:4187:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50e36c55f44mr204989581cf.6.1776856166788;
        Wed, 22 Apr 2026 04:09:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4187:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50e36c55f44mr204989231cf.6.1776856166307;
        Wed, 22 Apr 2026 04:09:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504379bsm526045966b.42.2026.04.22.04.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:09:24 -0700 (PDT)
Message-ID: <efa2da27-79d3-4cbe-ba3c-2446c6252058@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 13:09:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0
 port
To: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
 <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
 <8cb5e28c-1c6e-450e-855b-32491ee73885@oss.qualcomm.com>
 <3d50f17c-060a-4a1d-b539-1bea9b3e6cd0@oss.qualcomm.com>
 <79926b02-a892-4e59-b794-e8534136fe07@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <79926b02-a892-4e59-b794-e8534136fe07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e8ac67 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=4kRxOmAj_iLeT8xqhkkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: cpqHQvAei8guWcRhxCq13RssIVYqin3Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNSBTYWx0ZWRfXxhIyu/srH8Ny
 bD/0eCef1/Uvgdzk0JC1GfBsmyUEmiyh7y9w3LQ0+SvKygQ+SiLJdKnZV630Ypct3Pt97QO1LaY
 yLx/6Hcor8oxxxVRLMSbp+5aXPonY3F/GQEltZYKhlpquON/Ibwu+0NDnYlaH6qNtT6HSmWPowt
 vVBBgmTa9Eaptp2v/UqQTiTR5spIONZ8KYB04murmhmgfDKKvGcNy3PktIhPROqiUm320Vop91z
 Y1mdliJFxYrqtp7pQp9rtwV4BHKgw0DpiSiLXZkTMFf9xDp9tlo7sB3O8x9rrcJlObryUewj+Qo
 RcKIN73gaeOT4BRg1phDQUVZ7bEEz9j7vKC0kk08ABJ4g2r74tUtc1nVjiV/BIHn222VEt9m2Ru
 PF1HMgr50CvFnBxs3g+k6d1GJjyUcl6ntzKm87y44ujhFugPHMOVCzZwDbe/cKIc6rFUQHPxwWO
 oGYcCJrJN88w+Krp5FQ==
X-Proofpoint-ORIG-GUID: cpqHQvAei8guWcRhxCq13RssIVYqin3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220105

On 4/22/26 1:04 PM, Prashanth K wrote:
> 
> 
> On 4/22/2026 4:13 PM, Konrad Dybcio wrote:
>> On 4/22/26 12:32 PM, Prashanth K wrote:
>>>
>>>
>>> On 4/22/2026 3:56 PM, Konrad Dybcio wrote:
>>>> On 4/22/26 11:39 AM, Prashanth K wrote:
>>>>> Add the retimer for usb_1_ss0 port (USB0), in order to enable
>>>>> super-speed enumeration on that port.
>>>>>
>>>>> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
>>>>> Cc: stable@vger.kernel.org
>>>>
>>>> This is a feature addition, not a fix
>>>>
>>>> [...]
>>>>
>>> Sure.
>>>>> +		ports {
>>>>> +			#address-cells = <1>;
>>>>> +			#size-cells = <0>;
>>>>> +
>>>>> +			port@0 {
>>>>> +				reg = <0>;
>>>>> +
>>>>> +				retimer_ss0_ss_out: endpoint {
>>>>> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
>>>>> +				};
>>>>> +			};
>>>>> +
>>>>> +			port@1 {
>>>>> +				reg = <1>;
>>>>> +
>>>>> +				retimer_ss0_ss_in: endpoint {
>>>>> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
>>>>> +				};
>>>>> +			};
>>>>> +
>>>>
>>>> Stray \n, but you should really have a @2 port here as well.
>>>>
>>>> Konrad
>>> Can we ad port@2 and leave it empty?
>>
>> Why would you? Just connect it to port2 of the connector under pmic-glink
>>
>> Konrad
> 
> Because the port@2 of pmic-glink (pmic_glink_ss0_sbu) is already
> connected to usb-1-ss0-sbu-mux (onn,fsusb42). This is different compared
> to other connectors.

Are both the SBU mux and the Parade retimer present on board?

The former is redundant since the retimer already has a superset of its
functionality, so that sounds rather odd.

Konrad
