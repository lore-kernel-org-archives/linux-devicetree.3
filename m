Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519DE3E7BBD
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561068; cv=none; b=BOiG6Id/eheOhe2+ecUaM2d4EJLR/RJnl6ZZ5ckmgvfg2MrlFzXU0HNp7DMdvznQZxZPsDrtq/DQ4VKpQ+C3hRcXd0z+4PhF44/JRSDvUW8UoHvpxqQENCbu9gQT8UA5Zvfm6n0zWZocrYwOQ490W5hluyUYB8lV9KQfK/iUAQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561068; c=relaxed/simple;
	bh=8LDC1fIZw0VxIOIyC0NqqLsIOXCsh1QsQbMQUEg97ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W1HOrYBFf5b9Epo4fFVfoFa8hrZs63XOpArZCAwz656j2gkfDt7HItyd9q7SpZBn/OyEfSDKzXlyzKSKM/JduFab8//5GjhkrFvXBJZyjT7hr02uXl8ge8YilZMUWRgAYnLT5Nsv/uJq2fPIoXxtb9m3obl/hjB/cunk0aHSfA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0rP1khS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Is08U2Gz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0rP1khS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Is08U2Gz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R8RU2058144
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRC9/nnQFMJjzCuQLMerdD5jbZ2DoD+xn4FWz1VE4JU=; b=U0rP1khSVvAPRnwE
	xK6VLxvFpoygXy72UCylJkNiHNsQFo8nymrX5leovkgjM7NCE82lca3/TdpIP4aE
	v7K027GBXgoLk0nYuzzL76XufILLmW1Fe2CaatawxuouTfWMlZya26qKqfwSyVBY
	1tDcTgyBtRQVJ3hr1B4mUcbp9yxG5nV6X2+zAZ0k7WcYkdVDbzgVQROnUjDjiTOF
	bGX4YmTH2LvQ+ipWenP/IGPQrAeOYAHPHOL+FUsyTVHm26u0GrnzltYhKv3Zu8oX
	/lckpaPy2YxSqYvKcsCIwSqKFMVAcbMcIV1bOrBkXZrtkRQ0l+kmcvN2hxjvx3eC
	lYzYZg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr1gnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:44:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-74ab6065f97so73723137.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561063; x=1788165863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRC9/nnQFMJjzCuQLMerdD5jbZ2DoD+xn4FWz1VE4JU=;
        b=Is08U2GzVRuYm4Fdnx1PsFNBjICmeDTaR/LdVKe9mXnH20dchYTTjDhQMPA261WsLH
         wz/EkEejUrcFeKpQ6OtOdhaDaMcUnDUA1lmK8jCrat3v9gOGlNDNTL5hH96jlqC8H2BI
         Hc7OX2ejNezRsxKlL8CFTlqDpVEULT6Q1Sk72cTmjbEuIUP5otcYEtPJtCD6t9zfcFLX
         mjvHCYW58uTT7kD37myhPrbeN1zUO1CFIPwz6gRT5smeTo5Y9muRMImVT3rnEMRIB1rP
         6kN1oeIkMctVzlUh9bG9Et1/aGeGtBlmQ1u3/2Egd3UogcJaH7/FcLdD/ogpWGhbsyFW
         CHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561063; x=1788165863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRC9/nnQFMJjzCuQLMerdD5jbZ2DoD+xn4FWz1VE4JU=;
        b=BCcbGt9xw261lxHHMTQGEK0dxj501Hyi1r2UZQ+uGXuatqNyeqYvFcm7W9n6lU5rC4
         hEWLUvniLJRlhxeDER5D6z/Qtt8wFuk+3KHsyiiB8GLyAStr3EmAf5ktbdftwCfT3mWm
         82wmazTs3n9Q3sCx4plgN/v4iBF2fQPlr+ChYTn1IjS8ZHPxBaCa9giNbRSdrIfFPcXk
         Cp9Aqn4wHUTuNZqZLn42sen+pX/gGXEDzBJHA7xNkzmjc90bFZQanuZIbg8YW63Z7wff
         cXY5oCzAwRs+nLe0DkB+Tk6aZf+OaczKIJGqgRRr6uTyrLbr05nRNoLxIU2iAW5RzYNT
         6j+g==
X-Forwarded-Encrypted: i=1; AHgh+RqMydsxbMDrte0c7bUKQNRlb7JDvX18KpIb6RHreIsnQ97V8yJZxxqXbbMUcHgZBr6HfrKnqdpWD39X@vger.kernel.org
X-Gm-Message-State: AFuF++nVA2VhxRoDkHjU8/0ErpqvDqdERKja0hSyfbGGzdw6k4KGhX+j
	B1SoK1g0+4Cnfg6jPYw7d55qMzaYgM/o3wl7jOlAlPVCXBH6IlTaQeHpMZVSWxe8vBMUS1Fr/9s
	uOBoJjKhsmGv9Ow/Iqu6bCUW5KzuLWKKZIV/+Hock4ub+g7oK3i9TXgNNwAfuXv4YpOwNduPo
