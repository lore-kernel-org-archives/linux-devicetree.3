Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799154;
	b=qKy/u9Vvx9vGj6k3w1AXIK387vxqAPkN7n/3Kv6AK7OVs5MCvSptNd5a7y3NYG5D/T1u
	 XeJvwH9lasXNqL2s05rV6cLUFpYlGeEpAdlI7FdRKB5vIDtNg5x+JAgPTCjCB0GrZpiGW
	 Ye0PNSIk1glspxVP81/K7LH19e4wcxMxgpyKRSDbFpYcCQwx58L6p1vivJwtdEhCUBPlV
	 N+sK0yVZ11j0D6gZKorDVIJ3VvKKIHYs2YD9dI5EWcmrRD0LC4fOAH8u+AP8Dx8Hxbk6f
	 beztCdI0z5xygoTF53Yn+ve7DYVh+5+RCT9glS20nhJXXb6NPqxEMQBQ8J9OVNZsjQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
	b=GS2OSqzL9ZcSDInl+glkdCwlrpnWYsHK6+Vx0mWf+OF+9zbx2BLMoZggNIzUl27ZQVL6
	 GCBeZjr6fdNca1//oX+mwfGAL6fx6ei9HUttIli7Ol1lwZZvI/MGBLyiK/YbScj+CDcHK
	 uhiTWPoWw1zcOIT48O8gIH7cq9vDGWRYd5XIm3o7LTDE2AjdFqeK0jzPQrbIUE5KmJk0O
	 LqClA3AHFxPrscQE5AI4tJg2BRZUmrpKB7/1JXlC4I+GehMVgbpNeZl/zCqLHCgukhR2B
	 Lt5j2GnUcxQ7vDM885h2C0xOIVtIa5yLJDt8zpxWpUm8CBVnq/zyGP/xeKORlddzBlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy9pS4bp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1E2606A330
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 13:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE1E2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy9pS4bp
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-704597ef1d8so276576eaf.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 05:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799153; cv=none;
        d=google.com; s=arc-20260327;
        b=YErfnt9NXFhJ5toC38uoKShPP5HgCpqtT7WZwD+Jc91KzMWjufJsclJZd7Hmu5NBT0
         HVYh7kWUU/nO38wIW81+bcjZSGgic5bBxAE47ADUmtQAQKDESsRSryYHMrEq1MAEkpVB
         8BEpNDKowgauPFVVxzPehiRK1v43XYPI9tReIIHUY26J7IbP0J2pGBn04AQ5Sh+7pNcd
         /Kc2ufKKvBRC/YKZPHnIkSMmkrHBzYqhiWHobzvdiiUU1Q7Qh74eX3H5fyr/6SnCVFrC
         5w/puHEVYvleSDLuaa/EWVdj2sG6igoB8X7XdZ0rvaVIdjWZns2MbjVvJczSxBewU2CT
         of0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
        fh=y2Sa0iqe2OIpk7iuAkXKe0Z2LM/ByHxvYTgX8Ud6vTM=;
        b=bj546jTHDDvUJESkGCKCRVMDvo3Z6+BSf0UuPNFj4n5LPycQgctLJU63D9ktX8/5Dc
         DlPm53+o2rrKaOqTF1YuUXoa7yGkTFe6vBnDL8D2xNbtDKTVm1Ak7OTG+a9L7smSuCLn
         48VefQdupFnkup7y5OIL9PfNEu33Z8Mc1UMOdCnz0Ocl2/WcZiF/Ninkne8z0nk2cYAy
         3hLA/4fUy20FOJlKgCTkP9XJT/OYYVfWl6VRC0JvvUU9F1RgE03L08XWNG668sMf4sV3
         C4KM0lJ79NNh8OqGMxtcKSS8oz87G5IAa3vIG55I3RhCT0sq/HWBJgdaCL7zlK80nT+2
         7daw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799153; x=1794403953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
        b=qy9pS4bprOjTsWRvlH9jkM15Jb6X9A27TdRPIVsM3h3dXuLNkrkluEELmjTLBM+V3P
         ncmegftrX1Jbf48M/GIiWSkyr9c2afUzcpyDNVJUxw2kErAFuFuiYBM0d4r2Z2WVe8/P
         mryc8gKuoM+SPz7kBRJsT3vcNUF1prKGEyid+vyji8hwjKqA/XununEaEOmNqxRbF7Ik
         Ay6P0FIY9Xe7oHKlx6qraSAP9Dbjx59WRcXWsOznu+IpcBB6lS5xl7kIb0TV6bN2rGXy
         D2jjv2adUgO9gp2wR1eQZMN2kZBuWpiOMzIW4Nth+vi0fpGicG3Y+McnpRkp2x+TqdRj
         /FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799153; x=1794403953;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
        b=pue5EnoR3EoCpyh6hHZLPtqJYEZXUo1Hc5tQfR8uDvOfKd078Znf69W5TqOayL35VU
         cJDnZwHKLMomA4e1dBiBDpDFHT0dvw5Pv2D5zTPua6TeD4yckPhOVGry2/37wJ05clIw
         mtbaaRaC4tCeMWOwuMJ4IAo0bcsUK2yw1a+Y5h7gXU+fSwHhUvtRJ4gQdcGNFzXqRy+r
         LKJSKp8aQolsARYWeflttVbYjVz5pXT1XC5xXaohQ2Cpav3ycyAsFaAsD4CJWtLiC7Yo
         eOWR/1i7h82HjN3+yqFncxG7KQdUcQSS3WEdFEPqKQUL7X/vMLfI+CRlmlToBefWZU0r
         srSw==
