Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00EB3E4C84
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058768; cv=none; b=MnrkQQpgCmOeZBCQsIIYSZFAmuYO/RcDT/0XPczxtW3sAGmoxSo8C1GyCISkm2pXII0sT6EgE7XFcVStObYo6Yp4Sd+n7IqoIdTcXXdsoKnBb6BQS/R5jt5oP3dWN2Cm9HtYcbN6qQMnTNA4WcsJ753r+Z5xgMCWvFZCNQgWCbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058768; c=relaxed/simple;
	bh=LKYZUkcCpsEGxqu5clSz/v06FaXbrAaDfBJeB6zn8PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2S815rZ8mXv8mUh9a9XjyD5UsS9gy+VvH8i/hxbOSaN//Goh9C4i2oOngoF5k+NMfLc13YDsEHXdQtcxPSsF2DHDK9YgzxQ7yYF5ugFuHYHpVDQr+ROjH8Z8oWTioSL3XlIn/P8J/KQVAFLUChJloLg3opXiD0MSGNuW/B+pfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnObDoAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MbhAhGAE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnObDoAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MbhAhGAE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466BUY2152048
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 09:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HW4GtVL7H2//3KHfNW4EVTiMZ7Vh3ddHH+POLA1mHgk=; b=XnObDoALF18hvUry
	gOB5dQhjQR/M8vW04bRwE5I8iZmWU2sF7ne0nKXJQp30xr3TKp8hbv54EJWqeL0G
	15VqWhoDRnE8fDg9MgHtwAPLH56aP7TJ4omG3LShosf8EInIGi9GgEJy1VCTlxD7
	E4JvdiGrgIOEjsxEN1qiC9UxgG2PGcZIEo/YFGLWOfIS5EH179Dcut7UWsLpz4mT
	jLgxFa9TCcuO3gqJz3MJlJG7C/GVbBWs+9YgZ9RESJDh/giveKt/Zl92GpQSB+ho
	Pd0pUUcvxUkpmk3JXL82r+u8m46CDyQDb9dzBhEec/ZDVuHP3kJmHOUPAjEl53Qu
	jVTFIw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj80c08r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:12:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5751831fe6dso403834e0c.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778058762; x=1778663562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HW4GtVL7H2//3KHfNW4EVTiMZ7Vh3ddHH+POLA1mHgk=;
        b=MbhAhGAEQVm9vA3JBInBQw2NleibV96bjIq3EXc9QFd0gNxW06GyRzPusRVw3h5UrU
         yIy4Q7DK8t2Z79LHQziJ+eOf1z4XQ6td2/wL7ee4nijOJrvTMwBINPsdmzQVxWQ9Rmpq
         QZsNV3GFVFn1yTjF8LlpcfclWaoT0+EWIeo1Gy5LaWeB61La0wktO81z/4NvuVqPaXGb
         9ujGfx5qdgtxMnx5v7nC5ncrRz5VYGANlaQIndNaV9hnXdDbT/IrhnmEWBhx5RhcDJKe
         XqzR6YsQhTxV6/n1GHYvOwCpeIo4qynZ4bOy7+1venQcN3DVPxLnaedy2v3Jfsz2nkdn
         aLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058762; x=1778663562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HW4GtVL7H2//3KHfNW4EVTiMZ7Vh3ddHH+POLA1mHgk=;
        b=W4/2YfkJfXwElDznDgsQbEdTT9GigQQ/GjS+3B4Z0ytcN/YK8+ZCOvFbbKIyNZiARJ
         vT0p/QtXeuv9yakEkMTqVGG839nrrfuHoZ8YnyRDq3JKM8L2FGhCXW1PoR9YVSKh/iI/
         VDaDbpELxJmykIY7AxczyKJ9VAdbIn8V0bKKwVkvB7ucFFSjK9XeY6EsWD7oGc/15tml
         1/ylKEykNJsqG3iSVhjyoDILL09VxVw653BKwWmUNoZdgMdY95m0LGHaUl1wJN3pEYn1
         ghJ+vjDBKfJcBmLA82RP6EWCdgJleYwIL/J9ZHqLjtYOF4FB2a7mqTh6Fwp0yn9GqKaO
         HGCg==
