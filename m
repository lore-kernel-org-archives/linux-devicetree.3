Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794308097;
	b=0EXWGNa+v2o7V6dQ4Ufex6ZFZNfCijzi9dwUXQhZORzPHSyVYj3VTslMjc8fD4dV90Vf
	 MLRLg8pkVJRWOBQ4V4vuY79jGAQBjmQT8O+3QQg7d03bYC0D+x8KWxdB1SCdWIlOyKnj+
	 ASvzhtdakO4wG4yAYlFl3o93JIaGY8Ob/5hM+Le7+dGNu19OA38DXrGtS1JbkHoK1jihG
	 6fdrQ+85WC6bk09agQb3znA0uaIptBRLz8vnmsQSNKIMM+3dM5N7aOT2WJzAQ54p3ApJo
	 1W/CZvYWMJEd4x/nGVIOyoxyU0TC062/8P7pAq8jRTHOYkMFDVnygu02RfInBZ7Brhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=;
	b=qieSHbnX5krf9HuldAA/k0UzS1hOhlFHsCxNayS5rs6HH/GLwNe5L6IQ2grU6C22S9tV
	 wjKwmVTiIGfCsSq7PE5ONl+tHpErZ3+dRzSD76f24hXiV0a6XaxrvWRqbIJC6ZRDWcgH/
	 05Qj+G5WbGKoJs9gVZR24qsJU39boML8IkpQRO/mOCjA024fNq1/rX/qHhqcJ8yWSCaoW
	 lrgUP+RmBQ2MsxYWInLjeaX6e2aapppxh2cOxBTci9GUWxeW73SjzdOHili+/B4HLERDN
	 rgK5Zix2X3zghZ8A6X0qHnJwDZGDNuy/qSt50f9BmR6Q0qu8bAc5PkpFQEZpoY8slSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUkDTENG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nd6dJblK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C304606A326
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C304606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUkDTENG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nd6dJblK
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l4Un1155041
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=; b=mUkDTENGYogoUsvm
	c5dhKSLCd9QM91OJxfv7P/41BMyzplzxuqEIQ4Jwfu5jYTWHF7U1Al+4NPkDOMmz
	iga3w6m/DQz9x05Hu9jEWUPSVj0DQ+pww6XjtaK4BOzQJUUQzeMDbkvSWP1xCfQb
	0cmmsd+uwojsqcaxuywdQYFC3RKSaQSJySWIjUGOp0+hQz/+wGFAqiNu1IAv2scU
	DT56nbSTh7LM7nsybPDfJ7QOz1+gsMP0gKCTjtD8FAsMH8DKtMf/47ypSaKhclJ6
	Ld69AdFzgun8lHVDOU8Z/NTQ4NFao5unLvq/FfX3ryDlH1sx3lKBGP4vLqhuDSO1
	JmnEcA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49rnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:54:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so1782166a91.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:54:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308096; cv=none;
        d=google.com; s=arc-20260327;
        b=bR303G/zjHwY2MPRuirllxsKZ+efWU1HTYhvh+9QPJj81XvVymgCRfTCVw8Md+wBqj
         B8mtPVH3sfKdJ6aFCihpjzplvNrmlmPm6hQ6quNNbwZTLMI+KWtIBm5hNfqBWv0Kb/IK
         LGGec3extUmTTi67OyNMeZuzt+vilxS6s+q1FgSBQYxPJeJVJCxzynv8ZSvfC2dc0FYL
         tz8ApR4jMberlc0McPTCxeLfmUugHVkO38jUsfi5BqOVO7oQddYvLg0WbG8rlV9Hb8oB
         FLoxJFHj4MCnqfmc1WrZlRkITjLAcVLiN/cEdBrBWmSL1db8WG87d+dMZUalFwEC6xjG
         Qi+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=;
        fh=6c8YNiwNIaIGVtvrWEI0DNzqBn/LSF1smhXoQ/ymL0Y=;
        b=IeHeMj8brMn/CpV2DYtqIIXn3HUWVe+m7op71OigaSqnoMeD58cBKp+eN8UMiOsX1d
         eBa2avE1fJFz4C5yO3NrSTrlDlV9v10IIFWfEB7OU8J/BWnVxlFE3RKLBDLEGZeFmRbY
         WjbA1LZm+TuneyPFy8jT/nhevRvj61BEpMmtRy9ylgeZNRrSE33Q4u9LrFB4Q9jwClPt
         +7ZumwmYI8GYh0a+DxNXICGQ8YwIvVPt1SAu75XGuaOJI4Ovy7BjNiXvjek9pCFszBy5
         4wRmFf9bS8HNnTnzZiognzz1U2aMwU2B17m4qYKf5CxEOaZhI3oY8hnLa1e4+7CJsgvN
         IvrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308096; x=1794912896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=;
        b=Nd6dJblK2RB6hH66SV2Yn7HFbHm3pb1QuCWCxo3+ez9AfAkCw3XtElPemwNcgSeVOy
         KYQZSjC6OlFn4s7Mvd65C13oCaWDYIAPwOkonXxQAtPz+wX9SVpUjonUL31pynfXfc3o
         EvJs0zZ9Vy+9LCrrKzbCmR1sXrLTjLZ0KhjA++NoWjoZufFAkBf6ZzY4v002Ko3ro+kN
         +hvMl2m8D7ww8u6g2UAplUBJOqtbApX26DXuA9mw2OixKPkl85dUGALYUnAPobwpraDA
         J9Up9pLiyjoxEXe5yPn1f82FMpCd7CHdtIIIS+qx/MQHb+g4JS9P5BYoIC7WSvOHIW3s
         wcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308096; x=1794912896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GvGp0ikRhYCrmCcfVEdjux6pBM8MsB+KXbne/7lAoM=;
        b=PDb5esmk42JtOgqtV8Z61gas3WBBV0LDvZvqFSwXHc1RF4QSFXr3EPP2O61RiOIUPk
         gp0clj55nS2ZPjjsPeunOfBmOsGIRadXk76MNe4xLv18z+v/13ew2shn0Iv+1Pg/Mymj
         6rJigKF6PqSRkNA2MU4obV+5CinK10nitJzgLrBi5dCFZaSadtNwVaPbq7CUqE9o8WGy
         dFh4kwyzHwRYyrhzmT2Oryrt5N0d4j3Kb8/W5RAHQYTAsjoADW8A6VLglxEVebdZOPJB
         9JCK/BFEFcX2KplzF8NKPmRrlFPXeVrMOKK3pR7GIclXURgc5Fv79Wdm787jtTTuF3Nw
         9Yhw==
