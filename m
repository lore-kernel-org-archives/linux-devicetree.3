Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425460;
	b=h+fN8gMZyJaqmLZtcpn+egfoaxvb5bNbOEZdXM4E542qa8KeAOnOyTQ5GwqBYXov6p1a
	 SQ9jJOZDKERmrXj7rmMaGvuX7ZdEy61kc7EYG6iWttUohBo3EYTQQSYxCfQ1GiLYakeLY
	 YN/IMgOWnI/IzfG49Ld5mQMufnKCXDVn1nnoOM+hRO8w2kkKEKitwPIwEKFdDJYqgyYNS
	 uTjqg8n46XCjy3w3xoJxm5F9h6Y/E32oHZCzOJtlBfPkUjHXn2GL8ANK+jSa4YD290J3n
	 5H2v9QkEzDcGGqlBPmWuieaKhlpt3BI1Uy5QD8A/Pr/6hnqWWuczl/Jyfx4MI4bj0EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
	b=TZAOJGv65Oab5hMSh+wOXoCQFHiP3aKiXjhs4exE/3eoXZWDN6oEarL5aA8tkQYV3aTm
	 lZ7uQVbb345NZrDFjH5bKroqp7FA/+Xf9K1sXot5T4vJc0Qm+j0o3Zjc3NZWXeQ3tvVvn
	 P5WECzn9o58MhExxvCUwApSJ98Kei2JU1ADaGajJfhAQLF60h6Fb6QL0weHaCK2Hn737n
	 N+N4AUDq3cdWmCLzlXBeBGrC3L51nWhhOOQRYBscTzCzBLLOVNM/qF4x76UUAcyqc2MAd
	 r037dxOhT3gLVK71nVmx7oSIUVT3f853HpEPhQ/gLNSOvg4Ludr6VWkHd8rHgkpbiCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MjgPBNgH;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAFB606A6A6
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CAFB606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MjgPBNgH
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so30118995e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425458; x=1796030258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
        b=MjgPBNgH02xQwwlmVT88dEKqXLmkOtxBaiUolaQXrr+yWHJYso0rq5H3V5cMGxLZ4j
         4A2RItLr1Sek84a15jzHonWwk1i+lX6hrm7p24UH3BIVH8u/GLz3xMWZesQ53FDWA+dG
         x2x2jR4ERMEhavazR0qcOByOsQ2qCtCO2KRjD5X4T6FvMjY7zuG6fmRzqAPu/AUqV92V
         3zRAjur90G2sULFJ+iQ/xXtaDgx1eTPqGezZVhpjaWkCUtP1ZjTSJ27EpBZSLQkbdNSp
         w+okTMvneu+NyL6uX2WegqtYxcRuAgKYFanr9LmWTOiEkdkqf5Pi0yPw0QbSbOF/v2lF
         Cgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425458; x=1796030258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
        b=wcjJGojIMzloaH+DVFfUbOA311hMN3wBE90bkF3ugozYPHtJjc8SSDOulkc4H4scPM
         6KoebmNM4TSjVAQtnK9/ZuQHzqOhrk8RvtY5or7YQHtOdNbeFfNzR5LfNqxl6KWKsNAw
         h477nW4dspaGwY8bhUkOTdYmJmiIjwGxAk9zYsAOSquWgsaa+nIpXZYc/tLN/VZgjGGk
         boTeA9Rekuh7ba6jAlOJ1E2Irzd2zbLHAkstbhS/37/s1N7w5X6L17zXyKsExKVNT46s
         dHJPb1Xrl78eDO17P5mGBo1/3w8nEfDWaBaBqHTgMpLuWw2AVGlqjhADah3kAVaRb0l5
         OejA==
X-Forwarded-Encrypted: i=1; AL+hErF2Jyvclqf1Nhu1wsC3A/Z9nkk3Fbe6YTOOtFhPWFfbWiBDF67laXwRJxqlMGIxQMHAbuMJvsopfEae@vger.kernel.org
X-Gm-Message-State: APuU4Z80v1lVsE7RUl4WYBNJLQNEy7o4AnqfSIfRi01x0zZxBfVHKFiy
	xqh+0xO0DJ+x6u5UanZbyt/n7ms6ELNNBxE7njr61s4OeZZJbcFCybh0dzwg6SmffwM=