X-Forwarded-Encrypted: i=1; AKwUvBxthaBWNaohhlJ9F0gk/WtJSSBSWMhbrkmmnTSTf36vvlai0msFzqbeE8bVP4SG73PLXLVgZgTea932@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ixmv2BiEyePmDV/hourBupakOmL8B8zWsH6cPcOgrvXM5DJrQ
	O1Q5WhBMx/pjL90sc2V6XjH04SphkBCoy1yHpMoo0H3oQ+wuz58/d68l2D9C0sdca9FIcRDQU9F
	H40vWOSCfeoZ46rD6NeiLcT3RvJ7K1iONGg==
X-Gm-Gg: AYBFou0ukq4qRX4V7BmByfQ++R5BFVJNR5Cp0cEFLWg6v08WDv3DOW+IAX0q53zvTS7
	vQvwPB+W7uSgE98xQeEETns/Fji7RPLDfiUo2zWOIr940SxBm5QyffKmwsXsz5hocD4yApeflx7
	am2eAccS3YuKnCqqzbdW5TCuo9aKYQyo8ss59Vjg2CIGbIqyNfA8pu192pgsUMdXYlLcHdAbbJx
	BMdskgcyQqirOGoVJbnWHddoAq7l+EV0ohqISPYaT3BNf8FWA+xpVXXYfn0BsAyPtBWx6KrTsTP
	38n2+1+1ziro4kwcKXbyn5lI/zRcu2keLqz7GAGEp3ugyOUDgelJ99kKxVA0IhRClvt9G+Rc+eS
	CHBkQyJ2HRahODQDow1RbT3lT3tHqCZucdaCk2a3c6CVb733adpyYK2oGLqqj+w==
X-Received: by 2002:a05:6820:55d4:10b0:712:c3fb:b4dd with SMTP id
 006d021491bc7-714f2a07b44mr6865589eaf.58.1793799152650; Wed, 04 Nov 2026
 05:32:32 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev> <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
In-Reply-To: <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 4 Nov 2026 21:32:20 +0800
X-Gm-Features: AclHuK9KjWGPhCZrdzN2zSc99IwcSQrcSlYV4KRQtVdLRgeo4bHU_zFbKSD1vFk
Message-ID: <CAJsYDVJ+FWHJ9AaJCmQwwfdsVJJC5mPw-fXzr2n6OAsZFHJbEA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: joseph@telaak.dev
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:21=E2=80=AFPM Joseph Telaak via B4 Relay
<devnull+joseph.telaak.dev@kernel.org> wrote:
>
> From: Chuanhong Guo <gch981213@gmail.com>
>
> Add a platform driver for the peripheral clock and reset manager (CRM)
> block found on Siflower SF19A2890 and compatible SoCs.
>
> Each CRM block manages a group of APB peripherals through three registers=
:
> a reset register, a clock gate register, and a shared Bus Output Enable
> (BOE) register that must be asserted for any peripheral in the block to
> respond to bus transactions.
>
> The driver registers a clock gate controller and a reset controller from
> a single DT node. A shared spinlock protects all read-modify-write
> accesses across both. BOE is managed automatically: asserted when the
> first clock gate is enabled and deasserted when the last one is disabled.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [jt: from Chuanhong's siflower-7.1 branch; one compatible per block with
>  its gate bits, critical gates and reset masks in tables here instead of
>  the siflower,valid-gates, siflower,critical-gates, siflower,reset-masks
>  and siflower,num-resets properties

Why? This block is one used repeatedly inside this SoC and SF21,
I think a generic binding with clock & reset description in dt makes it
reusable without further changes and also results in a shorter driver
without a table. This table in driver aren't simplifying the dt bindings
anyway since it still needs one block per node.

--=20
Regards,
Chuanhong Guo
