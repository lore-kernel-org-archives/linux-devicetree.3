Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6D846F481
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525571; cv=pass; b=Jj2mhlb2S6L8DAhtKMtxStYCHyh66gmmUgLFfAOD6gzVlHZCoWRbj6yffCe9uIA7KY9KcA24Jy2OflijiLZdiTNxHregkzph0/Fmpf8cMxk+3CNvKEp29D7tbsfjpSv3cuPrJkpavfWnQ942EIbMOvANz59jM4qR7t1JEYXEE4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525571; c=relaxed/simple;
	bh=VUcBB0vOW6MkjtjLDRFaCy6FaOEhAXU/YjiYrkHQqRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VjHlmI+pDZT8sIQleROAzHIS6+UwRyl4g+Sgf8R2OcRspDeciZbzo/6YSkcW3NTkCVcG3ZR5JhXTrplR0R4+IWR6xFt+DrsV4bOJFH7gZd8VL3wT/WJNTVWhGGuxVk/1V4Ir7KgvCjJn3x38ppAqndVWZV65SCZRI//v7mF4oWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0XJ4tXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QysLBsvW; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0XJ4tXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QysLBsvW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AINIx2756064
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 12:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=; b=K0XJ4tXGEidqOsXZ
	b032oR5V1rqvQce0EcA9gAHTKUvpdP1vfUI2NvqJy9w/gP6XHjbadQgX9dOh+sH2
	U0udof4CD8CAWQvCHepl4wCV5X3ApQBfEkUitnWsclRsnOxoVB+V5GMzJ++6e2Re
	3mQUMOjyswcZbavDWSMq4x329nxo9nfG2K4bI5NTW7pUROmGarJHDQX5Yx6XXn7A
	hGQSNZhHyd7cmP+Qf4qbuxe1qskxzB/YsHswpsfOspQ1rDXbM/FcVJ62NSaVpeAJ
	azWw3CIV/wasFEdMSeRe759zAFUe/X8vfVoeVM2jXo/U5ZMfaNS//ACUzGzVRc9P
	rLTDZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfk92253u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 12:39:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52f52ccd459so15089521cf.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 05:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788525568; cv=none;
        d=google.com; s=arc-20260327;
        b=HYbH8uV+qE5UcwQR8paXn2Hwfm+pwbIX8NO+HhkCgG24FE13THAaFchtjGpXsuoUGr
         kV1CQawFVySkqN+jEZ+ihXfDgcRiQaxdPBhf+ThSFes/zKV2sX/XPmQZz2MYz6WF887e
         l+/AVb86CGNQ5pg6BtOk5tO4ylHGnh5yb8cZm/tokUzwtm33/hqtwatvlaOGnYMsPXFC
         iDTreAfYTze61cLIR3UHl1hmHR7Igq3u6rteid2qfruEr0k8u5CgaHf1SFZADoeJr7vT
         5tplCAYDH/HaMG4GU0yzMxse98+8bHFhZTpqAFcmzOGLzu6FD54+sJzZB7Qutfv8qwT6
         igBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        fh=g2a6NPDjxunX+l9SToNv8kCupIk6urQkZQUnz6Gdha8=;
        b=mn/4vOi5bEs+cScsorDPw3cisfXdP41DSL4MNpOvX74ybn7h2b0TSO17nbAwP2UElg
         kN7iv1gvNp0mDXyTrKQDPgMRRM5H8EIaJEYvzxyskvEbuXxRQtrbBZ65vf8yKFmaV3x7
         K4nRT/2P5T4IY/R3/yplZFRX8iBqAsRMxDwZCWW0WTltbZHUwozlmFQ8B9FRXTIkbD82
         e2HCoWqMxzXUGiioZHOPwZQBcA6mFztqlCuqaC2ivieBDYBnL8ZVi2XmiXLJ4tlMCakv
         yCtXl71M0NzF1KFfDOqqC/vlnlR4WJSqCEIy6JTK1MrNwj8Q4IdWWlmvPrwrrLky5qwk
         hpyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788525568; x=1789130368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        b=QysLBsvWmtMu8FeIMraaRFl0IB8LV6zfrGwAOj4e6iJhVE6eCyt9onKeXOBBmfcrsp
         U234/KdjNRuz++FJKuBhkBd0uVRmTsYjd1fJpZrVS+vMgkH8/f5Goc5WbxwxtqoMQ9YX
         4BiNmiIQsFXKxSZp4YIAWETDzxfNGVGcu+2othRB/rTFOD9pLJSuIqIburnhMqMDwbW5
         ATWwPVzJ2latEcUETvbegTTtaB90ZkgWn6BeIdjjGnNF9DtM5VgjD0etXiJtGrFH7DYG
         t5HJoKOV0OpoKs2u4L9MTrE0OnPDpDE3cPH3zPlfeH7LhsEKjS80/XyYfLodhGDJ2WvJ
         QJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525568; x=1789130368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        b=seC20ihxojv7kxbuZnC5SgE71fwtuOWC23CxMpYVHBamf2YCPEOMxReYzwfj87td7v
         Cc9UuADbgz2C/q7iqhJEv4YNnMHVIWuVWTQcE2xQx+XmS6EXXTwVYcyqvbVVM0EfDshw
         i+94npO96H+QAPHAnlQh9GgSMuirz+KLCWzi/DV/tvKVFIKb11W9rsV3A83FfHesne8A
         YrAUPViG7TPdTFg0eoD54k7937zcchrCS6+DaS9eCnxfj94cMPsjREtqmP8hzIwYJKz7
         FSoPELTsNvsPyvHZA3/SUH7kEuNXucsP6qN1PjdLjCAQ501P/pUbw7NLL8Rfx38ZggVk
         hxeA==
