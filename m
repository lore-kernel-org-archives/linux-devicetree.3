Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829818;
	b=qU9cBJZRGQEOVOlZSI6o41DLj93ib/TkcqipHw7lZXoaDuFR6zxy0mI7kQU/WqWYFRGd
	 2+ScgU/idITwjbqXPGM3yCuW8HScbDxbYpDo/961TvYvuXjmHJqqeyioS3ZzvimSbN2ri
	 CBXxoLMSw1hzey1ovnmyW7cvHEUx8a8x9X/kkvSBqyCfPL6HOnKVzswe0W/Sk6HFgQYhY
	 Eh822KmX+SrWcL8bu7z/7MHrbFQRRr+o7HcTRkK8PcfCqQDM1sQD9EJUNQaZkH4Rd5WL6
	 +z0vip+IoZ8JFtJltHmTjo3XXINbktlO9b/PHGZSb1Shz7eyAKV2gAbtOBcXlbhsXfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
	b=zmmUuD3wuqOn2s+SBpaZNRDSDrgU99mCVAtbhYk5ex5/FaB92XH2uBGG3Bui/ybwnfI4
	 8ma4YUuvAX+SaLvrtI+HnN8D8hK8JbLD3QVHKxg1Q53HkHpedFsgEzqNjppjS8rNaw/3A
	 yXtDc1wunpUYET/AwXIhTuMocK774MrL77iZDAtpLfcTV9e/PcjNiq7QGsZQ3my+DdCi2
	 8RMxN4NsoWqfQZH1VEhMyeRY3xMhGQ3dCBa0bHf/Z+qPmN5uJM04oDRNvG1mmnVH15qs4
	 C9u8cNFSzud9rt5o8yL/JOPk5Vv/DPcneygaq04ljTmRaLpXzGhx1zJw2hqw9RueJTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7SknmwT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C961606A31F
	for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 08:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C961606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7SknmwT
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c43fbcb4393so223430566b.0
        for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 01:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829816; cv=none;
        d=google.com; s=arc-20260327;
        b=bIZN3SK8Exh+R+WRzV08jnE7ePKs5VtJiJyzMw7ddJPDcBiyo5xFItZ1VNPRtvXOPt
         CYR+uQNWybm8oGM1tBg4RzGlYt7tRBfqaJ7DMfd9wcrv1JAKInOyJmF9YgOxelqK0bwX
         UHByAXKERElz4KA7AHnd9+XTzsc9eIXZoM6+c6ezJcDhv3tuDSNuhz1aXfiH3vpIzvJK
         lx8a153hHiO96Vi6wkeZ2oqK1OxpozQRGOpUHzGPlylYnOSjJ60Gl+RVHvjQZ3I0xuNl
         uu2t4xSYOdHPCfZte6JhWlTac78jlQVrMgYkdxy/qlVwMtzFgP6t7cEDgMeCNZbgfg9r
         c5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        fh=sPz2IdyIpUMIOILKWbG9i4L5Hk22/wxpjH+jb64dyPI=;
        b=PadXU2FPF42FNRrgtjBd8lTOebZ0xN85f07lzRHlNm6t5gmRyo/wzlVBtaIH9JdlsW
         VTkTbV68EgvJVAszfgcgDY4Zqgo/FsS8BFVboUPUDbnsBs/EGcGnxjptechRRWQUia80
         6DbixnaZqZkYWPkHKl2W4Jc+w91bPcJ6sOoFq0B09wTWTvu1FHhGCHqeL5GxVWRhGsDK
         qV2LunspB5myuPFm4EG8vsTZ40CSARrBAkfCQXf+u1jOBSeWgrWNtGxh7Omz/Q3ZrMaX
         lsMBs/ap8XX6iWOe9JGx+5Bzz1Z5LXgFpO8IzDfjaf+mhUrJkMNNsEU7YYsyDoDmhmcG
         bxqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829816; x=1793434616; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=J7SknmwTTzL7ECy7vAoxuDafrONez3XeCWql0X/0YXhgvAQE2BfBECDlTFWueGZ8Jh
         klrfah4NQphtxV5+spcx32j1zY8Lj6vh+cJFzrPDn1Ptw8VqQ53UpyioqrJd6EaGMvWO
         eSd9MJuHBLn7s+f0x+KjG9NHtf+4lfLEvhiOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829816; x=1793434616;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=XbnqciMMrQXlVFUk7NXxRd1BWXun39Jp8IUaq+ISNPHMyU4wjVmSyrNLGeOmFq+LRr
         8K8Rbp/GzIyKgoDXmHbniPEqqKkTDFesLZWBItPPWeMeI/iE721sp+Env8lZbcWDvBYc
         xZKRHMMD7MfcKP051WQa+YeK89IlI9xXqvyTaCanTze7xsyjfoyr8eQ1eIDNgUUXbNNJ
         9PZb6vpkxLy5BXlKkvWsGdxog+RAsoOTn/ulh8gf5vGyVudBxV48DaW5tut0cWBSBFoT
         PEu+hzkcfCE8KuJPgU2c/Xzra0OXihRyqlkpkqxJNnSlrFphAvRzYULogaObLCj5+A16
         jgfw==
