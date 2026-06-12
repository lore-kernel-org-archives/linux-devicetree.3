Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6C0364943
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268854; cv=pass; b=Tmq5xTuw1QTxuOi1+PoC0/b5e350zIov5H/cmmPcoNCp1e6emqaUqikfHtY3uUuFPJOsWaGzjidpF6NXFzpCQha4PLo9l3+YwU960slbcxb7O1zqnhGh3w5NYQm1Xjmsf2uQUnqeo65zLhw9FoHPhvAngXakDL7AL8tcmnZtDxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268854; c=relaxed/simple;
	bh=+zmRZkf7AQ7PB9Kx8oHg2bM45aSk4u6jxmk4WYr/q54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkxbaZxKotbPFaThcRqcWos+MK5C2OBpi1aapy00zsnw81mnmu4t44QEQmSjWHGfxMAI9C1CRH6tbZiPT8OMI0zG79TYXOtFT/mEryzrlhb4cJt4ylFKYGe7UGpxIFhjXzDVMM9KkbKVtORs6VHRdxHMKVS7i5qiVXLl+1/2SgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fo6DMMWt; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fo6DMMWt"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so7612745ad.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 05:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781268852; cv=none;
        d=google.com; s=arc-20240605;
        b=BUq2O7Idrg7pwANFA19rp4Uq+Hl21n9lZLr26irfKYZjcdVnvavSDFHKXdqcTAlYsO
         diTsPR6D0kEb9EKOw1tx7OmSyxGZ+sXzOgAuB4KyeKw8cCEmgjFtGyxfhRagnqai2htq
         4G83pzNWgHjeEBDMHjOknO4D6hxMf7L51McUekmdRc2SlgVCe7G9NILz5+MaHsouCan3
         NX90+ovWfSTzp6frIrc0ySZxREMSBcrB5cR3Gt3h1qk191XA64qWe1vz0iae0DfGCd7P
         ngGgJAeGUaNSWQXf+nlO0gPdx0USdI3KOxbeQgTvROXSyooGrvc1ej2NLvDnlKoM0VYv
         zbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vMiH2ZEz4WyIiZ3v/uym+XH8AqV96aclIybRlnrRB0o=;
        fh=leeA0DNwI4BbFJage2iApqQ5meFCO5eKTsPR61Uk/C4=;
        b=WcXngkw64R+EjASyDTzeJBhqgLc8QSk6FzqPAIi8VOIs5kzHCtcTHf+xBAHaJ4Mf80
         Ij3HsH25MwxzjUZq5Qh5zDvCG+dNng3sjE/j4QLzkXWj+JLlALNfKvThU5fkkm2blGJp
         j36VFeSNc1Ge4KOXFRJQxUyfw9W5kn8m2FlJhJefLulc6bCBaoEfuXP0ZwlFKIz+LFIP
         Yg2EiciKVwyVNXLtjBvTGbFD9//FWTxOuNt+hej4PaGfdHHGJaNWHUhnLpci6F7NCn8J
         DgMl4eU2EDJ2u7LiiOloLFFw4iRLbnDeBAY6rWdJVMGtX9LwJhwnf89+kRDOiWs6Mu+E
         iwQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781268852; x=1781873652; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vMiH2ZEz4WyIiZ3v/uym+XH8AqV96aclIybRlnrRB0o=;
        b=Fo6DMMWtccis7AzK+idHPXi4Mn2R7/e9J44Wr9w3/C9djLCwS7iNO+Z+INJPkbX/gZ
         /dkuGTvLBRE2pyEll2Qr3u+LQ6me+imfOltgglHfbaE6mboBV40RYJBeGqLj+Gsld0JL
         4D9kcftw9ftVpHzxKkSoXYCUhxneL4h6UU2QwYvhSEeSDuSpDIih685eO7kdZ95lfgvO
         P6sXzuE+L15g9X0phPRvDzZqJgrpjr2AdvvenW1uMS73bW6C0XXYbwA999eX83TzsUjc
         RJIwCp2N/CdK9d5Tv0XFfgwgU8Bz4AgWQHJzReDoQ0CvJO3/5gIgLtl6fJaU5ep2yp3p
         MptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268852; x=1781873652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMiH2ZEz4WyIiZ3v/uym+XH8AqV96aclIybRlnrRB0o=;
        b=RVlnwWwkAkGYTBbMOFaau61nt0+Bo+MbHiWFRoIOefSaPiKk8i1e9llqvPx/+m+kY/
         I7O2PfdwF/Fei8ldb8QqKMNAyYO+kFFCKq9sUIJ7WsreCIVLT+sBlm5CvB9n4379zby+
         gH8qtzdRjJEAX44qjt4jt4tPKT+NODrEY1CIWtQFh2H6HFnB9wl0CdDWrY9iw02uP+q9
         CIHuFbSLRAWhNONAHnyv2H6mppX6XA3xVeEGzLiaNFkbcO0SSZ3yiVSI2PfFibcpORRb
         PQ1LW3x9LS71UHYV/fO4Zndbkc9oAe2k/1mwhgVsawu/j8XRkr2VY6hFbigQyFti3w/P
         uIdw==
