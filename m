Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188173;
	b=EYASxBte2cqziW0+/mmGSN6nwTsJchgc6P8ZTTp46tTZyaPraVujaywcYxHw1R9fCU7a
	 /IsE0f/DI9PqQWITHl/Q8BpPjF1uHCj1om8KY1OhYLVj4xEmlx5j7WbRP1PFCMR/bErrJ
	 tQ8yE4daqLZeolArxO1JlLVZvRCQyoTSUbc1Eqsgblkz+jLhPPPvYJrJs4rEuOOOSH9Ka
	 MdlL6JPDcSjUCxmm+8bGsxvmCmtenb/C7rYIOSQEZmj22cQR+u/OS7RPIquONDkUMURZg
	 SvwLPB1YfijK0BS08WXnM6uAhIMBV+aOwp3YyMb6a68qn0W/Mnl5GhhfoUrQ5A3VJwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yLH5VmnXQCypmMYtDPpOLMEB0hSwbpVq9ORFIbZcbww=;
	b=oE9spvk9HN1ohTI1y1GwHEVoTUjr0ts/EAKpYBs3TELZIhYgHWbMog0XuNSKI40j0zqR
	 PF0MfnTw587ZDGxcPBE0HRLYSr8Zxwqrf87EL4J4cs7AfA19xHtkByE0vH6c5CirzLMlG
	 WKN2pBVIiyLAa4NR4F9W3WBJUT2blmgcdb5UyYJo7PK3qOmM0H6Vmd7R/aLXJ+wpxjgZV
	 Vt42S/RFGmC863NivQh/8fg4d1KQCIjJHZ+SFddf2VCnz6mEptNU9tYyYys/1SYn/hF3T
	 mz8BPcm8eewAA5PC/zK8608rEB6SngekTd2qf24RYsNz3wSAzIhUlAKP0UJtuuuN6OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lNo+4Pcf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591C7606A320
	for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591C7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lNo+4Pcf
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so594820a91.3
        for <Devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188173; cv=none;
        d=google.com; s=arc-20260327;
        b=IrVzjncIa43AiAkP8PsTutjffGP1YxJ1r1u8JMz8GpFmctkHY8vFbE8PgnYNtEE2R8
         wVX2z60P9XVJqRI8V8FgTHV07/zF6fA6SD+txtL2cCMnmlS1+xOD/9nZdVFaR9f6xiPe
         x6XTjLYDcrXqXhSmcumXEQ4suU3F8VdeIiamWbj9wamMwKcn/1VT3etMcBv96AE09B3T
         5bA1n09aVVioxyocqEeGaxMUH21nvNxc5Q6nTpO6RMjYqh6Ys6iwyV0Ecyq/ua5KUaGg
         drYf/6EjETCD3Ofnde559GGujdb1GUJqnUDZCKX7SxVOyzNTufG+0sxRPPF7Ptkbuq9U
         zO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yLH5VmnXQCypmMYtDPpOLMEB0hSwbpVq9ORFIbZcbww=;
        fh=3+g06nz6/JBWGhD12KKujQaeYO/scZWewmqRWXJ7hSc=;
        b=q1BGD9NGVEXOJ1F1Av8AR0hjyi+rhEzJCvpyjSPfXHOgY8g+dCxIFXRFj0sTRW7O7/
         iweKbozyxnirt+IzWZb+KPWpKXkRd5KIx/27LuRE117Pdt88SE+ZNAP0rtGkcG+rY+Am
         5SsLcecZlIKfts7mSDqrtGvaKDiit/NiyEot1iRIe955jkFlX0Vjga4HeejORgiZb5et
         V+u0HcYQP49gJxuUBSLkN9jiSCGZbUufgMvwTteXsMLt3POxmfQiF7ChUiBBu9MsGdJf
         19LpEKujoXf50PuB33Im1vh919uIwtT22kTIaQ4M+HjxuEgA87MvaG+OheojZenwvrLX
         qesw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795188173; x=1795792973; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLH5VmnXQCypmMYtDPpOLMEB0hSwbpVq9ORFIbZcbww=;
        b=lNo+4Pcf4UnV19UT58axrldYv7dhQBVZ3fequvH7Acwo9EtIsYnPqL09oXGkoyspql
         H7j62Fw4IT6uxOfSxpIsZECkoYj7VnFVnINCDXqv02qKW6gQHJCc5i1khm00LwnWvKSd
         QWMMyGCsu+ClVjZsmJ+OuYrToza0terwS/aio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188173; x=1795792973;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yLH5VmnXQCypmMYtDPpOLMEB0hSwbpVq9ORFIbZcbww=;
        b=afgzAbEZFJvu6rT1/B7FXY24Q63pm2m9DDeBeJBLnd7Hl4h5pZi8p535qXkAMBe6pJ
         et5YyUjZ1ok5+DytxHbVQ4YHGrXVffSIr58iHsU/Ew/WDt3hWgqEN1Uf9rUnJru92uA7
         xxsObTt82g/0mY2nR2E7VrEsoA6+tvZcNqTnjQj7LIgUeP5deQun8HySkY1lnq09h1i4
         9Z0v+gZS5z2ukkp3dcP7zSFf2HoXkK4q0KoZURCCbGrGJkqdIDXh8CZJceg7dEW3GZ2e
         7/yWlZiXnmOmDhec0J7y0WTfeoDsdsnQRWV1TwR9Fp+NZ3Ip8d8TDxp7J0DGCKV8wjbR
         u9IQ==
