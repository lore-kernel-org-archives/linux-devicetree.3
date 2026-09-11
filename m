Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2FA44604E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113123; cv=none; b=AaoO2is37FiSWoKIChxGqpqIOfat43s9sHXTEBO2bhhbvhmKhh263vgsqefOXmiLtGXGeULVfLqfuLqUfmrvLPtRhqUd5lI3yUxnYCFWk+1HdBQ2weVGEbqQzs2lKagPfga036kzKdYYyayxoE3HFD8X6KdYG8PWiIiSgOPiOZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113123; c=relaxed/simple;
	bh=sIfYuQRbITcqYg8S5QoIxQuTw8bHmv1mR3yE9m3s/Q0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdFtJ5Si73a/YDomXxcAxi5IUEbZ05h7kp0TiCjqyKtv9IiPxVTXbwlx69rDAMqvacRLzK8KiRLmUqvoRPavRvz+zQJeOZ+FbcrqvHGFCNK7lVaUlLb+5lf8jNvd484xrSE3NMkvMd2jLFIDKIB1sVCDherseYRIu0hnJ4CHcG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwsXAy2U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwsXAy2U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47B71F00893
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789113121;
	bh=sIfYuQRbITcqYg8S5QoIxQuTw8bHmv1mR3yE9m3s/Q0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=IwsXAy2Ur0uKy7WQ4K62hVZFtArfAgTMTpNXG+ig+hErh+Yemejj5RQj1cPm/sewt
	 F+e0buA0zzuUHWH8+8xyca67th9ubCuCug94Ixr+/ELD9H9O5UxJx59WSGfSN/OmOv
	 HK090wdwIlneRHz0S3OEVg85XUY2L3XjS1fMoKjbswAS7Zy2bpnFQjjiTkuisMhrIm
	 9U22SRCtXoUH6ByZ9oTRFqp1wERwLePeE7Mcr1gzC4+LCaJMJ3GIuYPAZ6Zm8tQ3ux
	 xuu6LFZUT8wB/Jnx7/46HbeVnKRaT0cYgwP2M5002/9OvjKw59uvGHGsgfjJsEt2sQ
	 8nn74PWcQKDnQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b81a2d33f7so693874e87.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 00:52:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycf5J03GVnBoItnJFvQTDqlr5yx6M+lc+4gGdyO6JT8E/fdfyvqMDKlVBhkWrStS5Y5GY03lcrXZPF@vger.kernel.org
X-Gm-Message-State: AFuF++mUBbAzefiGDikfl2zrTs9JSj965MnWFQV0WUGHiOf4uZyAoz5/
	gfYt2MVCHTepeGEvi84SFlc1+8i0wLU5RagpWknxr+1eWlWAmnObavik+0zqGGr46yPzJp57RsS
	Di6QfWdH7GMPAxni1hJCJPLx0BDAXsOWa8M3sZjJKww==
X-Received: by 2002:a05:6512:b83:b0:5b6:1a7c:59db with SMTP id
 2adb3069b0e04-5b8a0310b1fmr656473e87.53.1789113120636; Fri, 11 Sep 2026
 00:52:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:51:58 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:51:58 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-3-17ac82dbe226@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com> <20260910-fw-devlink-nexus-ready-v2-3-17ac82dbe226@toradex.com>
Date: Fri, 11 Sep 2026 00:51:58 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeSJ17QNZv2a+SGLmkArfkDfJ+LA63RzkyR+NwEYQ9gew@mail.gmail.com>
X-Gm-Features: AcwNN1UyqJBiFNt7-qUOGGcLehzd1eL0p4Al7jFGd5C7-EaGiR5r0kJ7dxhhmpE
Message-ID: <CAMRc=MeSJ17QNZv2a+SGLmkArfkDfJ+LA63RzkyR+NwEYQ9gew@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] of: unittest: Test fw_devlink with GPIO nexus maps
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li <Frank.li@oss.nxp.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Leonardo Costa <leonardo.costa@toradex.com>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sep 2026 16:16:44 +0200, Ernest Van Hoecke
<ernestvanhoecke@gmail.com> said:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Add OF unit tests that call the fw_devlink add_links operation for GPIOs
> routed through nexus maps. Verify that each mapped consumer has exactly
> one link to the final GPIO provider rather than to the nexus.
>
> Also cover direct references and all GPIO property spellings recognized
> by fw_devlink, including the deprecated singular and unprefixed forms.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
