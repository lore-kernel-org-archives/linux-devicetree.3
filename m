Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3266338D3EF
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995955; cv=pass; b=pniX/Q8xMWynAyNi6MS8pGGfnKYilXthmeTObucIw5KawAzwFNBocMSA33j1U08CZJDytuw/imtE9y4wE4+ZO0gqomj6SahdbhASHRhlZIbORQe0bOqRtw0y+ru8XkAFu9sjK7YOGag1x3E7VlPyVO6B90f4eL5VBMsUxGZRj9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995955; c=relaxed/simple;
	bh=Arb3l0apixT51Ws7+eo6cRWV6eNyt0ISkTNyCaaADIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYmQ2/7PrFGC7q28tMaOym1vAr57qjO01oNUQuaGODJcBbHwC3TLdaGmKeV3AeQnzaJ4TfPto6ACuMzph8duLevsPi/ObiDkD4OtN1MO8kLIGoBi7iBlHjDz6YxT1goyXzlqU3ILV3X0PwwkAzulL5yQHxtLvlpsC8aINTXXExM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLFP5dU7; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLFP5dU7"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8423f1d8902so2186981b3a.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780995953; cv=none;
        d=google.com; s=arc-20240605;
        b=E9UKW3uxQhHSnFdXY+6n4o0fF6TwyMUsXCWAN5ZA2At1Zdn9HBDzEuQwoEslmY3JhH
         o3LJVWzyHX8HfWQr4G1eSKw38p9Q4FkUevtsVzk83JOTK3vJFQN0mhgWcyOkFFf9CibH
         gOgLgDKAKddmbP/6OgbGpdk8cjWfsej3h459HUvuyuCWlej1/LWMjsxg0dQUs2MLnzN0
         et8T972UYymx8qLUFlhgsNx7mpwSsT3EA3gBaSKP5t7xDJAlLt/rYfYAfY5NxulYduk0
         A4WYKFF+BfzkBPHYdfTXSBDxdluTCDNvm2fNMrAhpPnLC+7koHl15EzgJIAgJ6J/MUCc
         xwfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Arb3l0apixT51Ws7+eo6cRWV6eNyt0ISkTNyCaaADIQ=;
        fh=6wpNaNlAj4lGrl8zs/0gcJr0mxzg5NGT2crPwSf8uiw=;
        b=hOOB4bQoCGW1RpcQmmlxDq1j8Y2JYTGBkoTQfKgj/J1tB/c6yQO+wp4mixtCZ2DHqv
         ySVLCHV/1BHjA7Z95Kk+9Ouy/2z6K05UAiE+PQdWIUuNFzayOQQHjtGz5AaU9amYWk5L
         yNC9hsN1ZNvYcp3jN8308dMuYEbpByjqF2og/dI9YzcOCAwHRMVXi0wv8VMEjkLwGFMr
         19lgxfM3YcAPler7VtW50HjHlLePkgDxyfM1UvGaFh8i+qHIK5ZYR7/u0KsuZ1BD8F/J
         EuqU9LKKRU4PnP+rtWWr2TMBC04TUB6oU2JCPDgQxaEzz9mhCxiXvjDDqL28O2tvVOYR
         JAHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995953; x=1781600753; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Arb3l0apixT51Ws7+eo6cRWV6eNyt0ISkTNyCaaADIQ=;
        b=YLFP5dU72+eR5ojwV4xaHmL4Dso7O4lJzTJZ75n9R6BizL3klJHu1pop5GIrA3AKIc
         gaTKtelrPVxhkrTpzIK75mDOI2BYlUvjejp/A+zalPTS3QywffToqcL0Nasxb37RsnON
         EgFh1hfJXQEiHDm0L8+KVscG/3whYm72vSeQwySN3Vx0Q9wnfne4VXwehDcy6vUJDWsC
         bVR7gi2JUaPtsjdRroZ5X48OYz4SYu3j0W2+F3BAGNKzJtFkz/BnT/qoYbdOyq7XQg/T
         sl5nsc/ILE3oOiaLa0UYaDow44NwBQ8SBppOj6VgfwY3KbS0Oycp886y86+Z3pNfJMi1
         b3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995953; x=1781600753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Arb3l0apixT51Ws7+eo6cRWV6eNyt0ISkTNyCaaADIQ=;
        b=rAvVIt8K9QFXiuL/8RUfy6DClaX5JB9Q0GbativA0j9hiiziK0GkSQKj82+mHI/omm
         JuDdXDpEiV32u5/FB7zJbHhTLnk6VOsO7DvfCryKkIyPnljramTvcXK1AVYrM/O6fsiQ
         XYtsVFGHQUAwBKkEIqNAgALSYZFN9t0FVCIahc5UA+z7SoFACt5xA0Gosdgc2xMI0Lkc
         aJN8aczYRpcRpj7xs0BRMONGousRReSCKtGgWUtfy3msFmOhDdWG9JJcUGOwV1gXmnPy
         0dJb7qb9MLy6E1NxdSDbw7+4MvTulVb1F6wcFDKVqzEZX12gfOBem0MEPeNl7E8hJ7mS
         L99A==
