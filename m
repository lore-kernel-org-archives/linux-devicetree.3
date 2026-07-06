Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3473F888C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 22:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783377770; cv=none; b=C3fuThLw+u4ddXocoJK+QX4u93tXI1mCNEFpRaPvm1zfAjFV9jzSvmkS7qrT4MD8NuSmvdf8h9WE3qqAzx3j61ay6qMudTIsO9Tys6Xmki8OK28bRIj7odOUYyJj1lV7l9+d+iybyI+w6Fp6Xfon5A14r8rsCwQSOVKS9hOpejM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783377770; c=relaxed/simple;
	bh=Qfy3OCempN4Y5BVzVpnqq1Q6tQlf/ESa/KYkhk8eoKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQ2+gZ6FcWZZae8yVHm7kJtZBeOkAJEVRpEEnhA/HSaEXfU7iPsPThxFd+KLNXOYWSu6AxbEuA7QOphcH/rDIZkoxgHtXEKst4uzWATAZJHe9XW3JsXdzYFo0erwph/dFdPFaN8X56TfYVPy+JEyNUFmr6YAtbYWkwNAkKLlYKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9x5HKsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsTlr24G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9x5HKsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsTlr24G"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEAPZ1504913
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 22:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CV8kDjArac1le7/qQ33TeCbi
	KgouB0vf4bqv8CS58Ns=; b=h9x5HKsBzdr5r8agibMcmLcHDr44R+6nz2MDrABh
	AnwSm/8bNBezEsDMRavMK5gzdP3r3U6FrmbMRiD6kM0gqGM0smVDBArndjwpP6Hv
	65kRd6F6fzpyFIOwu+KZQ4OuAaQtT3+liUKSm4IeKTv+uFicgzxO4Nm2JotYKczE
	99PLAg0FGoXETYNCkVMMIO2J5gMuOuLfFCY8t78mBJFxDZmGlnBU3IRwBsBGIuJ8
	An5wUt/wKbHaFvMDdIHc9GZ7xVMIlinec12TljPZZuURWOeE6ZriCNkwzfOp/y+R
	4V1P9qS0GXbPIIqD61dxoD7cV0ORV+yJjilgNWiP2NSwCQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98k3h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:42:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73858d44c8aso513744137.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783377767; x=1783982567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CV8kDjArac1le7/qQ33TeCbiKgouB0vf4bqv8CS58Ns=;
        b=CsTlr24GcAytTAlyYLuoGz3cYQ/Vfo6UeSJ92AveTsOm4ZSFobBcrm6B+aMVuTBUR7
         IpU2YC2OaKlCQb1ahgWFQwHhaJeXZKbQObCG70CX5cJuOwn6HxmTAi5NhyioOQFwWpXC
         1xqHPB8c1Hlq/89UjJ2N6gMkPmIk6lnpZq9n/OV7r1FtTtQhJeQF3+uBeQQtKXZUhU+d
         Ewu27INdXg5qH5j3e9wnrtPz9NXEiOaw9jZ9TeVlgwnyHE6YziMgGq/fNzlsASCTvrrp
         DZp4Lqh/XL6Q4IcuVPxzY5aYE6LffsWiIYP4us8lKsyXTTpv11BEq4s7kVppvEsEGOB9
         Iniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783377767; x=1783982567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CV8kDjArac1le7/qQ33TeCbiKgouB0vf4bqv8CS58Ns=;
        b=bZAP0geoiGrIib1IBcZ+9dNG99HxLm8yUNr1GUaRoI7XGLMrBEma5hMFaSyf3inq7Z
         GvCpGy7SJ4oLPgx0yjGouzzvSsvhHRkHVmBZOzaFJrWRk6be280U4LGrFd0IRR823IbN
         9bIpJPZEeerPJJcomfXiTvdBJuau+wVdFc/PIDn354BdFAspcgxLbwfxRe5bUb74Mc1U
         sXsS2Lf2T8PTjjR/10RmLPR0byn8zHBLH9FosrcnMTzXg2D0AMwhNjxuK3LVJ3BeQKHe
         ZD9vaWRO944hlVxT6wXvnTsffILPLk7zEdRK2HjJaX6GZqovRxVlYumnNdMGNJpGdt/Z
         B82A==
X-Forwarded-Encrypted: i=1; AHgh+RoVKq/UJneKUD11Fu/JqJ453FfvraSUC87kVC8RJ3SC6le7cyQ0UuIE71sNHTODE7L+DQ1ERVsKswUr@vger.kernel.org
X-Gm-Message-State: AOJu0YwieFUV44YnclI0tgL0p9UeD9ZqRFI13xXA1RCQb3NWsyi76f1g
	zamyaOcjRgoLDmGl4Kxlgx/uDVrMUn1dv3HsbvjwjbYdMBuD9l1vfjQlC+toSEP5J1wd9DWFN30
	FBpjPAj26p0w/KHMxRjdVuYhDZwJuyGyxtGTI7Mv+DCaGpiJckT82vyPt+MJqfxU3
