Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364628;
	b=eS7YYjmBJoEfm8ZwgRx8g2WLNSGEHRau1Ieke3DrEAWGBapO/rD3IqXY9AXIiEzjRbO4
	 4aZRVdL2sCo0do6nSHZFVGIRNjtxWp7ggUW+aFyIbBspU/kZczjF3HS3CPdwGqfjQffTm
	 SPOE/ud7m1Ri0JKsun1T7er61RtCaZtvLF47QUBQTfcmRd+8xroPc6OI9RHWNCEuWPT7X
	 eK1/n4Gt34ztVLYCyA6D4cRUuUx7Vgif5CLipkY90uXPLEW/vn1k7nVLrm4FFcmkoaOhC
	 0V7t04USxyDisPmo6tmL+5ijBnemBL7aBs6xq0pB9u4jD6GhC7x1qNtiR62OqTHbQpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MWgaFQdz84PZ77In42V5nEZI1f8wkYnG4LxFEebl6QI=;
	b=dglYmxxqKfyBH1mJEG9iHPmhJDe5StSgKfs1WJMiB0BB0XrRRiFIPyxyYoGxn5mssGfl
	 bTac1iFLLpynmw3j+sySnIVix5LPPfK6yubf5bgQrUXW4XSt0VUGzyCByw4yOHj+12WkE
	 qQ5hwWZ2et+6/GrCCS8g9cNW+z8fUZ6CVivxIe8gGjVV8qTEA7vjGyroeCKVacjJVTtFx
	 FOSt8mQbJTAIVGMC+I8m5O/YfFPKsgjX29CO5RD6SvHlpVHtkt8bmcXN/ILD4jN4pDi4V
	 UCZbAGIhVPQV0qGn71yqTvT/DLYbCtfgfztGxgKXk1oYp9wB0k+b+s45twsh4IgiUZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y6yM4Ygh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA851606A333
	for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA851606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y6yM4Ygh
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso838522a12.3
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364626; cv=none;
        d=google.com; s=arc-20260327;
        b=iUqcIg9xxwIvUfyWPF+lY1ODyWKqFy0eEprzq2wJCOM/6I6SnT0CCe7/9il6wuxUp8
         LyXmq0HKAC58PsdDrqQaQwrw5SHRzRGu1ZIn10rOrYSqra8atGxHUI2+A4IPzNOw7DvA
         ojvfPt+6SnIc7XSBRQEOYBsmBUEcRJxKI1m00xJcEP2TnVPKTB181YoDIu5bklchSgxm
         6DsEYW8XJ5Y3e+/G8LZ5OsywQpBnKF6KuveusuvAFLgXgUr3QqpVTwSHhNlSHhyO1s8r
         CgLIUw/RrYq0k81Z7KtbXB4w+OoiIRsqMQ/SwppJnmlZxilHBuBq9trB2O4nVhYxXIiF
         TI9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=MWgaFQdz84PZ77In42V5nEZI1f8wkYnG4LxFEebl6QI=;
        fh=FtHsFH/pWV7Llqz70OmpF5t23H6FF+YiDCIwJBNw4Dk=;
        b=K4g2DYZmzXdwhdO5KgHZeqzVsiK0nxCaMuMLiAle5DgCGKaKvRiVpLZ+M11IFStBta
         yPnB1o2/5iwX4ljJvFyHpKZYv4v5eGkywT8nVb+PJp1Kp5ujM6M9N7p+3DRHQ6U/qFw7
         5ng/VFUKgpelHhsaIt0T/1OXGZsHyMeckuzg0ZMNlaFJXWkrCjU27xkFjI4W6za2xuN2
         lQ/j8zp+ON7LBx5U7ssRdxVf0eNv4aWx/Vqevded93yiGPaFSlHVqyIgnvQE04XEq3On
         mUUzXUROksbvUk+cLgxVupDsaCz7iReKymZZmnNC0kj1VdWC8VYJzdI09OB6EnCVMWJf
         caMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364626; x=1793969426; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MWgaFQdz84PZ77In42V5nEZI1f8wkYnG4LxFEebl6QI=;
        b=Y6yM4Ygh95EQyk7nS0DTpUwb4geT2z/o4OpZRImZB1ihU07qct1QP7RIZt/KzB2+lc
         PfU0ZeJULUrrU6qgoOqVglqXZYmvOtWZqUPWiwYXjPyeaJRZLs+ZCKdnun/XZ/D3Ey+q
         qET3qyABbYLuIr0PkeCYAzixw2sJPZ68ETzL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364626; x=1793969426;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MWgaFQdz84PZ77In42V5nEZI1f8wkYnG4LxFEebl6QI=;
        b=SpBzdLRur7LOU5GbpDm/bF65fCPstUt2qNKOapueHtgWukc+EGt5vAIpen/L+BJW4N
         CfVMT/6+jOSMkeM43c1HRKNG0NipN6R0Vy3Ux87Vg97p/DlhZxaKz14TB4ryPdPdGrMA
         uOLV/jeubxJBGSvpwen1pE/Z+Ssx0IqU98/y5Nl+0GRNpe4rukCu82k9+eA5RFTHFFWV
         +3bjT53dkk7oBNR8Rh7XMc42/uOr1qumJ1D9Fzo6ZDF9UnHn1geL8h8WZ7O2I9dklPbA
         a5PRKYbzneP7CovlWAMoJu3gmVM//UI3l4sLcAOuVpX8M8mNEQZptSe1EtcR2D0Cv/9H
         41Ig==
