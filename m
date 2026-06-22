Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE3C3B42E8
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135047; cv=none; b=mESLKE1zv4aw3skn7WEuZUEFRChpYLWL00WhtL/GMy473afrLOFXMmgiozB25y/AC+1XhOME8TDsGcTBUQ1RL3d0s7NZt+KB4cjFJRmMrQV3cqA8WpjCdSL4e8tWRRtgFmLQkHbvw7H0R73tJOQCiWOW35c6R0NQnRsMmIL7yC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135047; c=relaxed/simple;
	bh=BgJ1ZxGlN3gL51u/jblEWZAtpcv/F6kI3bh+XoERS7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYQe7uPG4k4GnIheBARzDbnOQPBQu9VQq48IgOUD3k44YE8HcCz1kqnn/ruvWZoBbM0s6nv5Ix7luFzmlEVs8g6VfVV9rUsXsma766YWT+u18hTaIfaMWDRVSxyMRoMPE3R/G+gI2IQackVC1O1TZq/TI+qz7fUSL8B2EHWtW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c0be5e548a4so355884566b.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135039; x=1782739839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GuTM79i7YCtTZTiRjLyW48bgm8MVBHEx0azWn0cnMM=;
        b=Odtdpnx4fALNZPuF3QS0ppNHkrkbwW/poT+YP1NDzfLtbWWiW8WAFyV/nJC0kLWPLR
         qAMrCEyTdrHU91+Sj9hIqexpqaKCvqXh65IHzjuGGf0qnc5bPPqXJDJAur5bWRTe0/Lz
         OXsIJ+Fzf2lDxf14FgemGs2ow4kKTzXDq+Rr6wYChfTIJHd6RNyYLhM9sgSEs1ZLzwzK
         CuBlZw5Hc59PAZneax5W7DasSvENCpZ8l6CsG7RN8IzNEjKj+Wf6dVoqCtYikMkykD+G
         KDTv495hw7GV50OeId57npgVi05S6V6ideOk1I1nEeLr6J0DiFAqh8TpeHJwrXZdcBI5
         Zzsg==
X-Forwarded-Encrypted: i=1; AFNElJ/mNlbJKjEB3AuohVeJmXMI0xcGmb5vxIlBzxUnag96Z/zlcbwmW2R2oIbxoVXB8hoa584pEctazcES@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4kJ7RMz08cup48u2SIu+8mXx6Ba/d9cQfzppDicMFT1q4gHo0
	QYx8eej0VbTdrW7AIke4xN72mWFzcRw4pWCU2Do6S75n7jFb4M0zzfN1waDTsTy2UWM=
X-Gm-Gg: AfdE7cn142eBHsTSwCCDYr8QssSVIvPNvD59mWedzn4PySuOvJ/2Eokgyr1N+9FmQJZ
	Y4zOIHjeAE7Rg/6wnKlfZGyoVioUyY/KYwmrMA/ULoeYdMgtZCzQpePD3kGv8v4uNby20zC1nP6
	5scYB11yByy0c7EY04jAqvaoZTTsheCL2j7mj6aM1EQFoMI7tESUzijpmNXCL3DLeQRy4QGAgSV
	AC5vjwIeaIM4895sZuu21s+RAJk1WDlrBjAuFY1GPR9qI/hTSENiLKwod58U9C8s9j/j/fmTyYu
	0YJ8+HK5pfB6hRF8F6J7xnoLlXNchqzsIX3KeQUPQvw/Ra72fPKptMQ6+I93OSBn2Q9eFFTrpeC
	R9YIY+0c/MFCtuODovkWbBsVQz+fLFSrtdqG7P3E4NoaxJW/C8DK9rZUuM9FYt8/7Dsh+OBKMZI
	tHdbxHkylJp9esbfYkNP4k2CZJRWhfvqAXcroXBgHq2XXiM68yOQ==
X-Received: by 2002:a17:906:6a28:b0:beb:d67:81e9 with SMTP id a640c23a62f3a-c097ae64150mr777736666b.19.1782135038939;
        Mon, 22 Jun 2026 06:30:38 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60bbf2b3sm359223266b.39.2026.06.22.06.30.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:30:37 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so7493343a12.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:30:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+3q5thyXFUCclbCp32itJxB49TwYWTZ7DaDitecYmCraSHPaZCO8ndTN885YMUrxCv2tpPIiBbXyrz@vger.kernel.org
X-Received: by 2002:a05:6402:3997:b0:697:8365:7e63 with SMTP id
 4fb4d7f45d1cf-69783658098mr3569202a12.7.1782135035601; Mon, 22 Jun 2026
 06:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com> <20260619083951.3777556-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260619083951.3777556-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:30:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVE+dXU0Y9-7HAKD=UVdupn=A9u-h_78t53jDfRzK+NwA@mail.gmail.com>
X-Gm-Features: AVVi8CdtJV4mV-ZNF2QvOQ3l_ngUyw6ocAvz7ylDmAMlp2cVch2OlkPJQViSt1Q
Message-ID: <CAMuHMdVE+dXU0Y9-7HAKD=UVdupn=A9u-h_78t53jDfRzK+NwA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] arm64: dts: renesas: r9a09g047e57-smarc: add
 DA7212 audio codec support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 10:41, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/G3E SMARC board has a DA7212 audio codec connected via I2C1 for
> sound input/output using SSI3/SSI4 where:
>
>  - The codec receives its master clock from the Versa3 clock
>    generator present on the SoM
>  - SSI4 shares clock pins with SSI3 to provide a separate data
>    line for full-duplex audio capture.
>
> Enable audio support on RZ/G3E SMARC2 EVK boards with a DA7212 audio codec.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v6: No changes.
> v5:
>  - Drop the unnecessary #address-cells / #size-cells from the
>    codec@1a node; the port child has no unit address or reg, and the
>    da7212 binding sets unevaluatedProperties: false.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
