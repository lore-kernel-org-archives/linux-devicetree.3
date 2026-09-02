Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26463E63AC
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337850; cv=none; b=CDqYOfBFtbCOzWf8iI3RU1BPp1jzEX9LljxJklVN3XVMqzlciice38Xz2ap4awWb7pM8EIqgiQTynSjwgh1qz5y+cuFeFdmBGDy2JfmDtChtmhxr/ALIXaY6cJgKZIpFapzvAWVkv0+lf8UzNcpD/lkOWeNEA8NrvqhxrYhqQoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337850; c=relaxed/simple;
	bh=tkMRAwynas0vtMmEmk69bfrUgLXT7NgugZ7PdKriSXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suA2Pv7m1arRVA3EcxJt8zbwhKyl/zNFSTzXjhAA5wQ9IZzEox/8esw1hZ7/9tsEpupVtvhc4Mm3W6k/hDiUg0fcezC5t9TgQDPcrGo/GKUW1aF2rsG7kNnObKZptfaCuINYtNhO5yAYIk83PdM78J4jgnWb+rmK1bM54rksPbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LICu/EhZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVjGScM8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LICu/EhZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVjGScM8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826W7JP1205586
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 08:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNPfBF8VabNh4FXD7C4aFmUiC641VBjKV3b5yFILptU=; b=LICu/EhZU6y53ZF/
	jJXKK6Oayi2TWiH4oGlKIAJy9+sEghIgaP4jVcUoNLTAqgpn2IK4JkeuBEf2c0/e
	lcaPYmBoZrwXLL8HukNtXyxDljcLY2cS3hZTTp7XBJN9ZdO9019KPsrwj8GX6a9I
	gK4XNIeyLMR1cD80rdJfmzF819hmVJzLweHPNy6WrPpM2o3pKR5YMDcrJXU1sHZI
	cmALx2hGrBH6ugr1V0DxXDGodpfVadMHGTvTK8IlM9t3cMjlcc7bs/crZNoHtKmG
	V0KNqhjBb0dmxei3OGLph4IOeM+NF6q2FhrOQvH/h6xR8Q3YI1NiRq2eR+pCcaWf
	ww5RDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt49f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:30:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso17798585a.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788337847; x=1788942647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNPfBF8VabNh4FXD7C4aFmUiC641VBjKV3b5yFILptU=;
        b=eVjGScM8tVam/EKYeHuiOcXp1KGcL0LywD5ytBrG8ZZnMQs/m+Jm+DncYulfFO1FOA
         VvIx2YWPgBQvzk67r/Srgjq2pIbXN+WEATAiuoSnefPsSvtG+rj+8LQYhgCiJgtpcxsA
         m7L8NkGN/Y4MvuATB0gHCd+3PSe9iY+XHEfPrX6bfkaa714nH+5KKiznmBQc1hrWr7Im
         uwQMjUW4zJSZM0feXlboB9aCc4nhewODYAiTDMkkJCvMN7D360ttjK9PmDsmZDjX5SGO
         G+46v3rx47LvihgILSj5LG9K0UzX2R+BgUyO0vnwO2f3+vkQi6uk2r4s+/GilvzMH2mu
         wpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337847; x=1788942647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNPfBF8VabNh4FXD7C4aFmUiC641VBjKV3b5yFILptU=;
        b=p7GVHB1Srg6nrl9YCYzGX+AzBC/KQskiAI+XZnZMne2JQVp8GR2CBlexzRrcKIDVPb
         x4I9S9zgRgnZfOnhocLutHet3L9nUIXiKC9RhwKjli62m/wS05wnUCwtWnypIiqTBnrP
         xrM+WhQgUpoInDpfQsTcbFkgRlcAZm8jEQDpCAOd5OK2Us6Xu3X04ng6qQ8D7izxFVcX
         t8LFqsnkeTPplgicQB6U4nVk7Yxi7zFVBdCrHXemzwLWCnIWahHWNB+MBY3H0Nu5aTSU
         gQ/f60e4r1/ZUzohhi/1OAwYsQK27wZZPX+mo0eox6VT8NlWFr2oG9EdT7Wn+lE04I4m
         odzA==
