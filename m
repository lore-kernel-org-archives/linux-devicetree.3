Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793409456;
	b=4h0SHwgLvol7ME8vbj0zIovngTQ0MBTB+KMg5G1qtr3B+XOLHeKq139VCvG6+GuCG7N9
	 sif9uWE4SeBVGn4mNeVcuMSUHZ90F/Z0OFsFltNDHFbYjK1ohEyv/9xFGH//gJpKAvuhX
	 5EJri5uItSsBLeD3/aTqQBCsZAfJjf+n5LOa+bPTBj9BUimrZY4lOrO7g1OwFbtdveJBo
	 ca8vz5Q3jYDoQu3DW9BwWrhsjkupWkxfSOsHt03FYxp8CGfeKhDlDhqQqybzdlerj2FJ9
	 PUn5V2oxh77W02EJ7E8K1l/5zmRewOIAtWISzPZpal+6ExpGWkrrx1NzuGgsGYOg+UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793409456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
	b=NMTLYElKoIkvydDrJFLBi6rHFPtB+/uphOYWJqe78dFUlJwTIDB68Cwk296SLVtoOjRT
	 jM3/qegBqM4UWHZCcK53grhAbSzeAJNf2Eg2YE7pwnjFpGF/FJDxS5OYwZrgFX3O8WO85
	 L9fxv8g+C+5OvBISPsyTofdeggBaBZx1EASwdJ5kgdEKFmjo9sAy82sPdRh1m6oRAIrJB
	 NgsCYivUuZwy2T6keU0JSI171xwuUwaakpKMjcJsplnWr/KOdzKEZ2UHowu6xNZe9ZmZv
	 9OWskDKPqsWIPiuxMyT2o4XVCO/fOyRjtUzbXg7abcn8zRDnu8cwhLInz3LmxsTJJyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ensau8TA;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9FB606A31A
	for <Devicetree@vger.kernel.org>; Sat, 31 Oct 2026 01:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD9FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ensau8TA
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso870707e87.3
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 18:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793409454; x=1794014254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
        b=Ensau8TAW8rTE6tJ+SRuH5LEYkXs05SBTjC9xY7GYJVxKWNG/tlfcx5khaTmkNVfxJ
         j1nXUui4aPMi+/KNo6x2a4PjC/7R3b32B/r7rT5N0c0J+Bd9z2bca/6m0N8QGzp4lhUa
         pUgArG6NAgWh9lZ0lBMhmZbU4MJ9gM0L/PSY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793409454; x=1794014254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t12/gzZv3Vh9NEgi2dyQThdTzmEZzU4w5/1G0K00qvs=;
        b=MntJ7TqgRnRSEx6xWyJdLwiGZ5P167nINemOw8AfJ4uxmZiWxECp9+HSebVxs0aXl+
         7tJunfJYv1dD/r3YWqYUQ8azZyIW8QpNAtZKzE9cDIXrpzWcaXeQTHPCfGNVzB7O1N4H
         S03RozqxJY6uUYQV9457GflZTkHAdtSjot7w6dwSe5eP8w+hhqwC/eszLLuhU0SEtfMK
         yvOS3F+Bv/5Ps/z/EjXnSKqjq+5yX+xhQmQnkEcf/d7LSwv6g+bMqNtIvhkewfHU3gCK
         RYnBx+I1c51tgTf4qAuIpoPM7FDWvhXXFJePNCVRTIDQuXj7Z1VM2aFaWSN1d5pldzku
         secw==
X-Forwarded-Encrypted: i=1; AKwUvByKrOdbIWbBkD5Ynwcmlg/34/zqc8Zrdb1eU8XdQ7JbpS1pqksYN/gBl7xQ10Y3qCFw6/9rbSAuF41T@vger.kernel.org
X-Gm-Message-State: AFq9FYIVhb7G+RWkUlpWMhru+k2C+c5NSV+8ybKFVlJSzvDjq0sTInhV
	DQ3iKXhEhtkkn1+35vEbUQQv3MqyPyrd8dCBwfNy5w5KigmbFu6VblPWbc5ife4hsekbyvqxD5E
	//oJaO8UP
X-Gm-Gg: AYBFou27AwX/BMp+kcE7teDdwEk6Z31Pbpg7PzQnlLyBFHh/+rPy/16vNlyjSqCq3ak
	hggPD/ZIgdwb66ZtXu19b2WYY30TftONy9GMAEIxjJZ6Rn/Np2Wz63P/gjKpKAONDNF5Zjirt7H
	yL6pfUO7a2U2AHsrwvLH0q8azbckmH9tIxLfGzQFJSBd7GX4u49byUesqACWFGs+hNIU2xoMyj7
	f/On37tRu42qmqhrdBq/izrZ1YGEd9o2ciuv28Am3yYAtT33gxwvItTC+x9hxCDPiHU5FB+RCO3
	pNjuBYWWwGhNkPSvJSLn3UM/hHoWabchTTYsSHiCh5B5U0dhvZRxMxugM42upchG1kAIBMKJz4t
	qeHM9qF6NApaUF+cMlb0d+QWdwOqv/E9Tu3EXy5xGW1AdUXD4b0zpNI9lluFqZVrUGlt2LfoCTI
	cby31fpxziQk0+cBsyfzQHq2textHYS/Graf1nY2VtKHDi51s/NmMcWCCXED7r56GMZXdTh9IMl
	jcaAiEUg8cOfWjqKHrvUfcN2yZx+DONFMfZAkOMD72tv0Zk7dbafZ7DQuLOvrFrIACOEpa0LpSC
	Ln8DGlEt+y6MVoVcPvhhIL0dK7c0iHNXql31ERON0ggtqB08wWXSpCz5a8atN5vEK7tB
