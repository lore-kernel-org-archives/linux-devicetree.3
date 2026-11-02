Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605848;
	b=uHxjl6CxXUWNJ/XRND8Zi7aJ/gNajrupfmJLYFs6w78KwImEqsoa7cl1MvlTGuW7v8EZ
	 2B9VDMne9vGKWYEkNkV0AShNDjWXh78khi57WXOBGXN84qf2Yncd4ct5tMskNm8KOntOA
	 Aopq2yEXwSi8MYJ5S2iAK8+3l+Xc1QyI75uTOUsM/wJWedQZW+DJBr7fbm+h6NEXlWsrd
	 +GNKiMTU6HCosT5tqxgynCHBIiinm8C9RNly5OFJnj58JxP6rf+qmM5Bedv6PjRlaENUB
	 Wf+r3RtESfkgosHSm07RU/enDYNsPk9HWgLg3yMfnMseSa/TmoUiXXzuJ6duoOWnORA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605848;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kfdLzuznSP86OXMBv2cc50+pGlhDjviKqnXgIgBSXeU=;
	b=NV/RbNrBxrdyexsppn/gc4q13/WrD7o3wbyPgZ5BI5vQ8FjjQMAANcGEtAJyoj1Bdk5J
	 CF5QNDJjbHfllvO2nm+vnfrNH9KigijOXzMofGZu4tl0gVIheXMcHMwVISbuFuPD/4QMd
	 XmYfcfUKtA9eGVEOq6Qg68tCVXodBR28wfldQxlAcYPxe55xRhLDgWoyq6gUl87S8tpCh
	 9KKJXQxmWiqwoJPkHUi9WTahKf6pDBMhsCDvRaY/PFxg3AHpI+V1YEkUbUy6VzLH+enc3
	 wAtejxrEvf0MGw++ECaTjGs2fPtToaiOquZu7fF9zTMmFC9DOLtiGU/IFtAM3MoEUHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CE9606A32C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 07:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102771F00A1A
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793605838;
	bh=kfdLzuznSP86OXMBv2cc50+pGlhDjviKqnXgIgBSXeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kouic5CkKUn0X0KnSs1wuePb74UNjNwda3bpX00QX1ekyyxJ8FwaWU3wP6Wy1IN/B
	 rAMHTltmOUpaLKipGg6UXleSHzozKeNbk1NWDAjRo0sgHfjHsyMhSGhH6iO1dBVQ+x
	 O3wh6WEDtQyTPj0Tk8qUxscxwXYPtvvQe6M8/etT2g8vmZnAJFnozckVUM+UA4Nt6Z
	 1/3x74j4R85qqXqkQiW4oTvR8nkZat3STfaBOBrP0wQvpRxp0PcWGp/04hHE2RjGls
	 nxRAMLaE6uXGmcoOdBRq6nilE9wX4yZbwz12Gq+UJ0a+bbyBvZDW9XdMYF1JV0TsEM
	 mbsk19b5t2r5A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso1934540e87.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 23:50:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwEYcPyAh0xRFpjnzwyI6bcv04ByyVxggAzBVEHJnnSibMUMZnT1OnsTzbC2teuQq+Q1d8ZDQFNbMTX@vger.kernel.org
X-Gm-Message-State: APuU4Z9WYR6eHXHWUa85hDGNdaCaIX64clnXRnikZIpguk+W+s2XhQA7
	VLnyXqft42YzEk6WIuFkzxEe9r4DIkggd83ngz3+VQFTN21V57+PruMc7uf8MHY6tPwZDwxx+8F
	AHefiyF6kVuUCut4mMGhQbR3m2I9NYW0=
X-Received: by 2002:a05:6512:15a7:b0:5bf:a7d2:e8a0 with SMTP id
 2adb3069b0e04-5bfd956a316mr2897713e87.24.1793605836758; Sun, 01 Nov 2026
 23:50:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org> <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com>
In-Reply-To: <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Nov 2026 08:50:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
X-Gm-Features: AclHuK9dC-mcHphjDYNUk7hAmH2idhA5q-arw9O8qj4lPel0YZKSwwgRuar-Ksc
Message-ID: <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] BCMBCA PMB clock, reset and hardware monitoring support
To: William Zhang <william.zhang@broadcom.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:33=E2=80=AFAM William Zhang <william.zhang@broadco=
m.com> wrote:

> > Inside the PMC is the PMB, the processor monitor bus. This bridges

> Should have pointed this out last time.  PMB: Power Management Bus

I think you did point it out, I just didn't manage to change it everywhere,
hopefully I only missed this one...

Yours,
Linus Walleij
