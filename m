Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1EE3BBA09
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295177; cv=pass; b=iVnbfiSZZzfoHG36uRTkKoE6mEk7EkEjMw1TBUp6mUChTW+k5L8XGuH4wvz2FM8YP31chEeIXyftxF+Tj+hKabRAkCVGlhsAekPOROtyhlS1zHPRnehzAahKl1m0/FLIp7Hjl/WP7YxAYP197rx1bEPDXIqzr1T2h4g6o8NB6W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295177; c=relaxed/simple;
	bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o169/yo1M5z0on3f/R8ALDxif16qm0c+d6hcFGLm+WqpyCihNwcA91J/X5uRZIX59VkggojdK16WUTlRrJ/MnBq2EMgCglvIhqRpflBK65hrKgDGyWGCY1fKP+rpFzvH+V1PCKnxDvfUbWh0i3ant6fp+vz+eCLeGfDaXor8BiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqnkdCOW; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqnkdCOW"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso455877e87.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 06:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791295174; cv=none;
        d=google.com; s=arc-20260327;
        b=j7SDfZcWvU01pi1QSja7w5C2wDW+gaQoX15mrjuXrEAa5lQBQMQfu4PHPQ28x3gGiT
         6Bv2mx4d0hniUEJDe/7tAQgc7yIjLvbdM9qU6Qa5Salk42NFySrTRdqznyNtMAtkAiei
         +bpVupvAKLAS9uCA6qYpKAeeDj+r3PrelNoiGVvp5guMoX3oENUtI/WDy3xrzv660Mky
         5Att/dhd1rAT1BzDlB9rjiuFWSilT0i+eDptMnQlK8TKx8ZVnA2yqttXSTS1axAdJ3XM
         S8DhIE7OOWcmps6aERjwlzY7vTGjVPT86B2c5LvvnidDGbACBRgEbxo7yJ9lQsg5P5wb
         gNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
        fh=MYKBeUhVWU7KhW/xtfs9bhdWoJfJj8u/QrI3SVX3ZdE=;
        b=WRblGlXEfnqCKYdMBCNSNAnoiABdbZExpsspKdxjhxCsFSFJQB/SgQjdaf3U7XI1ho
         cnbOlO4Nt9cPEDQKUp0jh2NA317MLjbnjLzRX+ADm7WOfzIS9pCYRq4miZcDng7QJGKg
         xzgXNUzsiKgus4Fbfuyf/1GqOwfEIJPDXPSsomP/e+3l2s53lGGGZePJjVXbDdO1fR7J
         V8cly44ZBlR2CAPTtrfTeSdTuLTJW75bOJa2XbXn/Bt9jRf5gN6k0JweT5GQ1xmZgkDH
         a6osB2zYwzQ582VSYSG8BuLDan/7KAmNKYPzQ2FsHxjEevgra347rkGHb/IAKlhGUXrX
         FYkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295174; x=1791899974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
        b=ZqnkdCOWEloim8WjLiU/7QnRV8jeNxk/DORaPPoi5XWMDSz7x4ZJkXcOhQHyZ+Z9wl
         o6U/T49lVU1n3QUcQAk11Vey3MsMzQ7iPOpENw9DF4k37nzcI1ST1ntN/fSOzoS9bMkC
         KA09uasvwb9ow1emFj4//QcRUJ0s6d3bI2BcJpd4dJV5n+JOLIb8oavyGtfcK0yrZ5V9
         8gVu1NJhWbAAsEiJaEIzkOsgwuH+2zzN4knXkw9FQZgmoVcsNHc1UbeR6UO64y0t5Iq+
         qfC+pYsEv7VShew0vSUcx9nkuTDSbsbqQTSoAE5z+wSStQhMqcUhT7fqowXQS+ccx0PG
         kujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295174; x=1791899974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
        b=JqoaNGDo/xvsdSReJ0srklkvvSyl/nC03TPUbYBhAqG2yvyEQznbnlVYmaX9qj9Ich
         vuq7mwJubyXD4VxIWxqYXJBKYMMPVAoMp2WqyYkRjfcMIUOJ8FWgFAxQ/pW+8XDebf5G
         icxCJfQI8HBey19ORXeKz4qbyXeu18fzkL6bgDOZYPxxp0IVHyoT9pCQjjSzCqfyhKoH
         nLLTphopSwSOHTCe9Tgga4bvGy8QLiF8iAJwoMOJcwTbT/jCNm46kA3adfAecdSBAEK7
         T7XIR37h7j2v7/4AFYZdXcR3a9w5gyEEiDeRMfx3XITq1RA0CnTFB3+tULoOBhxwJaIO
         jbmg==
