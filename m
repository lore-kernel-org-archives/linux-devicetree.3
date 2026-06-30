Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A01B2BEC2B
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814104; cv=pass; b=LTWo8stSQ1shJdQ2XXtg6objZ4WwmRq1P63Ryf3yVzv3ik/GS2LW7kmFVQfOuq0GE1qHA6lNotanw4KWJMnB908DA912sn+AXboSHWE9Sge0zxt30u6dlbi7vCKX6OrgtL88G298VzszCf7rtJcW8I2ru05BIaqW8XzlqhoHWbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814104; c=relaxed/simple;
	bh=ImIp7ff7R+p3kOeF0z4nxDiC1ZOiuu9W7gXy3BE6q5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MiKsGjxgyw+JXWrK7la78AxeKR+oVxxnJjnQ0UeA1xRuTdnxzOEg+NWpbqgcv8pISrzfBjb+nPDk3dQsygvSA7UMs2scJI48COKupSLKRgL5YjiBlnimH6s9eWjhWgscU/W87Vm5CuODcAovW8ZRU+oebID7LGNyd9VpY9rxW1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfHkWQ+4; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfHkWQ+4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4924593f45dso55382585e9.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782814101; cv=none;
        d=google.com; s=arc-20260327;
        b=mE7hy6/sd3l7d8T7i7UEBrYKJsx+8TNrWlPcpbb5w5h5O3ZZO5eobemXx7e/JhDG3o
         U4klaX9IQMi5l0a51jbihGini4aNb3cB+PAbjlDd8Znca0hG/VTde/NY+vYDb/qR63oG
         /LBB4oTM9vECttLsw8jyhKyavjraz1kkI29aEUzC15qS9lQ5XVNvdNnnfyz+bTTjfbsr
         d7Kv+lfGEDSOi4QXKN9jzGPEQ6l49eHBmB4XBOuq6V9AVe2rgZnO2/JIcV/pjn3Cslxa
         Z953vErqDC/b9Rurrn6bk3HosR4afjodv4/RZDApsef0bMhTpRQsOgTf+JXM3SzCIvel
         dfFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zA254jSg7Mg/pmP5Hvzp8s8/v3sVmr5J11egd6Z5eK0=;
        fh=BKoYwHocEgMC9XlVQbZ+KTt8mVUYBnOoG8LdhTQp5RE=;
        b=NG9pqHJc9jmw9d2UTh4340dwUpgaWlztloAlSgSN1QpL70iWgj0oF79TdTdMofoNmN
         OSTFMwEA40SyHrDIwelfu6hvUcnswgNogteV9D4L0KuAl8HUCy7sgcyWE+JMHQhkqOyv
         D5IpEzxZ0vQl5SJS6T6HlPE+nnnsQykDsOwTdhRYRgaqxSlcPIG5b+0hUF6sD8OQGBzs
         Vu7iteb/hwKfkZYdyEwK9gyApUsKPcTFZXu26PE4jLjxVW3pZrtYvwmusIBAuWn9u/0w
         ADLmPnOZqGsuMTry6e4OdvrR8Rxt2JFaOOua5bH8ElaV2VrStC5FHSzO1GXNcpNTgz+z
         ofzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782814101; x=1783418901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA254jSg7Mg/pmP5Hvzp8s8/v3sVmr5J11egd6Z5eK0=;
        b=AfHkWQ+4+dOgoqkmHcQUprrHPh+aL1fDXBe5mbKlRaLrc9EC15+p4PYgkyNs/hG0zA
         mtqDT9ikZBrEN1hiGrrsl2kVrMk59Gu42IbhF8Ojkj7jwo+obtLOBwJ+dA+0b2/Cfznn
         orVTdYe/jz7f8ZdB9zvR9+U6lbxAIrgeSHZWmoi4vJ4VLRZ5/R0iuladv/Z0/xUZz6OL
         gChPiAPkSp+SBGxwfiQkcYpABBVXCsGoxoMRZ95CxEAl5KbdtmUo/lDdMYy7JGpf3xK8
         +qX+wsF5atgBHUDODLGWRSwD9UvVpQdEFwbVDR3fmQsunkZpmvEqyLoEbGVcDAQmF6tB
         dQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814101; x=1783418901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zA254jSg7Mg/pmP5Hvzp8s8/v3sVmr5J11egd6Z5eK0=;
        b=I1OWj1S4KqfxqDqQvV6syTAgs7tkZXzlF0wxxBu0YhU1KScbdWd6aPaRNy7gIV369O
         PW694A7qkt7R2SAeUOoNkLtJyzzvAo/bzC5UhO35juBXaT+K2+0l/YYUxyXobb51HCcI
         dEGjvgqXlf5ceJ3crBCgPEIkrSg2GSNtzlT96S4tbGlptXzvR5N10pnHERXN5/cE1zIO
         +jTaTnDCsa7DAv6rASMx2hL13ONNzVfMyptScILgydYmc0CldP5Hml71h0V+I07uA1/R
         C9BK2QtizB2tEgr0R5LQ2iLE8DnQlDQSTbzIetSqFxbrLWB6+N1/e+p7xM5knICUesOD
         2SQg==
