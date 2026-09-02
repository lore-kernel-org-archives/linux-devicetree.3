Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA004A3F08
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366289; cv=none; b=J6DPmK0oe2kAGzAk5g4vsEVYQ83PbVkl/OEcuN/gl2DLm3eu7YVCahzz0nruXpMv+QyYKKnANbwQhDddRYj76paBpxRU5nU2cAybpJ1/PsH44JhJ7lCrX0/fwPs3++DZHvy/QIjCqb+hGoCsoUs5IdXxZVN2+b7HCaLiWeJke58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366289; c=relaxed/simple;
	bh=94m/u68a/RZASpND+pjgfMX8ay3ZB6y2ddThk+0ad3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQO3zQzR0pPoNT5a8kbpnukKWqRAoxyDhW/uPnYrHM4oP2rCd1z87YsjRzS59t8wUOu0o0uocg2vSiHx62U/n6GsL8Etvke/ZAE3c3Q6sgBDMnusAGXmb7WiCtsaVuD8NnNdF7Bd7DqoqgWeEMdV3puZ4kL964RH6e5g3Tbyqns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GmHN/oiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGGYpSVt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmHN/oiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGGYpSVt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZC0r1285320
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 16:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLugWH9Lhl9UOk2cvBbi9nTiIoJt3rAYJhuDEazFK+o=; b=GmHN/oiHM1xjEf+k
	QpbNXMORp7H6+LqmWT1YF1cyAWssb9ajawmNKVygvsRHcqegXWa8SBwfDwgjCWQI
	hA74CLC/MDV5O3VIOrFVvoWZpMmmr/XQPXyff2TtZa8CpJBFua1roUsJjyD2PgJZ
	K7FILWcewKR8MynIvcbWXGMgIyKcfQZ5e65F39uesvYSYeJi9xbPqWSeU8vp4bvc
	PgvxzC32GUZGRj66j410V3waODLqaFz/xDefEaZztLy5FNkF6vj5tBf2/LXR7TEO
	vSYfTOeNAnhnYrF8hhwDOJ5UqV0oE6vPMq3FtB+750V0hNyvlHxruZ015yunkhpt
	5EudPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb00sd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 16:24:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso32757985a.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366287; x=1788971087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLugWH9Lhl9UOk2cvBbi9nTiIoJt3rAYJhuDEazFK+o=;
        b=iGGYpSVtHTWOG/N5sg91RH/KuVBTYevSX28naQsVqrw0qvuCgLno94i5uqlXm/ZtUF
         DzqCpklhoMdeuMhrlxaY8MifCl6s8axbWKRUDgsiHSJxlzEObcdsDjvMSYyV0EpTTHsR
         oHnS69hWDxKcATv3b4Wp3PvonUjjUQ/hUxBC6QPJD9LVsi7pSux7W5hkzGEa6qS0l5Lw
         bm2M4jq+8Q215prEPX7oiE+qLg/4vcHTAywsCt8iBLfa2VGTrD689umMMjXGM1AA42aa
         ytI3X5wjhyxb8FBkbDRnPUjGx1TzO+Yl6WRXGLLsKIT5vhMb1gLDZhzf2dtnDHIHJc0x
         czOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366287; x=1788971087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLugWH9Lhl9UOk2cvBbi9nTiIoJt3rAYJhuDEazFK+o=;
        b=KL4VLlfAkR/2BmiT4zv1CNMyyPWyyDTv6vmoVpLfZld/cy4vzDealiV7sH+GcCYlsk
         Z2Zszvi2ar8DwBjdQxKpo6URW4g65X2RYDXU+I52a8+NnITlTr1HFoh7mBuWma7zgvmG
         qvnuTzT5Rr8Lsd95My2bCJIODrRCDz4wM0RTIKcfNl3wbUssFzshutyjJcXntFxWCQZ3
         sNaCNZtHUJAr6SXD1PdK5rcihywMoEwxws7bfJeCbz8Ur5GGgDuHQ7Eq6xeJ7631wmUv
         3o9+MrunCoKTSfodMrKXPNrvkIxCfe1dfJP1EvBHFkoGUTww6gbmrIA4FkO6JG/WzUd4
         O0dg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7b9TnPERZ62SoYOgBg98XGdHe3BmdjyHhE2JiAGNFLMnJebsO2CIQUeel0SiBlx3eNAbfRciWrG2g@vger.kernel.org
