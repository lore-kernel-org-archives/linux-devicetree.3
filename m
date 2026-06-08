Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E63BE164
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913440; cv=none; b=DeZ4kJ96Hi6CZWSJ7xGgs7fry50Kk6P1kR94JQNmdpMq+5iJBpRw+8UmeNWHnci1xda0ltoNIdMhukCgYczdz2buvV4Yyt59zkH4ii+o7tGRwaoQluxTnHRG4SyzewijF3v+RcN9ULZbyAPQs+Tz9mQK0G8AKAV32Q5fE/kAp/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913440; c=relaxed/simple;
	bh=6hpTCbdzeo/gi0I81ECZSMINClwYHfHsrmF9DttWUNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hyerFs/DYxd0g7DdB2DskxTkWJDCdH0TpzSi8QvjH43AJnlbDEG+SuUybI7d/PWSoCkEwEohG4TOsPaGYvyKMnVC/6vDsHE/YsJ0YFXOZkNTuq1foZD6RLuRSwD9OMRbLgEBud48dpMHAciG/zahyufUDsOGMZlKm5+wFkAtdwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvlA71eA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvlA71eA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b3637b90so34916395e9.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913437; x=1781518237; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=emvy179z6dJMDrgPyiwVsfcWZgJaGh4YAUAbF2ldsPk=;
        b=kvlA71eAUnVrEzxMNTj2wZVeyJwTMozTS1lBHoYGsZ7kubLbswSvl81di/HC6v7JB0
         7+qdbBBW6VQIFQk4zj6KbPO5qwpRIhLRPII+Lw1nQxNjz8O4GTcIVwFkGjde5zE4zswI
         hldRzYYHTMaBB3ZvZa5VAGHEhqAaqeXT9doCtiGvUDJTd1fHChwKUolgtTk5NwFOnVh7
         98cjGzzfsmBJx5l8srX1j+xeLigejSLkl18Jt+oJr8fOFiQjxEFPv0VGV0h9+2FAKhb4
         DiA0Bb67sDZsa5X5idjGFLpeMHAetyMW/l4orY9wtkFOF9Q+QW4eSTDRRgUMnAdlGY8U
         TV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913437; x=1781518237;
        h=content-transfer-encoding:autocrypt:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emvy179z6dJMDrgPyiwVsfcWZgJaGh4YAUAbF2ldsPk=;
        b=I6mw5cNvSX3GpVumhKfNHFV6+6Pn3/mSHQBpkePDZd2KbOyJ8Zk9XIm2UivhowLOzk
         dJ4fMMJd8MFPWqDdxEooC8yRJDNjAi5xuTfPybuVlAwQdc0TkxDzdLHA9nwQNtTeXvTK
         ny2BhtX/2uTBud9g/tfqfpk/90jic+1D7kKclrGObr+9wVuTFUy1LwiDUFdMcXay3NtQ
         l8hXi8oJlrsXUQYqOku1ESxWL0cLUa5fgwg+1IR2ko9IMyDMit6aVpa8gBYJveJSmp1n
         /aDR50umQe91hGvhx1bnTCYo/1+HQu38bAslRqk1JIiJ9iqaefUr4RTbtpu8srd//CYD
         zYHA==
X-Forwarded-Encrypted: i=1; AFNElJ//ZOWZ+eBOEzEYaidrl9xA337Ef4XySkdTXGXmUVERNCa0DyEyn//3f4U730nWP5fXsA6PFF0z5qGX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/HH01wso66RaUS2nciWtekP+IxDCbidHq1BfVFOIU/jKjsRZ2
	tiiWspAZ+JPsBrVueLy8nFrIjIwxZvkPttGu5vTqK1vvXenAc3MolPt1
X-Gm-Gg: Acq92OFvQeQd/tMaBfEGTLjKdL3b3C1zgwIDqcnC6YVSq2KEy5wa1MzHSbpMeLSbEOX
	BgflZsjwRy0sEUISNCRrSmJPyUXAjeOq7eFNpuNnX9GELjy/avkzpSdNFxlpodPmTiP4X/NXgoW
	k8ermXTRSulRyIHzsGzJq7p6FCpqg/abZUJqMbiz19xZrfy0D3y59I8nb8gB45+BUQM/ED5Ytcd
	In3cE3hw0zBKzZMWFDneure2e4Q+JFmCppA1oNLJtTbbgLtC2AT+B2dD03kJsys65/z0MRZauAc
	BQFbwz7lz0wCpOYmtbd2IqDxlFrXlWa4VTj9XRWlkYXKoQ6Z9TWcC44JJfuuhqRjGcQB75RCotU
	/ZAqoGRCXFtA2JIxmkrLocneVqg8F4R4MzCZn4QWOyIeJJIaaboJ+lwVlK09EL7q/jTfk4VzVZH
	x+BsXrcHrD35cFFuWboqsAMbCXGOVRN7sQN/Sf9mPrf2Fusn9bhKJpOdzHJjGfbmhjk+4ZNsdqE
	gIJeaOCgfijlhUHYE1Grz1hliQXRA3pe9Yop+6Jzr4=