X-Forwarded-Encrypted: i=1; AFNElJ+QgC3KvkyYnSV8iyynS62GtMEzEVqvO5Acn9Ba8/+zFIB+LN4y9WnjF/A2bPJc/+lt3Y7T2ikFvIm1@vger.kernel.org
X-Gm-Message-State: AOJu0YxeiyXPJo780yyj3knEucg6yOevJKuE/+rBCEnQf019Zhitej5o
	g6xigrRSTQX0+h5Q45MAvo9DsvVhxFlKtd2272iQVqCwRt6WRJl10PaRJt1cITDFnT0pAQdttE8
	nhomh3FvjfxvMOTwe5wn0mkayyFUqHOA=
X-Gm-Gg: AfdE7cmk9QFv6b7ngt1Tri0QGr2SjDarXqzfM/xOtltduqIioRe0zbbw1a6h7q7x+mB
	3ppAnWkIMY8upuoaKuvLTT6VBGUUuXoD+z83NZ+BoCSW2RvMV1Wp8ZEiMWPiDZ36mReFBQfPFvi
	7XALX9RKcybwK248l+5IACoCZfrm8X2nPAefKzZ7fFRzJGez8Acmy9M6kj5rTArOzkHAJAw9ER/
	uinfCYpV+nZ2tCni2yCtUY6KhXybAB2qp2RympOIenRX5+sRsLwWdqejJggagTBU+D1kUBPHdyE
	KQjhDCGUYkqeFymxUA2W43e3muC+NLg8Vm1/hPY=
X-Received: by 2002:a05:600c:4991:b0:493:b730:8d78 with SMTP id
 5b1f17b1804b1-493b82c324bmr28731885e9.31.1782814100704; Tue, 30 Jun 2026
 03:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com> <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com> <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
In-Reply-To: <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 30 Jun 2026 18:06:50 +0800
X-Gm-Features: AVVi8CeXY2XXtKzC05jw7mqBTSZCDFNAWUTECad4JJzZvuIX-tBM3NerKDQFx-Y
Message-ID: <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 5:52=E2=80=AFPM Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
>
>
> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
> > On Mon, Jun 29, 2026 at 1:36=E2=80=AFPM Mukesh Savaliya
> > <mukesh.savaliya@oss.qualcomm.com> wrote:
> >>
> >> Hi Pengyu,
> >>
> >> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
> >>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> >>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
> >>>> driver to fallback to FIFO mode by default. However, these platforms
> >>>> also support GSI mode, which is highly preferred for certain
> >>>> peripherals like SPI touchscreens to improve performance.
> >>>>
> >>>> Introduce the "qcom,force-gsi-mode" device property to hint and forc=
e
> >>>> the controller into GSI mode during initialization.
> >> Why to force ? You can directly configure in GSI mode. Note there are
> >> some configuration done prior to Linux bootup too.
> >
> > Sorry, I don't get it. how? I know there may be a qupfw, but it is
> > impossible for a normal user like me to generate one with GSI
> > preferred.
> >
> If firmware doesn't program in GSI, you can't have this working in GSI
> mode, its going to fail (and work with fallback). if it's programmed in
> GSI, anyway this will run in GSI mode. So why to add extra things
> without any usage ?
>

What I can confirm is that fifo is not disabled on my device, and gsi
is definitely enabled (under windows, check the register
SE_GENI_DMA_MODE_EN), forcing the device to enable GSI mode on linux
works well.

Best wishes,
Pengyu

> > Best wishes,
> > Pengyu
> >
> >>>
> >>> Ideally, this should be decided by the SPI controller based on the
> >>> requirements. Another option would be to prefer GSI for all transfers=
 if
> >>> it is available, ignoring the FIFO even if it is not disabled.
> >>>
> >> Yes, it should be decided in advance and configured accordingly for GS=
I
> >> vs non GSI mode. Because there would be limited set of GSI pipes, whic=
h
> >> will actually make must have GSI mode device run with FIFO mode.
> >>
> >> Why don't you decide prior and configure for GSI mode ? We don't need =
to
> >> change the current logic of deciding FIFO vs GSI.
> >>>>
> >>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>>> ---
> >>>>    drivers/spi/spi-geni-qcom.c | 7 +++++++
> >>>>    1 file changed, 7 insertions(+)
> >>>>
> >>>
> >>
>
