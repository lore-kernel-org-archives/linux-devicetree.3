Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373504;
	b=Ia4peGSqr3Dvi6bx1jIlfO/wPrRsyl3wYmIGVjbB8DYo3hpmuY2iJXfpEuPlvpQR3ybH
	 tcH1VlXlKCOgpJW/qGpgp2rNL8HssOumnFYsWrSviOoJ8zmE0O90v9NwpWmpqetc4Bhsw
	 t2zomfr4Jyo8ljEUOb8in2iSKXcbUd6yjCii0BQgoKEvLO7gG1QVF6ryvkl9oTgibU7G3
	 lo4wQhuRM/vZn+zboPJWQWKYHoIGXjBQwj5Pq8XOzHHMCyHQaqzYrgfD1IlHzS4iXwdP8
	 eS1j3HGzeZ8G/1d0XVeS4sWZ0xN5FYjo3qbBVl0cKuEkjNXcn5yMGsSUL0GOzZNNFdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373504;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IFxEKJMtZIkQGZKfSYRvowzKuK7BCrlRO/z3l0BUM3Q=;
	b=QzQh580Sg4M6bycjPrXnCmEFcNjP8v9Nh9tiFA+Rgv33t6et2kdYFc9T3wCkD/hCoQS8
	 UXPmZ3yIXmOt44/A/w+BSy1gBoGxLkqZLO07MX83Z6wz+scHHAk2KjBuxlYAacPJnvVAh
	 zvWA4w/I/EndYluB0KniLsu55BUUkosjYUhevedh8AC1oMteQvS7XviIsSRQbYwKXuQsK
	 6KjyhrkpPrxAbUWoN0xi9uFrDsUwMHMJSMJkJYMNkjRaKie2S0vj78rrSQyGHXkG/T7qh
	 Rw06Kcnp9U+9BTkVUN0AdouGdq4px8m4VbmMvlgWFr3jkEi/kWfPa2B478y96GliD/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P4Bh+w3u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84549606A331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P4Bh+w3u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBAB1F000D3
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795373504;
	bh=IFxEKJMtZIkQGZKfSYRvowzKuK7BCrlRO/z3l0BUM3Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P4Bh+w3u3ol1/38SJqbi7YQPNIQLnKht8tYqK1cfs1csG8iQYxpq+W8AYSILWV6Oh
	 ymhYWmDyxJ0t6cEKdMuYvQ01nncHAXKblQrtMpLlhuaWr2Z/aEK3GT+mB9IKo0g26q
	 vi4X/D+9E7Eon/wbX3bz/TlZKLWmnOuxNQu5YzorVCj3XEuYI7jQVo0b4Fq8gknUuj
	 +J4m+UTs0rFzS2m+KvN0mLgJr5t8Pd7pu0iWTRdsnUe1ox60LZAjFuzMh4JCQIesas
	 NHsKm6mUgzcq7su3jZVBGHrPncMDJFCYqBY6IP20xP7aSuNzDF8cvmYSlAPGTgnUNm
	 y859TQRKxitrw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be47aa555cso3134758e87.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:51:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEhri6ZiV2ov2EYtcKFWgHdGrBN0uuiV0uotvVT9nP1pD55biHeNB/PtvmwcFf8FCF+IWbye809Fsjh@vger.kernel.org
X-Gm-Message-State: APuU4Z8IWXY2++aBt7wXRsbL/Wyb6mU/3dl54ANoWJaqucBj9BOQzVY0
	Hm3/7U+BaWaxk2iGgOQ93H0SZsf6ab2ommVssCPpGAnwWowW6Wsy6hypQCvEYkZ4sh1FjgX4jHL
	fvn3P4cdThR1vWGqAIugGesKCr5xp/V4=
X-Received: by 2002:a05:6512:b14:b0:5c1:c4b4:a3e5 with SMTP id
 2adb3069b0e04-5c1c4b4a448mr1963937e87.27.1795373502781; Sun, 22 Nov 2026
 10:51:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-xg6846b-bcmbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org>
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-2-f584e8b8e696@kernel.org> <179510274338.63755.13074299296013371295@kernel.org>
In-Reply-To: <179510274338.63755.13074299296013371295@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 19:51:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLkOUTrjAgnV=giaKx7JBnw2hKJt+-Fc1nyiucbZLLz5=A@mail.gmail.com>
X-Gm-Features: Aa3M54oi40sU1I-FOZgHO1ergrn0hI-8Xi2jBLE3eOccsrb0FB_MO_lAfbrL4AE
Message-ID: <CAD++jLkOUTrjAgnV=giaKx7JBnw2hKJt+-Fc1nyiucbZLLz5=A@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] mfd: bcmbca-pmb: Add a shared BCMBCA PMC3 PMB transport
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Rafal Milecki <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Ulf Hansson <ulfh@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 7:49=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> Some inline review comments, but the chewy stuff is at the bottom.
>
> --- checkpatch.pl (2 issues) ---
> Line 51: WARNING: please write a help paragraph that fully describes the =
config symbol with at least 4 lines
> Line 374: WARNING: DT compatible string "brcm,bcm6846-pmb" appears un-doc=
umented -- check ./Documentation/devicetree/bindings/
> ----------------------------------
>
> ?

I don't get it either. The compatible is right there in the DT binding
patch 1/6...

+    properties:
+      compatible:
+        const: brcm,bcm6846-pmb

So ... was it checked on a branch withour patch 1/6?

The rest of the comments are completely reasonable, especially I
should know very well to use MFD_CELL and guarded mutexes.

Iterating and fixing.

Maybe the next version will look more appetizing!

Yours,
Linus Walleij
