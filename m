Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A15399CE9
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 14:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556702; cv=pass; b=JO6+kPP2TeoKIKoQPF9ufpLxF7LT7kAyeQliRRzrv6KtgJBdVgZByW+7iprjpl4wvdINXHzDIKwZYwTU39W4UOx9M3GJk5uQoC1lDRq714xTA5Ahc7fgR7UkWmdAMITYKm96HLNTEyHeDEIIJna6Kk6IP//PE+umipoBO5m84vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556702; c=relaxed/simple;
	bh=hiUOs3lVj64YP+qgdg+X3u1xuQjJYN6lKLOGoKrayZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHRDGhwkhm9NcmPqw/QMKhmE3lUyI+mIF9n38GoZDWC7xVthelFFLND8PgAg9HHKFOMvI5kI0KVvE3SLIeXjixWWnTdUZdPJv9KtQA4ZUYocrTtwTNmTvfBXDNraUhbBTMA2sYheSxpfletPSHr3RRspf+f/XWw7gr8cW0Tb2mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbYUQwuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Agb9dJ9z; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbYUQwuJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Agb9dJ9z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKdUM2408339
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 14:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=; b=VbYUQwuJPCbtoeVX
	m7otJFYOvB2nJ/0eD5rMovP6i9TEsL9EsY+aAjWGwu4BLzi+Cow5JCrCB0CpVwpc
	KCqXEBJThkepkP4ptknCDiKzHIua9stKQaMJCjZ2OedHblO1CwJtlYJe5tyV9rpu
	zuH+iDR3Gu/xBamKr5oMgVhPrcqdRvt9a6NZNcjuUgHnC/Nzg262hRdLYGi+Lh06
	YBh4CgVsDbBkT7VgKX38+3M/mXE1SkgvkmZY007Urf4ET0KiRlXMmeMGuIl3ut8G
	4IeuA77qbU7JY5aafiRsZCu/gCck2jBsIXIWm8E1ufCYrq96pI5kCmefSMsxzfrZ
	bOVO0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvca0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 14:38:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so9319652a91.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 07:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791556698; cv=none;
        d=google.com; s=arc-20260327;
        b=psswVwYjJuKdtbyxpIyY3n5HqGLhG3FWB4jT++6oUC8uj3KeX6FDuChLDPq4E+Y8FR
         uoqmGoyihpspAzXTFYTh294+HqJDLjwOZBoX4quRVTgtEjwru/1J/fplzRndk9qSIcoa
         jxfOU7KGLBqNd40+dsCm54CAXKxiKRJZrIq7Z0APb7TD++JTiAjcurww30qvG1KcNcWT
         i2csKgdVoXAOgR/M5IZYMjQ182vectP1JPpSchJdqlcHXlqV22GtEmD5bD975fsz0De5
         XHOnQ1FEFayPVgWv2ifnp27VsQK0wTAXgf5tGqOplf7wnPefUC6JOe7ZWPnC10wSX69x
         n2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=;
        fh=rHoKOBg6d7GJwJNGg+lDO+96DIDLgk9mHHqgx1ftxos=;
        b=MMeozID1Y7aAfmhMZP8P/sLb5P+ZL6pimLmaPQS3LCH2gEQiUs4WyfsRKs6bicl8Vy
         AbKw4mooEWPtGnD11NFqE2Gn57RLs/OMc0XnXWVimdEmJF3xCHHVGHmi6bs1URT/kwhb
         S4oBf5yV27zY9VB+J76riQxyV29nNWI7bK070foTMLaOobey3eRUqBigt11JIzb6MF33
         Coh2Zzf3K24B2625aO/Gp8HFbMd6n4WTmjAMTOfSUJAaE9aeL5uT2Zpb6h3GsUH+ADx6
         U8DeoyNj/2Qm30Qpf/2d0xnXq8utHtDbqB0VeRRFE9GYb7XnEZPxzn2Ru3HPhBPjfznd
         xWVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556698; x=1792161498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=;
        b=Agb9dJ9zDfjMeGpbVABH+YuedQhIrHExcvPQzIZZk1I7pt6YXZA1QvTCuHRenMVkBR
         Cl7LxVf1eQ1b8avs8T9QwSALAcsCXOpxxrT9nTvWY71OHXobr4YGTvv9K7nr52bgy0Gl
         y8ZU9qdXMmO+QkYDs5fvx7auhlVx6nsvRhxopwsudZvOdIwYL/cB8YH61Zm84ySrq5hb
         fPX51h9KCe8tV74K8OnjC0CDymhXSIR6fJOG0cmpOH9EQ2Lhz02pVwqwJ1YG8IgIeaad
         Y0A5c/ssugyy818/m+96PwLQwNbhxXPppRSdgjBRZMWm0HwaT4GvUjZJ00v9e3G16mGx
         EyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556698; x=1792161498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=;
        b=KdRefNkaGmX1fpU4oZTcwE/sy02UUAUyAmuItJzMtfCCblNRD+YkzjsajVuW+GrKGW
         9KcQzHYTKsXyybYpZLlknslZ+ZLs6FIXwRoNRFJaSMAsRBT0frtHJ4qr9Pi0ACdceZoN
         PgiBzc43EgnOH2P4V4hzi7c5rU0EJSqjOn4ZMFU+BqLgDEFjgrzgS1kFo6qXT+tDNWQ/
         vRceVZTktt2H49wOD1bV4UXE6I0o53u3VwfhRVLP9//vYjyWSS58mYHubFeUpr1jON2i
         CYG81ogYAobCvMM4gg0TZyu1oXgsNfZiNwA47fW75U6dAxYG8XKstdkPzPtgE0Qa1m1y
         PlOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbVaw6eHcBIuMJ0QnnfxUxP6R9jeZRNTwkxNN5ClnCECeyy3koZLgsoI4KlIECnr9rsVHPbfHVB2qh@vger.kernel.org
