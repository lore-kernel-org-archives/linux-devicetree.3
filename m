Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC2D380FEB
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783263604; cv=pass; b=nitvtjRe4wHiwOhifSF7pIrtj+0HUompAxOYuc57I5ggWnpaqsSin8M5MWSw3AZrKvGRHb+bO3CL4qxKTWa+tGoL/ZnWgjLkYPZghrJ2ypAgLD+fNZ5/ABhjYDZExvKheXdhK0oemBpAQP+7cI/Sn0XJE2wPPoozXan09yUtBlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783263604; c=relaxed/simple;
	bh=YNM/vGviPReJpIQvyDr/8KvWx9iAGbxgQK2+lD2HkV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7fSoE5l8x6MxjPUxQBojhr/w5saKDs7ze7ENkQ1gTCM1Leq7Wd4+Y72qPDHNOqLquV8ljLcYvZWFkxV0wkTIQJwsvoiPFY/itM1KYdUr5AzrJiQS8bLThinWIMoymd96QCs0VuZrtwjY1vH6RaqQ/jXZsPo5gq8QIpTD2YUMXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkM23AsP; arc=pass smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkM23AsP"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bdaeed0d3dso324793e0c.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783263601; cv=none;
        d=google.com; s=arc-20260327;
        b=huvHSkqeqMGLo2OZ+UAfnpva86STpGfbMP8rU6lkS1V84UfPfi9a0cnuocGTxqDL9Z
         bCfoitLEZsfeWH08XKyD8sNb140k7j4SkxwmQWqOZgkjOhLSDUL0zEpGgKYD1iagroEP
         XcvmbTYhcZLQucpu0IWI9VLC1rrSCLV4HnPjxVtWeHz4ZD678IjNNtWKMuVyuP36t2su
         lZzy9msGxmxbFyuh1ryNcBiZ173myKA/OR7ORQGVcWpG9BepzJiOZfrCfgnSeTJ6ISmQ
         aGZiKleJ9ASGC6dopzLYQff8A9fk5CNGea/qEk3A2Dti9YDSdwsQplzExmBNA7IYD9NW
         zqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsQXqeW1glXcF+vqfctlTuMO870cT4DNmLsDJlxqYrk=;
        fh=fFDhLV8KWg1arRvZoVTvOQKTACxEV3c0Ex4J/vkKQB8=;
        b=DzbhMW3WxMJEQArPeBAyHdTBV27N5pAY0y4QqtnsNnwq7pIYKDnN2M97YxDUuDLt9n
         Ej6jNI/WoX5gBcO0xpnSXj3NWijIcs25wnNTJ+T6eZLwhFK2POp6KQd4C8z8iD9R7MNs
         APt+hnew/LooDCn/Ezc7ibS1rCYgmq9Q2uuyKd2Vi8g6TMznbvJ9r8DQkSj7sG8HhDMv
         ARR0Duey7ffy1G0BibKbFUNdmN5ks1txqmyxz9RGUB72DYB0jk8+CGqns8b+wOlcKRHU
         hu4gYN8whpIiSjbBy8yjA8DOrVoclD49kOQELBVIHrFmvmkZR/QhIRjkk2nEJOTIU8kP
         nOTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783263601; x=1783868401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsQXqeW1glXcF+vqfctlTuMO870cT4DNmLsDJlxqYrk=;
        b=FkM23AsPAwLj9v59z+JlZzEgVMG7dAjv1KPONGu3q6a55vazqKVN45TymLCsu0ua4s
         cRbqQUa5JOdFIcf/8OHopTp2d/0y/5JOTcXcZWVL7ZdRL5sgDc+8rtj/4x1COVJyX84h
         /F+1SqzT0Q3poSTvrWFTm64uQH04toulxemalYtqF4ViBPcYJhU2Trht5w/hKmeOfTdP
         B4DdO8sUgMuzKC9NktW/FMfy+x2Pd1Yhyvs6p4Hu2AsA8gbrdnZxmYllMv9q9HxEv+4P
         G7uquN3B5YxYXIbnRfyk5kAzKQNwIO/dMaYdsw11jPqq3Jxp6oAkZQVbO0KCg9LXxnSj
         P+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783263601; x=1783868401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsQXqeW1glXcF+vqfctlTuMO870cT4DNmLsDJlxqYrk=;
        b=eRZR5KipiHEPS4jFewjYF7u25qD/jgyP02bjgsneWWVpDt4aSvjTMmriYuMwJSU5uT
         sD+2FVhDE+oT5mZSLria5ftiFpYX+CGaySHARZVkrlgjMnGZ569ytGQ2QswZsva00gLg
         tcL6vEdce24j3eeGfPAPuUfDxsjZ7TYfqgAJuKfN3JL9OI26LicKbzqMzthhT+A9TDv5
         WIXuCqlpu8YmiGxE4fhT5QAP3qoudKkYRYgE9+ClCs+On48F9M/G5TSUS5EffeCy4LhR
         wywEv10db2/XGUxnAIIyJ+WsRSfenXMMiD4K9yQrtQui6wiD4MehHfpJYtVeT5m5/dKZ
         aPLg==
