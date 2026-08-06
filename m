Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AF031352B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 06:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999484; cv=none; b=rWw4Kd8Gz09yRWWSyxvDvQYeSGAZGKUVcvXKp3w8xyrUJh/qPLl3V+uGBkZ1ZASUZjPw02yx66QKiaES/Us3933oqstRtePy7OpMGSDDu27Y+2IDAhC62FyExHdWUG4/LftzswHQADcptqDhrG54anuJlR2JxSW4nvoNMULvXN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999484; c=relaxed/simple;
	bh=pciF0FpnPJhmI9WDwgIDTiJjoE5sgXT4MtZ+FqfZjc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9Lw8h+VTwakIwzOuOmOu06EGEvaOSDwYk5GCvR298TJSkzuteGAYWFTS+3BbIr8Uq32WTQoJpHq3VS/fm+uEARX1BsEvOTbTtoB6iYoQAsO/mEVUmxGSM9BPvUzU1IYQGH1xlcOvCPwiDXoq4mPFbHoecU3MrhjEzb80TeYCRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEVhij0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDc03rvQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEVhij0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDc03rvQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Nap2D1354126
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 06:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6mBGbXoODti3mf86ZaLpTnIjEBpZlKFAJOjn8DUdqg=; b=IEVhij0v8r5dJ7da
	KhFr1pYFLU65RdVNfYSvyT2Zg3KNP4N1tKwAzxrqg/TpkGp2Gy+vkIqhyeoYCEx2
	wZSOBSNCZU9lGKQaRqMPbqdFIzhcq44vghOH9hzAUhBeCJbu787TePBA0z+N7yNM
	vMlT5FUKEWl2PtXVerHpP1UDaXPhuEVWzSaeVQOeLFiwZ5qLL9gGaOwy1lZU+9eo
	O1cOQmrU9WdoPt4mJu3ivCLL3N9YdXI8RBx3XT/GL4TqyuGZxdOt8mII988szZ0h
	I34GVIn8wl4yEFxz6b2ATLQx8dyFDOH/ImOCy6hoOzh/ih3AkpqpGLyM5VHyUvv1
	/Dg5tw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmjter-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 06:58:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso5426661cf.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 23:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785999481; x=1786604281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6mBGbXoODti3mf86ZaLpTnIjEBpZlKFAJOjn8DUdqg=;
        b=JDc03rvQFtP/FJVEuKXtBY63cn9Dis5QzRj0DpQqnbio0EMQ5T0vFm60rh0ZPqGEyD
         +ZvVJqfV2zZ2v/M0OQfIupQIxJIBLW2+OLCUviMDO1XmXf95aEWy0HIUHySIE1hOVlhn
         9jy7/H89OVTlztsSlTl2HXgI7WzEbV/0ynFSK89ZSKbgswokjGTyFO3ugIBCv82Mst5Z
         3r4reA7+2bVvctU3vjM02GpdGBLuzxxYBVK6IUms2XE4jkpE+yLdFQBewm7M/sZ8+0v9
         ozz/uQ5lH1l34E0EYN1fDDoPhETkytYWpvGi03FXIe/lXh1Z5BJOPp4c0bA+C2rPP8De
         i+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999481; x=1786604281;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6mBGbXoODti3mf86ZaLpTnIjEBpZlKFAJOjn8DUdqg=;
        b=hlbwGkpcKHzuG4HcSM3YG8NZsU7y/UXT32JOlxxcywiZAQPNjfUH2uUk/uDVOLoOIW
         8cN9alUoQ8SQlZanOHPJg5DRu1JWmDQfd3Srduq0TWSegOWMIT8p9WX90g5EJimmTHjF
         PlMoOvvlURLZ82xVh+E/TVtb1UrlcPTj7ESL0LY7EPAqmr/AKtA15Tc1Qt2QpdjLGxCs
         Iv55BhP9/N8v4IVOFhQWKnFUQPJXXMhmTYFBM2AlhSEfsz+UDGZ9z55NACwplnQp7W/s
         c9U2J87gW+WPdF8+KstsxgibIKnyvZeGejnlRU3wgiRpYrDd2Hn/ZuNCefdK4Qm/A8Br
         OKRA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7YKcpAqqbfBXnliul8ibgWVOApwC2VUuMY4U6wkrnKPO0+f/LFRd64myImsvFhnorGrJmGPCTKV37@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5xxX+DV8T2x6JsbgkZGWsSTdNziK83XOXYp1lqilzvsiGtFEr
	Z+lIEiVC2pAX2dnUV15trYnkeKA8L61Bdmi3cQBAw/1LC64CmaD++9pckkwyjEOS9yH0k1yxh7K
	A0X8KkxYgAf/YVrPnKKVUtyTzvKWPEZztlNli1bpu11EOBAcc3Y0px5dpNU60wp83wK3JiznA
