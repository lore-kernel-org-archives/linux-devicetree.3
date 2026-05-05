Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F124279F6
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976090; cv=pass; b=Ix7jXs4pLpjol543Nf0ioJxi3xJwwd2C3JFE0OdRnXKME+lfyVwdpHswzBbLzAIf9XVtCrAIvylSftYgPpPJOJuepDvNhPDwKhOUVFGHoRnIJce56U9oHM02HcqDdMmh18VXv1MKWUcbhTw3edqJxm8XxeHvgFhTq3zOa9PMT/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976090; c=relaxed/simple;
	bh=Oi6yT+ns9jMtyqJ27Q+gEhh8JyJgi0gFq61CQyPkBek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhXiLIKVb3O0P5/0f6z5zISx4/2y0h59cJ3ZWv/QIBFoUlbqF8bQBdNjlSrkeG3nrh0eHnZp0PgwKT58LRPG5JHYBa3icMsqXmIHDIYgFOJcc13X2M3+Q1oz8SIsXfuSqm9T6rfHDtgorliS4qx+6cF7nvQ4op8WMHM2MabeCWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDDLI+QD; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDDLI+QD"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba17c8cfacso19575455ad.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777976088; cv=none;
        d=google.com; s=arc-20240605;
        b=KUVhMnWJEmFy5huTZIb6+J/43az4tQvG96X11DYlwXVdLyauA/eCAlNcVO0usgSAjM
         YC0ibXQ9RuRvshNT7xm3bDcwG4Sp2BbaJ5TPCPl2Xhf+5s7nNBx7wpY0uZpug9XyKTYH
         pUiQLt0U2Gpwoah6/BU6HbUO1q7qjZsYzPEiZZehRvmDy3CxYwX/B3DPwF6xvGHamvi+
         dWBsi2lmPTy4ty7TJQMhl3y8gkOe/VnLItyTKWq8RqHadNDAagxgELHUElhWhQ1XJk42
         B4zIlGeGhm78B+2BqoX8fiQ8GMFvoiqprjbn7cT6bPY3PInq1IoE+Ur73OGx6ktttuwc
         n73Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDEeUuBDn3v8cioMLCv9LKMt7i+X6gzeWTWqo0RslfA=;
        fh=1apsE9i0U+TwOwyy2XgImXqeQaexgWd8pZqQ76nRQ48=;
        b=cy2mFvNBjfsJrJdLUxa6QnaXlvWvdrbdI0gc7FWtjcSajTW/MDhuCOXhCZqlRraIgg
         7YN6f4f/80Q8bf8eCudknc9iXraiOgxFXJ97b8rupa5/0+750yVBWPaB9I9l8vCgVEwW
         uhWW32SaOxiYbnqI9vC9sBZVL9xtuLz6rFgH2Y3G6QoqdxbKmhd7N1P1K92ybNA03jTL
         QLYOCoGb9RMXpCWXEg/byUIUWmm8PV8tRpzNJQSMgKRYrzj+4HjJqNcKzqJmcdUnsj3b
         V4wPzScKu4GHZftQ1Cqc9vKEi7l1vteNdJkxKfiD1fZejvQ9z3RohPxo854JZNN03MD3
         Dp7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777976088; x=1778580888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDEeUuBDn3v8cioMLCv9LKMt7i+X6gzeWTWqo0RslfA=;
        b=mDDLI+QDmeMtLto1Q4m4gOzEOgDVkLIg/58vdeppfDgdD20fKmKJSc5oOBYvKrC4PG
         c0KGxPE6LUeM18TJTIuCi+uSEVkxFjNz2HDyZMSW2iJ+q63cJjMsipStwxsHJS7vBIek
         OKeDmqDsh8By85nocdzXAqdltw4grbOwRY8r1kJ6dN2+noE+24tHtB/zaFTdfJkhy8v1
         4spTvTN6AnxDkmVqEz2epuao8yz9V3tyO2iNbBi/dmS9XBYzApERcaaVk3JECUYd9pDs
         Pbp0biZzyRX7CORBEYwW49P7Sf+V8IymuRuFfq54CkOwfc8lVgkzTX+HLe1/fhf7RYLE
         Pn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976088; x=1778580888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDEeUuBDn3v8cioMLCv9LKMt7i+X6gzeWTWqo0RslfA=;
        b=GokQZV0GZcUNg8tBoJ8HP9cKZBM0jxwS0LIUMS1BrwVy4/T+oMWZiYJug9c+93LQCb
         v33wR6bnF5uvd71LaRFHM5OzLlW+SnacHMT16qOA0tUEx2xPhmvqhZ+SawFq2v4hrmfZ
         8VpW/eqreJBc9LlSMolwC4UMsGnRv3JBp6iznyKUPRziTe84r7bShNs1ozjTNyVCGzB1
         Y8UmM7gEe+EC51IvkdOkiD6XmjqhNtOnQXP1ecUwu705RqDA2YLTdQT4EAGlBvptpD6B
         taJpRPeVftAC3CSKetake/wZ2PcpkkmRpl5UqgcVkoTPQD3ueDNn1lR6Pgu3PwH5f15U
         ODAA==
