Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AC62D0606
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781500687; cv=pass; b=bM9Ph6tj9dPNUQizbDxk4dsbbLN+cZOlVpzoYCV/rHiDEnAF6mxIoblIp5Uwp+dy9JgunijHFTHql7h9SHJJLfBT0su/jifbbREhvJDfEjfNKe41pkZJlQEcSRsF3lPQPBn+0MrPHhl4Pd86hMahPvcobZgyIPYAbku+nFEVoCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781500687; c=relaxed/simple;
	bh=Q5OPxhP+CspScS1nLYEDe5+mVuYgOaCZiuJROYkIGgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQZeRnf4985mKJ6gxpkAWr2NK8VCUzdU3cq6WNeoajZ/YCuaFC/TIHYpFDwa2QH/dmeiwqOS4upZt8oAfhkJ7FeWLJZ6cmz8d2Y3RjTCQPSU2ZEAG/915MBsOBq07xU6pE4G7vaRsOsFtoK66ti2QytxIXWdl9ah6lINTIIqTlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gI8aEOLD; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gI8aEOLD"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso910205a12.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781500686; cv=none;
        d=google.com; s=arc-20240605;
        b=WJubI77JxZCCjPQr63f0zHxbx+1O63pkkxTNXLMrJDGOrFyL6s/zlJMWlfRuF/rxCv
         sOw/ZQnG9RwsjCuq9KV+EGxse2TiZMLhII00zUAIG3ttiq9tBBoxYvTPYBks7Ban6iem
         pAZfv1xdPldFSZ8sxEWDZ3hEYhzuFoVkXY1P0TrVLAKP4nIwn/8ic0S4DO4OH3T8mtkO
         o2OvBY2TTUunzeRJDXZXQRcLMhrF0Zlci5r951FiTtENrNt3Vt36fQIZknR4rLkUGfLn
         Z/dXNELc1uv4rs4jSvoCdGHkMjXe7uMGNHjBVAvPKvozF3CyW5G+ixtMnpkOOUaPQIoe
         Nc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u5Z+dpuey7Egy9wZLQhya1KqlCVIFqeHwt0VDEyuTm4=;
        fh=xPXNu1sncdr8rs55SH7YPhEAih41+H9sDg9M1YaWF/A=;
        b=gXi8h7M9J+hmwg6KJu1WdAy+C+6VgzZVexjS/OnMxMTDB4uxwMrXxup5nZBZRXI1Nq
         qPaNJuYyYPcunHhiqyc3/WL3GrOy9zbRLLjoFBXcaOb1WPLqzWShk7rvuO/sJGrT+xJj
         aAqPYw1eaKIZCnnzadT3WboDh4e1uyg2S4LU7YUsp3cDX8R4q8rQu2T+CD07z0MGh8Cw
         Pm3W6uV6/ngIwQXRKwot2SCtEA3TZqmrKM2xptADKB9IZyaLPZTeFv948hbMwrw1P/rO
         z7Qu4rPcAfuPs3GVzBhWR2QI0GLXF3F99GybsA/sLJ1h5uENvcUYxmH2eMUxKWKm4a+l
         70OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781500686; x=1782105486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5Z+dpuey7Egy9wZLQhya1KqlCVIFqeHwt0VDEyuTm4=;
        b=gI8aEOLDJHxr3vddWqxcSkPia4NVb0rgcMWjJckcfXgs9JMMdHuRPmGgdgXgcE+gEM
         fSOCjCnAZlp4chumWjLUpFFkPcmhvU5Dm6y9YH0heT1nAZb1D51RZfWQHDopB5T4XDF/
         EjdZYc5kP/9xfRpZNxAOvLpPCUwpSI+yS4uFPxIVBTsLlSeugQl1ILJnsJNG9/+kr4jL
         MMBgdTch0V/RKzed82CLFeG+DAjDaKsc8m6QYIwiJ/e4XWYsIQ8dbmTt86ddQVJipFsz
         ZMtoqzab4YL3pBTbtUWDz/dNuY15NJIXRfo4tUaGbwma5NjC3g9bS5lfxNaUIGCAS4IK
         RoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781500686; x=1782105486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5Z+dpuey7Egy9wZLQhya1KqlCVIFqeHwt0VDEyuTm4=;
        b=MjMIcBWWKY4mibdQgkKrwtgrAY6oJ+2BKyMOEr+9joIF7eCtm/2mNKnr73mfuZh0YC
         q84DCLzoyvQe3AEWxXMcZP7IR5gEqDhwHCBONMVhhGtFuRYiVnqhS2mPPpIQ9Gy2WkeT
         eqRoYNOysGH8rIkXiZcFRugYdAU7jXZFl2CtO/apnb7NkCffoe4P0XrzbfgJFY0dEFmh
         7ns3YkMTHEbnW8BR1nJfT8mrH1PrMYpO6+7CbwUYj55aWqe23La+IA+P4AUCq+deBEr5
         p1harN014bRtlQKvA5gDf/npggm7jJv5BTrWeCFwZpJ8xKRR554OycO/w2PNAw07uksX
         i2tg==
X-Forwarded-Encrypted: i=1; AFNElJ/wPGmBc+jY653qBT+GFSQQvxl+FCdhsMwt7h/lUbDfUrHg4iBkS/hwMN9WKmIRLElyAK8C6J6DJlCw@vger.kernel.org
X-Gm-Message-State: AOJu0YxHa9Cyik4UPabbHkeWXD3Arl0K31+FL4UreQiqatAROK5YxULa
	xIVNEPZyagum4vjUwm//HrEFvrNby2yJtMhoN5qOB3Ixt+5ps4PXKfnype5CEx9Z0d3LICXRiN6
	2f3LEifxhn/sZUQNw+j/wQ8/g80WoAOc=