X-Forwarded-Encrypted: i=1; AFNElJ+5BA7H53n8ZXB4suwuNSux8yxZfKozD37HtXMteJ7uRDbyIlrA+SaQQc8UQf6zbmW47gIfOIjTKJt0@vger.kernel.org
X-Gm-Message-State: AOJu0YzF5YYxiRjsKmRqlpUHXRp/mhNS+UVgt40FuFtIPyWsAx247xff
	BUEMFCsVIV9ukwHb/RZpqvIV6iiFxrmx0mUgw4AJxfF6vK8i3FtYq+qGBnBZNUpoJiNInzOHRQS
	AxEgkkFCji5CCfzcpmu3oGRMI7VRMZDg=
X-Gm-Gg: Acq92OHdeZJKl2PS7whTWsmAi5wyUtHS3v4utD3z3LDffNADAqS5nARGmU8AB6vTvYO
	N4FLaL9unoaRATASFYbUWpBb5OPZHvNd/ptB5MNv1qk+7Ejz8k7ehxoa+cRST5hdLuqnJ5GKjmd
	14SLUCAi0pikBcFRvpCbDOuWYGMoYTSdnNXpzpDKa0ZCN2ThT80FHdjBMalREusxxddQ5P37CRY
	GWyDJURwbzasPXCB6WCKg7/nkjRum1d4ZhQmGzAS4Gkb5j2DJvjLkiBjNeOBuespppQAdqXi+6r
	Z85xmBgxsBiL1r7KDUt+wFlKzOQqnc76vtJ5Tw==
X-Received: by 2002:a17:902:ea07:b0:2b7:aa20:3c61 with SMTP id
 d9443c01a7336-2c4134ec603mr33662135ad.33.1781268852381; Fri, 12 Jun 2026
 05:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
 <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com> <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
In-Reply-To: <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 12 Jun 2026 19:54:01 +0700
X-Gm-Features: AVVi8CdLk4S96wYsYDBqrdC7z70oBdDD1ZwZrYm2niDWr8Nvh0Eb0jy8Rs6iHGo
Message-ID: <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,


>
> According to my schematics (RevA), R120 is not populated, but R250 is.
> So the 12.288 MHz clock is fed to both the FSIACK-pin of R-Mobile A1,
> and the MCLK-pin of the WM8978 codec.
> Which revision of the schematics and board do you have?
>

Oh, sorry, I misread it. You're right, mine is also Rev A, and R120 is
not populated, but R250 is.

>
> I haven't located R120 and R250 yet, so I don't know which
> configuration my board has.
>

Please flip the board over; these resistors are located on the bottom
side of the board rather than the top.
Other components like R123, R124, R139, and R227 are on the top side,
but they are only visible after removing the display.

>
> That information is found in the R-Mobile A1 docs (PORT11):
>
> Table 1.3 Pin Assignment (505-Pin BGA Package)
>     Ball No. / Pin Name / Multiplexed Pin Functions / GPIO
>     G3 / FSIACK / FSIACK/FSIBCK / PORT11
>
> Table 54.1 List of Multiplexed Pins
>     Pin Name / Function 0 / Function 1 / Function 2
>     FSIACK / PORT11 / FSIACK / FSIBCK
>

It would be helpful if there were a more detailed Armadillo schematic available.
The R-Mobile A1 documentation (PORT11) is generic and shared across
multiple boards,
so it does not necessarily reflect the exact wiring used on Armadillo.

I did look at the board support code and pin configuration some time
ago, and I also tested audio output over HDMI successfully.
As far as I remember, these pins can be configured as either inputs or
outputs. For example:

fsia_pins: sounda {
    groups = "fsia_sclk_in", "fsia_mclk_out",
         "fsia_data_in_1", "fsia_data_out_0";
    function = "fsia";
};

I'll take another look at it when I have some time next week.
At the moment I'm busy working on a few ASoC cleanup patches,
so I haven't had a chance to investigate this further.

Best regards,
Phuc
