Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DA9346AE8
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080128; cv=pass; b=OJLllWzt8nY8EDi0MztfQWQZtewyGG0Wwlw8RLWsk4OTJkiJ9hp7kdUmg/9HKntIuOSunmChTjiAtIBQ41H40rSDdVuFG5FzAtMXneBMakFk22/AxuUiQ34aSs7h63/x9ApVZhROAKWUpiu8JbHOlXy4HhY4UjaiF+SaFhvq4Do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080128; c=relaxed/simple;
	bh=SiZpwxNeV81OB5dUi2Jt9w+Gkx5HRWsxqL1aTClVneY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/jXsvUWet9NtrOMqq7AOvdoXM0fewlupYyRDJjPaZMtC08RC48kM7uolpC3yTwIjC6YsW54BtdGr3vnsVfGnly/M2rR0+b/acRJVJvLb/gOM8FTXyhoPxDG6unO/veD4a52XK2C4xU1yVdne25sCC2zuA8np1RvOS0kE12gR5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=NiCBiH/B; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="NiCBiH/B"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so2680965e9.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783080125; cv=none;
        d=google.com; s=arc-20260327;
        b=Zi7wyfp39z0S/sIGXCoLtDhZBSM6rjS9FeLroVhWg0/VHBn58k7bvnYwlEWHrvXDMQ
         QyemcLQ5t2r9eu0hiUNlmFapFg9X5GA5QO1CWPoIaLOJVkVKfuhaO8SRm4dFdMYDdCFH
         wsHiA4bUPTCv51SjXq6UqPJJ1GvuUYis6MZ0bJn5WgYUoERtYf+htHDWcbKVCyC3X4FA
         smLP6/SrnLDgLzeK0iKsHIOV084mh3F0N+eihiWKfl4H3LsScmY1Qe3YyiediuAKozpW
         oo751rDmy6A+vjuk4yUAIRp2wcfX99NZYwHkeHscDsa0QM3QI/joYvlixwtmrodgErWw
         PgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bwDyQXTlq+/xEQtBMjWLe7Se3wIpqNvnPc/TahNVe6E=;
        fh=GwPoXXn8tppGBFG4FpDXVHfgZYL7gZ+slQi4mV+GpeA=;
        b=frPDo9pBKuGuUf5U6Ph6U5g0p6EDS7oDHwmJgiMboApVOeDGffmCQq8fMPF00iZR7w
         gnspnaI6vTTIVCx/sd0M7qBu04YQYvS3dxZYNtklfm0tk9Y2y+hrg3PLB+3aW/yBYtnP
         j/+lvccrfBi1GgK+lc/y6s21aUTsaHwO6WWRHFYgJpvKh8OCTYwpJ+AhzKFLFH/Rod3F
         ZeF/jC2Pl2EX0kXCYPPin7qa70eZdcdePJYkosxYh6DeN5Icut1xM9aaE19BRnJDGsd9
         ZuvlHRwTR8BDuZ4GOc9lhG5iEB4oid+Dr7KBEv8bJ+brRhLw+pNlmpF8KfpUbqgOCO0Y
         6EyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783080125; x=1783684925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwDyQXTlq+/xEQtBMjWLe7Se3wIpqNvnPc/TahNVe6E=;
        b=NiCBiH/B259yFSGcdjT8VNG0//8lIx2Pc/XyimGP5VOO7BCNS87B1afEhBGAeMy/pW
         Vo4yrXcZkxB0/WUUI9+lJVkJ6/4+mnVcbnsAFAWIwN4rZd4BU8jCIMfbRvwpsZMi6MQk
         2jyznnfB48dzIX50mHa3yb9f+kQIzWgwCgBc5ZlQLaG+Zl2537rT6TFT/B8TjHufM7KY
         W00DR6YY+h0f3Hsodp75bvTpcDmE5awDK/7NRxwlTiygl/WeVB167wKcKgNzt1a33eSb
         gnJ2D7mARXdI5dADc9iv2u2rE7AJ9SXgGjLej7S8d5nfKVubyKyj3nSUNQcAFvKHxE3n
         E+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783080125; x=1783684925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bwDyQXTlq+/xEQtBMjWLe7Se3wIpqNvnPc/TahNVe6E=;
        b=JhEuB90u0Kg7f4TEaMY53n81xh6njbI+Ic1LJAyI0CZetAtEqQ/TFu5f8EityCXBV/
         qinSeFoWNiM6JjEbU37oNGEqdcRelC7NJZ6syUIfz/VzPQuM1yKkYiYd7zWZxtssNzh2
         XUnzGWbP86qWuVl64ZkC3CrCp+9iU24yoo4naL4pmGMkIcBwLaRAggfN4S6XbvxOAVJ1
         La1GFxzGcAn9Eb+1DVYSn/ZZFaZH1HjAxuYmCsX5mMT8QCF8csjEkI/Z7DxvgrNzmJf0
         eEAsiFiq72/z+TeI7layFz54Zof+S/KTgARlf9Bw4fsz7DeUogLSswVA2xtiRJA6v08F
         pUSg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZSVWFa+8/SyZXTwvAbyS4sArrBiqtElEzr7fDQ7y6CFhIsWwacGqbTTKM2lL4X9Bj+L6BkdRXxl/h@vger.kernel.org