X-Gm-Message-State: AFq9FYIh543X2C4PUqd0pVUljNQ9vJU4y0dHpW1khh7ORCEtIiSHLbh1
	iBM7UVDwPWt4P2SsqtkkHac58PU1pgdQ4IUn3Z2BlL3fD7go4t3r2Nt8GDTpeCitfaE9TxYlTPC
	39NUeTlQwWlWUe9Zck4jbSEFlM7Zt1ePXU2Qfay3M2LkBjpWjY+lvCWc/lpVzHD4A33lBQaU7GB
	YMepvKDn3nXXSWC1KIg4zVk9hxzGpw2YxU/OFEf9w=
X-Gm-Gg: AYBFou0pNtVnVnuas20uqpOqC+Ek0yXzuTygyw4f9ZKsL6KcrSlPsVtpBZ0y6zYOBkL
	wtKB/YY+IVDdQ/0dBxN8zLqXnvpIWy9OhwFRNoJqTTVyl1kHtQcUfauuvexQTVjojAgNDfyrdo+
	/2HsO94RmE44d7j+2zkbMI4RLezZ/7jJBsOHzzcYKILsbYXmJsgogvGUoh8g==
X-Received: by 2002:a17:90b:1e41:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ab3a96ffd7mr2186024a91.59.1791556698437;
        Fri, 09 Oct 2026 07:38:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1e41:b0:3a8:9b79:e6ea with SMTP id
 98e67ed59e1d1-3ab3a96ffd7mr2185985a91.59.1791556697914; Fri, 09 Oct 2026
 07:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-5-9352be6b86b1@kernel.org>
 <CAL_Jsq+1O+os8=YGUoKg6zCm-r0gQ35baKX=z65uTQNB0i=RVQ@mail.gmail.com>
 <CAD++jLm+yRo9e1UDhnaYrdPq28mdyYKQZ6tdKuUa3UG85imkNA@mail.gmail.com> <20261009131902.GA1195061-robh@kernel.org>
