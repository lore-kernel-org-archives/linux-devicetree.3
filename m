Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793561696;
	b=zmH4pl4PKtJiikjlc6ntVxrKGBo60DMD6IwvKQmEoZCDK3WSam16bQqtf5HPhuGLQWyK
	 QTegRfeYH8C7o/ofcPE+M39WQy2rkUIBCGEsZ72Ga949+u9w11+HFEYeS2zgH7LB+M13M
	 RNoDXm0n3eKN2wIST0jAzRkEGTkidq2Qh0dsbrb9Hoyo8eRtfJ5HNUJCvxxnq4Ybo0zEz
	 v13IBInV3lmiamUijMX9MlMJ7x1c7NUPSxt3VlcWrjVpld1Lt10G9kvyhFgu4Hd5kK6lc
	 TJlXqVT9eslCzmRFeG+B6o5YZvmQw2Q8gRNcda09p9mAMFYyBrA4uHBE65lfF9hy0Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:from:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
	b=EK9b7M0odex7C+VQyM6yziCRp7jUU296OxtDFy4vQV+Fi2R4yIJGXVS0I+foEBBJAGtP
	 xYTG45LXat410UNAZh3IC4KKkms//pD76L85grU2hlc32Owrkz9PG5daocqCXDXz0Pw2m
	 xkWd4CbJ9ZNpTeF4bN/jE6ty71Wp7UXcd8+IJTengMRlGFVaPzxaPYWvK/+//0r9MJ6lo
	 hMgm39lWTqkT1q9CmacsswIkP8nJGz2neWud06N/Vuv64w/ZdcSsptLHTotE3+M7BAklE
	 o6KpBwAuMgDk1bNx6YbqKSbKyagcMzsv7QJnXgxikSxaT10WGkHXieD2//UCXSlg7Aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Lfqcc5GG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51A3606A32C
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 19:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51A3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Lfqcc5GG
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so3192935a12.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 11:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793561694; cv=none;
        d=google.com; s=arc-20260327;
        b=rwWpwWaB4EL96wOiWu+Fi8t/cudCaYe441+sqavJ5yCGn4HWc7kFNlgwtfbmqcMqz8
         Cer2A5ikhCkZfH5C6t7eobwAw7kfc8H8XBC5AEwPH9rs+DIEzW1av5cftO2v39+7hitK
         ZH+7YOlnrXzTNB4HIJcGCzTps6kPudChsp0DBQZfRpU/zjIdTtJZnE6ZIffTVDnc0Zyj
         rPFLirglwMlfXIrgVpbQoIlXb5DY6apZLSiIQqWE38NenscesrovoEwb4Ffwg3sC6ljL
         +JZPJY482BlI/UI2Klud2aTYGOF/fvM9kyiURGP8N7Uxwec1Ew64WiPVqAwozzp0aEkd
         vj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        fh=1jJrNje79qcSAKqUW6Jn4HA7BNc9XdPuiyap//1wJV0=;
        b=MTrb2YTJlQtcYhQ6miQIid2XRkm9wZXiWai+FdPKlRK42IVSrRnIdKI8GhtWGBYvjs
         w6ZPgRwpQR+DJDDmBQCP4iJ6pJKrqK8wS5bUz8/IS4nkXYQ4ciMoJ9uFFTXAVGrkDkGD
         C+/rLKgXzog1y1W9vpVPRFnm/YyR8m1T9fg4OnyKOUuEDHqDt3hpPgoUw59PxSVMnWvN
         F8tIvlHaHJ12x7epKOJokcsl+tnoESSLT14zut+ooT2pcWVjT3g7EFBAweAl5oVERkZX
         OZkrigOkRz33FZjYLGy0kkmyePWa7cqWn+YKJNdBU7/ZRv2n/P/vlMpsUsHeYKLxsb2x
         1gdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793561694; x=1794166494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=Lfqcc5GG/SwjR7rhF6i9wN+51zewpGS58ukrmB9LGRdbbpKdip3M+YroJNl6U5AaZ4
         rF//L/DV6VSxmy/1UQsFeJhmoDWwkPFReDLBiC+oRpU55av1FrMnZVBw20fY7l4UynL3
         HVfRKiNvpd9FUkbDQyR76hW+g1Owj32N3MUEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561694; x=1794166494;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdJlAy0M0lu3nCDv3njq9XZb0WjIsN4409XaMh24jfs=;
        b=uNDJO9B2SJQFAR8FDOQyXQyf4zbdgd61joH4uenO1EEyI24Gtb4in1YqfD0s4QtMWN
         PWWnEzLclV1OSaeboezr4v4c9EUnvmOiq5e1UzXVd0mQMrsVIRh4Ea/hG7B20UeIgagG
         j+yrIE+Xv2oFeAMJMROpYz/bLOWTTLUAgr4YXa3/V/u6LO99IvCUPY+cyHCPWBL+G+/0
         KZFLXcieivVxVcvxCsOLwRxsajLVXLnbB3whlLA2JbtKJ+v93XkqCaYGIQVX0CduZbe4
         dspJyxTXs/WY4qyVpIJI3uANuC1k/9jq8nv+2kRbPJf9jIygXSxTqinAIMd7YO6qwZxS
         5bEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxykyS9EdtpYD69rbBi1Qfi62iEiRBhftQxACZIZSj7zUWYUPOR6LpjTQxCNl3QantKhRsATx4T6TIu@vger.kernel.org
