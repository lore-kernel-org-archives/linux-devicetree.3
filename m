Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094B38758C
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790318603; cv=pass; b=MABVVOSSyom+c2ch/RkAi6etT42SA1hDB/P+3yjj0mM067SP786u+HukDPVi2g8XvnKS70Zm+bCHON5stdrPyL1JhzZEOG6SD2IGLshb9lt1iJTqbEx3kOtDiFPHVPGG3rPzDo8gJhMz9wb6c/GY/YMDS9+/txh2CJLIb9rk8FM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790318603; c=relaxed/simple;
	bh=qT0MFd176BYrXuQDaeaSPtSk6fF2oBF9InGKPMdZ6cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbbDCDIW2P39NVxbSplqC1vJ1ogy2dQDZRL/Tz6MwTNUzccLdh59w4ZaZsqnj8Q9ZGgbgI+HILgHBV+v6gvC7VNs+xtLGsejzJIPkt3NIK6vNrGrqSfcgwfPKNoNluzDE4sYHByhf8SKMXs9Jbvpenb5oYmsTO+G1A0CDPIwiwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f21oXaGA; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f21oXaGA"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a64e7f48e0so2715441fa.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790318599; cv=none;
        d=google.com; s=arc-20260327;
        b=Dcf+5ydjamBwBlOJ/P+83g7AynC1DTm1awmNUruhPZ+ebu1jtHt3qoP74XjH/iQ2+M
         PRQGbe7LD4zO6i422dkyd/mr4W8ariTVQHoYs7iZohXpEDLqLYRIJ46Z4BYuCH1Wds2W
         E6I0//NuIxAXw6Qw4trC6HI8PfIJkFVxvHtdIQIQoFuCjYuauwJh35GANbsJT+/ZYHMJ
         bOghFhkb+b4aIO9mRTG8a6WGdIt1tpe5+X3SSl4DFtcviPs5tkuhel5H3TmoqhCZI9/y
         lmWi3yCNbv6ZQsqK8YmdVWlQ9gYxDplMzRCVy5jP3J/BheO8gPY6Q5PlaGNZEmnUo5G6
         F0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=73oLTu7jCnqlLzTg5ExaWSXRUj31YyCrfn3RnTCN//A=;
        fh=HGUQLw8g3HbZ8bxVtX2dFpadKDZ2aTxdQ91gKbUELuo=;
        b=YBq0FD4PUXxE32TfUnRqSZT6tGr5g1N449INl5OvYZpFrcUnXojJjAp2TtXz3GqFV9
         L0EtdwoAQbyHZ6vB8lASr4Av0+I+26LeFUg+819hXt8i/PHFirLfdaj6jNf3ALT7Exf/
         HLwwU9W+YijgUVQC1K7seI7nm6HuXjh7pOlJVz+R4hzOsqX0KhhD5Hw+CnaYvPMCkq/Y
         xk/otgEvcvVvyv1kBZeKZw+ZmLeekAr/6QJnaCnDiL/+d6X3D+k16rgfUmRKqVMCHAHr
         yfn6RBpjjSP7JpU/+DED1riVWPqIkppR4zs8ml5xbvQErtXkH34HqHDdiF2CJHgS/WUF
         m5Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790318599; x=1790923399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=73oLTu7jCnqlLzTg5ExaWSXRUj31YyCrfn3RnTCN//A=;
        b=f21oXaGAmwkdA1ElT5Ql0b82KFg4o2oMHEBraDYAEpvFDOefls3aJHTVsKmYiI08ph
         cYlvsNVcWVkz6Bvp340Zt3bfeK7kDYEFI9RisqfuKA+E7+GCyZY/r9qpqZ6PXxp/74If
         76C2E0qdkwIXbw72Syp4D7Rkcofu6/uYBJKPMDhRu4BqEtCw/smfaIklQB+ox0j7g43T
         tB6kYaqaS5TmxJQLCI1UN6LPilS1pdo0ceP8WT+zd+E3ki5Y0r9pteCQCa/fE+AoDjkH
         OiBitWpjaANZYVBtTBvo3VTuXQwxXoTWtm54wOkQ0gI3SFj1YSC53EeOwxiW4dktnAht
         8QXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790318599; x=1790923399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73oLTu7jCnqlLzTg5ExaWSXRUj31YyCrfn3RnTCN//A=;
        b=wZvpeLyKX+EP4l/FwVuDNCkYaptoHpvvvDy9kNsfJhDC/nTMxUI1TzYSx0OuBe/Aax
         /9qSZ+eE3aY1LYP8dV2a0wec5SqZ/zb0GEiKGVMXVZCJ6T7B0KHDX+hPIDO1fxB8m/mg
         MTXxuLwKDW7IYXoSSqZyAcIAgOXXIv8fsBJ36t+E7J/lcUZxAiFMzwk9/qKYToAsZJX3
         WWhYLqTwfGI1eb6YlkccDFldjojP4Se4VKnt5H36BuBH+n3O8T9qtSzS57yMYo0LkgD2
         vG8sXbsQCRqwpYkMzbyWj95A+nSPaak5Puo2yTC12uINfEe75uTe6+HrIp2T6p/UR1ix
         Wnig==
