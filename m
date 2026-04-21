Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F9C38A706
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776756489; cv=pass; b=kwohitckkPwViuH1GE7Xogplm7+HZAxUFPzxYJQVacRfjTsNdrppQeNWwilTpbzbZXyLXKU/riHmhxv448FMHJJjUHRflLZeO6ncpOnzhWQdAuP24c54o2qBnEnUuC2V2hf+DUtzEbo0nAJ8fEoUtIWQr0OscYJxJGS70RVt38E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776756489; c=relaxed/simple;
	bh=SrM7B4xlCRXqko7TjsJdvgDkD2L8BaoWfnbPWdalSd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PGfWeB3y1BMTjXVfi1Bq7BHswF8r6/73PlsikJIFJWSX773xDBsoZLR7HdgiuYbofz16mZSN+tpU276cD9xHpKastt3iDHIV3UYhH9XGQrz3V9aFOYGdIVdEq/LpapWvZtlqyuk7SQbaF4dm/JeSCUPD1ncwjvC4cK0pLxTODFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpJ6nPoa; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpJ6nPoa"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ba388bc0a9dso686353866b.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 00:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776756486; cv=none;
        d=google.com; s=arc-20240605;
        b=KW37BrdQ+DIln9iqWShZNNklVFfPSPr5uDpm1MBkxaLECb9rh/JGLW6TdoEQv7meqt
         5qwHurOD1mwtwgxEQuhOoB0o2yKZWcht831XbilJ9nA+ayxh6pCU41tb+EHEdeXWsyoX
         xeCVfN5G/HszwQOdrdOaUg+u/MK+MGYaKFYWNjsgIks3+IjJpAIIR+Ehnjhorh5B2uTR
         zY17ya8l0Em1OTviWZS9abh6FPQz3ueryg12Yd5jZdsAGyaMJOz+cNILInRSW6wvndbO
         HhJCy7nw8yBAJEV46JcnAkUmb+VQf1RtPIezRAW/R85fso2XOdACthN5s6vpSwOVv4B+
         yAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Ql38lC9ZYoXrn3/+8/I12f47H5/KcGWLQDIbsninAQ=;
        fh=Wrzg1qWXqsWmEthUoo82s5R1Bvvfmh4XxnrQJMySBP8=;
        b=Fuv71Wd3mVqdVYVIoXyuRHibZQRalYsg6eA/vbhds5dHnEzCtdvSAjz89QZNm9XL86
         c9/q5oO4cBXbK3oHUljkaZdKc2HyjbkXxJRjxZZ1v6HGcXsEHuWqLon2oJ8nG+NWHrnD
         YnFGQuOvMgziRIMY3eyWpIHBgc8RV9wlyEx3b9+Sv0yBa1F+R4pjH27IFeONQxIy3XUe
         iBsGgapqqEe31A/QhMLBWOb/7cVNLgTxUaN+IoBXQq9h/LjZQNBkcTVxmoU25MhJ7BA7
         YyTn2ec8+Nt1QfYwzx0ZqYYAWv1apoQDtR2HCF7hJVxtk5uuLeAYDKOftWrODb30n1hd
         j6Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776756486; x=1777361286; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ql38lC9ZYoXrn3/+8/I12f47H5/KcGWLQDIbsninAQ=;
        b=gpJ6nPoaYfL9wLD+frghMli3YDk2v1bHqUuJ38puhEoAZA31Onn957mCjhFHzhaGgM
         q5TDa7wql1a+42GUijkFBUa7DIlJ62czATuYDPEbU73ZQ+r3Ye4Ug6qd53nRZ5FqhG4A
         OVeOm6KzCQdqgBc/26ZNzZXw4L7EZ0BFV/t4rvOCegZzLHrLnJHqJEC3bob/V2HVVVLe
         oGOdLk1LMjHJAzTLfntSbKjV3d3JLtKkJwtAYOF7J2JurvRHg+VScXcHxAowEaAWsJfD
         PsCFbdgHQFUQTglwI2ecQqbFldzIMxA6jE0FGLUfCsJWItR8i5Y1Q6JYJOC4Yd5FxZUr
         fR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776756486; x=1777361286;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Ql38lC9ZYoXrn3/+8/I12f47H5/KcGWLQDIbsninAQ=;
        b=aYVWe/n9ziUlyMayfxANz49daa2kVfy0n4XWIrHlIgdPmd29CnjTPzKNehsbRnJmsT
         aB3qIneekrdvd6ggHPl7P/KJN7u3loZH8p8nYorLAQoWU+rDsB4zcxZ8O33QGIMZTnwk
         lp/iJFHZLfGRedz8GZjd7sBv6UZFdb6RTTPB3bDlgEItcwmWNj3IXrp8SkqYt9XnpDJY
         3ufH5GrWBcfS3qx3ks9t1kernaMjaibije3QNyHQHPEtMAIEu6jH8Xi6EJjUQghkJLMX
         Mcap9Yce51chccVYm6rqHkUyyA/TnTa2zHWvZAMBnoGBHU4g1DOgJXytx0NJiQpBbGwZ
         Dpow==
