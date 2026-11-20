Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197525;
	b=5CS60uOWZGtTDGjuJD3ooYKX5bbEs/C3Kf51IVFvmSgRtj7pT4rpJZlvY6hp0KeEdtLx
	 fceydWjaeePMVlpnreTwbGgVwAH6mJ63LT5BTh2pL35s7a63S1vn43FJey3Y0dNXph/xl
	 r5NcJ6fGF1dtAF2+faU22NKZpoIuZXS0QPzFVLxEd4v4Jc4ezsJbvYmK0KDiKtseLi7mZ
	 9fhYlht6b5dNRDBgUDrUA2c8TKT7l9WvIS0U/q676PSRqFIDhGUDn622iyfo3FQknvngr
	 VK/4SuERgW2DaOP34TE+d3xhYN7Jgm+/3Rpcmn10/n3bpx0Fx3Lque0ImKWKEFbvOKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dczCRr28KD+uTEJAqXrQFrzN9Ta198+TxQkvrodr48s=;
	b=BcxzKx3oZIjMsInqwTrM0+bMUpp4qWtfWtvNfa0hpM/6fHR86AFYKqosnwfLFLhQpxP2
	 2I0CZuRaEPXFCkWmYYlHMtRRA+CrZjJxXAv3MDPoVJ5tGck8Xv+ZwoEk75qaELixBTaNJ
	 Lw8Ise7FtfDwNT6jz4dK6gzDsYFD5CJn4TxXnDwXlp5IhNstjYxGE15juSMUY0719OkBc
	 J6all5j8xdZz2C8TES6hoxs8/3DM7KWIaO91TWVCWP3syWjffS6VdlTMRlYV8minOVnHA
	 EixRKE7yoPRTKTUo3ipuTRnYRgKuANtVZg50AlFDzluV53mD6fK9g8eLKTBKHfiL0sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L+yhVlj6;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6AB606A32C
	for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6AB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=L+yhVlj6
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c511c0e2826so153729566b.0
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795197523; x=1795802323; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dczCRr28KD+uTEJAqXrQFrzN9Ta198+TxQkvrodr48s=;
        b=L+yhVlj6HvWmSk4Vgc55qk8OMS+4LLvx1Jr4dSaq1GFkWlb1cb6sGKoAa0AQ4uQw8W
         yoBX/fMp173Q33rHRJTcBYhJWwhljydu0Pho+C7OveBpZ2SC3CSSJhpCd2mQq+qCDKAv
         FxpVdKrb7SIFdYblSiBtgqfCvDP8vlwDSYjYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197523; x=1795802323;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dczCRr28KD+uTEJAqXrQFrzN9Ta198+TxQkvrodr48s=;
        b=01jP34/JSL1tt5zKXzOAbcvXDe/4EV29iFGtB601vsyDqe05P1zXh5lFI4nweIiucQ
         hydQbP+fWB8jtMFVnUwYA4MSpemY2zW9O2jYkNTjBHYUeN+Y4xLLUaIAeV2z7lf3nA2f
         OLQ9T6IQSkP7BFoJMJy6+Ku2N4UMH2rpWHiKI8qcL/im9Yr5bl2lXa3Kg9YuDEhej0yX
         vssr8sIkEHo7ILTu2MhWltbbx29r+iw6Yq6K6wngqQs1WvPpVmTw+ea59v9xbM7zapih
         7ATaoxn1ZCN9TeGKZWU8pt6vk6sidhkKI/Wcc98fiHwvJn/cKrBAI0DgvOPmFA5t7+6v
         N5kA==
X-Forwarded-Encrypted: i=1; AL+hErGbexDAvSqswijcztaIrdWHwGaWkt/YssHGLqUqmk5uTAL/hPcUpY+BEqc5Kso3z7LJBsZBGQGTJWdx@vger.kernel.org
X-Gm-Message-State: APuU4Z+21AuyQing6n051y5tk69x1sicwZRaEvjc09UrB0dR3BjDnNGH
	gZcLqUoUOR9/RD892g0186D8zDtNpeKhEWY8hQ4KcjOtik/Lq2Ui4EvnoqrnRw/aXdEYlX4dL7M
	C5KMXavM9
