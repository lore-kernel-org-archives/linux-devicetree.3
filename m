Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9719F3E1683
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607133; cv=none; b=SVrGRqql08tXYVuoJuQs/x7k/TD/tr3rl35sXSAVIZaAsicGsoiZ6+VBpKBQJ+6IVtAjt8Lfc5dIJ+8rJzdv6A6XdouC1/Yzoy7v2m2mB02K4NYXFjggettSvG0KjZSWradQ6HV1372gO/BToMlqXSGpV9qhRjdviM38wGAVtZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607133; c=relaxed/simple;
	bh=j6WjXWBiSsQUQt9bh/4UfSp3b2oNBPr6WxKI7kAz3jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgN/fPuee4ajPKRSz9uPOu+e9cx8DUjxdJu6o5hrWiuU3Fpd6VKeNVWo5llBJQVSvv9EahuUZfA6N2XvpMtRYtpVkWMSGrgu/EeWwcD4AD+NW2Z3AyMPfTRfT7A5qxfGpw+L4RzseHkHi25bBrep8VlWQOitkfQWBZZi+SLKETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYSCitxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QaCXFoo7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYSCitxZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QaCXFoo7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g1Ww629013
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9VIi5gbm+o/Cvix7njYFCpqbSntmg4C9aERKb/x1kFw=; b=fYSCitxZzc+oMkbH
	ERQ5vjKScGv7z7L6Utt4PT/Kx6hb+9HI9jnp+KzDpTiXx+IpG6UXuBE2yZzxRNWY
	D6w4TqVaKgOUOr3gI2wao14eKq259IKjU+ObokRiqy08aiWh73ljORNCiJkxdAn9
	GPDN3fP2MVUijXW+bcEnJoM5Q38GhQdQe6tjBo76HuikZYjYEudO5j6JIoi8ZiaJ
	wF1mpQpTVBZiQm+7QPENCYfMk2Lo8aJvbp8yrVB+zNdFkNMvC5tD3A3izFSXrUq3
	79YsFiPD8H1Ipflr9oSHszdAg6GFw82Z2mw6wbDGJNFIMfu8d0BTNRFyawcqX+2y
	N0e9kw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0xsk2g6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e9489f62bfso5840906d6.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 00:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786607130; x=1787211930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VIi5gbm+o/Cvix7njYFCpqbSntmg4C9aERKb/x1kFw=;
        b=QaCXFoo7iXHFhzFM/lpBQrY0QPBHn96vrpL3CsTyEf3ggd1wNHXPMgkXxItZZH2RPZ
         iJSD4IOKAH1iYx3He1Sv1fk6u9+JBRttfRVeKPTwRUkcn71Q4alJgscbLSGBjG72d99t
         F0NA1zfSpNcSeIuitvm6CztrxW9JDTltIEZwcM2Jhz5FJYWXU5IxWVux6NP+Gvhhjksa
         Bys+WsHVtEfI4NZUVdI6NXeRS1tOAU/z4DUUaAKjWQFD+058Myet6HXT9qLrGWSO9okH
         Xyj1QQscuKGns5HTsvY6RDCjlByWGbDq8pBDGRQpIj7KnUb877W6OwTnDY+27/0zFNH4
         ZKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607130; x=1787211930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VIi5gbm+o/Cvix7njYFCpqbSntmg4C9aERKb/x1kFw=;
        b=SiOtsw19bqRCQ/62x3llc6io8npU/5IFGzSbMNBPdS944JYIVzPz0VPmN0UXJmA1Ly
         CxEFwBjMz/eb+ErZ/TpR6HtGyA906jAdwEZ0Iip84GvLEjmKgOyML7w1ZD+spbPwWuwD
         VwGPXjD2pJcDnDppYKtGmT9O1pCY3PHbjnW+CmBrlmtW8zEozBnKZJ077LSJwrJV+9BP
         pwm38b+GjvOkVrffeaoUbQ173HiYVAxGy5i2Jgdx799SvnMeytUiMVyE9fk/n+kFn8zz
         sKG8Ll6+2rSsjkRemR98M3r+XEFI0oy4aCbt8tXOn2wkmrgK4pQr0cDYBjV/V+Zco61O
         tlXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rom4UMmdnNTgYs4HQtp0g1iuT49Hbl/uKCFgPCGgaFYu9sEa+ehqwaDXbqA8y4lvS9d1bjkBpEyJX1c@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ZiDVMVXvwKDiEzJ/6oPoe3+l9FJXoXiyC8EJPe5OTrEszLt5
	ZgdhwVEZLYMZhtvUxcpleUuRMrd2gHP1DT7TsG6Y3At5a2tItW8gAUQFnDk1PboBzRmJv6IVooP
	pKHnZ0IzcY0CQoP7qDBBQfuKDqdfjRWhdr47a/hm9GbJnsZfqNouY05G1ycRHwZOY
