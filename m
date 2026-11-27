Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771015;
	b=fhEX24/qzXbOQKjPGJyflBvVvZHaLJHoMeQtCtFZxJSE914BqWJR31VLj5HWyyjq6cB9
	 XEe26DEKMhtGZRZZfInPE8Mi4fPhLjurQlYRcbdVa7GFC3ezFGQWDynfY+BHxDFAefIJJ
	 tkBCv5KJwnOv6E4l1AP4EflleHjShCBgtOs7Hc16zCiRuizH00At3FGdzpNJx3UjsNFBj
	 TZagEFEeC/L+PaOlB3aNPediyLPWvzzKsAcZxEFDF7QUxv0ZawCpR/TnBjuKix1I9bB1P
	 wVVY7Y58K2kyNVrsVD2f2fl633u8JTotMvdHKvH6OCntyHKViucHK9Ejq3OwtxkZstA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FthDJgeAJmR+CsDyiqI3a3aJL/56y9FuIeVs2tpiliI=;
	b=QvpR7gpLNr73t1vYQwAE7Vo8z8END2PIQHVhZP6tQ3VcC/iIH7wwHC6JlAHo6wgCR0SC
	 wzn8IxgNXneeFfyEDkHHShEzVLLOUm8+tqCo2wln6ECM4Y/pC8EWvuHTMZ+Pr5wpskfHK
	 VbVzKoD0lXE2Z2E+vvgHC1g17uCroTPFfRZsm2uyVfdZco/WDuU9QeNpgSXaBkMbVGzSU
	 M+oRg7WQKQ/4m8yVE315ljFZs1xVvGNnAob33q/xqATITsBoc8oo6S6Dn8KLJPNgIxu1v
	 sdJ/y94UpOyrzl4e2Iig0jV7ix0VWfnjXVFlqZH+tBGUDe6odlFZPNVAQ52v2yuwKsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b="VZl/IlJW";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF322606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF322606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=VZl/IlJW
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so68359315e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771013; x=1796375813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FthDJgeAJmR+CsDyiqI3a3aJL/56y9FuIeVs2tpiliI=;
        b=VZl/IlJWSTPQEx3kzZixxBHdoo7HxTaWIlhn7M84mCtSRGyLmzMnOwbhKMFpYJVCId
         emKq5axdQzhT02uh1q9SxLotymBikjKdtjKqWXm/qh8EimPtNhmowWfDThbdF/nr9nqu
         WIZthNzQfusgbHf8Xg2y13RainI+sV0raFlp4r1PKwA9JDPTpAnoSjXjvL5HMTc3mU66
         iTsvbv7qpYAkmD5OFlxkBEygevhq63D2NC7Avc2pgYvG4nLLGoDl0kpqhnt9rCaWPAWG
         9MHXNRCwu9vbkGeyoKOrBUM0zuKqj3f465SBdlaVdOEr51hHCnBeDIGT9Dk6v8ZHSGEf
         AXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771013; x=1796375813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FthDJgeAJmR+CsDyiqI3a3aJL/56y9FuIeVs2tpiliI=;
        b=Cm0FqDz76dmoicTr8CcQ4AfikThLSV8QFg2VOCiIdJm2qglP4vvaehOyUhYsfMTZ+r
         4Jyep7ECE0UgY7z5tSrU+j8i7UgHwaiGsIySUIWIvd2hczM0fLR+3ReYiIsbIa6d+cpR
         3ONMPn+zjMANfSQdIRwdP09EZJLZt99JopTWTVzVy1tKQJVR0DAWyhX6vIWv3EbTxPMw
         3MWSlA9kTAK9zrZ68xnOyON9pAE90zyepzSUzotkIOnGCCfEwUe88syHEXByDJhH/TxE
         Nad2AeKwf7/XITSI/guXOxUYzpdhrIC/GLWp2bJTz/odDk5frA53HOQBqSjSFmkfpzuL
         qspw==
X-Forwarded-Encrypted: i=1; AL+hErFWa3Barl43xgE5MskSXYSF/jDYPkHo8cUTxUTm4+yO1gtQHMXmw3kkOG8EvpJJmobd6yJ4ikAMaia2@vger.kernel.org
X-Gm-Message-State: APuU4Z+/bFemxrTwuiyy+OIBEKqRYeOkdAGm/enRbgFUvQnw1KTk+y3B
	FlsoaFtSAD5vWKIViMNUa4wGeLoldg39NgLbg3D4Y/MVIQ81Ap9ELMcbi7iK+W0A97A=
