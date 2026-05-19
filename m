Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DDA480DC5
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188881; cv=pass; b=ZdZ/zvexGTTGhWjatmBLl6gkbUpmdASmCcFqjrEVbXxXUd7ICr4jz0EIMq56tkPEnwTTmJWm1O8O5FG5eRqb0h5Z2/KSrzbtAWFJSgIW2iCGiXQAdWAyZJAOFmFYM50nJhMgUIpexwsfjAfIlWNPnjZyJo7W3EZziBWI593494Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188881; c=relaxed/simple;
	bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VV2XLgE9uwA6fnd1/lE6mK/gV3FgXzURwSRjIcXlSVSnzt6uqNseRce/rSUmAXs7yVJuNGu6SVSOts8bLkThfhEeOd9lRTs7lPVPvHgnuHhsyT+ehHYbeYeEioG5dDjuAwOqnQVG4pBB60Tl1Ua3Hrw5VWEnrmsJzO8XggWJ+SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkzOT8mX; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkzOT8mX"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f13ae64db1so187859eec.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779188879; cv=none;
        d=google.com; s=arc-20240605;
        b=W1kaI/glQlnyRqCEw1sbwBRHqtQRYN37tva2G1Q8dmy6iGvzee+ZqPlOc+i5hikwOB
         5bjrlGeCU03DzMOLr/OW/KzOOWDnyv2cI4Ev1SxJ+kFv31LICibDvVOBbmVgIAW93NWT
         ZG+Yztg1otBtdHehvgMFgoXMTx5A6k8vP7BNlfrw1Inpq2Tchp9eDnR1qtrHgQj81dPy
         90PXRKySWP5UxSuYj2qwrZD8CgsulOEztn3OKNSOIZoGq4SSs++Iqz/nEiJ2QNvs2v8P
         QP/JKAnOcwLrxvHYAW7pskzzsqLFg/V1Cczxwv0LIs/zxsgcp577Zxzr3SmGAxnh46Hx
         cRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
        fh=dd8RvWtRC1LpcuHkqA/Q/qR6XDBWa5cGWObyVTuUy38=;
        b=Gl5s7kiHDSc+bPpDPvHf4uptAfQvvdP60VW+WwIH8rKuiA+AJXyyUeMatXlMN3sAf9
         lY3uCRxrx2Rx0trO4Jem4lQz7bGwr5QOi/GGtvDJb43L2UFxMGYUqr4xT1iDA29FIVEm
         xzCdVXs88qIBmTrprsH9AdgBeBsisOZpLHzAz6W9CNE8jG4P0vXwAVpQewxjy8mFhwvE
         iLTA3vVIxdpKD5mURGqHdH1+/44TrLWIjzFCmNmpQYpnBOTb8K8EUe2svIco7BFkTRsc
         GFLrLaRLorWRItevYmjUmUVPgdVaE0rW9v/QhqocOemoFtpblhdb/NIM87CyPLVAjVHO
         P8/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779188879; x=1779793679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
        b=NkzOT8mXh6bXhnJvqEtApaE4S4veNhy2u4ev1hghBlqH6x0n92yVBDsJ2dVI/ZJivu
         9A8hpggl+UV+EG+gZ3coLNVauocffm06kPS6Vsilr4oCfGSd+pU0V/7UWBN7MJ69Qwj4
         R1O1gypG77mvtOgIEZmtoiOoxIxx/0pznmMVmWyQ4agGZcSLDIFoxyo9RDUI+MxRlN+5
         IdgW+epOIw+p0gT6dT9gkmNG7DD8Tr7Gq7TAph8w2yFKfIgDr2gJ4ppcyT6UkCIFCNyf
         8Jw0CWqYMJEIAQUcdMZMca1DkDroniAfLQjNSAqdcZYDK/d8nqv1CAJ1GQZJXX93ZFJ9
         eCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188879; x=1779793679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
        b=C/iuoCirM+/KPJw1ctlQyBeqC2tF6HU/nOUh/QWH24OMi5stcweEE/7Wk2+nF7jhcL
         y1GbZ215VhQ99qNh99Np7Jx9kZ2BJY1mPfpJfAcCPhRg4x+HOI5Nhiai0WJnL853I1iC
         4Lw5bv+Q1Rq3prZ3jVwbGUluDP9PXGE/kHEBMWdqx3SwHnXdIEKlVs9ZSrag0lAj15f2
         2dFuQVoX4g9s3C5ovj8udE0iKDqbiYW9JS6vIKEegpM3tx11+M4Q/bhu9VuZeUtjP6iF
         ekSrXyi29UO1aoKLTO/27oQbke+mEOawEQ6RV7nl6qia9RlhWRXxG/WLyqY9DaNvN+H/
         c2Fg==