X-Forwarded-Encrypted: i=1; AL+hErG4MUMpmHFf9BNpPu/Dr0BcDAkLZWAST6v7Ki4uKqurlVHX8GtOlIwn1KBoeZqGJUz3uZyaNkP+q3Cn@vger.kernel.org
X-Gm-Message-State: APuU4Z9nWjjnldzT70MW967VVDBx3A/YLFwVPArZHfsjSIwwUc/vD12n
	F5VxAStdFrSj2KEUGHhTmgxC6MPB0U8jY6Ans0s8A5pQQcW1LPk6CpYeEjwfl1PDpwDCABbOPTb
	fYoyePP4DLA6xO3GpUZze35WjF9WEbN08vTfURYk0q+BhPIyeo8E=
X-Gm-Gg: AZFdTZdKGwHb5LFDNJM3hJ6p4IkoI7kvepQS7fdj/mLhB0MrU29qzCGEVMiXUMGuRb6
	1YTvkyqCcPyDAOLjXqMhmvm+txRcB8dBtkrK4/GRhFNG5WcFc4jGn75DDNifUrSXVimJJX+f04k
	zGKuhsBJWA8bEs9sljxrmPbr7zRDiTz4v4NuUw/Klmjnuh/H/XI005ayzLNXsMNTJv4YBk0j9Bd
	nfR+cFZngh2lzWdUsWgdsj0w9GOzRIPsozDfYR65/XLB6k4H69H7nAmi6jN0A8uWJZ2ZvTAlY3j
	kxkx1vB0jhKc93FNQ0+3gPDfK6mYLcpy/luufkCqhIDa+qbjj/3t5h6Zo2e5iePU+t6/yF8+QOB
	JAU4z80TxLA34K6MKQSUP+L5d7uAQQeZS12u9eC9RpAnu82Nxj8bdiGJwjVj7xGtUtN1gldotuT
	bnTzRttskVhqn9gcgc
X-Received: by 2002:a17:90b:4ec5:b0:3ac:b2e6:3181 with SMTP id
 98e67ed59e1d1-3b41c9476d3mr3456886a91.37.1795188172371; Fri, 20 Nov 2026
 07:22:52 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org> <20261116205320.1621386-7-dianders@chromium.org>
In-Reply-To: <20261116205320.1621386-7-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Nov 2026 08:22:32 -0700
X-Gm-Features: AclHuK8mmsjs7pN6k3bzNXtd8WoPzoco1JjhltxmsQvDAjAEl007qn__5cOalqU
Message-ID: <CAFLszTjhY-mS0yaUtV4ae4m_zTTBA5rDH4NtoU2MbEQm6WunYA@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Douglas,

On 2026-11-16T20:52:57, Douglas Anderson <dianders@chromium.org> wrote:
> pylibfdt: Speed up FdtRo.properties() with a C helper
>
> Iterating over a node's properties via `FdtRo.properties()` currently
> crosses the Python/SWIG boundary `1 + 2 * num_props` times per node
> (`first_property_offset()`, `get_property_by_offset()`, and
> `next_property_offset()`, along with their Python `check_err()` and
> `check_err_null()` wrappers). When walking every property across large
> device trees from Python, those per-property SWIG round-trips dominate
> runtime.
>
> Add a C helper `fdt_node_properties_stub()` in `pylibfdt/libfdt.i`
> backing `FdtRo.properties()` so all `Property` objects for a node are
> collected in a single C call per node, interning property name strings
> via `PyUnicode_InternFromString()`. Also add an invalid-offset exception
> check to `testPropertiesIterator` in `tests/pylibfdt_tests.py`.
>
> On one stress test (walking all ~573k nodes and ~2.06M properties across
> 438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
> ~1.8x.
>
> [...]
>
>  pylibfdt/libfdt.i       | 64 +++++++++++++++++++++++++++++++++++++++++++++----
>  tests/pylibfdt_tests.py |  3 +++
>  2 files changed, 63 insertions(+), 4 deletions(-)

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -24,6 +24,61 @@ static int fdt_property_stub(void *fdt, const char *name, const void *val,
> +        name_obj = PyUnicode_InternFromString(pname);
> +        if (!name_obj) {
> +            Py_DECREF(list);
> +            return NULL;
> +        }

Just to check, how much of the 1.8x comes from interning? My
understanding is that interned strings are immortal in Python 3.12 (I
am not sure about later versions), so every distinct property name
seen in any blob stays allocated for the life of the process. If the
gain is small, PyUnicode_FromString() would be safer.

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -477,10 +532,9 @@ class FdtRo(object):
> -        poff = self.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
> -        while poff >= 0:
> -            yield self.get_property_by_offset(poff)
> -            poff = self.next_property_offset(poff, quiet=QUIET_NOTFOUND)
> +        return iter(check_err(
> +            fdt_node_properties_stub(self._fdt, nodeoffset, Property)
> +        ))

This changes the behaviour a little, since properties() is no longer a
generator. The FdtException is now raised by the call itself rather
than on the first next(), and an error part-way through a node (e.g. a
truncated blob) now produces no properties at all, where before the
caller saw the earlier ones first.

I think that is OK, but please can you mention it in the commit
message and update the docstring, which still says 'Yields'.

> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> @@ -270,6 +270,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
> +        with self.assertRaises(FdtException) as e:
> +            list(self.fdt.properties(-1))
> +        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)

There is already an identical check a little further up in this file
(just before testGetName()) and, since it wraps the call in list(), it
passes with both the old and new code.

It would be worth replacing it with a test for the new error path,
i.e. a failure after the first property, such as a blob truncated in
the middle of a node's properties.

Regards,
Simon
