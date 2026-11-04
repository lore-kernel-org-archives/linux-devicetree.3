Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799450;
	b=0l9ig/TTAVlAqtrvFGELy4D9ZJYGtmNQg4D0o+59bp5GkMysZKhm9VtWhJ79r/5b0FjB
	 7PtHXS7KUuN7zjgDPLWlJ6mNtBgWa4oaystZTS5cxtmhwHtMnF8FhmIiuvTt1fNmDYhIa
	 VGG+8+Kw6gPBzrz6Fwg/JGe59X+JQLfNh+yQtZ7O/Z1SVURuF/C37/3C7xbEBKtkYO7/1
	 mb780v3Wc53OnmUSm+RXZ3DO/JHrAglVPagZvP2kFOayIe6w4XsW1kJnHsBe/mcO0aAi6
	 sAI1DDE0ziZdkjaFOudxhszzzgH3VVu3eQmFNi55krig7eCHCsB78nNRcCFWgTlVWqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
	b=Fj9WItmfqlY24ez0siyzZ/CF9K1HsfNSkHizp4LB/TxAYVkMvsOCEnF6P80TSVm8Efki
	 jJYNKEprLOv6xBpaI2+kGmg88dDPemXarBGK3g3zo1TskCquRLIzLJWejL+zrQSux5zl7
	 NCaVpoXKk9wNk+bKHTtxiRvliqSLzhZdG8heoVuivi+oWHcvFwelMNR9TQbrClR1aRcC4
	 vSQYvnQzbjKWGuGhRnvLQqBRIih9BdPvrcG/fKM7+Q6QSlCKcKhduThpBCkKLcWcDuBre
	 lxAMW7bJJAEXHOmQDF+w7S4cavU/c2WlDOiPSQuYVAS/lkFVldR15DvR9qokJipkpiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbJKKYLo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF8A606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 13:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF8A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbJKKYLo
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8470d7d430fso273053a34.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 05:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799449; cv=none;
        d=google.com; s=arc-20260327;
        b=dmQulvGSreVFirjRAg4VEvoPP5MRMNCwMngpAgJqnmuJuHQY870s5GD0rxNobr/sL9
         zxhXeb8rwa6FnIAf/OGzV8kjoYDfPHLW3YqSFxF7lAsqNE7mUszLQtsS7bYHJGvdFpHZ
         j54g7BxutyzGQMXNQya6qVt/74OazH2zwB+8nIWomvAx6tUXvv3eqKGot6LTncaDCY6L
         dpo1+Uhvf+8eD1lXvx2LRAP2PUDcPoTndf5c3rPsDCehbn3EcbXmTOv2ah0XFopIwKG+
         FfTBcfoRtYSiT3jU2M/p+9A91usCuQT3MkKGvBUnNgY/6uVAOwB919TRl7sh/VpGl5jM
         GHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
        fh=VVyvQbsN56xVL5hbywsbnOx4OPIeOWn1/4hin20ckNk=;
        b=SuIfQvh29CfODCE13wvDp3KFl/KZc2CK/qB4vK5R9yibO9CUn7ebdtgRl4/GswPN/5
         OWZJ6KSfwxa2WOBD6zOMktaEcZpOLxhQT+5I8Ww6rgzbn2gbn/JBsEQ3J59VuRI3NR69
         ILnwOFkiEdYLbNrQVqOJ6hokRMjhH4FgmRjSo6Ji3NyxbHaTIJb7XB6cspEANREvH9o4
         AP9QsHxw+Apt9AIVsKoqpbgHfNeKPBfCVY3KqIPT1Ejj260i2EAssul+r3+48NRfKaKb
         vqNJZmsT5f0HoMxFCywQGMKJM6JFNF47uZypKLC5jhrecCdj9/vYnVA5xrgir02mOoAu
         5UNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799449; x=1794404249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
        b=HbJKKYLoRFTbv88+u68atuiDsGsfEkhGD9eTclvuReNcQP7HDpMEPxVstZpud3wUT6
         md2aFf7Jl64Aqg2kr+73B+6+DSf7K3bLWhJo2zrkqk3pqlIOsIe9A5YSq6/f+UixpVjh
         VRGj/VMu4gDKqlk+/zOSkVxDRi+cM3RrjL8MChQV+8pukxf7tOoKwoPrgN0KaLN3/Xqh
         kq6Z4jqJwJb44vLVtS61kwDPbUN62SiGYDeByPHe4MWzzGtGKyBbmt1WBYpY8S8p/OSP
         kyeRQA0DrCZ2eFtyujgQ1eNKJGAaCSgkM9/8eaW/Sa5cyU8h/0N2xH4wH1qcQKuV0PSu
         uM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799449; x=1794404249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
        b=A/+yq5eUqrDL7hHo/nB83wwiieeVD+tMjp3iOBsBxjOlDFRNAmVnYstBpnsFqJshto
         uWxRoqbNzueVqioaQ0vAwKZ8a+ZMXAHYM33MPtjZj9c6mTbHTDpD72dDctsivmfnXvd9
         ImP4CbNxAfThlZTWjw64a5mDLUq6yDL+L+5nv6czPxh7QiRapHLPRnoPvBAYVSbMY9ir
         PVvyTSoyRS/JTeJuYXl9ffRpHuLSrx9++3NIPSyRjYeIJdcvmsdPYaYmS0NB/6qcX2s9
         G/u33xV9jP52Ie18km9brza8mOKIYZEYNDVpod7sDT1Oz89NYmImRH82JAC6Jr4olanz
         rGxQ==