X-Gm-Gg: AR+sD13Du0x2TbU/B8Ji7ELLuN1MCAOqwY+9q4rhOejcss+hFunGSXdsvyV/RDuXXPv
	aAnhlc2Dn7VuF62Rw73bPWCUA3q9g3NY2Uya5xVXZa3GAsjxowiR9zLtd9zQizbiWalIg8+IdGQ
	WKzDUxEzbIw4GIcYSu1VGwBejcJ6vd+GdgADpNK5X+wTO3SvSnBCpdUmC1v2CFXZIgGGx4AMAJd
	/ce8QDSKcPq9T2HD6w72YMPlPKH071BaKYux4Yxetuw27Df3xnjpguhu4V7NhtlKY+WPU9r27Oy
	vzEUwnKU6Vh4nFD1NgBUHSKVSxvLf7mxy9DUDEdpOCplDqg6gtECcvEnxr5gkVgyiSA7RHFXL0O
	gb0ELxRX50yW8M7jkgmToMkaWUYlYsqk7AhrcEJ5ZT08vmY690YrTnY+JDXrDoDbn
X-Received: by 2002:a05:6214:401b:b0:8ef:e0d0:9fae with SMTP id 6a1803df08f44-90a80b2f028mr32615226d6.14.1786607129759;
        Thu, 13 Aug 2026 00:45:29 -0700 (PDT)
X-Received: by 2002:a05:6214:401b:b0:8ef:e0d0:9fae with SMTP id 6a1803df08f44-90a80b2f028mr32614586d6.14.1786607129167;
        Thu, 13 Aug 2026 00:45:29 -0700 (PDT)
Received: from [10.111.164.29] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a8179e4fasm9733956d6.2.2026.08.13.00.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:45:28 -0700 (PDT)
Message-ID: <bad2e899-106a-4d7e-b082-345ec757ee9f@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 15:45:18 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <20260724-cocky-uppish-pelican-3796ee@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20260724-cocky-uppish-pelican-3796ee@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zJo2WtNkLctIp4bjzOeY1nYyoeRir2Rq
X-Authority-Analysis: v=2.4 cv=M7J97Sws c=1 sm=1 tr=0 ts=6a7d761a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0b-XH3JjkyDtS5VtSh0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfX5PRqYbnKgM1I
 z1HDATHY3XbMGQnSyS4jmezyzH7D5uQPG1XlPI9tkIXroGna2YA/tyCMoAsCBHCxI0qx1q7AMqI
 Z+ud2ImRDgCfVPF53INIgAMc4rLhQbs=
X-Proofpoint-ORIG-GUID: zJo2WtNkLctIp4bjzOeY1nYyoeRir2Rq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfX9Jn3sp5p60Kz
 7LtTW4aNtnlbgWdq306jMtTTRCVHmo8Cy6WV0QXXNz/9qNzVVuqiHW/fOP989KZC+cKj0Y4bU7f
 H96Tp61PW4rkwiHbh2jgW4VsX16LM8xfPnxL3emDgJippETh33lhUwyUv6dl+O4lQ8bElHS4ZhV
 R1Ihxu/j0tTDln9pVzMzg33d3n5NRrusJRCCpe7GswF6cR9WkY+kAVVDNxlDzydjnScWOG00MwO
 HaNZSJZIvvmKogm+nzvJ80vr8cCc6PaAbakLQf8cXy6cGUP0R2gPT4h+e0SgNuzZzxTb2p8PCml
 blWfxnuF4QgDFyd9w6u3lPdN813omI6v7uKq/bYITTnZr/Xyc27AbRd4gIOFzTOmE/trLb9XACU
 U+Ttojh+XTaXXGuh5i/B3+jcVU0Fl/KJOKX4DLbOPP0LgZ5eiZ9jwU6eDohN0VG5QAZygbcdO32
 Ef9gizC3u9sbPA6Rpdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130052



On 7/24/2026 5:36 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 20, 2026 at 04:43:53PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8750) and Glymur use two display power domains.
>> CORE_GDSC powers the main display hardware while INT2_GDSC
>> powers a subset of SSPP blocks.
>>
>> Allow the MDSS bindings to describe both power domains and
>> their corresponding power-domain-names values.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
>>   .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
>>   .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> index c6305a6e0334..c0b650ffd9ef 100644
>> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> @@ -31,7 +31,8 @@ properties:
>>       const: mdss
>>   
>>     power-domains:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
> 
> So all deviecs now get 2 domains and this is completely ignored in the
> commit msg.
> 
> Best regards,
> Krzysztof
> 
Thanks, will modify a proper commit message next version.