X-Forwarded-Encrypted: i=1; AFNElJ8D0Ah27oMc3mHQkXPu+gF9aZO2iDrClzJuuGDjMGBnSL/UWvq4XsxALed0pfDNDI8U35wFm6nLGups@vger.kernel.org
X-Gm-Message-State: AOJu0YzWw2uUTcg3DZ0T2RDsqetffiTCh6CaAVJKtdVhxxhfIKiSKwXm
	IzfaS4WJmItGicrKuTNdDeW2u7fk5kn4u6HGyJauxLpJCFh53Ddk6tnqyNtjxqMTh24lpPFtevQ
	snR/B2SG7XO2TM6rrumrsypO9tzqWoa4=
X-Gm-Gg: Acq92OFQaOx/+Ky0Pdje3vzkEm5AqCmT3EVOSAXMefg/vnp4z59KGxJZp+H5yLltoQQ
	dDjN3RDST6tDMARVPOQFaGYpAqIOUgssglgDkdlKteUg0Itz0n9w3cpKIQB8tsBvXZhFrU2EqiR
	zBYFKZ4XMUSBtSkSCafFVXsSm3Fizo/3u1P/Mo4vwpLJo4Oi8ccwJbYofVAA+RsWEKq+MlIaCQ9
	DoQncLtsYBsPKDmYjrruFWNySI/fPEZdk+/16kzrCbu74KduAltbyG9ZNXVC4U02lS8HQYysXGj
	kin2MOpli/a1J1iXEaG73UH7ipqiDy92K1c1RXBRHhvP9efaBtjDL57XuWa2ZD4tWfQw6GDOrC7
	DIvHg1JkGVwiyl0z8iIRAvMY=
X-Received: by 2002:a05:7301:6785:b0:2f3:3835:2010 with SMTP id
 5a478bee46e88-3039870650cmr4323491eec.6.1779188879399; Tue, 19 May 2026
 04:07:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518042833.272221-1-enelsonmoore@gmail.com>
 <d40b1e80-37fc-4c88-9d7f-dae6458efe6c@app.fastmail.com> <20260518105735.GW3126523@noisy.programming.kicks-ass.net>
 <20260518172444.zyd47mcagrcwu7wt@dev-vm-schuster> <CADkSEUjhq6HSdg4ignzbuJiN5uXATsTdxFbRJ3BMxs5=WUWLDg@mail.gmail.com>
 <20260519103012.blot4bssgiqfer6p@dev-vm-schuster>
In-Reply-To: <20260519103012.blot4bssgiqfer6p@dev-vm-schuster>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 May 2026 13:07:46 +0200
X-Gm-Features: AVHnY4KWOiWEY77zuE66kq3xKsBRyVSkUGj1e6jCXaPb6QA3ygej9CY3aqSmM8c
Message-ID: <CANiq72=6oYtHf0Q1NaLXZ+25uQyYbej2xnvUhtgpHyvozhP7_Q@mail.gmail.com>
Subject: Re: [PATCH] nios2: remove the architecture
To: Simon Schuster <schuster.simon@siemens-energy.com>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	workflows@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Kees Cook <kees@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Dave Penkler <dpenkler@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof WilczyDski <kwilczynski@kernel.org>, 
	Andreas Oetken <andreas.oetken@siemens-energy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:41=E2=80=AFPM Simon Schuster
<schuster.simon@siemens-energy.com> wrote:
>
> Sure, I'd be glad to do so, but so far I refrained from it as I was a bit
> unsure about the netiquette (can I simply do so by self-proclamation? At
> least the git history seems to suggest so...).

Up to the existing maintainer, in general.

I would also suggest changing the support level to "Supported",
instead of "Maintained" -- that would help justify keeping it in
mainline.

I hope that helps a bit...

Cheers,
Miguel
