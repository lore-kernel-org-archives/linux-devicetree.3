Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D5D3033F8
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781275138; cv=none; b=Jb6bVmuimdxTlv+PWLWe3sQcjKAuF8LHK11E3qZbH5alNa8SU45xXTX+tQI98D5Ur/nhhy0jH/mTxCN8AKg+qAHIPlUq0ksmPoVVL2IUfTVmx8AHfrw0X8ruNdqGJoC3xB+LlbIHqxFQGP/Eb/mpeMqpr2oaLLtOn/iWK5gKZL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781275138; c=relaxed/simple;
	bh=hA3EQ6NGh82+AwwxLF9pQfeChp6zhM8Sbh2F0J21T9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+0bhovULHcRUu64fUjj0G5kMNnsrmQwF9xB95TUHR4dFZZBOeyjGSVwlkPjS+NSDJ58wz4vanhR+kT+bWPdGSsxBsRxhbi4/ZhejEWjeJM6i920Zwg59mDlvcVD6PBh/pb4LPLAKhGbbXOQgmVFEn8n5ClyaqTTUljySasMhnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bec423a5265so198420866b.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781275135; x=1781879935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ctV4WQ6XNHzaDQh531DnVbwuxtW2dAJDIPTs6QoUPY=;
        b=l30DPs6n4Lke8ZgPBSjQaxuq45aYXDEpJDizf9BHMWV8UNYabVXk4Jm+y5YBcBQ13/
         217CB8O8V40aGfmf7gMLUySoS4h94s7msOY0fnzz2lv5v7AT4QjXDPX8viPu08FsGZYI
         pIQ4nbV8eyBGhsqwOr6VRCLRdf9YK3XXN9GrGibjg6XRfRs7LXh/9UcSp3IHrTMuz43e
         R0sI7Sa99Q66XDEa3ZDmJTRGhA/r+f4pI/ejuXaiaCG5POlGw87pvubJEJY2BaMXdDXN
         kMJdHFayen9unlBcdyYhjDK/3zXnmdv0wCuGyC65hgp9mX5el5wvFkylPMEYA+HEKgOc
         kJaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GUxVjoGb+o7atL3rNsM8lljVQe9xalV2jCLkGGt/UikIpC2g4IcANg4C/T851OD+R6mPw1slkPi18@vger.kernel.org
X-Gm-Message-State: AOJu0YxVi7e1y9UbPkR3BxRE5d24DQMoCCAB3LZmPsPYEWsmzfkIH0/R
	vMBkgYokrXgYvOHwsonEWpGLMznfyF6ZlMW1D0MLhLpay8ZbV6I048bPUe8m7WnWD/0=
X-Gm-Gg: Acq92OFKvMGl8aATFbHjeeTsRwF+7cVxGIdPX9N8IjmlE/G8YY4G1Vvdd2QopwU0KQ2
	brMkwWyQYBTExq4Y562q1yh1CZN997WkuSTTFFzDyVVek38Ml7IO25O2BhDNtlUl3mR1VD+ONz9
	1mKHgZymUB3S8JQu9E58CC4B71hYmnbE1uaK8aA/4SsZ1VgY+0kp92P/d5ibb4oNsbI6SVXn3Qt
	NfiU6IP0DIIE+xqdXXKYwt5Mp+ledS8MfE/SjzIuLTQhNMX4FIzWyDlSsGx+K4T7cVOif3DLZ9Y
	DUz36HIvcqEX+5pDgrd0iZdWwCQ1xdmCCIeq57IwVLH9xKQszv9S6sOms+TcADRvpX1OEle6cJ9
	fXmEY9VPddrjZlWYtKVJlfn5tJ0OEtCypd0NYczigzBhpufANWqAFeI6e5Pg2etypY8+/xtfOkf
	e8uI+MowcLCQfvNBWc8+fPuv3SkWhNKVt3TqFhOSuud13hEF3BxbEDCU+Rtd1OtKb9mn884No=
X-Received: by 2002:a17:907:266a:b0:bed:4f1f:bf9f with SMTP id a640c23a62f3a-bfe27e0abf3mr95343266b.5.1781275135080;
        Fri, 12 Jun 2026 07:38:55 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6df46sm112636766b.31.2026.06.12.07.38.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 07:38:54 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68f36e1663cso1783123a12.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:38:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/1z54hGr4mfvN5BpNH0lgrWEoUKiCfw4lsRAjOfAG9gpo6E79nqSbBo5uqfkPASas29kiTU4Kpy8ki@vger.kernel.org
X-Received: by 2002:a05:6402:3213:b0:691:afc9:f59c with SMTP id
 4fb4d7f45d1cf-693784eb0abmr1551827a12.1.1781274704600; Fri, 12 Jun 2026
 07:31:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
 <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
 <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com> <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com>
In-Reply-To: <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 16:31:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
X-Gm-Features: AVVi8CdbLq3XktR5SNY6UI5yuB8PMlJ_y93ZpORIxTU_5bqPrPMevfVX5_O9YCY
Message-ID: <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Phuc,

On Fri, 12 Jun 2026 at 14:54, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > According to my schematics (RevA), R120 is not populated, but R250 is.
> > So the 12.288 MHz clock is fed to both the FSIACK-pin of R-Mobile A1,
> > and the MCLK-pin of the WM8978 codec.
> > Which revision of the schematics and board do you have?
> >
>
> Oh, sorry, I misread it. You're right, mine is also Rev A, and R120 is
> not populated, but R250 is.
>
> > I haven't located R120 and R250 yet, so I don't know which
> > configuration my board has.
>
> Please flip the board over; these resistors are located on the bottom
> side of the board rather than the top.

Thanks, confirmed.
Have a nice weekend!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
