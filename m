Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915324;
	b=BZKcpXRpdJ6h/1WXMZivGMR9lTX2cqwD0ozMPTwVMCskbJ88GZWhe5E7A3qnZrQ40tfl
	 hwNnawZPslcNmMkM+qIe8ICARdCvQaIXPhEUaomhginka1/mzH5ASXBq+eNpP9r6x3V3I
	 xpaCMV7KQNkt6VFXsj1W7VDOgawT5nden15m4Lt36TvH46Lo0QKZ0t8CSb81YffFDNzqa
	 ZTBoB5UIw2Hriidwb931gAC3lEB58pABP2wQhoMGKG9pD/nsXiwrBx+khmJlc+O6U2Vcy
	 jL/2tXaimBZvXJYZHm0sGGXrlXUJS93NH8o1BlbV7J9FGvOuzXhC9eoTuBuree2012w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l8n+OopgLwypxqFGetb5HIgCgsMRDuPspITkC+2T1Gk=;
	b=E02BqcN1vJOpmFFUdrepJde9G3zd6Y06z2N3Rq0do044M12SIn5zUnhrbKZJoC4n2eGa
	 qbhdNNF8p0EkLmSOXusrgblHMWUN+/DXBtqDT0jnPAKZlT3ARuSzscXR/trf+/aRZgB2v
	 5VVuLF8AU+ElnzDI2wioEzi1HB9Xpszb7JpAwZg+cke1V+ERxHqq8o/gJCodQru+rB4CD
	 n8gpr5AXr+vhbibWbdRkrAY88em48u8Iogfk/xZkwzpuRWuM3M4DAxnakKUmnHYOTd+G9
	 MCdpn+2WkyTSBvOVGycZQCAn2yVySZJATWLzG8krejNQVJc82ieLF5SoouzxHu8UKMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Sn++kWr7;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84533606A32E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84533606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Sn++kWr7
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c34bff61551so113708166b.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793915317; x=1794520117; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8n+OopgLwypxqFGetb5HIgCgsMRDuPspITkC+2T1Gk=;
        b=Sn++kWr7CN2pmU4AKXLXArUWNAmAmH8caGa+6902qsQLk+/PdqjEk66Fd1pjfsTfWO
         EpCJSchUzTV5WPNHbGJx2dCupcPNpJpDGrUwYS1Gg6qc8u34ZZ0SVVU/17bc71wC6u4R
         k6t8/ZJQ12SR3A1Ejge0QouPTlVDAp8cBfsZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915317; x=1794520117;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l8n+OopgLwypxqFGetb5HIgCgsMRDuPspITkC+2T1Gk=;
        b=t9p0em4NT7IYxhsovT7YC46r+ED9Zp+1kSi459yE7QRTn7zWwsPgYw4cdwpRL4uF1Y
         +tVYrqcnTPEPn8ihHlG2DGSSGcjA6q9+zo+WtNDmHAGAVGfgJw6PVZXeKJSMXapLQrMo
         vvt7SZ+1OyM97VwV/jvtrQxUcdLcTfnp8cZB8cMV3KTZ60/u1H/xI9fvnz0OiwIm9vpD
         6P43pKzDMBGoar1arJLKT38mDdpW0JE7kxKtOxeVrckwt1Le+h1HOG3e5c7RakkgP+Qq
         fiLUy50Fts/7tT4V03VKm144G6/O7DT6Ee/epqZqs7/pqpsBB/1bfACPU3TdEb64k0ur
         bFWg==
X-Forwarded-Encrypted: i=1; AKwUvBw1U0nUZ9F+iSmJN+4veQ+YHXh2qtQLtJErsG5KUb/4OgG/BEnZlInpO3jJ4IqDbQaPoXnehLae9yxx@vger.kernel.org
X-Gm-Message-State: APuU4Z/FkhnS3p/jJySuk6VMSJNvLbIywCV14xh2Aoj8EMzHC/duSiUa
	3qzscLKWq7DF8PupjN6qp/1eHzVd1l0FzmhlG5DLpwGAHNQraOgjhq+eCuYGWBh4SLARK3wJKDc
	iGxvG52SvHg==
