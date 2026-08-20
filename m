Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB823A5430
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221463; cv=pass; b=thV5pmVufqE1gvC4o8cVHeyy0KV+02XnJZLzIzLGThs8/Bk5mn3S9bFBDg5VEVvc+V/AqkO41mdiVQywSvaGKDKSQNuCEGlVYiw70NbH0KMDUu+BMAV0q11Cg0NZnTSW3N1rfKfrTeYMiWKOd7bkxlJVBwdR1MoHF4ReFpYSfXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221463; c=relaxed/simple;
	bh=p2QMU3DTYzx0hJvixVYCYPw8OSsNqcb3xQFG1Mg3X18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2UQFwxJIQ8lB2CChoclIIkPXPpy3dF7AyQ5K20cvGwzHz49JvCokyvXAphSbMyqeykEHdCZn9fA5u9rkXrs15Bltnql/hsjP5QPMisCfiYE30SElr37Wp/UeRJbzeZQTQ4/fNQ+vV9GyGufBqwQil9epf9C9i7n6haL+2Hx0W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NlB8zap4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkvYKJ95; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NlB8zap4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JkvYKJ95"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6nDoS3732553
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=; b=NlB8zap4bl1dTpi/
	b77sQXntHv1GfNurcpg1EXnyTgwpZQ+R78j2BoglrlZvcovg72q6QAhNZfrYzcqr
	GCwMe36xIWlsMUYFJg8JYGU7TK6ZgYfMV+pc0lL6XogJV6HWr0LEOLcfyjLsqv1m
	ZNq4SlEiH17wGWg3jha9yW8w706I3uJe4rCwJjbfD5Am7ydlP/iNJjbivrLwrwS+
	x9zOhcGIvabtlfi89CueWIKKke4cwPHsg46q73d9VcaLPyY/MSWxNOaUT6WI97fp
	1du9a25vtOEz36lozAdQyY+2xlVha4vci5E+Etk7h5hFpMtrrVUJvTbcfOsZ8jJD
	DQkAog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn88u6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:24:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e01a62d99so2523321b3a.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787221461; cv=none;
        d=google.com; s=arc-20260327;
        b=d2LrgZvQ6szEIEW+5TYik4fQUkdPPKZXxHiJybCe4OyebgjrziAJT5dogo9av++kwk
         wqwsMWC1QJQEMMKiWAiuVJOPRreqsZvvfvMvpQZdWFsQ5IQUWHEf+V5UJirDrm+EUQgj
         Wf/lRljIV6LHefaGUIoj0FRFZIoksrd63r7tbse/Djuo5BeDiO6afjJnLAhd7emmXsg+
         NCjsr6dbcbp27jBczsDxtxtZH96KRhmGwWIhy+ZKF3u3ICiFO5epz4ldw6uWZ8ERaD7F
         81qbWz9O94AFj/n5Rd67cBkYuUpYTxwtqUSMvfepxAQwjjd8nuWers9qm8nuvgmeKk/Y
         zGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=;
        fh=v9DmBJ/xoFZR5c+lfUBxA1ixGdb8HwxzXvSEokMIkM4=;
        b=gy/p1PHMaxu8fyq225Sv9gaax+TEM+2x68ND1a5bIf8SFawuL7uHBcln5Qdm349L0K
         t9j0fOuE+B1cryey4PZRR+94TWq4hNZW9lMrJjI5JW8Qy8JxmzEx8nZcJQ+QOSTTkHCO
         Qb6fhpPogCI9yHppPJ9M4TXMO+TyM1dp17ShmkaUaLQBX8AE4S5ELbe/X3+7GvEw89KW
         Yr6qmaiwYyjfYTU6Y0m6XVBzD5Y9jKpvAOen1LofICSHlzdRbd3WIIOfh4upy2ybd8ia
         3VdPYTAUIX5vTVorxNvG4WOHfHVB5/BDAOmb2fsg8lI38YrZQnR68fiWKWpAKHG9jsNd
         dRpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221461; x=1787826261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=;
        b=JkvYKJ95KgONw6owUNOPlCJ1ysho2lfe5m6A4jWVsagl46uw+6WzJZUh60g6+VAX01
         pYlw9zXWFPy7Ff+CG8J6d4J5Aogh16GJ4F7lLFEanZcQ5tDQkiKOm41vNmFLohNekoeN
         TozYf8tvbaneWa0wyv9PWZ4oeRqtAJYoVDeG0buNdfLBFvoGNnJjXcSFiHtKHu9bUdcm
         k120Xset93TcdG34p2XM37EewzqkcQX1GZIMnPLNJTvUAB5A7QN1/JE/2kMCLsBTNj59
         AaoqoJI3Qsw2qr5r6h79X1RK97Fg605gAbWwXn+a78nGP6+UL4alM54mrutuNJTmw7fB
         287Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221461; x=1787826261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=;
        b=GPG6YCO4ISVsEPXPviMXG03X+ZWPtCKruyWYljLWeRcEc5wCpA7hzhoiGMierFwwJg
         EsN+GH6TIVGnfc8dqQigLx0nQsiwEZiE6jnIcgcODBVnzBN9h8924DHhQsiEF4iWJXL/
         S5r1Wkl66uhWSsTPHkNxouyDLt5Lc5maxC7eVgVhk1MIcxQJWoTq2EL9pYSfou/WJgLg
         H0Pmcz4ovk3Guu3BpLgW2BNdGTVPp2PcJjqVfyAmmu6/hhrwqLIuHI5+5/Rz9kUYUu98
         nFyN3HE+6ICrVZXYsQx66osBs4gK56bIXf9ghLW0Im3eZ2Vx4B78B8cQLHPH8m5GsExN
         TCbw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2QneHn0oWds0N1aCkAL6psEH+82mXa96MKgyqhC1KoPMvO57dGRKeZctTur0QrhvrOyT9kuQ0jA9a@vger.kernel.org