X-Gm-Gg: AR+sD11DsKoHgn/DjTALfCNHUiH6rTudXNUYFAW4JZZ1cs4KBOEAgiqRIw9r1/cEQ4R
	FUutSniJ/KePI+W2wIj4VTDVnlPa+52NafApBVEgWmyO0lDGnDsITlClUxQbb/nwnVeKYdFi+f/
	sIRdjXQbuHrlhGzTEu2Gpmc20Mz21LrTRA1bUwi1tEhmCZ0qqMS1MWOzeXlPBz5t9meoCeYr8eJ
	XEPK/yIFwXK/N7nfnAyTWY8UQ5XBkKxUz2Uk4clqRhcdFqaun6+dRJ8cjyAMtTdYw6zHdUS6ZOC
	ulegtoEoVR0eqeaosevhVwXOZblYWMCJdXDCrBq3OjvpBQzpsDvwbuPQM46r/tvCPadToSmcHU9
	LsHr2sHcLuprWJrZ9Gt3t58gZivtOow==
X-Received: by 2002:a05:622a:4cc6:b0:51b:f992:9e18 with SMTP id d75a77b69052e-52cfaedbcb5mr49249951cf.2.1785999480929;
        Wed, 05 Aug 2026 23:58:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc6:b0:51b:f992:9e18 with SMTP id d75a77b69052e-52cfaedbcb5mr49249611cf.2.1785999480420;
        Wed, 05 Aug 2026 23:58:00 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79a7258sm3667089f8f.3.2026.08.05.23.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 23:57:59 -0700 (PDT)
Message-ID: <b1a713c5-9402-4dea-8263-f1bbb3cf90fd@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 08:57:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: gpio: cdns: keep AX3000 compatible in enum
To: Swark Yang <syang@axiado.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jan Kotas <jank@cadence.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260805-ax3005-gpio-keep-enum-follow-up-v1-1-9155fc19b631@axiado.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260805-ax3005-gpio-keep-enum-follow-up-v1-1-9155fc19b631@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a743079 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Q-1bCtxDXAzAzqhOVWAA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: C6tl9KKMYVtRcUUs6l5hGM1iqCP_1ElG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX8BSslXdOB7nj
 2hNogc11b47DYGR+kLma1v4YvOKDrRizDp+qrA30mgBs1J6hy5tbdjsGjmJzJ994v13DRzAP8lo
 rdyC3EZL9xPil6eHA6Eq1ah/lPqxRqc=
X-Proofpoint-ORIG-GUID: C6tl9KKMYVtRcUUs6l5hGM1iqCP_1ElG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX4f00/EhDAARn
 6nkFA4rsCWj72DACOyl7V8+zHXQpbNA2hBgvgjqyLWFsyxgb64Q/H3Jy3kXkuW4fl8MaMn7T64Z
 HQ8wyUBvIVehMIndXYEMMn0Pf4xx7aUxra3TjieQUY+28PGynA3GWHTUOHsKqiBd7DzA0gBDUER
 OTXZfczKgOeiWYkQAfPqEbOVpCp6UNJgeLFxN1y8IzwjO4OgFhcJUHgjK6MNXiCPu2h/DrnuWxh
 Mb10rXCQLwWgM9np9CGgb/VWvMqb9lBOXNTU7Ci10CHSm6Af1MCdsazDRcbX2Nddkkfc6gvY0lm
 BGWg1PFd/ve/rFFBNF9GXg6Z0oHFIX1OYNHHeocntAkG8hfzB0OCsi68t8oxrUovt3SSEgVgtW4
 ZNli4v4jYtCvxJTTBxm212MYWrfnnxVWCouxkBeYMjNCRE+c9wfPKfP4+p3UEsNJDjc858MXtno
 Ju/Deucv7qvLsbk+zyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060052

On 06/08/2026 05:55, Swark Yang wrote:
> Commit e8a40b356688 ("dt-bindings: gpio: cdns: add Axiado AX3005
> GPIO variant") replaced the existing single-entry enum for the AX3000
> compatible with a const.
> 
> Keep the existing enum form as requested during review. This is a
> formatting-only change with no effect on schema validation.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

No, I did not suggest such patch.

I asked to make changes to YOUR patch and I replied within a few hours.

This is just churn and for sure not suggested by me as standalone commit.

Best regards,
Krzysztof
