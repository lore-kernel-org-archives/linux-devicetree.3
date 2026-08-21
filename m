Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B90030DD22
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 20:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787345003; cv=pass; b=BEa23ibjdZFEzRqJfzEU1o/ShFL9BG7d2xIPrhvJ3CLuizr7k07+9klDpl2/a9OCMBq8Yo6YKN9eXJQVrjEazWKyKVU4KmOnxHdoW2m0uIFRLO6nZmu4CXylvOLa0mvdAGUDkuZOjVfmON3+ruDfcA1E5U4cmXECwyemmucE2oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787345003; c=relaxed/simple;
	bh=wPfN7PhPagaHp95lUT4nN6VYB+U3rCdvZ9ElbHnKR9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCCwFP9niePZng7C+YdgFcwE0NY9s8vE5xmslkIVMdrFEYRQnxQZT/9h1VxjWCDiCfz9OooXF+VCN5gTrzZwlvA5Yppo1Ke430j5nNOI9lryDuaAuK1huQSKHMUSc4AHXs7bas0NwPjonT7SsG7O1pOZ4BqnFOEU9qtdlIRoTsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raxEWtO/; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raxEWtO/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-480001972b8so424585f8f.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787345001; cv=none;
        d=google.com; s=arc-20260327;
        b=fRGDBMQ5JHBDLbSAyT4vV259L5D25Wr7l8q8hY8Z0jYF2P6+MHN3SWanC6xkNN5IOd
         DscLluvdKSeW1dmnuC6/wrZzS0RtJhCgW8zvBO1rn1SEDEYcK4RFRx+DbOvvWQ5Hc/s2
         g8rX9JtrtauibkEBaGyS+Tf2xsPvDWrxJRcnMFR8K7BgYkc6rTqe/oXgaq3teVQGFWnH
         GDB76n9vAEu/9/BYepGLRhWzCIJ7KHwi5eaNtlCwkkCx50QbTWcSnz7h8O7kwjxLKpa+
         4W5Iflvd5yRhSTfHRhJRjoztk7NZ2fE10UwM15qdGffj9xlwSa7Gqj3Q9tROTm2bBp9q
         FfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=93DdNcgIHKf+j6+3tpIkwKN7MgYTvQWBHPBOWCJopQw=;
        fh=Mxa0Ol9PfirulsxnoNDnL3IJChd9nNoZ+8Kwon6wYTQ=;
        b=JUI1kPJIJ4FSh/7Ghisn+gXyCMYSQXnSjVHik5+Z/c9nRvka6a7b7BPTESCfu55nkH
         9ODixImbSEt9/S6EqG1zfiDXdzTSRzgcIKVE7+8G/Qjs7AFXUJiVcjVonYDqC2xLIXy2
         vsQqRxySR+BCjsR14NxBlApLUdfmfPFY8EAFp1rAxSHPJ8Kie2Og6yAY7EY/kcHxfaA0
         rEyy8iWuEQ022KyCkdPWVMS3kO3KtwequFWiY6s35jTnHRG9VPPVPIrFa+20mV6fL5WN
         n4EtkD/3aWdoNND9C5QbiLj3+AuLiocad/AZ9gYslkzZAqVI9X3IWanK3ptkucNyNodZ
         SgJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787345001; x=1787949801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=93DdNcgIHKf+j6+3tpIkwKN7MgYTvQWBHPBOWCJopQw=;
        b=raxEWtO/zwj9UO794EXnL9mbZeemdGPpp0eXD3u/U456YaDByiw1aYaHx76ssDS4w1
         BtU1FAtRk+rNcQ3WChgnZDwIQzafeoGPE6+AWYi2B3nAdKbWZuct+KnI5oA3R0e9hSCI
         oB8MauFtOvAapVGEZEzuLz49gmi2I6/DLZE8/s9rS9KO2TB6x8imr+4P6wZOVJmVq8l3
         hItaum85hsnsQeibGdVOWgtan0mqgDz+IL1MCxglM3tvDLpCYn7jdrKzwqPOxTC6awQ/
         be5fzyxRxdeVjJkBb1Hu3wTqbhRHzKmlHjGS4J7Z+tCPUS+djFEUIEZ1l8s7OAbkufC9
         /NSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787345001; x=1787949801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93DdNcgIHKf+j6+3tpIkwKN7MgYTvQWBHPBOWCJopQw=;
        b=EBZfucpDtloWvneoR9vWrO4dCBHVVzlIsMsiG/0Wd3AzArIRcpdeD9Q1/v+M7XYM7h
         QU3B8j8NftNdkofhpOBbSFQfIhKlz3DOLg51KIwSLzcwN9p3BUGfVkLaRBX4Na1EqJ5l
         n3JF4via35tGUQTeQEmUMAdPQBfWkZfqkStp0wmpZqufXjIn0+k00NMEKkXgK7cNtGtV
         Ia4tmMDAEYHWF6vibli1ZoZzDXWtPQkeawZkSJOGNKwh01AsxudneHNveHAzvkuwfp3U
         cY4m5PS9iTNnqIVxMPF1Cp+y2MGIfU0ohoTNKyUIeY1/mPj4Y8cc1VSySIgTCtz9GhN8
         6F4g==