X-Gm-Gg: AZFdTZe5RTyhPoSz4loU667DzxFlLeQTPxonaTwhlQsHTDgDNoEGktOnA2VEZorfPIg
	waO2xRlRYvIyIFNQd/NGHHUKBj0e0A47suuoKdhX4JnL735msbxUuEhFdDNFjTgsSV0eF2wZzPX
	ZE2SSY6ja7dilbYtw9yHXM8oud4QW4GhUta+DCvDsjogSaFgFU6T52tPWPSnhgJOI64rb625syZ
	VSVhPGZYX9hoEeDbLu/YwfzFht7kHTSKfeT2DTS4aKOS1wwM/DMTklFVvWpXy1tj6F6r8mInSeP
	gXLQuX+dOJhzehBsk/7iXN4kqqC57xAIAkuC9BieVwvRi/82uYFQcA/vuZvcH5+N7NC+HzmDfI1
	6HB4RgW2g2Z48zZcCzsz4jqbtsbs74h58K4/l3YT9hCjOGTQzM5Oe98W/TgPnPdfniDi+QpYUYp
	THuZS6WV5EjbKHG+5Ov03pO6qhijOZPalEMSbk1d78YqlLJRjJy6I1VxJ4+asTsxZvi6B4cTsGn
	B7tobTq2f6WvKV37ovUe1RBpaqhtNOxZZ/mPV6VY6hNOECLsfsL233F4FcSvRGLdIrmNQOnnRle
	KEBFSe7VzywAdR+73CBO7HYDrb0CXKqCKTfTUWGNFGjsfuGeRhHaz7T1q3dIET3W6CZR
X-Received: by 2002:a17:906:3e1a:b0:c41:285a:46a9 with SMTP id a640c23a62f3a-c513ac9c0cemr312755866b.46.1795197522887;
        Fri, 20 Nov 2026 09:58:42 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm123390766b.80.2026.11.20.09.58.42
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:58:42 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1033857f8f.2
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:58:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHsN25FDKb7OWGboLP5F2JgXoyiiOS5tf3AdyUm78OH1B9R50TgY1MXxyYKFzx1fDl6SPTBNhApXNIe@vger.kernel.org
X-Received: by 2002:a05:6000:2c13:b0:4aa:874c:a1c7 with SMTP id
 ffacd0b85a97d-4abb86ed79amr7743142f8f.43.1795197035286; Fri, 20 Nov 2026
 09:50:35 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-7-dianders@chromium.org> <CAFLszTjhY-mS0yaUtV4ae4m_zTTBA5rDH4NtoU2MbEQm6WunYA@mail.gmail.com>
In-Reply-To: <CAFLszTjhY-mS0yaUtV4ae4m_zTTBA5rDH4NtoU2MbEQm6WunYA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 09:50:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UAhKxpYwyEeySOC6X_MCNh=u8eG7f3bS5mhr++Ewkr0A@mail.gmail.com>
X-Gm-Features: Aa3M54pY3fAgFZhZ3EalnJBZbaFaTtvllnxvHJmj4hAyavZ60vgvrfdEQ0Tz-zA
Message-ID: <CAD=FV=UAhKxpYwyEeySOC6X_MCNh=u8eG7f3bS5mhr++Ewkr0A@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Fri, Nov 20, 2026 at 7:22 AM Simon Glass <sjg@chromium.org> wrote:
>
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -24,6 +24,61 @@ static int fdt_property_stub(void *fdt, const char *name, const void *val,
> > +        name_obj = PyUnicode_InternFromString(pname);
> > +        if (!name_obj) {
> > +            Py_DECREF(list);
> > +            return NULL;
> > +        }
>
> Just to check, how much of the 1.8x comes from interning? My
> understanding is that interned strings are immortal in Python 3.12 (I
> am not sure about later versions), so every distinct property name
> seen in any blob stays allocated for the life of the process. If the
> gain is small, PyUnicode_FromString() would be safer.

Interning isn't where the 1.8x comes from. Switching to
`PyUnicode_FromString()` keeps the same ~1.8x speedup in
`FdtRo.properties()`. Switched to `PyUnicode_FromString()` for v5.


> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -477,10 +532,9 @@ class FdtRo(object):
> > -        poff = self.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
> > -        while poff >= 0:
> > -            yield self.get_property_by_offset(poff)
> > -            poff = self.next_property_offset(poff, quiet=QUIET_NOTFOUND)
> > +        return iter(check_err(
> > +            fdt_node_properties_stub(self._fdt, nodeoffset, Property)
> > +        ))
>
> This changes the behaviour a little, since properties() is no longer a
> generator. The FdtException is now raised by the call itself rather
> than on the first next(), and an error part-way through a node (e.g. a
> truncated blob) now produces no properties at all, where before the
> caller saw the earlier ones first.
>
> I think that is OK, but please can you mention it in the commit
> message and update the docstring, which still says 'Yields'.

Done. Updated the docstring (`Yields:` -> `Returns:` plus a note on
eager evaluation) and noted the behavior change in the commit message.


> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > @@ -270,6 +270,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
> > +        with self.assertRaises(FdtException) as e:
> > +            list(self.fdt.properties(-1))
> > +        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
>
> There is already an identical check a little further up in this file
> (just before testGetName()) and, since it wraps the call in list(), it
> passes with both the old and new code.
>
> It would be worth replacing it with a test for the new error path,
> i.e. a failure after the first property, such as a blob truncated in
> the middle of a node's properties.

Done. Replaced the duplicate check in `testPropertiesIterator` with a
test that truncates `size_dt_struct` after `/subnode@1`'s first property
and verifies `fdt_trunc.properties(node)` raises `-libfdt.TRUNCATED`
directly on the call.

-Doug
