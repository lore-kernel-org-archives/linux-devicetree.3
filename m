Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0618497B8B
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162379; cv=none; b=OPR56OJRbh8XexTbAexBUfRkcwlvdl+fcGWqPhxS46SeJHi/wxyniJDCsPgi1nQQIvKG4J8mK8GJXhCNYGEJUDTiPHE36J0obi9VBFOYn5Vs2uVzQ/a4ggz0lbsdVZ656po1IKGGxJgL10+ScbakgWpoYxwLHoff6XGRF/qo17k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162379; c=relaxed/simple;
	bh=e3RItfsQ0FfH0wPgzNNhnyjLb0vKv35XtQWm7X0h0+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tlg4PdPebEXak/heAM5zwl7ko5N42NJGaWIqvXyneFG/q5jElXioYsdFX38k6gZmzQtIhTWG0S/JftkgZRLwuGpFpZYxduKapODP6gj9njcgJj88u6o3Xv+O7poclRJOFSpaeHfRJq2vlCDI1zeb50M35CuWy2eLOnF2CPUvX0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmKMDuOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHMZ4fSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmKMDuOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SHMZ4fSn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2sV52951636
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R5RKExqH8rkcjkWpfakw6QznRsAOVeNLpg7vGSvB+OI=; b=XmKMDuOE6bXqez7z
	tbM6dnwVKDwMq5/ZYdxVL3+CLxnqvIdHTtV3FlY2/hq4TTgETuTt+FekgtNmdkXB
	3vcV8sipk+j2AZ10ZAj2Zl/ja7XaR0WALyIZM97cQfXyRbJuLj/IKUgX5eZRnrd7
	va9wEE3SWLXdURejmEPlt0qUh+1cqSxEQAtz/gMJ0yqYWGGZ5Z6vTyQ2oC4x1+wJ
	5O+NHWmiJD22LhpIWePwptLJ3XhGKFUL1vkTfH2Uy1TynoYzOD9wvrRURa2lZh6o
	stlWKhILWwNSnc6VgB/tkDj2Orsf3K+7RW4HYgnHyLThw3b6jHWbz/Kx4f9GhOFE
	TQy94w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qthum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:19:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c29d85d0dso9213885a.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162376; x=1790767176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5RKExqH8rkcjkWpfakw6QznRsAOVeNLpg7vGSvB+OI=;
        b=SHMZ4fSnN7yr1n9AplPVqd+bmStrwT3g4vEHDd326qIRDFsdCNgN+8OHuMJvIGB4K2
         8Dxc3Mk5ZkMBk1Ff9YdmIsyhigGMAsjI38E2028oiQh4lrBFkCaueM+J5fe1D+P+Itv5
         jwGrgUl3FXwvvEdxKZ9PMqgI9gBunAqkokRJypkCwqtzc9lESTrwXgHiA6uIe0U5ZGP2
         Lu91o9mD7JI+V4m8Cy55YgXYOE7HQcruSnEBttIemZD00UBJs4Ety3Ya8IJUSxouNv1J
         nJ/+astVMdh7iyFEUBOWgTYx6P3ofLBLfWsEo7JT5z3Q2/9qUKQ9FtH71WChssVnHXr0
         p+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162376; x=1790767176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5RKExqH8rkcjkWpfakw6QznRsAOVeNLpg7vGSvB+OI=;
        b=IU3MKE1Ai7+ZTsKTigiIvBODq1QCs6PytFDoaculXp8r/496Vv37jHpkZ4wLhUu1HU
         QVdLnNKlynu4BGvVWuHIQ+kOrUuLPNikBq6OjblrCkJ3JRS+tudy84YtSAZFnQZmyBDL
         9AXtOrJEhsHne1sHNHCYZjPFNj5W17uDKFUTZDEgHVl2phtN5OGNUZ5dPrHSUqBz7bNG
         maYSo9XYsVacG6nMXHwc6OtobZ74xUl9V372v9o5yrQ697HnGtM4EdC/PD7FGlqqs3wZ
         q64p43pKcE+vaWBPLi6DSEo4HCVA89KFga2FBEXKtg9RrBC8u4XzXLGJr4h2MkZf4YfK
         MGIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfTmJGi3Bu2BvBMcVoaFss/ojmuS+ieQ+HgaSH2mjUJa70l+Qol7b3axaqQ3AihkyBEeLWo+mVQPMg@vger.kernel.org
