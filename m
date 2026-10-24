Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829846;
	b=m7uTt+pp6KwppBKXN7cu/m619+d0pvbWO46sKt3BVp5BHDX9Z/273EMrDagTgv6Iq6Xt
	 zNLbDXkguhltiSZbVFEeBVHW6fXG/3P/WmVuxlIQH8ly8pHzocJ3aUEkhSOrsdaSfIjSz
	 8rUmbe8ELow9DE0XpLg4cRQi1rQmNEuKOI1vP2Wi9cAU+pCJ1XZlkGkjTIZaK/vdz4rSc
	 +Sohvc6gZWeYgTNELAShA7RY/6/zIWkLL/Jd4+TvplH1EvT613DCE8fCnfpVVtM6mFOww
	 aW8vD4vsJsWxQharz18SXhdLhQsUd2moQaTzy4qcEPWEmDzVsfcZXNWxgiuoCTrMRPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
	b=hVuPWr4wiS1veg9GE3a2zCFrq0YoaGa2m2Y1T7Jq69tK4Tr0tdgdvC1eVZ1KXWYpC6Jw
	 QIMPisR1hrklOIH80nGVVKEkuckpr0N07aaTD+TNPp4luDQ6wWpXofdCYflasl2FBSR/a
	 JUofaVgfSzXgVbyttc3XYw09s8M0sUSXqLpSXXypFuB4hObatL26OwYor0KqURj2Pz3Ox
	 eUMrka3j9TU3LBI0hzXD7b5OM1euvxjn5n5+iLliLFTABtVXJAuJA0pj5XZfd0SPlu5rH
	 Oy2BRcKkEI2PAe6p0+YRMoF/vPLBzxzm4og8q/Q/ObsBHY3VJ7ux6v15aSwYRwnk9Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+scGDok;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8302606A31F
	for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 08:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8302606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+scGDok
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso604939a12.0
        for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 01:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829845; cv=none;
        d=google.com; s=arc-20260327;
        b=PavwSsedV5HX9OuucAGgBbXeJbeK3/IraoFyKdLe38lIc+fKbuDnKU1Of7x+S5Q8i1
         1PCl7wBky7ZroDHGoBMkF87RqMmesNY48QuQFF0VOso9ygSioVJAPmvhj1PF8/IPEG/v
         Ju/tmjB5mxNU3fLvz1JDjaWQfI1JLIen/isMugnn49gF/AzDPAxpFGlPk33ztT0rfU/M
         6tiv9WEu7s9ZVoboU7z7hMgN5cyFOykJSBJK7SCNU6/n3sX1rPS8qP1YVZrSMi4Yvp3B
         kcpF/lri9JzKHtop0qWqMlsiQMFwxEVaqhXbn0aX2iX+VKwu6ngMblJO/pcnsbKOwt1i
         XbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        fh=aHTkurgZSBFXQdIhvS+x1ms6X9afaSMpLsqkQw049Us=;
        b=DkQPFAUKesRzFbKebsf7b6iE7RK1LTAYOWLyAEM5DN1SPvZzd4tbRCUsR8aXjQKxPL
         fK2RTTXvdwbi/fD/WlFKTOio6XNCnNrBipatIHLjTLIrwox7lyCvGxtGpF8mdkHQV8kS
         u9hMG1xihpmci2thzOQSKFni9fml4/m1k2g3MfTAkyMRuwwTY6hrACXUGoeMPjX1TFgW
         whcs30n7Sy5kCbg5h6qpaegJuY1wpmR3MrmDQLqJzc6Gvry6Oz32c/4jYSnxM7zX5xzC
         veZGZS3jJTc0KzgymHlK8ub2IvnA9wbHVJcZOrdUiJF9hBT2YQxTojyJ1ncSHvTuK52n
         4XZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829845; x=1793434645; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=W+scGDokeW8IVUlPw1qaHOR19xQPyTOtn+x7HYHtCqXqHaqa9rlnDqjOM+2Ceue7fL
         Aju4fOv9xr3yNjCoA1fmjYX1vQStbRNTO4lyjJ+X0ScdnOQnU3gmpoLqAC4vffWd2TMB
         smWVx5HbLNJaVGD3+OBLLSqtnKQQ46IxDRMvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829845; x=1793434645;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=1xc8V/t8nXm5AQQIuV5vj89cXAcuLyr97bN0E2ED7ObbyzNihIZiRUFP15ggdJ6aK6
         6nPpMQGyQDuUWtWTCTuCvcQOjLclsRknVYHE6WaEfbfay2cmUPFOq8CUCn4uKmeEUc3M
         dGziG3iavInIPznggggnWRIY0B9vmwT/fetONSr5aZVVYC5/1+5LywnEy4b/NlP5Cd7N
         F4rLqlNv3djPzPY/ikZJu4DVdoAR1flGDs5wwcYP3a8kjsJnYGHLOygUR9AUcipGM0g7
         qiSOy2GbeK9/jXlR/oipFbEn3UxwCzu0zeMh2pmJSEeNHMW02I79haOp0JuYhkmTnT9w
         UyvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd086C68bNPhMHWUVSBjK0Z/Lf+M1goFkp2E/aUovhYvn1NcCXO0+ua1QTl4Q2Qj/Ne0nFFIdUBCit@vger.kernel.org