X-Forwarded-Encrypted: i=1; AKwUvBwH1K7KRptCsgf6yOImv0rw/6xqQOZNNrOO7ZipsNh70ZcX7sucEv05xBgmn2yLDKgzYPetjVWyFVHi@vger.kernel.org
X-Gm-Message-State: AFq9FYKLIXZ5vSkPgzy1oB2C+mo4I7riv3kXLLV/NCaarZ21VxG4jzEy
	v3eHeGx0vtubj4E+N3n6XQDoMcSaVJvNGFeFWLCxdxhr92Zay6m77bODfdKfUKWWqv3249MnFuL
	Qn5byBGseA6IkH9Q/Ih+3w09VG/kOYGog+2FlzQlg
X-Gm-Gg: AYBFou3uLpW77KTgxr+cn85CjWOQSEOUSjvwh4U8j6TlNvMfY1nGtSULjaFMPAo8Z7+
	VvP5w6LrxH3XYQ8kBpe3tYKhTUd+5s7WIFOXbZcqJD2G1BidfwoRAUfA0rrXwdZy1B2B/N5rP1e
	I4Zq9G/ctds6rYuctwNJsUgcm63uGaQ0DBLIHE+n6Na8GtByucIqVpFok/2lbMwTYgeRJyUBp/x
	rJKahKwzQGeIKwDQqhVh3lf5gQWh1hj8PUYI+UNTkkuQfipY3q88vhKYyn0wlMcIDiqO9P8o/gy
	5czdfoHBtePxIZ6gdKP6V+2D4OEzIkT3/H5mubErcxa9NRjYnSV02r+kJiIR59J7WSeeWwqZGr4
	TWn+fItzlxi49AAEmHUzeojf+1xEAm57elow=
X-Received: by 2002:a17:906:9f84:b0:c44:494:692b with SMTP id
 a640c23a62f3a-c46bde198e0mr151110066b.22.1792829815874; Sat, 24 Oct 2026
 01:16:55 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:54 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:49 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:54 -0700
X-Gm-Features: AclHuK_VJyuusU7nyQWEvJVdBRj5rBge31M7RaY0GTXZjSe04p7xrEJjqvNNRK4
Message-ID: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
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

Hi Doug!

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:

> 1. It uses a checked-in .its script to associate metadata with each
>    board's devicetree. Other tools can parse this metadata in order to
>    craft a package that the Pixel bootloader can understand.

One thing I'd like to check before this goes further. In lga.its the
metadata is a string packed into the configuration description
(board_id=...,board_rev=...,soc_id=...,soc_rev=...). The FIT spec
treats 'description' as human-readable text, so this turns a
free-form, undocumented string into an ABI that bootloaders and
packaging tools must parse. I'd much prefer proper properties in the
configuration node, defined in the FIT spec [1], so that every tool
can rely on the same names and types. I'm happy to help get that into
the spec. What do you think?

> How does this series help us?

The FIT_ITS path is a second way to build image.fit alongside
make_fit.py, and much of it repeats what make_fit.py already does: it
puts the root compatible from each DTB into the configuration and
compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
/incbin/ paths and a shell loop in Makefile.lib to do the same for a
hand-written .its file, and the .its files repeat the DTB lists from
the Makefiles. Have you thought about extending make_fit.py to take
the per-board metadata (e.g. from a small file next to the DTs, or via
FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
logic, and trogdor would come almost for free.

The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
documented anywhere, including the image.fit entry in the arm64 'make
help' output. Please can you add something, perhaps alongside wherever
FIT_DECOMPOSE_DTBS ends up being described.

[1] https://github.com/open-source-firmware/flat-image-tree

Regards,
Simon
