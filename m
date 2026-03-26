Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5882134B1A6
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774508678; cv=pass; b=A9ODYM5yNjYDW42o4K0iAgdU2HqvXzKB9PLKqG6ZMAxUpuBxaizqHRyj9Hdb5YK9ewcwYW3Lq2KNDYLoJaQZFX411eSSz5eVNgFAULoXkv8f5AbEAyRbfodSPkaoXWXYpTaqBY3pOK8oqdN5Yh+cp5aDCZW/eyJh+o3t1Ay8kxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774508678; c=relaxed/simple;
	bh=xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MC0EOh/RDss525eBBYdMPE6fkGN+EHAMY3G8pZgq1qN9T9FcS25hFdh2Co0mUev3pU2GaFRVmEgq57UTwShMY9RvTnxiidIOZKVTqY4xA7hVw5XF7eJuz9dIDGPIKvrVpN2OpfBFTMvZ5CLkmdsqKgZkR9/FZk9xdetg5MckL3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYqhxSCA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9p4b42S; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYqhxSCA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9p4b42S"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0lVYJ3959161
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=; b=OYqhxSCAp7T2l35L
	iae+xlTa2e9RLFYO8j/ejRRz8ydvBYN56F4AW2BrBGPrjMwgj99KZfnUiopnKw5S
	fYJJoAiQbjEMWUSsJLa1TTFKvpQ38Ehf+OZAsMb6QnWZZ/1drQs5EK0NoAb13+04
	UPoT1y0v/bDeWCNupjKv9v1DOhbvHxmhh4d6KuFlqtE4d5rFNdrREV7i+YpB49SO
	ESXnZiNG/pO1Qoz8TvLTxkNGjo41jgdnu7E1x2ZGSNOFSggh7aJAc67UaSREvw3J
	ssS7ZyuR7wpytge4Cj0AUVNkwRIkHDAbV7qKTo/6pdLtrb9a2sTMRzRawj8pbnoE
	zKdSEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjah0sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:04:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb6291d95aso294437085a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 00:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774508675; cv=none;
        d=google.com; s=arc-20240605;
        b=Tv4Ukay78uTFy5wJw2dJZ9ZRlnYhEkidUf0cZX5LNbKrgMuZzWJzJ24RaaMZQ7vS7U
         aOHvvVmVQGBn3A4CG8ewqu9WgR/tNqEUPMEi8/eS6eqFKSUZtaBhzfCuTX7mUE3X4cX7
         IslJpwRvP5yTL4WN3vcUmbb/e/W3A+UggocCRHXYQuf/1MCOWCx877OaZeanKOrKS8r2
         LFi5Vq9g7Jt4kBwG12BuOVd70ez40DS1lRq8THzNZi7Nerj+tU7PC5gfAkIt/8fp/+nb
         nn2OTk1YRRqBRAPkTaC04v0+VXH+gpMwwZSeGWyanIXCdhCZhtkd09/1tFZnl62cOGRh
         pTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=;
        fh=f3wnjoAeHBcKbruGCZOTGFVYIScMFAYF3cyM7F2CXhY=;
        b=SSeejMvRmVX2E3+bFu5cHLP2Dvi+UTHXfbGh/Xkd9PobMDS2x1xd6Rxjk9FOHoYgcp
         plX4B6iy3wYunzd1351woOn3x4QAlGmMKoh9rTPubsUv5xMtx2S2c5oXJh1vNZ5+3/n9
         whZBtLkOrKke+EjKpuYNf8PtKc/qgPGFGy8/Mo5HFMjPDADihZ4Q5ul2BVDMfP5jRoRo
         MvlIM6FUJDgZ0LOWeBjgQAEe3mwT2B7Ip7338f9xNRn+EvzxSC91R/1onvEtBRA8tOgB
         0KAMOU6PUhGXXkOLxnKN/wX/rbKGhR/4vCleSSTSRSrB/xu/dQhfRF99rLNe5eUN1PKu
         Si1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774508675; x=1775113475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=;
        b=S9p4b42S9dgB0ceU/TpPP7V+ShovmLUlY+fCARKAbL2wYEL70uH9w+mnB9gj7XAKzT
         Ra/M0e33mAQvBV9+S7wd/B02/u5mQ9hE3OLJQygjsRQwedvIOmMvLb0gB3SRfsKxz2AJ
         P6VVbFVhgjGyJWSN4SL7RK3QYrPnzF2Nq20APtlJVceEkh6wCySrS0t5bACMnMPv82pD
         fyXE89EGAIpPSzDrHK+Xaxp6KdJbHrS8/i0KedOBvzRuTB0cQ/YRLBn7JeGtEvmalQdC
         VIVKo8FGlF/JzFTai5HsAUqcO0p+agiEeqgoj9jlnZ34Ynwo0PIYqoYZ8qkH+W45pFh0
         7vBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774508675; x=1775113475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=;
        b=qijwFgT9I50Qh3y4+3oauQWuwtTduRTSkxDzEQKniqopeWCNNGJAKu63VUoDHy602t
         Mav6Prpqtzmt9/684WlCnBFzHNJegqAQQrUUUgwMmDE8u68y52hNqo2wR7DMQASE7Ydg
         Yy6G+6HD/+QtRtEP3WtrAIOOLHxN+rDwEiZQwzrB3RJzsmCQv12DaRz8uiFEpeLkIqV+
         iGtozjhzhuDz8ddz2GKbMY/lDuXM7e9DwSjKXPOncrhERwPAbJFqaQ2LgJ2KPqgftjAK
         AAlj+XdJyB49e2M5rGY7oPjQvfgiVo6n0KnIAfEsaZuZIUpYogfQIY7Hg26FNGwbm/0O
         hZHw==