X-Forwarded-Encrypted: i=1; AKwUvByDlGWq1Bf5ygdqHWogN3/RpcPK+mcMZHEP9Ym9ETBcnY1MEMNdrQobqjlyAwvm1VBXrAmY6ZBMSibX@vger.kernel.org
X-Gm-Message-State: AFq9FYLP/za9Yw/P3wRi3LLy7YDZZ2PoKfFzrDCodY8YgwFIqJGK2j49
	5YBoM26fQIrOKc3JteEOvztGCYH5HtKWzK2t1Br+bu5h+vUt7ArpaY614raonlKqbZ2MWERVRrJ
	cJPSCLUwdjPC1n+MTmqKrWunG3dg3Kfu0QI7LV9p4
X-Gm-Gg: AYBFou2gQ74FJCBKfRc6FC0NHCgaesLSuESGt8uHU/4PkJ5+TPhK7izR/lrff4asn6a
	+DatNxbTBVbwBqXdu2+Gp7WJjn2ZZCwb22XcmF121/HAKbaZu05I3P4tSBrYdXLNIGhT+WUC0u3
	aFtDvOOXd/z1cJxcRWRkSN7knLjA+v8UtARKs3CWA78RE9k3w58UOr1WKf79F5cJLmfa65IloHp
	ZPrNrft3XTeCVd9qo/vk+S4dKE7v6uZkpTxYRUQe9IthoWVt9RRt+cqKyeEI69qeEELrufZHMSr
	wUZ4KasFgAc2UBolv15JKAaybyCL1HZVp3jNm+g/riZo9AqHpulnmRcdbG0efBDhvvcXd1SPCcK
	irvxOp3pKvTyoOl2QjkiWVuOTbBCxcAwSJmeyX9Owo1lnZZO3qNdvnSLXyXY8G7pnxA3ezjw=
X-Received: by 2002:a17:906:9fd0:b0:c46:74f6:e149 with SMTP id
 a640c23a62f3a-c4ca7a54f72mr199779866b.16.1793364626163; Fri, 30 Oct 2026
 05:50:26 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:23 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:42:20 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-6-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-6-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:23 -0700
X-Gm-Features: AclHuK-zd-T9RiVPbSUhy4wWMPK5g5MD6u57BPXZqy6Kk8GLjau3Um9JLEY-wic
Message-ID: <CAFLszTjbOnchP71O98H9zTMiPar33Fpxj47uhdTLY_dCegEpmw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment path
 helpers for reuse
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> libfdt: overlay: Prepare fixup and fragment path helpers for reuse
>
> Clean up `overlay_parse_fixup_entry()` and generalize
> `overlay_split_fragment_path()` in `libfdt/fdt_overlay.c` so both can be
> reused when updating `/__local_fixups__`:
>
> - Change `poffset` from `int` to `uint32_t` in
>   `overlay_fixup_one_phandle()`, `overlay_parse_fixup_entry()`, and
>   `overlay_fixup_phandle()`, and parse into `unsigned long` before
>   validating the range.
> - Require `*(sep + 1)` to be an ASCII digit (`'0'..'9'`) and bound
>   `poffset` to `INT32_MAX - sizeof(uint32_t)` so negative strings (such
>   as `"-4"`), leading whitespace, or large values cannot silently
>   truncate or wrap around in `fdt_setprop_inplace_namelen_partial()`.

This is more than a clean-up: it fixes an existing out-of-bounds write
in fdt_overlay_apply(). With a /__fixups__ entry like
'/fragment@0/__overlay__/node:prop:-4', strtoul() gives -4 as an int,
which reaches fdt_setprop_inplace_namelen_partial() as idx =
0xfffffffc. Then 'len + idx' wraps to 0, the 'proplen < len + idx'
check passes and memcpy() writes 4 bytes before the property value. On
64-bit, '4294967292' does the same. Overlays may well be untrusted, so
please can you split this into its own patch at the start of the
series, with a commit message that starts with the problem so it
doesn't get lost under 'Prepare ... for reuse'?

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -398,15 +398,17 @@ static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
> +	if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
> +		return -FDT_ERR_BADOVERLAY;
>  	poffset = strtoul(sep + 1, &endptr, 10);
> -	if ((*endptr != '\0') || (endptr <= (sep + 1)))
> +	if ((*endptr != '\0') || (poffset > (INT32_MAX - sizeof(uint32_t))))
>  		return -FDT_ERR_BADOVERLAY;

The real cause is the wrapping check in
fdt_setprop_inplace_namelen_partial(). That function is public, so any
caller passing a large idx hits the same overflow. I suggest fixing it
there with something like:

    if (idx > (unsigned)proplen || (unsigned)len > (unsigned)proplen - idx)
        return -FDT_ERR_NOSPACE;

and keeping the digit check here so that '+4' and ' 4' are still
rejected. The INT32_MAX bound then becomes an early rejection rather
than what keeps memory safe. What do you think?

A test in tests/ checking that fdt_overlay_apply() returns
-FDT_ERR_BADOVERLAY for an overlay with a negative or oversized fixup
offset would also be good.

> - Drop the redundant `*sep != ':'` checks after `memchr(..., ':', ...)`.
> - Generalize `overlay_split_fragment_path()` to accept a length-bounded
>   `path` slice that is not necessarily NUL-terminated (using `memchr()`
>   instead of `strchr()`, and keeping the NUL-terminated property check
>   in `overlay_symbol_update()`) so it can also split `:`-delimited paths
>   from `/__fixups__`.
> [...]
>
>  libfdt/fdt_overlay.c | 46 ++++++++++++++++++++++----------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)

Regards,
Simon