X-Forwarded-Encrypted: i=1; AHgh+RrsL30lQn+Ei/Auc6SPinO53+a8yZCvwDtiRaiBLMIqOpLU72EavQhOTbFh8zUqJNsISD65DRd3wRvM@vger.kernel.org
X-Gm-Message-State: AFuF++lEYUzWW8QdiVBWw3PwpkZVZxshiYxU9Gz4pRanoLobIJQron5R
	wP+WzMqdAHIJuWlcd100j1JEDjTvkgLWxssvGGMZ01y34izMepJsLbRdmV9JCjn+Kggt0ph4NYX
	pO4KSWP1zzZVILXIGwu9xgJIWXCnfMrZMYHojJ6iAYB+NS3YSRG4VPsLERNx+Xts/
X-Gm-Gg: AR+sD13VVQLbjJM/hYlvwiT9SNAimjY0d7Lqatp2xK1M1FP+gaJMgqxiihqo+9JoMqO
	lWA8scflwKo8g9QBNbrgY11I7pQiTbkoUTDnNVBItdymJKihLaUXZp+KmT1SLS2HckVU12b+fsZ
	wzBO+4AdAqbn5uVGxApWc9mwy2r0Pd4bILKtjnBxUKQ2AdTcz4KB6W5tKfV5fXruwefX7gK0N5U
	oBRm97nl9BHQ5Z1pvwu6/7+j/hs2wt3OE7Xw0YTtz6M2z4XkvInlZQFdDr4EcBx2rRoCM/Pcv5N
	ccTX2xcC+m3Rzr5qQOiOvrwQczuWVptV6GS7uinwa23xyBmGw6og/hOOnnhpENfDIeHmdqTF1+B
	AC6qPrW6+kaSxhkbcDdjURw==
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr199844585a.4.1788337842258;
        Wed, 02 Sep 2026 01:30:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr199840285a.4.1788337841661;
        Wed, 02 Sep 2026 01:30:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d2c2sm88944066b.32.2026.09.02.01.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:30:40 -0700 (PDT)
Message-ID: <bb5e86d2-2525-4abb-8ebf-75ba7780bbd5@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:30:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-evk: Add power and volume
 keys
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3NCBTYWx0ZWRfX8l0nUVDj3znx
 WWqVahksAFx6j5TZmjKVtNGRGvnvcB9FWuioY04UTwSq0C9DAzh9HNbvtiuSCkoVIaYNIblPEf5
 w+NB7rmDOcVya2mrq/CJB7BsP2ZyJ3dtIACcNVBQpjbYhYpwgXRQKJwCeFCjxUGisLChfq+mfud
 C8BFzBPzaSf8Y/yIXgyISi2KYzBDmurjv+c4zoh8ezdUTlhouOjtosxf2qxCWXh2jY+lF/McErv
 aXoybXO99AWYC2vZ6RAAKvMwm9A6HFf3RDIuH41jNQkMtsSijxjcrnSZiwkRF7mTT3vxwW08cjO
 3i2j+MeZfMmSbpXNVqQ7A8gIALCzvjvezeRg0ILL64BBCyCByzAsbUcArnlUL1dGBcPur09GkP5
 TaC0QOM09wjMtc/kjQo83vfenZ+TOsmJfjvGHNEglfX2H+Y3sZZuYZPHkBmBTr+XlkBkXdGr48g
 bkFlJh8wGMKCg6GHpYA==
X-Proofpoint-ORIG-GUID: JRzjx7zt472QHiJvXvgzxA3BckumLOAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3NCBTYWx0ZWRfXzyLI9Npf2l6E
 Ht9VfE6YJcUUsIN2GMuL/zohK0oXOfbaHbMNi90OInPlHmd45PxLVBUDPKO+4T2xF4TZ4Y+/Pxz
 O513i2ArByJBXkC01kmTbahb6z7loRk=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a97deb7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tt4EhrpCxE_TwPcet0oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JRzjx7zt472QHiJvXvgzxA3BckumLOAE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020074

On 8/24/26 3:45 PM, Abel Vesa wrote:
> The Eliza CQS EVK has three tactile switches: SYS_ON, Volume Down,
> and Volume Up.
> 
> Enable the existing PMK8550 PON power and resin keys for SYS_ON and
> Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Can this go to eliza-evk.dtsi instead?

Konrad
