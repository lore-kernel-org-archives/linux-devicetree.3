Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E1425CF7
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688241; cv=none; b=YnmusGqgF16qVLRTVDe+iUfL3aMjOWqPbTO7sN01d1hv3vCyU2NjOqCu8Y/tDqDs8onvi06qQML8pETXyyOFDYYNDxrDcaABvJ7WBiCZZNCddt+sA46IibEsJmUyRM5lPlR+NIHHYsgRBc8cBjPVsu8cJmHtt/sBSAPyLzqxN3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688241; c=relaxed/simple;
	bh=sVZ6+VcHWJOzJjrm95xGZ/P7f7RZoBbxxZ3YrSMphgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9Ktr1826AuVo+XSiPRh76qboa1D2Cjepdl/JDlM55pHL0La7ZUPktizulodUxKb+yqp7rL3tGzI1XkUqBxUyxOgUFe4P9gIY8g+INByx5weaLYRIKQbn4rLfmQXH0W/Px/KtVV5/Y9u17etraIynTYxkWOK8U1axdQ4YHHM5EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILbE+9ac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YI5932qk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILbE+9ac";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YI5932qk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmheb393297
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Ig/vdnJDoA3VAq6xPM53WE0cMNwCVKWRxqZ5ZfCxb8=; b=ILbE+9ac+nbhnz5F
	MceIV5jl8IpWlNm5d2+VbNrVt7Zsr6FuC/4sa51XAsrYJZOMweAOYvL9AGBS/T1o
	rFYH5H2H2WhE446/pD3HrM0/lGa+qBfbCkroYCjdkUgK/56cpZZ7dxpR4hJtjDuf
	Dn5F/XmamezgZdXgN2SlmPoKb97bOtJzI/1jpZLs3Y9beCAxFYNc+SDk3cLm6GOq
	lmRn+VrE/jUrY5qwK6pRNBX2ttFK3/WHn2fEA5lPSmz48Trh607E719U1Q4nFCXh
	ndjtnrSQwHS0wXzy+QGLTS3vld5tG0D+wTh2Vtk2Fxw7HUDI0fiWvVrpF82BIcrf
	RAFmHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8kc7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:57:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso26415185a.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688238; x=1784293038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Ig/vdnJDoA3VAq6xPM53WE0cMNwCVKWRxqZ5ZfCxb8=;
        b=YI5932qkNgwEjH68t29g9FjER1xntUPycHJvrec8SLu1/ztEwCueK3RzeNfCEfO1Rs
         KAZ2cAOXCUxti5rhUsMI7rVGg6tUgG6s0auF29bZsSDfn27vmwNo1x3edC7GELkmu9zk
         BJlm3O/CD44MKhVr1sNRkITFC4VEAJPYr7drXHTlfGuuPNeF9mBoUIiItP6A9PGF5r7O
         EwcHUSFGx3HmR0kMh9M8u1VNFlwmRT6WKarBTu+7h+mqPE5HhQKN6Lmj679AEy01GcFW
         ysmZ3uHNeHMARq2rFaHAav9mjPyZ2QuReJQdlZm4peEzV/J2VxoFkUeSYYBtn18/vgw8
         fLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688238; x=1784293038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Ig/vdnJDoA3VAq6xPM53WE0cMNwCVKWRxqZ5ZfCxb8=;
        b=qDTt6fRRARzWC+c/zkdYuvVBO5uVfmRrF6NUII6jyKlmnbJ3XauVYv0VM3/vhqYimA
         84QZhuDTExgf3U4WSnnfd5pAbOH97kVB4uNax8n3ursltKSYXaSLmn/zbcz+mdBufbo1
         vhqGLQQ1TJN9jVp4eZ4RO1WoIMR7w8gDRBOiseeDFxDfMdZi0nsQfDReUSAFySMxqmQz
         lkUwNH5haWcVaGyROtK6u3BPlK6XXCFDo7RMfA7o8g9r+QtNmzUczMDVY/ffi8U3gPU0
         0FtNRlHP1Qt0CuafmGrBS9fOs0JAyxaokFVMnVa1xO4NdRmdxeNRJfoyZw+dpu3vbX6m
         FNqg==
X-Forwarded-Encrypted: i=1; AHgh+RqUXrIMwU5tsIXTuU9sVPDs5618xhUutCNAS0rPxmFNeB0mYazMzvqn0hBzRLEoGAO4TxtYKazvSr6h@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ4MKXYEU7MoRtHFYf2sXtFGeVzApLioELOuOi99gbkV2EvTqz
	8C/Si0I8M7Vkih6HxL1JMfH3U4XGLSc3BQYKoaEfQU1KlNlhdgJ540jNyS/cg90CIZiebyaCD7u
	imLmeYRJY9zp1p1ZfkTO6e2Ok9rBXAdSnlG9H5xkAw6PE5FnqNxA3rkVyDZBX2UhP7xQ6CVl8