X-Forwarded-Encrypted: i=1; AKwUvByKSob+TmXhtHOXBfrCeY5RHg+WYO9XBqYYGDQR0JstX95BrFlZDfAQc6ux4d4/1HrDkvK25BJ050aG@vger.kernel.org
X-Gm-Message-State: AFuF++n3mj7Zi/v94BB1vnTieV+6sJAF2vAOUTbuKF2zwhptG1oeLEAw
	m6e2SaBR+aYz8G1L9K6VwayTxw7qs69P85rnAZBqq2ik6gZ/yZfF5EYiPPcTqk+ddbMm3uLzJOL
	QWVQc2FDl6Wv63QS7uepwfQZDmuB252U=
X-Gm-Gg: AYBFou28QKDZyis9q7X6p6tgS/f6osg9M1Zy5B1iwxguP/atTrJzimI7HBX682ZzzbI
	IXTlSe4PTuz7CCPl6+9tI5AuVG34Ytkrn7/CFxGgfNo93qn4kxR0ior/XkOtAPScJyD/OE0RMHo
	evbpviS7coH3uXHUF4B8COWz++wzc1hgWoa+SUTUnVNKiGE/RnbJRmhjIoF6pWbkYkNQcR7kv2R
	e3ZEeXUCWjei46PvDgwXQl8T8/iqgA+DDvMZx4pJjI7jM5SUVwUMV8pe5L4N8qja+HvSdT2BUw7
	XjjoLAclkOJSCHzFyWNcz1QspFgDKUotXil2gGvRmNlESHKpZ/+jCaJbO+3yMnT9lh1Uofm/WbV
	FDb9gjNPhjjHInXVXB3z/vYBkWM+AfR9X5gU8ntMEBO2XYGUxjnSScA==
X-Received: by 2002:a2e:b893:0:b0:3a5:f044:fcba with SMTP id
 38308e7fff4ca-3a63c0f6f99mr11331361fa.20.1790318599360; Thu, 24 Sep 2026
 23:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
 <eddd77cc-fabc-4a2e-aff9-602895495ad1@oss.qualcomm.com> <CALHNRZ-J6DH1ebhUcRqbVRmStO_MGBJr63TEQg5vxNO_UpF-vQ@mail.gmail.com>
 <36dce215-8266-434b-968c-b68d7ac1ff2f@oss.qualcomm.com> <CALHNRZ8UGRzr48RaTufn_CXq0si1_uwYQSnbX+8YAtf3=d04YA@mail.gmail.com>
