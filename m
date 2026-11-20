Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215885;
	b=ZrgGd7AGQi0aWuQoDJ3TJ34CeZsFdKCmvLahI+E2XQ21b2l2XyDtA9ZUh4vGzxoqshjq
	 K2ib9R8tWAf20tRIQGy7XTbz8rTIFhjlk/jxOvhpb+VIvf96iHa/iW/9Rz2ZoXGEYx58a
	 W9mETIv/RUeqk4qGBg92vBs61iWh7trZWvmpK1T7Vlt4DHqz2x0/f85KZP+aB7qI3HRf4
	 QU1j0u5VB1lPqg4AhvETXWdWYSl2rrAiwcq6TJ3rbVdOrpnpmcIShNaGiRPNpA7UK6plZ
	 QC2ZLGNwwgfxu49uUHk+RH4RMuehnfK/dM680eZyZ28YCJZLyFrb4HasQyMgaZJYOhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Fwdc+YW/XiGo0Denx5Zmu82rn+nvG4NZ73DkXRr2reM=;
	b=1JVXUWUEgngqfs0hXQ4aNAtaOKQ8NFjvjon7W24W1y8iBK/Q3EBns3aMwLfIJtn5ABpl
	 xKBIPtVW5hv1dkfw7JyoNERfXVN5RcAR95B/o5itw/Pjq23GBAy+vtRTgKk6M4Hnez2vF
	 W/PfviIsmV8nD+lW9BmnDAxeB+B/oyO8m+TqxE0rySLwGkxo38AprgnaIGKCco8Ly3DVR
	 HBSIRl3E3OI0laMIy/cH0eby3hn8z/ZcXR3K0tgrWaGdA2tLWmqB1YLMr7RBDjkjGyzBs
	 J4CRkeXTUK5CHec/W7klLwqphqmJ6qP56T0mqmxiNFHVGk8lRo1c3uBroBPqj0Ne8+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dXFqTyBG;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40751606A698
	for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 23:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40751606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dXFqTyBG
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso312832066b.0
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795215884; x=1795820684; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fwdc+YW/XiGo0Denx5Zmu82rn+nvG4NZ73DkXRr2reM=;
        b=dXFqTyBGKiT2jQkkVsep+aURdPf9hra5cXJYyAst7bF83HksS/coFTJsqgqLlpQEVV
         LFLj06o2ua6ST/pqEqAhZvAydnVZQcFa9qw/1NcvQ8xrrYCgwN4XG3242ZeF93c8ji/v
         twUaIJ5xtJlj6rRmDit5xR/5JYIlBcZovZGfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215884; x=1795820684;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fwdc+YW/XiGo0Denx5Zmu82rn+nvG4NZ73DkXRr2reM=;
        b=mzszvuyZI1aTJOTKitZAP0IICBRlP3Qc2YuT7pWBkh1a0ezlQKm0wr6c1KXWeweEll
         Hn8dIoGDbbMwvfPo0BQcJ/Aj+sn45kKZg9R+iOZE2k67jvIwjHwlPgwkAh1o92Guves1
         oA83jvS99ZbCQpO2pAN1BPicxK3r7CgUMAs5VNSZwpX4nscGWwc/kFUeEzVBRQvopv0m
         z5OyhqLZyFPBofuW+Wrf97ioGOU5Rf6mqDFhjn+wE+KNepkdc3axNc4K6E/a/znCN+to
         Wj7p/RYWVmd6GgvaPbl5Y4cPzugQzMJPlba1ddPMQQxsH/95WBM57FHEj5/9ckeJYYV+
         O3CA==
X-Forwarded-Encrypted: i=1; AL+hErGQ4Hm3njiHIkDUV6XOI2TL9a8HDJzEaf7JEsl0phTWaY5j9lXF+mbFvS8UwPa75FHtL+FnwI5MerNz@vger.kernel.org
X-Gm-Message-State: APuU4Z+FyOs6WGXqO9gKUb/gc+UFAqvRouHvpeu3fSJSmtgZwyYmtesn
	KVqivt2oCQ/8FqmSLUOVgV9zFTfsJ+0r9s0iHCTxmFcC/p+glO2KcU3n5+Ow4MrpX7i3eaETbI+
	v5qEsl8jI
