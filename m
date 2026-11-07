Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019420;
	b=xPmdHH0z4Xr/fVJSer1ixGdg0/h6mbNJf0gDtZmkwHAoffm6qOivsfZWY7PVF3ZOj7mA
	 G9967NluYWRQyZ8YIrLpaAFVBN14R+er8vWl6Qbpx1RjUORXCi1O8yARTRO6j2X1mA/f1
	 zT8jHYpOvNTvTa65EaacFxrgjJJB+gJDwPekbFYIZEIxwL7n/+TbCFtT+1XOLSr16k/yx
	 l14Tk8b0Y6HpEeAYGVKcBlTB92pj0YGW22KQ4Djq6za71AI1l0a2SqIlIzzI/OUHjLQmQ
	 jBBcEiz3wxO8+076ImQG/ywJTz+uB/vzxZVn4Uu2exLNewRRzL6AHzTvcL7ygvDTNDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4PVdxrjj92YH7Ioge0Z5YUxeZALza2C/7gTr5CnJ08U=;
	b=x4sYTaAWt6Fs2dANTIgt7zcXsFK7no0JmnmqAnMA3bjMchggLPcnqqzg5CsHJJcO6XLO
	 7MJVKQhZg61HVrBDWUef3Nd1m5yHjuCNxk2lYwbxKScSfUYUyLRpcQekl0xtfSL/Xq4tn
	 dlJGQkKjWuJZCiuiQu33QSrvLAiblhsI1xeNb2b5teUZlCy8mHDSkhkvZMSREBRT3vsTe
	 +MCv24hTh2hyBcU3lRI7tTJVqklEStewIWblraCcI3IxFuuo1zWDpZgjpoQfWFtHGu78j
	 yw8ULDjJRuzGs7y6KBYwa7LuovGmRUXhekJOaazNuPihr8cioi2aVJLc9y+ZXhEAw7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OXuqniKR;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E2A606D803
	for <Devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E2A606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OXuqniKR
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1535315a12.3
        for <Devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794019414; x=1794624214; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PVdxrjj92YH7Ioge0Z5YUxeZALza2C/7gTr5CnJ08U=;
        b=OXuqniKRZwwSA74dlHIiLI6LhrNT0mmVHKLySuKI9faP+Zea3YwaFDcYw/4a2XrAVP
         vCezO5pfbX6LRwivQlUz40XUmd7VfRVQpEVGHolZe7UnXn+95PRNi9BmVGijO6O4nMjW
         QdyIt+vOq9EA6jlQu3tUd4X9azUv/sOqU/wNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019414; x=1794624214;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4PVdxrjj92YH7Ioge0Z5YUxeZALza2C/7gTr5CnJ08U=;
        b=xj6GbiCvi1TjGqMtamL9pG5x0snVS3Cl6lmb0p4z936EeUP87pdLiTUlm5yF54k55J
         awx3WHsHdC/3rPD6FquHm0QvZa66gNUTlan3ugPKSw0LjiBqOa02BtTwF2oHfpyGJmAM
         auCkJ5fT3eiO2tpUpxwDFH8myPJacPSGKwXWH/mSkyWn8rwW4wBnz1VFzRjz5EhZyZbk
         ycX6XoD3PW7RsVeLJzhUIXB799Zgm4L6fhD5T1yrqNE+f9NV5Y/1HOjiYZ4Is2nd+vqb
         750qTeYifoFOKVUM52WOLlfrR2zIrL0dv8YjwOmfkBeDMQFAvByBNGuXuupaSX7Bnl2/
         jYfg==
X-Forwarded-Encrypted: i=1; AL+hErHegGnpc7J8xZxWDZWMr44pYxpzGttFaT1sS4vllihjxBUjKdVOFEmuKEskJwzF4FqO5TVnWlWsIE79@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tbiwnk8zh/MlFKRFUL3aDE4aRIIoA2D/VT6pv653LsXoXgGnV
	cUXKylLZaJiS1dWLM/KYEtMApGHL2z5x1XGn5BADyCvazfmmERE3T2WwDu6yv/IDARqIY9iFnmm
	0VicvDcpM
X-Gm-Gg: AYBFou1svh1QksfCp47xUweRqFL/z9v8M81xJwn/VXpXnlc76mst/+pVFZqfrZV7Btb
	M7WYjX2jO4bumslAOB9dTlouQM5lhCrOClzF681KfYRaAhWj2cKVgeAAI0P5N4KjlcM/6PaQOFY
	EWZBh5H9s2VV6yyjwIGbcUL1TunJQU5bRj17hsgWsgLPdOxALRvp3c6B7TwbgXqkY+1GABBHnfL
	qYhO22/aPSyz15miVKvXXq7U9fY80q95Zd8U4zDxTd9r+y3jh52rOe6TB6UxplCq2PhIzWOaZKi
	wGnPDtStC6aSa74c36QDSELLEyYuooo8fqIhS+alDhYLLZzHz14jiX1pmN/70A8o/QhIxUavRxT
	4Lcdi/gdTVJK5xnWIMWyjz1mABZp6Lb0S7kOwyZhJwOb7GGERfBRU56VkTQkhpVp/nNCGpN9ZlZ
	3JN+umsMpTdnCrEHLuYpMCwRSunRt/1Vcbz4Ryd6mKPFzqh3/1ddionpqjNyX5SzBNt+1eB5HLE
	fB24SFCmVy9pkn2cGq0Q/1jY98Rv7EXo3O8IgJGp6vprN/bBvS7Qw5xr+HhbP8c+Aykrlzk1H/y
	3BwVi49jNe9mHJ7zOQe3i22Vb/58LENDIWFDnIgu7qkFbADqIM68dwBRElgwZItm9VU=
