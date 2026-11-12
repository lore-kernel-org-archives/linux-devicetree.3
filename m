Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452546;
	b=jS0OCyXkCtdlkp0KMKMx0v+2386H6nrt10Lj68ZUA+GqMmcpmIkW1sPYFnO9hTjDkP4E
	 js31+tpr+PPzoHWPyQ1UA7uF7AhtuYo4wLXC/ZIMvxecrjYbZIO33IHkdDH9yEJgmslRR
	 ySCMnXOjJYPMKzEasE+tosIJ2lzYa+1qFr9W9mT/sdGjAPzbPFbZ+LQONIknaW49f8o5E
	 1cymENPQvIpFXbBGMwmDmGN2Vr+fyKLaqrslc2spk6Ga24S/m/MYwlMmsyKJ7XkOsI+iI
	 xX1TvpSYoidWwCR34aeLapEgcGVawL81PXVl4R4ARp6QXmi8GkWMttLPRWeJBW398dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YXD4Agrm4CLDZ6F9wgGL8OXG8rmJ8G9l+pKBughaSr8=;
	b=Uw+YfNdXdynM6Iwdn6ql0HOgCjB1ME+2H1x0mLlVUrggVcrV6qAgfvXlYCq3zf6Vs/W+
	 ehzsVmvcz6qa/UXHdb80wJx3nmDrLVr5rmlZmbgLPepxopFFY0/QvmsyDXXvAg5bxZPbO
	 g1Iw/NJgtQLLQoAtbvUlc2v6EhRrblOLswv9p+phEcy3PgMhR7O86a1B/GhcJP6oUdCc+
	 ylKc01sJaht3eVH8s5UknIuoiSio8b85kh6zL0a0vqXEZgkGYGcz2rT0ihnd2OhepVyOc
	 wStHMl8Nz7OLAZ42JSSWApckKqQYwPZKovTEObFNdHHIeUkRN8ULmh4fYUooRF5T6uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p2u9ssez;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ND33GazY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80919606A323
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 03:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80919606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p2u9ssez;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ND33GazY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZxlV3061866
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 03:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXD4Agrm4CLDZ6F9wgGL8OXG8rmJ8G9l+pKBughaSr8=; b=p2u9ssezkjwxBO+Z
	aiJBc2ky2Mckvq5XcTchYc2/MHdO1bxeSt3uhFIxQuNhzj7O5ijPf2+nkxb+62dc
	wXyHdwp1QaPvLTflFmSurrS3vPN48/EV2OPtWR/gupkoe8GPZRS4UfqWUk4G//NT
	fJJLyBPNArdtf2Sty+R5PpthBlE9zhdeAxSOPRsilTK/o/I2cTLP1crBIJOw/KXq
	8U9DAhZy/BuomdZ06UGBTpvKG2FP20Ubl7wJdE7Q2SBo4w092IKZkgXZhH0UjlIR
	y/x1aAIZRfego7/q1AcICOqOdvVfy4haGUWl44sdSDEjQ49tL8ayR6lCzAZWrCyM
	0PtDbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m2yq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 03:02:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so86625885a.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794452544; x=1795057344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXD4Agrm4CLDZ6F9wgGL8OXG8rmJ8G9l+pKBughaSr8=;
        b=ND33GazYFxrZN+bHx3nQkTEHJHW6MVelBfTAe78leC/4juUJVPTd/Z40tYVL1gcGnz
         81a0hpc/ArfYWVCNeuoXhiXl8ni5g7KAaNbMunSZfXwi506OEkylZs4NC/XAvKZUo1tk
         D+744GyljGO+gB2/HKHsFLL8ueVylXe72e8BwGZRZEetxwSmX72gCQuKgf2gkM3IASnR
         xC0+O+kO7EIE06CF0cR3Rd57t7UBOpK7gk8BuRH518vadFYF3Tmapt/6gEZLSK3QZQaZ
         igaC/zKR099FiUnRbk4Tj9jCjK3n2iLkPefTFUljXSdObwFRQshlbqOJWdLIqpXCscH1
         OBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794452544; x=1795057344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXD4Agrm4CLDZ6F9wgGL8OXG8rmJ8G9l+pKBughaSr8=;
        b=aYEYac8H8Aq55yux4R7G77FiNFnJHitccgQDu5Xx9F7BleQ3vakG9ep6k+ZNmsJPDt
         ttXsxqTWYSz79dZ6/bmtu3jFjaqkoicRT/RycuvnojD8Er109rvuO2w9fw/AVBLIZfOF
         sW1yAD+ZOIy6vJ0ubGAv1pfc07ZlEc8V8m04gmeZGsUgfEfd4qFjNDyLjuNyXy+KZL5q
         vqWsSUJVFaMioHvbZtB8NbWovmQOCB1hmSck1FQ5YQP7xWvJxfHagio3JQD6nQCSIMXy
         9iJ4zJFJMcew0G10qMM6M8lzmgdc/hMnH4e4ZIwzbXLQpHnAcrzRUTe3FRTv0KDCtR1r
         Fn0g==