X-Forwarded-Encrypted: i=1; AKwUvByNZXlQnLQnSaNFZOlfIlh7LAkubd71sgrHFmq/yPkzBpoqE1BmIux77EGRx+dAE4TlZWgHRkgA4Chh@vger.kernel.org
X-Gm-Message-State: AFuF++nYzFIDkDfysIuKLQq80iWlf/LKF0J84n299gKD0wCxYkQdK3VE
	8c5GW8tUKyqyKQ7ucX56YBkpr+MzKK9N4v2uay7nvxxA/9e4aS9woOe6RURY44MYw/ajRS4M3oy
	ojJ6sdT4X3F9PzqYvJB0KJgVL1ack2LkMHc95X9n43xDGONvoUzEnayeUDxYsTibRF5xHXkDLfL
	goVTuEUSvm3tgtTa1tsi4yI9/htOjIZC6yihNttCQ=
X-Gm-Gg: AYBFou1FELsGGAJ22px4AjUf1QonSIKhQFn0M/GgWDEvBr9z+AzTUUV+ndHfYT+lUfk
	deBhX4xilpv2qUHpAD05bVaBkbYYu3umKjf59/CX1jNrc3QHozUtuMQMmu+4qlbfJQf2eo+AvGg
	vXnfi6V/cwnPTr4EHbmO6TYqTTYCJnWXepE1dAHIYx3SYLtdl5k5BJpNCewtU9xm6rv7ruJ0sbi
	VcRk/98pLFyj0S3ESpnBuBirMuket++l6BZUTc5uF192e21kA3fvLnjjSIIlplz3+kCBFv6KXpZ
X-Received: by 2002:a05:622a:286:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-530549fd6c2mr61921341cf.36.1788525563484;
        Fri, 04 Sep 2026 05:39:23 -0700 (PDT)
X-Received: by 2002:a05:622a:286:b0:51c:1fd1:e755 with SMTP id
 d75a77b69052e-530549fd6c2mr61915361cf.36.1788525558050; Fri, 04 Sep 2026
 05:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
 <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-1-01ef1eced075@linaro.org>
 <2aXo5I_5YqQ6uikqbIOWs7L__EwJV2oTs24Jqa-YRqGIU2FOT1O4bixGBbTzbaiBuENyW0XkWbqAJJQnxgSnWQ==@protonmail.internalid>
 <CAFEp6-2nWfjF18R9pw0xFt92GcPORKKa+ix8czQ=m512TYuP8Q@mail.gmail.com> <51b3dd1a-5595-4538-b792-a679b6813a6f@kernel.org>
In-Reply-To: <51b3dd1a-5595-4538-b792-a679b6813a6f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 14:39:04 +0200
X-Gm-Features: AcwNN1Xi0ZnbHcNu1xFGVtcHdZiZF7hrQekcNJq1YSDgANQhTlSn5NmxIbSBScw
Message-ID: <CAFEp6-2_XTMnxqcoNFwu=BfWki2U7U=iuQL8n6QcR-CZSMsX-Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] phy: core: Fix use-after-free in phy_get paths
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfXyQbLQFhcZyv3
 bbyiml9kSciGvYdeEPf3jXMu/dnV0Werd6bBu7pBjupbWAnyfpKzHywINwrOyRLyF8W0cF23Z24
 23HXD15opfDLcGFrI+3NGpQ0lwEwcYw4NdLSTq3t83AXpXzcVO61y6w+fLRT4AT53zVoPdh2gBP
 bXgzjzFg50QoPWi2IwyM/w1p91SCy6cSgap7rFenTxB3BZxYZ7tOeB/MIvlxm373sfUgxIpR/EN
 prS/s1sPJ3yqpUsVVQoP0kh94PSemARt8rAaJ5D1SpDFdSgbXdSk9ASzXfmYegHvcxmvYEiJHWy
 MP6uAqgwnnbHTkID5W6P4WGHtYlkJg79Pa1krHSQSODzqGaQKF0dueksNJv+r2E65wEX/ba54e5
 +3K2I/Mgiiq0/hyQieScfNPslFv2lQvUoN7m0SmU4N2dpjh8AiEuQB+Dlmm1kaFl5uYH/WkriMW
 drQf9ICKfCTIFjEbaCQ==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=6a9abc01 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=4B6qI-Qak-9ifnyKK3wA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: FS1KC6ya-sQknGZqNboKQ9_7_lqCQwI2
X-Proofpoint-GUID: FS1KC6ya-sQknGZqNboKQ9_7_lqCQwI2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfXxlIWavIqNV8B
 ecStcwHZ9/EUBtWnxjTdNJOY/Sjr7hP0s0NiZB698K7XHvLA1DBdYwRCniuc53OuF+7O47ehDLh
 Jw46Kz/SkjAOc9eD9Wtz8nTxN+3u3LU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040114

On Fri, Sep 4, 2026 at 11:41=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 04/09/2026 08:45, Loic Poulain wrote:
> >> -       mutex_lock(&phy_provider_mutex);
> > Then, now we're moving the responsibility to the callers, maybe we shou=
ld have:
> >      lockdep_assert_held(&phy_provider_mutex)
>
> An LLM suggested the same thing to me but, I thought the resulting patch
> "looked messy".
>
> Do you want it added, its only three additional callsites.

It's only a minor suggestion, but if you end up submitting a new
version, it might be worth including.

I would also probably use a scoped/guarded locking pattern for the
mutex, as it tends to simplify the error paths. That said, it's mostly
a matter of personal preference, and some maintainers prefer explicit
lock/unlock pairs for clarity.

Regards,
Loic