X-Gm-Gg: AZFdTZdTTdKLU1pyk913H9l44Q+lMWdF8eNkRvmPidyZ4pHeNqGH1YMtCzHL3YFo620
	8mKlAOOqvSykz9brM92nu1cjHG/kTEWSz/lrvJIpMtJX3L+MYCK3xfepavJxE0foItvEr8vAAgb
	Q0Y66I7h/ZN/P6JK4BF14yiCFoupVvs4DPZ/7DFhECp8LhqGLQ/R9sQ7Ph44788XtlA1eIIqsEb
	DTl71+RzrHf567Weprs+ZEaYeyKgryxEa0kc0PLGto3KTJX8gYdMS4Ob2mb5LEFZWLaMuYLRAFV
	TpCYApbIubEu1SxL93zqbmWxZJXMXs5sOXfDv5cc157oK1TAPA5H6sE2xVCRRNnp/bJleU/z518
	wLOFQ+lHD0bWdaRMsFgpghyf2Fq9YM3rXLunts8/8CNZSVu9rt3y6L5UnpmyY8i9WCULnSeSnt6
	ON6i2H+nQ8wuCxGsUD8c0Tz+DDlXlAfHppY3K7PTNUGeowsP/rxb/7g278pXkbbLNIQTif+58lK
	uxINYN7I9tQaMJQWALM4EbaUt+SC49/C5fHt8KzpG2vSuXI0k/IEXY2b58UqozAaAqMnimza7r4
	GNXga10qdcvoT8J83nAhCjEkIDxYD3oFBbxB
X-Received: by 2002:a05:600c:3b8a:b0:4bb:76d9:f81a with SMTP id 5b1f17b1804b1-4bb88824fc8mr506682605e9.34.1795771013014;
        Fri, 27 Nov 2026 01:16:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1231003765e9.4.2026.11.27.01.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:16:52 -0800 (PST)
Message-ID: <121cc552-86b6-40de-ba9d-0ae40f8a1ed2@tuxon.dev>
Date: Fri, 27 Nov 2026 11:16:50 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] pinctrl: renesas: rzg2l: Split SoC-specific masks
 in struct rzg2l_register_masks
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-5-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-5-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Diogo,

On 10/26/26 13:35, Diogo Ivo wrote:
> struct rzg2l_register_masks declares the masks of the OTHER_POC register
> of RZ/G3L and of the I3C_SET_POC register of RZ/G3S in two branches of an
> anonymous union. As both branches share the same storage, initializing both
> other_poc_pvdd1833_oth_awo_poc and i3c_set_poc on RZ/G3L would have the
> designated initializers override each other, ending up with the I3C_SET_POC
> value in the PVDD1833_OTH_AWO_POC mask.
> 
> Split the union into a common area, for masks shared by multiple SoCs, and
> per-SoC areas: the RZ/G3S and RZ/G3L I3C_SET_POC mask moves to the common
> area, and the RZ/G3L OTHER_POC masks stay in a dedicated RZ/G3L area. This
> way every mask gets its own member,

 > and new SoCs can be described by> adding their own struct
> (possibly inside a union).

That may be missed by the next person adding it...

> 
> The existing RZ/G3S data only initializes i3c_set_poc, so it is not
> affected by this change.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> ---
> Changes in v2:
>   - No changes
> ---
>   drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++------------
>   1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 9bf3743dc1ce..f73d273df362 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -278,18 +278,14 @@ struct rzg2l_register_offsets {
>    * @i3c_set_poc: I3C_SET_POC mask
>    */
>   struct rzg2l_register_masks {
> -	union {
> -		/* RZ/G3L masks */
> -		struct {
> -			u8 other_poc_pvdd1833_oth_awo_poc;
> -			u8 other_poc_pvdd1833_oth_iso_poc;
> -			u8 other_poc_wdtovf_n_poc;
> -		};
> -
> -		/* RZ/G3S masks */
> -		struct {
> -			u8 i3c_set_poc;
> -		};
> +	/* Masks common to multiple SoCs */
> +	u8 i3c_set_poc; /* RZ/G3S, RZ/G3L */

I would drop the names of the SoCs close to the i3c_set_poc. That have the 
opportunity to grow over time. As Geert considers better.

> +
> +	/* RZ/G3L masks */
> +	struct {
> +		u8 other_poc_pvdd1833_oth_awo_poc;
> +		u8 other_poc_pvdd1833_oth_iso_poc;
> +		u8 other_poc_wdtovf_n_poc;
>   	};

OK, we can drop the union but the next SoC addition may be:

/* New SoC masks */
struct {
	u8 x;
	u8 y;
};

If we want to keep the initial form we may need to pay attention.

Patch is OK for me, just with the mention that we need to pay attention if we 
want to keep, for the future, the approach before this patch.


Thank you,
Claudiu