X-Gm-Message-State: APuU4Z9wXu3J4CWPPjgP5B9dY5NwzQm+9OMGBp6d+ziIlpPnSzRiaj8u
	Y39eqnp3Ovo1ytn1vOxY7V0fsr1lzKfRENPUw6h9aARGhAh970OalDfaOM7b4nTsg1EL6ooi/x4
	dfX5SFwSYAPXxTJ3LsjHK8Z6RrYmQEqgxOySnf0nm
X-Gm-Gg: AYBFou0fSFcIbNsljTzsvsrJ3PxqpPrIww+bMfh3i5BsqqAtuW4WFK6x0Goqh+754qQ
	29ZI/+WFr8sJ0zv/V+5IfnVoQJB2BLy4k/yyWZo+Rs21KtAei6hNlFHhIljJpFl5fv+ZKoPwaJV
	s5SSyRGEP5qBvxRKJcTeSBLUla+uAGVDJI2r3fTAVGhDTYjG085wgM3NeC0dMiAfIDxERI3IV+Q
	xufzk6PZV7mxMLGdPEsno7o7wX+sPaLZTpGzgtN0zr+DmMDkSKPrG5TmvAZJ+oEqcIg6I0vn2C5
	DM0P1AsTWSIoP3DvYHYes2rHh/JMi2GWUrZvwIy4cTQ6tI25EWFgih6dGXMEpnfZGJmVP4zolYW
	xy1qzyFMAgcmb3CZ6itjcHrDleh0f/t82o9mxHdk8RNxBwDgM/i+ygpPhc0bYkouIiPMZNiDL
X-Received: by 2002:aa7:da45:0:b0:6b3:e89b:128f with SMTP id
 4fb4d7f45d1cf-6b4d4d6d938mr4052419a12.9.1793561694122; Sun, 01 Nov 2026
 11:34:54 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:51 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 11:34:38 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
Date: Sun, 1 Nov 2026 11:34:51 -0800
X-Gm-Features: AclHuK-OENc2MfogrHTK6nr_VXdYPKQaHTgRVjZY6Us3vAfjaHxM1Qejmm0CbCs
Message-ID: <CAFLszTh8geCqamVZwO00fx6t8SDfVHCFP1Fx9PnA2x9TosDKqg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:

> Putting the metadata in the configuration's `description` property came
> out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
> already uses configuration descriptions for similar board matching).

Thanks for the background. The Xilinx case is a bit different, though:
the same project writes the string (the binman .dts) and parses it
(board.c), so it can change both sides together. Here the kernel would
write the string and the Pixel bootloader and outside packaging tools
would parse it. That makes it a cross-project ABI, and I'd rather that
ABI were typed properties than an unwritten string format.

> The proposal I've tried to push a few times is that it's OK that
> different loaders have different types of information available
> to them, but people don't like that. They want a universal standard,
> which nobody can come up with.

I agree with you here. We don't need a universal set. I've sent a
proposed spec change [1] which lets a configuration node hold one or
more match sub-nodes. Each one names its scheme with a vendor-prefixed
compatible string and carries the properties that scheme defines, for
example:

    conf-1 {
        compatible = "google,lga-...";
        ...
        match-1 {
            compatible = "google,board-id";
            board-id = <...>;
            board-rev = <...>;
            soc-id = <...>;
            soc-rev = <...>;
        };
    };

Trogdor would use its own scheme (board name as a string, rev and SKU
as u32), and Michal's loader could do the same. Each loader still gets
what it needs, the types are explicit, and nobody has to parse
'description'. Please can you take a look and comment there? If it
works for you, you can point to it in v2.

> Should I give it a shot for v2?

Yes please. The DTB list already reaches make_fit.py from the Makefile
through the @file argument, so the new file only has to say which DTBs
to include and what metadata each one gets. We'll need a simple
per-platform file next to the .dts files, passed with a new option
through FIT_EXTRA_ARGS

Running fdtfactor can then be another make_fit.py option, like --decompose-dtbs

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Regards,
Simon