X-Gm-Gg: AYBFou15Yut4PdF/DdEICCJQM2+y1mtnncGS6c1N0hNGlaVbalgl8OlBdtO93TfFm1d
	CqP066GGoZdSyTi8lFeuWh0HgV8tTso8I300a4RaZyTCT3gsj52O1LGzXr9lu4tBtBbBeEh2JMT
	bNdBisMz8RoTVdOQN/AThyNAnaTncbgmR5YeBaeQS2wCA8XjhZkinhnZ06H7oDas+BO06H1eWpy
	eMc2dhqqTVNVUTtt863tFjWf3guIBY/T51RDzH8dEClNcg4Ao2z+EoxZ26vv+y0Cd7u8wjiNZ1R
	QifiTc3TIL3sNj5anoqfgLI4uK/FBswulRM4I74IYVdhgCWOEo3XaNTONWju/hI3L31Nqk0dXTy
	9t1vmNFPiSNbw/NzpcbR2pz+AI2YucbA3dqA0AfiH+kFsed54JsQM+KWt9irbk8KAJ1ZgKlQL9I
	pitZDLCJFTwabP5SmRIdvhJHngWntkWlssnX0YdLwIqRurJkF30qKoBt+IxMiZMJPfHrSBzEEJz
	JQlQp824mm10nQuK3mRt4Hltk6AjjB4TiX+7uEcb94IjFJg5IBy6X5/o+26Dv7R09hfhYo+ePu8
	HKxkzQYdCzHsPT743nEVGsu6dH/p9fw/VOQZriiEBJKSJhM58Rij0ahfOunyk6FyuxlND/C+HiW
	WMQ==
X-Received: by 2002:a17:907:960a:b0:c44:3006:5c3 with SMTP id a640c23a62f3a-c4d34cf037amr62495066b.28.1793915316884;
        Thu, 05 Nov 2026 13:48:36 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569edc9sm20339566b.50.2026.11.05.13.48.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:48:35 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c34bff61551so113702366b.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:48:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwfWtjXiwjns2RLUMnto+ZrV9rkhpaMwdo7hDFud8liYF4dNL6jaFJqb5tWwWNQ89MKuDMJU6vjqeEB@vger.kernel.org
X-Received: by 2002:a17:907:2da2:b0:c40:b59:1b with SMTP id
 a640c23a62f3a-c4d34d39a58mr58567866b.44.1793915314942; Thu, 05 Nov 2026
 13:48:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org> <9c81f6f62fd0e908e683c4c08b09a1f95bc2ec9c.1793876837.git.alx@kernel.org>
 <20261105111423.360f4ba8@gandalf.local.home> <auyuINXEJKc1KoG7@devuan>
 <20261105115019.2fe7c91b@gandalf.local.home> <auy0O467UqOzqYub@devuan>
 <auzGMV1YbO9DodBq@ashevche-desk.local> <auzHFRzd86iV4-RA@ashevche-desk.local> <auzxXyAU6zyHtMtn@devuan>
In-Reply-To: <auzxXyAU6zyHtMtn@devuan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Nov 2026 13:48:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjD-fQvBvozu7+TjXa4=arAFgVzyixw4W_A=14Y8rhSLA@mail.gmail.com>
X-Gm-Features: AclHuK9v-o21t8pmiI4INk2NQJoSrOcmPCpk8IDpuzUs81f6KLpwaM7gxXogW80
Message-ID: <CAHk-=wjD-fQvBvozu7+TjXa4=arAFgVzyixw4W_A=14Y8rhSLA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] string: Add strprefix(), and deprecate str_has_prefix()
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Alejandro Colomar <alx@kernel.org>, linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 13:24, Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:
>
> I think it might indeed be that find(1) is slow at filtering, because
> using git-ls-files(1) is faster without piping to grep(1):

No. Your find | grep" speedup is because you use two cores for this.
So it's slower, but does it in parallel, which is faster on a machine
with idle cores.

The reason git ls-files is faster is different: it's because git
ls-files is just that fast.

And it's so fast that now the pipe overhead is much much more
expensive than git itself, and so doing "git ls-files | grep" is
slower and only adds overhead even if you have idle cores.

And the reason git ls-files is so fast is because it doesn't do any
directory searches. It just looks at the git index file.

So git ls-files really does something very different from 'find'. It
just looks at the files that git already knows about, and it basically
only opens '.git/index' and parses it.

You can *make* git ls-files do a directory read: if you ask for "other
files" (with the -o option) then git ls-files will basically do that
whole directory traversal that 'find' does.

Anyway, if you search sources and don't want to care about object
files or other generated files etc, I'd heavily suggest using "git
ls-files" and "git grep" exactly because it's much faster.

(Ok, "git grep" isn't always faster, the whole regex algorithm issue
can go both ways, but 'git grep' does do the same "just look at files
that are actually known to git" thing, and obviously it can look at
different revisions etc too, so it's really *good* at greapping the
actual committed history, although if you go back in history you'll
obviously be paying a much higher price because now the cost is often
not the regex, but the unpacking of the objects etc)

            Linus