X-Gm-Gg: AfdE7clVELskHIkEy11grZkMBtjkhxxVspmmzLG76whVJiadxGBgeVtSkPNkH0PI6K6
	DXZkob4rif9U1+CcnED7OTjb19bxejOogeHJPmBJ846aOsWv4AGijr0N7vlfXQSVW1SOQLZ2eRs
	wRW+7aIV3lnPggtPa9w+Rg6O7FAirTFkv1Ak8bWWs6SV2eOPKdoqdzX4iABqSGGhk2qUGigpc8L
	+xcKorDJQGBjCbK3yPE2xeEcGXLN1F+MGEfauVaSjFS2ToDg0rOXyP1koDLZW6633sFV+czctwz
	u2zI79JBapfi8OA9a6HLS+7V2isP1STUEN4zWnxCVlHsSyssvPGFFswui7oVto/q1rpFIT8JJkA
	+rTR91XDXNTrN0aAmblpx3QC1yLPz2qTOD26L2E38fr+N+WpF3B4ZYL+jfwsDZ5Gn/YitYvCwF4
	M+S+znc+jWmKpKE70OvHNoe1/h
X-Received: by 2002:a05:6102:6889:b0:738:9c79:7513 with SMTP id ada2fe7eead31-744b7a1f1b1mr1297931137.7.1783377767352;
        Mon, 06 Jul 2026 15:42:47 -0700 (PDT)
X-Received: by 2002:a05:6102:6889:b0:738:9c79:7513 with SMTP id ada2fe7eead31-744b7a1f1b1mr1297916137.7.1783377766929;
        Mon, 06 Jul 2026 15:42:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm3223744e87.32.2026.07.06.15.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:42:45 -0700 (PDT)
Date: Tue, 7 Jul 2026 01:42:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] media: iris: Add support for Milos (VPU v2.0)
Message-ID: <p65zg6zyrclehc7lghth3qafbedfegicx7lgmia6aabslptzpj@emfkk3fuiz4o>
References: <20260706-milos-iris-v4-0-119cbe0a7262@pm.me>
 <20260706-milos-iris-v4-2-119cbe0a7262@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-milos-iris-v4-2-119cbe0a7262@pm.me>
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4c2f68 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pCneGzjeH-oKQgveYhUA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIyOCBTYWx0ZWRfX2f4mRPUT1riG
 G8MFxkXwkNfw+BVVK10sLv9dnsP6IwtKN1hXtBhDnoYLDhZLdOwskXBfcCjcSs/sXBJfRvxcoR0
 gPwNBiWis0kyUjKZWZPgBKJ3Mk4T5YmboGJCx0F2RIMvJYRFffGXyYCF9SiWCqo+SYiZj2FNKW8
 0rrO0CuU7S8iOXu1oguey1/1rg1hwBQHdPofX6+ofJPdfN2UBBv6sGy+fV4L+LVaZXlCEkxNcSG
 +IgDT/VQe3+h1KJrCIW2TXsexFH0fVOL0A5rRqRD61sXOzG0Zv16zzFYFexrSZmreLTmCvizcea
 1onL6dtAI46exMcrpEScDrbrgrVJJHBwwTW2exDPYiaVg+7A3GZc0qdy6zhKkURipqtLnwvBKQU
 +kZiA2DrmcwTm5Hl/gUnB4cl08Fu5V+91KN3xTiOWii2++NUBYri5Qx02ZBxrkeaswxh0vubC3s
 lPsDOX9Hx0SyETdanFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIyOCBTYWx0ZWRfX0hL2w1QLW5i7
 GifUEGxLnPZFxW2vyjGlt0uI9jx0boU1+955pESi585ARv0V2LYS1CXtmItK8W6GkIQxDS8z9Z2
 j32JIY0LosbMhu0EekjkdmMYjWKpAt4=
X-Proofpoint-GUID: s0Q0VpoJ57pgZLBLPTq7O-L844kVUkqy
X-Proofpoint-ORIG-GUID: s0Q0VpoJ57pgZLBLPTq7O-L844kVUkqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060228

On Mon, Jul 06, 2026 at 10:05:57PM +0000, Alexander Koskovich wrote:
> Add support for the Milos Iris codec. This only supports the variant
> found on the SM7635-AB that has half of it's pipes disabled via efuse.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 883 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>  .../media/platform/qcom/iris/iris_platform_milos.h |  27 +
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  35 +
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  5 files changed, 951 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
