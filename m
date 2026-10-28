Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793185213;
	b=u3CVPjra1omJ4Y57St0IvxKL4E5Z8QDdtqrNQWeIjru10O5Seo3VhMffm6ZrEGFJlyae
	 Sm2dziNyvwjLEY06v2aMGg98ihFdIKPHo5XoM4uUhBkOsKafXJb/mP8Zg4L7+K0wupF3q
	 dcwqAzVOWY2S6f/TDiQMjEL9gr2SrWe8t0P9DIr/rFcMbuQDgc7Pc2cEMnCNzEjM/xjIK
	 UV7Q7tDnz/hM+AXctj4ZotZJyi2H4bwvRo372YEeglkvCQEi9Lv/+qML0GoedWUhI0Iis
	 p0R6dgl7x5eNaBd6uQrg1MPBCcawhDl5VQ4ncUd43rFVHoUhlqlYCfjSyQgYumdAwDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=;
	b=H0PpIlWFNC+3jtyqrb3fF2Bzgo1XvX2+SweNpLwYzTEDa/JID46u6mJVOGF4bNOsStsW
	 L+l7Of0F5z+UAr3Sx4/SbpB4zhv8k3zqyqo2Tnh+14JS5v9dgxqmsSrToFdF+8a1zja+M
	 qfgKm0ZHEhQrMfnPTeasT3XjBQhFALo/Ry9jOD9yTssWMHBNcps6PnU6loccPT8YipKjP
	 7zG+IK9LBqLt8r9rVMjTqVEgwgRj/ia91jCSivTwLApu5+aK2gF8yxtVHy9Qf1I3dHXf1
	 eVvXAIfoqHuAE+meqbIm+l6nQgdYu+T4O4X5+xbVu7xNmJqGcQw80dw4Wz+Pbfyl4FQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLZUaHMv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TwwPPUDa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823D3606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 823D3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLZUaHMv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TwwPPUDa
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SAa136872203
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=; b=YLZUaHMvORb5+JOm
	pG6DIHFWDZCgl6lavcglKsmKSBHvYojRNB2UznE7BHNJKjVtjehpaXBSngpbtnCk
	OCsMb6xLFLL3Jh43HIREbPjEargv4QqJED5H3FeXVbxaZZq4l2oKrdsKuJYSw+L3
	hQ78YRw5ihdKxJhXhM6aPpnwoZa3jIod3pDbSwgb03x7caVeMeOfyClpTss+NY4R
	5W5yXsZZSkpoN829u+IQ13XhSJr3O/Z1iSKu8weAgT/rYrQsz2dArQgUcPf/35hf
	PpGI1UXTWE3PDnkkbsMwa2L6nA31G8p6B3vQreWi9edsjsOrUuoq4Ge+uwnY//sI
	XZbljw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehg2fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:00:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8dd9b9743so8718215ad.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793185210; cv=none;
        d=google.com; s=arc-20260327;
        b=T1xQy4GSch9AmJBQ7lpA117Y0vtUjVOrKfje2vp/gXnYA47AGskqCwJqyO2SKjeHD9
         m+5TRuB+X9najKd6+KGIYvQskSKnqeJZqPkPiCKo2iUvTjhSmmTSLJ/wErwopbd26maw
         RaM3PO68AwB2H7gSOabH9NqpDEX653mb0b9TvGF0MXY9eySA2Di3dwsiDf8kQ5twS3rq
         1qwFZfQsvn1F0WmuLadR7E2njAwY03yUF+EZa8jzigexByLTvCWNv6X2tjN0XyOxLhbE
         rOsnpu8VI2pRppqWmhYlYC90suBaKRJ6UhRBG/CF6+N/vdrSyW1gVgXyDgJud/7UZxH6
         JXxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=;
        fh=zPGPYRodrfLetnfA1v7dwL7zsPw8Ujj3RJ1lLT/2r2w=;
        b=EWBjPhF8GltyH6D4xr6FHikln3g7mqrekwkELw/83KLHB37AeZijU24hTk+DM3cPXd
         3ijhkLTyhc3w1Ph6IjgocxY+YzfMsiY4y8OE4VAalBT3y0LaVfUOzlD2GDvtO1nJK/zS
         hKaZkxpbNhw3eyZDsHI44T9snXi4GqwyEZ23XzRK1nB9ZuBI6eeWQYrTFt1+SL5KFCnT
         2FSfiQpkbBj4A27ZWwF2htmcZeKIH6g/x6qHE3bv/gTFfSQSoCo2HI56bLi+a/6s7BiX
         KW+qbyx8Lx8jNH2W/fyIy9cwpeVv8sX4UUw+7enqFdpknGradFNB8/QlY3KH73cCINlF
         OT9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793185210; x=1793790010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=;
        b=TwwPPUDa0jtCCNmldKxmcrc9NtQgN0xgFHn7Z65f01ViRnrPtkmqFpIKItmIqyk3Sv
         B5L6lhtFgmcE/LDKLBvSaB+shejfHhYyr0TZYe0J/CQqWLk/GX1xQ+lF8YbGiBy3J2id
         9QfnFej/IrD53IvxcpVc4Em0c+JTLe6Ma5F++UJz2X0tsVboaadbm8yjbnmOXAQ9/zA8
         n/va1fQpbSC6DAoYdnUAas0RzlUFKnoPpwnwyzEUwq9/vYRxhywLTmGHYVlr1GxtVi5J
         zkLFeLqcg+Zpyv876RkTkm5tEcPB5tBp6Fl7hENjfj442AfOsan7ZSCrnnUvj7tPn2dN
         xBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185210; x=1793790010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wa+/owR94gXnrAcOckNHscnr8fLSqcbseBqLJMCJV8=;
        b=a1QTTNdRfNppSW8S3+dW+ipUXWUvFiHSAdB0Eqw/zbvwLc6B1dkibkSUGc7BmNwb5A
         LY9spjz//kONv8424wqifzjOb0PtjEDZKWphi5mfbWfu3RAhbv3aUqWzAWZ5YSlWCr0q
         Bo1foCT1kLE+oXktpAiApc3wCaaBQi7y56IRxIoVuA2L2JSOEgo67+s87QHI1Mi+jOD4
         Tc8WZiLdeBzCJDqWrW5Dyf73IAzh1iGmhlP3b4EYpZbKaX4Ku7VVvAPDWnyYG9dty2Zb
         kptfuMcptcJHZzTj5vb6Sd5nbmfiWG/CUwCTftXb3ucly7CVK/YKsk4c7SZvZb91OHpc
         d+TA==
