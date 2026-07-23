Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC6F41A914
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784838744; cv=pass; b=PNQlk2Y/QooGya3HztfWvHepSD+WoROMNYpIu8kkiASn4Ybmfr3SLk9VIrafIlpzbOVQr7KQhmEFFPBlaADdv8xLSVE9o463qLr8uRhvAo8OLE626BuR0fX7EqqnazHw0JpLsI0k9nzo0k4phJHhwr6D/1tnRrnaHX1p5K8Q40k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784838744; c=relaxed/simple;
	bh=eOeG508aHYWbK3Xr1C6Yqd9VRDdwIhi0pqvtGII3tDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YU1YSZkiGNvKDChum7Gm7bYQ8GlQSFczMzWJyMwZVM/T42bqmmoYQrIdYD+m8moh5Hnd1WX5IS4gFx0CWV205cuV76mGZnWXLLGIvjumVuonh2fAwgRZghwyfkzniYQ7QZUlyNI7b7LWeJgTCpX30lOiumAWihXoPdIGw0YzeY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGaE4apA; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGaE4apA"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c953950dfso8724091fa.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784838734; cv=none;
        d=google.com; s=arc-20260327;
        b=YzaSdXTfMJgE23bbzrUgXBDo9PvsXq4Kx6GyZetksCJdgSfMk2qdwC4gb1ff8DZET3
         V00MVXleUh+eIDBa2qsLkhMu6H5BaJnQ1p+T+d0/JtClDdC8AhmtlJNqKtWcV/oeWr7r
         zJ2O4EfmgOote2rIhhez+ffroTADe48tlTjTS+rGK0N8qGBxCSr0Y5Pl5Ot80TzK0iia
         Y5C56sjq48YfOm+fLXoD2jG74B6JymTYCG3+58n9u8cn9fpJNIXwLoLFyofqw6OwQE4C
         u9Z0CaFdHuJHYcEL9uXz/uUgL3czFjS0xY5JWeOFN/zcQv1wP/P2LVyJrhrrAe+0fVjf
         At8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bx5sWJxftrQrtfDayKdIgeqeQp/vyw6I8VLok6K1+O8=;
        fh=9kMZVJbMcXqxRZtvHgXBTK7H/rM9FL6RWXGp08zIEeU=;
        b=XUNmDsKTGVBVuqHfCCCQF3F1y+0f8ex6+bC9LHdMl/vCZeQEHuK0dnPoZuIJEAG+CH
         LAMfrnBeXsEGhT+Nf/mcB1sMnb/ahBrRJFuEbHNLEjVUH8FKbvkw1aZDi8OYaxAUlhDu
         m5zj2KrCE2YmgPzrrSEJrgtY/o7baGNyP6G8pjuD3fQQZIRUl3kSUzEqmpHKg4U2DdWc
         2w/vd2tMWl2iN6Z7stf74KczzFB0uq8yjtNpkAQJ7eBw+uep7v3gnWiceuUI5AQpISa9
         7SlsnyblUcIThhLk7U3jtuoH7QxaGr9yAE1eSd6pT3McrsUHjd1BgoGEgzxGv7VDFO14
         oVvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784838734; x=1785443534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bx5sWJxftrQrtfDayKdIgeqeQp/vyw6I8VLok6K1+O8=;
        b=nGaE4apAlR17tof1nOM3xAecTRFRRa6z0ZdUNVhgrykaqUqXoCHRXg03lJKp/24wvE
         62yf3QcY18iBdn6QFSYccPJq2OcjQI9cO47GsLOEQvUI6CHdksDF7LsCwWtSDoI7xDZ+
         MC9QySnpIYY40tcSev8DJlVRPF5MGR6jV4Okr0vINbV2ev+kHbOw9O6fPLvz7Grs0RbG
         KXgpEtx4KW+UMaG0cpjEWilFK+tmVWwdu1OHhPHbQGYciN29y4VlKJddzc5svpYnEG53
         tBbBGevdhRf2TlOb+IjpLF7l0uz7zTwh1q4CnlGeTfIGr6r5SoSH8HO87Kc5WSKsr9db
         B9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784838734; x=1785443534;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bx5sWJxftrQrtfDayKdIgeqeQp/vyw6I8VLok6K1+O8=;
        b=c2wTpcYXsB3PEEUcyt+ZrtiDXOyS7PMZ1eGOFVoXVzPcMvoET2/oXJVBUoDdAx3mh+
         SmHzjPy7zz2gpnjf4cJpMUq5yFhzZSoVlhPmvqv0rDYH7FHEH99WcltcrddkFJAL+Sx2
         qWR7VAYy7tjrxwnrnZ46Q1MGTRSwT655LlkTlzV13jxOdyxgAAErvpMg4OUjYSxPmSVR
         JwIq/eITZSSOdMZ6qROlNWq88JheEYfvGl2OCOw7RTqCYuup5Gt/snyS2U4fmyWQlWNp
         WIMqsrUJP2qoeDUZYjPd2zRHp5rYKET8PqRljY/7+aigYENpqmfsDe595xSamFeAiewV
         vW5w==
X-Forwarded-Encrypted: i=1; AHgh+RrnEQqAbB1qJK6iHh/CN1zv2JGVX/M1TMoxw1qyFJjBc8X864A5NCZhX5WI/6foS9697f9UW7vQ4CPV@vger.kernel.org
X-Gm-Message-State: AOJu0Yywq6T4GExHrLCuJ7zcXvxbgsRlhAk/MGlRvkkAw1NvdIaphp6p
	fW4C7L9bc7sCX8qvPfWPQDDPMU5967ELSocYS6NAPI2gbIkaUxXlFQSvcR/NkMFWUfd+GtW49WM
	vxe5ypX0xnIem6tezcv5vM193MrFHwNk=