X-Forwarded-Encrypted: i=1; AKwUvBzqtiXYXITJ6XbAjXCKKLjvQImCK5+Q8sU4JgQNE1jT73ogZWC96YQocyYfz1Wcg1KUENFw4zyWNea7@vger.kernel.org
X-Gm-Message-State: AFq9FYILGgkW19+hqPrtUd+p+oxJqZ+avGH54oZk4iZUOhZpEu9iYgOn
	eFBc++o5+sDZjgOuw4547FziVW5BvFXc33NOsCNh954Vitla5zZ/0VpKilACU6+40MTVepSLOtz
	F+g7GR/1MAdN0NfrvvJ86FDgl7hY3JTA=
X-Gm-Gg: AYBFou2qC00FM9UWBMqryLofVYftmPjkHWh4J/egUOSddqRjVnNY6OEWG6jCxa6wODy
	eoaurgoz7QbWy4BaAG8dJ9jzRzLyTPYQk/XsVTWue3D0+5eK364iWVRJzK6SokGpzU16N9CejUE
	hqVTo9YGQvNOASsiEXt6anFK+/+IQsB1zwBlY0HYOvhB4bnwNcvyxLjNixH1vsJYXPpmrYTUJV2
	XiqPrZomfYX4cmr4GrKDSY+VTTOn21223ngLU2xRxuXFmsNdxSzCGQ6PiPhFW4kEYwW7boJdzKk
	b1S9Ime5gid1k4sH8rZE1D21B/4sKiOFgc8rbl0e2q4A2tEzhcoXiSO67Cfwhd+aix29oVEck8q
	wVWjcjdZfzRcBzjeyyYuMIzIG6TsGAXcxb8NmWDVg25Y=
X-Received: by 2002:a05:6512:3b14:b0:5bc:b659:2d99 with SMTP id
 2adb3069b0e04-5bccc6b4c21mr705952e87.1.1791295173932; Tue, 06 Oct 2026
 06:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
 <20261006132512.2246196-2-alexander.stein@ew.tq-group.com>
 <asT7yvlCeQl1rfrS@SMW015318> <5021357.mvXUDI8C0e@steina-w>
In-Reply-To: <5021357.mvXUDI8C0e@steina-w>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 6 Oct 2026 10:59:22 -0300
X-Gm-Features: AclHuK-G83UF_cmuikg5GvtRML0WChn-CSBfbzHsfZjgKlTszPVDr547oglwPQQ
Message-ID: <CAOMZO5AJiSoFb5Fy-LR4=MDqQqhJPvtzLT+-18es8j_HvYqt6w@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: restrict clock for
 SPI-NOR flash
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, linux@ew.tq-group.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Tue, Oct 6, 2026 at 10:50=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Dienstag, 6. Oktober 2026, 15:46:50 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Frank Li:
> > On Tue, Oct 06, 2026 at 03:25:10PM +0200, Alexander Stein wrote:
> > > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > >
> > > The FlexSPI controller uses quad SPI with internal clock recovery.
> > > The clock is therefore restricted to 66.666666 MHz according to
> > > data sheet.
> >
> > Which datasheet? I suppose NOR flash datasheet, can you provide link
> > here.
>
> The i.MX8M Nano data sheet Rev 5 09/2022 section 3.9.1.1 "SDR mode with
> FlexSPIn_MCR0[RXCLKSRC] =3D 0x0, 0x1, 0x2" Table 55. "FlexSPI input timin=
g
> in SDR mode where FlexSPIn_MCR0[RXCLKSRC] =3D 0x0" lists 66 Mhz maximum f=
or
> "Frequency of operation".

From the commit log, I also got the impression you were referring to
the SPI NOR datasheet.

Please clarify that in v2.

Also, shouldn't all patches in the series contain a Fixes: tag?
