Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794353851;
	b=Y9udtrunSyNu2PpCuksmDCRd4UJDyu8uw1F1wKZqhu3FFtgt3GGv2gni37K0l/JwSBu5
	 VJPHldq9B//1Ijw/U3Logm2a6mLxbKna4dZe70UClYNcanJVw0VDKgqRFE3c7cgCe2tnz
	 IPWFJp20E/WgQrZv+IwL4DDs7mhsNf9YpULKwKhcDFShgfNu5ouKPbAAEIQ3KWzcZTECh
	 GcI8yTTGhj8ZoYNYW8FOzDW9b2SbJyDQAkCNp3/W77WWqbX2jBvrbUAbH6oeJNfjcfg/i
	 vO2+XozC7maMm6iV8aRuaREXGcKvr2ti67HFr+/U9FfybrEv6TLmjAFU4yk6yScALHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
	b=DvqYk4+kEEn9ShOKcXp1V1p/tEdWWZNYsMSJ9cUAndESWs/rS4/dHu+TzHkzoAr3Az/Y
	 6bUgnvnc1XqT8JIVyOyGEGWVPGuDALrdQG0GFuDMIJ8Xjss99ca0eLB9SAMLVSnXp67/t
	 IsHGt9h/Ciom3ixk8MKYW9535x+Q8UlyInXUVgc6Smumpj4xOCHn4Olik8bFCtrp32UjM
	 04JrnbwKr4yaOUFtn2IAq/zLp9Cc/xystLmDE7gLS5rFyAcmMGgK6lKxVJEy9utXzn78v
	 FS8cCSQRc1ZvPRfvmew9IhbGyQU7jmMXj/deLHF1YXi7adRcC/HJ8P37PV56FOHtcUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elQltWuO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD20606A326
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD20606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elQltWuO
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so3502527a12.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 15:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794353850; cv=none;
        d=google.com; s=arc-20260327;
        b=NYPh1cIKxRH7Etz0QwxT3+1IQGGCNKBWoWB+H3pwlaWHdHJI0jl0MfsLlE0iDSsLSZ
         CKrtyNmBOii7sXFASJjVIw9MLroxas3/LLPnmQcy1Cyz4x0enG6ajFiuoYANKsaOE+Dq
         GPr/UjRRJ3u/EtMTaQ+/d1uXzaMTtdp983D0z5Pdrpt5KS0e4hsan6DQ16B5wJW+mBBZ
         AwkCUz4KW1s3VO/YM8xG9jc0og0eA5UASAT1Upbno6qr4H4v/dD0K7ciptVQT3dIjz+K
         M0srr8UNiUjtkMNGPy+/v7B9f82pstxRukBfiNzKe8+6Xh6DgnRj/LeKIkIh69usVARc
         AE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
        fh=QdDOCD/ufoCK13TWxduPV2T1ljXawhxAzTCc/TKPffQ=;
        b=sxnNe4KJhdPvPFdtqh2bPnmGlC9gWNUZQs9lhAbF9pFHAcKeuBNS8tQdzwl00O6BmX
         6s9JJk5aG73jvsE6ExMcbouftQQaiirGu/my+nZdTG927K8L+VwGTrNlmovW7ByZE/xi
         SjqDiLPTAoEvdosRLE4xNOE3TbvdvNH+GldcTK+tXtVvnqVbXm9VMiFXTMCef4NouNyn
         ro+cbU82VPUwnTtQlhAHgLQCn6rmDcArNKygNj1zZiZcbiXfmU+/uF9rNkzoUJ77Yw/T
         NVPe1ufiVfwtg21XoaKB4bRb9pSerg1+eIt/6D9SM569+0yOrSeFQcalY3G0WpgzxExJ
         qhTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794353850; x=1794958650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
        b=elQltWuO/DkdGyaaLFYg0iABITYog+QbXRiK/p+gfA+oyGOiHjeAF+1qPdhV0er1z6
         19g2uFdXYKkYpF/n8Lo0CGEIrykr640l7VNsN9N+m/sZgVkvwKmQKCoxboYB5jX1S5o7
         nKm3+f2zmLDWFiaDmYao2vDAmaVxaGRm75JdGfHFgftaIHQsqBw7pnIHQU1eYzHWI+Zf
         MJp/WiosLChIPSTcgQ+ewBGDaKX9lFvg4TGCaQBU2lG0GZ9gYxBzzrFBglQZQSLwmtpM
         iZA68RQuU2bQHNTLXb6gPsxIfWvurVpdkBeLU5D44jSRmRIdPU9aoWCWrXJeTGm2rpg1
         gTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353850; x=1794958650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
        b=1zrPgHeBZRcuHBWAR/KLhuYymEaG5CN/PWCBx6zJrI/GFMgowcSGWdKZZmMgU3TAOe
         C/LKfSvowc0lt8tBo7gKIvPxuSMCveFXtm0n2SS5EuLkZELMNXsWsjFJLRAgnBNjoZhE
         F3QKLxCrSHO1BrABmDANp/jOzVehcQpvtwEVYgcQxBuAg3W1xEpUgRDnAdvmK3/roTHO
         9eqMhYdEx0f+/MRJ8iMDZCq9xYeNMaiNhg/Kyw+BuuZojUXDZOpeCISGT0IwnlMYhIEc
         E+yzWPbbR1GHnLEEQ5LtWuCl3LEYBCnVi/RFn9mWXWamHUNf0k//IJZn9LeQ3muCzFEm
         zegA==