X-Forwarded-Encrypted: i=1; AL+hErFezry/AMhFNXYhstuNJycmnSNPT7TI6DN6hTEN6uQsEpzG+AtkuqCskIw2z9qH2sotp5ik4tDR52gh@vger.kernel.org
X-Gm-Message-State: APuU4Z94vqcK95rWy2Cn4zByW4RlSDLqyWh+BF1DLwmVCF0YQyGNhi/P
	eYWsuANnOCrLRaXwHTgnFQvZFN+BZN4WgBZbNUXRF/10E+XLU5Ll1V+hp7y/YYGn522aX+/aRpg
	mxTVfSx6Ouf7k7U+GRbMft7aaHkNvH7HGQhlXQcTwv34K0iD/un5CCXmukj1VmhhwLYAV2vxMCZ
	83/jAMMZur+bINCmQ4E+jA9tbjtBoM7WKyKcFWzH4=
X-Gm-Gg: AYBFou3IvQCC64bD2gilgYeqTs1CCTHxFGkc8uuMroqvow6fBH+EiL+RihMV6K5b4TV
	kg0swyAPSF2rLKeFpXcbvaMoAvi8NSFGtHEYgoOIKmm/1nk35t23/Q2Of0JdcIWmwFpHeYQMVIZ
	TPxhS/N2ZjDAxMCKVnyliZpZhNcaIuj6+K7pf5+OnQqQPEi736o6qbvCvo4A==
