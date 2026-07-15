Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABFD288B8
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084520; cv=pass; b=DOfPQtkCMJjcCgYmfpY7yJVSBsh07quJqf17GRLPkbFfykA8BImpfmvk3FVO+//nVwH1R+r1ijY/cc9V/HRiZODPQvlK2bL26ype7Aa9jbY70PoWIs1Gz9GJgT7b4iKMiOp3TT+x6WYYdSkZVNyrG315CkwipOhXeJdiOcFWsO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084520; c=relaxed/simple;
	bh=gztsi8R3KcnU2Y68ziTBqFgTiO1IhBQcSODvmhfJT5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQONx5ndJuVFwmSNCxwCMSMKqQuz/TILKXt3gz94JMBDKmD7XQL+Kak1uFVYYQrDxNWbVLida0dGUGTDIqebrKPyqoHVXZHseN82GkU39u0y6qsJFuQiEkFWaFBf3VZt1ZlV5bsLz+S2BtHTiuoTR083RTJRDtIt1iIekZNEqhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioVAyP0F; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioVAyP0F"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39ca300db70so29642401fa.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784084517; cv=none;
        d=google.com; s=arc-20260327;
        b=px2vblGdRmORMdl+WUeDbsEzy7hgnxp3JTt8TRt6GIHCsD2zrsupLy5iJp4Il2EdDi
         rxVXLHg3QE9h8WT29HCNDUUGAmxETN7s9ovp7pEiqjnrMosXBJrG0AaNHDZOx6w0Sy1t
         eSQYLnnqDUl0lta5TbxXe4U3wHPrU3JKy6ZhqNMvoinzV499EGGxka+ZTrvjW70zTsYI
         C2O6y9KArgYmAk6c3ePHwopVDxH/fdrSLUSpCBhL1lrFnrEMGhq0AiDkY1eh6RLz+MG0
         L/f/zMCkJxMbzNMh3ajZaL20jI7qX5b2wWqGaX1cM3hJ9NCtvQH5moMKj4uiVEWJ6xa+
         TVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GQ8XxR+wtylpl+/xkqDI0BX56oI+EqOnmpPGTUlwx6U=;
        fh=2WhS+ubK6sCE8v8PdGJ7T9hs1JysAuPsG0HkwlQDKMM=;
        b=fYw1xO4SPJIPjec3Uv0jaHTII51fcH4CanxXvSijf3vd/1bNRMTLpYrL6Cgfd0FVta
         LGGMrP5SjWz2AElEw0pCWAg3g9Fy4/3UQvKEPpv0ugkA1iB3GBqdzz8hVE1npfmi61LN
         o/Zdx7AfCrz4l1gz8PFGhYmDqN0+909AQwAMFVevYdgwe3gs/5IktxP0wckfcmGHfTlQ
         PUuOsNw1NfsatyBDAQLvlJIUdomtJgyur9NQfNawknQQsJR8T0pI70lEPP3lGk+Kuqtu
         sGCe+U+5JZATQ0XCd7vnvmXXwuDb33ks0t+CF22uNPk2uN58celhHM+KH2pcoJUER1Ks
         AEUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784084517; x=1784689317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQ8XxR+wtylpl+/xkqDI0BX56oI+EqOnmpPGTUlwx6U=;
        b=ioVAyP0F9MUNE71P5kQ8il5qAayvaiadBfcgm5D1LMivu98tZwvhUTJpBSNn2hd1U7
         ChYfEZ5anj5XmVOqvVXjLNwmpSwX6I25ImvSxCvwhda7InJ0+owWsPvijsVHdZAJy1WX
         p/fYf2JRc80o8Ofcgf7IFUsAwSIU/auT8ASPZyEBLhOkRA3FJBUiRKDvWE8tL+Jfah9v
         /Qmtz9UHdKzRgCu5PUOy8vJK4SYMXOduihfY6QslzqG6MaGWbogUnhf1uLTg0oxf7pKi
         3PzhC1rqNJ4UVlWkkybyWLO64LjPL33M/QaI5mf9xuH++b4/Ba1ZfTQQh3AeRHzQubSR
         9DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784084517; x=1784689317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ8XxR+wtylpl+/xkqDI0BX56oI+EqOnmpPGTUlwx6U=;
        b=dmWGx/d+w8zVR2TS5cy4npwtwd4kla3LtC3c/Xdkg6ZQHwnccul21xVOyO7lDTCXQ7
         JtphAMXZVV8qmrPC6X6c6ug/xsZOZQQ+0hvRvkhGNDh+zxo1N+C/v0XOtbnMQe3hH83+
         TxrNSivS8yCPqpjWmDRbaLcaSPl4SCnnwUa8iIE+avgYI8gO7tkou4gLDkPF1OIaemg9
         fc6cRZynMNldQ5ocy1VvnmRbCp9AjXcU6Ofwkghk0NwgONTRjYOi3Sw535EHF7CU/lqt
         i1hVY80xLA2XQVqG67oP9b7IVGgZU0e+J5Y8EyA3y7DPAwiMIDMxIb9/lxQ8yqpDL2kO
         xpEw==