X-Received: by 2002:a05:600c:45d1:b0:490:b9c3:6c62 with SMTP id 5b1f17b1804b1-490c261007dmr239801185e9.28.1780913436730;
        Mon, 08 Jun 2026 03:10:36 -0700 (PDT)
Received: from radijator.localnet (93-143-176-63.adsl.net.t-com.hr. [93.143.176.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b59f0sm445526375e9.2.2026.06.08.03.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:10:36 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] mfd: 88pm886: Initialize battery page
Date: Mon, 08 Jun 2026 12:10:34 +0200
Message-ID: <ZyFElwT1QjOADA-7NXdGRw@gmail.com>
In-Reply-To: <20260608085524.GG4151951@google.com>
References:
 <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
 <uME6Hy8mQeKxnZAg1Q4aPA@gmail.com> <20260608085524.GG4151951@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=dujemihanovic32@gmail.com;
 keydata=
 mDMEabRVUBYJKwYBBAHaRw8BAQdAG5VJBpoPRIGQml4+E2LcPdyVtnXRuuqoD1BsHxRjNQ60KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBJvUYwF2kA
 idqo3CZidfVEs7G0eSBQJptFVQAhsDBQkFo5qABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJECdfVEs7G0eStq0A/1SDcm8Bkq1JV+GTGMC8qE1QzCFvnoJuZqtUuQRCkd31AP9Mbc3pmg1K
 JDxgPl17/CQohZ98dbUVffmdQpJJLLMsArgzBGm0VXYWCSsGAQQB2kcPAQEHQH8nnS6QNfgpc1Y
 tqU80DWMWMsDPEGJ7yZ9Nf90mPEEQiPUEGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCab
 RVdgIbAgUJBaOagACBCRAnX1RLOxtHknYgBBkWCgAdFiEEA6Ue0g5lV5FAcj1ivjIt18NZWcUFA
 mm0VXYACgkQvjIt18NZWcUyDwEA5OK1WRFN4/psOq/bS6Wuh5ysy0CyXIydqIwDJDdAFukA+wfc
 lr1qyAbEX0FHVunCl+sxv/ymvjsup85rAH+a2j8HA7gBAIolabvAIUTUfCQNCu5MUt482b2EC8K
 40xl/6HT43dunAQCqxwRLI2k0xmTdia2AZwqbbMvqWonOLWtdZwWvodgjBLg4BGm0VaASCisGAQ
 QBl1UBBQEBB0CoqkQL2R15WHRvj3RlkxjW3pPpZVUOHyfhEX+Q9PhTcwMBCAeIfgQYFgoAJhYhB
 JvUYwF2kAidqo3CZidfVEs7G0eSBQJptFWgAhsMBQkFo5qAAAoJECdfVEs7G0eSnB0A/3oyRxS5
 cUJMNnM1+4UkRahmU5/42NfVOxIL5d5oaW13AQD617LpOfnCuZR3U0vHLOW5vrnFtdvi32N5zLD
 9wyShC7gzBGm0VbYWCSsGAQQB2kcPAQEHQPRL1mWe9nIhjicyAqqEN80IXEF0NeKSFFpN8n75b2
 YIiH4EGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCabRVtgIbIAUJBaOagAAKCRAnX1RLO
 xtHktyGAQCJPD6JsQhQZEB8ciZrJz+hnonsJp+KZZQQGEK/KsLHEgD/ePz/x0pQdI/DcJd/5Qge
 +IJGd+jyv4zyevPxipVbyAo=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, 8 June 2026 10:55:24 Central European Summer Time Lee Jones wrot=
e:
> On Sun, 07 Jun 2026, Duje Mihanovi=C4=87 wrote:

[...]

> > Lee, do you by chance know how to proceed here?
>=20
> You can move them.
>=20
> Please take into consideration data-size as well, rather than blindly
> following RCT.  Larger items (structs) at the top down to smaller (ints
> and bools) as the bottom.  Luckily the larger (data size) items also end
> up being longer (string).

Am I to consider the sizes of the pointers or the structs they point to?

Regards,
=2D-
Duje


