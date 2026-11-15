Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740593;
	b=l2dYxI1xa++kRasSK8Peu7NhraymDxXzLKhyg9OsUD41AUTJweCTXwGlmaMTWXDFGZCj
	 LesoaCijv+VjipaJt5k4N2d90wuhO4N2KjiqTSs/dEFrNnOtkmqkT+rYBNJ6Ght6Vs+9C
	 eKvOMJOafkQ+71pmYnlYooOyeuMqaeP7wFK5A+MXaCZkIBcPupObm3T7rNbWQb+IPIiQ0
	 72UllVv57hUb6icxp+pLLlTIfZs8KGqqGtTbM4Y+JWc/rx6lob58fdJ5zK6Pir4EmFeOp
	 9/B+zJlN6PDQ4QlUFZ4S0KwtgR4bhDBmqzPun3+bqcm59sv0ZRON/v3mcXXOEWN3s9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=w1ACO595+ELz+z8hohqisqtB7dSuEVIa1QoS/POdlBI=;
	b=lYORqdPHqIuZIylfCr/eQWcl98Z+bQAS/XWpPjB6ICElv70xOOCOJIluYw0eTdw3Fxon
	 6NEJ70kgiSHmZkiq88YGMJlLoypyOWzuXF9ofKx8WYXL5tBZn2kc7YXPOzGEsIiGVp3AY
	 t+5Ztn9HzPNg4PB+heT6d2sBur3R+2acWuWnnHSxSWk6DrhUsIi4aiB+71ghyKWykqZ7H
	 vubTavrfVEo0RdaHLyOjOj3yoRP2ns5gmaIhIho3dLiixWDnNuOHGdU72TCmHjEZvTJle
	 688ASWV3HTUGZHR/WsZfRYPondgUzgUb+h9rDSjLALV4S+qH0mlCunVWzadOhTg2rig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WR02KrBz;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EC7606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 11:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44EC7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WR02KrBz
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2789897f8f.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 03:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794740591; x=1795345391; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w1ACO595+ELz+z8hohqisqtB7dSuEVIa1QoS/POdlBI=;
        b=WR02KrBzOV/h19PNnmRdTn+XT8cRK5mKsqg9OanSndZSfGTqZFubzv30P77zOMp2qQ
         kQtzYOO+dTHK2YOlLOQ6pS7ZbUlphK3ZryIgbFID4LZ7zxzUZF19PbTUSY5ISwL2u9zL
         F47L+ASapoErsRmS3Dcyby4L6EPVCbmU96Cuxn+jydfTMAJSterK1bG8nxtf1IZ1U00L
         kJCC5GY8cJAhMoOZr26+HN0j3KDa1dSq2fswp9GEA+LetvBHW5RlKGX97gCPSyWOMMdV
         a8I0lQjzX+naCxu7XF+36CNIpCYOEBJmS7EcvCInQSQuLnUcBsBnep2PKV4WC7pOzzJB
         7+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794740591; x=1795345391;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1ACO595+ELz+z8hohqisqtB7dSuEVIa1QoS/POdlBI=;
        b=rz+W5O2iffn26xrXIoJVrry5d78QQ14cKk57LPAH5MNvr2jLSddbkoIcH37W+x4JUF
         K/r+IhUHFhyx3WNq+mVkqXDrJrcs1wEtyNMSGgul+HUucI6CuIHf09AWlKSWFa3YMJdu
         DFtQxgd0kNHpkcW8hNu9MsHw9I1VIFrrGai/zgsAa6ZFL+kqIY7OdQihoMhyOizy6zzz
         Cea0ptvSwhPQEiwhfpgNzND87FXXXgDBm4QhFHM0LgpKzz82i/5Hj+UKjKtdMPU1Ij4c
         MvywCIJAV9060CCrZOl79i8RP+PTz87Hu5CqMr1X5+CUxrWdJIKAvdQz/94o5UkQB5Y0
         r0EA==