X-Forwarded-Encrypted: i=1; AFNElJ+E+GaXwW0smKxOjTlipfmbDm//MynL+vdOER0b5q028SArtje4NIDvkXtkRSv/7iUzrQkXEXz497bF@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjvcJluLdSJc3DtR90u4HlxJFR2Rl3m65DpR23q4myS3sUAOx
	Y9jTqkif0OpDR9x+1g353e1JB3c54wZprtfjXRH2ENjtuMvkW0iq4rmzil/WqaWMvTPl5NPxfmf
	b33qzlWLJw3uBj4WJduczagcYQ2RbbBk=
X-Gm-Gg: AeBDievjC9Ah+1rjMcQO3mDA8aK0LW6TKY1RifYh4n5XzNYBWIbS21CRBXLCtY7Lg1H
	HleYVGBqVcLv9P5VUfreZG8qjZ4PJUid8P47IRyEw5h78IhkNhDN63wcgbnLgfRgxz6iSlxqjMi
	/tCzfSF3IFrzveDxLToM3CxwsU//gx6Qhe1ImTQ2C1qY1i9M+w356K70Mjcvo499EOTNbKEWux4
	+M+By/bT7bE0Wx7HwMZ+sqJHmab/76FKY96XWOBMiEOq6JeEsGz342zN/PxZm8HMskmSSFu3kbl
	6w4Pb/lq2IxOaNQ=
X-Received: by 2002:a17:907:3e10:b0:ba8:61fb:a927 with SMTP id
 a640c23a62f3a-ba861fc2f3emr295974966b.39.1776756485914; Tue, 21 Apr 2026
 00:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org> <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org> <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
 <aeaXszeaE62rM6BJ@aurel32.net>
In-Reply-To: <aeaXszeaE62rM6BJ@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 21 Apr 2026 12:57:50 +0530
X-Gm-Features: AQROBzC3b4LUDC2_89z11CxE5Y66IyoxVuaubMCzdKHl_KwSO1e5I3jSF-QRINc
Message-ID: <CANAwSgTXwhkV=QEJqzY3WYV9+uy=6zEN9aEktinswFARs+m4sg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Anand Moon <linux.amoon@gmail.com>, Shuwei Wu <shuwei.wu@mailbox.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aurelien,

Thanks for looking into this.

On Tue, 21 Apr 2026 at 02:46, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Anand,
>
> On 2026-04-16 17:07, Anand Moon wrote:
> > After reviewing the Banana Pi F3 schematics, I confirmed that Buck1 and=
 Buck2
> > Both supply the CORE_0V9 with 0.9V=C2=B11% rail. To resolve the restric=
tion errors,
> > I expanded the voltage range in the DTS to 500,000=E2=80=93950,000 =C2=
=B5V.
> >
> > Additionally, I updated the DTS to map the second CPU cluster (cores 4=
=E2=80=937)
> > to Buck2 to better align with the hardware's power distribution.
>
> Actually the output of Buck1 and Buck2 are connected together, so they
> should always be configured with the same output voltage. And both
> clusters should be mapped to both outputs.
>
You should review the regulator_summary below, as it may indicate
it could be Big.Little architecture cluster.

$ cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage
current     min     max
---------------------------------------------------------------------------=
------------
 regulator-dummy                  1    0      0 unknown     0mV
0mA     0mV     0mV
 dc_in_12v                        2    1      0 unknown 12000mV
0mA 12000mV 12000mV
    vcc_4v                        8   10      0 unknown  4000mV
0mA  4000mV  4000mV
       buck1                      2    1      0 unknown   950mV
0mA   500mV   950mV
          cpu0-cpu                1
0mA   950mV   950mV
       buck2                      2    1      0 unknown   950mV
0mA   500mV   950mV
          cpu4-cpu                1
0mA   950mV   950mV

> I also wonder why in the original patch the buck1 regulator is named
> buck1_3v45, from the schematics, it should rather be called buck1_0v9.
>
Yep, you are correct., It should be called buck1_0v9.

> Regards
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

Thanks
-Anand
