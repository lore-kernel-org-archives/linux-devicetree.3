Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571163;
	b=N+6NW77q5g7ylreB5UR4GoWJdbWsdkk56yDBJXM9RZnU+PbmeZR1u7EF1l/CBByTwhrd
	 4qIgsz2yxwNpKc1BqHndr8+5oQLETG4UpiyL7nbzFVyUNSDixFP9ZMlGTTbraFcRO+2Jn
	 YFtWpr4h4wejzi/8kJCouyKR0bp/9++CzJdJzx8Iw0XSNgUBkPy5sHjkejANVT9Y84bGB
	 +VvXtbOhOMyWmGbTgzQBbiO1ZM2nO/jaU7py46qvK+GttaI0Wzyz8fZnXIpuEatVehO15
	 /kHvD17/gSdW+vHQUZHBCfxxBTlxVUkAfU+U5O88915v9qzMSkyoGxigmxuaPsuOtww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p/9fa9bV3ZcCfTLaoelFVuKfAoX2NF9q4J5ymFDkaHE=;
	b=XF1Ov/Z0wQ7udp1guEplR8dTob7NTUVmgN0fHXtYz3hEUAGBwGWkpqLbiQjOdXS7nnxm
	 msUyn23bQ1ZX9oYVwc4+lu7T9AV4Zj7ZvCxzf+qvPAHOc7F5fKhaszlzw5lQBP5rQz4eE
	 Y7pfCt/KIOUmifK11TaYvCmm2Oqd9QU1X66fdEYE5BU8uEmh7hWXpkFLGaH4RwOmDg/ab
	 wbi/ZAl8vblmzw4FVdok3hVQa9MXW0CpM6ySD+pUnsR31OGHR5CvuNIKtUYSg75vf0uQJ
	 wHEX9uGcvPog5dJIbE9TVZRTCMRGcWczwHjqeXCn9CiCivjq9KVJVS5hg968qPuEx8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IccJ1Jqq;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5F1606A326
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5F1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IccJ1Jqq
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be4fea434bso2920216e87.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793571161; x=1794175961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/9fa9bV3ZcCfTLaoelFVuKfAoX2NF9q4J5ymFDkaHE=;
        b=IccJ1JqqXSD4DHYgpBEZF8oT+cZwh48zf0zH0E7bty/1BEtE0FFzix/5grpT13TvHD
         jX+vvcuV54XBCawHuBr051I7gN1uOWLXamHGME2xZezmDSq40fAQ9B6W1Li5LgQcpVms
         YnQitLpIf2kkKRve1zS46hX75gpCfbb3EeQAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571161; x=1794175961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/9fa9bV3ZcCfTLaoelFVuKfAoX2NF9q4J5ymFDkaHE=;
        b=GdCgk/tLD7V7XkUI8+ppTX2eobinbQZYu6Y6a6HSgwbeeOfphzYSYmVK2zXeVwNbq2
         LUUK6/M+B35FNOjw+TE4TU+UDwod2nETDQx855Gg6wjlGWXUQEM1fxcudumyHsVoZ061
         DhBNOZ1ArwQjTPI4aoxvQBWzK3c1iRKNGiwyKvwfCqqRCJKcQYVw1nspfmHDg05dFsj6
         V+oJgslHJziku8tx2SWrBedNG+muyyY7ChMQa6U+9PC/y2oURxbNzoO2IL2OC5bzgkJ7
         hbP6PG7kf+1/ThEkAgaG4dgQDIcFOZeSr/Sx0Smx29opvB2X+NLadUEP6iv9LxrCDu6f
         jnEg==
X-Forwarded-Encrypted: i=1; AKwUvBzSRAbQ+VIYZL9n2i9cYxGRmicgvtuUi3DqUCasiG8mfnjYH8YON8rOWhQXjtk6CKqTwb32W81qAsz8@vger.kernel.org
X-Gm-Message-State: APuU4Z/7Hc5AjL777Iss18msqQIP9Cx57VoKrBO+SdNf1Dv5zxBNAh6u
	VSPuEdcW6sHj5fkrWKgMckY/Bgu5g4TdlCaLYZMZPOMWzad3rDodXqkEKIZnFoa6SOb0//pybR3
	GdkgIz+O+
X-Gm-Gg: AYBFou1/VRvxJwGhSUAL6E2q3vFnCdfkJoD9TR5HrfeiV5vksKpj9OQm95KenfMulgl
	PwzjkQijbS6ccQJY24Fm1sGYMAN5bO8FOl6aKiByQgAz2qxwuDlB9mYcu9+r6ZqYghZsv9W934w
	52C8j1clOXRufqxSSMylcx41lw4IC3In1kma7Bye0XZR3VP4HvcV7X8a4Slsw6oAIP86UjqxQlI
	Fnv5EwjYDZQ3zAyNXcMbrE/TpyQg3yGHeFWUEWVl4vV5NAwrCMmF1gtyH904bdOQg4rhC4H1MrN
	OnYZVQ87nP+KSDt80BvK8WMgJ7meZBQ/rHbDQ6G6B0m0tsJg9SYtmjLEts/7DTRPFac/v6gGpCp
	zZyQql4ohfJS72MBRbOsBqXVH+WHOrUVr/L9B9sdqpCSFhGWBZZHe4tZutf8ybkSLcrInhfAJYU
	yiX7RxmQ/pynY+R0HB+nulbbUkL3k8lnN6r5/Na4dQW+ZbVCw2JKfuaBRIai9yJYGLf5NvhWdAK
	X+SMxyVzViOvXORfHdogKHyWYUIy8y1mzieus970R9yvtmzITKAOZ0Wkqumvo71iAD6oNhEwHcJ
	6aaoCol78YHNoiUsSUwAMUuB05c2pZcPRzO4hW4NUIwqvgEDDTqgZT/ZL7CAkVOvuGk=