X-Gm-Gg: Acq92OEP0hnGdHpf2eI3TtP1Vb4N3nn7ly85BYyszKLhHm2K+Fuwuz5ni/ESFjferlf
	62rB+Cwns2a5krcRqLR9XL7y+zlwMGnbHvaSXoPQbOr1sG4qNdxK6va0qbRUoNSAlQLpcc9DNPr
	eenNT/TTGaBgjWrCYBwNu6XluEulfwnje/312HccRqLLC+IG3iEr4R7dy6MFrzrRWz1lihV+r5k
	ID26EkBwUS7UgrKrWYs3ct1xHqLPifjS37zIR+MAXo/pXT1qcCd7V7QW7zzMK8LcMcUYnxFGgw0
	dtN+fQF5fuIGnTH66kKNOEaJSS7M8CHriTSzJw==
X-Received: by 2002:a05:6a20:d43:b0:3b2:a8cd:ef4e with SMTP id
 adf61e73a8af0-3b783f23b40mr15009348637.28.1781500685831; Sun, 14 Jun 2026
 22:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
 <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
 <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
 <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com>
 <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
 <CAABR9nFoLrYTUqRr0__n33EZ9Y+YfM=RxAMsx2EFnDWxHa4k3g@mail.gmail.com>
 <CAABR9nHtihP+JW1WcaKpw8470Y25LvZgzNqSZaU09u9F=2K5Ww@mail.gmail.com> <CAABR9nEgE=jGTSS7snPxyRDgRj6qiFDDkbm0MBM40RpLy_nESQ@mail.gmail.com>
In-Reply-To: <CAABR9nEgE=jGTSS7snPxyRDgRj6qiFDDkbm0MBM40RpLy_nESQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 15 Jun 2026 12:17:54 +0700
X-Gm-Features: AVVi8Cfvt5cdb-6_WYt2gRmdURKt0pynWpaJM-czjNHwMc5_DptuTE2uMt0yVH0
Message-ID: <CAABR9nFUGY78TxN6yT92a=h+Xe3QQFTKqk0-LFzNExqGOOKK3w@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear all,

Sorry for sending two additional emails regarding FSIA. They were not
in HTML format and therefore were rejected by the mailing list.
To avoid further confusion, I would like to summarize my findings here
and also include some additional observations regarding FSIB.

1. Regarding FSIA

The 12.288 MHz oscillator (OSC X8) only provides a reference/system
clock and does not by itself determine whether the FSI operates in
Master or Slave mode.
The Master/Slave relationship is determined by which device drives the
BCLK and LRCLK signals. Therefore, assuming that the current MCLK
source remains valid,
switching the FSI to Master mode would primarily require rerouting
BCLK and LRCLK, together with the corresponding software configuration
changes.
Alternatively, the codec MCLK could also be sourced directly from the
FSI MCLK output by rerouting the MCLK connection.
In that configuration, the FSI would provide all audio clocks (MCLK,
BCLK, and LRCLK) and operate as the clock master.

2. Regarding FSIB

I could not find any FSIB-related connections in the available
Armadillo board schematic. The schematic only shows FSIA.
Therefore, there appear to be two possible explanations:

 1. The available hardware design documentation is incomplete, or

 2. The connection between FSIB and HDMI is implemented internally
inside the SoC,
    so the FSIB signals are not exposed in the board schematic.

Personally, I believe the second explanation is more likely.
At present, the only signal related to FSIB that I can identify in the
schematic is FSIACK, which is shared between FSIA and FSIB.
I cannot find any of the other FSIB signals. In addition, after
tracing the Linux 4.2 source code, I found that for the FSIB-to-HDMI
path,
only one FSIB-related pin is configured:  ' fsib_mclk_in '
Furthermore, when the audio stream is started and the clock rate is
configured, the driver calls: fsi_clk_set_rate_cpg() rather than
the external clock configuration function (fsi_clk_set_rate_external()).

At the moment, I have not investigated the HDMI subsystem in depth,
and I do not know how the internal connection between HDMI
and FSIB is implemented inside the SoC. In addition, the original HDMI
driver source code has already been removed, so HDMI is not supported.
Currently, FSIB is not ready for testing on the current kernel.
As I also mentioned in the cover letter:
>   - FSI master mode is currently compile-tested only. Full verification
>     requires a dedicated HDMI driver (FSIB) or hardware modifications
>     (resoldering board resistors) (FSIA).


3. Regarding Geert's question

> I have one more general question.
> arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts configures
> audio for FSI (fsia_pins), but does not fill in a clock-frequency
> in fsiack_clk.  Instead, it fills in 12.288 MHz in fsibck_clk, while
> the schematics call it FSIACK.
> Apparently the FSIACK pin is shared with FSIBCK on R-Mobile A1, so
> which function is used depends on pin control.  However, the DTS does
> not perform any pin configuration for this pin?
>

Based on the current schematic and source code analysis, I think that
if we continue to support FSIB for this use case,
the DTS should explicitly configure the FSIB clock and pinmux, for example:

&fsibck_clk {
        clock-frequency = <12288000>;
};

fsia_pins: sounda {
        groups = "fsia_sclk_in",
                 "fsia_mclk_out",
                 "fsia_data_in_1",
                 "fsia_data_out_0";
        function = "fsia";
};

+ fsib_pins: soundb {
+       groups = "fsib_mclk_in";
+       function = "fsib";
+ };

This configuration appears to match the current resistor population
shown in the schematic:
FSIA operates in Slave mode & FSIB operates in Master mode.
However, this conclusion is based only on the currently available
schematic and source code analysis.
Additional hardware documentation would be helpful to better
understand the internal HDMI/FSIB clock architecture and to confirm
this assumption.

Best regards,
Phuc
