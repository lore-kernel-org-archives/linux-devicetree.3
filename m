Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922002;
	b=0A22mANaNbtSVfp6A1pVF7sex9oI/etD8cHfsh+UZPfogVzBl6kVJGfHSy3qSTPQpPFY
	 dBPiRYN2rJFYEXB+QWM4xh3PeTOmBjxJ+8FawXHrHzMY/S8G98yU7jXi7kO95lYt9GUdf
	 7DX62WPnXTb2IpseZGLwQSllw7grw1Z9WM93ySclGwb/lJh+LyC0apv3oVLPvJLAgVI82
	 5D3/Hf2zRXnO5mky6JqtkELZ11dX5mqsqd4dApygni3S1WlgiXkpg4g8Awy+5IbcV774o
	 +ptKVmZnGh/wuqLT01J3olJa8+VQnJgWRI0uEoN2ZEBRIU+c/21AjYDx2q6Ed9u0dxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
	b=Oyq5vzUMJj9OC+EDoc+DKwGFxtiI0/MJvCt0Rbv7hQ4qAoY6Y2Z700FQoLcKwur5ukIo
	 gqds/ozlQLjBmkWa4VfE22ePSSj/2pew6qjGYblTBmjI2j3eB0PHAGCoI4LhPWWamrGo+
	 GqziWzlNm4JxjGhnvHtHncgRn5TWeN0LlTgL0YwHmdw6Gvl6KQm+2OT7oypUJfG0Zutqj
	 ujiXz8GF/5WnyMyWZus9r1JEVbdLIwGiyUr0TPVWWWrnrfMTLGQqSI2V71j19ZSR46L7G
	 Uir/hklf+A++HFZ6pH+krk9efNYyv2FoTkDJZ2sCAAaJjo3NqFyYpx22bh/F1pOg/Zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTsTP4U1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE5E606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE5E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTsTP4U1
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso7092815a12.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:26:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794922001; cv=none;
        d=google.com; s=arc-20260327;
        b=CvEi4B8U1GSDA2zumFopTmlyG0mRlpx0ApI3HoV9BMFxFbMg/yK5b8qQsEyVBsWW7w
         DRY9XBtlZn6Qz8cI8AtpeitgZhmt4yl0ctYBvuNc/ur8y7DFYDzn2l31miua88+ViqLp
         /C7XvzgQLIbC9G7aO6Prf7Fl/nhH9v+ifnJf9PDxda93V0U2UEB7j+OOT4lrMN+66a//
         HY8bjfj5jeq6DjN7uflc7vMv+CuENGlZHlsRBJF807oSA+8lWRVSzE5Scq+KJW6I6386
         OMTunG3G0gAuvxcIQmPBTv0ABvPu2YMK+grplqVQtsm56zezxZqPFmRn/5j6BOPRHFBV
         u+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
        fh=XjVI1NLfCQsHiyMcc4N8NcxZuZe51A0Xs+7Zy1NDzPU=;
        b=qISj5CceSwgA25pd31l0ZmHSOQ2zIGPWoZ8d/hVOjYDPLxQ0m7q6XGVI7YNQumm13C
         GHeAKgvAIHjqSiKGEu03sSrUI5SsrLh6jyBINegKM/ZRIkq2IpjqGyCDEKNFeydVhRtY
         X+kmDPysWJGL6R6S1BMeLJreZpoIEVsfGs4OQYFUoz51AvyPaQOTFYtTcoct5VAjZdW4
         oUYQsZO41pAfiDGFnHZXVTib0FHMhu5jqLIOTxtYvbR69GkbBrgUnit7T81LjuNBaLPt
         Ea/cCO9dTJ7TvVN5mRYVt6Dtgn4B4hATocolmqCYbZgAasHt2i6MY2ngTc1d7iR5dulv
         F9/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922001; x=1795526801; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
        b=tTsTP4U1cCg9Rk1KBSRbSUm6wrsPHp1ZGTzobUTmseCRCyq7/058crmjpXgSCDQrVD
         Oo//fiT1U/F1MgOxMmxooc4czK40/OUnCOlhjrsYgDN9x3tSKk16GX1Hh49zChF2aP1L
         MHLP4aI98Sg3L2qBUjcpxaIE2XkQkpiMlmnY1UOMMW395k4HisBZyhNzgBrFASyHdSoy
         Avg3UUwBdhjJXOLDxSd0mL2t7078Cy4hytGP8ZlALjQYHCUUZGiP9E82hfdRNeRf3Tia
         VRF8x8qN569gR7x1QNnbgToOet2Laa74J4mR2YGYkSdMROuuFvFVVPJYWX7gsQ/a0Irh
         QcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922001; x=1795526801;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
        b=gtE+uLSQD+5Rg/+y00kEDPCu+1o6ItUqr0hTfkvyce1RVscbYlqxQu9lHj0224RhTN
         8v3caOj+alAgvaU/HhzWH1Z3vbvn4HFtIFz61r+0cSBbPpD6YbvFrD+mhBEb6lWhPrN6
         wJ8Am58COtGAsSzOaf7AD4+FYU0UQ3P7z87vKhKY2YVm/1W5MV2QvK0SYBI+FJEmFqIA
         LJy8H721ozp4t7/HSNc6qQe1+gpRckuJZdmWAzrrf1EkpxnCtVcDVt9YVve1d1GohzbR
         LLYAV01wOM6z17wzg5AfcpcrQdps3vh7aLALyq8RgVkxSyEJLeM7oODZwXKcqUTbOE5c
         3dTw==