In-Reply-To: <CALHNRZ8UGRzr48RaTufn_CXq0si1_uwYQSnbX+8YAtf3=d04YA@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 01:43:07 -0500
X-Gm-Features: AclHuK8hFndtmQNtvynjaSVQTF7UEYz0rQLDWaAywywoMi1VKc4BOSKxgrXEbsM
Message-ID: <CALHNRZ-JtxOft6GVvb=fgZf7YVLTx2n5wf9t=BJ4KdoeCefX2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: add cpu OPP table with DDR and
 LLCC bandwidths
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 3:32=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Thu, Jun 25, 2026 at 7:23=E2=80=AFAM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> >
> >
> > On 18-Jun-26 06:37, Aaron Kling wrote:
> > > On Wed, Jun 17, 2026 at 5:41=E2=80=AFAM Konrad Dybcio
> > > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >>
> > >> On 6/6/26 12:36 AM, Aaron Kling via B4 Relay wrote:
> > >>> From: Aaron Kling <webgeek1234@gmail.com>
> > >>>
> > >>> Add the OPP tables for each CPU cluster (cpu0-1-2-3-4-5 & cpu6-7) t=
o
> > >>> permit scaling the Last Level Cache Controller (LLCC) and DDR frequ=
ency
> > >>> by aggregating bandwidth requests of all CPU core with reference to=
 the
> > >>> current OPP they are configured in by the hardware.
> > >>>
> > >>> The effect is proper caches & DDR frequency scaling when CPU cores
> > >>> change frequency.
> > >>>
> > >>> The OPP tables were built using the downstream memlat ddr & llcc ta=
bles
> > >>> for each cluster types with the actual cpufreq LUT tables from runn=
ing a
> > >>> CQ8725S device.
> > >>>
> > >>> Also add the interconnect entry for each cpu, with 2 different path=
s:
> > >>> - CPU to Last Level Cache Controller (LLCC)
> > >>> - Last Level Cache Controller (LLCC) to DDR
> > >>>
> > >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > >>> ---
> > >>> arm64: dts: qcom: sm8750: add cpu OPP table with DDR and LLCC bandw=
idths
> > >>> ---
> > >>
> > >> [...]
> > >>
> > >>> +     cpu6_opp_table: opp-table-cpu6 {
> > >>> +             compatible =3D "operating-points-v2";
> > >>> +             opp-shared;
> > >>> +
> > >>> +             opp-1017600000 {
> > >>> +                     opp-hz =3D /bits/ 64 <1017600000>;
> > >>> +                     opp-peak-kBps =3D <(1353000 * 16) (350000 * 4=
)>;
> > >>
> > >> I think this should be * 4 in both cases since the interconnect driv=
er
> > >> ignores the channel count for a node in peak voting. We may have a b=
ug
> > >> in all other DTs here.
> > >
> > > If this is confirmed, I can update this patch. I based the
> > > calculations on my sm8550 copy of this change, which in turn was base=
d
> > > on the sm8650 change. If this is wrong, that means one piece is
> > > scaling 4x too quickly? Making it a power consumption issue, not a
> > > performance issue.
> > >
> > >> BTW, are there no lower OPPs for the fast cores?
> > >
> > > Not on cq8725s at least. These lists came from an AYN Odin 3 with tha=
t
> > > soc. I don't have any sm8750 proper devices to see if that's any
> > > different.
> >
> > Mobile SM8750:
> >
> > root@qcom-armv8a:~# cat /sys/bus/cpu/devices/cpu6/cpufreq/scaling_avail=
able_frequencies
> > 1017600 1209600 1401600 1689600 1958400 2246400 2438400 2649600 2841600=
 3072000 3283200 3513600 3840000 4089600
> >
> > root@qcom-armv8a:~# cat /sys/bus/cpu/devices/cpu0/cpufreq/scaling_avail=
able_frequencies
> > 384000 556800 748800 960000 1152000 1363200 1555200 1785600 1996800 222=
7200 2400000 2745600 2918400 3072000 3321600 3532800
> >
> > root@qcom-armv8a:~# grep ^ /sys/bus/soc/devices/soc0/*
> > /sys/bus/soc/devices/soc0/family:Snapdragon
> > /sys/bus/soc/devices/soc0/machine:SM8750
> > /sys/bus/soc/devices/soc0/revision:2.0
> > /sys/bus/soc/devices/soc0/serial_number:<snip>
> > /sys/bus/soc/devices/soc0/soc_id:618
>
> This list matches cq8725s and what I put in the commit. Is there
> anything I need to change for this patch to move forward?

This patch has been sitting for quite a while with no negative
feedback. Could it please get picked up?

Aaron
