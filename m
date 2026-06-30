Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E980640BCCC
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823250; cv=pass; b=iaK1Hs6NbLgEZSzvbTrdnVjmuZ8Tu2858EbxvujqgX5zLCM5i1Q05yRz8J3I8DdCIldc9Xw/YH/gJUKojEEKdnmMJkDSXrXyPkbWCSxUaxtFLPM7yMbOOyZuVb5g3fSMyOhL64KLBk++pX1ST+DSy54yRiGZ+6NQkhHmSNgYrEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823250; c=relaxed/simple;
	bh=uOJKz5W+d2p6Y6G+mO8v3mk6G4LRD5Z3XtmSK7BGQy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBaixGFfGtHUx0++v3mvvTYUtmn7V3UL76INliYkdyETdSadxMK1Jy1dw0oGVP6siPCYnq4vNMnYTTj9Lk9Fm861WfEOFzOZHNTvq+I8T/5HomPHHKLU6qbkeKEOzCWX0iLMFElgMmc7Pmcq51o/gOXioSDnmB2Xu2o+oY22MWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okYOPVw2; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okYOPVw2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493a5392c60so14335215e9.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782823247; cv=none;
        d=google.com; s=arc-20260327;
        b=HikmHivRFKIt3ma1jbDDlZOf3Mh2PkS49me/b4YcG4JeEtBbZeqDo7AErHhpUSwN6K
         hL2eUhxk+UoykCE0iiEeDuJmH5TEGr8HQ7ABRKKFznMcLaiDZzKoPkc/c3UDatwLIfZt
         gijVT2KfFV5AxPsu/85lVWzehwkoxkWIkZYBhdh+F/ZdVBQ1myObeHagzzok/vRzN/cN
         qAbVnfLrDIV2a51LG4FIv/Crxr9ZRuUmrhtd7W38GbHShXfF8kIZJECbANZIYaoTXPXm
         Sry5z5fWD3RuqeyXThLxdKZfANOshmDu4P401fiq1ZM68ravFqQzXvF0JmH6PSEWK1yC
         HTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eV5IRKi1OeoMkxNq2d6si+B8SDj/PuxpdPHNUkls7HM=;
        fh=iECXC4dKd8Ebl6ajkUljW6IuuS90fsE1VQGhTRi25EA=;
        b=nUe6DSq/aPz9jvsyBQoXVb9BGH3rIcon5jFR1bpUpycXTiixfS5B0np/IBEziT0EZ5
         Vm3hO/QrkMqKZe+DzS39ZIzkGHgvboMDBNxG9GijbNk9DQ5T1iOuoLynbWOjPjNSdrAh
         rvUOwTXKKAgHTZBhc1gPF/FNVp2F4EtEErRrwHUAem+XW1oyLeii5BTnLUHuWikWjNde
         nNJeF2lJceY3/oKPQ1z28Vqygx1vOuJSsOREmb/dc4D+cxHocvJ2gd/koCTI71xdUwV+
         Ag67YCXQOkM0I/K4QmQlvMRz+g0pANLSmE31kXFIsgmdUtQKutC+uTuu32bs2vpxcioL
         NGLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782823247; x=1783428047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eV5IRKi1OeoMkxNq2d6si+B8SDj/PuxpdPHNUkls7HM=;
        b=okYOPVw2Q+8a0DjlK1NeXzgumgVYTGzXd73n6RNIzvvxcwTJ5XophTMRfU8cSS2mI+
         bixAvDqaYTTKPYqQ5xK40UAVg5Ig4yTaqqaJgyNW71xx1FrfxpbpgJG3u9+3RUY5DNZf
         gk741C9HIvNObnKUKTy10T2YUBluO0u+1B4JPnR4LevWTO4MlmyWmtIFwXhLlCtXEmVN
         FjZdEQqflShRPY4XlutZXqyQP6HbC4+phfRsszXH2cL+pGGot5vWpsABD/T6BP7XZqbt
         KqJ4JiPKSdOYwKflJSJa6RQ14d8NbsfNdhpCRC6BiYTkpTER911Bhbzd1l5fEt2AEukF
         FjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782823247; x=1783428047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eV5IRKi1OeoMkxNq2d6si+B8SDj/PuxpdPHNUkls7HM=;
        b=q5a3k1g0k1CflQZ2H27R4SPeKgAOyyTWs7y9bwJ339GwswWeWQltEhVgOWfLZMe3NO
         JJAPNfvRdCQwho3zzw/M075ynNFe8YPxf5hTeRwyKU46vj83dgsLBowiB3dFDhLF519k
         gae5VYskPtYmuz843VQfqkP7vC7QkIIsDuIc84cc3yNQRVealz0iAzjVhPxEXp7fTi3T
         uXdLZzDEdPKoX0wTIOXNqhBhC2dtIfjncG9LMbwAfoLE65rQkaQjbOviJEZ5h8FHabfv
         IoZ53we57ppBp4eJYECI8R2DZms4K5wOcE3sHX+zIxkSd0Zleh5Ai0NvTZotkyHdVaE/
         bp6w==