X-Gm-Gg: AR+sD119cd6R0AmzqWCTxGz4ohP88Jyi77fiTPMa0yl7DZOP4sNB6ZqMXDLmWvmlrab
	UduwRRnfwrOB8OfgC/t/o2FRTrm6XDZ/BmKrsX7PHYF3ZwhW/gIkiCF3n63fGtAK518GOr34o/o
	uMYD0m9HBpyi4Km6MJMWbGkHIl+gWm7HoaJpRVRxuj/QrV6fP87gUL8IcDVataWGMEEFTrb70ds
	R7Qva6C/sDWWTFKnFkVKwbqhCAAYL1Wgl7d5wSuCJlWz0YqhXnw6yqc7hcivyPZlnhotjh4zkox
	5paC3zSOaru8JNhN5G2uzdJqCfiCkjbPEDPkMZ9DBGuBJPTuNNaXVMu5p3C5IRfSijEgif1OSsM
	IASmYAZziggZHx8KoPiIMAznh
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3272587137.1.1787561063293;
        Mon, 24 Aug 2026 01:44:23 -0700 (PDT)
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3272574137.1.1787561062820;
        Mon, 24 Aug 2026 01:44:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e0190d3sm7562369a12.9.2026.08.24.01.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:44:22 -0700 (PDT)
Message-ID: <06acd175-0078-43ce-ae58-567005f62562@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:44:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair
 functions
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260819152356.904023-1-shengchao.guo@oss.qualcomm.com>
 <000076bd-b3fd-42dc-bd43-96ee9492a638@oss.qualcomm.com>
 <aoZVKWTtdCQSSvaH@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aoZVKWTtdCQSSvaH@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NiBTYWx0ZWRfX6Mw/iyGUpdE2
 9bnScUnFWmk82E9j3E1UThHt9LbJ8pCRktXCZngE7+5gGnQ1jUAkM2JLcfI8zwEuGWbEXmIUCtO
 W36ATrtg4gwpfLiV+werA60F/omFu/UjQJucwAm/JXbOU/KtSuWVWwuFKQ3uzkQkpMW/BlvVHb5
 S5wtGK5qPwfiAA4MLbbL/qqX7RJ++v0su7NJVXi0kcWUFZDAf1eWVkT0b9CsItDqRRZl0gQb5OH
 jOzJd2edpVy73ImQktfbpDFdD1ftQhGgVzODG0e+5XqF2gatcwcrwZ7pjd8kBj2EocprorCeTDs
 4gLRjfBh7+d6sNgtx9dlYAuvnuKJOkTOa78pvC95gUcRsk7/Do1Uv0wyv1HHjSmHM/PKvWimQAt
 myj1KszJNJ1EIjGV9A/nGv49PS61Pi3CvGUrq3Fr/aC16Q1nZRtXjBcePndezeh3+KOhuFQpH6X
 X7vpRvec8g0y+H+perQ==
X-Proofpoint-GUID: MWGLOqliQoW4uz2NxLfuYExTE6I4oGOB
X-Proofpoint-ORIG-GUID: MWGLOqliQoW4uz2NxLfuYExTE6I4oGOB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NiBTYWx0ZWRfXyM2uDPb9CIR0
 B3/DKoDBjs1DPH0w1rSLAFLXLHN4DxrLqpGJJFZxpkAcds1WgyNnaHk+yO7fDMS0L+A0C2jloYA
 0pJG60r7LtXe/jcWs/CkAclpp3APJKo=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c0468 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=eCN_Hj2St81N8EpzqcMA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240076

On 8/20/26 3:15 AM, Shawn Guo wrote:
> On Wed, Aug 19, 2026 at 05:27:34PM +0200, Konrad Dybcio wrote:
>> On 8/19/26 5:23 PM, Shawn Guo wrote:
>>> QUP1 SE2 and SE3 pack all four of their lanes pair-wise onto only two
>>> pins each: lanes 0/1 (I2C SDA/SCL) at mux value 2 and lanes 2/3 (UART
>>> TX/RX) at mux value 1, on gpio127/gpio128 and gpio129/gpio130
>>> respectively.
>>
>> [...]
>>
>>> +	msm_mux_qup1_se2_01,
>>
>> other drivers where this is necessary stick an 'l' before the
>> lane indices, e.g. se2_l2, let's keep this 
> 
> I can see that for single lane function. But for lane-pair function,
> it's not a new thing with nord, and the naming convention seems to be
> without 'l', based on what I see from shikra, eliza, hawi and maili
> drivers.

Hm, seems like that happened by oversight, but yeah let's stick to it
now.

>> The bindings change must be separate
> 
> I understand that's mandatory for new feature changes, but for such
> a bug fix where both binding and driver changes are closely coupled,
> it seems more reasonable to not split.

Up to brgl

Konrad