X-Forwarded-Encrypted: i=1; AKwUvBzz8eWI4PJckpcnO5ge18J726BfsmmGwQh17qzq0FecPRRu8phmR9knDFQqTCMUzrxyfigElDonoyCC@vger.kernel.org
X-Gm-Message-State: AFq9FYJJqMH9+TQHPVCtYonyne0nays+6C7WX6+yHsRzU+DTc8hj21J4
	0sRNcfPnCAUX4mMPYZ3FQ9OV6YL+822FSSO5furuFkdZ69R9hMdYngPGZ13R0T7zhOVkQblJIHW
	V9hqBShdbXhF0wp+B0LSSy4FcNDcZuILVDg7YyI5WRGwa59hIfwEu4tpoMJ5MC0k58vfe7zkJS8
	B4rVN0SWN1xpasRbrGpYIKdZUK726nvXDL6k/bZgE=
X-Gm-Gg: AYBFou0bawiTGntx+QNW7k7KicMfWSOt02581ksseMyrqCM2xSWQ/TAHBoO2PwTbkIo
	iQucGOYw7RHXO8PUT1caLuiNeeM8/rtJWSlz/36U91jNQxlZcUkKRK8ABD2gp/xKhdG5lkQtc4w
	NsQi2fwWu9meVwW5jwk+vVDnBpGWk1lI2s/eVDgZ57w/mNiStQmGI7EFE=
