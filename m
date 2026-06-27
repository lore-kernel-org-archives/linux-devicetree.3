Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8366B158DCF
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 05:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782537820; cv=pass; b=YVWgMbsBmbgy0LbhtUeUFjzkMVnpf1Q27NJXrN/NY1Q1b1hMxtnUAYNyk55kAqvrjF0rq/8MicNDSVlAPY261BxZQeQhd06izohdMgtzeBkX2rrr69b9fa8cUF3DkaG9Nbpg9t6LdT5QT0GruDQ9sHqSyW6VS6J4Hd8niS6KE5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782537820; c=relaxed/simple;
	bh=jsTJV3XTeyptIuiFlh+MCtigFwZrx9dcmVg4Nn0eF9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmzzBPLBhGXn+ffNadLvBgxeCGH0FID+wbs10Jf73sE87G71c0j3eEDYfD+wRXZmq56herqrmhIby/tysmN2kbMs8R2GRRscHK3dn9+RwNp4xbHf4Rx+S6aCNKvnhqblNrkBKk9KkBKdl6zbsMTRUFtQPOJpwmGhk6j0F5B1LzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mi5qKHdF; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mi5qKHdF"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bbd26a2729so1520182e0c.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 22:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782537818; cv=none;
        d=google.com; s=arc-20260327;
        b=WxISd3n2M8d48dE9s3tDdltSq3YOpGMd57WDH53XAZZLKoBxCV99GZtSFHpQv1Iuvq
         /fU6slLz6jfTodqXerYIzl65kguXhck0az8BvD7ENb0zu7L9qtmgGyjGm+22ATbwIxLy
         6mATUruLs75cyLLdy3DKvZDPHcHSrPFTbfJrbwJLvsPzAr4ziAxwEh8Tr2w6H9oyBqUC
         nbHowbQ4IpdHtrELaHA/gU+xHz317Hwocdu10Ar0fdmi3Spv3fo4zdc2dYnfr6SwPzcN
         ktU1hJ1HG+S+GF5sRiErCX2/7GS6g+Hv9UpA1GTLPwwbLvfuG7lmgLiExcIDAn/ZACS0
         lSdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FSvq9cc8NOpYsz4zrDlZ8UdKSCjZyhCkH7GixyxDUTw=;
        fh=hEkGrhLB/WjKD71nZfHu/ejcXGuR1RF4rSqOW6mcELg=;
        b=MC5x2Nfm8f5+jy3ftKo2E9B1zPMJXt8p8WDpMdyCo7m3pDjfVYKp2LwFgV13SgY4lP
         q2t9Udt+rp4VDBBrDJQj8OQ9aypNfqH2s/XM8Rl8OH0nUihbHhF6yta/ZNkgXJ0jtdfc
         Gcuj1t0w2/1+0Y9mcDyIwMra0hca5dtneus8DfhM0LboFAosoVpjX6IeLTEJRw0zC2+E
         lrEa1dH59628xyMCAEFmzQERlOT1Oncq7d4oQdlMf/tWl6Muiaa1BJMh58+wPKn7w08M
         /lbexHpDCHU0F1KHGboBObQ4PNrn9vIMDjS09JRaKs443G3VN3xVI2YknVi+/SR1YMlO
         iclA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782537818; x=1783142618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSvq9cc8NOpYsz4zrDlZ8UdKSCjZyhCkH7GixyxDUTw=;
        b=mi5qKHdFbfDSLrN3dz260EsRobwuouOVmn13CfyyUbWJxw4axnJ3dFQhC0oW+gQLp4
         ICINy18OFgBkd5WaoWLjoqaANWrJrZ9MbwingrA2OI15ZEkrm+6L3f3UJrG3BkBinRhe
         vAb90FwC7xzl2bMWKnw6Yiyuj/g7seqrRMNTqG4yoPANOdj3oePXuAn/zcP0SyO+3sQI
         OkyBxB3+TVOdS2E9kbGHq09LkD5zRXz7G1O84tAZvRFqLv7OCqCKj8k38Qe2XwAyCrFv
         1OfEhXee52A4pU9Rz6+wTDisdTujZ5vbJUOVjnqSep4OJrAadWNoZcURQxqnpFv6qMxI
         AP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782537818; x=1783142618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FSvq9cc8NOpYsz4zrDlZ8UdKSCjZyhCkH7GixyxDUTw=;
        b=Xj4ksDczBxpFwlgUdFqfB8wFachFxWS2doz01bRjAxC19huojlkiseiqmbAve0vrRx
         J7ZNytb7g3n6rQLix2rE3H91Rtr1AoTAZ4GExZ4jnf6UuZlNwYKab/Xh8QuPx8VKTTm0
         Y0WozcYSfWw5qXGXI7cyYE9lfV8rTHFJr7QPNBSkCE6eWkB87wvQyNQjZQNVBFadvKVf
         s8bt7Y6mEhltwxcHvoZM42Wdnig07MifURRUI+9uhn4vS2gtV516xCUKwlj6ZhVrSZ4S
         eF//1SFT7pDBFMHiSs0AgiZaLwAid8mepRr55lnlfx1Smxk6Hbb94lr7pz377Mpjf1TF
         bnYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQTnGb8x6NkJ4XYihqNY4ouksfPX/tlie4rTIwrrDVPYCaxkwSlwJeDRlEQN/qwFJID7Y/STUMe8le@vger.kernel.org