X-Forwarded-Encrypted: i=1; AJvYcCXYIBe99zkDQf2MNJv6QL8yn2ovHNcmKk+xqR/zCWGga6yvkRPoGYvY0But6a4lL+/yxwYAvIhnMUhg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8recjdZSJBs1w7GpTU96Ofukp2uC7vqsn7BJSZZM6v3+nQGMQ
	MxYM5tN1i62ER2zZqvicRQDghnlksSISprX4/tatyb7aghiK+CguIlcy+vfIVTgbt/eqGVGZTbw
	cPEzxCD1wyXrjOvCjxz/ZIsFgGMdQDyJAX1DpqD7bUAWKQdvRL3aduOts0j/buQ3TZiyYHXTbLE
	UFQrsKPFCFN7GAi6sP1Jgug9CjwC11EFyluEpiCNY=
X-Gm-Gg: ATEYQzzfyAE+FOsbGJEPA9k6Z8OWOh74cFftDfhs9aOzfxTvmEHt3UcGM1BMT2NgOkX
	JLJcgBmuQw1M7etIHeT9obGNfTTAZdzjopz64GlnkDD62JXCzE96LZWmWId10ET/Y0rgZ+8kMDL
	8x1aXhqjSA6wq4D/GizuRiaYG93Vr/HbzsdpsvbYSYJfZOcrX1TRXd1GGtvLlb/V8ml2rqoVQYu
	geIkj4=
X-Received: by 2002:a05:620a:568:b0:8d0:ad0:bfee with SMTP id af79cd13be357-8d00ad0c705mr420798385a.26.1774508675566;
        Thu, 26 Mar 2026 00:04:35 -0700 (PDT)
X-Received: by 2002:a05:620a:568:b0:8d0:ad0:bfee with SMTP id
 af79cd13be357-8d00ad0c705mr420795085a.26.1774508675045; Thu, 26 Mar 2026
 00:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
 <20260318-neon-vigorous-prawn-dce7f3@quoll> <CAHz4bYvs9mnDwfkfjkebucZSQpugEqr6+sFf1-hgzNO8SodzQA@mail.gmail.com>
 <d44ec842-1763-4f5a-a987-f41a6e624e87@kernel.org>
