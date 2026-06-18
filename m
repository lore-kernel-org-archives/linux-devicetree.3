Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743A4368275
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 04:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781757435; cv=pass; b=tC1CXg/6omXYlzi+HxVvSqjewSGenzqrUWClxYWAHcfrq5JqmArTkxzfSpdqvOLy5GLiRNbTsi7XMn8t89tK8liRfwDhhe4ZuMzinNbI+yvEm6J0uLLvbODFe/dKLvHEHFFdXpRmS6RF3uMX362S13UwX8ZATni+7jRj/wkc+00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781757435; c=relaxed/simple;
	bh=fNKzdOfM8BUwuXluXqTbqFsyDrrdPbAv/VHJTlP/dlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c9phqBPSnQQiiStI5xhp18YUwLjLEO5HRVk+RpfTLFPXEkQwkObh52bM880CjF9EpzJhl6nPBA0qzj2eJYQIUVtqOFH0q89E3YjJzH5Hpqj9swFzgh1nw+eWPoPvkuuvV6V+97ED0sW+05vTj56VcGq6mszRwfmgWGMuP0KyyQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+CWu1Zw; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+CWu1Zw"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ad4b60f6d5so460049e87.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 21:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781757433; cv=none;
        d=google.com; s=arc-20240605;
        b=OPTNwyulwIimZfccrifutQWDl0lXKrTg4Byau+KfV4vvg1Y2TmVP+/av7gz8iWMCQl
         UUHoKEk6hz22VhIBEG3K72BitMOD9EY5iLvlfG97bArl98zzGwFSlI7oHjc0XapQB1fp
         yBrTCAWoeQhCtnsdfq+FpgpoL5DOPyJKpuulk96OPrvbml4W6t10MXuWhv/iElQgNzGJ
         DVBd3DQ5tlFuoLKC5SwdBfIaUCrpHgkRLFFA+FYPZrlLx6rJiwpbNrAUSeBCdBKhfq8l
         m3yWAJCh1nyMJqEVweJd69mUOyRV/quDCVmMtKUysMnS0SNpQzyHPtA1QfjjI+ZUifT8
         35cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKLyEJe/vgTp6sTTyPCJf8trkNAtZN3RNC4TtoWpsh8=;
        fh=67siOkY4UTfUZE7XM3mzCIukBDSfz4jjQC2YjARw2fk=;
        b=MnUBPiRTVRlhqJfUDMI73VPXm9gBlpwmmxdPBN7cCbCsNA9MvkAKJy/7/GPgIUjLy2
         f6jaZWR3iuRGuVKquKSaHyTjZOxbowTkLl74m3tCn+3ThZCSeHtsUuMXjrKHCATU3B1x
         lxXs1LFbjd4aGqMgEaJhavxfDcT8i21UBfKCxl68mqGJpHoT78kZxEOm6cK367BnowN/
         I8APqusqCpigP2x3LuZN92G2h/dJ7nwzUMZEq+u7KajD/hXR1mV63ZtPlZs69qSbpv+y
         X7FJlwWIUg80xULbGjvcDyCvEXgVC9lKIosVk0ck3zz/PfvcQ9dM1ZmzBStlxNz1emV1
         tMDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781757433; x=1782362233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKLyEJe/vgTp6sTTyPCJf8trkNAtZN3RNC4TtoWpsh8=;
        b=j+CWu1ZwG8XBw3gGO9jYoGQEgHu16gPm9xpEY+jOb9mYdiDS2I1th9Ld1vkoOrZWS6
         F0fHKKoCjG4+fFfF+ru5joJGDpR6sFiGGLYqxjFrz0k3AzwiNQw4vt5KWzpid1Sm13v8
         SyizRwIIUKXYAUIkqpArCP9/hUNaHbkMkOxK6OB1Q5l+4/6z+tVODXt1MmRGrBArALg9
         UVLx9wiF5JkgdU1scRjRL4ty7LyWExPn4rzAbLPtxs9bL2kNmNvP0YrpVAnSXGjlBilM
         YdKJdGzZxNlNagvSbTl+wAtaT4yUx7mTnU1cLwdSdD60fEPhzJzj6p+HfbYDO93MGWO3
         Frtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781757433; x=1782362233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aKLyEJe/vgTp6sTTyPCJf8trkNAtZN3RNC4TtoWpsh8=;
        b=FRMluqzZpzmRIk6d1ClZAE6Ng8UnWE4z0tOlVsMK495cc+xb1ObUaBtCa+WQshY44Y
         oXKmFHfoIgH/Ly3Vy94oqac9ETpbcHZahex3m5+rZpLlXaEUrNB1OzbpXl8EflnZcoA/
         Bg06qHIZEPu/RiAeb0Vs9rx36M+zRI1ks0yZDtBl4RcZsaaiMwUNzuJ8kYLvVDZSltWi
         20HuEzXgZIB9ShpsTY8WlrsJqUdQa4H295T5VsYQ+Mon4bgIex1TXvS2m9CdLQHwg0eS
         fPWwwX8Y3B1mD0UFG/93v8tJDjKEjEnz1OtxbcY9xbn74P3BR60+owXx9fcRHCUJB/b/
         yE9g==