X-Forwarded-Encrypted: i=1; AL+hErFd8WlKjRdBkoHSeaDOwJxhFuV0mqAKXLS6Qsmxj4dbtYZDMm7FEDZCxKXu2Z1fd/VX+hOydp7WoG7X@vger.kernel.org
X-Gm-Message-State: APuU4Z9AHxaaCTQIr2a6WCXIxSHuQSPq/7hyGRl03gbHbOk3Yz8/sDF0
	qa4XBiCHOUFKjzpV+sidozcEAUlgK8RRASQgKzZKBeiK0cV/ejkHsou8torZiGMUASI=
X-Gm-Gg: AYBFou136rGg/JqdizSH3xkAVUpki0ppP1mfQP1iOq7xhmMk0dQ8TvJ9Ek7bnoj/Gup
	RfCBUA2AVywjEQYFitX+ulW21tjaukkg4H+JIhGTuoaF4tHOXzZdUmxqssiuYEJtAZvhGqB5wAf
	kQ++R1Z2NWd5pYqBOYYvyIlQ+M0laIQL7BLS/TgshMumNW8IAbco51WhL4e+YhQLQEjMzPgtpqX
	R6s9Qj6rXso2z2dTfuUvHdULUkztyIvGuxKNEvirvZkr+a9aOcaRAG1mAr2u63uzRjACPh0m/C0
	lsbI/vDOAsO3RL+KKSI/UkBtjHcHw7ocXTjvLqUs5EZXFah1tjm5aRg5FVVQCWa+tt/I3EWDMsA
	kq91/WzO2voK4n3FdCT3GcQApjmA1zzQew+dbOicgiBQghOWvWuCv0k/Niw7aZY0wF7OL+C/XJ+
	0BSM1dv8JEjlDmyjWdt7NKUoClYCuSVYiKW1xs8PdSx4s0eJ+z21w3t9mV6Ez1EOgRnzYD3dyGG
	GXgjme9OhyfoyF5GBwP8xXTWo84bw4Swu7DTSeSS8BEbCy0gRMTVqgtk17Bdzs53rGwKf5K5HUW
	sLSiB2D8cHUzx58U7vgNWjZZKebphg/jEmQntpvt8jPbWRs5
X-Received: by 2002:a5d:584b:0:b0:491:620b:b60f with SMTP id ffacd0b85a97d-49c72ba5d70mr15726879f8f.48.1794740590749;
        Sun, 15 Nov 2026 03:03:10 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm15132051f8f.21.2026.11.15.03.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:03:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
From: Jerome Brunet <jbrunet@baylibre.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261113145708.261530-3-clamor95@gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
 <20261113145708.261530-3-clamor95@gmail.com>
Date: Sun, 15 Nov 2026 12:03:00 +0100
Message-Id: <179474058020.3790083.7531788945003507652.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lFRDSGY15F4GXWb4HrNUlotV6eaXTV/VaJfiOjVavqU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/J6Zn6+1MEdwhlvNA2UgluMX+9NH9LEf+6Nw4c2C+o
 Uu5D1NeRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbyj43hf1nIoowvEUd8Dial
 tufF/IuOz3njJib8ZHVTt0aEuLX2IYb/niZ3mq8ufHv5qLraOp/9yxYcfvzMOdXxpP7CDJYT+XH
 L+QE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
> for the correct work of the CSI block. Add CSI pad A and pad B clock gates
> with PLLD/PLLD2 parents, respectively.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> index ec537efac692..08e425365469 100644
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
>  					     0, 82, periph_clk_enb_refcnt);
>  	clks[TEGRA114_CLK_DSIB] = clk;
>  
> +	/* csia_pad */
> +	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
> +				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
> +	clks[TEGRA114_CLK_CSIA_PAD] = clk;
> +
> +	/* csib_pad */
> +	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
> +				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
> +	clks[TEGRA114_CLK_CSIB_PAD] = clk;
> +

Change seems ok in itself, just a couple of things I'd like to check with you.

Seems both the CSI and DSI can use the PLL D and D2. Can they be used concurrently ?
If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
DSI counter part does not have ?

Also the DSI get the PLL through a fixed factor 'out0' but not the CSI ? is it something
you have checked ? it just seems a little odd.

-- 
Jerome