X-Gm-Message-State: AOJu0YxLbRq7AF4RYTZHYApDL0omHX/Si3l32A+19ZNNY6wQnhUTOoN2
	4hkFRj3J+yJeb8zcLBOS2sNgU6yhT+iVtwNZ4PbqTMAjRUbPh26ae3rxGzm/mk/2dG6g+a4nW1X
	Ccj9BhG2iziorOnX8mjl5lAPtXPUDy/daR99FozfxeA==
X-Gm-Gg: AfdE7cmXCW23qSiZHpFKkR7dEVRWs1m6Uux+MlOb388vKPhMWgkZ5JzpyTr1qGGIkGj
	6ezpGETIZzI4rglz/rh1Bdp9JXX1pz0Y/D74KRm7kFWm2kgDy29+97hQ997AVpH4k405+wrcqTg
	vBktVOQffRXgqoVBmOyxnfwIlOPUAfFk1h3nRAY4mBZwI0a7vwQLoWhD3i4VtHJKGU72EQRlOaO
	/Qb9gJoWB5BMBcyWE7tBmcbi8zmLq09AF/RVXd40EIp5XXjgXDWJDGMnMhWfaFS5geoAj+UBGFp
	9cFo8HRZ2rx0fQh477lVKYOhgYvWgsq+1CVT1jKnXLlNWRQNh+oGj4HvT2r4z4xGS2B5Trebg89
	yTIZQBet/pTg609nUgcJxN39KZg==
X-Received: by 2002:a05:600c:1988:b0:493:c84c:2b57 with SMTP id
 5b1f17b1804b1-493c84c2bf1mr66489165e9.29.1783080124943; Fri, 03 Jul 2026
 05:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
 <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>
 <2026070316-surgery-unneeded-bceb@gregkh> <138BCDE3F4A1D624+2488a822-cf77-4155-8492-b8a1c47d5589@linux.spacemit.com>
 <2026070300-submitter-humbly-833a@gregkh> <4A32964890BBF288+37eaa5a2-eaff-49c4-8501-2b02736f3584@linux.spacemit.com>
In-Reply-To: <4A32964890BBF288+37eaa5a2-eaff-49c4-8501-2b02736f3584@linux.spacemit.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Jul 2026 17:31:53 +0530
X-Gm-Features: AVVi8CcR6CoUoZAzLjAFLHFIn-Btp_hgZON7-FmGe_V0DS8PdhVFU56m1idXpx0
Message-ID: <CAAhSdy2sfwaBQVif_N_Gk3yMs+0kqO-_PsDTicSNZW_Pez6Lbg@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] rvtrace: Initial implementation of driver framework
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, anup.patel@oss.qualcomm.com, 
	adrian.hunter@intel.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, atish.patra@linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, irogers@google.com, jolsa@kernel.org, 
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, mark.rutland@arm.com, 
	mayuresh.chitale@oss.qualcomm.com, mchitale@gmail.com, mingo@redhat.com, 
	namhyung@kernel.org, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	robh@kernel.org, sunilvl@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 2:31=E2=80=AFPM Zane Leung <liangzhen@linux.spacemit=
