Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364620;
	b=Rt2aun+z6LaOXzP5tmeEpv2j5b+AN910jJ5uvLP2OQEiDXuYJpHMWoel/DPvZT2T0+Ef
	 Jxw0TRFxOjCCjJk2cMvYe03ZcodsaVVYKAxx2x1gw2+ClN4Xv8E7ZqUJ+9WgU2IhgHzCy
	 F1Amy3yI87CTwKR+o5hNsFKlmfs4NuOTSm8YtPDOQ/KdyX6qXK9lxz9Us75Kcsp/RWRQL
	 G/ULztrW761cNwJ87UT9GwUb4cU7D/36UN38l2dyGp4N1sUX4xVCttf+KQpMeNT6r6CXz
	 KJm+psWNFyai/+d2gjFZtVtjeVXnlPq2EfeWykTcYKAX1dQYZub022Z1pegWPsI6wgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/oUT2RdfqgwVw0znIAiPdb4nKDAF+jAJWkreAbJJFok=;
	b=o0xIoFv2JMtthPsGm6ifREfoClcYwj3UwkhSHB86uQgZRv/xZxpBymUJX5e1hZ/IBXkt
	 NYOn6liK1I/Q3qfor+8sE8ItQYvH0PdB7tYQ/1BwaGbWvuuKyCP8NWuQBm0H61k4HROWK
	 QH9z1T7ee3VAKMj7kx05yw1etSI3WC2gfgLtdcULpW8DleMdWmbK1ky4RHVh0a9cOCM8V
	 TMSLC5+20V/xPnS3uQWsPBOfdrM9YaXK2pvvgg17ahJdAEzYzZ0N8CMT6JZ/XfrmUOcDn
	 leMud6iWAcAL8LoFOmAs3uaE/5cgeky0DYev5q+zvrRgtNwAAH7G+r9u17POJqTS+Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I+FofQtM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B1E60A2606
	for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B1E60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I+FofQtM
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so748366a12.0
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364619; cv=none;
        d=google.com; s=arc-20260327;
        b=cFQ/qtiT0kFbK0BT6ZKpJ6H3m6DQWyKynYh5irVNBSa35n8ZILzRm5/Znj6syK752P
         OfrW7bpeucUXRcwqEINilOa6nyH4O0UlTTezBcCgbYYqdvlIQM87jG9/vm1iDNeAlais
         9/RGtwJos+zoLgriW0gnn9ruNV3MWGLAGbgxhJNwCrxtvhHaHQfY4L8SbvvIp41tdCHD
         hp4k0PU/BN5JMj3IfKdsbbEH87oJGxfM3X5l+BHtgOUi+KS3HI7bM2rvSteFUHvemcj7
         bXXTZq4/KrQpveDBGZ/E/R35DP90FzsI5BgLyZYlyv7lfh1PSNxmzoWWaGituZJYliH/
         oTAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=/oUT2RdfqgwVw0znIAiPdb4nKDAF+jAJWkreAbJJFok=;
        fh=hFl2i7PY05Rlh8I8+iHV6/RoMFUKoesK6+bWhCVAmVw=;
        b=B1HTg74UOUmcjJexhl7yaRV2oenrbRVTFYKxJHUcxttyhCLzHcXpQ8fXMuOk0LbLIV
         4XtEUW5AjxCSqglzrR7ZNqXicEj78vyAZm9fu/0aH9Z6LDqzxya/K6vv+gZMLJ5HJvHe
         tFhF9vX+BHQtnccXfdMKfdRS95lO9OjplQn12Aqw9bDuPlCDvAi5wKcXB0MSrMZSpJJ6
         aX2DRfiw3l+ZG6BciMKx5o9QnYZsbOImJbi6J4ygl25LlGlwhMu1ZK+SLXtC+W007CXX
         JmfO0l5IblxMrQSqINCcaiLyt7mFb7ScKYheb6CUCKp42Lf3KxMfm6JBYa2JzVAY/53x
         y2Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364619; x=1793969419; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/oUT2RdfqgwVw0znIAiPdb4nKDAF+jAJWkreAbJJFok=;
        b=I+FofQtMgQ77mXWxB9P/o6VaZ9SgiHlw2mJo1Z8Gd2VJCJnu/5P/qYzuhj2rvHc3JR
         xbssqvKBORNxgBuzCMdgiYBkjzq4/3nJCB9DGT1W+lLS9QJnLbiLMg0BVAgrFwDViq75
         cpahk7dhykQ0z20aHWKziR0mDsUMRAcg19ktU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364619; x=1793969419;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/oUT2RdfqgwVw0znIAiPdb4nKDAF+jAJWkreAbJJFok=;
        b=L8d4tw1uPTllKI8YOS6kItJAr+wmvHrHWxuh4VWcC20tpJfW1ilVRQigeBoYYBz1rk
         6I8vy8twWx1f9YpwtzrbuvzKArIZZ2HNvkXrZhUmlL0SeW//wBzFkv9MHEmgtTSKvaAl
         +qRg0Gelj9yuulI1lLbO+j2VedwHrib7snwaM6lpCOe798n/Q/aombfafserUOKAA76+
         rLatOcXyyRFDQreyq9ezdIfwiMhY6OO9N82ujL0jnUaZEGBf9IBoWsxr/9xE+DZOBsrG
         X/WRKKTYusTZ7jZWfaSHpt6XL+dZu09d3TGDBRKbzSUS2UvBw44owlI2pUCkK+nkC0jp
         LQBg==
