Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F9E3375C3
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782809641; cv=none; b=BqBZTe7er+XwVjHVdqM+c+Lg7t5dg4hMn65rnoPONjsDnHEDZgTZ8xiQenRU42k6kcBwF+j3gmbcFHn4dbapuP4BoHQ4DFE27BDKtM3mOJKkiOP2Xy5HPnzOhqPC78F4jeHJvzI0ebseh9Q47IP9OK37SbbRvz+4hP7+rVsBrjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782809641; c=relaxed/simple;
	bh=jSqCbiw8rPhSQgPSsHd7R6eVF88l2Y8pZ2SQ4YaLbnM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qYjnCBtaRXJLyx/JCGwadOrPYm0DTWcO8viZDknXJV/uX9HFmz9e8Fi3gHGgPkX13usvBdGRXXZOyAEKKsDJJn//0DHQjimCv27rw5s9BO0fzKMoZB+8uR+BmFjhs37n7fzK9DiDZ89tJheVQfCwrfrZW/8nY2bqmoxZfUBWklU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHvE+qhx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHvE+qhx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b966dd74so3002175e9.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 01:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782809639; x=1783414439; darn=vger.kernel.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3p5N3pSY7f2AmTP0/oS5IDt21osoKJvAm5wj7AjOhYY=;
        b=cHvE+qhxJvEN7A3RmEoEz/b0SL/0uv6pB142b62xnXECyfIl4OHuJvwCfrMPEnPZhd
         LR8la3lIZEy7inW2OaOJlWhAPaV0/FAPitBHR0zuwzjlwIiVTKAYtJpXPLOFIo559Qh6
         9zS2MudCthN+4vb6F0wNwsZ0tBXjS7Jn0MRzaLnJ6+Lz2R5KStJQHNV11HAdOLmHoeJ9
         7KpCIfBQIV4vOmjVerXkn/G9OnxG10txMIa4SmpT3jk2jbGqVyO9j1Cz3BhKN5wXh2rq
         oo9Cm7j9EUcQeRFBLG+28u6/KdAV56Fh/wl3pneLc286AjaKmP0pK/OkRBhiZzk6gI6l
         50tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782809639; x=1783414439;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3p5N3pSY7f2AmTP0/oS5IDt21osoKJvAm5wj7AjOhYY=;
        b=j9Q43RMY7cFhl22jPQAHU2u0FyycGhdXBKW9iVju1W4EPCXFcHTZx/tVKc5mMkwJsO
         cGN6oKgJNZ8YqUxp+3NkYx2k/VBAUBMaOK6fToyHX6619zuYOuKCF2/Juydn+MyA2Fs4
         eVySKW+Po6QBua1+4HskYleOGXU93c+PAfSr8FwmniWqvwY44UsqZbmwOUJ8qqJtd8Io
         dd2fOCZbTM6PqHJdkoYL++8/9OW0Nj6RPiKTkwYddMtD6MaMOxKU5uX/2e6gofCUeN0w
         /5PlTub1Mf26BcEdW1fxYAa7OY+ynCStUr5WSiQ70c673jTXRuUiewmk64FuPLPl9eHX
         o3CA==
X-Forwarded-Encrypted: i=1; AFNElJ9whSJ0ZGMlwYuD49JKrpiNknpd+oLxFDK0B0l4NkbzdyH0fH/aYTEowQxzgh+Z0s/vUcmycOIdNbpz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc4ztYqI4E+61Km+hB4vfSeE147RTSlDpZP5+gS6D4BiuWkq4v
	6Ru+JjR+sFwe+YNyirxOwcVgdvmNYZtaCntVXLzE8j3bATHZdvjbcl82
X-Gm-Gg: AfdE7cnEF8yQJ6L1jfj70cChdOk9mjqnGpbrMqbL/7pfHCsYZn9Kd8PZezffCHK7FHN
	JYW+0eap116D8F/Bo5VBEIebY7B9Jo1ZhFTl0ZsQVpQz8nA8GimhmgArCaPM4ajLKqzaOAyi7pz
	9KejRXbodT3NP2StEag6voY0y33AeXhHigAmwHalytDI0E0qWTTEmMBEj9DqRh5js3yEbYUWGnx
	dvsj1uSwYSS4DkR1G/ZoBoeEKVYMTrIVwxr5oxi8I5aZOcfMFXkrvffUBWrkQKl8Xl7wSwsPrqM
	nRvZARsnfxXPeJZ4o1o8ydvyk3NkeHEL1ZbLdZT7S1rk1/4oFjQXQLztmfqeUcQI0R8BgJD58pN
	cbmoUbpXfZ1e0JDgEs+lY91PWyniTIG0ZpS+FDtbYQYqlakhqDlaPpw8s2yiu3KrTYAvIOi0Q6N
	9NV3iR7Y46OiWmQ5+SbsyMYRwLvuIJXGLvgSl0jOAte+fVHPuww6S7