X-Received: by 2002:a05:6512:2383:b0:5bf:c94d:4b49 with SMTP id 2adb3069b0e04-5bfd11ea1e0mr3113764e87.12.1793571161566;
        Sun, 01 Nov 2026 14:12:41 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04a4c16sm1424116e87.0.2026.11.01.14.12.41
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:12:41 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso3699172e87.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:12:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxt+cIb1B/swDb2uT/cMEOPI03Y44RPYGiqItQBBJhgK7q3fimSMSi/HFUM80tstFrm1nnR+j6+wmmU@vger.kernel.org
X-Received: by 2002:a05:6000:4910:b0:48c:69b3:6114 with SMTP id
 ffacd0b85a97d-48e6494c24fmr30421734f8f.3.1793570681174; Sun, 01 Nov 2026
 14:04:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-3-dianders@chromium.org> <CAFLszThVtOwXJ4GKv5fFPGWGy7EL63JrEU=yhByUccW6Vkq+=A@mail.gmail.com>
In-Reply-To: <CAFLszThVtOwXJ4GKv5fFPGWGy7EL63JrEU=yhByUccW6Vkq+=A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UZahH27Rb+JrGpuPxxmnOAt3-DvZ1u32TzN9jJftOoeA@mail.gmail.com>
X-Gm-Features: AclHuK-0PMyh2gGf_SdepdjlMGJUnYCAlvxR2gqZjB6i5LECjAnzzbSqRkU6NPI
Message-ID: <CAD=FV=UZahH27Rb+JrGpuPxxmnOAt3-DvZ1u32TzN9jJftOoeA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:22=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -204,6 +204,23 @@ class FdtRo(object):
> > +    def subnodes(self, nodeoffset):
> > +        """Iterate over the subnodes of a node
> > +
> > +        Args:
> > +            nodeoffset: Offset of parent node to check
> > +
> > +        Yields:
> > +            Node offset of each direct subnode in order
> > +
> > +        Raises:
> > +            FdtException on error (e.g. invalid nodeoffset)
> > +        """
> > +        soff =3D self.first_subnode(nodeoffset, quiet=3DQUIET_NOTFOUND=
)
> > +        while soff >=3D 0:
> > +            yield soff
> > +            soff =3D self.next_subnode(soff, quiet=3DQUIET_NOTFOUND)
>
> Since Fdt inherits this generator, a caller can easily write 'for off
> in fdt.subnodes(0): fdt.del_node(off)' and get garbage, because the
> offsets move under it. Since David has applied this, please can you
> send a follow-up noting in the docstring (here and in properties())
> that the tree must not be modified while iterating, as with
> fdt_for_each_subnode() in C?

Done. Added a patch in v3 ("pylibfdt: Clarify iterator docstrings and test
negative offsets") noting in both `subnodes()` and `properties()` that the
tree must not be modified while iterating.


> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > @@ -243,6 +243,21 @@ class PyLibfdtBasicTests(unittest.TestCase):
> > +        self.assertEqual(
> > +            [self.fdt.get_name(n) for n in self.fdt.subnodes(0)],
> > +            ['subnode@1', 'subnode@2'],
> > +        )
> > +        leaf =3D self.fdt.path_offset('/subnode@1/ss1')
> > +        self.assertEqual(list(self.fdt.subnodes(leaf)), [])
>
> The docstrings say both iterators raise FdtException for a bad offset,
> but nothing tests that. A test that list(self.fdt.subnodes(-1)) and
> list(self.fdt.properties(-1)) raise, perhaps alongside
> testFirstNextSubnodeOffsetExceptions, would be good, perhaps in the
> same follow-up. Since these are generators, the exception only appears
> on the first next(), not when the method is called.

Added the test for `list(self.fdt.properties(-1))` raising `FdtException`
(`-libfdt.BADOFFSET`) in `testPropertyOffsetExceptions`.

For `subnodes()`, it turns out `fdt_first_subnode()` and `fdt_next_subnode(=
)`
in `libfdt/fdt.c` map all negative returns from `fdt_next_node()` to
`-FDT_ERR_NOTFOUND` (`if (offset < 0 || depth !=3D 1) return -FDT_ERR_NOTFO=
UND;`,
and `fdt_next_node()` treats `offset < 0` as starting before the root node)=
,
so `subnodes()` never raises `FdtException` on a bad offset. I removed the
inaccurate `Raises:` section from `subnodes()`'s docstring in the same
follow-up patch.


-Doug