X-Forwarded-Encrypted: i=1; AKwUvByBMMhg/0aeyeTxy1bs9K/P1Tk9cYMZOPUUP+Ly6VItS5fQ3qbqgagTdCzs3iKFrnSEPOpj1Qr50PEx@vger.kernel.org
X-Gm-Message-State: AFq9FYKle9DM0Ts3VNTZSVMetXoaxEEOqXAm82Zj7FgOs8BPXxDQ+lO7
	FlizpMRFlB3vePn2vhkyWK0piO6iqpsLl/87Kp43/FUeuCisFwyUVTiV8PzqQ2artelTpz/FKFX
	vcXGLj0WBniHUUzi/PfTFtk07B7a2UV4Uv6rSP4S7
X-Gm-Gg: AYBFou3kTOnxfh+MUddqvyR+KnEq/+T8kdcNlxiBXHosFZo6IEAN/XQtkqCFFmdd688
	S0/tca6EAZc6OT4UGqgnKyBdGMRHbN1ufc8GhI4AZzHo1n/BCyDhB6VAWD3DTA5SOAu5itY1xF9
	KXyEFdqyB4+lRspgtnqFctKR8UjzsunbiTWgi1SMr30XRYgcqZVRcqKUlHb1bXxMFC2ijMwx6u5
	HVRpvv0Kf/qf3p6C2+gx0BjxBIXuVg9sZ+DI9jtgGHFqwTiJr6omvNekssMJd7TVgWdp5snUqMt
	obxxuxPcFNBT4BuXBly6u5SFkh4u15awGa7z7ZJAXo/dF/U39qJx+Z97waIRCKCnnZ6+QPSKlnS
	AwgLYV5R8yJ7hmCmomDsglg/NgOd2yxtRmyCdv9jTJUaP20I+4ly99oE5mgi1XKVe4jB34Lw=
X-Received: by 2002:a05:6402:13c2:b0:6b4:20bc:f97 with SMTP id
 4fb4d7f45d1cf-6b4d4687f36mr1456603a12.9.1793364618460; Fri, 30 Oct 2026
 05:50:18 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 07:50:17 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:39:24 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-3-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-3-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 07:50:17 -0500
X-Gm-Features: AclHuK-5haYO3nWpUT-6WoE1n_p6LXGTVa69dgoVQuwfItbU4Tna_j7nctRDCbI
Message-ID: <CAFLszThVtOwXJ4GKv5fFPGWGy7EL63JrEU=yhByUccW6Vkq+=A@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
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
> pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
>
> Add Pythonic iterator helpers on `FdtRo` to simplify walking nodes,
> properties, and memory reservation entries without manual offset loops
> or `-FDT_ERR_NOTFOUND` sentinel handling:
>
> - `subnodes(nodeoffset)`: yields the offset of each direct child subnode
>   of `nodeoffset`.
> - `properties(nodeoffset)`: yields a `Property` object for each property
>   of `nodeoffset`.
> - `get_mem_rsv_list()`: returns a list of `(address, size)` tuples for
>   all entries in the memory reservation block.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  pylibfdt/libfdt.i       | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  tests/pylibfdt_tests.py | 18 ++++++++++++++++++
>  2 files changed, 63 insertions(+)

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -201,6 +201,23 @@ class FdtRo(object):
> +        soff = self.first_subnode(nodeoffset, quiet=QUIET_NOTFOUND)
> +        while soff >= 0:
> +            yield soff
> +            soff = self.next_subnode(soff, quiet=QUIET_NOTFOUND)

Since Fdt inherits this generator, a caller can easily write 'for off
in fdt.subnodes(0): fdt.del_node(off)' and get garbage, because the
offsets move under it. Since David has applied this, please can you
send a follow-up noting in the docstring (here and in properties())
that the tree must not be modified while iterating, as with
fdt_for_each_subnode() in C?

> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> @@ -243,6 +243,22 @@ class PyLibfdtBasicTests(unittest.TestCase):
> +        leaf = self.fdt.path_offset('/subnode@1/ss1')
> +        self.assertEqual(list(self.fdt.subnodes(leaf)), [])

The docstrings say both iterators raise FdtException for a bad offset,
but nothing tests that. A test that list(self.fdt.subnodes(-1)) and
list(self.fdt.properties(-1)) raise, perhaps alongside
testFirstNextSubnodeOffsetExceptions, would be good, perhaps in the
same follow-up. Since these are generators, the exception only appears
on the first next(), not when the method is called.

Reviewed-by: Simon Glass <sjg@chromium.org>