X-Forwarded-Encrypted: i=1; AL+hErFeXVAaZzdm7DtFUBGNJ3Ve7WVJA+UXTfrJxY9H0mKIsm68z2rvsyXFNI5wN8XSx5YA9qY5mI/ZE67b@vger.kernel.org
X-Gm-Message-State: APuU4Z/dCsg7MfpcNs7YUyDdYJ9ZelgWrCNJOgkOdynqenSf+9pVKsik
	t0nzE7iHCVCyvw7OPoF6BqzmsFLbdPRbStffI+D4Ty7ABcXjOSCjRLumGwkWqlgdRvcuTrtmBtR
	U9oFJoM2P+iS3IikggCXQcvO2bzDt810=
X-Gm-Gg: AYBFou1KxAa5kC//11C7cZUbBCWpuLRhgE5tODvcxHBpCfpYk4Ewasx1akj2em7/L/1
	a6+Rw8y8aeos12VIRY9wnow+ILW6gEu+g/iyQVubMyg4BPQ8gMdwxuHXXNb8yzNs3GxzLktSGpl
	ZrQUhNhXC/6+QlNGaR7G+kIaMw+dusPPP6fD8gsKkvuoGCfPAirdo8cL10ZaBSh8/0hJ1Ciiv43
	v9VJwewzUSP4TMrIAllwjGtPISLgnGrrbaqS2lSiA0QnlAroBpXyu/k3kWLGBpxiE5g+1LHMMag
	XFCifdUkY37uab6ZyouBBX5bBy3y0PSbqOt/vzdqFk65jfSakab5RnnNbfuqfblxR/MeztBotBA
	zzVaCelTDIMqLblPEz9o1zVbpJEP7FPDbq9xi7zAJI6dxtKHY30mSm+IqvjqXMXQgQaReHw3UC4
	kPGlm9TF9zy+SAXx+uAtKe/5aDMB0N3resrvP8u6PLoI6h+e9i5tWhV1ICOB2SWMTBW3HN4yDZe
	6hGTUm5z3vJJy+JDuGEiVEvPYOmikKty22GDzFHN+ZPgyVDgg==
X-Received: by 2002:aa7:c609:0:b0:6ac:7d0c:2cb8 with SMTP id
 4fb4d7f45d1cf-6b7775eac3cmr391908a12.30.1794353849465; Tue, 10 Nov 2026
 15:37:29 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110013646.1582970-1-rosenp@gmail.com> <20261110013646.1582970-4-rosenp@gmail.com>
 <20261110-lean-pug-of-business-cbca5e@quoll>
In-Reply-To: <20261110-lean-pug-of-business-cbca5e@quoll>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 10 Nov 2026 15:37:18 -0800
X-Gm-Features: AclHuK-3dfP8GdD8w98u8UzvEILGcuTgL-XQqP_bC0ngHEJTsAE1kfgHk-4bdUE
Message-ID: <CAKxU2N9y_=m6Rkk86q38yZhK3E=M_OvYUs9uVMFEB_agrEcFig@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: ath79: add the UART1 clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Alban Bedel <albeu@free.fr>, Antony Pavlov <antonynpavlov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:25=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Nov 09, 2026 at 05:36:43PM -0800, Rosen Penev wrote:
> > AR934x has a second, high speed UART that is compatible with the
> > qca,ar9330-uart one and can run from a 100 MHz clock instead of the
> > reference clock. Add an ID for its clock.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  include/dt-bindings/clock/ath79-clk.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-binding=
s/clock/ath79-clk.h
> > index eec8f399b9e6..f8a98e4d206d 100644
> > --- a/include/dt-bindings/clock/ath79-clk.h
> > +++ b/include/dt-bindings/clock/ath79-clk.h
> > @@ -11,7 +11,8 @@
> >  #define ATH79_CLK_AHB                2
> >  #define ATH79_CLK_REF                3
> >  #define ATH79_CLK_MDIO               4
> > +#define ATH79_CLK_UART1              5
> >
> > -#define ATH79_CLK_END                5
> > +#define ATH79_CLK_END                6
>
> You cannot change that, that's fixed ABI.
There are commits like 2f4788cca881 that remove CLK_END. I agree with
those commits. This define should not be here.
>
> Best regards,
> Krzysztof
>
