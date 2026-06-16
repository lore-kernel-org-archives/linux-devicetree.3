Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC1A42EEBB
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607209; cv=pass; b=n7yeQRKDfr7jkSpKGEIuvUtXwnX9L2DRQAcVLaoYTMJ63uo1dChsrs1YWOhcXVYmHTz5Hl66fFxopznLHp2z1jwFnrebHy7kaV3yefx7//vvv7pCbObThIixln7R5vDFS5qLlquZtoh+LyIPhdGylbpFRlQVoBJb5d5uoFlnLdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607209; c=relaxed/simple;
	bh=N8jfqtDqkFcR2V41hWjXXdTsDb+mE92L2soubvNIyr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sd78eZyTUhMdES4COA6tU8KLe+vVpwhmCfby5fR7aTlZF9Kar9AHFXgz4qGD+h7GyFwcYtd8oF1S4xvbQK2VVbQ3pVG1Yd6q7Ne5kiJ1aTN+xCBX9NnQGbnaHdJkfw1diY/X9Bod2u0XlYSITvqMBgWlN1SFkZ0euyXxmBcNATk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZWZ7/Qb; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZWZ7/Qb"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bef8b97655eso824223866b.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781607207; cv=none;
        d=google.com; s=arc-20240605;
        b=Zn19wlh3NCOt9PQsnRFeAtFHmvLhlKdtErwvu/RfZ3G2ltt6gLh0VnGM+GGzvBHlKh
         4zyYymk4Oej0fe2Yl4Beo1vTDn0FkDZKUTijCemorZpMl7XT5d3VDnVoA/jinShwDFRl
         dcYO5IPoscHIdtSGmlu0tj3ER1qRWDOadQQ5zmRwSms4gVviP0h0LK8hl+i2K2PTLw22
         x5zMYZwdQy4CFY7bmMzSuAEGNm+GEmLecvf3PEIjTqIihtKpEfj7WDr8tUr499EywtjE
         f6HmoCMjiX+vHGew7nA1OD08ZH1qVbLBNw82RayLSRZXRn0bma67S9RXbpJxKLq68SyB
         kuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8jfqtDqkFcR2V41hWjXXdTsDb+mE92L2soubvNIyr0=;
        fh=zfx0dwWotZam8FAg4AqQhroIxoK/6K6Y2tqOQeZJXvI=;
        b=gbjQ1/7MuOuC30nlV1ZTFX0dhL84HM0cFPFGJQbykbvdQpF52GuceWESEgCv1EbG5V
         0w60pZKcytKU3/ITr1g8A2ZaHSVwF02Jd4vmSDjH5YeptkYGOAiPF86MRYPmq5N++pl0
         ifNneAq8seB2qqvL1AJEor5zrwv4ywtExOhMzwrukv40jjzEnnc1L++hTVl4x3x3WTQv
         J5iKi+wu3jDmklbACrzwASyzZej242+nT+nll6L0vlXb4/Dv7NTganQd9gZ0p6cIC1el
         uSa0snxOz/z7Nx3EwfMixHKPLJCk2Y+eTMtB35cPmnZFEqlptl1fLOsgLzObCz89tIof
         tiVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607207; x=1782212007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8jfqtDqkFcR2V41hWjXXdTsDb+mE92L2soubvNIyr0=;
        b=QZWZ7/Qbu5/wXKAAe7BBWE8TKojhl14Ylh5uCK6xTtqKHldqqq2LvZGeyjX8yzSdEN
         ua1IR2Fyay9Qj4TNSURpztEpThuW4ERYTO2PYRAP1FtTguBtuAVHBr+O09m5gTansP9x
         ++g1tXW40DIPrYV+Qf4W5BclVvy24DbxBBNjNNfjzF/oeF0a3mf/nyH2hytwKAucYaHO
         vi7U4xvdCnH8vNXxX6lhrtSUyAYkQkuBS8RLiu68mkPS2JxB1dO5ez9YjuFPR+K8T7XF
         1g3Facb7HmzvdRSm+v1fQzr3uT8kjD8MRGypRP3ab+x2ga+UJC7kXh95yJlkNBjdnwiP
         zNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607207; x=1782212007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8jfqtDqkFcR2V41hWjXXdTsDb+mE92L2soubvNIyr0=;
        b=UqegoD+0r+pU9F8nZ9uyyYj2thyqBpTELwAZJ/QFNphYR1ySB+NqoW6cfCKYX+oydm
         MJGdcPA7Skk2zp/vpcJRJLbyzxvzdFEcT7qQ/eCgntWoQiv7l1K8V6kys/2sHIhnB3c9
         C3TK2fOP+2kehhC6rvoDK6VfT8XInjxlQErRQPWDIz582gcLaJ6QQ/86JIihGlZAnntU
         an6T/oyTMywFWP+X2Jv4wCzesIUOqSP2UwlWw51k20Hivoj6CDZKXcwFp6qKC8YnW9jz
         qYxA6UNcZwNi7uaS7dJ4NrlVf1kXxUGAsw0ZnAwwVrJ+WFFZ2VT6cY+V5vjcIgHscvCX
         k1mQ==