X-Gm-Gg: AfdE7cmzFAWcQ0eAeScFjnPWV+U2LLd8uE++sU4fUunntdEhGrVhsbDT369z9j0KDv9
	T1Juv7H6Pe6wgonPGZ0cpMrAZcJyCvf9zDI775SCJ5HCiQ/dFyXv7lQ3VW/PV9PhMJqHdKqdfDX
	s27CoUwxitSfc/f6ccvts2VvEf6tJGQi9Aa3aqKZj6sLdP5lZhXht690QD6c0DBQLGL9nj7s+KQ
	IOSVYriArYTJve9x1eMSWWB8ckrwfdO0DCDE9zwQq0DkFZN3Kt0FdpyIiRNQXOgPzXAzQCbvMGx
	OlX5gQdv0GrYtI6f1RHqbcgUePmoZ09ZtN1NR+xg9ugYkPVTnY5qNc6JEQC1I6A3TPRi6GEmSZo
	5dW613VRpgRUH9f0n3J/INmwlkmFXL0XPYjY=
X-Received: by 2002:a05:620a:2a10:b0:92e:6485:f640 with SMTP id af79cd13be357-92ed7967da4mr720923185a.4.1783688238115;
        Fri, 10 Jul 2026 05:57:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2a10:b0:92e:6485:f640 with SMTP id af79cd13be357-92ed7967da4mr720920585a.4.1783688237638;
        Fri, 10 Jul 2026 05:57:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84483csm635119966b.17.2026.07.10.05.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:57:16 -0700 (PDT)
Message-ID: <aef3b873-38af-49ec-81ce-ea8b0fcc5a39@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:57:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <d7322cb1-1c8f-4c81-a3c0-638d60b53230@oss.qualcomm.com>
 <6tli6ulvne6wutgekr3c3knjagsd2ththgoej4ymh7i63ldzsz@4wcy2pod4bzd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6tli6ulvne6wutgekr3c3knjagsd2ththgoej4ymh7i63ldzsz@4wcy2pod4bzd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vc7qi5kn6P7tUwc_ymccg1N41zJbacMN
X-Proofpoint-ORIG-GUID: vc7qi5kn6P7tUwc_ymccg1N41zJbacMN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyOCBTYWx0ZWRfX9YGYeWwSwrxV
 3V+sgh/Lums82RQYaSVFTRt89NZGEOBi7HSp61PM6qRQ5Wl8zwfVuwTtvrd7byi/EWKEzbnlsSd
 4TIf1fdWUpo+1q2BA+XfSqol8YRvEFo=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50ec2f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3HzQtC_G-ZOHREKSRjcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyOCBTYWx0ZWRfX5xIK/XNhN1CR
 65GvcpCtnqX1MpCuIoj1D/28YMdaEsE9WXJyS3fHUDTGffg4VfcBaARLc/nqTcSXeiZSs/1strM
 k+hlMW17NNGxEzzAXLfyKLNyCvaSYc/DO6P12xsml34rYAqwD6Z9Q7heAlx1NST9OAkexcthbEG
 8edcMQxDIPApDF6fc1Q0vNqR3ve/nr9R+SovmRuZShYkCaryxT/wixiNhDz6+cK4QOIrhnpCSsD
 Bz6b5Dmp75HrLmZT4+8uLOYvB+WhiCHnW0ikBWhEuIzo4ybn214BK8mgXlNxfFdXCJTfAfCRRLf
 CFU3oKwHuSCJ1YZJEyU6g2T4afGMa96wP909xue+QkeHnVUBpT6RfxWfVxWwfZiAZu5Z6vV7+bl
 1T4JOeDGPjSOe2sqwP1yY0sNALfCaKp2tEcZQE7jYkh+p9QtTLZzQRBO5fXLa3rfhPWHvGL6qBS
 68Vghksrl8/mO58rW/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100128

On 7/10/26 2:47 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 10, 2026 at 02:10:48PM +0200, Konrad Dybcio wrote:
>> On 7/10/26 1:58 PM, Arpit Saini wrote:
>>> Hi Konrad,
>>>
>>> On 7/10/2026 2:31 PM, Arpit Saini wrote:
>>>> Hi Konrad,
>>>>
>>>> On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
>>>>> On 7/6/26 8:04 AM, Nabige Aala wrote:
>>>>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>

[...]

>>> I just checked,
>>>
>>> Normally the backlight EN pin is controlled by a backlight driver.
>>>
>>> However, this panel uses MIPI DCS based backlight control with no
>>>
>>> separate backlight driver. Since there is no driver to assert gpio91,
>>>
>>> we control it via the panel's pinctrl default state..
>>>
>>> So this is platform specific pin , we need this to enable/disable
>>>
>>> the backlight.
>>
>> Why would the backlight state be so tightly defined by the panel?
>> Disabling or adjusting the backlight level without shutting down
>> the panel is a perfectly valid use case.
>>
>> Take a look at pwm-backlight or gpio-backlight.
> 
> This one is different. The backlight is controlled over the DSI link. In
> this case there is no separate driver for the backlight, the panel
> driver handles it (it needs to be like this for multiple reasons).

Ah, OK I misread the statement above as 'this panel [doesn't use]
MIPI DCS based backlight'

Konrad