X-Forwarded-Encrypted: i=1; AHgh+Rokq68DrzuytKmsiUlB4QHUCq7qiAM7HXu1HHgOxHVUhmTcPW2blsdfrWTGWLgAR+Bu8rlmmz+FG078@vger.kernel.org
X-Gm-Message-State: AOJu0YylY6AR3HS4Dq/HC3xtKESUfqgrzLZqrm+EcEXw7BZyPvriLdXl
	+Kr1XtOG4m0WUKx0El/Vs7NDcHOdEp8oNwAyzZsX24MIqDPWiRTukJCIcuOSkJCoU/LO8N+Kyzp
	Wxz7dzv++NrKe7Tv++Lgp0fIKyRurSJo=
X-Gm-Gg: AfdE7cl8bLkcf1lOC6mbARDSxVKWHztVUVTvhJ/OPRJOeB88sknOSvJw6iGXGgXJt10
	R0AQk0b6lSum+hgv1QLt20S2m48B006WZg0AAay0mhDMO75J87Pu7qPgIA2Lkcthdwjcw6dXSHE
	T4DttQ7qIJ4bZp+0d53oDSJvbyEJMHlDK4IwJqdGGwY04dunc8+oL1ttEYabMR6oHsQJFpO4wBD
	6fBeEbmPoFrp+hKeHtveb0ZX2L+PUJfWbV3qIygQ8OfYiozEu4Z7JxFlMC6Axc8b8zdelSNONTQ
	DNX4NE8lCdCYwGBXDu+tyoCnS0EM
X-Received: by 2002:a05:6122:2897:b0:5bd:ac45:5b04 with SMTP id
 71dfb90a1353d-5be1028ec7emr2109443e0c.9.1783263601282; Sun, 05 Jul 2026
 08:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com> <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
 <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com> <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
 <250311af-0860-4a76-9799-c01608b87293@oss.qualcomm.com> <CAH2e8h65xgLnqusTMw1QnAMSmf__YK0PsWY-w0D=32US1d9L2A@mail.gmail.com>
 <75b423b3-d721-4bff-8d42-603cb5679364@oss.qualcomm.com>
In-Reply-To: <75b423b3-d721-4bff-8d42-603cb5679364@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 5 Jul 2026 22:58:31 +0800
X-Gm-Features: AVVi8Cf56UN-czz2LV8u-ataD__A2T2E9rPAdcaIT9OBGB5ySshPSFhzEZ13-4k
Message-ID: <CAH2e8h5tDrpcB0ekfSVUPG9EPgtswOM2tn1eKfqoQHEofMpCOA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 7:45=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/30/26 12:41 PM, Pengyu Luo wrote:
> > On Tue, Jun 30, 2026 at 6:34=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/30/26 12:30 PM, Pengyu Luo wrote:
> >>> On Tue, Jun 30, 2026 at 6:29=E2=80=AFPM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 6/30/26 11:28 AM, Pengyu Luo wrote:
> >>>>> On Tue, Jun 30, 2026 at 5:18=E2=80=AFPM Konrad Dybcio
> >>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>>>
> >>>>>> On 6/30/26 6:22 AM, Pengyu Luo wrote:
> >>>>>>> DSI panel driver have been added for a while, so add the DT node =
to
> >>>>>>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the D=
SDT
> >>>>>>> describes the wrong, no impact after manual disabling these wrong
> >>>>>>> supplies.
> >>>>>>>
> >>>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>>>>>> ---
> >>>>>>
> >>>>>> [...]
> >>>>>>
> >>>>>>> +&mdss0_dsi0 {
> >>>>>>> +     /* real vdda is unknown */
> >>>>>>> +
> >>>>>>
> >>>>>> L3B: DSI core 1.2 V (both?)
> >>>>>> L6B: DSI0/1 PLL and core 0.9 V
> >>>>>>
> >>>>>
> >>>>> Yes, that is what I saw in the DSDT, however, I can disable them
> >>>>> safely (hack the regulator driver to add a sysfs to handle these
> >>>>> regulators), the panel works well.
> >>>>
> >>>> L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
> >>>> ends up being on), UFSPHY and USB1_PHY
> >>>>
> >>>> L6B additionally powers the same components, minus refgen and USB
> >>>>
> >>>
> >>> No, I confirmed they are totally disabled, since there is a way to ch=
eck it now.
> >>> https://lore.kernel.org/linux-arm-msm/20260420-read-rpmh-v3-v4-0-70c1=
52e6c958@oss.qualcomm.com/
> >>
> >> This presents you with the status of the votes casted by HLOS, not
> >> the actual hardware state
> >>
> >
> > If so, non-HLOS will vote on some critical regulators to keep them on,
> > IIRC, once I disabled L9D, system reseted immediately.
>
> NHLOS will generally ensure that the hardware that it needs is
> powered. This does not extend to hardware that *you* may want to
> access in Linux (or which was left online by UEFI), which I suspect
> was the case here
>
> >> To get the latter, you'd have to dump the SPMI registers
> >>
> > I will appreciate it if you provide more information.
>
> Take a look at drivers/regulator/qcom_spmi-regulator.c, you can get
> the actual live value of the enable register and the voltage selector
> for each regulator
>

Thanks! I will look into this later.

Best wishes,
Pengyu

> Konrad