X-Forwarded-Encrypted: i=1; AHgh+RocqF2Cjd8Bxf++ZWJrLSy/yYiR1bCQ7hv09xjao9tUXgVSMpuiUAGAiz6eofO/upiiMl6qNnz79Oy7@vger.kernel.org
X-Gm-Message-State: AFuF++knWq+bSgUMBSDUTB91wUF2bWDfOqaJ6fu7bLtTwznIk/hI0I62
	2MEmSUXYkx+YK2C3Ud/6lbazhoyPpuhh35P+puudLTY3xx4wmR5I3uL9nn74x0oGOtoZFJLFM9M
	AA+iPx4pfq4JVL4Vp/O+EYmEanSvOP19L8kTL
X-Gm-Gg: AR+sD11pyFVFT/IKjk7+a/HzeG9DMN/epw3IJiyTQk3fVwNM05Rk2ql1VwnN3JOLn/j
	R1vIKB8Dys/nrAxX2M75dPZf7mRjoHAUgu7JwK5nSquCGazU4uNr1q5u8Em89Hkza+FUZV2Xhcd
	5CrCMF9pymj6LFst8/4YRbM1Z8peBkGIQ8npm1j7siS7RmPneNJIuqWeRb+yEgeehfkcxgu+w07
	5wxw6WWCVCk8YifjA03YuGPywtzmDdGslUMS8KSqcbH+SVOrjCfeouAU8W7aI9HcuWC9SmSrlL1
	ZO4075hpelxEsTvH8MmmMYnJhXl8PZmoRecfThzVTEfNgOkeU3tHdnOKk3W/XU6PZYhRUVk3LG+
	sjJ6cewAKh4b3ygl94swVSBqHAQ0kRA==
X-Received: by 2002:a05:6000:2507:b0:482:b823:38aa with SMTP id
 ffacd0b85a97d-482c0b91fbbmr12887893f8f.14.1787345000792; Fri, 21 Aug 2026
 13:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260821135608.275233-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260821140719.EBEDC1F000E9@smtp.kernel.org> <aohsOSu0-bfMuxoi@ninjato>
In-Reply-To: <aohsOSu0-bfMuxoi@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 21:42:54 +0100
X-Gm-Features: AcwNN1UdltYu7R3EkacW-3NdjmnrTvbGQkZDbs3Dg4tohncIALL7tiw1ZOJi6wU
Message-ID: <CA+V-a8vfo416RdWWaAoijRb7T9oRtPmwJM9Zcqhx4NdrN9YxFw@mail.gmail.com>
Subject: Re: [PATCH v5 16/17] rtc: rzn1: Drop trailing comma from OF match
 table sentinel
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, Aug 21, 2026 at 4:18=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > > -   {},
> > > +   {}
> >
> > [Severity: Low]
> > This isn't a bug, but the commit message claims to mark it explicitly a=
s the
> > sentinel. Should there be a /* sentinel */ comment added here to match =
the
> > description in the commit message?
>
> True that. In v4 you already had this.
>
Ouch that got dropped while rebasing. Ill add it back.

Cheers,
Prabhakar
