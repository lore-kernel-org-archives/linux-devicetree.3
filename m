Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E87A47C0E2
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252486; cv=none; b=YMd4m8UCHw4NJ3fCx6KwV+kNPegg78+QozS4BUf80EkMdmBcMsUII17ANCvFY686RN/FPfnL3wAT/mGSapWLiG+sooSnAjQDfeJN5oqS6A4tLTtF60iAv29VA+K/CWbZA1wALU0YlXMwZPTDxGxSeXNDomS0zFpFRgKl9Q4WcVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252486; c=relaxed/simple;
	bh=/oZU2iXNo+CbzykkqU059B60grjKuzDMZZXc8K1zOLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTi8RNvRMTcDmA9IZs7NP8nXmRKSEAy7etjY1FDeUQ/ECqq+8ab2gcjmIblE6OUdVesEXEW5Oms+UwDSabzdpOTK5ciXOZyENWkGHhXWayNQZHGGjW2eNyf1gG/QdWFJPmdLm8uvzrNNwjpEeisr8poGWZvA9kL89H2b5GyQB2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DwIDURAf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoGwP84m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DwIDURAf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PoGwP84m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4nqM2002260
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zu8lIQBQAtkKDY5ZOhEFQeqE
	h8xnZLBa80Wnc032cXA=; b=DwIDURAf3JwI4tyvVuY6QUrW/mZl9y0NIGJk/eEL
	Rb5yiftOILdAVYji7/lCyt8liyn3bAgOvI08jlRsTczxjTW4jhL1FEWwSjnkDYuv
	6hEktigVqMM/FDP2qXdHuqD3ddtBlObxxtHuxrV3B2QJEUc+oaSj/8X7R09bX1ib
	zWYEFKXE4cVYPNrR3K+yo26GV+OctG9VHazB2lH3P4Cfbg4Uixl/H0r/+nDQr5xZ
	dtyiwaYgjeMtGgWKJK1J2ai30B2OiGHvgnjgT6bftWaqqicXbRhUvVPi3aUQJQCf
	Cy5gFesTwQ1ugzgI8fj7/osxqUihltNhPB22mWYe9kZOCA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrbg1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:21:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98066bba118so279804241.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790252482; x=1790857282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zu8lIQBQAtkKDY5ZOhEFQeqEh8xnZLBa80Wnc032cXA=;
        b=PoGwP84m9d6004RywTkznlOvfAAkhP9Fhyj2XMg6I24bZITyYO9gkObUcGE9zSIXGE
         fb53IwwQJGVMZiKNPbSf1C44HNKS70UPTESWQqgA+ZHyHfWWkSgO9gPSw/3Ule9aN6ub
         l+BY13ImaH8vL/2l3qqAHZcfJskyNqXX//fZE/Yc5Wmpe3e/iuXz7MGRb04thhDOVlk6
         898zEfPpmpxaMAn1c55agpkFsHoD6085KyWMkVLFoSIWUaORz1oqnzDOcT6kOzhCbQcC
         G9fIiO7D6AzDcH8RQvEwJkpxdLXzMdHQbsFoNmxG4k3D1Sc5pXcrwtRdSzxlYlcnsaCX
         Fmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252482; x=1790857282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zu8lIQBQAtkKDY5ZOhEFQeqEh8xnZLBa80Wnc032cXA=;
        b=fEVGThWmlhOSgAif99Jn5IhqKZ1TvPmw9cWdQMSMLarmvQQUdpopzJX6pEwZx9s7eC
         qyWsBIba5kWFEBtUV69Pq8udLBzp3QLnESD6iChwXYqgKh+5TW46lGLGWC56HB3RDMNL
         8wmf1Z1TUp9tafZqR1rU6qQZMLwpMlOUo7gkTu6Uw2A+dKBAW8AADyqiJ1cWgOrgrc62
         FjKk3Pw5M2XHDpOAMIR6dRLSbQBMypzFxuZq64Hd7+cwImK3TFjpd5CKjlPS7yVzbqeE
         v5D1HI1aHo70HosOQZR7UEmrgSY8+BkwEiO8Pix1UAQC9DqSXYXr7R5LGgTjIUtuZU+/
         gAhg==