X-Gm-Message-State: AFuF++lSi+/xnp+UqsglBRpsW4pwFlPib/9ccNKS7hqZcz7c1ZDQ3tz7
	eDQPLopTklYgnFrmqH9thnsihx9uzYlXeWW5mR9MeR/603Q0yEzF9czwdaMweU51Nxed6w+vnRv
	kpbyFO+2cb9NjIrvbofxC8Pq/PxN3jsUMXbv3xsc28xHQKsc9EA/H+tzov4A8eWCw
X-Gm-Gg: AYBFou1VcFQLLQ2RxMf6T2EfGOaCLpZc25WvIrl//rQFZgGSq5aeQzgfq2u94QEM2LN
	OegJKxu+zIMs68fyghmbZLlTti+M5QONyMlGWxwQva85zCqz+otywvO2Tz8xlZqMucLasZ9bMN3
	dxSbNj6dY8GRlHGBjxi3C2QAge5VBb1wPwVJKtPvIc5vuqJ33TYlRze5dshQyF323MnIAeEXO0x
	W3KgSDVNW6Suc82emE5x8qc1w8MF/k5QBIndtm0iBeWXFZ7wpBAtCt6ZaYbw0mvzN60vVxKVQWZ
	F0eaM62b1WgT9fU13iGRQtWYwAgmN57WdNGtMapeW5xxCB+0WCPuXa7pfW7TPOctwoA+fy2SlbX
	gM1RX8YgKHygK+2n+1w3uqg==
X-Received: by 2002:a05:620a:4547:b0:93c:203b:3e8d with SMTP id af79cd13be357-93c252f9ba7mr335754985a.6.1790162376251;
        Wed, 23 Sep 2026 04:19:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:93c:203b:3e8d with SMTP id af79cd13be357-93c252f9ba7mr335750985a.6.1790162375775;
        Wed, 23 Sep 2026 04:19:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab386e7bcsm1458942a12.10.2026.09.23.04.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:19:34 -0700 (PDT)
Message-ID: <cfbee1b9-4b13-4a7a-b1ba-0fc666b149a5@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 13:19:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] drm/msm/a6xx: Clamp MX dependency vote
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-6-0c3c79a1a470@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-6-0c3c79a1a470@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab3b5c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2GDL5SuO4PwTqS1bYXoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uSwRJCClLW7Annwdo9jl6DoJSmAoxnPa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfXxANGrYRiLOSG
 wGGSzzzsKbGkoAvtcFVdmiYO1vf8js4+M91FEr+MVAC0kwElG7F8IB8EFi+UDlF35K+juWOyben
 5DChS45dg9++BkTjAcp4Fy+uBs3HT4Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX8HfN5esRvnsA
 yZtTVjjUOruOgiYdQKCfOJJt2a9mWSj0DMRQf8cA5/v/nuYatkFUjsyvciPALAF7Z5eYscGtEUn
 6VljY+4et88uCghkxHgtzTk2LdgBYqbQ4rsCBGagtH5a8qJ4DlomYrRQBr0xr0K08AVlEXZAdW2
 kZGuXoVXZapAw2j1h2h2lE379BBnBerwSZaiiyyexst2rc0/upA9zBjbre1kL6A8kBCgqdkb/23
 CzJ7bAUu/iPA5Ylwo4QVe+pD0lvZ18NyXhBd3wUrn/VkD9XZeAXHKkDDVdvoibOE+G2xXpYkbIR
 4NrX//Ur9o9Z1FcfCOZgDdmA3kMjRajYjTXFIwUblavxZEMQHjM0djL1PWLROzqSUf5kpcxoRm+
 AI+RH1OESx9MzlRN/TKQ71dLK0KKi4FIeG2ti0t0pruVt3rg126PFh98csP8uAWc/rh8ayRi67y
 zxog6AkBGdZHoJzsiBg==
X-Proofpoint-ORIG-GUID: uSwRJCClLW7Annwdo9jl6DoJSmAoxnPa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045

On 9/23/26 12:25 PM, Akhil P Oommen wrote:
> In some chipsets like Hawi, the GPU arc level can exceed the highest
> available MX corner. In that case, use the highest non-zero MX vote instead
> of failing GMU initialization.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
