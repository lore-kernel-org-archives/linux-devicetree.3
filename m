Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670AB368D46
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830805; cv=none; b=qC+kiTT+8qkFyD2rMRCrVlvjXUpCXRTAcv2vD0nrywAepEfrpXJLtfmSE9U3VBrbacc85bINUYFtFTdOJq6C1qX9BijnqN/FRQgWQyd0zzEEuo6/vsCkKFPqLZZmc+aGpTac/YCvfpJ7nUxKgmlcngG9UhpeFWzFeDDVYdfEEqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830805; c=relaxed/simple;
	bh=ehcxL5HeeJWAK/5s32YamGLKBqKKC82AhYE7FuOqU+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEm96reUk2BFwypW9ycncgQWcySFacZcPgDu4aTwmN2hxPmO+ygzaitn3VMicDL0f9KDW0S8XukFmAYLJAHJopDGbIIQu5yMtgkllj6i7TZ7fCsmjFLFox7piUra+vAaPVFa9mUeUDrOlCwScVeoYBDXaPGTNrZ1qyCsJQsER9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0wOhgnY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAgj5rWS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0wOhgnY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAgj5rWS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDXf92116546
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kM6XssLZS5uE8jkI5SWx0ezfn7uyBMeOizbquvZVlhM=; b=S0wOhgnYKh5IW2tu
	25zPa31Eji8X4pqfm4kffM3nmnyIHWqMESJr0aiaHw4TOJnV34XCSGMFRq/irS5r
	DjzbctXKUJTMymftW4sCUTm8g+nKYx8j9dU5uSrrvlHNit8xfHVQztEYJkCElCQK
	2uCFvrhirJFhW6FC50Zq6MDlzr/uy+KPnYID8zVqCjDBSLWxun8dozTLpfbxOjll
	cvWUuazbK8hmxqKk2dxc5h4bgsRrgJQRcLdKBl87MjzpC52KKlTg4oNkMUcoxeem
	+oJjObYZJ5KqhmFFAxQkZGVrv8xa6lmuXQUDVuapOuqRNl4p6qITwvYXN8HHVMb5
	5JX28g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j43ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:46:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1857417aso478011cf.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782830802; x=1783435602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kM6XssLZS5uE8jkI5SWx0ezfn7uyBMeOizbquvZVlhM=;
        b=RAgj5rWSWnv/nqhQOR3AZxPvLILrVLJug1prX0W+qsphRc2boPYcw+DSrINeMvtLO8
         SoMxLAqKT7xBBPVPMdEX3cdJBMDuA7UwVnvNiSnWAFcWDtManDKeFBZ/U6d/vU63wwU9
         RiUHtlMb1go3vqRiFFShB/ILKl0ip04u+fgqJFvTnGjgiLudvmAxAkoWqHxwV0cCOqJM
         fEvAMIct+st8syMzjyX1N4xdI7mG5ZKQ/nePZppZhzsWHLCHNzYfkx1PMN09J2Aihwhj
         KTeGPgUIgBb+yeohb0Vat4r5cfWHt9/VUAKwttGEVYek5FVxIqaUcQVhNDLG0Bu7bR4I
         4psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830802; x=1783435602;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kM6XssLZS5uE8jkI5SWx0ezfn7uyBMeOizbquvZVlhM=;
        b=cF3XnqYpXbtt4IcCivhzFUNjx/nCFRYrhOHGjYMCjCDzLpcQrbfLivN+Pm+iFs55pH
         k8BHD6ioRmiQ0HN/thLu50yAEbfkOW5u/ByX105b5vY7DnSVvj+KF34wqzEF+/dEbkcD
         pcfx0vaRa+eN0zZSzYgZ14V7+gWqZQpaTWD2ahgYxylhTdNSAZooZfJGbm0/nWmZVsjf
         WLejJ6Z3Rtjhnyev71S67RY3/+IOim+V1zTGktmTJq6kup96CqOkUd2w/k6hLTjS2vt7
         ysR6H87+Exb0hTwaowxTBa9Eil2ssxDHa2/CdM9q0SFA7Z/pNTwd2O7+gYcgHK76f4pP
         TDZw==
X-Forwarded-Encrypted: i=1; AFNElJ8T/xxrVi93Y7tb6YdlX9IWsElkhSJLuQ8y9b5sqVpt26MMHts5qQUX0LI2aV6NE0GcT84Qvxwyjt9F@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt4124Zze2t3QMV9K0QUZ0QRJzLNzne5apRaVoO03jPcxFpjOY
	neJg8HIce8eTJQzI1IgbCsyu6DdpWCsiefB7wnAdCGjW1GNVSToSpMXWyaedNLGBrxo7Y9TR+6d
	PE7ZITZDVDu9ZTRUm3twIH5T6iJPsEJiqLIqmM/TbBO3BQTf49AiHlmOKzToXiq9b