X-Forwarded-Encrypted: i=1; AFNElJ/2prBx6D7bN4BYHN+LhTRl+bJb2mJeYzCWPXNy6tPxQ1NSCrjrW5uRqO5qRGJFhDbYSZeKT+6zMA/o@vger.kernel.org
X-Gm-Message-State: AOJu0YyjjvRuvQS4IoQZfPMbercJ75QnONRZnb9FIQgGuDrqJRjcc1g1
	DX8vezl8Dwk6flOQ4DaBiT/hix1L1xoKEXN+TtveINMLV4Ic6yeFN+tKxd+/KBnrXf1oVOftQFz
	uQ1GSbBghDbJIpmFd4aFgM0zbR/IryLc=
X-Gm-Gg: Acq92OGiNhAq7Ls0EThLJATq3hRUKM6h6XcZdu8FQU5t/U911n780BsodfT2072fdV7
	UOIa0Qbw3j4x4gF5WOo+J0bFId4VL7je/XMkhgZocICIx4dUAQm8UvUzjjB3XXcQpJEY2MZ09YJ
	eYGzj4LlNCKafrdBZOJcnh4IOBFOMX+g8yncgVf0ZGzOsCEM4mcpmPRg8KEFZf2QE7B4Sp0EMSW
	G6ds+cmxYoKZ04Z9jt7vCyzLewqJTwt6l3S5t637NSQCnU6NP9do0e3xYmqMtEPpYz5xA3K9z6G
	doeXpIZplI7RP2sspvrmpttcG0NN3DTIxEmV3aDz1xCu0lfN
X-Received: by 2002:a05:6a00:ad5:b0:842:2419:6c0b with SMTP id
 d2e1a72fcca58-842b0e11c7cmr20087951b3a.10.1780995953465; Tue, 09 Jun 2026
 02:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <20260609013107.5995-2-phucduc.bui@gmail.com>
 <20260609-nimble-guillemot-of-karma-bef5f1@quoll> <CAABR9nF6uhEyCo-6cekhKwfm3zkqjXCpj2O8C8Xk=2Frw0arRg@mail.gmail.com>
 <6103e3fc-4b27-47b5-aee9-8b481759eb65@kernel.org> <CAABR9nHBA=sZsw54RWMCg_xdDCeo+stnSYg6yACfzuJoMNMyPg@mail.gmail.com>
 <d610ea66-23b0-4691-a0d7-6a32e42dd902@kernel.org>
In-Reply-To: <d610ea66-23b0-4691-a0d7-6a32e42dd902@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 9 Jun 2026 16:05:40 +0700
X-Gm-Features: AVVi8CdtFgeretXS95PDA9wmrlEPo8ic58fZAHHdjLlUvl-toQFSXd88bhJWIb4
Message-ID: <CAABR9nGS_Rd=tCjhCDu8EDgCLnx97mM1nqGbquHXV+mwuUczYQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for the clarification.

>
> Odd. clock-names are string-array which has uniqueItems by default.
>
> That's the first need of usage it, so I think you should skip it even if
> it does not work correctly - the true fix should be in dtschema.

Understood. I will remove "uniqueItems: true" in the next version.

While testing, I also noticed that the schema accepts cases where the
number of entries in "clock-names" does not match the number of entries
in "clocks". For example:

clocks = <&clk1>, <&clk2>;
clock-names = "fck", "spu", "icka";

This passes dtbs_check on my setup.

Is this also expected to be handled by dtschema, or would an explicit
constraint be needed in the binding?

Best regards,
Phuc