X-Received: by 2002:a17:903:244c:b0:2e9:7dda:bfd1 with SMTP id d9443c01a7336-2eb003cdd36mr19355655ad.30.1793185209825;
        Wed, 28 Oct 2026 04:00:09 -0700 (PDT)
X-Received: by 2002:a17:903:244c:b0:2e9:7dda:bfd1 with SMTP id
 d9443c01a7336-2eb003cdd36mr19355325ad.30.1793185209362; Wed, 28 Oct 2026
 04:00:09 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com>
 <20261006-romantic-stalwart-seriema-90e71d@sudeepholla> <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
 <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
 <CAPx+jO-_aY5pMnWyy1hAs1WRmfW33vc317jdtBsEXYBoHsPfxA@mail.gmail.com>
 <20261009-skilled-mature-bittern-2206fc@sudeepholla> <CAPx+jO87gkTumF=Tg=UPWpJO6O-CRF4njT2KxQ3f=4nF5m7GiQ@mail.gmail.com>
 <20261014-prudent-mini-duck-377cb6@sudeepholla>
In-Reply-To: <20261014-prudent-mini-duck-377cb6@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:59:58 +0100
X-Gm-Features: AclHuK-LQgnIpxOBv6YIR41I8lr76Fns1lvAAUTxZNI-80rsX3bNmiwX8o5xW2c
Message-ID: <CAPx+jO_BOwbKeRytBezm+piLhb8Z5N2eQO=LRwBQoSZ3kXOpwQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: Add support for system-suspend-only states
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MyBTYWx0ZWRfX2KiMJdO03f4r
 Tw0X66+r6r8SbQ/YTmB5y62ebM2LVFPMAruc1sBHW0+UuLMzfR5KRtfoj8T/2nxZKlhiVd6DyLg
 jfmYYf7kaAVQ2huHGMYZs6IBCzZDIFWQQgeBonUY+z0S7RaCU1hgZ+4TR9dmppbDD3BFmZ42/qF
 6jjGeqhdJrnrJV/uDdMRMcbaQMNF7X02JG6f4XJACMO8IXqQrw+feGChtf+qJ/t3wZK5f4c7Skt
 G6nataFw5yYDijF+jsdYapPixqjJCwjcu7vX/9i1g+SB5b2gE6zIFzTsy/gUxwVk1v7koaQrICn
 ZDLQC0sKMY8bpTMUhQe5X7HQQlLMFA8UHeFzmsOCHiAWscIx6hpGh/RvcxKfFxM59fzUKDz0/O3
 OroDQDnuHBo6ynkNOiEM1d8VCntW3mi0Ei57jazCw5+qrmJmlFqDDPpz1yqdjY1F0uTf4jj9Q69
 duhF63g9p4VTm/ut6MA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1d5ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=Fkqsunai0WhB3pQShDEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: MbXFrYy6uOs_UbL9e3yhgQ_11i_l41st
X-Proofpoint-GUID: MbXFrYy6uOs_UbL9e3yhgQ_11i_l41st
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MyBTYWx0ZWRfX5sQUO3GXS4uR
 4Sagng5M8SCwv1TfPihzI+qlFKtsCT4R7YMZYO/6QQy7BXJHBxMRRCByNyi0qVp3rCCjWc7HBkb
 F3R9mVOOi0Pk36jbyXFaiTe0VGsNZTo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280043

