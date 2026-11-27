Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779223;
	b=AlNtkZOaEf//qNlKx9GF+8KHW/GdrFkm7KR6GGsmyzCFmxuAMHiC0U5fEVP8ZU5nrsgQ
	 nBUx9JJi6DMEJMjJZA3VOMpd43vcC2rv9U7PbFf7QnNzAJUs+LO2AKHAlybusvBjWHFl8
	 wW8sTm5116P5GTP4NT6c8g04011FZ5aq9PymcSjxnmvfN6rD8JvlLS5i1aZtCZRQsVfit
	 iOZV4HCiu+NqCU1EHvoPOP17GuRmAa4O5W8u5vNwE3LksCqOAN2kQXai1iTAsC7H7wsiq
	 7z33bppeOILYvhoMDtQOkedHJz7x1n7hNCEibtXx++I7hSgpeiVz/uoRDEOXbCofk+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=f+1+dbtX6l3rqjCgf2Tlk45TD2XZkk3YG5+pouqrQ/M=;
	b=WAHveMGB4GJfgERf1Baa3x4LwfsiD/c+lnR5sDspKd0TYA3Ff66i2QH0NcNPdJJ9lT0s
	 F6MD6GANScihYOhZZLRNYlBa6Eb54PiQ0LrTnrOa+XNruw99cHwo4TeDmYWdxLeIFC5F4
	 UBOklnhSUfbccXTYv1NvYF740GfK7ySvZ6umDO1ih0fB8LUlUs2ChdcfcbMPikOxilKJD
	 pxGNCZTPnZ10gixionbjpC0klkR+m6ErXGxGVRx+OluJPwWiyTC7k//JMM/rvLsrB/Coh
	 wHBAsdaRK6QhNJ5wC3EaPbpDq6T+CA/c2XdMOHuHpjl/twGfWYWi+85yBx5q5dAaVlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e4p5xD3I;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F676606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F676606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=e4p5xD3I
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c506a231b88so1064626666b.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795779221; x=1796384021; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+1+dbtX6l3rqjCgf2Tlk45TD2XZkk3YG5+pouqrQ/M=;
        b=e4p5xD3IooLFZbWq5acgm4Ma1/ZA5jdl7FSyZfGfmi7lF7mHgQL9XNHXfYAMIVCoe3
         edN19M6cbwwpnnDlEowq12ljG0UBnuyc+67+O6n2X6LYs0ZOAHBXtjDWcdgX3Vhjg7/i
         BJqhm9slCr7BcL8QD6ib3Ny9IKZklL9X+0nRg8obbIzH8WSf4MbQArzkgXWG80r4PdJE
         1n1/05Blcg/X7IYQxfj6jg8C0G+/9ZGWmRitQUMPp3yHgzwcI7tFPgkZX6DpbYV2t9/b
         98zH+e6hWgsOIkWd+/n9pBaf/kByUNR2wmlRdLqXiAtjGrbfeoyf47XaJI30wORwd1tu
         DGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779221; x=1796384021;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+1+dbtX6l3rqjCgf2Tlk45TD2XZkk3YG5+pouqrQ/M=;
        b=SHwfFdq+C6UNCqZKNitKy18GeWFuADp/9hpRlpIeJLqRpFmR5bPhflOFgsWWVeKzme
         jQJwHzffDFdMxKqL8NvHDMdVGgCcKtOzJpCbDkVYPI8RUsPf6oZdHVUyOE866VXYPqpS
         cdVrFjp84WDoKLJIY7VsKQkO+aVmrI3D3dAeD0o0F/H7Nv2Ja71U/YbjHN6KcImFwYup
         ALjsHMfmqzKj0geO1ZzTZokv/A9xiqsCBC/jD731GVi8NqondFGvX++AnOqHV6cEUDQq
         H54m4pvTuZIOkQMkfRNFpBqQJzeAtnHyDxeic726cmjSvhufNkCsfbSbfVcfhrBIFPkE
         jAhA==
X-Forwarded-Encrypted: i=1; AL+hErHdPjVYw5Nd3I+XoGwhSNhi7yLmlorvlF17vsbpL8BzmVXc0/u/KinoCxkvudos5kyLqJm3pPBZNvxy@vger.kernel.org
X-Gm-Message-State: APuU4Z9JlmVVwvMrYJjV7RtWI5QiBUJr9IOd8+wRqaWlJYsqVXhrHg77
	uS0ORln/L8QMAfEL4TUIReHhDhhyeAL7Qt7AvHKPjKZ+kIhpCqHh7+rYbjv5XQDsxcs=
X-Gm-Gg: AZFdTZfxyh9i0ljZqMrPDK+mYqCGJ8os69Yj9napaESl76ba3dUyRjJyn7Fq6nSK34x
	AVrEsI/QYrX2zwBd197MxD1RPJFNv7NkjjFWi8i6hXCJhgyMhTz3n9NzwvrylJcW1DfL0WbpiOg
	gbIItZaxpx8YpjKhX2PdEkFiySXL2TRchDO37F/5Io46XXWoa2TFRkY0ncaU5eAZfxFNArgp9CA
	FGtQ9+eXxO6B3l61mTsd8slfraluPY2cXFsMaGHQZHnWJfyiTrxXEI5NsefjV6CjanK9r8YaP7d
	+2zdoUR4cwKJfQTZYtcy7x6z7HuTMUjv6/iINUE9UqZN7YFX5MingYFEOEd9a+nVe7DJDF2GVnA
	swIOm2z/7LUmw2rCHE/4SPruyK8WZA2C8hFrs1PElNe5B7gKI/ASPlg5D90o/LJ4O01Bg6SzCkb
	u2eGg7N8Cc5aNotNX1ZJItr5hrfUa6wQSpJeBz4SdauIhW39Lop+Piu0y5Mqi/Y+dHUtn8z/JW0
	AEU5uGJGG8lh12NQITMo2XiBiovA46mr5BFn3i6XaDysgWBxpEd+1NGaaZoJ/vmEjvqYuuFu0Oe
	Z+vBN7U9ia0SEFdwrpBkxyGH7pKDO0cDPHswQFMnVHIRgzfRk1hrAKdw0keqvRzIG6K4lg==
X-Received: by 2002:a17:907:8e88:b0:c40:80eb:c543 with SMTP id a640c23a62f3a-c513a4347famr2083302266b.4.1795779221611;
        Fri, 27 Nov 2026 03:33:41 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm830289666b.82.2026.11.27.03.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:33:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>, andre.przywara@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo
 Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa
 <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin
 <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid
 <lukas.schmid@netcube.li>, Cristian Filipescu
 <filipescu.cristian@gmail.com>, Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
Date: Fri, 27 Nov 2026 12:33:40 +0100
Message-ID: <1jik1ild9n.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 26 nov. 2026 at 15:36, Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

> +
> +&pio {
> +	vcc-pb-supply = <&reg_swout2>;	// via VCC-IO
> +	vcc-pc-supply = <&reg_cldo5>;
> +	vcc-pd-supply = <&reg_swout1>;
> +	vcc-pe-supply = <&reg_bldo1>;
> +	vcc-pf-supply = <&reg_swout2>;	// via VCC-IO
> +	vcc-pg-supply = <&reg_aldo1>;
> +	vcc-ph-supply = <&reg_swout2>;	// via VCC-IO
> +	vcc-pj-supply = <&reg_swout1>;
> +	vcc-pk-supply = <&reg_aldo1>;

K is bldo1 according to the schematics

> +};
> +
> +&r_i2c0 {

-- 
Jerome