X-Received: by 2002:a05:6512:3da9:b0:5bf:cfcc:5488 with SMTP id 2adb3069b0e04-5bfd951d3c0mr1274603e87.5.1793409453897;
        Fri, 30 Oct 2026 18:17:33 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0720e26sm300105e87.19.2026.10.30.18.17.33
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 18:17:33 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bfc3292d90so1021069e87.1
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 18:17:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwYx2wtnDN34PLYaKojvdL7jRMp2ZOFTV/r1U6TrH1YXr7vU4b1HmdxbZ23Ym1IuqNqRQslLUg+aljX@vger.kernel.org
X-Received: by 2002:a05:600c:609a:b0:4a1:7c56:d4e2 with SMTP id
 5b1f17b1804b1-4ac1709aa77mr83103245e9.16.1793408992269; Fri, 30 Oct 2026
 18:09:52 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org> <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
In-Reply-To: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 18:09:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
X-Gm-Features: AclHuK9Km6WTJvvTvOnJ9g5USO9Th2gdTGYh9-cjnPaFh3hhpAF88g-93yWA4Zk
Message-ID: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Simon Glass <sjg@chromium.org>
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
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 23, 2026 at 5:26=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > 1. It uses a checked-in .its script to associate metadata with each
> >    board's devicetree. Other tools can parse this metadata in order to
> >    craft a package that the Pixel bootloader can understand.
>
> One thing I'd like to check before this goes further. In lga.its the
> metadata is a string packed into the configuration description
> (board_id=3D...,board_rev=3D...,soc_id=3D...,soc_rev=3D...). The FIT spec
> treats 'description' as human-readable text, so this turns a
> free-form, undocumented string into an ABI that bootloaders and
> packaging tools must parse. I'd much prefer proper properties in the
> configuration node, defined in the FIT spec [1], so that every tool
> can rely on the same names and types. I'm happy to help get that into
> the spec. What do you think?

Putting the metadata in the configuration's `description` property came
out of discussions with Michal Simek at LPC 2026 (where Xilinx/AMD
already uses configuration descriptions for similar board matching).

You can actually find one of Michal's files here in U-Boot:
* arch/arm/dts/zynqmp-binman-som.dts

Then parsing happens in:
* board/xilinx/common/board.c

I honestly still think this information would be better to live
directly in a board's devicetree itself and then extracted to put
in the FIT, but I've decided that fight is lost. Honestly, the
allure of using `description` for me was that, since it as
free-form / non-standardized, my hope was that nobody would really
care what I put there.

If you want to help get something more structured into the spec
then I'd be happy to use that instead. It's my opinion, though,
that the metadata that we need will be different depending on
the loader. For instance, on Pixel phones the loader has this
information to help pick devicetrees:
* board ID (number)
* board rev (number)
* SoC ID (number)
* SoC rev (number)

On trogdor Chromebooks, the bootloader instead had this information
to help pick a device tree:
* Board name (string)
* Board revision (numbrer)
* SKU ID (number, though actually made up of a number of bitfields)

Michal's loader obviously has a whole different set of information
that it uses to figure out which configuration to pick.

The proposal I've tried to push a few times is that it's OK that
different loaders have different types of information available
to them, but people don't like that. They want a universal standard,
which nobody can come up with. Thus we end up with no solution and
everyone does something different / downstream...

In any case, assuming we keep this as 'description', I'll document
the exact format in v2.


> > How does this series help us?
>
> The FIT_ITS path is a second way to build image.fit alongside
> make_fit.py, and much of it repeats what make_fit.py already does: it
> puts the root compatible from each DTB into the configuration and
> compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> hand-written .its file, and the .its files repeat the DTB lists from
> the Makefiles.
>
> Have you thought about extending make_fit.py to take the per-board
> metadata (e.g. from a small file next to the DTs, or via
> FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> logic, and trogdor would come almost for free.

I certainly can do that if that's what people want. ...and, yes, I
think it would simplify some stuff in this patch series. The
question is: what does it look like? Is it a file that is a list
of devicetrees along with descriptions? The list of devicetrees
would be to limit which devicetrees are built into the FIT
and then each would have a description. ...and yes, that would mean
it would need to be updated in parallel with the Makefile, but I
don't see a significantly better way to do it. Yeah, I guess that
could work OK.

If so, I think a bunch of the patches in this series will be
dropped or look very different. I probably won't directly reply
to your comments on patch 2, 4, 6, and 7 if we go this way.

Should I give it a shot for v2?


> The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
> documented anywhere, including the image.fit entry in the arm64 'make
> help' output. Please can you add something, perhaps alongside wherever
> FIT_DECOMPOSE_DTBS ends up being described.

Sure, I will make sure that any newly-introduced variables are
documented in v2.
