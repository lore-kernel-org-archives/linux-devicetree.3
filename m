Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495648034C
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 18:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787076772; cv=pass; b=CyL5lKR6cofaKof6sg9X07QCKMyC3pDbcXesnr/s4XXq1QlJuZ3rnz+LwnorsgtwIC0/hpC7Rh0bWfwZ94SCVtDMnh5Iy/1znX8s8UOEsQM/P4ZF0QEybk+G2Qxld1NiufhgRNU1OryaPi8LqP00ifiUaCcBJ4OUJN19pcecxpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787076772; c=relaxed/simple;
	bh=B+nSapg+VaNPr8DnhnnL7hC/4rF/jenHxFH+cPq0Tb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BkfeqcBkr6mx89+TWQ8iE3xeamLkYHsR9GYGVg/o3Oul4n4L7TDcugk+f5KsgHHQrLIArOkl7oGZBN+/jUuCa04DhbePWhKIgJqUiqrwqI8GQ/2YM3kYonJ6KAgk4joRTyEfagImMewg59pTAcGN99gZsDaNXVgnHOY0SWZI7Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cI9EFXIq; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cI9EFXIq"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so176854e87.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787076769; cv=none;
        d=google.com; s=arc-20260327;
        b=poR5vx8/B+0nRweXwE1HLK2REMNY49vWD2lNZ4oVMKlEDm4H30fWsfEdhkDuagsZPr
         HoZwc1E5RVf1L/MttjWnZL2KGX9VU5nlGg0cuOQIFvvpZ2kHq2EW3m54zhSkwWCp03VV
         1LCybSR+Ikm9g8ArxE7P791cQBHGLFFPLiyHu7ar9U1Fked0/7ybCfls7sxOZMGonRE3
         8udTpJBCKrTxnPNgq89iefmvusPcqBjNGsLeQ4lZmIWdm5O0Iu8dvjbtrk2HDAIzB8FJ
         V/4MLshH5ancwrTkyGO+3UoE+tjljgPFeRNLjXpZwsh+jp+mSvvx1xx2UfWTmISRbOMJ
         Dacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+nSapg+VaNPr8DnhnnL7hC/4rF/jenHxFH+cPq0Tb8=;
        fh=w+ihphhjnNlgqRfXq+FmNCj+8JAQshqzCK7UYc+5bI8=;
        b=Y/zKS9u9ZbkPWeuwSvxhCcycnYL8sjpNq8v/6IxFmkyta0zoPyCFIyQuuJouWrY0tD
         7el9ll7y6exufL+yNcqAATYZOhneyRsdYPun9WMrz3EJbW8MX9gOrKSqS05fgMARsGRQ
         95dobl4us1uxcrD3k0e+Y99ABof3aOU5/RuKFLxLFcUaY+VVRAJUytMgfap+FbT6i+p6
         0zR4KWgiwsviXAj5fAJ+hETri6jW7d6KeLeZpqS27a4sSnuJtMkkwBsHo5ZRQCilZa7E
         KUgPrfgZFW9yXMV++1n5ybSFOryv95U+0uJTnCucZlGF8jzySazSkQ2twNw+F/sOnOOB
         4Tsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787076769; x=1787681569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B+nSapg+VaNPr8DnhnnL7hC/4rF/jenHxFH+cPq0Tb8=;
        b=cI9EFXIqLZtxOwbcPy1n/SwOyM97CkaCGCO32tIyKapOrco9zYL8GSxSqEz+0pdZGl
         eRdXau6DWUtlljJX5siu+Qa4bBcPCG2x78BsZc/yP3+b9T8627tXDp96yST3gpI5hvZj
         caDeUzz8f5mECkDvRl3hldBuC/OB7cRpdQoNHql5Kr6EiWVncMXq8di57OMtoeMBexNt
         YG9n/9LxlrQKTaFLS4JgSd+h3XKqo0PrpL9w6SClRm4TrP3HGB+bmyC5bInfa9fMZ/vg
         J8c1uHVEz2GO5NlDvOb6H4HpGMNfjXOhzQLinkPd0kTG5qQOn23C2UQ7MuzDFev2+ayU
         hdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787076769; x=1787681569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+nSapg+VaNPr8DnhnnL7hC/4rF/jenHxFH+cPq0Tb8=;
        b=Nqt5LmSuvwTML6Tu4/qa/rW21+Bf/bU1AhJBahDcI6ZI5eU3W7rZNRr7fU3vNZmbYi
         /iXX6y15tg/374X1t+6TTcg5HzvaaHy1pXynEEtuEacPHdbyG3dwN4xzJiLpX0zB5ZOD
         UeF6ZTEnvrIzeqxf30DjUS9fvw2hKMnfBuhiickHID80u2LxjgH/J/kzEAqT6wuGznfj
         haFKmLPuuAmb2hZsNWJEZBsW3AQz5Z0IEykzINFE4orLVHpzlp84c2jMdc9i+yttco/f
         muJcC5apVP+f9gqhFqbAphMELigrJEHJFA5LY0s5q/YbG8pm+xzRIFjf3Ot1TbmN1UYg
         cjww==
