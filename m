Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D81B459AD2
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556017; cv=pass; b=sHQam7BxnfVJOiC+Eau7Zcrxw5ZulnB+jXZmFeCUlyp5B8+/k2Ycx8fomkchsFdDVI8Ht/b4Ih4Qb5CKo81RJp6ATv8aPtRcq44KnDqyfENW3Jd8FtmNw1Q3ym/fyT+TZVMX2zBjJRb9S5zm+cg7K8p04qHusUYHDo7f2Zm98jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556017; c=relaxed/simple;
	bh=hjigRTpAheShvm4CUT48bphb627DqEDqb9jtmCAaHI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Em3gPwnFW/S3D9sCjfNkv6ttfQ8J7b0ljPsacUpCTQOOopHUZJsJg1K9Kh5H5nn0hzArg4+1vzCcnQKK3bxdf/n6MmApnhySMvpp+wl64JosNgDmiOE6WCMBdELQK6orlygaIZ3qCplU2RHLzIyf1ZxgufJQra9r0tpTincEdVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVytQEUj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsLuZIfC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVytQEUj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsLuZIfC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKKqH2916638
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 14:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yn5+ecY3l/7Ibm3VZ5iLKxtcMms0hMKLnboQJLRWmU4=; b=KVytQEUjtqCMeEs+
	IlaupvZ6HdAWnkXDlu8DGKXcQmaWAhzC0hIo4Kuw+rT2SBbUn608lxqOTXIFx76T
	24L1342L5BBnS/nn70pm7616hPPD6f+ub6C4saRgX6+Oh5yryqCVFUtGYKaOhS5c
	zgLsWmqEj7ZaZEp7S/eO0Y/80s9DthnY4YhFmWXCUUjG7ul5bG/KUKBoWQNbcyK3
	SQomoBHOudb/+o7riht2a3wZk6GBA4h3jy4kmfuoh5pbe4K3LKlS+uf88C5flLl/
	Ktj+xd+ptKntIzvpPsUgq9MqW0h+HO0ZSIZQ1DpnZt13t7Hv9dAIdLS7e3cjOm9O
	ia+Nsg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nuftr1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 14:26:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8883dcc671eso4955982b3a.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 07:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791556015; cv=none;
        d=google.com; s=arc-20260327;
        b=NxJVwVpS8efF3mDUm5RhcWKMCQQ7VjpSHcAqqHNsmB7vG7fz+YISOzo4nL7YWtYpp9
         7/p7BywA4YGm9pYfgr7Gg/OZOZOeG5J6p01ZM80bKTit5KiEO5mfwGEn3+Bgd/LpSfK7
         xvN1NO5utUOO77DudLpxr/7fvylbU6+vjGOy9gOeuWpDqVMnD/dJRwML0Uv9IXf2fKPm
         ODy/aFCJairAuFtYpCAjprsw/EabL1uEDLUh3xSNI8nAeVVHYWCMp7ob5mswaYgVpv+6
         aW/ng0P7/s17xM5IY7GTR0lulqYq5DhLpc5m5JYYKxRNTQY1rJ4kgtdJyhhF0b6M4wnC
         75fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yn5+ecY3l/7Ibm3VZ5iLKxtcMms0hMKLnboQJLRWmU4=;
        fh=bek/hPcRrBPCNjY8xoAUuWrae4Yk4HrsHM/3JNsYgz0=;
        b=fO1FNu7jZP3bQBz5svVfmRJcKpBvVrctv5nu6w5y2rH27nXwV4jysnFL3slBVevc0Y
         i+4RehNXRKIMiyWQ+KCC9FJVbwZ43BTTuplK1BX/c0GptuQZtFb9oq2TCLvckZhLUNuI
         rY5SE+rZvpo9zCPuHLHqQ1Bw7YyVGIKRC1jKpew5++kQF34THvvQlavYi6y1MP/V/0CZ
         OA7CJdUrOfeqsBxUfde/ugGrWZl1Vt/f3OzK4oOYcNVuHgysyzLL4xL7N3+c7VJtqkJN
         0vyO4n4CfSW5RAOmMnnalpEJtOkBnpBZpQF54SvKKkbAi4PzunUzkBCnZYgnz2WpoH95
         TJFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556015; x=1792160815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yn5+ecY3l/7Ibm3VZ5iLKxtcMms0hMKLnboQJLRWmU4=;
        b=JsLuZIfC5BqvWQG8Lc3WgF39aqJJoKsW90tCSxOfRJqf4BAJ+bwJLgfn4vSUtLdtgu
         7xjOHxN94tWIH1HYRD8bpw6BC2AQjeATE8tMFMWhUDVfrtNPGzhwgTzUjPrTxtP51f/o
         ZmZKgiNCKgORBYpwbeFyY0NQWKuVyGlwL39WwH5gN4Xx0EnRKEy8/QrWK0sJYpBiJKm2
         zEOWfrgcJVoOGzeWIYOLLYCo6Z5q4EXcHIJEE/5gYtKKMus8l0igMjoFOeZJPFVwtdJz
         hNJj9vA+3lwDTHPGstjSFOBF4RShX1s/7DdkGtv3e+H6YnrYwWV4bmYgqHU9od761ec1
         6g3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556015; x=1792160815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yn5+ecY3l/7Ibm3VZ5iLKxtcMms0hMKLnboQJLRWmU4=;
        b=i2SUsiSbBhLkafU3O3opYXKT4MTiylLvSN4E5o3BxxUD7G/Zc/HyyT+Hgykd2dKT/8
         A5zJqdVUWD6wZ2KmY0daNWi4UCtgR9V7StSLT/3dlR1swbGWmwcOuWJ1vsgiJqEeLLFC
         YfmbTInAKL7XnDij3Arr3XfGcjCv0KYW8F1CIVCkOgNcgMO2gCxLYGtYo6ZYQjwb78kf
         Ezq9YlOShqh5SGD42SncNfUz8P5sTng1CTJD7DaKCCrY4dkzNKiNu97lv5fRkQt9xVzz
         3a3WLA6pna9sclEcvKLjDsznQqRhDhSuezxqAyeVvCEk0furyjtpb28dvP6wHb3B0MaY
         VDKw==