X-Forwarded-Encrypted: i=1; AFNElJ/dK3H/9IoRLUtYHfupurL6HGaJ/HLYzAEB4U5hVZOCosrwHBrp+whySQMR46n8lUKWiC3w4gV78Xgi@vger.kernel.org
X-Gm-Message-State: AOJu0YxboKOzPosBcedQGbu6j/08Jyi2tKupYoJD+jGQJXPSesvXd6W3
	KW1SfPQsxX54ocuYXnMVsW2sbYrwTxveOakXS1l1Znppossi7dUakaVi/SY1xR7oUkocIzHviFd
	Gs5n8ZIPA34wyOTe5ZJrK8ztEeHYJIsqlBzhx4TteFf4HHz/gW14HNxf9oqgNCYjn
X-Gm-Gg: AeBDievmMzUy2Ne0EZIATDRCj117t2kSgkU6/9np+SHwkHXYeKiKmBpamb+wwGzUvIK
	F7p3bx8VWO1R0raOfN8+fcjmLH1Qx05pGpKP6C3IPmzuLhOvdaLb/qe+3dmFGXR7F0LeeuN/iUT
	z5E78dr5MkXeO+KHH96i0FOba21TwkK/OLBwVNV/UzqEuF61AtqZ7Bbq7iwtc6UBR2L1DzSHbZg
	C46hY23RRzILfC86Zjk6j4WitYaDyfdtgPNY41fjeBXDbSBG3zLldflx0lxoY5tR/lqEsxupD1L
	Is4/0XTqDS+t/J4xN7dMopZVN//i9kB2BM4lt/YoDH6jE/ZcDV4nTERaKkuBG4kBDAvyZrrAWVT
	3gpvNbX2dYuFK1A417yFNPafOgRPiDuN89OftMRGFrYvjKXtFDpb01ksycGKhq5WaOoO8iClyIq
	XZOdLBdGVsWqt98Q==
X-Received: by 2002:a05:6122:2319:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-5755d027d20mr163185e0c.3.1778058762079;
        Wed, 06 May 2026 02:12:42 -0700 (PDT)
X-Received: by 2002:a05:6122:2319:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-5755d027d20mr163179e0c.3.1778058761689;
        Wed, 06 May 2026 02:12:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55b17c5f1sm60531966b.1.2026.05.06.02.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:12:40 -0700 (PDT)
Message-ID: <b031b46e-7ee5-4289-8034-83a547153e56@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:12:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Fix address
 in fb node name
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
 <20260505-sm6350-misc-v1-3-0b9efc22690c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-sm6350-misc-v1-3-0b9efc22690c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XvnK/1F9 c=1 sm=1 tr=0 ts=69fb060b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=y3nCg1YZ4dlb0M9iUO0A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: iuBWpJYNAzvRl8CHhrvp_dQxrNZmucvl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4OCBTYWx0ZWRfXzMYqf0SWOOBb
 aYkmXwrztUCScQqeIxnTHizDZMITnoFmh+Hd95FgI+PPErp8nzvhig/ZDWU0Noa6RSPIx0jLHT2
 yqQL9Mb2jrs9qL73B16woLCTvWVZ5P2uohzZ0ebJpfeAaXHfMrwLmxq5i2/fMv2dqrc0KtCzIoQ
 WVxRA+4gHNnc1FY9Xmh9o3GP72tw4cd/k4e/r3hzFpJVfFabs7niTZR1q+AYu1xcPvQcp9JAxDo
 rFVi8EfCD/UihMDM6y2uoTrliGILP5lrpV//rLqS8yECv5BMdhdFu7VBD/0loKDELdfYFdJ/blv
 FPakGcHmgnlwVYa9+BnlGF9vDUfsKUEbv5x2PEPBBkGguhf6KQ3pPZG0i+0L23O5mDsDaMobH0M
 BJuBjLi3UpSonpAiCstJP864F9Hw4VxSMQwLn49FcrhZ3uLzLxmoeP0GmlPjkLwBymI8FTWg+dR
 Epr20dQT1hiNl3mIdEg==
X-Proofpoint-GUID: iuBWpJYNAzvRl8CHhrvp_dQxrNZmucvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060088

On 5/5/26 5:08 PM, Luca Weiss wrote:
> 'reg' is 0xa0000000 so the node name is missing a zero. Add it, so that
> the reg and address in the node name matches.
> 
> No functional impact.
> 
> Fixes: 4cbea668767d ("arm64: dts: qcom: sm7225: Add device tree for Fairphone 4")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
