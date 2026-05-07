Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A523D348E
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148394; cv=none; b=JKO/6+LxcbEofkJNMpGTyb7iS0BgPvJnSPgQrWW0cnvcFhVzvrz3jf8hPjWlXdcen+alTYJqMMI1TElZ7b7vk9jlNndrLPJ/29/5gGkBAkYH7TThWhh2b5NKKeLWHEjHsZjdT9wupf1Arpgz17NGSx9SVjh2I8vcOsA6zOGsee0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148394; c=relaxed/simple;
	bh=tRHJ7X/o6SqI/AS1PTTqmm5hIDMZVmm9MIx3PzpYLJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vn0rQj5LbsztVU1EqCcaH2bMu0Rklo8Mb6fgvQsT3PsPE+GkIHpozdDhKqwMB5iQvoVS/xI64lyRUUqJ3VBAc83whqbVoQag52eslEZKT3XbVtljwtH2WmaZkzwKRR0XenovYdwQa86wkMEXzdY5R8lMLsM3SOnH3UQSASiV/Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-95d0476492bso408368241.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 03:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148390; x=1778753190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbAo3p6Dhi2yXf2nsmuVyPALvyu+CLwPL1HCjL4o6pk=;
        b=rziYyPAIIeF+UAntuwpGtQYdjzp23bWVn9IFZSGkGshgMfdSKTKc7eJiranAdPnshP
         FlfAeVa0TKD235/Zqz/fd7pDvDBAbI451o7AP+/P+bY8U3Fy2sJz9haq/rhbZWve52aK
         dkNulBwLKIz6Gsk7L07oeB/Om0hoz0lYSUr/4CWJpMSiA9v+ORlB7aOpMasXG4QW2KqG
         R09NUWV4bRVQ6HNUGJW0JdwRORzRSDV2aHe+lrO2d8ZIp657dl3JQz5bMnMvSqoLiqJ3
         D+JJAnvcdFapN3T2ozQ4hD/nexYxkbx6JX+UIOi8YLkt/IIPjbjBhojFFA4fFLA4mAjD
         ySgg==
X-Forwarded-Encrypted: i=1; AFNElJ9glkpZSWXVFjXZ7zRrBQgBrVQIpNsR9TtNBh42lnJWIqzqP3u2vhzgKC8atnMfgmee+q6JS9K5X07K@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5nB8chmHi/8+XzFqTXH/1HTd+gW7oTZyZ1fvneKgO/kMZpic
	UAPw/EqE8slpHrJ3ZeosN/l+1Xir+0mbViHWtcsYgIghjufFZT6JNbeBZPt1liROC8Y=
X-Gm-Gg: AeBDieu7vfD7dlcf1gaQqM9zlMjKRHcdlpenXmcOgqlO+Srn9xOQd3fTtQQTTR8m8iJ
	x6bQdFc57qPW2S/d921uq9+e+qgle/vwTJQ7lK9GFTgX1YpgwbzrHeu+tJOOJX33HueDZVkoHDK
	tdHdf2wbD0iWoAbWRUWHNXS9Uxy8uz1ZkAvAFGy5Fvp8yefPv5p3o/VI5uu12G8F3OgZ6OJalwH
	y+m1j8LjdC+IPc7Hy0syPM/M2abnf1PLc/rQH7Fgu6d6qNsBUqmFeq7fCRBG8Xye/oN/ngc6Q9T
	/B+7XIBQPJHGN9qdO4s3BnJdzjmhOO9UmP4s1f1KIqUcWv0MM0M9c8ozdl5sSPTG0Yd+TpOyfH/
	m/cOrLYjR3NE1ZHY9dd3OhFQjFdHoKx6jFWh9CcNPw+mdmXwUgbzxWTUEDB92SXb/iRwEq7+3EX
	ZbqzoZFgwca3HZdSyk3557+MAfBmux60hy2nUb0kWBTXnAJHOrWeHTEhr0B/r8oevbp7dr9nQ=
X-Received: by 2002:a05:6102:6446:b0:60f:c9ba:b992 with SMTP id ada2fe7eead31-630f9018967mr3281560137.16.1778148390561;
        Thu, 07 May 2026 03:06:30 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6312c1d49b4sm17366137.6.2026.05.07.03.06.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 03:06:29 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-62f4c4e6694so423817137.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 03:06:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+4p3hRatR6D/a5qbnWLrh0PlIp4HQYesg0vK0tBCZeCeczMd0YSpdeRIApARJe6FQ3j2Dt3TCxxYpP@vger.kernel.org
X-Received: by 2002:a05:6102:5e8e:b0:602:86a6:9877 with SMTP id
 ada2fe7eead31-630f901847emr3540642137.19.1778148389023; Thu, 07 May 2026
 03:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com> <20260430125342.439755-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430125342.439755-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 12:06:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfexfzN3RF0Jjh0ULPM8NFe15iUBYnm60vF65VmZz5xg@mail.gmail.com>
X-Gm-Features: AVHnY4IlU4-oOnUm1IF5PaplZdA4xyTiRvuazsxMaCKwtMZt83hFXHJ6z1pCIhM
Message-ID: <CAMuHMdWfexfzN3RF0Jjh0ULPM8NFe15iUBYnm60vF65VmZz5xg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] arm64: dts: renesas: r9a08g046: Add pincontrol node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2026 at 14:53, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add pincontrol node to RZ/G3L ("R9A08G046") SoC DTSI and set the icu as
> the interrupt-parent of the pin controller to route GPIO interrupts
> through the IA55 interrupt controller.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added icu as interrupt-parent.
>  * Updated the commit description.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
