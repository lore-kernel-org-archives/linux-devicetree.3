Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B833CB566
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784626894; cv=none; b=phMEiGOqaDmzQ/SO1BZYJ/yLxDM0A7EDm/Cn/rwYjXivKHXS/R0cxco8j7YT4hAP5uJdXNQ8U/FVUbUVjGQE3kQmxzWEZT2uN3xcQtvnIeuM8F1EOixlOPqG0l8EAzdPBVg3kRVvsfo25+SzIjDFuN/iA6y+QOyiO8c1X6vB7L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784626894; c=relaxed/simple;
	bh=v/SvcGp43880lSf1F7uOkXHTEejbpy/VsmX3Lviv2+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+MJX+WFWnNhV4f4D5sCAPsvxk0pz28xd1gKah2buhEzQ31DNY0gb03ZPcVckxDNsPfqM108T2dP2tre6Zg1fHEVnVQqV6bkX5eU63McfF0mjWxINNdhVGI1+3rU6nU85SCZDrr4W2OSv1yB/UEyaO1twU4k/NzOdr8r54KtLuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osZmvz2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTpPMxe3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osZmvz2O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTpPMxe3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6BfSc933223
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/SvcGp43880lSf1F7uOkXHTEejbpy/VsmX3Lviv2+I=; b=osZmvz2OL5eaeetf
	uqTgzO0QghX68fNOSXs1rUoW/ihn9eGV2RADc4HmdMc7gWXhCmLEiPK2fQn5icvu
	HiwYRORK4y0YZCJ0gAUlty5pFFQer9gPBG/OHKoe4dqlJyPznkm1R89AHozE4r4+
	76DFumgj4qRKR9JN9BJxJ26Jg1pCqdJyAfbU069ZRW44IID+VFfwmbGwE5TL4LS5
	AdXCF1bPKR4l4ioB5RyD/C+ihck+WVDltyKrK41vkDiIXnRzc8H4LDVZrA1sf4IU
	cV22+1U6Cyj/grCSLF6tB1z2QvJzghd7o1hH5uqvBHWix7sftWmGrv1f/DTLq348
	shzZsA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5usbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:41:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1e6f602cso167535911cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784626891; x=1785231691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/SvcGp43880lSf1F7uOkXHTEejbpy/VsmX3Lviv2+I=;
        b=eTpPMxe3pQ1GY8WO3vDa5HjzWO7pq5+t7UplGM32RvwYDHxeyf1dRaEy8iFsn4xpGK
         4LS6fNXjHyzhq3VHCErq5CZwvhxzLNF7NHMthwyxzgcWU39k4nw1ljuSQzj4u1jViM0M
         g+16/FPTz+AkoMsg20m9nUikSuZDq+V6+FcaaQt6DKvYvFzcPphdECvXp8IiIRkAyxVY
         NutqWGvp/CGZWaNPvJziumVi+3RuHbQnNhVvPTcARAY415Nh1Qx1wHBmseHVBMkyaafK
         drE5d9VVWYHKPoToI/xIA7nW6ESEnSNPORPgqyGMWOIu+8GSteCfxtiEzIyWWeu/SUz5
         a4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626891; x=1785231691;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/SvcGp43880lSf1F7uOkXHTEejbpy/VsmX3Lviv2+I=;
        b=Eny/5y7Gdbi5UpQsUt/2b1QrgExLRAgVxDd3lwJ5kg/1eyVYreGUItWfdqGfUbUf0i
         0yb+pkX+c60M9l4zZ19p+UeuHcGSm8nspKDQXjIGWp4viOMdde3Kz5ELqa8qnBoSuC2d
         gXbSPwwsFWTcRJxSoYfeIuE9dgp363Avgn5bppDbTCnjShwGJD1L92DQ2yb8g5qQ37Gw
         uhDitUw53CdDxiQX37wb46LS/LY/s394jSKmrF4DwyUflNKSIOqKYK9D8jHbj5WfbxxK
         JAFhWWEYtrI/ZY3SDiRIdzcUC0NnXol+KK1sr6oTv5lhGEngOodboW9neQMRLFraM9kN
         CqvQ==