X-Forwarded-Encrypted: i=1; AKwUvBwqg8+2istwk4cqWJO62f40av6XVIumHXK4qEnwiRbce9Qwgh4XOlh7OnX1Uo+g+ENLP66k9tB5+wHZ@vger.kernel.org
X-Gm-Message-State: AFuF++nlw3Q+Pkgcw4XOzY3CvG1rD5IJ+92Ofk9a96TIo6RE/CRpGCZZ
	iYWBQp6Ip66zJjmhB16XdTOMw9PN9jyQOUD7Ik7MM/DoBf0u1PjIcauhobV94uX3oLAF7rJI+ij
	KQt+Ul7jBEIaOfgjUW5mH6NEEyjZWqwSXA3eqK29nYTv8kMSGW+NG+gNeE/mpPXVhciC+Jo4APM
	1AnYLl3OAFm8eZKsjktws1YoIupuAlG8+6rYibaHs=
X-Gm-Gg: AYBFou1/kUCsor1s4QgpetNqRrefOWwW8qBS5GfmuQWtNWQ2BnK0oPpFJtggdQKUr/f
	LJxsBioVIeIBYmnedhe4xiI4L52rrebU07FP0fpA+m8pb4zPRMOlDaBlBbKUV6KEOA86tJy7ElP
	XA6yQ80xk3efhQMVnKKYiVzjp5x+CEqITRacd8lvF0IxfLoqvEla4bcDcFhA==
X-Received: by 2002:a05:6a20:c79a:b0:3e0:b71b:a8f2 with SMTP id adf61e73a8af0-3e16c010522mr1735692637.40.1791556010007;
        Fri, 09 Oct 2026 07:26:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:c79a:b0:3e0:b71b:a8f2 with SMTP id
 adf61e73a8af0-3e16c010522mr1735661637.40.1791556009444; Fri, 09 Oct 2026
 07:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-2-3c402c66f388@oss.qualcomm.com>
 <20261006-romantic-stalwart-seriema-90e71d@sudeepholla> <CAPx+jO-T_0KT3GytYu8w6QvrhXFQNZQzR496RL=McU6rnMtnPA@mail.gmail.com>
 <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
In-Reply-To: <20261009-frisky-rottweiler-from-avalon-6c409e@sudeepholla>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:26:38 +0200
X-Gm-Features: AclHuK_Vubf4k8TpvsD1c7GgWbgnBlZu6M1U_szLd1fRdLCNfDEiyzf-bluvzDo
Message-ID: <CAPx+jO-_aY5pMnWyy1hAs1WRmfW33vc317jdtBsEXYBoHsPfxA@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8f9af cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=xZBbqvtqD373e08s9rwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfXwRtScy+B0uAk
 2rkYLrVf15f+KOFMoSfjRcvcJFwK6ouGVGcXpa9ufK/Mbi6gpoqGelZ3+3cm+QcxYJCEkAemQGK
 GqteyVM854RmA2xv5gYYuIwcqgsBmGE=
