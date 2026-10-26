Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031976;
	b=xHYUXXZJu2NgIq/sQOb+AFmoFy0T68PTwSsDfEDoofkB93LB0Rr3bLCt1QWPv4vwlwS0
	 ropsaUlS6u5TEiY3yaoFODb2MJKOWyiYvWu6tNBNcrcdwv6xGQJYsUH1ww5e/2ZlRuOWr
	 fKx3CKxPeOq2UKp0sJC2rSQWsttaxlt+8hqOREl38a8hwXrVVlTNNi1lC0I+8RRkP8OBT
	 5jMb/paEuaiXZ1OdYkN9bX6wvgM0EfFOEAkMxx386NO4r0FKpq1JSqm1+rhjyLdL6YCpy
	 6giljOqQw5+eH020mkOyEH7cxp8AcDNiM+iqMZtKmAikolkx7AWL/5eqi6FyuSI+V8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031976;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3X95uxlIiEfjEDKUY8oKZOUULIVZVHJVxxP9+yhKEE8=;
	b=esgFj6A18Bcd7DVYIKXr2zHRb1n74XaDjLPsWW5CjJT7CyModuhFqCzEAAOvgAaFVMEr
	 Ay5WTlrgPI8ftVaDCtO1DKQGBBws7QzrLAqQC1qy1W/eCQ/jjmL3srRUqc1Uf1Dwn+eVn
	 Wp0pEEO4FeZf9EhF8wCUnM8HEUknEhyuWE1jMTztP+J+2ARmFVSvqpkZuZMJrzihWleFm
	 FLrzYXekli13SKd/pra01vw90MPdbrghWkoBgRixrYln2fAdJbjI5+gkyv0HM5h+kz0RE
	 kINTYdYnDexMdkrDQVcrPHM4FJXLJcoDnRLQ9bxm8JCz0x1zrJ8ceeb71WH8eOiE1tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0e6fZn8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGXUng+9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BAC606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04BAC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0e6fZn8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGXUng+9
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvsKm3268516
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3X95uxlIiEfjEDKUY8oKZOUU
	LIVZVHJVxxP9+yhKEE8=; b=i0e6fZn8Zq/iXl7CHjOrqep/0t+u63piT/1tsyKT
	sSyvwNHS1op+q4C6SCTH95/25hYF6x+wBuDLNtCAN73/VUiz0pYF8imemsVDPZjr
	uNp6xhX3geA6n8M7f/O2FR6DKi6cSCh+J8+f8mA24aJ1wVifWvd+hz3dXMAnqNMN
	XchXqibORXXI9WxYiadJVbiyWYVgwno+Qqyf+8+fjnh+mStOAjgS1IJj6545RXot
	7y4K3xxMrLZxnVsGKSeP71ys6hdisBf/hXAbh7lrcuYeYeTHvc6Nl3u0yDsxkLN+
	j8IriolIzp3HbDVfblmD096Ie9P0uemR573tbUnyDYeE5g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp9k43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:26:14 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99063f4065eso892142241.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793031974; x=1793636774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3X95uxlIiEfjEDKUY8oKZOUULIVZVHJVxxP9+yhKEE8=;
        b=kGXUng+9yN5T5jd/C62fmD1WSSZgqN3liTn4q5PESaCxbOFs4RpgX1j1OUTcQ24COy
         tml8om75n6MLeOD7ec8cGOQMVO7NgmeVbFCe2R66jypo4VihFBHY9Ptmb3IF2tcP2kGw
         Axga24i1KIF0qod14SxDexhP7ulYlcbaXHD/ci8KQHsDI/0RV0B9Y6oYDbnffUCiE3Sj
         eU4Wxp2kfaxNr8gq273nce0fLOcDe7ytrHzR27NJC9h04Xb8OrfleSIWDKxryy142O0G
         4iKTPpnfNKGbIB+u2a+LgtN4AgIterUCuwhO7XhilKC+en2fv71+xrVxI/fjUwFGoOi9
         lHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031974; x=1793636774;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3X95uxlIiEfjEDKUY8oKZOUULIVZVHJVxxP9+yhKEE8=;
        b=GV75aQ0rTdrfwG6mbw126iQcA5FhQe+pZ/reHIFWw1H36FqjQqE2uJeLkTgbF3JwsQ
         hxtHXu+uaxXmjYafIzMNKs0nbdMa2D9OS/9EZzeqzAn4i6XJwrXOFR4wnN6JUtblgQiT
         +x8cXi/SeqYv67SqqDTDHARU0/4490wfJE8I3PLzhCbSsnXd1ydKYlK9zecLs4L1L2jH
         LAZk0rvI/NBT/UOuJB3okUp6wCNl2uwQE/croL4H3/4T8xQoBIjESp4Ov/hd2akqHqdh
         lzt1tFPhgX76u5eh4BkXrgFk/yKUC5SOzR8wNQmYRHhFKoYJ7ftRK5/CSv+jIu7c7q95
         S9LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwE6vjROjw5aFYtZtrgpU82LGRYTyXGj3l8CsQTz5dDK5ocfZeXXY86RytjAqZVufIpYTCxMzMz75vO@vger.kernel.org
X-Gm-Message-State: AFq9FYJQLAF/fE8xvAiAJLv0Nr/j8xTgjbIkWzObJFrkh+z3uEUMiHc6
	ZR9nI3EinWnQf8ZzqM85K9aZvsFWA4z/n43LotVTbYQ+4eqjpQUWJmlqrkVzpOi5gWJyF3yYq1Y
	ZNMtYjWqzTkBHeJHuYeqXFP1Ra24FBchOksflv1RxX0ZN326LkWxBhqBf0Rd2ufpR
