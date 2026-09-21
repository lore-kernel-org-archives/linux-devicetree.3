Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAAE493D2C
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992067; cv=none; b=AHF3XaA1/1GAh7HYurrSeYOEV3IgW6uSXpgSn+t9Wc3wHGgqjk+k/foGv5RdxatO5F0p0H+ZPHMM4UBKatszffa9sSh3OfPJ6oPg+uHf6wa/OaFg70QXD+M0cCjAISIkliblvpIXVY4lg41e8Idh+hxYhmR7IN8CLXMq1EJZt5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992067; c=relaxed/simple;
	bh=xJYmpMkdOypN7Sj/n2yeRBJRaKDrZu1gaBC/xhMqLj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkGSs6dP1EaQlkP/uZPXR4M8DjUgtHkuB5800qOk5LJsbSCP/SnUxPEXbWGQr/ThB3tO6ZoE9spVtYD0qcoIYWyYvHqjMiEKBJF2gr9tCcspXMSZHuiKv7fOsBdEqaQW+UO/4lsN+KhC3gWO8Iijd7DKHBMD+StHcuB2cslO1Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mm8eWGDr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLnh3Hzn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mm8eWGDr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLnh3Hzn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeLwe1219039
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WexGBER5d9uASCyOQRs0xONS
	Wi6CvrW7lSCk7SoMFoM=; b=Mm8eWGDrXAz/5Yap6kZWHCr5gxSUsrfrn5x9THLd
	UzuW5g1/WwNetvQ1yQzJJVrR7mPFt603Vmoo+KcNMqq1YimWb/7CEjDhvYSBIFO1
	FmKg6duF8mCLcCpmmsXb3xH+VPzwGqdMKJRe7YJ3PpGJUP0KoRLu2vVOea4qpPJh
	ZIGI6Ml75kN2dwemHjZscrRJ5FitfkmXtbtJ61Th0MW7MS8e6bGdlYi0lit4uVVA
	6nVLtzQtgqCUoWNt2wGlTmCiufffMM07ACKhCz/1RG5e3iDlZXNtuM45M6vSgfHg
	RbEi47seoqH0Ub41gyQm6qi6s75ORAFg9pJQlgi3i5tG5Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01194ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:01:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c846dd12ccso895329e0c.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992064; x=1790596864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WexGBER5d9uASCyOQRs0xONSWi6CvrW7lSCk7SoMFoM=;
        b=dLnh3HznMhDRdWerG4+EpWU/SJJcmmANlmxtAR0wUbpalENIU7Klwi+fIdbL91BjSa
         ZGroXnd6cg8YWyMgHYcv7Cn0YydPr5Dnahm8ju2PIJUMsJOs01p3myOKjSQ+ts1YrUO8
         +krrbax1Z4uMQ70cDasME6i2MG3cfW4XMdixWXjpV9JDrCXS0rIv7PHEMe3BNe0/zYmB
         c21F0P6rrIl5wQj5lg/U8epcjpGutTDfX81O3x6jrPeaBUVLyQkw5OX13xk5e+htXXaa
         GBERuhiBgUglVVKgqedr8FV+InIviXmLTjaUz/31dPAb4bWgyQmWDQfCcdh9kgR0ufjJ
         bzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992064; x=1790596864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WexGBER5d9uASCyOQRs0xONSWi6CvrW7lSCk7SoMFoM=;
        b=IqzM3SQZZ16vYxIBaQCfsUAFZvT7H+fQSTgaxh1+QUXtji44jxhJhqk4HoTjLKh4zf
         fXn2QgVEf0SJfH2CF8JRwRFbsSH6x4FSAcYrRsTSkALCBqdD/2xJp/4+qR944LX6EcEA
         AlBUrEM8ZXBow/CmHMc0r4HP/AkKfoNnIk/5sgSy7gfqhHqKrXngJJLdT+AunFWJwHG8
         he7eFLts/W9IwmiZUz/0gZbgggPY4z+Lk9hJgQ7v3cwWkgsXQ2N0gN6YeF4xWHYF1Gq/
         RsKHubUwARKmFoELE3iUskhXvI2Jdo5PzCp294kH4owROZNOJX7Vd+boUiYMJ6njsYqI
         +u4w==