X-Received: by 2002:a17:90a:e7d0:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3b166a5fb0bmr2419109a91.0.1794308095858;
        Tue, 10 Nov 2026 02:54:55 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3a8:5fd6:cb6 with SMTP id
 98e67ed59e1d1-3b166a5fb0bmr2419092a91.0.1794308095395; Tue, 10 Nov 2026
 02:54:55 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101082307.151957-1-gahing@gahingwoo.com> <6777074.j6PcuT4dK6@diego>
In-Reply-To: <6777074.j6PcuT4dK6@diego>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:54:43 +0100
X-Gm-Features: AclHuK_tfQs_KED6YGEFdDQzYeq154VOUvxzh1aCGwTqlSdSoloobK9cAe7e-pc
Message-ID: <CAPx+jO_gRtipR7iuh0D7G2Wi25GZoqFD1JHVbJNmhd1UyC3Bmg@mail.gmail.com>
Subject: Re: [PATCH v15 00/15] accel/rocket: RK3576 NPU (RKNN) enablement
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de,
        ogabbay@kernel.org, zhangqing@rock-chips.com, royalnet026@gmail.com,
        abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
        sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
        chaoyi.chen@rock-chips.com, diederik@cknow-tech.com,
        alchark@flipper.net, leonard@lausen.nl, jeff.hugo@oss.qualcomm.com,
        rfoss@kernel.org, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfXzgi+euFIIqRA
 SG3bKMxt5imri796SAya/KVCiuM7mM177budwbMFlNE9ue+kMKk7p1+UcUyUq0T+h9uP8862x+y
 7if9SBHyfAHabLPXNBTl4jwCOQqXKVM=
X-Proofpoint-ORIG-GUID: V3heHxwWE4UUogq4Dhdiyt1UbnDWfecO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfXyvYi8Lduity3
 bi/NEKUpT/zcB9UU/5ybTsnBbaKctoqaBnk8O8MgoYO2tW7YGA/N3qYVMXtsue80byE/y9ArLh8
 Ze3hXsSvG/CUf62c/SOFT/EVa8OmAdV5XcMfPT3wUCpgLekHepYxnd9YDNYY9OrJ+i6tYTCYNii
 xo1Clv6zR/GdFwXmoWwR76Hx1uiTpt79YFC6O7oOIhZpRpjeUHuIHohgHx6MFIYw4VG6G8blOdZ
 oWQDSQQZBDIz6u7vx+2InsXqh7Botox3zqTOevcaBnaUMyl4kUK3D32F77k9U/aed/ZvjD2YKha
 peVWPWOz/pY0JeS5uUsoR9Y+6srNMU8EYW2P+7UL4ji6vvpm09EAOrQ9H4+GzaElsbQKeTnuHch
 x6CxM3iLA4RbKa8TBIgU57ZzNhF2Pk9d4RgFx+QaHeJsRwlH6JJlGoilpNnpKrh2qlIyy3ix7gG
 FsnVef2/Z8UbRprG+bQ==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2f800 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=HKy5YsogUvdA2KhsgGYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: V3heHxwWE4UUogq4Dhdiyt1UbnDWfecO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100043

On Tue, Nov 3, 2026 at 11:39=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Hi Ulf,
>
> Am Sonntag, 1. November 2026, 09:22:52 Mitteleurop=C3=A4ische Normalzeit =
schrieb Jiaxing Hu:
> > Ulf offered to take 7, 9 and 10.
>
> I've now looked at the patches in question and they do look good to go.
> So it would be nice, if you could pick those up, when you have a minute :=
-)
>
> Thanks a lot
> Heiko
>
>

Patch 7, 9 and 10 applied for next, thanks!

Kind regards
Uffe
