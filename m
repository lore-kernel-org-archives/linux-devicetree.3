Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427651;
	b=1eEKawgtRjkTEsdUkjsdGsc9eyYjiH4PNDXZnVRGLyIbCVOiA0/2EHYEZwt/cJwPY2U/
	 Su5za8GdCKU/O6BCBeGff3QeHEZTOaHQxnWd1UjzciYIQj64ayVD7Jp7ePRe2C/rraLVS
	 ihi3Pa73PbqKtZCggikgh1q8tiBkCK0jYnqBRrfeB5zzZ/2fSlU5OzTu8/Dy0Z8WmnI/0
	 pso4UsH705quRCtXiXgRUAT6hofc3fKUXGpSkx3ipkGlOcDSP+Emdmu/UQn+yfXRXaiGt
	 UA6Ot8KKksOyZJP49bkjeT1d9iQVRVN2vfj+ngO5gBocA8ckmvONhan6HT96+pddWqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427651;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gVlfHHEUqZRERxmYhHaGuD98Z2SfQm74q1NG7Z4SJtc=;
	b=C/vD7mXOivSDoKM1PCcenzkytSKO1QskNhLGBhcu6Yk0+Xt7b+7Efb0mve/p+m80qRc6
	 EKJwcvM3U75cyhuW8VbaAhbJv2NGWz1aCTSjALvyD+Y6UNcldZCu6xSQciz+sENz+TEIN
	 I5xaginrkflDNxmV9jVcQNS+ylueey0AHCUFiqgMku0EhsDJfkW5ETjoA4hmhKini8QfC
	 k18/4QN3ulby8naC7yrGY0XhMDcF3jbIh8sHCkf4qO6h+wtXBlPzG3OrEAH7YKnasOMs7
	 r0YsfPGAkUYeidPwu0m2Jpzc78Qx3fo4Sttx9BudV/+ejpakK5iyE5UchbF2p6PaBOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=RrpQHqk6;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBED606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEBED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=RrpQHqk6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gVlf
	HHEUqZRERxmYhHaGuD98Z2SfQm74q1NG7Z4SJtc=; b=RrpQHqk6Qzmg9ppdBpLq
	LiU6chec/SmnwcvFmsItvB0h97GYcOBB6a7qa9arUEUapyI81UcYEG9h0e2u3gAZ
	oFv4DTk4vysEl4tcRK2KS6PzqvF28qJyz691SVeFegvv5Pt0Tk2s2ioeZukiYA0S
	9gsMJGnvLGY6FztqHeKLXNIyTCR5YwMnqvwI4gKbQJN3PDRRkbrsylz2w0qAiDL6
	RSguuUka4iSxDFImlZWbhFkmyGfFRtwRwhMyBY/q2b56XiOLmjs/nFeCkxo6otRv
	LnxVnO73kNkLm/WRB2oIH08WbAZ/Eei/MrpaFC4bR3GUVAet8OSzRrtRg/Eq9AWS
	zw==
Received: (qmail 2646670 invoked from network); 23 Nov 2026 10:54:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2026 10:54:00 +0100
X-UD-Smtp-Session: l3s3148p1@+Hmyku5gEIwujnsu
Date: Mon, 23 Nov 2026 10:53:59 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
Message-ID: <awQNNCw9nCyvmY8B@ninjato>
References: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
 <20261120-rzn1-miic-resets-v2-1-f1cfa678615b@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="xU2HxjihksT/uuam"
Content-Disposition: inline
In-Reply-To: <20261120-rzn1-miic-resets-v2-1-f1cfa678615b@reliablecontrols.com>

--xU2HxjihksT/uuam
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +#define R9A06G032_RST_TS		1
> +#define R9A06G032_RST_MIIC		2

Given the Sashiko-review for patch 2, it might be easier to start from 0
after all.

Other than that, the rest looks good to me.


--xU2HxjihksT/uuam
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsEDTQACgkQFA3kzBSg
Kbbqig/9Epv8XKajU+GJXbYWwmn+xW6rcy824Fm2da0KW5KQk9NTkCiCN8Ec6D+q
9EzjRPA8Iyk3ny8hCEjrFu926l4mO1drdXGWpGiSdYphYpvZWac1s/rtWy5cidye
TuO4KRID+MH1WgJmEvxFYHP806WJStAuaqLXgUgLMWr/TL9QXkEL5zY5PX0QPJGi
0ehY4/Z38at2PWy2vjrY2cmhnNWn6C9UQ2Ps0RFGAGNz5KTAgCSU0La1wx6VIdxe
GIhvlXNfMc0YPmXFydUwMU5BQ2TdhUe104SvISXBWx8KJ5VflxtXJqPDhnyJZ4Ms
Xy4GqMJipQJhEk3QTjNChH58ITUQI9hrZgKIH2r6BNbVbwMUrBwrTZWySpnKXo+b
RdIlVZILFAd+fjGK/mdznzkSgcbXLeMHIOqVcADmQINb/7K2Q14fpFdKK1gXadPs
1zydOnLEwMCd28d0Tewn+8bsbFNRISnUBJe95DcKtkRkGvwcGYyH8bHZA199aVea
mZEs2SgtBNycesEaTLnuG/8wOUDMHEyET6K3/T92NvI1ZnnOI/vs/Jr2IRs8RZK9
pcqlpyvqyDMhEIamspoMfWHGfjaG2PZEHZP4A7ssgaOHv41iPSqTGvLq+di3tIZY
CJ5KuRpHSCQvNZMMGBO+CFZypkVAjMXi3YgSZTxo4OCWNmAlnDo=
=We5d
-----END PGP SIGNATURE-----

--xU2HxjihksT/uuam--