X-Forwarded-Encrypted: i=1; AKwUvBxG9WRejmdKnUJQMoEfWWi1rfmVoYUJCGd2Ludf7EeMQAvFUrii5veo5h8NX6NF7nrBwgUbAYD7Jl5W@vger.kernel.org
X-Gm-Message-State: AFuF++mFzoUe54PRKShXOZtvT6QyQ08iGA439olneOVYvlyw64fn0X2I
	c4iulCVOFpgvXaYeQx46AYg1z3QEA/FME2tAPPCLHsk0v01e9j8Kw9VI7gc96ki2wuH/ydMpWpn
	xXMtrKePgN3ZNKXmgkvyH3ieWdsjOK/aQjAOitnSDKHhFr8NZ5c6ihiypGyipvbVz
X-Gm-Gg: AYBFou09TEjw8urYrdGVK3YYORV2P6FxUJRslFiwQMTpajUUFu+qtpfxrF3zeKlE1lk
	vvKsdLsqu5o26G61hcO/sCG+l691T/JSgMGS3HDrA6q2u7grqLybReRtUousJGsRDItQQXwLkWe
	VHnpQN4hlfgUj9XTrbD7YnN+6LMQrNLjSgWk9yG2gP2rn7J+P9go/YbfxIAV7sZiPkSvKF0pQen
	viklLV6S+iaapYqBW9w7J321+3vNte63LvtOyLjBsVEAGl33tP4tpNVbyQu8uELOH1UqIXziNBL
	0iens0dH4vl7Ti+Ei+9TfCfINq9L5IQeHwsN0gpuvrAblZC61J9cSSutLiPJNlhEi7rVjcLPbCt
	gfaV74ZX877sahNM=
X-Received: by 2002:a05:6102:8008:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7a55e1a44bcmr3760516137.26.1789992063401;
        Mon, 21 Sep 2026 05:01:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8008:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7a55e1a44bcmr3760444137.26.1789992062795;
        Mon, 21 Sep 2026 05:01:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm294306075e9.3.2026.09.21.05.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:01:01 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:01:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 touchscreen
Message-ID: <dqlby3gbrub5x6rdwd655wu437xonhlxhvrhxaojupi4wzvbff@3vgdyj7sxmw2>
References: <20260918-eswin-eph8621-v3-0-514eb1f622c0@fairphone.com>
 <20260918-eswin-eph8621-v3-3-514eb1f622c0@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-eswin-eph8621-v3-3-514eb1f622c0@fairphone.com>
X-Proofpoint-GUID: 7Tqt9gjyeLuZ-sj-QEgiCQeqC6FThKFd
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab11c80 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=HVTXq6jCC7j2OmNmFLcA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX5Tp+Mw7Em/ik
 T9cIS1PzIC0gD/ejyEtxh+gSRZMoJqeaWUKkhr9kjBz9SpyOmMCEs/EF2s+/ZnC+vz7VSQdxGRR
 qeqFQjjBNVhPmiebFXVLRm+LW6bNv15QvMHqCEwBaRCRuYgIdTfECDZ75xCScQ6O3hlfIM+m7L8
 JRBpwp5XrJ6yV4mpGo9gTQXaDEiNYGFD1Rbz3iAJis44J6k0ScZoc7wPRnXuR3iGK/2OD5ED/q+
 n24biyqgMHxB0x14R3X6fyOWjY6OK0VD3cAWZAwnKbsjpBiomCFcLJT9In6v1NKLe3bRtwlHFuU
 ASSbOgYxPJQg55MM3bUmw+0MlDNftUL2d4UlWVzGT3l3v0hNi8xk34SYmRNF7DFX6ecz4PvTu19
 R54oJzH6A4KVizx+1tOEXRxhqzp0WO+y8H4boMp66dAiEhPlJtBMDBm9e9rMOkb5k/1CrE1x5PL
 5e4ZbbiU6YbVd1V5jYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX045JiknxE02K
 fRD52tJEZtaoFuaKGZ2OLsPVtR/r9vpkffNtmbS9PbNWLgxCAn4hm8yapQg5+9IfMShjy1qvUlN
 TFJIhwyUE9cfkB5Fr/3klpsQuTcrr9Y=
X-Proofpoint-ORIG-GUID: 7Tqt9gjyeLuZ-sj-QEgiCQeqC6FThKFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210174

On 26-09-18 09:29:54, Luca Weiss wrote:
> Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
> pinctrl state for the two GPIOs connected to the touchscreen.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
