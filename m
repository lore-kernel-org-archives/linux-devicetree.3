Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5BD478842
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843641; cv=none; b=P1sycnpfotrUhXBiu/riBKKEaSmcUmdu56RipA9sWKGmAde6w948mSJHVBTy9k6tkgmS3b1d2+sLH9fbmzS16UlexqsKdN97JHtbUXKYFzX6MSYlEG9SFqoBppy+lr59sKDnYuMc1kII9UDCpJWrzb0vIX18VB9bUwObexZ2xEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843641; c=relaxed/simple;
	bh=b6fAS5R0MZdbkQE4ZTU8n250+XpH81ELy6U2EHe4pjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PleGY0MesIMkgei+TLiXwIIUv0AaGXt8wL8dbXoMy1aMu56lLmrus1hIrZfhwrTiplgFdI+csp7Od+gQEtn6TK/q3qF/E13KfFlBqq/BQiWomttCplh+ZDK12evJsPiv3Lhc5fIOSrFUPSHM79x2lhkuVtS8HfuXH3FZm2XszM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwAAgG6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrzy/XzK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwAAgG6+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrzy/XzK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB7DxN3200311
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qcnnBtD0bTocfS/XZzFNZ3R4W0jt7W/pmdR8q1gCj88=; b=BwAAgG6+1Z5S2VM3
	HE74i5ymWDPszaEmGAMUGFOKIxIk0RXFIHG/yIYTe4J1NatFGfPzJnOZ7WPZaACq
	JOn+l5YLuwUV8U0oaqj2KURGtfAWk7Z7XThmr74utk5v1TV7agetVXdWs4MYM8JD
	IZKYWFkrVHR6oNuwbto5YgzgwiQwsgT1bbOMJ42a49U3dW+93/GAzvFjoWeYFk8E
	hdPZDHL4Qm48KhvYd1uAGf4t7CQfEhiPE+0ewAoHD6ri2A8dwfz0YwSMzwj01Ikc
	UciyrMV1V5a9Ot2gUFS2gHe3V/sfSY+QJNM9qBfQP50e8Bglreu43tUXAufmCuu8
	mEAtlQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qtxjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:13:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50de6db1eabso20421651cf.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843639; x=1779448439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcnnBtD0bTocfS/XZzFNZ3R4W0jt7W/pmdR8q1gCj88=;
        b=hrzy/XzKGChT6hZDggt2xYZA9gEdESkE6af5S+tpl5Hxs0sKmUzsbN/alZoT1acELn
         PJULN9c0UZrvOkmMYDKcCUZnc0gpdkbzG/6AEwJRp7Fyod9SG4Y5jtxcI2kWtHOWY2DP
         jaG/yU6wSDkMrLK0IMbmiDkb+dvTFDleY0YOnFMwySv19fBdFt6f+6ymubhCm+Kg0OTN
         G6Dgf8BgbNjxVwtnQx9ACC1LhM4VmzKyY6t563Rz825JhVnSpC/OgSL+xOymYbRgdhXm
         287/0MQptNxio7JprU6RAoqu0G7F7eq8tK4sL7Q/hcmfN5uze7vzWvcB+3IFHRERJJkV
         87CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843639; x=1779448439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcnnBtD0bTocfS/XZzFNZ3R4W0jt7W/pmdR8q1gCj88=;
        b=S8nAEOsbUjCzsXQ7SznrUnaA4JBupF9a9hyNC+kVmGPdG2sWfS5nJS/rR91ZtuFUgq
         qK7jEP+3x8QDVkSxmXzhlsAkmVdCsJCLOK5VRs86hlwQ5o6CTM0ojnDgBxpbZ5vhaJgP
         DnQuzsPck9L6Njq30SXewa2Nb69Bval06TLfslv/Wz8+FtTerMY1K4sPxzskO92rG8ZT
         akqUJbJdItWBCC/uGTAgkjsrqRw+5ZaFECTPUHcT+VdViBqKWdimB+/6yRSm9tDyJRiq
         lnj3PDO9seMg6TpDhxCAFcivklLDHd4+ZC1vrOzLRUbiQvh9Qr9V1mBOjNo8//85WIp0
         icaA==
X-Forwarded-Encrypted: i=1; AFNElJ8SDLt8QLq1tyQbPU93OHpXPXro15aZuNazbaJzNga/G7D15EozCEk0qjZB1QkSmNw9KHOpgu/WK+Xa@vger.kernel.org
X-Gm-Message-State: AOJu0Yykryn7lDrHtB6LcTKq+ZrhbMRtfkdjNRr59o6WAhiTCOdUUMyP
	NmYt3Y0uV5X8wMVB2p2fGjGFaspBbBlqaqOtvotEkrnxLOzJ1hVB3vRSj6TkycVDVf7EnIV8Bvz
	Nitz4Rj7et72M6BTtsLAHu0Y+xs5ITQO0IcKn4c61SmIrBjhfHtXW1lV75Z9aL08q