X-Gm-Message-State: AOJu0YwnOMZzfZADBnnvoxUAZTOiXC4UBxPAX8V5PTOObwb17XH0h1gT
	pRSkA24fBxDIQUWIg2CsjD4JPozZ5pk+3RkjGP676YK7k5x2RS73zOOgyB1rS2S+JcufFXubmKT
	bWTW4JOpnPSAl7u8FCDcBZTwrAPj2NKlQrG4mQiZRh4rm3B+YZvsWl6llYvrUPgeQ9whSVYaS1G
	FUeVlkjzD3DFwEX12FP0odR6YrKrkyKBVOeIYDQwk=
X-Gm-Gg: AR+sD11TGdI0+J99eS9IQn2dkh0ZBrU+ciVMme/UqprXboE3up5EooN8L3QoZBk12LJ
	yGHeR0zWZWTf5GToZx+NV0IFj+OclypcdtHdUU8+nNyDbnDBwloEoPttvqtv1aBZNiZrX3x17Ka
	/qyrzuamClRG3MVUlkRgFtx0LigUl8RDpoXHQifB/nSMdaNyGB75AOqMKhzA==
X-Received: by 2002:a05:6a00:2301:b0:847:7ffd:ce35 with SMTP id d2e1a72fcca58-851d382e720mr19263268b3a.8.1787221461187;
        Thu, 20 Aug 2026 03:24:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2301:b0:847:7ffd:ce35 with SMTP id
 d2e1a72fcca58-851d382e720mr19263163b3a.8.1787221460718; Thu, 20 Aug 2026
 03:24:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
 <20260618-ux500-power-domains-v7-1-v1-10-eb5e50b1a588@kernel.org>
 <CAPx+jO-ow2vo2wMxERLGse88wLoaR=HLdOWk6Qwv97ZdbE4R5Q@mail.gmail.com> <CAD++jLnzDmxW_SoJ9H1tS2_r+jd7A7FpLVp37nK=dOEPj=GExA@mail.gmail.com>