X-Forwarded-Encrypted: i=1; AFNElJ8I8drDXNhS62HyGDGyZsIYqSSlulx02vBneqwl5w5rHjfAnpVy90Xlvgz5fqcsvQuoC4IpwlyzTAGl@vger.kernel.org
X-Gm-Message-State: AOJu0YwHG40eLVbC0pJEYtXYYCspyG6KpL2uxw4iFIQAv23PA+Z5InBu
	aiHmHl14ybIKQtfkRFZmgSKVvH8SQwwWjdLvQuS9vD+M3rnyCmrqfPkiwAiPDJupgu1MbVKVvWY
	VWssKphUiWqwUKEwVpoROly3MeVsOoIg=
X-Gm-Gg: Acq92OF1upJg9sNTPpYX5JmKBBC40WdZ+4fIjgd19iGAfd0HyqCh7CU8L3Hu6lUv/Au
	dcPEDtiNm54yOcSpt7SHRmv6vtiFcQ3s6htYygfG6F8hExqvs/ZHiiDX2mA1UFEWxGEyLpzA73n
	wB2geLUAGzfSJCVV3M0BnA8z/nq4T/LYZfGu5tNK9iBcq3HOrK8iYWC7TtDd62KNy7vZTWi8ZTG
	wPXF2qokXCFt0i+FnmvTuNU4SLcyMorLPhmaYDan36XvXYVnGYAnYwF4dfnd28mwIZ59eGK3Hc/
	dQh8X+61wJAxG2HCvnarsQ9U/xTK9U1k+Wx89Okj6xAI7Rl+7azzOuZ+96G4tfzGzkR/QfmdAcM
	sbbr3Ub7E5SWu53wF3qtYFHT9ZFu0Z2CAXTIMzV4ZHDpaTnf5yCnydpXtOahQwWiCiZsS
X-Received: by 2002:a17:907:c248:b0:bec:7185:d3d8 with SMTP id
 a640c23a62f3a-c0416f22ac9mr172531466b.6.1781607206622; Tue, 16 Jun 2026
 03:53:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-ad5686-new-features-v3-0-f829fb7e9262@analog.com>
 <20260616-ad5686-new-features-v3-11-f829fb7e9262@analog.com>
 <ajEo5pOp3ElX4cP7@ashevche-desk.local> <bguen4zngbwsnoxbis7mfrmo6q3vbccpntfzr6bsiog76kdhvp@3lcygxwlg2kv>
In-Reply-To: <bguen4zngbwsnoxbis7mfrmo6q3vbccpntfzr6bsiog76kdhvp@3lcygxwlg2kv>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Jun 2026 13:52:50 +0300
X-Gm-Features: AVVi8CcjIgkH8qO2D3eGoKeWXqvaH9stwzT-OUvZz4L2E19OrwgaPU72O6N3ARE
Message-ID: <CAHp75VeBE12U6dELhtxnL7ah4WEmAMVk-jq7vky1ynzdp_SAZw@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] iio: dac: ad5686: read_raw/write_raw: use guard(mutex)()
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, rodrigo.alencar@analog.com, 
	Michael Auchter <michael.auchter@ni.com>, linux@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Maxwell Doose <m32285159@gmail.com>, 
	Joshua Crofts <joshua.crofts1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 1:50=E2=80=AFPM Rodrigo Alencar
<455.rodrigo.alencar@gmail.com> wrote:
> On 16/06/26 13:43, Andy Shevchenko wrote:
> > On Tue, Jun 16, 2026 at 09:21:17AM +0100, Rodrigo Alencar via B4 Relay =
wrote:
> >
> > > Use guarded mutex lock to facilitate code review when adding new
> > > attributes. This will allow for early returns, avoiding error-prone
> > > locking and unlocking in error paths. This also adds missing include
> > > linux/cleanup.h. Gain-control support will allow the scale attribute
> > > to be configurable.
> >
> > What about interrupt handler? You just added yet another mutex lock/unl=
ock
> > there. Perhaps this patch should be done before the previous one?
>
> Can't add the guard(mutex)() in the trigger handler because of the goto.

It might need a refactoring then?

--=20
With Best Regards,
Andy Shevchenko
