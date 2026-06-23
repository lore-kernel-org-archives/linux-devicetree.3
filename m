Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691323C276B
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198702; cv=none; b=KWITlqkmBw2+UfmxEbhF41Qvt10P9c9qFIimjxW68q9XIrSGds7Nbn+7d/BJBzaKBRsrrwidJE68WXyxJv71dfLmdG0D5JOEDn5qB++uDU7pRaDXYGwvANWCawTgP14Iyh82dOMdesPVhmzGDHIYDeyFVZs6tDA0gEmbnXF8DcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198702; c=relaxed/simple;
	bh=kB7QEfblh3S2EGzxlLFjO295ZLcckUB1cfjYyUGYLU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mqd85WWqiKa29/eIVxFvvUCFXu15f3YYTWBgFwA5vqFIJkorbeahXk7AwEumuXjW/bnvsQAN0uv9wrV7QEoF5vuDnSr2UMaUK7yfhVnEwtyAJs/M/4XVeIpiyGekST7cVSvXmtOJFh0I3FTW+zLY0Emd4aVDMWDz3AV/jJWyh/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I19xqWIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XV3jscX5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I19xqWIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XV3jscX5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cibt3547183
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+jQrvwaaO4z3xea2qKYmyC/zelClBy3n0fYvHpSU5k=; b=I19xqWIXPgH+GiV5
	sr+s8YbPgbAkzGckQG0bPxAj9s6pUdsK3fIDMeRNI8Du5N5fLhhgTs7cgajiL5fg
	kxvvtZw1dJ2gPsYcFQsJ6z3xcoOCNycAI0ZpKSSlpwXgkeKGko3c1RYBa9y2B5hJ
	lcxh8cnAMvOc222DB8suoyocForSxIlGQPsKbZuIvTk7lZtC544WjGiLdOlbwhzr
	6WnBzIFrXNo1NQV7NozW5oMtcl+6crB9CGGxTUO/C+6IXEvZJ1ms7eoWBLX/HMy/
	KocjyAbWudhPrbb7dAWmP4/cxfByc6cubhvk8BqpNNJnOoB5D5VJmKfsy8NZBAKB
	WpqXaA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3ebbxa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:11:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ddad6183f9so97910326d6.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 00:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782198699; x=1782803499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+jQrvwaaO4z3xea2qKYmyC/zelClBy3n0fYvHpSU5k=;
        b=XV3jscX5XfG50fwHVS2QqDxZiTL50H8lxShRuVJJC9MehbBmNeymYlbplX9GZ/ydDw
         De0vN82krDEaOKCv+8vbI5l2xJ2WBvlN978OhRXIPTo5HAq8khA6MOjv8bvyfozATdGp
         GxC56zuUJtquUJ3AByzTzBP8GDeLPXgx5YF6vtCRVO/4l8QPN8jvKWG1q1HIcvVg6FmF
         +UL7TG+dF4uYS+H8eNiuxhDVQz7tp6r+GAtbBLn2IfAneHkIF+V+MFqzKZBsE7ZGK4tE
         Kys/Ic0BlVNrPeWtHiqiYmqYY7N+gujH3UvMlQjFVo41QGgY/4JxP8vvmpZMxksbJniY
         /bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782198699; x=1782803499;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+jQrvwaaO4z3xea2qKYmyC/zelClBy3n0fYvHpSU5k=;
        b=f1N552z3qKBlVOEAAv0qxZsn76aPI2AWaB4qZ+FMaylAN5Hj97FHqdvnzuv9kyVHiR
         FzRnsPzreoRfXYW+K4IT4AI6QGj1enyqw6JR2tN9pL7rxZ8rk5/yR1VyXdPWPc6DegwX
         3n0QQQxEJahk/TCTaEIOcm5Abyqcm8RG8YAFUJ0YcFN6mDzuf5OtAcIuQN8sKaw534wK
         90JuxD23RRu3w1D0d4JIbMVyXOJ5DxNcs2mCy859wJkETRO9ax7Ar/13/pIISipn0RH0
         +h9dtgua+rAI+JHc+NBYPqhLZoZWTMl9nPyO0ldb8QeDfAlOAtwvYmldPkGXr7pQfIl1
         0ztw==
X-Forwarded-Encrypted: i=1; AFNElJ8e0Ld2ikfp2j7xYV4lFe42xshY4Ghv7Izz+axyY85u1PJ326+u/EO9Vrj6o8NXnseM4yoqMy+i7o1A@vger.kernel.org
X-Gm-Message-State: AOJu0YwPhDKKlhBzuh12eJltdLhdIHmO/g45oOIOKEhNGX/CiQtd8dDe
	JaiBEAXTLwPL5qXBphlii5MULJfw1LMw74fxzRx2CziUGMboG74a95gVdnhL6IY1IUNalHau0ok
	dyAyWpB/stHn74aTICv5f2s1jNaaZILLT+8EP9O9cQ++rH3g8FblfGMzYchC9AqA2
X-Gm-Gg: AfdE7ck/DgyiLko4knl/Hwnj9OPLhcDravo9cSOzDzTUQamMT5Tkmrmz99actvs8hox
	7ME7smTvOcTg/WGaIsDoRaviXI+GndUFcE3HVHp15BeK5mAQY7L9/QbK7uWDpnZEeSR9goL/o0v
	0JMKPYCONJZbQbawfLZ4HlRSHYZ68oMQeo+GyFqw79jyzFyVI+t3o4tXW1yEoY3XaNL63x4LxYX
	sL4/2rw7gh8hwgkuPo6ojCAlJz+oSFV2oEXqRAVkHgR5SvaOMSh3t8cqZVpdLbKbFTVtMJhp/z+
	B0J7Cvmb1jfUxziLBPU/rggamJZkgOPOVfDDy+RwsrZITXrg8+mV24aneLeuXiy+xMEx3BHM3Tl
	y+gOU2lD6+q21he+uZQZQdVnUtDmbTs38pZsq7Kx+
