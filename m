Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846696;
	b=UgfC+6tLvhtpzIqQapP7UCySZHbEPUxEKl++32/yzw6Pu8xxVJNJMYzh1Y2GHHsFYrzE
	 Eo7tRsYDXakm100bZXRaDSrMfKG1Y7Rb1yde5F7Izi3u2EbX3WWJSZ6SnNAPbz8UysPrL
	 jqWpj7klvuTsf2fyVAKJC15SldaDWmmWxwN5l1+mHFp5c5UZUmfZ9NawIbh3vqHD7HTUc
	 J/dQSD9gEFcz57yGyhquAKA3qW8flRS70zVmwKRxW0RA9CYEnYXRRRpO6NBqyYU8TCreR
	 yMSPMLkoumad3cXF8tlIJuy5NBtpBE2vvdtOP/FibBI02O6qWW0Hxr3d5MzsWRJHPGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=RGmDTpXlmeRKF3X1XvVcrYHV2kv2B7zOq1c5EiYOh2I=;
	b=vXbAg5eMoqribhAkUiVXsf272fAzv53dWiG3oiyM16hj5fQ0M1KfAwgHiJ6cDcXDApdV
	 xyqeMrpPw0lDLKmZKJ0RE9FSpjZHef38zXp0RoCl0b/7MZCtegKywkOek2ruR2Vdcs/3x
	 nfWC9JxSKmlCH5fe4/VNW4mMRuJObhvvOd0tF29sDjuLUUG4//XHJJACeVxRPVExPLsJD
	 +XRtM7Er9jm1qgmHnxxpjsVnIcnhhBTrEOMuCoc3WqTiTvdgiZFO3efd1Bikc8FUW6DVA
	 NGn2KINiw9x9v25YBiMO11xImkQw88S5hY+rMPYER96a0QpGJ3mjuhkwGm89kdyKEuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EEvBKJ1r;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AC4606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 16:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16AC4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EEvBKJ1r
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so9742235e9.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794846694; x=1795451494; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RGmDTpXlmeRKF3X1XvVcrYHV2kv2B7zOq1c5EiYOh2I=;
        b=EEvBKJ1rFfBy+1dRTF2Mv5NGPK7F2WYjuh/Zyb+oEqRcWF0/WVJ9xmDiJIQLcC2bjB
         W3OZGnemxf1txBh/fC0zSljE+2CV3BCYPwK3CsmbULLyI7dddfmqTS5200TuHxSVJfc9
         qSJG3m7YaeB+9o1Psx7mhYVP09HUDmPwl7yTB2yvGX6HxGYh8QkB1TTyYAnV5wIhuEj7
         34gfp4+FhfD3pYKnLIlmaNgBhPTv+7y5DJ5cJAzWGRvsDU5W64h/EhQVja0br7w45gJA
         l4MSDBsLGFlPb+fpOMdx+uOJknwZdoDWcfr3Q+d8IKz+scHslJd+0uf+qKbrPNbeH1uJ
         dYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846694; x=1795451494;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGmDTpXlmeRKF3X1XvVcrYHV2kv2B7zOq1c5EiYOh2I=;
        b=DKThQY9YaP7XvI3VzaNxpMfFfYZ6rfATUMEQjFJJPFeHH+bGBIItlj2FeVGY8YGl8u
         P1/B5VjzdLMbGTVAHyYg6r5N1c5avcMjmv/TkUbmDlxfaSA2F46gbPAz2c1HaJENBReM
         H0BNGFKmu5BfE/Gv8rUK0yEt9RmDiqfyqa5ufQogKZ2yRHaQdUugWuKBDFEY0qeRqxgw
         zXzUDIm/FNhdca+X7EgL4EI3MUtmLypfzRVNq8+1aXdzptiHd3xRtYWIyJerKz3a0PT7
         eiI9ZvcmtqOHDhAtg4jmO6w7eiyZc3WNYzWjBYE2r8X6BuFT48lu3IfZzJ/z2ZtBzQgP
         17Tw==
