Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727876;
	b=o/CWTKaKJ06CMFGf6YxbuU90IEztf5ldd956uVFO66jIKUEOtRaFrUoneToW0TzhsJbs
	 QpGpCJPV3IuipEZrpqk4n/rYbIMNGk+Jmmz2blmmKFdI0a69ZPacbjyylymHx0vnXpMGx
	 YswFpT3yWBgiJ56+KB68836vnbTGV7xSBjiKaR8ImGf7TFwfT6R8/C8gUdbgnbwC8EgO9
	 DYfCtrLS7INM/2XtRfIEZmWszGhbPtaJMHjwIrNR6QUDk6SZJiH2gXD9BbxTeMsgz9l4v
	 zb7/kePjs1sTIxJ1tQg2j5Gh25c8YX2SA4UAsqCyJIgS9vuohd7wquBAgTW+d7u8IOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
	b=XEcbF4RK6ynUTCg3YPg8JL5pKdTdpyb2s9LJiYcsFiALvf5hvqDzrI9040ldjMliQV5z
	 YOfUr17+ggmKiXiHxAAKAMUOqlTOvOd+iD7PkFTIBjwAqd8EV25VSErp8CII6ojnoFX7b
	 N4hqBvqQbc3OnYfv8JLLHm9SBRKy6sSf1SeTwuj4cBApJXEreGXi6BHe/S4LvBNPkc7XS
	 Ggkgt11nQLLRgXEZInMghbPskQKHuAs+WkiExVw0XvaSEn2LaOnzFMSak89NFbC5JO6oG
	 FHLpRCsghSxHO2fB9w/zrKhem4JVzlRiVMEW2ctphvBFuuI2mgezMMrgmTSRnkxeQ+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfHX33b9;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948BA606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 07:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 948BA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfHX33b9
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491971ac844so2232584f8f.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 23:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727875; x=1795332675; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=sfHX33b9HzNVq08BaSf4y0sViK/MK0chzVBJ0Q+gvrAe9T8wXjtDwJMVvfNxxjvT9l
         SEWTWE0sZtcsNwKWEFyXzvLZNe89AQsVdApUgEXQBL0TJsoj+jbScFkEv+3jRZ1lB8vf
         d/rISxDPp+F/K0bJHknHkk8CXnGYEM/127Yv2NeUvCKPhYO+eTU9rpQmEU6Dd62/EQvB
         fz0HUNzeHXC6U3b4kz52ODEk3D6rWUXeADFYBeeqPtDrSrS3EHKV1D44l3N4ZEbUKSDw
         GOdF9hL5WuF6stzHu5B4BcrufdthWBPcUDcNVZnPgxjB1MxYoePPvR2o1eoXKeb9bMzV
         K9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727875; x=1795332675;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=Cth3Jn2VWKzv02QcKiu8by22clqOW9yckTdX0iZFumcJY7FlP63z4gwRlIYV9V/Cqk
         gF4t73pfe3aRKoUSHMMIRoPcUWGCvSAXcvTxifwybdO3LgRaEdAo54Rsg4wINVkSg0Eu
         3UWk0GAnWrSHNdc3J8NKjQ/+5DW4kG1xt80o1LltgIinz7YTYiTw2HMKnERnYjrrrxpw
         +b2EmJuHptSeGiYG9jOuTjZfPQQ9xDLVDQpjAgVFZwXgvPVYyqu6nvTr6QCmQA/KG50Y
         wFJ5b1rKGRRbGFr0wXo7YVHNGpv8Eh7BuaSlVWoJ+ec/NVdiGloEfkXJEJ4pOafkCVEw
         T+cg==
X-Forwarded-Encrypted: i=1; AL+hErG4unIvYKd9N99F1L2rSkpZ5Ocss5Q5s/HZWNdcDeM4h6zqjkF60va3Qldm5iF8/VBNMxVF5sHx28f4@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sfe/pRFiRyCgLtpfiPHYblZqoD9jnVEFjRQKpDxcLDSVfE6AH
	gwf9jEZYE+xuEPJAYOLfYEe/2hTxE/cqBfMThWyqTdD5sYtFSKJChTwT
X-Gm-Gg: AYBFou1vC/mFsamrsHEDCWoenixb6qV3TqQJ5Q52SLBGmEeMRNj8bRj56V7qj3QFG6k
	LPnw/TeBdh59r9tNRc14Hh/6+CBNKD4pI0Sfz2Xw3Py+JPl2ENS2Z5QlIrhfCbR5als/kGpZ5Cs
	x7Q+NyZLOv4CxyLBIF5lFuhZMdxiXfDsoXjntlb5xA7Hyyya9wTe2IYmSSxMfBAnH/Qcv24+Cvl
	PC52Z0fZWUE1zfYIH5uOaKA/U3404oxlEGMi7tk2H9Hc+A7fV5bJuOKfe10lJREileNO4uKWAjQ
	i6Utl2qHDpHZz3hFMsYritAZ9RllUveTEyXGm1a10nq6ozpqSW+YECsi6vCsIf0/0LZUjFdsXUX
	9Lt5VMt+6BdQiforo5vxwgzocEO1BqE0VstmL6eErxLpHmwQ2xbW97I0UFBSZGsav9L8HYEDlaQ
	4G+POR4UygyaWG9Sl4dhhjD9WL0SKiGC7YjFmx9jrgZCmhYkpc7kMJkSBgBckTXqF7UaVts6tfw
	/bSTzOlZFeTMPTL4nOmy9f+XcyeHk4EuSqm62OXoASVnG/p2L5f8IjhaxvGfqbawpDmUgeUwGxV
	bplievxV4VqN7zXDRU6zqtZUM+qU8+3v8TvV/a03/WHvvXnqWbemmNCzxSYZsrB7Oq1SW+ovNln
	1PWOn3QdVxygZZw2Ilgli34w7CcJrY+AeRuAB4/4j7quipaH/VtXBp3gy564gWKL3pdLkJtoHEV
	Z8GdwphopirD4bEV7yExUw9r0YiFYFmx7jOZfm1Re9FbJX9yeMD1fKIPbGPLAhCR5aX/YUXnraY
	XHO4ztobvjtUsxMxYWDEVhfuw==
X-Received: by 2002:a05:6000:25ec:b0:493:803e:800f with SMTP id ffacd0b85a97d-49c725e5749mr15660384f8f.29.1794727874441;
        Sat, 14 Nov 2026 23:31:14 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm12992274f8f.19.2026.11.14.23.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:31:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Han Gao <gaohan@iscas.ac.cn>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, gaohan@iscas.ac.cn
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Sun, 15 Nov 2026 08:31:11 +0100
Message-ID: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
In-Reply-To: <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
References:
 <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni =C4=8Da=
s je Han Gao via B4 Relay napisal(a):
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Add the main CCU driver for the V861, based on the A523 one. The CPU
> PLL, the CPU subsystem clocks and the E907 clocks are left to the
> firmware.
>=20
> Unlike on the A523, the second divider of the 27 MHz output is a power
> of two. pll-audio-4x does not pass rate changes up, as its parent also
> feeds the UART clock mux.
>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Do you have any user manual for it? Or at least BSP code? It's hard to
review patches without any of those references.

Best regards,
Jernej


