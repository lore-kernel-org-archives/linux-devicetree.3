Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B14375ABD
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141744; cv=pass; b=VQqwAR7PXkCM7TPAdXnMVE/INRGcAGzrk0gIqB6KIMcgiwB3Qz9TCcUH9mRfyrQdQR6kfUfnhJtX/FGfnuK50mV8nONU6h/zDkPg0kMTADs8lB4sfckDx/NAmXutgcEsnI1J7ZUyoovijzsCeEIIivyO7fNQv2pO/I3RoQoEzcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141744; c=relaxed/simple;
	bh=e1tTuZMCTbr9WABeIO5Ex8NGWc2k4NezfMpqJ50E/LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ns8FdyO1ttOk/+k9uuvYMJoxkMSrIbOM6V4JiweM124WjxQFk1jezphtW+fanA93RGZ/VB93PFtYsssPH1X49G+o6a2y75R/AhY5yVNu9HqiuJ6qQT0wEO14Qpv1Npv7GNVMdY1zse1JMVmCpOf49H0VR6mlE/DwCC+baneRiQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF0KIOYR; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF0KIOYR"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4631679f204so2748858f8f.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782141741; cv=none;
        d=google.com; s=arc-20240605;
        b=XInEy2/FNXn3lCqn9xcEWna9x71G733fscaVuEIjv6Pnw/0FYRv7qzySAE1plaMur/
         lDvbtLE6chddVRRCqvpYvWBzHS/oRqaIZzfx+wBATyq2vMnphZF47gRreU4+lIMmAeyv
         AOR/KErXZHE7HNIDtndlFuASYfAPe4Y6y3rKSLv+ZgsvK/tcG1LVDjrnnOHvlZwslhwW
         p8rXF6AGYM5ox/pWZbcnp+1PcIXrIOqy284oc5CgQKqUTP0sY8e7s3MiK8SuWm/TY2S1
         PSFTFYhlOH+Z4Xec5rVjo0Adyt5a/uMcskhbXGUt7TwilLq5WSYjft6CouT8B/+wEbyU
         Hx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lo0ecSS+JczZF1BXqWiZUjkJXIHs6t6G/13n94HMxN0=;
        fh=w7a3qS7Vznt4LpDFQij1NreO0uKncrDFkvv+qHJf8lc=;
        b=bUmxRrZPa6OGnHi/d3eLKmZK24K2Jx7UHEBGnJVIdz7fQcP64EzJYA0tAuqDjUIC+V
         RL7KxReTphgTdVN7zuMhWju4Y1L8Gil1lCijLGOVwQSDmKrj8+BR3eEbjrQkNYyKUjLn
         D95f9O/LeDfciZ4K6pNBkLTZxE04cV0YyfUE6Z+7ciI/JvqlZrUuwZuTw5hZkIvTIP4y
         dsGvykH6FyPL+Cb7A2pWOA5Vf5v8lVO0fH4E/51coTKXSHZNk7rRns3O82wQzFa8ogb/
         KPP4GOg3aHrI9IYvRf1Acw4BPpR+0CcAtC/KFYTCfLl0uB9f4m304hUFE+oP4hS0lY5R
         4EnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782141741; x=1782746541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lo0ecSS+JczZF1BXqWiZUjkJXIHs6t6G/13n94HMxN0=;
        b=ZF0KIOYRnIfgfUq3F7UiMUa0nz2rdPFiVNZRhgMKR3+rdzkt5DQcRyH4ZYLY5Equ+a
         Nreaoxhg9PLqYeMCfuq47KG+RtokqgAUjCaDUKy1v0fbBl1aDfhTLDaD03uVn1KRY+dG
         hcfzThTdGTi5UWl8ldvYE5ZMc+tMjjGkIRKE//Wn3VpapygIdEPhiLluLHilLW0Vft8s
         kKfBOt+PbAXH1/9/s1kH6JXmrRcKsUMrk5p8d+Eap1XpsLhLpByyFppAxqmb9fUwNmiy
         exnP3SXg6fRb739L78MAKGyyVTJYDCugKJ4Q74JKMIxPWn1cSc0UvmaxAyXJGqNngK0q
         NKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141741; x=1782746541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lo0ecSS+JczZF1BXqWiZUjkJXIHs6t6G/13n94HMxN0=;
        b=lry3E7j7cDvPDysOuPu4ZlbUnxz/29U3X/ZkohnmSTLGtnkK2dWBOYTRxH4hI1XTbM
         brThokzHZX+oU2jBgJB7XxEkTSHI2pweMjCa8dzdjDDlsoAtbWMhzaqsq/6UiBY/VWmz
         GZcTraKtbKWEWOt1d/DYceesLMWdeUxbSV0F+rfSWmJf2x/P7ho6XUhJrtve79Z/7koE
         kjczxRImU159tyvR4pKQh0soknpPuTYPc+pUiN9MBUqMM6Nf3Or6osKmWMISKQUACrVO
         NpNpndCacjRtG+zkQZUBAOZL0RY/fRkjxawk1BXRpGcNSNE3wmLVei59/mPRVClnmWI4
         bQdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2qNlwAqfhQMpzb0hE6oikaAdejmih1fm1yH3Tna024RnKBEYH9VkcY9aCpvUm++cuumUuG8F+ht7O@vger.kernel.org