X-Gm-Gg: AR+sD12PTGTXn3h4GzqdWo1pR+55FpJGILoIP635DpSVyJfWFBAJip/0ZjQTsqhpyx2
	H2XCfjizrKmP974u/dV8Xa3DibWtV2E/18p5il1jjT+2KSp80otOwhQ+N+e+oyqdoINPzRMPA37
	aBj1s2+btKpAqziGSaNGfoJlxmPkWNxdC/8/bdRSsc4Y+8LEUQywhM/9u1uGsBeWQBnyZ3bnBpH
	/CR8g2XbMdkUFrUqPmhuqz+5er4PhavHZpMWyRqfCFqSAINg7V9Oajv1/W5++tpLDQf7vGCHa5n
	1MDuA1UVvTFAoRiYs7RdZT0kgHvl2Mw2+u2gGbzSwyrQkII=
X-Received: by 2002:a2e:a012:0:10b0:39c:6e84:99be with SMTP id
 38308e7fff4ca-39f07e9ed4emr8044241fa.21.1784838733792; Thu, 23 Jul 2026
 13:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
 <eddd77cc-fabc-4a2e-aff9-602895495ad1@oss.qualcomm.com> <CALHNRZ-J6DH1ebhUcRqbVRmStO_MGBJr63TEQg5vxNO_UpF-vQ@mail.gmail.com>
 <36dce215-8266-434b-968c-b68d7ac1ff2f@oss.qualcomm.com>
In-Reply-To: <36dce215-8266-434b-968c-b68d7ac1ff2f@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 23 Jul 2026 15:32:02 -0500
X-Gm-Features: AUfX_mwYG4-fJOSair7gb32GVL9MppZtqgrzCpxFkOHUTppKBL2CYuJQ4JilW28
Message-ID: <CALHNRZ8UGRzr48RaTufn_CXq0si1_uwYQSnbX+8YAtf3=d04YA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: add cpu OPP table with DDR and
 LLCC bandwidths
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 7:23=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
>
> On 18-Jun-26 06:37, Aaron Kling wrote:
> > On Wed, Jun 17, 2026 at 5:41=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/6/26 12:36 AM, Aaron Kling via B4 Relay wrote:
> >>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>
> >>> Add the OPP tables for each CPU cluster (cpu0-1-2-3-4-5 & cpu6-7) to
> >>> permit scaling the Last Level Cache Controller (LLCC) and DDR frequen=
cy
> >>> by aggregating bandwidth requests of all CPU core with reference to t=
he
> >>> current OPP they are configured in by the hardware.
> >>>
> >>> The effect is proper caches & DDR frequency scaling when CPU cores
> >>> change frequency.
> >>>
> >>> The OPP tables were built using the downstream memlat ddr & llcc tabl=
es
> >>> for each cluster types with the actual cpufreq LUT tables from runnin=
g a
> >>> CQ8725S device.
> >>>
> >>> Also add the interconnect entry for each cpu, with 2 different paths:
> >>> - CPU to Last Level Cache Controller (LLCC)
> >>> - Last Level Cache Controller (LLCC) to DDR
> >>>
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
> >>> arm64: dts: qcom: sm8750: add cpu OPP table with DDR and LLCC bandwid=
ths
> >>> ---
> >>
> >> [...]
> >>
> >>> +     cpu6_opp_table: opp-table-cpu6 {
> >>> +             compatible =3D "operating-points-v2";
> >>> +             opp-shared;
> >>> +
> >>> +             opp-1017600000 {
> >>> +                     opp-hz =3D /bits/ 64 <1017600000>;
> >>> +                     opp-peak-kBps =3D <(1353000 * 16) (350000 * 4)>=
;
> >>
> >> I think this should be * 4 in both cases since the interconnect driver
> >> ignores the channel count for a node in peak voting. We may have a bug
> >> in all other DTs here.
> >
> > If this is confirmed, I can update this patch. I based the
> > calculations on my sm8550 copy of this change, which in turn was based
> > on the sm8650 change. If this is wrong, that means one piece is
> > scaling 4x too quickly? Making it a power consumption issue, not a
> > performance issue.
> >
> >> BTW, are there no lower OPPs for the fast cores?
> >
> > Not on cq8725s at least. These lists came from an AYN Odin 3 with that
> > soc. I don't have any sm8750 proper devices to see if that's any
> > different.
>
> Mobile SM8750:
>
> root@qcom-armv8a:~# cat /sys/bus/cpu/devices/cpu6/cpufreq/scaling_availab=
le_frequencies
> 1017600 1209600 1401600 1689600 1958400 2246400 2438400 2649600 2841600 3=
072000 3283200 3513600 3840000 4089600
>
> root@qcom-armv8a:~# cat /sys/bus/cpu/devices/cpu0/cpufreq/scaling_availab=
le_frequencies
> 384000 556800 748800 960000 1152000 1363200 1555200 1785600 1996800 22272=
00 2400000 2745600 2918400 3072000 3321600 3532800
>
> root@qcom-armv8a:~# grep ^ /sys/bus/soc/devices/soc0/*
> /sys/bus/soc/devices/soc0/family:Snapdragon
> /sys/bus/soc/devices/soc0/machine:SM8750
> /sys/bus/soc/devices/soc0/revision:2.0
> /sys/bus/soc/devices/soc0/serial_number:<snip>
> /sys/bus/soc/devices/soc0/soc_id:618

This list matches cq8725s and what I put in the commit. Is there
anything I need to change for this patch to move forward?

Aaron