X-Forwarded-Encrypted: i=1; AL+hErGNUX3YKoQhYFqjRHjYkc+Mp5CzjNj0ZqXqAp86zXrSKus5frcyF9sKni8I2N4Hbb8Kd/fYKk6sZuvY@vger.kernel.org
X-Gm-Message-State: APuU4Z+p09M4goEeKbr8Lyz239c4l3CEZdFlZXaia2BfzHcp6XIZHsom
	4bmEWFWHoo90t6N6S0EM2N8x55L5C03Dllwoy4lmoCMGYkkBeNzuqdX8lezxptdb5NJFM0sTrAI
	AX8XpkUOHPDd+TG2vfKMEqTsxc+yVI/9o7PmUT5rcJFMmCeu1GokbIZWKU4+P3isT
X-Gm-Gg: AYBFou2uPuCvxbvA2UoAt30qPsbOA+MJAZigRvEZl5Lk4jJn2NidtYyVzenB5ixK9Q2
	SyrPB3x3mq4KO9RJHYRjHWciCkXssHHW0G7l7rw53SGZRpwciSS6r1pVVz/y4m6yv8TT8W7BmVM
	znJ9xzkRJs6/B2qcdMWHA8xGzcWgqV0srH65I2M/X1DlmFSOXJPTJT2MgvTfLtMudRjtwftufzG
	CosnzVpEUQsIYTh16s8PfHLFvElmupaPKTZrnaYuveyCj6/1f7FX7v+ls7VzATkuNQyQcxH0l3a
	hVQwexKzrlRkIyKfK3U5SLg6MIRZ/c8RioQ3ty3FINCdS2A+FWmgT1gsn0r7KKJDSA3+KXg7TjL
	t8QzMzN6FLBbCI0Hmxctbf32DxC1+CoxADD5m89CdE7Zs+WqBoFJypm848+afz0t2B8tY43B4xM
	TQEaHB7oW2o6KG8dG4uKeaTPeOqIBPFpHOwuotdsg=
X-Received: by 2002:a05:620a:4142:b0:93e:7ddb:4ee1 with SMTP id af79cd13be357-94932e1d17amr282169585a.31.1794452543802;
        Wed, 11 Nov 2026 19:02:23 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:93e:7ddb:4ee1 with SMTP id af79cd13be357-94932e1d17amr282164085a.31.1794452543269;
        Wed, 11 Nov 2026 19:02:23 -0800 (PST)
Received: from [10.111.167.254] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e3c34sm626765785a.36.2026.11.11.19.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 19:02:22 -0800 (PST)
Message-ID: <ae255a03-deba-48c0-a290-7cb0e50b10fd@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 11:02:12 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/msm/dpu: Attach CORE and INT2 power domains on
 Kaanapali
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-msm_gdsc2-v5-2-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-industrious-impetuous-slug-a8e4ce@quoll>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261109-industrious-impetuous-slug-a8e4ce@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FE_A90MkoSINgWkltx8a92e4EHt6X7Ic
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af52c40 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Exsngp9zyEbSqwYxnZQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: FE_A90MkoSINgWkltx8a92e4EHt6X7Ic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfXx+TIblkOPtjL
 MzZv0c84WVgJiMo/rRcow0tEBrj2pa/T934Pz7LYglT5avrlA8UlX5nmVe7K1MMW/jYjEKtIlH2
 NJZUZTsVk96vIcjbd2r8hwEl6Uv7mgykhD3Nlc8rrUnK7zCmBgluRqoDmPJsuAJ68Dj9oZFUOa3
 oGpSC81Zw4Z0UhElEce835D5j74ybhrKIYcXGFuGBOfpPGfGvKuRcnJp04l/HnFseq+NXJg+W0r
 hiHKVq18dvleD26tT1QJ+8AAhIv0Nel1vMRosvNkbA02gOpQcifKQM7G7gTCQpNT0fFGmVlBXVp
 RRegTQImMhRrCWeVa8yApOnWdCjJCn2wYCBKTMRjqzenH6RplU6ahwQsoqawRnjNq6qxzxzdGJw
 JYDUkxFYeklYzum75/fXWPT96BeVbZrjvtp7heAdiJnarI7d1aY7qxHHyqrtglWkJuDXlsX+W1b
 MYhmap7YeoKmoKFKlGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfX88BlfLav11jl
 RRZwrXAIzHGUp1os8LDJ4k4YD0B2wPWcIhWU+O9hRGWs+SNA5kEeHqAsigkgPxhC4YykikOchTe
 JjMY4BYO6pJl/cXkYK1kDRKYEYqE6cE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120010



On 11/9/2026 8:26 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 04:36:36PM +0800, Yongxing Mou wrote:
>> Kaanapali's DPU is supplied by both CORE and INT2 GDSCs. The
>> power-domain core only auto-attaches a single domain; with multiple
>> domains the device is left unattached, so both domains must be attached
>> explicitly.
>>
>> The DPU OPP table also needs to continue controlling the MMCX
>> performance state. Mark CORE as the required OPP domain so its vote is
>> propagated through the genpd hierarchy to MMCX. INT2 has no OPP of its
>> own and is attached as a regular runtime-PM supplier.
>>
>> Platforms with a single power domain remain unaffected and continue to
>> use the existing automatic attachment.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Tested-by: Joonhoe Kim <26rote@gmail.com>
> 
> Where? No tests were at v3 and v4.
> 
Thanks and sorry for this, will drop it.
> Best regards,
> Krzysztof
> 

