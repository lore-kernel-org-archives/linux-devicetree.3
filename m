Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D7D3C4B93
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456786; cv=none; b=WJkjUEyvIv9mqzj80IJog5Sm6pIT731Sal39FDAmzELSJhKjGoXfytcU+vjCGHHoDSzilnXk7tluynUl5qZ8cKVTC45EoDZ7aRbMhl8rLXyUacyiE01V41+RoqfGsL14o6qjk1UA5b3wJedXhIFWWRhDS//J16UHXjInGWu3GRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456786; c=relaxed/simple;
	bh=oCVQeqNkgLC+A8DsyABQmEoKPm1VZ97E3MIdW+uHGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeT+3tjtEuOKsdlfT9t+fTJmoO/03rrlFoz6r8NX+9IW5j9Qf685ObgOG3i0kozF1clSA/0DBwCa6cE3SMGsc4GO2Yp6dJDSqc6lhmo8g4jQ64+Vr3PxMPZEBhrfjxTsCxgMR2utDwXtMb5xwpWFkVRNKr6g8KHH1fF+4W8bLBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-95cd9bc6398so4919463241.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456784; x=1780061584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=lM958ycOv31O4YUGeQmijoIL+MgArSpRshmMd2luDlRof5khaglN8niXoljj96mrAM
         IKPqH5YSNwnvTr4w3nRKZFrcFLy7URergzxJ95H3xqGAsPsMxQ8mjVwXLLNN0YLckpj7
         nzitxesR1gpdvffPtDNactfnZwgYB3qPbkbsIXi3OkXdwiOI/o1gmgpEPq+yC4uNGwzx
         PSNL1P4jFNkRvgHHAtjwvWOK0RqHMmMSCAzMGXGJmRGtJ7betc054x7yC+vU1swsN5Zl
         W6u78/riFh4tAR2V73lXx158Q3lPkP8dyouYD+97HCfsvIARo7c/jA6Yhx9Q1rhzyzKr
         uy/A==
X-Forwarded-Encrypted: i=1; AFNElJ/qduwoaIw94/tP+RtuRDQ3QATnCy2a/soFchxI3OADGx9PuythAfMbYxkwtKbrSyGzJ5Acm72SFf1L@vger.kernel.org
X-Gm-Message-State: AOJu0YxU6kxxnTztTChJq2DhCh6yjFuZewJT1Tw4AFa0Fn38RqA7ox4P
	JGFsJaOCyyvzvYjkNYXmxsVBC1/Oabi7PQVriKz9mvJucP3sG3FNkNbkK9+9IAlUh3w=
X-Gm-Gg: Acq92OEJLUrEyeLxH3q11QAWxaSppsyDoeR2uG74euT/H62I2laTqlnGgQy5lNXB9LR
	krNZCpSIlRRLsUyC0hCRi2HB3nXkxkIZwWLhFlvfTurHQEV8vA7BOLtU7nkGcKtsl2PEmQLLj7a
	9r+DfCF81GwJLbQzyFcIFFVj/U1beaGnVzT5s6Y45ZeZ8ANToPxg47HBDD4dP4Yb8YlA/RiqCFJ
	jLe0Q1R+1Q0BD4juIjo6d6ctkOmyA86fZXo3KfNfiuT0+SAn2oY1fgcr6sSvhndfDBtZ4QWBtEl
	pxm8ciCZ7dKyewH86+3ri7YaERSLN0y4/2IPe/HYqudqylf4hNRhME+nrgHKPz/+Y2RlmGnMmOS
	JrQJK1la3jOza7uNcAMal/A41A8eu/EJVlD9AAVrAn0EMLLezFePytOttR/boDC/1APloy9KCEM
	CLvwvagH+QLLsLX+56hzQuTckI2p50wgaRSyo0JM4IZlusOR9qTo6xyQOIMOB6kc0b
X-Received: by 2002:a05:6122:2206:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-58661070825mr2040046e0c.8.1779456783674;
        Fri, 22 May 2026 06:33:03 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f37281e7sm2131199e0c.7.2026.05.22.06.32.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:01 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-575267e3398so6011773e0c.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:32:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/1qCpZ2FsF5iXogDD6XRvqayrR58qF0iD21Otv6DUnkFxohHahPziFDNn3zJ/KEc5NiBYZro68WkHQ@vger.kernel.org
X-Received: by 2002:a05:6122:d07:b0:56d:8ded:796c with SMTP id
 71dfb90a1353d-5865f81d405mr1996416e0c.4.1779456779687; Fri, 22 May 2026
 06:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:32:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW29ihBqL4S6bzDVw5dAwYWXKSki9Nz=BY51i8NP5D=VQ@mail.gmail.com>
X-Gm-Features: AVHnY4LeG55-0Nh30AeZGnk8727WjXH176FAkQkG1GYU6MDB6SKJVQ3CS8IechE
Message-ID: <CAMuHMdW29ihBqL4S6bzDVw5dAwYWXKSki9Nz=BY51i8NP5D=VQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: draak: Rename clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