X-Forwarded-Encrypted: i=1; AFNElJ9elv3bxAPYcGwiEA1vzz5cOOJynTFWvCweGH6PjKQ/tiND6Q0LGMCqOWvml2oD9Al10ZQTfQ8fmkun@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ZUzASsBHQvD5aQmhwmfOJWnN+DDUK3NVTIEBqwNglSqUijKi
	sBLin41Wu0SPZ+yIu+Zg89vVCj3ofUm/0n+xpGi+Wbi7+RYXrlXGADlLaY5mPK2K6HsaQ7J/Sf/
	5lJwqI89ojCoKrtzNr/9sY8YzIURxwu0=
X-Gm-Gg: AfdE7cltIi2gBrmuXypn9knEKRmE/MRthEK+4FDxSzg1i0EAdk698VBFKhEvv9qHqxU
	BqmCAxmDZGZZs0qqCP2//D3q15a6npTj2hN+XYgMx4mKiOYta/D+Dhz93QrEZkd9cmMFSrTOZsY
	0MfjtXIKHm+d+VHd1SR+ZCllzWHIN1LQOoxVYbCbnTiABcBDCm/9w1IFskC7ebyKgNbr9U//Cb6
	s+9/yoFfEn1OXXLRQpX0uxIzmU/KdgyAfGhpnI+RkXXeweBbSEE991QBvkB14UYllALze6SEV/s
	X4+4HxaGi4Hx8qpjWjLqfXi2YwhrBmteAyHgzp4=
X-Received: by 2002:a05:600c:1383:b0:492:58d6:2565 with SMTP id
 5b1f17b1804b1-493b82b62b1mr51680335e9.25.1782823247134; Tue, 30 Jun 2026
 05:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com> <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com> <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com> <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
 <df03a3dc-1f6a-4725-a565-939838d3b1ba@oss.qualcomm.com>
In-Reply-To: <df03a3dc-1f6a-4725-a565-939838d3b1ba@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 30 Jun 2026 20:39:14 +0800
X-Gm-Features: AVVi8CfouiOAAEzdLUS5LEph1kSz7ajqtxX1IEObzFKZMd694YMeQZPjfxjVDBU
Message-ID: <CAH2e8h7XmhwWPfDmPf8SVpu6syP2E=BriC0=x3BT=XNPzJDzMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 8:28=E2=80=AFPM Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
>
>
> On 6/30/2026 3:36 PM, Pengyu Luo wrote:
> > On Tue, Jun 30, 2026 at 5:52=E2=80=AFPM Mukesh Savaliya
> > <mukesh.savaliya@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
> >>> On Mon, Jun 29, 2026 at 1:36=E2=80=AFPM Mukesh Savaliya
> >>> <mukesh.savaliya@oss.qualcomm.com> wrote:
> >>>>
> >>>> Hi Pengyu,
> >>>>
> >>>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
> >>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> >>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing t=
he
> >>>>>> driver to fallback to FIFO mode by default. However, these platfor=
ms
> >>>>>> also support GSI mode, which is highly preferred for certain
> >>>>>> peripherals like SPI touchscreens to improve performance.
> >>>>>>
> >>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and fo=
rce
> >>>>>> the controller into GSI mode during initialization.
> >>>> Why to force ? You can directly configure in GSI mode. Note there ar=
e
> >>>> some configuration done prior to Linux bootup too.
> >>>
> >>> Sorry, I don't get it. how? I know there may be a qupfw, but it is
> >>> impossible for a normal user like me to generate one with GSI
> >>> preferred.
> >>>
> >> If firmware doesn't program in GSI, you can't have this working in GSI
> >> mode, its going to fail (and work with fallback). if it's programmed i=
n
> >> GSI, anyway this will run in GSI mode. So why to add extra things
> >> without any usage ?
> >>
> >
> > What I can confirm is that fifo is not disabled on my device, and gsi
> > is definitely enabled (under windows, check the register
> > SE_GENI_DMA_MODE_EN), forcing the device to enable GSI mode on linux
> > works well.
> >
> Thanks  ! if GSI is already enabled, then why do you need forced gsi ?

I meant it is enabled on windows, not linux, and I think it is enabled
in the driver, geni_se_select_dma_mode() does it. On windows,
GENI_DMA_MODE_EN bit is set, but not on linux.

Yes, I have no doubt about below(as I drop DT part in V2), but the
GENI_IF_DISABLE_RO register only determines if fifo is disabled, if
not, why can't we use GSI?

> My point here - SW should only decide mode based on register read, not
> enforce by DT flag. As such it's not a SOC exposed, can't be overridden
> by user.

Best wishes,
Pengyu

> >>>
> >>>>>
> >>>>> Ideally, this should be decided by the SPI controller based on the
> >>>>> requirements. Another option would be to prefer GSI for all transfe=
rs if
> >>>>> it is available, ignoring the FIFO even if it is not disabled.
> >>>>>
> >>>> Yes, it should be decided in advance and configured accordingly for =
GSI
> >>>> vs non GSI mode. Because there would be limited set of GSI pipes, wh=
ich
> >>>> will actually make must have GSI mode device run with FIFO mode.
> >>>>
> >>>> Why don't you decide prior and configure for GSI mode ? We don't nee=
d to
> >>>> change the current logic of deciding FIFO vs GSI.
> >>>>>>
> >>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>>>>> ---
> >>>>>>     drivers/spi/spi-geni-qcom.c | 7 +++++++
> >>>>>>     1 file changed, 7 insertions(+)
> >>>>>>
> >>>>>
> >>>>
> >>
>
