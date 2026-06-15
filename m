Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C792DFA3A
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504551; cv=pass; b=XSfvnouAx1tVZvuuIkxy21OaP+gVGIH2pJL7k74dduwjYSd6BHgL4yHDOGd68V2CzZxXpbIrvoXwig2SYNEHn8Lxlf7y4CXYetKZppiOCjKku42E0iCwRGdH6clhn71GhmP3FpeGcbqCov0UPRzD0PyPJ6cwgEjsfZM8t1E1p8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504551; c=relaxed/simple;
	bh=XqPNvehOEnWaZnXTerBcQEWrkudRd/l6+h30K5DXrNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQnyhUgyoY+FDo90PijDGJupFKpA3BiL28hqhYGgCgEDZUW0DEMVpTpNrU2ejCjDx9nxKGYM4hfJE/FY/u/wWxo/XWOW6MhvWfd1yrrNsMDxfOqvuYc0jZnKrERUG7mi4oxFckj7hLjGxHmTXZ18p52xA28/Zfeb5OspIad3jZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lt18b/C9; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lt18b/C9"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-13981833e13so181373c88.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781504550; cv=none;
        d=google.com; s=arc-20240605;
        b=cC2YyKEXYtqKiSTpq+IkohZL/PaWmlOo+zYnx2CYhZRIiSlP9Jb/LQ2L1wHShuy3pI
         kD9boxkRJ4CGO5s4itvKpQxlwJEsv2zNyeeluimes3AXDPDyfOS9ES++z5QJ//vedfgd
         gDT1w7uIbobkHoLUeArEP6RY73uOxSSv4fFGOfQMBuXomYzzBJDVEbWTE8gv3OGTz+rI
         r9YDdFaw5ICGlDKfmT4hzGekOFXoL81wBIODoVPU/O8duHPVzrAvOs7DOVeaIHctBWA4
         DWME4CE+C3zImAjPVUflcv0fKT+Z5G1RYT277ykIzyIXbLwjmDSrqjrKae9dkNHWoPsO
         sSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aNcg/aOawlT6U3KWhnH7Etl0bqitFbIB3mf3WqNqrV0=;
        fh=iXUIX6L9VM3xrbgBmsPwqK0Xps+8MqnS3DIDeGDYuwM=;
        b=f12ZXzu6f+cuFUMT2wDbB/E4eyvSiuuRbWD9KQVe2vWNnvodf10Ohoe2wVrrQNzSqG
         REBVzb06MT891fWRr9gSZn2Bi8rzbMrvwGtPFKey3ZXFvlCby/Lm3ZqbrKs07pK3MANT
         IHkd38IG1sXV4D93Q22lcQhQgjwRui2VYpBDYxvfzRUxDFYiyuPZ0RoSWkqnVPSGZIlr
         auGew0cwmZ8qdrgJNVOGCowzzDGbgk3xTdnAwjNZKrjw+63GW1n1LBT/oFvP/PiflgaP
         qJne0XMdFCaGtbNf0IVRur5iPtnRMOzHNmg2Ou1lKR06cdks57r7XbbN5pOVeGHDT6MR
         KyoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781504550; x=1782109350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNcg/aOawlT6U3KWhnH7Etl0bqitFbIB3mf3WqNqrV0=;
        b=Lt18b/C9Sylhcm5L/XuLyFFbipurTD2/ybMblL6P7LxWeIt8KkJdB4kVxFrz7SmZGl
         7bRyScP7YI21bux4OWJo/kSHLydpe4KVXMRs+Ot4E4T0ba0r/qvcRaW+35ytO26+1tER
         4SMvdYINuXEaC8wcSt7BAXGo+qA02pfhWyC4RkF2iA0QOz8qL5HiNC4TDk/0iPPutCuq
         R/VjZr1R7/9LHwlJqkWk7UIgO6DslBj/bpiZvkh/VVtEiChAddeMgY8FOs9BoG9pdBtA
         kZZSZh0GiYI12rMA5bmxMJzjTr9qQNjsXLVx7y/dNjxSck4v3+PpezH7dRyu4OB+3GlI
         /DcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781504550; x=1782109350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aNcg/aOawlT6U3KWhnH7Etl0bqitFbIB3mf3WqNqrV0=;
        b=gnwC9eHWQwMj4WvfYd9bbjjMslXW41eqdd8q3+TDxVWKX1xzoMyDCQD6Eu3qwDK0kW
         6EJpC35jsF9L98dViBzEX2BkWkDe5LhujbPOV6YsRp8bLMCTAOpQ6NLB5bfkcec21tsW
         zHa/fPBbOHr0ZxTYeUG2YIKSv9Wm9v8sz2QEoxfvjv7BIHckEEPY9gPs/AsBa7Ta6Bqb
         3NKyl7XD+2sI7cntkGJge4txDodXyiYkW88FtaWJ3p5qPSO7m9SzxVyHIHMc42MXalJQ
         t66aT1xY4Oolbrw9weObuL3EYdp7/F8qYzuKImXvhSKKuS60hBRqtOiCaKq9rkc9t2d7
         puSg==