X-Gm-Message-State: AFuF++lKGKx6lYf+W1wPfMeXWFtxD//aDhu2ajlU7K01LO8/Vz4sOiDt
	+XBRdbb2zyTrpwtrfEBmyueET3laelk407fhlN36oPSalWmsh1BJ8jmEuGzFIxCkQsm325v7Xym
	oK+5ED0aax6viDeH8RHV253+Dy331k67vy2LktSVGwMdUdf6+SN++3o+EtSwVNOu5
X-Gm-Gg: AR+sD10ylllHnGpsR2D58E5N50Y156mr6gn0ua75EgZnWucwTHEdm0GMKHRXc9zmNtV
	1oApk5U8h17gm4kvlLtCUWTkue5CmyZ9X9cH97uXtzYZ7YKlfQEkijv/yVp90L+8dcDMR7tEJ0T
	tHZJYQQp7J4v4Oq/KHY/T6a/2/kTraZPlqqylp+zi09EjHQsYcjJxO1d076LllytGg434MeG5CT
	sWwbruFc44dn4mp6KRrUQHlEisCVuG39ozbS/ZP+LMhdW5Y1QtMF6IwTvEQGSCv2zv4Oxo5tAww
	2mn+ZiOx8bApvgIFc4JCl63r8eQcftckBvhXpSWEC7vHjeXX9VCl2q917IeAxzvFp0PRyYw+Gqb
	GyJivPxReBu2xuJu6fwv9Rg==
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr400249285a.1.1788366286457;
        Wed, 02 Sep 2026 09:24:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6492:b0:937:6f83:e80f with SMTP id af79cd13be357-93960cd1505mr400244785a.1.1788366285891;
        Wed, 02 Sep 2026 09:24:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d03f4d39sm163008266b.47.2026.09.02.09.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:24:45 -0700 (PDT)
Message-ID: <364becf5-521f-43a3-91fb-011e10bec998@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:24:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
References: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
 <6f33aa1f-563a-4ad8-8c81-6f64fb64f6be@oss.qualcomm.com>
 <CAFcmK8j09=tGoEUnFwzY+8Te=dBGPBr=pc9C-3dZGwAEorOi_g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFcmK8j09=tGoEUnFwzY+8Te=dBGPBr=pc9C-3dZGwAEorOi_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7b4eynmAPgRrUEIkwCnC6VqwqctnXs-y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfX/zHfgWVLNJl5
 h+c44o8vBS5iB4t2OFncD0f+yelh5/pXf2kWwVRppoWCKRia0DnK4eKPdOo7VU1/z04+uGXA7G+
 S9Jkr0hg8mdnN3OLFFdJngOtyiJ2UfrOY9+1ATnFjGM8es3xef97Kru0Yx905iP4btJthDvwi9Y
 S1hXoYGeekVxtmnyX+xeFzdybDe9QACCmnfqBa5O2TgCqMUhI53LWdzJoj1mccrenVajQ7H2Q2R
 7YkLqfBBZMcucwkFsJqBTG5+QP9QISM8PgJ+HZmW3rNI1ERLErg67eOfN2hFiDa2lwq8Qkh8EA/
 oONvBi4ZqM4JEzqQ7+D9brXj6GNyFE1wUW/uZvYDfZKQZQbDiJaA6a85Z0opjnRhyF8JELYoDaK
 u9Ia1SOwQu9FKmqpMKqTgw1+3QlHbg+ExRWQvlSzx9PzY8862plsjw5Evah68/m4vhIBKVogoln
 9GpLWq4XtY/aX9+WJnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfX6ByDuaZTthW7
 UBC9xfTIUdqvgMA0MEC7A08moSbXgvpUwEoGA1i5mJmq4umgPohdrSwpCSgF+1wWFx/HlQB1f/0
 gNCSZNsSAZ3VX/fUQuSgi0Sx1tC+8Yc=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a984dcf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xEYaC59VNbqAa3wHJpAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7b4eynmAPgRrUEIkwCnC6VqwqctnXs-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020144

On 8/31/26 5:51 PM, Dale Whinham wrote:
> On Mon, 31 Aug 2026 at 08:13, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> Let's order the pin nodes by their gpio number
>>
>> otherwise:
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
> 
> (Resending as plain text, apologies)
> 
> Thank you Konrad - how about the gpio-keys { } section, should we
> re-order them to:
> 
> key-vol-up   { pm8550 6 }
> key-vol-down { pm8850 8 }
> switch-lid   { tlmm 2 }

Generally if there's not a better criterion, nodes are supposed to be
ordered by their unit address (the number after '@' - none here) or
their name

via

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

Konrad