X-Gm-Message-State: AOJu0YwXp/FiQTtqxETcqG3vvDfJ8n3hAv7HVFJsBUEofaySn72Y/olj
	0yBt4HV0e+w8KIKovKjzysc5/Y8cGv/1ehOSAsY6+ovLHC7vdD7LrMW33nqNZplWlNNDZZ1E1Vy
	FK98MwnIQc3GjSlF+Vt8ZY6Us6TPYncs=
X-Gm-Gg: AfdE7cneyGyGqRhh3b289NbLs5cdgAgVXb2ipXxIvdBcHlQcVEPLdFh23yVmdU1ydV8
	MezbNcKgSp8j4YRGePI1b7zDeFU9s3LxxQenytXi65F9cydaooNIbqUfef/+dHriNlIYeAe5+x3
	YkMrOh51XbzG0CimEUjxI8Vq0Q+OP2AZZZf68E5Jb6fmUhTKcOiYtRVGZbkm3IeqzPuPFmT8qtY
	nU78jN2Xjd8rId5v2I1MQXJuubW597WXSMJ5S0WCjyjl4MCsvtGfITm64b8ukNKfH2a/PcilMmb
	/y+tMC4wI+aDuWX7jvBN/9D9GE3PmVmzw5kWZPu/axESBDKPg+CqtIiwug==
X-Received: by 2002:a05:600c:6989:b0:490:c1cb:48f4 with SMTP id
 5b1f17b1804b1-49240a3522amr210880715e9.12.1782141741254; Mon, 22 Jun 2026
 08:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260618181949.3036280-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXX-3ddkTmHGQOySZygRmvhnG6snk7uv4xmA8NjM9MsDw@mail.gmail.com>
In-Reply-To: <CAMuHMdXX-3ddkTmHGQOySZygRmvhnG6snk7uv4xmA8NjM9MsDw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 22 Jun 2026 16:21:54 +0100
X-Gm-Features: AVVi8CcDtgtBvFzbVVwQSngIAWRif_D-KM1kC97DgRsKUSf_oeP6yHr8E0ZMKtk
Message-ID: <CA+V-a8ucXgZkQDvdOc7fwVAeh8HLuj9d9z0toHJYeg8UBSKhYg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Jun 22, 2026 at 2:13=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the clock definitions and PLL logic required to supply the LCDC
> > (VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H displa=
y
> > subsystem depends on a dedicated PLL (PLL3) and a set of new derived
> > clocks.
> >
> > Introduce a new PLL clock type and implement rate recalculation,
> > programming and locking sequences for PLL3 using the RZ/T2H specific
> > divider and VCO limits. Add the corresponding muxes and divider entries=
,
> > expose the LCDC core clock, and register the LCDC module clock using th=
e
> > correct PCLK parent.
> >
> > This enables the RZ/T2H clock driver to generate the display pipeline
> > clocking tree needed by the DU and VSP-based composition engines, allow=
ing
> > upcoming display support to be integrated without duplicating CPG logic=
.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3->v4:
> > - Added RB tag from Geert.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v7.3.
>
> > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
>
> The issue pointed out by Sashiko (req->rate is unsigned long, i.e. can
> be larger than u32 on 64-bit) is valid, but I believe it can't happen
> in practice.  Still, would be good to fix it in a subsequent patch.
>
Agreed.

Cheers,
Prahakar
