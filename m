Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793566500;
	b=fA/YXkMJExYwX4VtLSouoadGP+TYdbchwaZff7/P8gS4U9+14Di+AileS6y6rDxmxxyl
	 g4TYQi0ILEGsjtk0Jk1XL1yRKOcOLnr6FZcY6VsAuYGiRclz7dvywJcSkOIN/VYCcAvb3
	 1tRuyUqYsrXOFKUMW8Ll7Cahm7t2PsBy1Yo5NG/rZKKenkVfILnj18/XtvIiyq432ZjGg
	 4ss/91ltcT/HhsP2eRgwo6q4pq0W1BS0QhD9SW8ZseVfG92nGLoJb5sLqBJETp34Y6F07
	 J6n9ZO7vh6Ot12if7v3kSKvVnX9I9cflOVkGiTlpIMxWq9dTXREL0jNLC40+sutyDrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793566500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:from:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
	b=MnSqsyokQ+niTDpknTv8RmUc4d7M/K0UWRksUwJgVX0X1eigEk4Y5/l86i1VtYxNxd2V
	 qdmvnDVKcs4SABg0E5cCGTzPPgzkIqbu9WLs/5hH1uN6VjMenB1AwnXJwWhmFCTiBJD7W
	 dZIwvZzUWWE0VcfWQ/r5xF8iMs2xwrGkjMPynM28+fX/yG4UKugiN0isHXzIsUDCbJKpb
	 pwx1d6gcFxwZoXjJxAjgbJFTLIxvPGUUNeTZ+01f7PTkRlYN9xtFIErTOYc4TDRQ70ixJ
	 eqzAM/EJcrBLoKZ81k3dtZHKhWXA48JX1svS07KZ5fE8JgPwWOB7n8oUJUEtpaGaHjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OxB94iZp;
	arc=fail smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA48606A329
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 20:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA48606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OxB94iZp
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so3299159a12.3
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 12:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793566499; cv=none;
        d=google.com; s=arc-20260327;
        b=G+Ht7LytMqyNXgY0PO6gkf0vRBFab8WYlIHN41acxB30tnu4dXi8NS00muUHuZyM0I
         8d8XPpNy6ogRl2h16s9caj5G+mNxSrGMLIOqK2SaMy270gRVkn1COQYnkB0/MIggIKqr
         bHzEJWlO1n9GNdfrNh1LA7FvakdZEiiHy7FTA/rbqkFraz9611I8jUwHSDodBfUw3BU8
         WN8nTj45AGe8nkegdYXtjH4rT0I9Op6pH3oQHQpaRno8eZr818Ck8QLAH8xJNOzgaGp6
         IU/v+NvLwDnQfJPUXvVdfERm9SdjMKhWDNmBIT+Svk8ac9+b1bkh5l00fAeeTaVhwDQx
         SzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        fh=tXYJBFCcLiO1e83yR8hds30oWuNKcWGqRaQuLTbkeB4=;
        b=HZSSWlFXgWpcxcC9+VAnquvWyARZm6qMBbZLeTHNZN6A1YV/AauBWXXSH/wT4d4ykj
         vqVCHfamdnVKY5pORuF9DQJzcwzMiIrpA4ziEv2Lsk0JGSSsjvOzmA8xdRi4WnMs2c6g
         CXCPrP9zmlIbkgLyg1crE82VZ/TcdsAiowj1FmakH758jdS0xhev6VuNK+welt4md82u
         7TKPfj3+MOhVsOPVDAtey4h0XwFJkvopRkE7pa8IcdlEv240Vph6Rj8MWl6FrnV6I5nU
         AzlyBSyD5Yiuz2bI34X2WzFzGucAa1XIyg4GpkZ4lYH1KtX9kJ5xVRTekjJ6M68T00oT
         hq/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793566499; x=1794171299; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        b=OxB94iZp8kdfd8GGKl7b92g3lomCornpCWOX5vG+FCefMPIoOtL/O2J/UfZYK5YxrF
         Ivv6cnQUQcyQUIfr8TQDTGMme9b8bQMpK5Q4EOvhLX6eZsOHWv2ctm3ukB5MBhYYPoY5
         4u3OOXQt4eXFHxmaIMUeQ0mJTZaMyYE/c/7qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793566499; x=1794171299;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        b=U9dLyc8uGEf28Lu2i5L8gyx1dcVTf+IBIC9rqEBXoI5/x1WwEFt8Rxdae2e/DCa5+l
         /BW+A3VFeIoaj8PGc4JhQE3/iwss0GhNUEmmOLAJMlzaESon4X7Qfwq0nmL/yoakcU0k
         HNN2Ky6qMCpvaWH2MIlMN8eCk0Jh5qyDuKKaAXrr0qu9pbXZQHw2QjbTvtwmZbbtpok8
         IQoqDTkTZcPllKWFUoCUJmvJMbMX/ZQVTaSLpVEDJx2Q87qq+PxO9i+2/Oo/QPtMGefJ
         q/aGVK8AUOWd5V3AL5Qi1w47xddRq2O9tyOLluifDl1cXFTd8wYGfqa4TFRcYnTAeqNL
         Ct3g==