X-Forwarded-Encrypted: i=1; AL+hErHIOWaNCt2LDlBSq5XNAOPj5voGNOb4NKOBacSuJeEFnPKEWL8Ge7RPGyRzE1GdwPeqKbiNA4mytfI6@vger.kernel.org
X-Gm-Message-State: APuU4Z/RMasWn+Bw22IwkC0nheJr11tp7OtKDwe13xjUz6Ap53OUWtyt
	4rljtEPr6TYmNN9KRt+sY4iNqeMA72+OZW+NtBvnpPbWoIikD0komyvbq7gMXkb/tRRV3CFif0p
	jAtANlB9eXfwIdPCsbnj3O0OzaFf7ICbPjUI4
X-Gm-Gg: AYBFou1y2MIu1Ty1EPHVC1dxIYXIfes7c+bZKmcbe6Fj7PXiCqnwiijQJ46joXXh7Mm
	v+Bv2tHTNT/2w47xUSuEjQ/3hfgP56sQp1ke+oEWmJRErOOAIP16N7EskeRvBg2tjZxkQL0Sis1
	/5CyHF1Dr+zT0Xo3yVEl9afxXj6IctBg3L+arE2SBttRkvP6su5kSGlIg1CUfC7Lq/3hWaUkGVu
	OPl2kalkKcz0j1vd6WCvb0jZpwxqQ/zo6uSkafuUNAmI4YPlXTp9ngmOyP6qkoI32w2kX6iZcb9
	BCH6KcyDJ/F5LReR3F8vFmHFrmzwYscBrylUeDgTnuRnLyj2C4PqbLPBCTKpxeVCopzQMcESYG2
	ra5PQ+Tq+YnBfeYMYL6YxcisKrNfi3VFYx/Y=
X-Received: by 2002:a05:6402:4504:b0:6b5:7de8:87cd with SMTP id
 4fb4d7f45d1cf-6b7c0d06f9amr10641554a12.42.1794922000158; Tue, 17 Nov 2026
 05:26:40 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-2-l.scorcia@gmail.com>
 <3701981f-cdda-46a7-8079-de5479ae9c27@kernel.org>
In-Reply-To: <3701981f-cdda-46a7-8079-de5479ae9c27@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Nov 2026 14:26:28 +0100
X-Gm-Features: AclHuK-pAjMxUsyMno9u008purn-se7dqQHzpp18oe2HOK5CuVKhIbMUqhDzQWQ
Message-ID: <CAORyz2+wF=VDTFkRFU7jBu-zNTW7T8mnPrJZAj8ZVD-Yyr2b6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Turns out you bring here undocumented ABI. NAK.

Hi, I'm sorry but I don't see the relation between this commit you
just NAKed and the bigger issue about mediatek-drm alias usage. It's
not like I'm introducing anything new in these DPI specific patches
and the individual display block drivers do not depend on the aliases
(they're used by mediatek-drm for building the pipeline).

I understand why the commit to the dtsi that includes the aliases is
NAKed, and the eventual fix is going to require a change in all of
Mediatek SoCs dtsi. I am fine with the dtsi changes being blocked
until an appropriate solution is found. I just don't understand the
NAKs on the DPI components.

Thank you for your help
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