X-Forwarded-Encrypted: i=1; AFNElJ9ebeHi6XGvkS1O5n/V0YyIMppDq3DOa933xTWC59LHN2fAlI+bAhKp61actFXfESq10uFt/YM2Th6n@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ZhHv9JHIF+fKuY8FCXlkYjGbzcA7pAx+/F9PN2jah1cPdMi3
	0ZZTGSJyR8SP1YLUkQBDt+sVqUp17vZ/0gdS+KDfJSYwLvYkcYf5E3GkJWprXLrXo+n1FrzqAzv
	GVXUOaB5vu0tOJzMxaDanaTU9kQYJIOo=
X-Gm-Gg: AeBDiesc2Nz8BV9uACAne5Hd8mlj2pMzhuvbyk2nrR0CPL25O8+To99sls/prjdHomW
	LbALa9TUgLhDDY2KdCWD8HsvdekirH7YiwPV9nGRhbQ6h/ZWu0P8yOOqvH5wXORD3a29wTwRXlG
	9uIk1DOVVtyrnySKPIp+52M0wtBaSAcINQFyr2Y+j8AOtaEf1OIYBL1/eNBJ7lQaG/0ifgNU1mJ
	HQzt2Q0dBXINvgnw+Q3EK1/SP8CEp1KKIBJfoBHqp06DosDXi0FaUazJC9A9SBy4RA0LIGSIpPa
	0nqiI6rSHVC6DDJoJXt43U9MydCc3sjXnrrTfdhr0GdsYCDW
X-Received: by 2002:a17:902:d50e:b0:2b4:5f69:715d with SMTP id
 d9443c01a7336-2ba53764d5cmr24069045ad.25.1777976088099; Tue, 05 May 2026
 03:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-4-phucduc.bui@gmail.com>
 <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
 <CAABR9nHiSxH60ULks7_jZCC5rE+YVu-u+nm3TnO7oKcFoQduhQ@mail.gmail.com>
In-Reply-To: <CAABR9nHiSxH60ULks7_jZCC5rE+YVu-u+nm3TnO7oKcFoQduhQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 5 May 2026 17:14:37 +0700
X-Gm-Features: AVHnY4KKaeMIUMNB9DnqOsvfPK4v3pBOe_aV3xzWOSjuBgzN0epZsRTKH_TgDIc
Message-ID: <CAABR9nHiaw_3E3=id8d5GW3t9XBR7c2WrYU8Hsto=F0siVa-KA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

I=E2=80=99ve looked into this further and would like to share my findings a=
nd
get your feedback on the next direction for addressing the issue.

The sequence is as follows:

(1) IRQ fires =E2=86=92 handler starts
(2) handler is running

(3) playback ends =E2=86=92 ALSA issues STOP
(4) fsi_dai_trigger(STOP)
    =E2=86=92 active_streams =3D 0
    =E2=86=92 fsi_hw_shutdown()
    =E2=86=92 clock OFF

(5) IRQ handler continues
    =E2=86=92 fsi_count_fifo_err()
    =E2=86=92 register access =E2=86=92 system hang

Since the trigger() runs in atomic context, we cannot use APIs like
disable_irq() / disable_irq_sync()
to synchronize with the IRQ handler.
As a possible approach, I=E2=80=99m considering guarding against register
access in the IRQ path when no streams are active,
for example by adding:

if (master->active_streams =3D=3D 0)
    return;

at the beginning of:
+ fsi_count_fifo_err()
+ fsi_irq_clear_status()

To support this, we would need to track the active streams by:
+ adding a running flag per stream
+ adding an active_streams counter in struct fsi_master

and update them in trigger():

if (!io->running) {
    io->running =3D true;
    master->active_streams++;
}

if (io->running) {
    io->running =3D false;
    master->active_streams--;
}

With this approach, even if a pending IRQ is handled after shutdown,
the handler would avoid accessing registers, preventing the system
hang.
I=E2=80=99d appreciate your feedback on whether this approach looks reasona=
ble
or if there is a better way to handle this.

The issue is reproducible when playback reaches EOF, while not
observed in some other stop scenarios such as manual interruption.

Best regards,
Phuc
