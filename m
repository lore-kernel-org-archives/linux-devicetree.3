Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A5232FA14
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624411; cv=none; b=S9qHHOaK3e5C9uIguMjjsTYfzlVxuizMBGKd6XHTjSTjwOn6MEx29LW5ZDGjvtQqCNDg9knmXXAevqNvYTyDlRWckDozZsdrCiBr48CtqeDbCaPTASjFs6F2TfA1Q/qcojanpj+B/UtLmUkn5YoZJe9WUthxyqJ6nBEmYHuiAQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624411; c=relaxed/simple;
	bh=97jCrfJLul7kc105qG9+OBG9JEfnJOKqogY4DP44QCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m51L4hBVRdVGYz4U9ikorEJK4lH1qmXZWbqLcBapvnLsJTd+Ia4/x6TNbvwuGWODkuh4h5s43PuTewtJ9pTGhjz51eV9jLXGd9URebo0YEHadvdCXTNWCSt0JunhVSTGXOsAz73T1OuvbO8m4GcuneLyg4Tx02EjTYR44Sq2Kls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVmUgrwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WDaeyeLN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVmUgrwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WDaeyeLN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXBAp2327863
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 19:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93SaqZgRCSZmk9+Ho1xlDlbMr7fxHHhWTs2lCLEiG/0=; b=YVmUgrwNnfs5PiOP
	xVFJ+HLcHPcQzDiBLtL5JLLhOBBI3ef8L/ZUJhvcvpxV1hYIta22f8DSSRBncqzu
	JvAOXIp31N47AmnsygndA5oWLS+WI8EQv8osBcvo6NTlk7E5fqXkWAWyAdbadji0
	ONX/xMAk0wHhMinxZuhejIbE9J4BFODILamS/mwvJjeb+UjwlxIj+EnWOvBMXCjD
	RA/0w2NQ5ZU4At/d724ZsyQZ5RIPlRUpSwuJjMeCtymfqsTf9+IyTTwJwQQ6w6pB
	OmrOHktk4Qgo8jid+3Kifc9wozrVwNBoKdwG9aErCkbrNUcNTBMRfNkEyMm3Vwz2
	yeHwMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24ruaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 19:13:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso364501cf.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783624408; x=1784229208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93SaqZgRCSZmk9+Ho1xlDlbMr7fxHHhWTs2lCLEiG/0=;
        b=WDaeyeLNeL67hGG3AHjTFbvs4yaLnO8HJ2SdG8FazFIbI2XYaZm9WOhB3qDzoDPq7G
         2s9UurA0pow3XYVx42jO5uFN5NEZjnUCmRVD+Dr4iY712AayiZjUipnr0rMA+TBjwKw2
         r8Vg0Pv2j5io9yFPi7GAQRi5Az6d/oNNFT70SHbj64fhbKHRXmE/IM3skmZLejMs1QFf
         Ir+oz2uMLxzUQMVjmgE7L3yaMV7+JZL8v0K3SR3f/0pf27PeZepr2tb8xJt9puDCnNX5
         CRpM+W1jI2vdEEF6/I/bMiBf9+AsopmZzh5aum0UpGXR/bpJQBh2jbt3rAokoqSFcP7I
         JQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783624408; x=1784229208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93SaqZgRCSZmk9+Ho1xlDlbMr7fxHHhWTs2lCLEiG/0=;
        b=H2falFSj3ZNxbZvb1chJXAFgQFQtkfNfv2jTnQcziqf136/LFI+eZnidLygAseT1Sv
         qj1IIhjbv4HeRjJw8QQJrbNYqFiEN7mDIYPGlw1JHu0qC4U6DoixrBB0xfIHmkOLwXKW
         5RvFE1LYrHK6ezAz6UHgZHqOLZAEJKm5vz0oiAlo0ZpRfNz5mKD4zoPkqXPcXceBL5SQ
         nnJRLSxM58dN+r8tB48aopmKpA4C/ybZ4LoP33e8wN17ljGIxBDWWjK6MrLPQsukoItZ
         f4tgX/Mrq0gutm7TsztJ+JgtXFL6wNg5wNtdz+s36VQQyHa48R8+on+y9SGIkCqs/8H+
         gxrg==