X-Forwarded-Encrypted: i=1; AKwUvBx6uxSOKppiVT3Z42FUgFV1LD7xl/7AVPwHN0TCanqcNJNPelTCprCM3Vg+ufsLg2Ld14JxGaSsM2mF@vger.kernel.org
X-Gm-Message-State: APuU4Z+k4iFVLFsCtTMmtCuLE/fvq07h0/0JNtcNuhyYZ+tt9Kd7aGuN
	AYe1BE0L8wLFmYwQV1NsG8J3CJmBFVypFyeaCqF+qfLLqYcstkkdis8Gpq8qaIvPnMdyIS8Bv2o
	a1SQoFDVKtWprRjUfMRXywjo9gGMXj7jzVoaYFFe0
X-Gm-Gg: AYBFou3Z5p2zKKozgv0kqXfS/dKOgNIWRS6tyua2Vk9/j41yt5/kYX7BWcgnsREO/7H
	9zxNqMh079MzNcudXw9eyWVBcqvn4U0afxzMtDREZAt+43vKKKZ8BsGQy8b51zLmMc3GEoIjgYf
	dET36F+2ndie+9/3B7qg9tRRnUfuOvXx3T1OEVqEuDZeKxIgal+LwKNdXETSS2n2sZPmetE+csw
	nsFv5wd+2/W8H8xVaNASR+CiG6A0j29rc/0YMMfytxbqWMLciQspHYWcMu4/tCZThc6GAzPStjw
	XLOKIZyRmanLQ7YPZTALQo3rch7bRWX/FhNN4x84m8zY7CzohjAK5gzO4MIhncQOFCGwNJFYz7C
	MaB/M0uA0RX4rabr8bPpRrntjyfsSA9fCyDid+t9AF/drdlU6hTcYZuJ3ExpU7u/SOvms3a4=
X-Received: by 2002:aa7:c1cc:0:b0:6b1:bb19:deb3 with SMTP id
 4fb4d7f45d1cf-6b4d4d6f96amr4159175a12.25.1793566498639; Sun, 01 Nov 2026
 12:54:58 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 12:54:57 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 12:54:24 -0800
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
In-Reply-To: <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com> <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
Date: Sun, 1 Nov 2026 12:54:57 -0800
X-Gm-Features: AclHuK_IoQTHoKBTaMx-KZNiIPIi7_TIlou2gkeHseuy-klQIv193ZXwZZvOcw4
Message-ID: <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
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
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:
> I think that was in the the "after the cut" part, where I said:
>
> You can see the fdtfactor post at:
>  http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

OK, that covers where the tool comes from, and the question goes away
once fdtfactor is imported. Text below the cut doesn't reach the git
log, though, so a sentence or two in the commit message on why this is
wanted would still help.

> The goal was to make sure that we could fully reconstruct
> __local_fixups__ after applying the overlay to the base. v2 of the
> fdtfactor series handled this more properly, and I'm planning to see
> this through and land it unless there are major objections.
>
> By default here, I'm running fdtfactor with "-S" to strip the
> __local_fixups__ out with the assumption that today people don't
> really need them. However, someone could easily override that locally.
>
> I'm a little unclear how things would silently produce a bad overlay, though.

Sorry, I should have been clearer. This is about overlays which kbuild
applies at build time, not runtime ones like Beaglebone capes. An
entry such as:

    lemans-evk-camera-dtbs := lemans-evk.dtb lemans-evk-camera.dtbo

is merged by fdtoverlay into a plain lemans-evk-camera.dtb, which the
make_fit.py path then puts in the FIT like any other DTB. There are
several hundred of these on arm64.

My concern is the input to fdtfactor, not its output. In the in-tree
libfdt, fdt_overlay_apply() uses the .dtbo's __local_fixups__ and
__fixups__ to resolve its phandles, then overlay_merge() copies only
the __overlay__ contents into the base. Only __symbols__ is merged, so
the __local_fixups__ in lemans-evk-camera.dtb cover just the
lemans-evk.dtb part. Cells from the .dtso such as:

    avdd-supply = <&vreg_cam1_1p8>;
    remote-endpoint = <&imx577_ep1>;

end up as plain numbers, with nothing marking them as phandles. If
fdtfactor needs to renumber them, or puts those nodes in a per-board
overlay, it cannot tell they are phandles, so the overlay applies
cleanly but the links are wrong. Stripping the fixups from the output
with -S doesn't change that, since the information is already gone
from the input.

Does v2 make fdt_overlay_apply() keep the overlay's __local_fixups__?
If so, composite DTBs would be fine once that is synced into
scripts/dtc, and my concern goes away. If not, one option is for
FIT_FACTOR_DTBS to imply FIT_DECOMPOSE_DTBS, so that make_fit.py puts
the original .dtb and .dtbo files in the FIT separately and the .dtbo
keeps its own fixups. Leaving composite DTBs out would be a simpler
fallback. What do you think?

Regards,
Simon