X-Forwarded-Encrypted: i=1; AFNElJ8UijZo6MrZ+vFa3qbQQKRUHER7dY2oxnmej8Rg2zooqEhqkZBrorBlxX6OaEEYek5bIihRqMdSzgDV@vger.kernel.org
X-Gm-Message-State: AOJu0YxSrPR3x+LTJIYZRTsgTUqHcCxb8H30Q+4G8y1vB5Z+c9gYT+SH
	fvfGSJ8hBhD9S4jdXzxX0bO3OFA6wt7yap5kg826qdrVJTvezp5MzWWxlms7EIwfDjFpTXeNf5b
	t8JnY+TemBBZftf993RgHsWINWWSzG6c=
X-Gm-Gg: AfdE7ckIfNYxFJvW/q0D54f8OUtmUiSnHej1Qi+Imd/8CDKEeVp+N69azWP+zbFyLeE
	uoE9SBJF+ljiFZQG6Pz4ht2OGP7Z/f7Lm0loHX5AotQlZ2pi4Jp6jzi47hZS9voLVApafTFRSIV
	icAHp+Qttf3x8MbBJzk1fqoZmzHWXPQYhzsw4yZpwpMquF/6JQrM7tgL+qjA410yJXFI1uP7wuB
	fl2RxiapeYOoMLmdOQxDn+msZi4ehUnmorZlPhKsmbMb+O4jPkcizyLaXVGfccjdn/l3qemwrxU
	fcjgNczCk9hi3uBgwhzs+VDu3oWVjluOaJJoJUinnVB2m56tXC/FzXCyuQ==
X-Received: by 2002:a05:6512:4010:b0:5ad:4cb8:ab2 with SMTP id
 2adb3069b0e04-5ad4cb80be5mr945320e87.47.1781757432406; Wed, 17 Jun 2026
 21:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com> <eddd77cc-fabc-4a2e-aff9-602895495ad1@oss.qualcomm.com>
In-Reply-To: <eddd77cc-fabc-4a2e-aff9-602895495ad1@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 17 Jun 2026 23:37:01 -0500
X-Gm-Features: AVVi8CfLcHy6h4cUnEnXnRiHZIgRkJuFH9_NAvLKc9bSZyqWBDaTfGLYN5pf0x0
Message-ID: <CALHNRZ-J6DH1ebhUcRqbVRmStO_MGBJr63TEQg5vxNO_UpF-vQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: add cpu OPP table with DDR and
 LLCC bandwidths
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 5:41=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/6/26 12:36 AM, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Add the OPP tables for each CPU cluster (cpu0-1-2-3-4-5 & cpu6-7) to
> > permit scaling the Last Level Cache Controller (LLCC) and DDR frequency
> > by aggregating bandwidth requests of all CPU core with reference to the
> > current OPP they are configured in by the hardware.
> >
> > The effect is proper caches & DDR frequency scaling when CPU cores
> > change frequency.
> >
> > The OPP tables were built using the downstream memlat ddr & llcc tables
> > for each cluster types with the actual cpufreq LUT tables from running =
a
> > CQ8725S device.
> >
> > Also add the interconnect entry for each cpu, with 2 different paths:
> > - CPU to Last Level Cache Controller (LLCC)
> > - Last Level Cache Controller (LLCC) to DDR
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > arm64: dts: qcom: sm8750: add cpu OPP table with DDR and LLCC bandwidth=
s
> > ---
>
> [...]
>
> > +     cpu6_opp_table: opp-table-cpu6 {
> > +             compatible =3D "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp-1017600000 {
> > +                     opp-hz =3D /bits/ 64 <1017600000>;
> > +                     opp-peak-kBps =3D <(1353000 * 16) (350000 * 4)>;
>
> I think this should be * 4 in both cases since the interconnect driver
> ignores the channel count for a node in peak voting. We may have a bug
> in all other DTs here.

If this is confirmed, I can update this patch. I based the
calculations on my sm8550 copy of this change, which in turn was based
on the sm8650 change. If this is wrong, that means one piece is
scaling 4x too quickly? Making it a power consumption issue, not a
performance issue.

> BTW, are there no lower OPPs for the fast cores?

Not on cq8725s at least. These lists came from an AYN Odin 3 with that
soc. I don't have any sm8750 proper devices to see if that's any
different.

Aaron