On Wed, Oct 14, 2026 at 9:12=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Tue, Oct 13, 2026 at 12:11:36PM +0200, Ulf Hansson wrote:
> > On Fri, Oct 9, 2026 at 5:27=E2=80=AFPM Sudeep Holla <sudeep.holla@kerne=
l.org> wrote:
> > >
> > > On Fri, Oct 09, 2026 at 04:26:38PM +0200, Ulf Hansson wrote:
>
> [...]
>
> > > > If that's the case, besides that the cluster PM domain topology mus=
t
> > > > be modelled accordingly, the display device should be hooked up to =
the
> > > > cluster PM domain it belongs to.
> > > >
> > >
> > > Ah, I thought that's the way the whole domain-idle was modelled as we
> > > started this OSI discussion a decade ago with an example of CPU clust=
ers
> > > sharing power domains with some other devices. I am surprised if that=
 is
> > > not the case already =F0=9F=99=81.
> >
> > It works fine today, I was just trying to explain how it works,
> > considering the use case that you brought up.
> >
>
> Ah OK, good to hear. For once, it sounded like that's not the case. My ba=
d.
>
> > >
> > > > Beyond that, it's the corresponding display driver that becomes
> > > > responsible for what should happen during system suspend. If the
> > > > screen needs to stay on it may need to call device_set_awake_path()
> > > > for the display device - unless it's a decision for user space that
> > > > can control the behaviour for the display device via its sysfs node=
.
> > > > If things are managed accordingly, genpd_finish_suspend() may decid=
e
> > > > to keep the corresponding PM domain powered on during system suspen=
d.
> > > >
> > >
> > > But the s2idle and s2ram anyways suspends all the devices, so they ne=
ed
> > > to vote in for the power domains to be turned off. If they are suppos=
ed
> > > to stay on, the system enters the state it can based on the other vot=
es.
> > >
> > > > The above said, $subject patch doesn't change any of this. It only
> > > > allows us to use more states (deeper), which are limited to system
> > > > suspend (s2idle).
> > > >
> > >
> > > Still not convinced, if all devices are plugged in to the power domai=
n
> > > hierarchy correctly and the domain-idle states represent or carries
> > > the entire system power domain topology, we shouldn't need this extra
> > > information. Having it make cause issues when it conflicts with the
> > > topology information IMO.
> >
> > No, it's still not sufficient to model the power domain hierarchy corre=
ctly.
> >
> > These "system states" are special since they require additional
> > coordination in FW/HW, to take into account votes not directly
> > controlled by Linux.
> >
>
> But if Linux doesn't control, some other entity would vote and until then
> the system shouldn't enter that state. Without knowing that it is system
> state, will the kernel be unable to choose that state as it hidden vote
> is invisible/not tracked ? I trying to understand why if Linux chooses
> that system level state as part of idle loop, the platform can't downgrad=
e
> if all the voting requirements are not met. I am struggling with that
> and want to make sure we are not working around a broken firmware.

For OSI, all the FW would be able to do is to return an error. But
that doesn't prevent Linux from trying the same idle state again and
again.

For PC mode, the FW should be able to downgrade the vote. Although,
from the cpuidle governor point of view that would be suboptimal as it
means that we will try to use an idle state that isn't really possible
to enter.

>
> Sorry for being pedantic, but some real example would help to understand
> it IMO.

I will coordinate with Maulik to try to share some examples.

>
> > I realize that the description in patch1 should be extended a bit to
> > explain this better. In principle, we can compare this with the PSCI
> > SYSTEM_SUSPEND support. The difference would be that PSCI
> > SYSTEM_SUSPEND is limited to support only one state, while the
> > $subject series would allow us to support multiple.
> >
>
> I understand that part. SYSTEM_SUSPEND is sort of platform co-ordinated
> once the requirement for entering is met.

Right! And I think that kind of explains the problem we are looking at
quite well.

These "system-states" are similar to how PSCI SYSTEM_SUSPEND works.
There is additional coordination needed in the FW to be able to enter
these states.

>
> > In regards to ACPI. I think this is as simple as comparing it with the
> > list of ACPI S-states.
> >
>
> I need to check if we use ACPI S-states via S2Idle which is the case with
> this patch set I assume.

Yes, this series enables the "system-states" to be used for S2Idle -
and prevents them from being used for the regular CPUIdle path.

Kind regards
Uffe