X-Gm-Message-State: AFq9FYJDonFyxvcBXFAIeEAqQ5wTyTDluzXdpuTKAKiPPviGYLGTONEX
	HG/rtKVw0IqImmt6HnpyG2i05F9q8fem+VF4GDSAaG6boZc1DkAoEgw6RZs6GSo75NxbShIcHR4
	GK1sqms5JGzoUthF1NRcxjOI5yXUpl5sU3mjNB2Bo
X-Gm-Gg: AYBFou12br3Z63l9nQmbptcc13v51JUFdOQ+N+dd5jf3Xbb69wsxScKnzhI1FtTGqk/
	FntJikqiA0Smv4taMLmJZ+RwSJymICAFc1z2MNqFHVtQFA6Jz81C7k94Eimub2zK2OKRxetT2gH
	ffrsbb6rBHOGcu7TRmEGVNYGRPGvTZnxYuiBEihmqt7SF8oMBOy1lDWMDtaotQrcwiGMh+JsIF3
	3jVBhnZsdWiJklPxrpY4uk9vh1dflLfY02Ga1sQ/zTJuZkA9p+bNI98u9FRgJlBsZ7TY/4BLIg4
	Kx/UsvV1+/7cqcAoXCUfdJaW7K/CzJaLmkSIciNy7GubFao5BsrRfOdaaFbhrTtx6YBG2/Qjobj
	2KzioPGIy5ZB8yoDxr9hk3SseGZTrpbaeJfA=
X-Received: by 2002:a17:90b:4d09:b0:3ab:31e6:12fc with SMTP id
 98e67ed59e1d1-3ade9475f03mr1281929a91.0.1792829845190; Sat, 24 Oct 2026
 01:17:25 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:19 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:14:33 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:19 -0700
X-Gm-Features: AclHuK9OzNbsUxoUq8dndEPiTUrFf9OR8thbHVNZoTYdjjGKeFC-1VE0qwrhJ4E
Message-ID: <CAFLszThr=rPCTxQxst2_Br6MWwaRFe_rHamzLXY=ua4Qr8mAeA@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] arm64: dts: google: lga: Add lga.its FIT image script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: google: lga: Add lga.its FIT image script
>
> Add an Image Tree Source (`lga.its`) describing the FIT image for Google
> Tensor G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`,
> `lga-frankel.dtb`, and `lga-mustang.dtb`) with board and SoC ID/revision
> metadata in the configuration descriptions, allowing the LGA FIT image
> to be built with:
>
>   make \
>     FIT_ITS=google/lga.its \
>     FIT_FACTOR_DTBS=1 \
>     FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
>     image.fit
>
> NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
> image. However, packaging scripts will be able to take an image as
> built above and convert it into a format that the bootloader can
> handle.
>
> It should also be noted that the "description" of the various
> [...]
>
>  arch/arm64/boot/dts/google/lga.its | 68 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		fdt-1 {
> +			description = "lga-blazer.dtb";
> +			data = /incbin/("arch/arm64/boot/dts/google/lga-blazer.dtb");
> +			type = "flat_dt";
> +			arch = "arm64";
> +			compression = "none";
> +			hash-1 {
> +				algo = "sha1";
> +			};
> +		};

Just to check, does fdtfactor recalculate hash-1 when it rewrites the
fdt-N data? With FIT_FACTOR_DTBS=1 (as used in the commit message),
mkimage computes the sha1 over the full lga-blazer.dtb and then the
data is replaced by the base or overlay. If the hash is not updated,
anything that verifies it will reject the image. I'm also not sure why
the FDTs get a hash but kernel-1 does not. If the hashes are only
there because the trogdor script has them, it might be simpler to drop
them here, since the packaging scripts repack everything anyway.

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		conf-1 {
> +			description = "Blazer (board_id=0x070406,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";

Since tools are expected to parse this string, please can you add a
comment at the top of the file describing the format? For example: are
the keys required or optional, can they come in any order, are the
numbers always hex, and does the width matter (6 digits for board_id
but 4 for soc_id)? Otherwise the format is whatever the first
packaging script happens to accept, and anyone adding a board or
revision has to copy the existing lines and hope. But I think we
should get this into the FIT spec - will mention that on the cover
letter.

Regards,
Simon