X-Received: by 2002:a05:600c:c11a:b0:492:3da4:81ef with SMTP id 5b1f17b1804b1-493b82b0e50mr36934455e9.18.1782809638753;
        Tue, 30 Jun 2026 01:53:58 -0700 (PDT)
Received: from smtpclient.apple ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bc7aca88sm46787785e9.0.2026.06.30.01.53.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jun 2026 01:53:57 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E2D32867-FDC8-4398-8E1A-361442408B27";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH RFC v5 05/12] clk: zte: Add Clock registration
 infrastructure.
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <c59fab242716c80250a66707d7ccaaf243a85aac.camel@pengutronix.de>
Date: Tue, 30 Jun 2026 11:53:41 +0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <84C4450E-7355-48CD-BCBB-CF619C27EBED@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260628-zx29clk-v5-5-79ff044e4192@gmail.com>
 <c59fab242716c80250a66707d7ccaaf243a85aac.camel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: Apple Mail (2.3864.600.51.1.1)


--Apple-Mail=_E2D32867-FDC8-4398-8E1A-361442408B27
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Philipp,

> Am 30.06.2026 um 11:27 schrieb Philipp Zabel <p.zabel@pengutronix.de>:
>=20
> I think the MFD driver is unnecessary overhead. Can't you just keep =
the
> reset controllers as auxdev and use of_platform_populate() to create
> devices for clock-controller child nodes such as syscon-reboot?

MFD for top and matrix was the suggestion of Conor:

=
https://lore.kernel.org/linux-arm-kernel/20260618-fantasy-estimate-6c52edb=
c6890@spud/

To quote:

> I think aux bus makes perfect sense when you have a clock/reset
> controller, but once you start expanding past that and you have reboot
> or hwmon or hwspinlock then mfd starts to make sense.

I can go either way. To me aux vs mfd seems like a distinction without a =
difference.


--Apple-Mail=_E2D32867-FDC8-4398-8E1A-361442408B27
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpDhBUACgkQPRO8yFRP
GiLDTA//XuiFvq2hvcqMHFcgqCiOzfN6Ejynlaa1U0fpgCupiwkoTk7x7V2F9fNC
GDJKF2tdhcs7CpooAxYbSMwhLT4UlSuCWBz+Op6qj4ANOJi0L/kMelslIMoZG5qc
XgAKSrho7pZxbYl1BPd6iNZn7fU6ejh9B346spNmR6Kjk8o+7giGQS527j2Qlnfr
Lgk0fnGiCcg5uKdkynAcTArHAJN7Pt9TjBHQ3SxjC424lnbUqeAHZ3MVb+nMbM0L
vbSSXmozV0xj2RPFVor0EUYhXWT8jsF1t6TfZCycP/DWL4oVMa8nzBtYRM1E6D7M
Sz+Yc59noQ0NgNeCzoTDR7iBR/QkZdsq8WB6Q5cO8TMVcDxXUOTIU0cyVoFLimjG
y8cNXWjGqhYXYbAT/7W/Y/MlTT2Ss20ssTNTTP3WYoORsMjVrBUtAiyI7FXpaZIC
7u272rGUcIf/EyhIBuIOtukt1F+YwWytOoPqDXzfvUX3OyU/VdzlV63Ee30HlnOT
JNjndlqVVL4aX7BgJIBKkP4gEd815JCX6I44nlSbLWs9375U1uwYmkWgqhKFLx/S
gm0fMw/AxcXSP+XbtrCnbIMSeWSWtlW9y+itnxhISdD9rgx00WhjxnoX99ywfat9
ugTXugS0oIxmoGGxLvMBTUdKcXQjk0V/smaau8JmSbdZujZ0lr8=
=DWLi
-----END PGP SIGNATURE-----

--Apple-Mail=_E2D32867-FDC8-4398-8E1A-361442408B27--