X-Gm-Gg: AYBFou2+h8HW0EwJEyEi7bzAmG3Vsz+HQYyYaKffWz7Yw6oLfdBGpAXAUag30Xp0XmN
	FLBlFw+4/DH0UYO/zFuV4RyHIXISmQNJ2OlO0iaxAPAfzAunKK4ut8wb45FQXszowiTNj/WXctT
	XGyjjjEWiqcpy3JrAswDlb1KOPba+l/E3WiBUmVbz2iggellT44ORhttKcffuBlDRCdAcHaKtjo
	/CZRtm4mBzeJY+EQy02xKXdLTK4ymG6GgF3lJDdAXy5KZqgfxxdQ6CbJnU/MgY68kZq/NPebiJ2
	cUKGIkOC3lAMCGTvCZftEcfeByMcbqcGnIshQg8UiYskx9rOQkHXXJqaEMT3sRyfX+hj4qLPbCU
	fs/q43oe10bZjWhiu
X-Received: by 2002:a05:6102:570d:b0:7cc:1ace:fd06 with SMTP id ada2fe7eead31-7ce5cdabfa5mr2188919137.20.1793031973901;
        Mon, 26 Oct 2026 09:26:13 -0700 (PDT)
X-Received: by 2002:a05:6102:570d:b0:7cc:1ace:fd06 with SMTP id ada2fe7eead31-7ce5cdabfa5mr2188892137.20.1793031973218;
        Mon, 26 Oct 2026 09:26:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm198654255e9.12.2026.10.26.09.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:26:12 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:26:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Roger Shimizu <rosh@debian.org>,
        Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Keep WLAN firmware
 memory reserved
Message-ID: <vksktasxk2owjhimcczaackblizbxrkv6s6rwcyjqszfut6lt3@7gv3txlhbl2g>
References: <CGME20261022085853eucas1p1204878da3c0f519bcb39bf11ad84bd97@eucas1p1.samsung.com>
 <20261022085844.768508-1-m.szyprowski@samsung.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022085844.768508-1-m.szyprowski@samsung.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX5HXrmQgtPmax
 HrFnvt4ZCF1/1/5wDS0CWvLU/COfhSeS9CiOf3zBaXyNxfJiiGGUVx29I9vb5BvTnbaaZPslLSm
 Jmpi/D/nRZz0Sl9QtDcWC0HNWb5ay+fnEjComv68PeRMcOhzE/Mqh5ySp+uHjDFLZOQNsFMilP2
 bXTbe3TPBbFHm6lsyH+2kwUlw1le/zPT5ac43lfSfAhyBUShHI01q/or7WPoD5mNonrA3NxSUmc
 RKycGS8MSxKlkuvo1hiuEPeHFG1DAwq48uyhq4JyOU3UKpvIGusRgLTvMaXxLSrlG0vAFvzuuDo
 qM7469NdP8tg0x/Uy+tKJbIH/tZMhjSqls/ZvxbkHwTQslCDMy0idmEaxygMnOHc+JidPq6sBVq
 8F+z55jaMvef1y1ADl5QQjjXdGU1y37MonZX3R7jzqER0OC28TUGWrh+8kQoYBBM2ibdp8cf25P
 wDZSvIyGO7bJukN7t5w==
X-Proofpoint-GUID: KxfOSzxE-n7H-2lEXp3ZepaaQ1NeUizs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfXxWp4qBPPXr1C
 IvST32RL6OnlwjBqTR9QxX99Uqi1aMlxuO6lwMbi5NXHdZLX0eV9xOOWKjzy1V6ZHyUJw9eg5Tk
 dHpugCucpv/blbeUQagf2gQGg+SP0cM=
X-Proofpoint-ORIG-GUID: KxfOSzxE-n7H-2lEXp3ZepaaQ1NeUizs
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf7f26 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=GwW6hZZTnrYkDhoEGpYA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260065

On 26-10-22 10:58:43, Marek Szyprowski wrote:
> The board dts deletes the wlan_fw_mem reserved-memory node inherited from
> kodiak.dtsi, because RUBIK Pi 3 has no WPSS and uses an external WLAN
> chip. However the firmware still keeps the 0x80c00000-0x817fffff carve-out
> protected. Linux treats that range as ordinary System RAM and the first
> access to any page from it triggers a synchronous external abort.
> 
> This has been observed when the dynamically placed adsp-rpc-remote-heap
> CMA pool ended up at 0x80c00000 and the remaining 4 MiB of the carve-out
> was given to the page allocator. The first allocation from that part
> (a qcom_tzmem pool page at 0x81400000, allocated during fastrpc probe)
> faulted on the initial memset:
> 
>   Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
>   pc : __pi_memset_generic+0x16c/0x188
>   lr : dma_direct_alloc+0x190/0x434
>   Call trace:
>    __pi_memset_generic+0x16c/0x188 (P)
>    dma_alloc_attrs+0xac/0x1ec
>    qcom_tzmem_pool_add_memory+0x90/0x1b4
>    qcom_tzmem_alloc+0xd4/0x1a0
>    qcom_scm_assign_mem+0x74/0x18c
>    fastrpc_init_reserved_mem+0xd8/0xe0 [fastrpc]
>    fastrpc_rpmsg_probe+0x17c/0x3d4 [fastrpc]
> 
> Keep the wlan_fw_mem reserved region, so it is never used by Linux.
> With this change the adsp-rpc-remote-heap pool is placed at 0x83800000
> and the board boots without the abort.
> 
> Fixes: f055a39f6874 ("arm64: dts: qcom: Add qcs6490-rubikpi3 board dts")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