X-Gm-Gg: Acq92OHmfFae3JY3dJbkpgSk7XeN6uG8rtr4VswF9S5xrdRwMvIO43qXLcRteKZDZQe
	dzGPBtdiHCHnMpBRN3u+2TsSyI6Ye/a902wdMopT+bQ9C/vHSuTvFtLsmrmDujwLa3GjI7itis1
	HpmBdhtq/D+aBpV7LhSMfzduqjIXNYvqFTwpADIQjpeFbg7dqT76l+dTrZynefGqvkqt1L67Hrz
	OnFVw2SpqiUvtDIIDnYdkWUOJpWJAG2sWtJm5lQQtnuKkSdAeLY6MVa6vzFeiyf5cgoh4xu/SCB
	1Q/TyTPQ65MeKRv9crZl064En37EVou95wtNe1x54c7fnE61jmv4TNordQtxngLS6HVKnO7UVXD
	uwedE+IWNtGSe8mwcdT4btEy3lU9BqJqDSSP6Kw10b96n0U10ulxzmCuruJSzB/6+jncIT2Sc3X
	SLlA4=
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr34330191cf.8.1778843638641;
        Fri, 15 May 2026 04:13:58 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:50e:df3b:80 with SMTP id d75a77b69052e-5165a26c9fbmr34329941cf.8.1778843638214;
        Fri, 15 May 2026 04:13:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831197bf00sm1883505a12.31.2026.05.15.04.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:13:56 -0700 (PDT)
Message-ID: <574a1ab4-293e-4daf-bad5-8dd886a8178b@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:13:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <57696ca6-42ce-46d6-9b30-cd5ad4378e25@oss.qualcomm.com>
 <d10fa5ef-4d2d-4fa8-938c-6ec74a823bba@oss.qualcomm.com>
 <e2c54638-2849-40dc-9c68-636c04719814@oss.qualcomm.com>
 <dc88df0c-0be0-4a29-9893-032d6c65a45e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dc88df0c-0be0-4a29-9893-032d6c65a45e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06fff7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DpYfqt6cvqRt1CeACwAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: CCXkQDdu55s8koh4byQ9whmvCQAL-IZz
X-Proofpoint-ORIG-GUID: CCXkQDdu55s8koh4byQ9whmvCQAL-IZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMyBTYWx0ZWRfXx24NvuBhGzl/
 dMUFFNxYZmXim6zd6O9ijdwGVWmiiqHFhBBGeYdUzVqx1sYUtzMC1RWVLXXj6rLDhRIx5hC6/Gh
 hHWVYkq77f5SAasfIEIQM3u9eUx5/iP3ZKk5v0t+cmFxCv02Ut/G4t1Q20Wg+VgS5u/5SwGtA0+
 kOjhbO3zErBNx9bWZaxrBq6XSrUlGh61qfi1xSosWRZ8eXDb+qSN8mvEkNnCg4FhLEd2jyzRr4W
 EijwShAPEl124+VzDPd6YOVJTzcefzOzHVZHh8m8KcVNTEDDNXJ6l6hiLA3paH/AVFYkkELwKOi
 dNB9zR+4wAnebwfWU3YrdzSGeAVXM5rkfVMe/Te+So+gdeunkAvniWuXGwCkvv+dysd6SdHtlc4
 9MhyPkMVR+iHhCxQW9a04M7PRweOLMpKc62s87+I3qxYBi7qseJANHt4IcztVrjOiC0M5KO2hQu
 7oG1eTzbuTtoouMLUKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150113

On 5/15/26 1:09 PM, Dmitry Baryshkov wrote:
> On 15/05/2026 14:03, Konrad Dybcio wrote:
>> On 5/15/26 1:01 PM, Dmitry Baryshkov wrote:
>>> On 15/05/2026 14:00, Konrad Dybcio wrote:
>>>> On 4/28/26 9:36 PM, Dmitry Baryshkov wrote:
>>>>> With the default PSCI suspend value for cluster idle state Lenovo Yoga
>>>>> C630 isn't stable enough. For example it might reset if display device
>>>>> isn't probed early enough. Drop one of the bits from the PSCI suspend
>>>>> value to make C630 work in stable way.
>>>>>
>>>>> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
>>>>>    1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>> index e41200839dbe..e6c67016552a 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>>>>> @@ -347,6 +347,10 @@ &cdsp_pas {
>>>>>        status = "okay";
>>>>>    };
>>>>>    +&cluster_sleep_0 {
>>>>> +    arm,psci-suspend-param = <0x41003244>;
>>>>> +};
>>>>
>>>> Is it better if you do hack in a
>>>>
>>>> qmp_send(qmp, "{class: cx_mol, res: cx, val: mol}");
>>>
>>> Any clarification? Then I can try hacking it in.
>>
>> This will send a message to AOSS to intrusct it to prevent CX from
>> collapsing
> 
> This sounds like a dirty hack. I think, hacking psci-suspend-param is a lesser evil.

Yes, that dirty hack is supposed to help us understand why this is an issue
in the first place. Especially since it only came around at some point
(although I suppose you're not really happy with spending a day bisecting
when exactly)

> I know that we should spend time on understanding, what should vote on CX instead, but having the issue only on C630 doesn't really help. Maybe it will go away once I can sort out the gcc / dispcc / mdss issue on SDM845 & SM8150.

If it's a "not enough votes" type issue, it can vary from device to
device, from unit to unit, depending on your luck in the silicon
lottery

Konrad