In-Reply-To: <20261009131902.GA1195061-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:38:06 +0200
X-Gm-Features: AclHuK-dvh3nBN-NbcFTG0ZbDjXuEqk09evXIZaWdeTMn5nwqDOFCebwqJJJ9Ag
Message-ID: <CAPx+jO9F6wUG9M_cV-xiF-KAKD5kJ02n+yE6L9vocs=KWaKFTw@mail.gmail.com>
Subject: Re: [PATCH v3 05/18] dt-bindings: display: ste,mcde: Allow power domains
To: Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: lCauWkegQa1mIXYZsOXfZqWLGRrKTo9k
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac8fc5c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=sRttis5sQqJQ8Uet4gEA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX8P3c0oCFsNjf
 Qfy7BKFWUOnqXyUwo2FSIUbA1Ml4dyT3DGD+nOiZUpHriFVXzcMYgOGzzpeIsAjHuaUfnqK5Y1Y
 iubLT94B46KAIwiFT447EVQTX1/OiUZgMmDCV1gR4loKRiA2HP1QuVgeIHatlql8h1KDPAdyRBd
 c6G63CrEMC8krodRTqsIbgbZnK02QbQpIseKir2af+svoMcmR2OSMVJI4KOfV5RnkJwfNulpj7c
 kZMXL0wKYCg+KLfsdviPZ2E2z6EB+WUF/xunahzbqVsnQp/WF3yt6mhB2J66IUjt7pv/O1spjwt
 Df2hmhD2Su4SUA36K8a1LSd6Y2GUdjzcnDxBoNQEoe/83I50/6loCHL0wnjGBnNDHVELmLNGxdJ
 sxE6mnE2tZnyFkjLVbZgs8uMYb5kvvHVD6T68j4ePnNkcUhmUDrqyAD6/iAj7Ps46OAuwYjvtlj
 +9x0LTfskzPSg4So/Kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX+RSTzDdpCiJz
 SIR/6VQzS5HSJs0ssizoNR5QR5ebdeallqF5C0i3WoQhZjG6ofUh96yCJad/GicNgvZlknu3p2c
 R2B3yUJ7O9vH/BZVgSEQqlXhM9sFX+Q=
X-Proofpoint-GUID: lCauWkegQa1mIXYZsOXfZqWLGRrKTo9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090058

On Fri, Oct 9, 2026 at 3:19=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 09, 2026 at 07:05:46AM +0200, Linus Walleij wrote:
> > On Thu, Oct 8, 2026 at 7:41=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > > > +      power-domains =3D <&pm_domains DOMAIN_B2R2_MCDE>;
> > >
> > > This patch is in next, but the define is not breaking dt_binding_chec=
k.
> >
> > I screwed up, I forgot the dependency on the new define :(
> >
> > I asked Ulf to merge the prerequisite which would resolve it:
> > https://lore.kernel.org/linux-pm/CAD++jL=3DgFt9kKZH9T-m8B_pbwRvzc35tTrM=
n5V238d3528DpUg@mail.gmail.com/
> >
> > Is it very urgent so I should just revert it? I could also just merge
> > the single patch adding the defines into the drm-misc tree if
> > Ulf is OK with that.
>
> 'make dt_binding_check' errors out. That kills my bot for anything based
> on next which is most patches.
>
> You could also just remove the define from the example.
>
> (Note that drm folks require a revert be posted and acked or they will
> revert your revert. I learned the hard way.)
>
> Rob

I have queued up three patches [1] for next from Linus via my pmdomain
tree. The patches are also available for you to pull via my immutable
dt branch. I assume that should resolve this problem?

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20261009-ux500-power-domains-v7-3-rc1-redux-v1-=
0-5eb1b90bc35e@kernel.org/