X-Gm-Gg: AfdE7cm+bprLOjQNlO8AEhB/qqUyaFaF9w9MYxb5y+22wAkbXj8mI1+MrNMg7N3ks1O
	toPUrAppeLc/ttU1Wq51EK40gM8nPjvYXvLuhavbvT4urpy2irh7v5KDD5CiNBpMTHuDWwTOWdq
	yh+ju9omNI1fahC2/rhSJ60slkJpZWt1oZu9ErSS5wE7BcQcwULns/uzE78o6pjutjg0tT4WO7F
	erSKRsfrPKuKpoYrKJrWVzs7q/uPCP84kBBn3ty/7YVXNQcFXGTfy7+oPQSADHpAsQMfjWEbjLA
	+1w+nSmpQGHU9HjzV5bNod5rsHMLbNMwooQN40IZVe2B/3cIH/F0yO/CpyTW1vPQizhqzemIWJG
	aq8vBTBQPGQ7YPLrQHptrBRUy2dv/+nexYPk=
X-Received: by 2002:a05:622a:6a44:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c1c735368mr6822401cf.5.1782830802430;
        Tue, 30 Jun 2026 07:46:42 -0700 (PDT)
X-Received: by 2002:a05:622a:6a44:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c1c735368mr6822221cf.5.1782830801985;
        Tue, 30 Jun 2026 07:46:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0df9fsm142087966b.35.2026.06.30.07.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:46:41 -0700 (PDT)
Message-ID: <f98065e7-f335-4671-87d1-dc6ea63a8085@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:46:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
 <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ok3irwX5OwFMNtZooi2z36yb4OQCMXHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzOCBTYWx0ZWRfX6m4wvIKqGTZL
 YTiKto+wD2IWgqJF4TZT4G88FLbACKCivdI3zr1UAn0ZaBQ04ZyafhGe/3IhHHkreA2BX69ElEZ
 qMU7tVLQcp9R4X2+voYbCwCFXTUCaEQ/r9ce/+jW4iyCEwjYUuibLwH/zNcHLK/Ktw5qryu101o
 6SlPJJKNj6F3H2kyEgXz/7AO0K9x9Mfp4+hW8np66KU7MSmIHfrFc3JJMKEFZspiYGgbben7VDp
 QrnjFcoBfg5r3Hcx4yGwZvtkXR99p4MOZCrobIIT+aD6asePDobexoPUg/koc5hzLaMlXcsBRlu
 C1dMLQD13oEMgd1oh4QXg8Kculna0dPAZM5XlQX1OaolYh5yKgIvYFLe7NTWWGSa8Arjy7R3NFM
 6U3YUGNX3SuLcAWeQnnlK58nXYXjS7TCEUcawfZB6b0PqIPfJB75m8Eb2oeUBNXWLgihdHXioyo
 k2FIeqKkZkP7UMjPtUg==
X-Proofpoint-GUID: ok3irwX5OwFMNtZooi2z36yb4OQCMXHh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzOCBTYWx0ZWRfXzJFL1x55RU2z
 FLYREfcRJWb3kmNiijLZaC8zrQMen15QMTGcUJAL+81GC+pJFXcOl+uaCd/XjALjLk4eXZP/es6
 RS0CEN9ccopndw9VhSSs+MyJ2mDpRhk=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43d6d3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KdbZC8JMYa_JGPUaySMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300138

On 6/30/26 11:52 AM, Mukesh Savaliya wrote:
> 
> 
> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
>> On Mon, Jun 29, 2026 at 1:36 PM Mukesh Savaliya
>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>
>>> Hi Pengyu,
>>>
>>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>>> also support GSI mode, which is highly preferred for certain
>>>>> peripherals like SPI touchscreens to improve performance.
>>>>>
>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>>> the controller into GSI mode during initialization.
>>> Why to force ? You can directly configure in GSI mode. Note there are
>>> some configuration done prior to Linux bootup too.
>>
>> Sorry, I don't get it. how? I know there may be a qupfw, but it is
>> impossible for a normal user like me to generate one with GSI
>> preferred.
>>
> If firmware doesn't program in GSI, you can't have this working in GSI mode, its going to fail (and work with fallback). if it's programmed in GSI, anyway this will run in GSI mode. So why to add extra things without any usage ?

My understanding is that GSI mode works, but the the FIFO_DISABLE bit
is set to zero, so FIFO mode is chosen.

So NHLOS would allow the use of this GPI instance (and not reserve the
GPI channels for this SE), but not set FIFO_DISABLE=1.

Konrad
