Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292AF345729
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 21:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778449465; cv=none; b=F+5Kerc7fTk19TB2qrZH1oLaKuOjKsqAgtJBa6chTvog3VfRiUmGaOF+IQ1DTUU26vxGbpLvsHPdgMghW3hJQgYAX6/dwm3jnCPeF6oVni72IHlat/ssitlecPXWT1KwR6b7k2pwMuuRbqUOA3g2wyDuHXVKsS+QokDM9t35JUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778449465; c=relaxed/simple;
	bh=9PGauRrzIPvJQQBGe9qqeSNW7mE9+oduTX9Qb+UYiYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=An6Ixz5NN/ZU/8rH/rKkNnuo6foY4AHoVqoIGFkhpNuGEPTpPQ8SNAhbhPnJT/NkeuO7ljrDJYSfVZbc6KUS/MFe35d9WIIfS9BZsD+531qctcazAOC72NvphBK1NSlPbIBtEv6HGkE5L57ca+3rwfuCZxYVIo8X+bZ7rXj4gt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYKvJ7rj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYKvJ7rj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b0046078so29988555e9.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 14:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778449462; x=1779054262; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0I608nOr5T/ewLNCbkEXQ+oVjvkUSUcc64qKyYq/s8=;
        b=iYKvJ7rjpYJvBnGNtCSWMi+iUR8qwirNV0XXQI0lN0neUa5b2gwUzDBYEKIfYHAt6K
         hz2VrZiX7DW6xLIH/RaujXTviitWNX1jHmNBaQHYNPZjatlg5yffYCE2Yb2MaSnPjwH5
         Cqea3Dqk06rwVZKgIsIQkq74eE6qub9oBVZlcPCUsDUgAwSaqn0vKgnRGik1WzRf4HQ6
         5kKHxXf1fgrMtUCS4h2jkIxsy16Y4AZd6k58mJNIJoCbWpDvUFIL8kiqPdIpPl9z7sMT
         aKszI0/9NjbLm8Wzn3xFo43tLMbx026vExyL6SSAzHaatdeLrBQNoZ884gfBHU2qi5Ja
         9dRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778449462; x=1779054262;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0I608nOr5T/ewLNCbkEXQ+oVjvkUSUcc64qKyYq/s8=;
        b=tB5QbP/b0fSVJoVl6zlWBDqqTm/AO5mb5vaNXKR2OlwpBiimCFZAP8Eqx+f7PIudom
         DSfXm9ux29Y30Ve5Hq4kSyWJ9Pe1DYjwVCSZzTQ2Uw021ZxoiWTrUjwhPTzpYN0+H98a
         I1ks79PBQ/TAoUdg7OMnJREtwwoZfqmc2YzgErni+4gEr1aG/4L0ooE0Mn3XvVyA7bpy
         Ln+604NsWQDCYgQFz9Hy5XfhafnOBhMhQPw/MgNbkZigGlrMX6tOQ9L0rWZANuRVb2NR
         IlcFF5W0So+swgecP17eCyJmDbu/XQJOQx5T2CkCplHySoG1TwWGgG969sz2WXXjm10d
         Hw5w==
X-Forwarded-Encrypted: i=1; AFNElJ/TjMs9bD00facr/P1nvSAh2/AkQjszNPUszE88JC0qxrLtqtHlfF9bq8XfR7Xpj7j6Qr7uH9xoT4JE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9yYwqVnInzCabUNutpFTnO/oaLzmrhHwDXn/EEzXgUix0TeyU
	nGfyM2NjB7vRtWY3kJECeqlMyvy8f1J45UNPZ+RLH4WGCAzV7P3lmy/I