X-Gm-Message-State: AOJu0Yzl7f/+ROrn5qI6XxuCSgv3X3iKDYKuxosOKMKcPTTnPUttgnsn
	Yi7xKlWUv+TWCEMyhM4fqHsxmWsaONn1kw0Kx+z3V0rnrRQ2QmJ3HaoZvKsdnMlyT2Aj5NnNW4y
	PvzefuKhb6k6FkIvwvqP3c5I+oalDPB65v7WYpUieSQdfN9XHbjTNTbdifaIrorP9
X-Gm-Gg: AfdE7ck3jWcXm7iRPvSQYOMpBNQeK3JoH5Wq7wGlnx4DiSIqQajr/x3+HV8j1LJuiUI
	bevxQCOhmGYRIZTLVftebah+vYK7Pm7aW17F739bjFSQ7JrKdiK+F5oh0iQs600gUGHh3/Ei97/
	SVvwfJ7iyTxjxkEEFXg1xA/bdcNnvBZmGA34mm+y7kch3u90pRPp9LABeVEU4sD2R8/ulDADr21
	my87jICw1sJhIfWc6ThXmRTcGhqsUvMwtham7XI6/rnF9p02lDpE8LY7GgHEZ9NA+9UNG+UPQQ8
	KEVKMqm8J+Z/WhZOtJdQB6LGC3NoEm/fb/N6mNSQWwnxt6dqYYkH77OmsVdJH+9Fp8Vwb7J3t0H
	FzA0fksUOM4XENTiYSxUAPHNS62JkFQ==
X-Received: by 2002:a05:622a:550f:b0:51c:ff8:cd4c with SMTP id d75a77b69052e-5213fc5a30dmr160266311cf.72.1784626891202;
        Tue, 21 Jul 2026 02:41:31 -0700 (PDT)
X-Received: by 2002:a05:622a:550f:b0:51c:ff8:cd4c with SMTP id d75a77b69052e-5213fc5a30dmr160266191cf.72.1784626890774;
        Tue, 21 Jul 2026 02:41:30 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563969482sm151004905e9.3.2026.07.21.02.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:41:29 -0700 (PDT)
Message-ID: <2ba9ce2f-6538-4041-995b-a04a15e81b07@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:41:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 power-domains constraints for Glymur and Kaanapali
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260721085711.1B1391F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721085711.1B1391F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: atuVknG62d0qXE7gjiQKnTjldtOdSb5l
X-Proofpoint-ORIG-GUID: atuVknG62d0qXE7gjiQKnTjldtOdSb5l
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5f3ecc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=hK_jsVp0PhnOJfhX4HwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwMSBTYWx0ZWRfX0dxdMaHLbKmj
 m5ZURgx2sczdIuB+XFjLFFacOuomt7u8vpzY9zrr9EUwyrspEt2OFcXxYt8gsPO7TMIsmZZ+vA2
 n+Ki5ckipXle2UKTh8zabwvUjSOJ8GQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwMSBTYWx0ZWRfX5AdF4CxYRisQ
 NDPhfzqW4GB7nZhJfbj0VVIh/sSHTtLD26QWjs5N6aMOzW84OZklfiYdXNgmN6lekOmDllkXlRH
 +GyFqTe/oiWWj25QvgVb64tfkNUhT8+9X0YGcIJfWQPheG5rkgr0NqncmJhKsn/xN9V6MGKq7jD
 eiqznrl9hj+PnYQ5rfP4y6Y0pQ7nP8SvHapzVzICIMh3ttrXPnB95UzC32Ezt5GJxsmo50r+yO8
 T43DpUT6GvV7psgC7NJ0uwuUDQut9L0xIZ4uBfDNe/Thq3uYmp3Tt8kPGo99UTa+GJnJ8OwDFmY
 txa8F+w+wdJRQZVC19o5R9oAYm5OJ3u23EAtUC4IqrtjCEXxFaeG6d69YR+Hredms8FEjgvkeaS
 Wq+JoqNT4XYwq/muX8Z3Mcf7yl+AUEGQ46pVEwFIq4lUWM/OCGccnd44ta3yWQVIhSU6q3i88qu
 ExsRV6gmIjD5wU/oy8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210101

On 21/07/2026 10:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch inconsistently adds `qcom,glymur-adsp-pas` and `qcom,kaanapali-adsp-pas` to the `power-domains` conditional blocks while omitting `qcom,hawi-adsp-pas` and `qcom,sm8750-adsp-pas`, and these explicit additions are entirely redundant.
> --

Good point, I missed the "contains:" part.

Best regards,
Krzysztof