X-Forwarded-Encrypted: i=1; AL+hErF31RqaT0HKyY06vtQ2sv2vYiruGTHhbeYjOcm2/F2Aq5rRIZRCJXo03JfI2VdagCnyT5DQkg3FrlWp@vger.kernel.org
X-Gm-Message-State: APuU4Z+iaJikguz54y/s/mnRI9lbJthaangUvfrrmKSfLZw5enUdhb5v
	5ECgqe6IE5PT1fuC6ONXkFHktrVqj8GK8kkuNawXr46s8/CMMNGOZ9G3pYLgwB0C56U=
X-Gm-Gg: AYBFou2OwEAzFUdoCL4xcqCRqVf2Q81Acmarz3GfKMo5areDurX3h+S7QoNHVCRT+Qp
	yFh3FZCk1VE2x60Fy1nHE6XaqLGwC7fFwyyOq7BQnuJoRkmVUNyKGFPPal+ldjc/kcZbSVBRXJo
	6ip3j9yx/jkilwqGII4tcr9M+WhK+6QITpYXM3rvs0EXdp8XmQ02MHnchADU5Ia0laC9P0+ZGB+
	PmyB7zRyK5mGz0R/k+6cXtjLBt6vqNjiJ3lMi2t7MsG/LpUWeUV+ihqTdvlyK9esLgEG56zvt5V
	mvTlwZU/k/mh3SzeyFO1llhOys0cuGFYqXUhQ7hLeWZ+B5L+uejxk0ffHVIXrzwfa0Pjirfpp/a
	WmicVCwr/s4k0hC54lbis08HApEXAyRJcVl5mQWP+arYljizlm5mu6Do3mF+SstEM7de2+4BsiM
	U6cLs+KeSUNlTqfn3M0f5CyRJGHnJKYyThXzT7e+12cLruWh5u7oxgL7Nln6vNDIAwrh1SdjVO7
	wsxeGlqeCyBfWIsww+/pgJK76p0OCm4kpbK4V9qA+8fuhpiHTN/AoT4Jg45TSuULwiLMPowuH5x
	XEs2P5gOQgyWNwFixd6dQTzF2px8mlse4galb9eaDV3WOCwaAVsUG+NmW5PU09HtStehxqqFryH
	wfe+4PInzO+pPB2eWFHE=
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb55a5de41mr233741175e9.21.1794846694305;
        Mon, 16 Nov 2026 08:31:34 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:bb28:8e5a:f94b:4332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78385508sm242715e9.3.2026.11.16.08.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 08:31:32 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 16:31:30 +0000
Message-Id: <DMWS1URVNP4I.99T9QR6VWAUW@linaro.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Thomas Turner"
 <tturner@lineageos.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Juan Yescas" <jyescas@google.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org> <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org> <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org> <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org> <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org> <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org> <CADrjBPq79Dn5pv-2wdcG5b9rNb4NHatzGGZMrfAkF1L0ZD1mHQ@mail.gmail.com>
In-Reply-To: <CADrjBPq79Dn5pv-2wdcG5b9rNb4NHatzGGZMrfAkF1L0ZD1mHQ@mail.gmail.com>

Hi Peter,

On Fri Nov 13, 2026 at 4:46 PM GMT, Peter Griffin wrote:
> Hi Alexey,
>
>> >> Eventually to have some sensible/working ->recalc_rate() for ACPM
>> >> cpucl{0,1} clocks.
>> >>
>> >> Which is needed, for instance, for cpufreq_dt because it registers wi=
th:
>> >>
>> >> static struct cpufreq_driver dt_cpufreq_driver =3D {
>> >>         .flags =3D CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>> >>                  CPUFREQ_IS_COOLING_DEV,
>> >>
>> >> Don't know if it answers the question (if I understood it correctly)?
>> >>
>> >
>> > Thanks, Alexey. I see now that clk-acpm.c uses pdata.fw_name on the
>> > parent (acpm_ipc) DT node to link the ACPM clocks to the CMU PLLs for
>> > ->recalc_rate(). Could you please clarify a few things in the commit
>> > message (and below):
>>
>> Thanks for the good questions. You hit the exact pain points we have bee=
n
>> debugging on hardware with cpufreq-dt and Panfrost devfreq.
>>
>> > 1. Physically, CLK_FOUT_CPUCL{0,1}_PLL are not input clocks feeding th=
e
>> >    APM hardware, they are the PLLs that ACPM reconfigures behind the
>> >    scenes. Meanwhile, acpm_clk_register() sets num_parents =3D 1 and
>> >    pdata.fw_name =3D name for all 9 clocks in exynos850_acpm_clks[].
>> >    Since the DT node only lists "cpucl0" and "cpucl1", won't the other
>> >    7 ACPM clocks (mif, int, g3d, aud, cam, disp, cp) remain permanentl=
y
>> >    orphaned in CCF with rate =3D 0?
>>
>> Correct. Is it a problem now since there are no "clients" or consumers o=
r
>> users of these clocks?
>>
>> Or do you suggest to link them all to parents clocks to have a sensible
>> rate?
>
> Since your implementation relies on CCF to get the clock rates I think
> you have two options:
> 1) Only register ACPM clocks that have a corresponding CCF implementation=
.
> 2) Add the missing CCF clocks for the ACPM clocks you are registerring