X-Gm-Gg: AYBFou3q7LCW6kqMRKKNfnwUIYDK3oVnjHr7FcyrZdfTnqHOtXIqGTi10j9Cs7M/8h6
	qrFbiHYxF7bNyrQM0CRVtbcJoK8GEaT6bfKKlLxz5Fp+Ym35hFoRJYnxo3A7bWA2tyJ47kITwyt
	0fgsZoU9Oii9tHOFGXXZ4kI16F4rE3CJFlkL6JrQk8rzbGBkpUw0VJHPD2A9ncJUEqfgSdnw+VM
	aXNHsWNEd3AxdhcwP9MGKgPYB0SwRM768Ya5+tzUHmsY84xt1GS/8OrZUuVtiJSiZfW4IoJdZxE
	QjJFYy3FY16PxwL9q5GSNWbHBgRI1GYRslEmh+jVZHgwtU0vlenc9b2RYsoBXsQrIeK7k5LTbH4
	9QnsyBprBaahmKsqmW3xESgigJPluxs20qYQvagznVf2vjlG6pBzdVbqONu5Ii2lzhiEknJZkUn
	kWz4DNl8j1yvYsPz8dKMyt7hwjmL5jKCpDRHXrteLS3/dKsHg7/xJi4a/MB++eqJTm4HymGrcBg
	r/fn7DQAc4nPgi9fonGJm+LpXeOyJy+E/tLBKx8yVM0b2EVEIbPp7cwaEYtdCmmuY5xHaX+P6Ys
	BTBxvsFhx8jjErUrQCEVi/DEYrYgfF/Po+1CBneuMp7BNtmwXY7Ok+/smbemEGluwhGisA==
X-Received: by 2002:a17:907:ec09:b0:c2d:c6e7:9e9a with SMTP id a640c23a62f3a-c513a816ce5mr441488966b.11.1795215883577;
        Fri, 20 Nov 2026 15:04:43 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm136072566b.32.2026.11.20.15.04.42
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:04:42 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49d64a88222so1642924f8f.1
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:04:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF4gQoz4pmA1vpvndQgHW2v/ePoB7HW8Hxgz+ChVW6Y+cKgATNui/+cYNPwJoWZxlghMkv1WFTS/Ceb@vger.kernel.org
X-Received: by 2002:a05:6000:2c05:b0:48e:6651:5956 with SMTP id
 ffacd0b85a97d-4aa488c85eamr14307450f8f.0.1795215881201; Fri, 20 Nov 2026
 15:04:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113210918.356261-1-dianders@chromium.org>
 <20261113130858.RFC.v2.3.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid> <sashiko-outbox-215034@kernel.org>
In-Reply-To: <sashiko-outbox-215034@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 15:04:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VqHE5PjK1vFbv73G1UaN_BwxvRJjUJbHVB=9wL_h9PDg@mail.gmail.com>
X-Gm-Features: Aa3M54qr05eSVV9PwOwJNdqAzu1uH37TTf3Dyh-iO_tgJlOvdvevguI12yuhb0E
Message-ID: <CAD=FV=VqHE5PjK1vFbv73G1UaN_BwxvRJjUJbHVB=9wL_h9PDg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] kbuild: fit: Add opt-in FIT_FACTOR_DTBS
 support using fdtfactor
To: sashiko-reviews@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Julius Werner <jwerner@chromium.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-kbuild@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Nicolas Schier <nsc@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Manuel Ebner <manuelebnerli@mailbox.org>, Marco Elver <elver@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, Rong Xu <xur@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 14, 2026 at 1:09 PM <sashiko-bot@kernel.org> wrote:
>
> [Severity: Medium]
> As reported by Simon Glass on RFC [1], can composite DTBs built via
> cmd_fdtoverlay reach fdtfactor with incomplete /__local_fixups__ when
> FIT_FACTOR_DTBS=1 is used without FIT_DECOMPOSE_DTBS=1?
>
> Although DTC_FLAGS passes -@ -L to dtc for the base .dtb and .dtbo inputs,
> fdt_overlay_apply() in the in-tree scripts/dtc/libfdt/fdt_overlay.c merges
> __overlay__ and __symbols__ into the target DTB without merging the
> overlay's /__local_fixups__.  When FIT_DECOMPOSE_DTBS is not set,
> make_fit.py packs those composite .dtb blobs into image.fit, leaving
> fdtfactor without local fixup entries for phandle properties originating
> from the overlays.
>
> Until in-tree libfdt preserves overlay /__local_fixups__, should
> FIT_FACTOR_DTBS imply --decompose-dtbs (or reject composite DTBs when
> FIT_DECOMPOSE_DTBS is not enabled)?
>
> [1] https://lore.kernel.org/r/CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com

Rather than trying to handle older in-tree `libfdt`/`fdtoverlay` (and we
wouldn't want `FIT_FACTOR_DTBS` to imply `--decompose-dtbs`, both
because single-base composite DTB families would leave fewer than two
non-overlay `flat_dt` nodes for `fdtfactor` to factor and because
bootloaders like Pixel 10's expect a single base `.dtb` plus a single
per-board `.dtbo`), this series will remain RFC until the `fdtfactor` /
`fdtoverlay` `/__local_fixups__` changes land in upstream `dtc`. Once
they land, the first patch in the non-RFC series will update
`scripts/dtc/` so in-tree `fdtoverlay` preserves `/__local_fixups__`
directly.

I had only mentioned that in the notes below `---` on patch 3/5 rather
than in the cover letter; I've updated the cover letter as well so that
plan is explicit if another RFC goes out before the `dtc` changes land.

-Doug