X-Gm-Message-State: AOJu0YwjEWG4bsGW+OEbMxOT7bsK6phzkgFWwZ1Udwar+TI9wD+D3BR+
	bDI2EkQFw674GfFUpJm7dJJLA66HyT45XOnehOetJB7e8C6LYvJAODQSnuf3ss5zmRND7d8/3qM
	Y606LVydHb0E8gmAef4OjL/g+tobKczh5CFw1nQA=
X-Gm-Gg: AfdE7cmyNEVRKSqvnk91X7VU0rdbe3KlwkAqPeYrmkyFxxvn3HIS5QZN/uCTwSTjdEx
	XoIrXO1Tuyb11gHjzRSkZvODL1hPgGZkailwiQvK2FP8wRRztnRn/nzwznrc/kXilx4IwZpZylm
	NpKuZ9anDdF9X21Tuaoq4JPZpL4a0Y48JlZqj7WmWAxCPztbId6dS+5UPrSgSknoXqlL3fp3JWf
	2rqegfghh6jEKJqKLKBsZFBa5n683DGTHkEiD0bg2VLUkFbsq7fGIKy3vlPxJrZfQOuuTCJog38
	QnO4TTYuYwa2u9Ze2PPMav0Ob2Td
X-Received: by 2002:a05:6122:1d0c:b0:59b:7fbd:39f8 with SMTP id
 71dfb90a1353d-5bd69d7d046mr4605137e0c.10.1782537818557; Fri, 26 Jun 2026
 22:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com> <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
 <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com> <14491fd8-f785-4404-878b-5764bb8fd593@oss.qualcomm.com>
 <c22f82e1-65a8-4472-924d-91908f4d6104@oss.qualcomm.com>
In-Reply-To: <c22f82e1-65a8-4472-924d-91908f4d6104@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 27 Jun 2026 13:22:12 +0800
X-Gm-Features: AVVi8CfrwkCaZZLoTfnJoyzeKn04AJD8vvCiej82z8jd-tcuH5ak3SMX7LH55bc
Message-ID: <CAH2e8h52YaKNHvX11HheFAK9XJT9KREQrQ115AOEOJS22UWV9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 11:34=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/25/26 11:06 AM, Mukesh Savaliya wrote:
> > Hi Konrad, sorry for late response.
> >
> > On 6/15/2026 5:12 PM, Konrad Dybcio wrote:
> >> On 6/15/26 6:25 AM, Pengyu Luo wrote:
> >>> On Mon, Jun 15, 2026 at 5:18=E2=80=AFAM Dmitry Baryshkov
> >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>>
> >>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> >>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing th=
e
> >>>>> driver to fallback to FIFO mode by default. However, these platform=
s
> >>>>> also support GSI mode, which is highly preferred for certain
> >>>>> peripherals like SPI touchscreens to improve performance.
> >>>>>
> >>>>> Introduce the "qcom,force-gsi-mode" device property to hint and for=
ce
> >>>>> the controller into GSI mode during initialization.
> >>>>
> >>>> Ideally, this should be decided by the SPI controller based on the
> >>>> requirements. Another option would be to prefer GSI for all transfer=
s if
> >>>> it is available, ignoring the FIFO even if it is not disabled.
> >>>>
> >>>
> >>> I have read reviews. Can we check if the compatible
> >>> "qcom,sm6350-gpi-dma" is in DT? If the gpi dma controller is
> >>> presented, then we enable GSI mode.
> >>
> >>
> >> This hunk is very odd:
> >>
> >> /*
> >>   * in case of failure to get gpi dma channel, we can still do the
> >>   * FIFO mode, so fallthrough
> >>   */
> >> dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall bac=
k to FIFO mode\n");
> >>
> >> In my understanding, GSI DMA mode is always preferable. +Mukesh, do
> >> you have any insights?
> >>
> > GSI mode is preferable but if for some reason it fails, we try to conti=
nue with the FIFO mode. Just fallback mechanism.
>
> So, would making GSI the default and FIFO the fallback option
> sound good?
>

Yes, I have sent v2, please check here
https://lore.kernel.org/linux-arm-msm/20260616122605.668908-1-mitltlatltl@g=
mail.com

Best wishes,
Pengyu

> Konrad
>