Well, if there are other suggestions to implement these clocks without
relying on clock framework, then feel free to share.

Current implementation does indeed registers all clocks from
exynos850_acpm_clks[] and the ones not listed in DT will have no
parents, no rates, with no_connection_id and no users+usage.

Since it seems to be a problem, okay I will fix it.

> Should CCF's ability to set the rate for these ACPM-managed clocks
> also be restricted? It seems undesirable to have two entities (Linux
> and ACPM) able to set the clock rate, with the possible exception of
> it being useful for debugging. These limitations should also be
> clearly mentioned in the commit message or cover letter.

Ideally yes.

>> > 2. Does bypass_acpm_exynos850_get_rate() actually return the updated r=
ate
>> >    after clk_set_rate()? When ACPM changes the PLL frequency via IPC,
>> >    CCF is unaware that the parent clock (fout_cpucl0_pll) changed in
>> >    hardware. Even with CLK_GET_RATE_NOCACHE on the ACPM clock,
>> >    __clk_recalc_rates() only reads the cached core->parent->rate witho=
ut
>> >    calling ->recalc_rate() on the parent itself. Won't parent_rate rem=
ain
>> >    stuck at the initial boot frequency?
>>
>> This was already asked and seems there are no answers. The problem with
>> stale rate is present.
>> https://lore.kernel.org/linux-samsung-soc/DLAZXSNZK6QC.1VFAX37XCXBOV@lin=
aro.org/
>
> The question was sent on September 9th, but the series adding support
> into ACPM was sent on September 15th
> (https://lore.kernel.org/lkml/20260915-exynos850-acpm-clk-v2-0-ffad4a6b3f=
b1@linaro.org/).
> The limitation about get_rate returning stale values should have been
> clearly stated in the cover letter or commit messages.

It is a fair point on documenting this in the commit message =E2=80=94
but the gravity of the problem and its consequences were understood quite
recently (you should be aware about that). At the time v2 was sent,
initial testing only exercised one-way rate transitions which appeared to
work, so the full impact of the stale rate wasn't apparent until more
detailed DVFS testing later on. The problems with stale rate were
initially discussed way before September.

>> Any suggestions?
>
> For the benefit of the ML, we discussed this topic off list. The
> consensus was to try and make CCF walk the clock tree, recalculating
> clock rates from the SFRs without using any cached values (as ACPM
> could have changed the SFRs of PLLs, dividers, etc., behind Linux's
> back).
>
> That should in theory mean that clk_summary will always report the
> correct clock rates for everything in the clock tree and we won't
> report (or make decisions) based on stale values.

I'll re-implement and re-send.

>> > 3. In drivers/clk/samsung/clk-exynos850.c, cpucl0_cmu_info and
>> >    cpucl1_cmu_info still set `.manual_plls =3D true`.
>> >    Does that conflict with ACPM firmware managing the CPU PLLs?
>>
>> I don't know yet what to do with that. I didn't encounter any problems
>> yet because of this. Is it related to early initialisation only?
>> I thought that exynos CMU driver doesn't touch PLL clocks after init.
>
> You should check this with downstream sources and the TRM.

Erm, I don't think this question relates to downstream unless I am
missing something.

BR,
Alexey.
