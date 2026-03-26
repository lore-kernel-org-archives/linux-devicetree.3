Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983F3F7A85
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774526827; cv=none; b=ppeT9nNwfNZK2oLucZX0NK0H0FhXynuO/DEC9MvnBs0OMUTSGtNHbPNCZLU8AF35mWTrDaiyvm9m9e7ghzNj9/nn2G8K+txyyztL9/kPr6r77BhgmtI9ByBEHODtV5xO00/cNZO2HP5Jylz+vrJVJJ65W7urMQaDnQemLLY8JD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774526827; c=relaxed/simple;
	bh=VGmkSRhf8QPXnE2EoJZ/NS89R0xqWBWWZdZZHt2XNvA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s0j84RkZrUGGeIEj9QvziHGqllU1p2CTWToYyDev/2imd0w0cqIWsF1sg8NpXuvIyVx7Hy0eYxEW3pbKW79dGEMkY4+TfhmxUt3cfQZwstEVYdImCC3sGAFJsfafXo5OcVahvbBbIpmTYvgHqyYEdRjkTT2g39VQq/TMxeLxGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CS5Cf4ZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cu/VAH7V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS5Cf4ZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cu/VAH7V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6JKJt051542
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDhl88bVqyu17xGfeK+lPA3g2oinqiNwhpJk9qPpcJg=; b=CS5Cf4ZQl7JNnLDM
	y17ZXm3Jha3AxHkbB2RhqX5xrhGsNn3MmB7ZLDDoYk/Q9wFnYY4pZPel50pRNWeB
	g0uMxT66bmeWOvruEPFxg7NEXsDbnz7zwbfYhuvLnEut7YCWjs4nCE9AFDEVrAFj
	DGfbmU1i6TGlvIsSug/T/nTEWhHpLXtLB0lkhjrpRBLqZVyppGFRkS9mqI8P+Moi
	F6OYXNH5iKLx5O9rJ313Bx0VOB068IffHnO3Ckesk40HdXSJVTZdZftYEfwykvSM
	uoDgGD6USX17X/yj9Vz7FnG/PTcCz0fXxJnIb+YpVp2wic0MpCkY80LEn2mitPP2
	IuEAWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t2q2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:07:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso16361821cf.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774526822; x=1775131622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XDhl88bVqyu17xGfeK+lPA3g2oinqiNwhpJk9qPpcJg=;
        b=cu/VAH7VEszfH+MyJXXqyMxBZe6gZwFvC1cbcaWH02dGICS0zHahBbYL9liY6kFu0l
         j+z5oJTisXBTpMHehj3f6qWlrR6hay2LQfEmpdU4m28XJ2HATArM+u43/IjpaazRsT1E
         DgNZd5fXT42j59UJZF/PKiEYQ2+y4W1X4U37wmAKt6VwlG5558Z0GfEegc1R10Gjg2UI
         C2M84Jdmi4uQVJC28t9F+2HiB3QoQGEjP1XbN+4OqlY7Sf/AGQWry6i9/5HnUlycftf0
         uFH54L2bX+LpkuDZmD7Drg0pJ4lyq5F9wcv9+Y1uSM9SNzeWQPo3GSxf+XJjVyq4Fidz
         S3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774526822; x=1775131622;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDhl88bVqyu17xGfeK+lPA3g2oinqiNwhpJk9qPpcJg=;
        b=FD8WO7PtTFaUUxHgTd2KkqGlRHGXsb3b6/wBtNFVoIWEYhzOsaTVJuU/xOgAyHLw6M
         +cuvMMCYIU6l1NweHR//Voibs4MBW6uH1E3tyvpQnVUzBjEqnBOZUlixEQ5Iuy6DYx6G
         kkMWe9Gm3FASZBzeAcWCulrp5BNpjGt9RIdDRIh8AmoKF0aexuf3DOUnlVZKvhHiXQ7J
         GhFkg5fsvSxlqYIX/wiZiccxHM/WvPDnmQOnSfpjSP/XEf+03klLAHTmhZHLeeDo5W20
         XdyKIwZJevX8PUiXk27pHys8nex2CO6WuoJfo6aeOM/ZyUxGmoI+8fN17C7ckOF7q83f
         BTDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAMz03sLh+qfDc8b0BPOrMql1Go/MvMHqjBrb0Arcb6R3Ezdfa2mMzzvc8MAZ746Z1JMfN8hMNuuBR@vger.kernel.org
X-Gm-Message-State: AOJu0YzeZour6weBVqzEder0JrJD6Nw+PQxi3VNE1kVq6vYIwf29F426
	7m4z3B05TPoyiilnJbqXZSFJfOtCXttr6pAeLRT+S4QHqw4YfzC1hVgzRfnqQZ4lpT9CPYVpKGF
	Hni9IqU7fPbBUqISgiRuRH9HgGeDqBdluCkG6f2xmZa5AbW9VwcisjDFDzQWRWwf1