X-Forwarded-Encrypted: i=1; AHgh+RrgQw1g4bg1NzEtF6B0a+04I37x4WdLmctlpVblquhRzZQ1pMyxcQnFlLjp6gSMJp5aGtypp8mPGYKG@vger.kernel.org
X-Gm-Message-State: AOJu0YxSnpSkle9y1Xep0+FReT+HrUdH934X/w74GfZ1lFMouxR8jClh
	DuYxe6coWATlJF0cXY/CkYij/NhAL2E77avk4idNuTnwpySnLbv0TEPbVxpvRaqXEoOBh90Dm2B
	g0srH7TGxKa3nUrBYKcKBrkQeKPbT164=
X-Gm-Gg: AR+sD11hxZ2s1kbyAwLCHJS5Ji4ud8mZI+Z8GuB8t/Z+uK5OY60buU+Ay+LeFEvqMjT
	TW2bpMSlzDdPyUt2DD4qrGP1bbxdRK35vNCGZz6BdEkWMUWuOkW90+kttCTJQhzhFRyjYjra1/F
	GHyovfzN6B7yGZnamnEtMVd3pkyMD0VjjXEp3PdhxKEk0x+FGgxF21D5jDeCTffJfLQM8fbJuyv
	PKmmPATNKtREKz9p+LF9BGA7fNFuCWPrSpGVGSkBlv7qX6g95UrUinTQm+MeXpLYUuZ5G8rjvvR
	+i+C3mLb0Nb3GJf8v2dHk0ZOJ7lqppc6c8+urVA9FNS7DZpFU9clm597u+SlyxLh7Pvbit4UnqD
	D/2zNj495LbAB/LU6gHdH5R2f0A==
X-Received: by 2002:a05:6512:10d6:b0:5b1:5ab5:ea09 with SMTP id
 2adb3069b0e04-5b477c6091emr111830e87.0.1787076768577; Tue, 18 Aug 2026
 11:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786746757.git.ahmadexp@gmail.com> <20260818095654.5357db1d@kernel.org>
In-Reply-To: <20260818095654.5357db1d@kernel.org>
From: Ahmad Byagowi <ahmadexp@gmail.com>
Date: Tue, 18 Aug 2026 11:12:35 -0700
X-Gm-Features: AcwNN1VFdbc7wToCDqu6OVpR2tD_blBihPQ30U0mvdmP813mFMsjtyFeEMH6kL0
Message-ID: <CAOQiBWM57ZBafMcj9MaegHBuM21313O5PqAAGXdHfvmHxHp48g@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/7] ptp: ocp: Add R4006 and V9 I2C peripheral support
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Nam Tran <trannamatk@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

These RGB LEDs have been part of the Time Card hardware since the
original design, beside the four SMA connectors and the GNSS inputs.
We never had the opportunity to add Linux driver support, so they have
remained unused under Linux.

There is recurring confusion about which logical SMA number
corresponds to which physical connector and how each connector is
configured. The LEDs address a similar operational need to ethtool -p:
they help an operator correlate a logical interface with the physical
connector. Their colors can also represent the SMA input/output
configuration and timing status, together with GNSS fix or lock
status.

This series exposes the LEDs through the standard LED class, avoiding
board-specific raw I2C commands. The generic LED controller driver
provides the standard interface, while the board-specific status
policy remains outside that driver. The second GNSS LED supports the
card variant with a second receiver.

I should have stated this existing hardware and end-user use case
explicitly in the cover letter. I will add it to the next revision.

On Tue, Aug 18, 2026 at 9:56=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 14 Aug 2026 16:10:48 -0700 Ahmad Byagowi wrote:
> > Add the generic LED and I2C-mux support needed to describe peripherals
> > behind the FPGA I2C controller, then use it to instantiate the R4006 an=
d
> > Time Card V9 board topologies from software nodes.
>
> Ahmad, could you explain why? What are you going to do with these LEDs
> as a end user?
>
> The influx of the LLM generated patches has a hugely negative impact on
> the community.



--=20
73
With best wishes / Mit herzlichsten Gr=C3=BC=C3=9Fen
Ahmad Byagowi, Ph.D., Dr. Techn., P.Eng.
Phone: +1 (650) 924 6653

 Please consider the environment before printing this e-mail.