X-Received: by 2002:a05:620a:6cc1:b0:915:f27f:e711 with SMTP id af79cd13be357-926674343d7mr241679285a.19.1782198699323;
        Tue, 23 Jun 2026 00:11:39 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc1:b0:915:f27f:e711 with SMTP id af79cd13be357-926674343d7mr241675585a.19.1782198698807;
        Tue, 23 Jun 2026 00:11:38 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5397sm36071434f8f.13.2026.06.23.00.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 00:11:37 -0700 (PDT)
Message-ID: <11fd3025-0f3b-4a54-b219-c7fc8e87c883@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 09:11:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] media: iris: add support for purwa platform
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
 <82834dc4-14da-4a92-a1bf-4b8e744094c7@oss.qualcomm.com>
 <45fe0be2-a397-4677-a7b1-527574c7578b@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <45fe0be2-a397-4677-a7b1-527574c7578b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1NSBTYWx0ZWRfXw7I6wmdCuQpT
 KBbl3RpK6JWpIQyY3IJmr5yRwjqhJSDLMfZfk5vsxcz4/TXYJUTmDIZwBmlFmKA36NOq4Z8R87h
 SJXga2A6z4FSbQA8p+P7FtxgP/s297U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1NSBTYWx0ZWRfX1D7LxfLuhtbE
 /xI1+Iea2+6gGfDuE6Am+RBr7aKxgKPpiDmHJZe45STugBI5xV40v85oepbpkK/r6fo3u6aLb6k
 9ytgpbW8kj3AUvtqrgdxaHCqMOGEeG1p5EHUrYSdjEzhFSeimOoSEdAMsd2iY6j7k0aUKeDRiy6
 jAFvg76GWB1YsP3P+MhCxaIVHCUqunwmTnj69on5T882okzjh1Laxm/SdorNJvEqiE+kTXj8VKr
 axupMupAb46ROLWC1vnLvO9P9gkM2xKob1vVKhnluFGLfVjWr62xhRm2lgiF9dtw6gpu/ymdMJw
 N9pKseQU+1Hs65O4v0SFJdUNYRCyUTI0Pq50VbN/Dg+u067JZAQKHI3GWe7o2AOwNxdPzom+Xvp
 f+EudoLx/HUX0Ksh7CP5hOnDqmPUKHX572vvRj2b3ANphEo/fk40GKL2VMNwGSI+avphvJCkt89
 JufjjX/4KD4wgidY+Nw==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a3a31ac cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F6f3bTrXTl8tN9mfVr8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: NOziqEg3v-2PFvvWpYTxbRsJE7XTccgr
X-Proofpoint-ORIG-GUID: NOziqEg3v-2PFvvWpYTxbRsJE7XTccgr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230055

On 23/06/2026 08:15, Wangao Wang wrote:
> 
> 
> On 2026/6/4 14:48, Vikash Garodia wrote:
>> Hi Bjorn,
>>
>> On 5/29/2026 1:04 PM, Wangao Wang wrote:
>>> This series enables the Iris video codec on purwa, allowing purwa to
>>> use hardware‑accelerated video encoding and decoding.
>>>
>>> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
>>> except that it requires one additional clock and uses a different OPP
>>> table.
>>>
>>> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
>>> and OPP table need to be redefined.
>>>
>>> All patches have been tested with v4l2-compliance and v4l2-ctl on
>>> purwa. And it does not affect existing targets.
>>>
>>> Dependencies:
>>> https://lore.kernel.org/all/20260409-purwa-videocc-camcc- 
>>> v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
>>>
>>
>> <snip>
>>>
>>> ---
>>> Wangao Wang (5):
>>>        dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>>>        media: iris: Add hardware power on/off ops for X1P42100
>>>        media: iris: Add platform data for X1P42100
>>>        arm64: dts: qcom: purwa: Override Iris clocks and operating points
>>>        arm64: dts: qcom: purwa-iot-som: enable video
>>>
>>
>> Media patches in this series are now applied. Do you plan to apply the 
>> DTS ones ?
>>
>> Regards,
>> Vikash
>>
> 
> Hi Bjorn, is everything going well? If you encounter any issues, please 
> feel free to give us feedback. Thank you.

Now is merge window, so usually better not to ping - patches won't move
anyway. In case you wonder what is with the patches, I suggest to check
the status in Patchwork.

However that said considering how old is this patchset (1 month) and
after looking at cover letter with:

change-id: 20260209-enable_iris_on_purwa-a000527a098d
prerequisite-change-id: 20260331-purwa-videocc-camcc-d9700d0f797d:v4
prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: 2f4d4c5c118e057c76e6d2785479df01d5bc1c7b
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: 615e6f38e528de35dc206f1c7f3eaf78ff04afe2
prerequisite-patch-id: 66096b909debe4d942eee972948d5a138a5be427
prerequisite-patch-id: ee26e00cdde21ddb070af713230082ad3454422c

the most effective way to move it forward is to send a new version after
rebasing, which will make it obvious and explicit that there are no
dependencies.

Best regards,
Krzysztof