X-Forwarded-Encrypted: i=1; AKwUvBw3cig91NMvUVxsxYN5qmew4FFSh4yDgb14ySNN8QihWz8CYoJ3XE8ktbGofy1FsKtCIvBmKS45r3fq@vger.kernel.org
X-Gm-Message-State: AFuF++ntBOUgfNX0z22y8TJ2ExTt24VVLS1w0w5DQp/z5ljyP+HDTT58
	xrFBNkw+scV8WoilaLJuDpNEwnRjUVFcoOhefmQ+vKHR6izffALISA3X4+DWsF5sqJ2L7m6TuR4
	5I83d7hy1QWlHOjGkZrQ4QmxbfsQu1fxmpix2ZcWLGrtV8HaT5eEkU83QV7C13IVE
X-Gm-Gg: AYBFou0RIRf+6LVyunEdUyngATCeEdank67J7dmV8UUIzp9X+F5dgpla+4LVwVrmg2I
	f1ST3FCV4ttnwbAeAmGvJX5dJMzWaIfH4UYTbds5Z0YlHVFqYdCrUZxRZEuVK2Utw45FQOINNax
	UwLcCIDe+tJ7YNqA+ogiSHcohUdCSS71XN962Lfi8pos0dd/RZq3vtbGO1Jyx8OiAoAgy5hets0
	l1f5pRocCmmUJ1RaCkOJRyuF6R/lwvawlE93XlasK3wjIrMsqP8AgY1jsTWaHIaxzjlV0j8EqR2
	hGKV4lmVysZAyQNluaxV+Emhvg41MWVX6UMiTYNr6/YoMvjH3zxdcqaWPMAJd6wTXqL1YwIEQrm
	1Yo5Jnw2wL21BWWI=
X-Received: by 2002:a05:6102:3706:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7af1f619c90mr1088307137.33.1790252482088;
        Thu, 24 Sep 2026 05:21:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3706:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7af1f619c90mr1088279137.33.1790252481364;
        Thu, 24 Sep 2026 05:21:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c1fdsm16655704f8f.14.2026.09.24.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:21:15 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:21:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
Message-ID: <nv5stigwlyrwgpdwo3d6ctmqfopy7tgdrnrhvfvwxxvz5yxwtd@4kis7hnqw4bv>
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX2WZ4zHsXItfc
 Lz9YsFqOe2oxh6PPmjNq0tVbG7uKlisg1V8TT1S6W3SQcpFTR8EjBZh5FRTkScwaTb4SGSaSipE
 EYhCs4pYoSXEiG1S+eZS2pigtQ3GC/zEu7qUObLMuEvHbTRgmNP5MRh20ijqmM8pG68PJ+JkpM5
 GOM6pNgBw3hloAYrJ+Z06upI8ws0KlEHdKeC7RWAJGdUYoRY+usMlmh1g++FteWCanrBsyuCNnX
 1QxbslXSrv2n3e0dZw/uSvcVg9dMhKSbqw0PZmDR5fpcF097spdvq6raa7RtRNXAHsrF4/b/Brj
 weL4NqZjgPQzvyS/tgPWQMVLQCy0/RTq2WQhf+9C2x07vmBquo6DVJhBpmKI/zH+J/XEUBlgZlU
 gamCAcoIweWzjpTy5D+qEO5mlkwVf4uwltCjU5zSjDVeGhgD019w3aYlsZ+jR5s68EKvOha2aVl
 zk8EFqjuFkriEFiBXHQ==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab515c2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=svJ9ipqeD9EGsNKrb54A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX8nzpojZr347V
 VOUHjMGoX3LZQsSjTD9oq2h0RVLWSpgWiaGyyZpB1KMDHH/W3+zxCPU9+I8Nq/Yp/dF9cb8SLPV
 JK+PH80yKIFPahKVpcH/ISsDMMkqNKc=
X-Proofpoint-GUID: 5AdA05vZhrem2q3leuj3E1euASrzKnTy
X-Proofpoint-ORIG-GUID: 5AdA05vZhrem2q3leuj3E1euASrzKnTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240051

On 26-09-24 14:10:03, Bartosz Golaszewski wrote:
> Add GPI DMA controller nodes for all three QUPv3 engines.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