X-Gm-Gg: ATEYQzxvO9eV479tXZUxsNDrBwxu5zTOGcvj4bROsw5YxYguOprcF60wlNYDOsvC5Uo
	BU5I9zgmo6/wvYvLwLelL3YeeSPps//fQMvIm9B26iUdooFGMI3q+8kVEUGVUgRtJ49S9+dsBIb
	2JFF0iNMVqIorMD++BKzjjI/tXjrYGsPYVtREaRSHO1WyfXv8SO3AtGZ5/OH1LbEyDoVSuKOics
	49HTgA3MGoaIB+dGglJSLs5ENzT+ZmDuX708RvgVY3hpk3HgBNWgLuto7XTi2EMForhkbCGXoaa
	5Tk60oiWqhk+WvkGGNBh8XaSJxHjiHl7SpijvhXjhRQWfUydoOcK4JvZBnMojMUUjF2QRmyl9/i
	cINo6qQMZgtM+ZGOtSjPkPs7dNEU5LZ9kLFFjRY25UxhDJ2OLlNU506dcy20Y/qiaSkOJaHgevV
	Eu9VU/wTdG3Tb+bJ9yFM9AP5zB5EkxLYU3fWmdNSINqrnEf3ovhtMKdgBDXMg22yCvQycQKMOMa
	UNA7EDFSvr47E8D
X-Received: by 2002:a05:622a:492:b0:50b:3ff3:f489 with SMTP id d75a77b69052e-50b80e36161mr94928341cf.34.1774526821975;
        Thu, 26 Mar 2026 05:07:01 -0700 (PDT)
X-Received: by 2002:a05:622a:492:b0:50b:3ff3:f489 with SMTP id d75a77b69052e-50b80e36161mr94927811cf.34.1774526821403;
        Thu, 26 Mar 2026 05:07:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef851sm109201466b.45.2026.03.26.05.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 05:07:00 -0700 (PDT)
Message-ID: <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 13:06:59 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
Content-Language: en-US, nl
In-Reply-To: <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c52166 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=RCPHVYlSrOQLcUI7fhoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: addWtbQbgleROMWVwoe0m28QesswUD2s
X-Proofpoint-ORIG-GUID: addWtbQbgleROMWVwoe0m28QesswUD2s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4NCBTYWx0ZWRfX5MicSBYXioti
 o7Xkj+O1Bw0lsqvcQzrHHAesvqzhT6E0n11pykTK7mLEcYDJeWqaQaHg3na4yj/bXtN/8zYp0RT
 Nlf95bqvnjo1fBheNXWf8WT1lE9F17NIrNmwpb2x8SrMLNYAl9aGzQzOyoUeqCStvHS33meMA3Q
 VMqJDJED4xmk3GF4R/CNkjLNiyC5Vxu/HaxLB5zHZ1rbYyn4+Anq2Q80xrhBnEtrkVdNzSDLDbL
 uNRYDjWvNVIL2p7nSIaFbAGAJYweQzHlrTtSCWC7RL5pD6f10XaZI3gIx6ctfAeYlsOSkRii6RT
 vjV7xC8jgz7MSWZ9PRY4gG4pLkLDH8Ro5qn6xJWxphRJ500vl7cdOggTezl6TG+DGRaNLQD4XG1
 majFlu0KKybM3/lWXLe6Crg9WuEGRPFGFAWbdoUzuVThunYcNCZnA8fus2fidIbmFPw4Js3wi5l
 the0v0gluiO9dzYaFfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260084

Hi Dmitry,

On 24-Mar-26 22:27, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 11:00:21AM +0000, Bryan O'Donoghue wrote:
>> On 23/03/2026 15:31, Loic Poulain wrote:

<snip>

>>> As far as I understand, CDM could also be implemented in a generic way
>>> within CAMSS, since other CAMSS blocks make use of CDM as well.
>>> This is something we should discuss further.
>> My concern is even conservatively if each module adds another 10 ? writes by
>> the time we get to denoising, sharpening, lens shade correction, those
>> writes could easily look more like 100.
>>
>> What user-space should submit is well documented data-structures which then
>> get translated into CDM buffers by the OPE and IFE for the various bits of
>> the pipeline.
> 
> I hope here you have accent on the well-documented (ideally some kind of
> the vendor-independent ABI).

The plan is to use the new extensible generic v4l2 ISP parameters
API for this:

https://docs.kernel.org/6.19/driver-api/media/v4l2-isp.html

What this does is basically divide the parameter buffer (which
is just a mmap-able bunch of bytes) into variable sized packets/
blocks with each block having a small header, with a type field.

And then we can have say CCMv1 type for the CCM on the OPE and
if with some future hardware the format of the CCM (say different
fixpoint format) ever changes we can simply define a new CCMv2
and then the parameter buffer can be filled with different
versions of different parameter blocks depending on the hw.

And on the kernel side there are helpers to parse this, you
simply pass a list of the types the current hw supports
+ per type data-callback functions.

And then your CCMv1 or CCMv2 helper will get called with
the matching parameter-data.

So this way we can easily add new hw support without needing
to change the existing API, we can simply extend the list
of parameter types as needed.

Regards,

Hans