X-Forwarded-Encrypted: i=1; AHgh+RpBwShuUWaUYacZ2Rfve25DBTGITigpujQ0Pe1pthhk48XRMnOamjq27m90tK5ROtbWStpLoQXhqOIY@vger.kernel.org
X-Gm-Message-State: AOJu0YwKsk3mB+B9ZDwl9NZpUMu+PO8eaJcERJP/XSqsrV1j+8STZKhL
	pEiMjAPAhE+O3rZxGIGyDBXOUTrp/apuw0OgTpRDVDzhQyA5mnmtOzEoTweJhPVK6IvPQpIyok0
	uPfMm+qmXGWG/bOe/Xu1rPZsNK0G2Pec=
X-Gm-Gg: AfdE7ckTWvOakb4KATozMtw42j3PtlZup/r/LGVittwZdFOffdp2eXFaOsu54wW5R/w
	uDwbhLHbE5qzVJid/q93bVcQFat++ttMVmEl3idDXXTHkqRl8kqKAMCbRQtQ2UHIytLQ/pX2bPa
	q6H5m7k/hGqHtrMUAeAfy5kG6HDp9Te1cEYOPievDL8oM6Aiq7nLjnTaClwlyIafL5FraG8SJky
	fK1JGGc/eEI35q4Z/L10f5MYDV710bkGR4CyPoABgQvvCgDU6D3XLAljwNLEGbce6BBIZP5eAm1
	oUqbct173RuRvX2iPlZ7XsnIOzkn9vvjv7srhaq6IsZ9FY1JcOJ1pg==
X-Received: by 2002:a2e:a902:0:b0:39c:9aa0:799f with SMTP id
 38308e7fff4ca-39db6d92796mr2546101fa.33.1784084516752; Tue, 14 Jul 2026
 20:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
 <20260714214519.GA2851152-robh@kernel.org> <CADi83T6kdqo-x0bcCGspni_e6ysEY6sud1AmZ4-utveA0rpLQA@mail.gmail.com>
 <CAL_JsqKN0J_03_o8Na8-y=x7ny9g7vhSqa73XSu_d_D8P45dVw@mail.gmail.com>
In-Reply-To: <CAL_JsqKN0J_03_o8Na8-y=x7ny9g7vhSqa73XSu_d_D8P45dVw@mail.gmail.com>
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Date: Tue, 14 Jul 2026 22:01:44 -0500
X-Gm-Features: AUfX_mzpMEopUQE7TosDVBxiXPh_gfwtw_3Imj28x21OlNZglehtbqTvg-XngPU
Message-ID: <CADi83T6uU+L5+SxnZsHN8ejUZ1JfQxv01q92wF_y6MbVsOu=wg@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-remoteproc@vger.kernel.org, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 9:29=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Jul 14, 2026 at 5:50=E2=80=AFPM Alexandru Gagniuc <mr.nuke.me@gma=
il.com> wrote:
> >
> > Hi Rob
> >
> >
> > On Tue, Jul 14, 2026, 17:45 Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Fri, Jul 10, 2026 at 01:07:04PM -0500, Bjorn Andersson wrote:
> >> >
> >> > On Thu, 08 Jan 2026 22:33:35 -0600, Alexandru Gagniuc wrote:
> >> > > Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_=
wcss
> >> > > driver. This firmware is usually used to run ath11k firmware and e=
nable
> >> > > wifi with chips such as QCN5024.
> >> > >
> >> > > When submitting v1, I learned that the firmware can also be loaded=
 by
> >> > > the trustzone firmware. Since TZ is not shipped with the kernel, i=
t
> >> > > makes sense to have the option of a native init sequence, as not a=
ll
> >> > > devices come with the latest TZ firmware.
> >> > >
> >> > > [...]
> >> >
> >> > Applied, thanks!
> >> >
> >> > [1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struc=
t
> >> >       commit: 22afc6163c0c7a144d24a09352b87719d64d5f65
> >> > [2/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT =
schema
> >> >       commit: 2a756ac4d98efc97503629fcaddb2e7c46255824
> >> > [4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
> >> >       commit: bc33b5b5e23a389e660c3d696cd2e043fdf33ef7
> >>
> >> Why is a 6 month old patchset with reported errors being applied?
> >> Anyways, linux-next is now broken. Please fix.
> >
> >
> > I must have missed the error reports. Can you please point me in the ri=
ght direction? I'll get on this ASAP.
>
> "make dt_binding_check" on linux-next.

I see the issue:

      DTC [C] Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcs=
s-pil.example.dtb
    Lexical error:
Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.=
dts:49.28-51
Unexpected 'GCC_ANOC_WCSS_AXI_M_CLK'
    ...

This is easily fixed by applying PATCH 3/9 of this series ("dt-bindings:
clock: gcc-ipq9574: add wcss remoteproc clocks") [1]. It defines the clocks
used in the yaml example, which resolves the issues. `make dt_binding_check=
`
is clean afterwards.

Would you like me to resubmit this patch for linux-next?

Alex

[1] lkml.org/lkml/2026/1/8/2278


> Rob