X-Gm-Gg: AZFdTZe/iLxPW3ToQSVBqAAWvuCgUQ4jatwiUrga/NgYGZ0bKtaRD7noqiAiS8SjycT
	BKEnXL+Fm4yX91RLdquB0wmFSBEbztb5rEnsKeFQIMLfPmSnnu+aZQXIqr+fFUSYx50wrUthHWP
	u0dv7V1Ch4K1thDH9O0Y7tnd32SvNioO0i9logIF+qNPSoO8VTrEa5tLBTl0Azze0pwZgNPrjvn
	kg7fNm/qdiHl0L6j1InfVhxuELINVY5Pm5J82GNLGs8w7N+qhhQQusMPThBoq/fXcAFvEy9LTdv
	IkXEzvfivIXy34Q3EkngmBzpOqQ7Smd14MTAZ+7ai5lOjX1BMgJWerEd1N//C7YvyykvoHO5FVg
	isTsJUUuyXcYopujjuEY8XxRnnVx+dE6IEDTlsS9jXWl0KdpUjZPsalqmLy4S03hAya9g3L2k+U
	Oum8FTIeGBW/3dC9TxClJMN8XSYmWwwiCiZxEjaI0p4LRlE1j5lL7L2u5LVuZoaIJe3yv7aUh0L
	EF5MoKeSbNPF5w1b/gWROXN0jij11C9EEEB14rdmJ0t9QilK/eitQ6jKwdw/tqkTAAaxBKW504Y
	In2j6bxKcp7cFK3YMBmx47fQdPHmudbXeEAi5Ra/Y91LkZ1/hZ47MOUrRLTUPMdVFNic+og0BG7
	J4ar5pn5bLyTjaSKPS82jSR+iLPiIhg0wMQx9jQ==
X-Received: by 2002:a05:600c:468b:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb8881b511mr224342725e9.18.1795425457707;
        Mon, 23 Nov 2026 01:17:37 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906e4ce6sm162891895e9.4.2026.11.23.01.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:17:36 -0800 (PST)
Date: Mon, 23 Nov 2026 10:17:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: yogo.0917.sabu@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
Message-ID: <awQEjpz2572Y9wsB@monoceros>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53xo6eipu5xw5r7j"
Content-Disposition: inline
In-Reply-To: <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com>


--53xo6eipu5xw5r7j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:43:20PM +0900, Yuugo Yoneda via B4 Relay wrote:
> diff --git a/drivers/mmc/host/sdhci-at550.c b/drivers/mmc/host/sdhci-at550.c
> new file mode 100644
> index 000000000..11c9de0c9
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-at550.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Standard SDHCI PIO only: do not assume CPU/PCI DMA address equivalence. */
> +#include <linux/mmc/host.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id without the
implied dependencies you get by including <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--53xo6eipu5xw5r7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBK0ACgkQj4D7WH0S
/k7hOgf/csj9IbehNzv7kJ/jSWUzgb6r4/RUEEbwtHDzllOp2mTN98xOQkRXzRr+
kmuM5eb3Prkbs0qQBPQiihfmm0Jo8lnvB2N8uBswWQM42XQ1o5YmtZx2RIs5cp4a
M0FFz9Bz2fH6rmOr5ETS3FRjnZ8CNqQnaFBWD9lGusUfgppfoyqvFwbXBZyQd45Z
KCR1pIqN6sWoDMkalLwcL8/M72VapgfDtPpmNp4qxYjf3m8WbJJZGT7uK2Mk78DG
WWybLbbeuHCv72ICgMdJArlShc5E7A8r/LZSSpXjnNPBCxOU5AeW1Fa/7Ma+TYWI
G0UtaE9KZSsmGdqMVovJUC5O5/MnDA==
=R4EF
-----END PGP SIGNATURE-----

--53xo6eipu5xw5r7j--