X-Forwarded-Encrypted: i=1; AKwUvByk4z3W5T6k10JTvDQqcESe13uGyFRTPevOpcletkulVT8KBkpfdOGguQ3fxacP3Wa3L2QmvWAzyaPN@vger.kernel.org
X-Gm-Message-State: APuU4Z9bo2lf8KPwyh6ECagJxJCBAYsFlyVfEYbOBqdGd3JDu+KxAZJ1
	eqTAHzhnAUz3vhIwXorAgx8a3YvmsN+VfT9N8rhFVcAPjF++VxshAXYb1pbrn+eCr7tfX7bF+um
	YZMY2tBd17s1IijWkAh1s14GFJpNDTmc=
X-Gm-Gg: AYBFou3Qr319kGbVQjDjAVmkqjW/e2/B2B+u717CSh+sYiZlK+2hBKEYwokXsHlm3Cd
	xiLAxrj7amM417T9JEHUl3exE27Fa3uW+++YCH6itMmLbA+DYimYpzP30vTj/t4T42dfzT4FzSG
	TesVVTiqcfOVN6SbMK+mcKpPAsGi5xVa5LDlm3A3YuQZCkmvOIUIZihUao/v4nv5Et0w5vPJBx0
	81LVDusF7ZkIugDwufUaCItK3e+Jold4mNRUVnbbCIMnx8lyQTBYD4udd1aPlE+k/GBnTpVDxEY
	hiU2DqksYErI8FYtTphwNBdZi2PmeoGAhgDgOtg/1c8KqjOi8pCTKHk0TCL8+fUs7YXJVgPdAVq
	FNokUHXIYhVymlDDrXrUnzyhViHQ0CsoEk0rv4VtpTONzPCuKb37Fk8P63ruH2SMbA5OlUsRWp9
	tydxcj
X-Received: by 2002:a05:6830:2a8e:b0:843:ed9d:1535 with SMTP id
 46e09a7af769-85eeebf194dmr2565221a34.19.1793799448718; Wed, 04 Nov 2026
 05:37:28 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
In-Reply-To: <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 4 Nov 2026 21:37:17 +0800
X-Gm-Features: AclHuK8-JeRODUOUq-HqZqaALo40tyoUFGXYArDC07Ims6VRBqfkF1PB6rfGKec
Message-ID: <CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: joseph@telaak.dev, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Nov 4, 2026 at 5:25=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
> [...]
> > +
> > +static const u32 sf19a2890_gmac_resets[] =3D { GENMASK(1, 0) };
>
> Are these two bits separate resets? Are they individually controllable?
> Why are they bundled into a single reset_control like this? The commit
> message doesn't explain.

These are reset lines from the same IP block for different clock domains.
They have to be asserted together even though there are two lines.
See nUARTRST in [1] for an example of PL011.
The gmac lines are for two sides of the same async axi bridge.
Asserting them separately causes a bus lockup.

[1] https://support.arm.com/documentation/ddi0183/g/signal-descriptions/on-=
chip-signals
--=20
Regards,
Chuanhong Guo