X-Gm-Gg: Acq92OF1g4pdGV1lx6UFZ5hPibeh81COVNqseqKX2UI21pQIJ3F43+RQ/AxuUfe4A4v
	T3BzQIx1ZCI9IKBx1ZDHg2QM9DifGLSIYVCgVKirAaJ5XJ76EW1h7J+fBZhVWrBc+zYPGfNb4o6
	gO7Szrxzbt9zEOEEaR/Dq3BB/jXvkxqtBMJfaTdseIV0b8qTEQ4k4H4PwbmoLY/hHKCKU4w8Pyw
	9bapbECxDzOFeV1P6pBn49FuM4z9qBqvy+mfPo4IhbEnsReF2EAbo+aR8lsNmbfpLoAUtoiNuhI
	ZE9I5wHCI559xu0ikNiNyhbRBLSfysxzcBzIp4MPFgsEJw82uKztlEzizUq0ZEZ/IiqM0QkCr2p
	Eubj0Tbj6P0+IO85rHup2Cr1yxa6675aT9sZrXsPUwp8LTLhdBDY5SIUC51Tp4Q781ju1GWfWrr
	r8M6BpX+vjbuaRHBYFV6znGCi3XnA830ycGBwRI991X8c=
X-Received: by 2002:a05:600c:8b65:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-48e706c7e20mr118280775e9.22.1778449462329;
        Sun, 10 May 2026 14:44:22 -0700 (PDT)
Received: from strix.localnet ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7041defesm143551425e9.15.2026.05.10.14.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 14:44:21 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH RFC 4/4] clk: zte: Introduce a driver for zx297520v3 LSP clocks
 and resets.
Date: Mon, 11 May 2026 00:44:12 +0300
Message-ID: <6334180.lOV4Wx5bFT@strix>
In-Reply-To: <20260510-zx29clk-v1-4-e1bacfffe967@gmail.com>
References:
 <20260510-zx29clk-v1-0-e1bacfffe967@gmail.com>
 <20260510-zx29clk-v1-4-e1bacfffe967@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5167878.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5167878.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Mon, 11 May 2026 00:44:12 +0300
Message-ID: <6334180.lOV4Wx5bFT@strix>
In-Reply-To: <20260510-zx29clk-v1-4-e1bacfffe967@gmail.com>
MIME-Version: 1.0

Am Sonntag, 10. Mai 2026, 22:01:03 Ostafrikanische Zeit schrieben Sie:
> +       static const char * const *parent_names[] = { "mpll_d5", "mpll_d4",
> "mpll_d6", "mpll_d8", +                                                    
> "mpll_d12", "osc26m", "osc32k", "pclk" };

So this obviously doesn't build, and I didn't spot it because the git branch I 
sent this from didn't have the Kconfig options introduced by my other patch 
series. I'll resend, my apologies for the quick v2 spam.

--nextPart5167878.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoA/CwbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiS/YQAIf0qPo56nJtvWnvshjI
jYTbtH4/9VEWn+hbTxBWhSKMeLAZrhArnpgzBZKh9eCUkFT+gD8J/qIIPINkWDhk
6fX1PuLkXwdW+MpfdkjontAdN/EZhm3lPeJhIGt3GruUA00eNtpn3iycubfSYcmK
5kMq9z446fozdX66/Oi+TUL2jbXvRlByXqFGznzqZiyd+lolxlnm/Wifzd3Ro7yg
qny8kAsZ0EaW1HiuHKP7SHIFfkSFoeQUIDtpF4i+TIFqqSMb6+SIOa/iXwQtRMgp
rtVRv2XwPPYL6G6dKbDrjJiFThvbarchTCVxXmRsUtXYH87oMy5GKuBzoEed5qwH
ApZH4okVK3eELxsk+Dpu6VYtBftAMpTOWf+87Z+FEJRu0so88yioA1Gw4DJGmuAT
fiV9X4a3B96Z/vtvfFJRHwWIhMaRkwWcoxis8eCtM/6X8DmLQWUHCd8SKZsz45As
tHjztXUMwmC0F1FL1N68CML8a1MUQ6lhGroL5xj9BfJYf9UH6BpoACH9Mi6Xl7YT
d4Lq2qi7CS+8Spqt20uHR9+6bPYkLo3Ks/U79EcSa+QTg2Ug1P+G6QePlGEoeS7X
YAQX5PCivPvMa7mTTw4jnT/3SxZHBd/KDBTpdnahl4QYDXrvxS9T6kKr4dkbzLru
DjFXREbRhcS+D9cuyqvVoOWy
=5+QN
-----END PGP SIGNATURE-----

--nextPart5167878.31r3eYUQgx--