X-Forwarded-Encrypted: i=1; AHgh+RpDg8T+tqdFux0Wopb3OuruE/po/BDIqmoL4VlqUbC2JHNr8zSSUXbdL+HkGJ76btRHQZ2XpkrK+l3G@vger.kernel.org
X-Gm-Message-State: AOJu0YwAQ8LcDOicMpfap2jVA8oKFAojnir2tYmpF9ATgO4jLsrIfeLx
	mGLVzdIyjv51Djx2UCVYqvtJLq8ftq/X2nAOJNnf40okSB1hjywCRey4hQfhgkPTC22+EVvCRat
	YIfvso7hliqwSXm8JGU6atSwV1BG2M28jnbwFLAkM0+MxsPE4pbeC8gYljlL1iKkR
X-Gm-Gg: AfdE7cnH/pOqbRqGmZCQpuGdy+wn5knfWQPV9DlWyUkL+MJ6BKZHMzBE6oJvcu/D3hn
	SHk934v7guIB4kGB/YR7RCsHQfux2bJEC+KsmlkPHRIfHRbEnKybV2ypjPljvoenGeukshlDhMG
	FF7Q6UP5HfsPnf7RuWvNaRNcpZ6/p41CcurMmuj9NiuJ3BObKFkXe4EoOAcA6uJoR3UeQ1AdXXP
	mFEIG9Qem09MG8kBzcm8+liiT2yoUn/Xj9/FZODj2cu72Og7gAULwUuetszwxlOLYk92gTyQWmS
	UAsXvH6yEv01+hM/8GqxtS4ZJoRmSYsGZCXN+mNN++pRstKGzJ+BnQ5+w1WcINiir0uLN3u/zI2
	pv0tBQs+HuqLjMeyg18aVCKOuPoRzzc14QCo=
X-Received: by 2002:ac8:5d41:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c963e7d09mr47417111cf.0.1783624408375;
        Thu, 09 Jul 2026 12:13:28 -0700 (PDT)
X-Received: by 2002:ac8:5d41:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c963e7d09mr47416731cf.0.1783624407847;
        Thu, 09 Jul 2026 12:13:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d5de95e6sm277444666b.39.2026.07.09.12.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 12:13:26 -0700 (PDT)
Message-ID: <b9c41d2c-b036-4d58-8cd2-da94ab6b9ca0@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 21:13:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: shikra-evk: Enable A704 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
 <20260710-shikra-gpu-v6-7-b388ec5dce77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-7-b388ec5dce77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r9s8W2OK4FwHa_d7o6mK3xz5Lo1PdFdd
X-Proofpoint-ORIG-GUID: r9s8W2OK4FwHa_d7o6mK3xz5Lo1PdFdd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4OSBTYWx0ZWRfXzlHLap2ZmRb+
 vjaR+ntGi3pYLE71UaI3OnP/Qme77VPLVm41v33eAhJzvnr71QRGXUtQU6XdBaclm4pUvYZ7AEY
 qo7OgQbFld3uHwMCcRDzLxSrQH5pIco=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a4ff2d9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4OSBTYWx0ZWRfX58awOOyqnAoO
 3bBRGWkLcUKCRvfgiinQv5z/ZyyFKUZtN9tEOYW1aQ6uhc+oyrw5DWlyn31BuEj9PwZug7LwBuz
 vnfP0jj4FdEdhSpvJBB6sltgmzXQxu+FNAs31LYuQSqhYBmUGu++G4CJ335GJlwd7N9ou7zbPhT
 mJteIFl/MDeEBxIo7K4vSa/+1yxRhzUoNt+8eveGrvzm13AtR3PyHU0QJWVcm+QbN92Qkl8cTT1
 zgv5hGhnUTRRYEXHVovRIqFGq2X0fAkl7Czpb8atkJlqKXQ3qsPGD9wIABm4ycD/VIwhtANsm/P
 mrHYSSaqWnXCOCrkxbCfEYtd4tHEPA3ahNWEZ0PzxStfd6Klc8DYXA1GnaUHuTXixftprRzi9UA
 i5fMytpduLoiXQgEwp/ajxLg0j0XWRFl9gNVceNo9awTL65kBZNQU1rXFqJj9C8f/lGlUDJ1mWA
 xDBIFHWI/dZKBbmarrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090189

On 7/9/26 8:42 PM, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra EVK boards.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