In-Reply-To: <d44ec842-1763-4f5a-a987-f41a6e624e87@kernel.org>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 12:34:23 +0530
X-Gm-Features: AaiRm53LgZwRC4-dZr8TZYUTH90mg7YLcB4GfdpJtgbwdJVo8pxW4uBCJ-w86qQ
Message-ID: <CAHz4bYvG-FE2bmN+VU6jM-x-j1pLz7DdYqub+=ek0P-zgU1X2A@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Enable secondary USB controller in host mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: WDL03dNWnV0AmT8WYqHn0Yf7TuxedJJq
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c4da84 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=q5bItssymG7qwTykz4IA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WDL03dNWnV0AmT8WYqHn0Yf7TuxedJJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA1MSBTYWx0ZWRfX1EFHo/J+ECgF
 DjXHS5u2TlcZyecn3k5/JQaml0yeIJQX3JBPsdHKYGyftqSCYaWdtTo/rqq17li/Abwkq81Swvk
 EVvkt3fLxVN0oM6UIiFfdktk7jqHSyYXxA04MPdNUxP8f81MNAm8st592JVtNQL2SOFs0VciNRU
 YtaKmM57Qf0z5pQh5oAQiQZZUUZ/6kM4U+dHmZfMmwr7j5YVN+fdhq1S7ajR+FALDBsHIyiUvaW
 e/8jyobd05oNjqkxExExWpS/VckxPJHBMqvEawf18Zw/fmwgbUP5WMAzgeUPyAmzGLHxZF8k9rY
 5Dp7Uj/32FZ3WXTIPgUK8R7I+7MqIrYOvLq0ANjtEnWw9ac2kiafX0IXdNzlhntOy7GetBnquut
 8ufeSJ63Sp895CnyyKcOGGsNpEvPg4QTPBPH420aPndyBJ87QcflmbtdlmqPyryMYhyV5Q6PR/i
 ebzkHCZxoR5g6DUWp6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260051

On Mon, Mar 23, 2026 at 1:12=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/03/2026 08:36, Swati Agarwal wrote:
> > On Wed, Mar 18, 2026 at 12:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On Wed, Mar 18, 2026 at 09:36:40AM +0530, Swati Agarwal wrote:
> >>> Enable secondary USB controller in host mode.
> >>>
> >>> This patch depends on:
> >>> https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@os=
s.qualcomm.com/
> >>
> >> Honestly? No. Drivers cannot depend on DTS.
> > Hi Krysztof,
> >
> > Here what i meant by dependency is that I have rebase this patch
> > series over below patch series. Below patch series is related to USB2
>
> And you should not. Drivers cannot be based on DTS branch.
>
> > micro USB controller support on lemans EVK.
> > https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.=
qualcomm.com/
> >
> > There is no dependency of drivers on DT.
> >
> >>
> >> Also, combining here USB is a no-go. Do not combine independent
> >> patchsets into one patchset.
> >>
> >> I also do not see how you addressed my comments from previous version.
> >> You never bothered to respond and I do not see them implemented.
> >
> > Apologies if i missed replying any comments.
> > Regarding your comment on v3 series below:- GL3590 hub used in lemans
> > EVK requires only 1.2V and 3.3V supplies for operation, confirmes the
> > same from our internal HW team and update the same in thereafter patch
> > sets.
> > https://lore.kernel.org/all/20251220-economic-gay-firefly-1873a9@quoll/
>
> This does not address the feedback. I did not talk about Lemans EVK. I
> don't even have its datasheet. We speak here about GL3590. I found at
> least three supplies in datasheet. Your binding has only two.

Hi Krysztof,
For HUB GL3590, there are three supplies which are VP10, VP33 and
VP12. I have already used VP12 and VP33 in bindings. VP10 i have not
mentioned since its internal supply and other two are external
supplies to hub. VP10 is internal regulator and its pins just loop
back. Regarding AVDD10 and AVDD33, so AVDD10 is internal power hub
which is routed to several pins for different functions such as the
PLL and AVDD33 is external power hub where the external 3.3V gets
connected for multiple devices.

Regards,
Swati