X-Received: by 2002:a05:6402:1ecf:b0:6b5:6478:a9a5 with SMTP id 4fb4d7f45d1cf-6b5977d8c85mr3019099a12.10.1794019413888;
        Fri, 06 Nov 2026 18:43:33 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664ae5680sm1316506a12.20.2026.11.06.18.43.31
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 18:43:31 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a215e64962so13909075e9.1
        for <Devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:43:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHaM1EsUrVVcwsPPP32whIE0hV+sbk1j1+4UjxwEQiPoxp9CkaRDmXRTuM+QFzPFsOk7w2K4xIvFULQ@vger.kernel.org
X-Received: by 2002:a05:6000:41fb:b0:48c:49bd:62df with SMTP id
 ffacd0b85a97d-49272a39cd8mr7633241f8f.1.1794019410521; Fri, 06 Nov 2026
 18:43:30 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
In-Reply-To: <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 18:43:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
X-Gm-Features: AclHuK8Xumyik2VqnkjFm63bJgkuewGEq01Nnd9YLjze9SUsNf5q53Jz9OESWbY
Message-ID: <CAD=FV=V3CMALQsKUc-jDzvsH45y_h4hNxtjYXxaHOwyCsZ3s7Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Wed, Nov 4, 2026 at 6:08 AM Simon Glass <sjg@chromium.org> wrote:
>
> Hi Doug,
>
> On Sun, Nov 1, 2026 at 4:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > Add `devicetree.py` providing `DeviceTree`, a non-flattened in-memory
> > representation of a devicetree node and its subtree:
>
> Please can you start with the motivation, i.e. why a live tree is
> needed and what will use it? The list below mostly repeats the
> docstrings.

Makes sense. In my draft v4 I've updated the commit message to lead
with the motivation and condensed the summary so it doesn't repeat the
docstrings:

    `pylibfdt`'s `Fdt` and `FdtRo` classes operate directly on flattened
    device tree blobs, where inserting or deleting nodes and properties
    shifts subsequent node offsets. That works well for in-place queries and
    localized edits, but makes multi-tree comparison, structural diffing,
    and bottom-up tree construction (as needed by the upcoming `fdtfactor`
    tool) awkward and error-prone.

    Add `pylibfdt/devicetree.py` providing `DeviceTree`, an in-memory live
    tree representation where each node holds `props` (a dict mapping
    property name to `libfdt.Property`) and `children` (a dict mapping child
    node name to child `DeviceTree`), along with `unflatten()` and
    `flatten()` to convert between `FdtRo`/`Fdt` blobs and live trees, and
    helpers for path lookup, node creation, and pre-order traversal.

    Add unit tests in `tests/devicetree_tests.py` covering `DeviceTree`
    round-tripping, subtree unflattening, duplicate-name and corrupt-tree
    rejection, and navigation helpers.

> > diff --git a/devicetree.py b/devicetree.py
> > new file mode 100644
> > index 0000000..f81b8fc
> > --- /dev/null
> > +++ b/devicetree.py
> > @@ -0,0 +1,226 @@
> > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> > +"""devicetree - Non-flattened in-memory device tree representation in Python."""
>
> I'd forgotten about this but PyPI has Zephyr's python-devicetree
> [1][2], which installs a top-level 'devicetree' package.
>
> I'm not sure what to suggest. Would libfdt_devicetree be too awful?

Right. I'm OK with libfdt_devicetree. David: do you have any objections?


> > +    @classmethod
> > +    def unflatten(cls, fdt, offset=0):
> > +        """Unflatten an FdtRo subtree starting at `offset` into a DeviceTree.
> > +
> > +        Args:
> > +            fdt: An `FdtRo` (or `Fdt`) instance.
> > +            offset: Starting node offset (default 0 for the root node).
> > +
> > +        Returns:
> > +            A `DeviceTree` representing the node at `offset` and its
> > +            descendants.
> > +
> > +        Raises:
> > +            ValueError: If a node contains duplicate property names or
> > +                duplicate sibling subnode names.
> > +        """
> > +        node = cls()
> > +        for prop in fdt.properties(offset):
> > +            if prop.name in node.props:
> > +                raise ValueError(f'Duplicate property {prop.name!r}')
> > +            node.props[prop.name] = prop
> > +        for suboff in fdt.subnodes(offset):
> > +            subname = fdt.get_name(suboff)
>
> We should try to stop on a corrupt tree - so I think this needs error-checking.

In my draft v4, I've rewritten `unflatten()` to a single pass and the new
implementation should catch this. I've also added a `testCorruptTree()` unit
test in `tests/devicetree_tests.py` to verify this.


-Doug