X-Forwarded-Encrypted: i=1; AFNElJ8WtUOV1xf71CpUOE7Pmw+1IEAEZPW+Ezj3xIVJRw3HLVJPABewv8PA+uDhX7ITIj0krznfleri8Mr1@vger.kernel.org
X-Gm-Message-State: AOJu0YxSZbYdKZbaWMkTHht4tBhVzyoGnKpy/pdVGCDPw/dDIG2kXsY+
	nM0XlBZguLtQW2JmdiKW6GsnCeF5RxoLarBXQLxiPT/fDJjQyAM0JgFsePTdlc2YEeT3vJC1aeB
	UP1fkwR2ux9cL5ki2coISsDmSOoMgkwA=
X-Gm-Gg: Acq92OHh/beKj3pzBAsXNK1m2FhnkDXkcWyMxSpBQeQdnAYQUoldBtg5gacQ5Ckp49u
	OnjK9pjHelqRgPZ5dHbQ2MGwzhgIA56+AahxfludN1BtEVHZ3NJTZwVb1paiYBnTcZAmjqkvwgd
	PDmGxouwCc4D3jkBCW23XYi6p4+E7znNq9zKiOaUtst2eX3vtpbvM3er2PqvDehUpuPl8Wv7Y0G
	fbMbW+d8oK7ktUBtoCAx6sxQRYBOqph2n7aTwhPAUfB73B/w92QvEH7ee4a7QswrowHDGP6b4+4
	jbx2vg8q
X-Received: by 2002:a05:7022:f111:b0:137:8bc2:f501 with SMTP id
 a92af1059eb24-1384baef050mr4646305c88.7.1781504549538; Sun, 14 Jun 2026
 23:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528053203.9339-1-clamor95@gmail.com> <20260528053203.9339-4-clamor95@gmail.com>
In-Reply-To: <20260528053203.9339-4-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 15 Jun 2026 09:22:17 +0300
X-Gm-Features: AVVi8Cc0Nlsxbb5zkVkx0TdFg33anyYPsTjQbMqYQfW4SlpkYRj23DSVmIPKM94
Message-ID: <CAPVz0n0g3iHniWH2inESPf+xNv52QW4bc0h-Fh3KtVRpiwZGfg@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] input: serio: Add driver for ASUS Transformer dock
 keyboard and touchpad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 28 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 08:3=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>
> Add input driver for ASUS Transformer dock keyboard and touchpad.
>
> Some keys in ASUS Dock report keycodes that don't make sense according to
> their position, this patch modifies the incoming data that is sent to
> serio to send proper scancodes.
>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/serio/Kconfig                   |  15 ++
>  drivers/input/serio/Makefile                  |   1 +
>  drivers/input/serio/asus-transformer-ec-kbc.c | 158 ++++++++++++++++++
>  3 files changed, 174 insertions(+)
>  create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c

Hello Dmitry! May you please take a look and Ack it if you are fine
this this driver or tell what I should adjust? That would be very
helpful. Thank you.