.com> wrote:
>
>
> On 7/3/2026 3:41 PM, Greg KH wrote:
> > On Fri, Jul 03, 2026 at 03:32:50PM +0800, Zane Leung wrote:
> >> On 7/3/2026 1:41 PM, Greg KH wrote:
> >>> On Thu, Jul 02, 2026 at 04:19:53PM +0800, Zane Leung wrote:
> >>>> Hi,
> >>>>
> >>>> Based on the current framework, I am concerned about how to support =
RISC-V ATB and reuse the Coresight component (ETB/tmc/TPIU) in the future.
> >>> That is very vague.  Please provide specific examples.
> >> According to the /trace control interface/ [1] spec: "The ATB Bridge a=
llows sending RISC-V trace to Arm CoreSight
> >>
> >> infrastructure (instead of RISC-V compliant sink defined in this docum=
ent) as an ATB initiator. ATB Bridge is not
> >>
> >> needed for RISC-V only systems."
> >>
> >> For ATB Bridge, read trace using Coresight components (ETB/TMC/TPIU), =
 so we need also ARM coresight driver in
> >> RISC-V trace systems. Current framework seems to only be applicable to=
 RISC-V only systems, and does not support
> >> ATB and  ARM coresight use case like the K3 (K3 SoC contains RISC-V En=
coder, Funnel, ATB, CoreSight Funnel, and
> >>
> >> CoreSight TMC components). For more discussion, please refer to [2].
> >>
> >>
> >> [1]: https://docs.riscv.org/reference/trace-control-interface/v1.0/tci=
_system_overview.html#atb-bridge
> >> [2]: https://lore.kernel.org/all/20260414034153.3272485-1-liangzhen@li=
nux.spacemit.com/
> > So, what specifically does this mean?  Please provide review comments
> > for the code itself.
>
> The issue I pointed out is not about specific lines of code, but about th=
e entire Riscv trace driver registration and building a path from source ->
> sink did not take into account the application of arm_comesight. the curr=
ent patch set assumes a rigid, homogeneous RISC-V-only topology.
>
> Specifically, if we have ARM coresight components, how can we reuse them =
like, funnel (drivers/hwtracing/coresight/coresight-funnel.c) ,
>
> TMC (drivers/hwtracing/coresight/coresight-funnel.c) , TPIU (drivers/hwtr=
acing/coresight/coresight-tpiu.c) and so on based on the current
>
> framework.
>
>
> >
> > We write code for stuff we have now, today.  If future needs change, we
> > change the code to handle that then.
>
> I believe that if the basic framework for RISC-V does not consider compat=
ibility with ARM Coresight, once the framework is fixed, there will be grea=
ter resistance to future modifications.
>
> > The only problem is with user/kernel apis, those need to be nailed down
> > so that they don't change.  I can't tell here if you are only referring
> > to the in-kernel stuff, or user/kernel apis, sorry.
> >
> > thanks,
> >
> > greg k-h
>
>
> I believe that RISC-V tracing is coresight-alike, where have encoders/fun=
nel/sink/bridge+coresight_comp.

I think you are over simplifying the comparison. At high-level only
the topology of components is similar between RISC-V and ARM but the
individual components have greater architecture influnce. In fact, we
upcoming RISC-V self-hosted trace under development where both encoder
and ramsink are programmed via CPU CSRs.

The only thing which can be shared is a common trace framework (which
is very small part of this series) but the component drivers, driver
probing, perf driver etc will be highly architecture specific.

> I think we should abstract some of CoreSight's core logic so that it can =
Both coresight and rvtrace can be reused.
> General logic for building paths from source -> Sink and perf_pmu should =
be universal in coresight/rvtrace and

My suggestion is to take current rvtrace framework (which is minimal
enough) and create a simple "gtrace" framework (aka generic trace
driver framework) which can be enabled by multiple architectures. The
RISC-V trace drivers can be the first ones to adopt this "gtrace"
framework. As separate series, the ARM coresight component drivers
gradually updated to support "gtrace" framework. This way only
required stuff will be shared will be brought under the common
"gtrace" framework.

I will update this series as-per above suggestion if there is no objection.

Regards,
Anup