In-Reply-To: <CAD++jLnzDmxW_SoJ9H1tS2_r+jd7A7FpLVp37nK=dOEPj=GExA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:24:09 +0200
X-Gm-Features: AcwNN1XagjqLsUfXCAJXyqu2taAnOsy7gMxOrYs8oiiblP73dGEaPVwCq6ztGis
Message-ID: <CAPx+jO-+hLsAdDC9Ep16cO52cA2c=xKeXvngkGqzoC0FyxXj+A@mail.gmail.com>
Subject: Re: [PATCH 10/11] regulator: db8500: Add power domain regulators
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NiBTYWx0ZWRfX1s1zbadcRhSS
 uXmmHMPBH+1yL67fCCdIuCpnpOnF2Dcxz8NkfC5R/67P8+OgtWnPQnrcvHQ7QBgAW5IGHwh8VK0
 zNKFQEB4RBcIJ7Qq6U/qMiu/P5Co+3g96qVc854wHlAP2exCPHL1TZDhC0mVWmfeXsn9f9+s3mQ
 6Z/hjAehi4FkYpQqDbUV/UWXepGwYw9FFvCYRa/ZuXPzBJw/1X5TT0adD0O3U26kk7Ca9VfBWvL
 GZgG7U/593R/Re9YwsI0nhf9U1yFXGNOBhzNcSjEVV1xSJUQVhS0A0FtTZ8lTMiKX/LG8pAEUIM
 rgfcRHmL9fa3z0Wvig3cfWUajhtOGlmyMgXoEwvtIGCvyJCb53KMbtSQ5MUOTRmPD7M7qO8sDor
 aMGbK7KR7yVrzYj71nzCW6qdp4W67m4pQ7yPN0Kfm2lopEuNfvc8MYurBT4eNnVYQ0gAe+Ikkzd
 zwfbwQkG1R76HMVsRCQ==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a86d5d5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-_xB5rzH_TN0feDXJEkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NiBTYWx0ZWRfX2KQ9sVdWnErm
 Lk6wq9JvoS8dYLPy/kGen/8sapusxczgFRqesoyrnuajhFhu2how/rcabwfCYmMP3bnlNqqAPdF
 sJ0XlB3KI0cSLJFdFlzU1XKoafc/2MU=
X-Proofpoint-ORIG-GUID: kHeNRnTN0T1RCr_Aw0iujMC6xAOodV02
X-Proofpoint-GUID: kHeNRnTN0T1RCr_Aw0iujMC6xAOodV02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200076

On Wed, Aug 19, 2026 at 3:30=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Wed, Jul 8, 2026 at 5:53=E2=80=AFPM Ulf Hansson <ulf.hansson@oss.qualc=
omm.com> wrote:
>
> > On Thu, Jun 18, 2026 at 7:01=E2=80=AFAM Linus Walleij <linusw@kernel.or=
g> wrote:
> > >
> > > Add a DB8500 regulator driver for the VAPE and VSMPS2 compatibility n=
odes.
> > >
> > > Back the regulator enable state with the corresponding power domains.
> > >
> > > This is done for off-chip consumers: the corresponding voltage rails =
are
> > > routed out so they are used for powering different peripherals using
> > > these voltages as supplies.
> > >
> > > Assisted-by: Codex:gpt-5-5
> > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> (...)
> > > @@ -673,6 +673,7 @@ db8500-prcmu-regulators {
> > >                                 // DB8500_REGULATOR_VAPE
> > >                                 db8500_vape_reg: db8500_vape {
> > >                                         regulator-always-on;
> > > +                                       power-domains =3D <&pm_domain=
s DOMAIN_VAPE>;
> >
> > Hmm, isn't this the other way around? The power-domains node should
> > have a regulator supply?
>
> They probably have that, but that is not what this is about,
> it's the other way around.
>
> > We may even consider to skip to model the regulator altogether and
> > make the power domain operate directly on the prcmu instead.
>
> That is what the series tries to do, as a whole. Sorry if that was unclea=
r...
>
> What we do in this patch is to deal with the fact that two of the power
> domains, when enabled, also turn on two external power rails outside
> of the SoC.
>
> Since external components such as I2C devices cannot really be
> claimed as "being inside a power domain" they take a regulator.

So with I2C devices you are not referring to the I2C controllers, right?

Are you saying that these external I2C devices consume the same
regulator as the power-domain DOMAIN_VAPE uses?

I thought these types of external devices in general use a different
voltage range. Moreover, do note that DOMAIN_VAPE also has
corresponding OPPs (performance states) that change the voltage level
based on the requested OPP. I am not sure an external I2C would be
able to cope with that.

>
> This is based on my understanding that power domains is an
> SoC-internal concept only, so there is a clear boundary if something
> outside of the SoC starts to use such an externalized power rail.
>
> All this regulator does is to make sure the corresponding power domain
> is enabled when the regulator is enabled.
>
> I will repost all the patches once v7.3-rc1 is out.
>
> Yours,
> Linus Walleij

Great! I really appreciate that you move this forward!

Kind regards
Uffe