X-Proofpoint-GUID: cdsIGr4nYVOvLj3wKWiIUjR_WQMp8nda
X-Proofpoint-ORIG-GUID: cdsIGr4nYVOvLj3wKWiIUjR_WQMp8nda
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfXyiRvgkqldaE+
 9T2YYJgIkGHTUyPQHA7Wqzv0r/DobmYqC/UdjhJf28ZmvPTXM+eIEExmsIkJgYgVz1IkhZnnAQM
 eVlElJepEQLvNco+2nJwbpCbAAyNlt84YvOIcPKbesJAnD9DGYZ2fW/MY/5oiHKAt/6ZPf/Du1Y
 8uoAZ2cInx39ETi81N4HQ+YMbp2a9Oi3T+HkFviVyCSTm17tIJlSfi06igdgH+WRxtDF34AhELW
 TFr/jIu/7a8I/r6bjnKwIkqgf2vdVoChY/6WQjkdhSMh323hsI5gqCjvXZf2bIK+WJ0SOg84VVc
 lbYZsrST/kQEXb8Nc4VwJOzJFWaRkKPMSlQAsRTMCpYCFMm4rhRE4rTIYmVZxWY45u2X9nuA1kK
 7el7YqUKAVHqZGU9hMxKkaSC7zpe/kXM5YA85O2cBVeltUJLCSmgl3nt8YN5Aetp/RqNBxowBKk
 0N8VmV0tPVe4GAuEHiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090057

On Fri, Oct 9, 2026 at 2:21=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.or=
g> wrote:
>
> On Thu, Oct 08, 2026 at 02:21:49PM +0200, Ulf Hansson wrote:
> > On Tue, Oct 6, 2026 at 11:15=E2=80=AFAM Sudeep Holla <sudeep.holla@kern=
el.org> wrote:
> > >
> > > On Mon, Oct 05, 2026 at 08:59:43PM +0530, Maulik Shah wrote:
> > > > Some domain idle states require system-wide coordination and should=
 not be
> > > > selected during regular CPU idle. However those states remain valid=
 for
> > > > system-wide suspend like s2idle.
> > > >
> > > > Add a per-state system_state boolean and populate it from the syste=
m-state
> > > > property. Make the genpd governor skip these states during CPU idle=
. Leave
> > > > the system wide suspend path unchanged so s2idle can select them.
> > > >
> > >
> > > Instead of this I am thinking if we can QoS cpu latency setting and b=
lock
> > > system level states normally. Since s2idle is user driven, it should =
be
> > > controllable via user-space and we don't have to define bindings agai=
n
> > > if systems that use platform-coordinated needs this too. They may not
> > > use domain-idle-states.
> >
> > Even if we likely could make that work, it's seems not correct to rely
> > on userspace to make the kernel to pick the correct idle state, while
> > the decision should be based on the characteristics of the HW.
> >
> > In regards to PSCI PC mode, I believe we should consider adding the
> > similar DT property for the arm,idle-state binding and make a
> > corresponding change for the regular CPUIdle path/governors. Although,
> > it doesn't necessarily need to be part of the $subject series. I would
> >  be fine if that is handled later on too.
> >
>
> While I agree with this line of argument, I am bit worried that there is
> more deviation from ACPI _LPI binding(equivalent to these in DT). If othe=
r
> OS has manged to run the same firmware without adding such information
> to the firmware(ACPI in this case), why do we need that in DT. Is that
> information encoded elsewhere in a different form in ACPI and is this the
> right place(the idle state binding for DT) is what I am trying to underst=
and
> here.

I don't have the information about ACPI at hand, so I will leave that
to Maulik to be answered. Or perhaps, someone else already has this
information and can share that with us?

In any case, I don't see any other reasonable way to describe this in
DT at this point.

>
> Also taking the example of screen on, won't that be prevented as the
> system domain is shared by the system level idle-states we are talking
> and the screen/display device. So it never votes to power down that
> and the PSCI OSI domain idle driver must not be able to choose the system
> level state.
>
> In general, there is some device that doesn't vote to power down the doma=
in
> and hence we can't enter the state. So my question is, will there be some
> device that doesn't explicitly register vote and hence we need an alterna=
te
> mechanism like the one proposed in this set ? If so, what are those and
> how does that work in system suspend states.

Assuming I understand the above use case, you are thinking that the
display device (for example) is a part of a cluster PM domain, right?

If that's the case, besides that the cluster PM domain topology must
be modelled accordingly, the display device should be hooked up to the
cluster PM domain it belongs to.

Beyond that, it's the corresponding display driver that becomes
responsible for what should happen during system suspend. If the
screen needs to stay on it may need to call device_set_awake_path()
for the display device - unless it's a decision for user space that
can control the behaviour for the display device via its sysfs node.
If things are managed accordingly, genpd_finish_suspend() may decide
to keep the corresponding PM domain powered on during system suspend.

The above said, $subject patch doesn't change any of this. It only
allows us to use more states (deeper), which are limited to system
suspend (s2idle).

>
> Or am I missing something more fundamental the makes all the above argume=
nt
> void.
>
> --
> Regards,
> Sudeep

Did that make sense?

Kind regards
Uffe
