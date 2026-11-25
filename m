Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631969;
	b=xKllrpMVC8augAEhMFfEoI+2jZWRrV4mN/4xGeYebFxmKNeymajWJ2tdagEAcek0bsnR
	 UPwQEZO6Hze6nhH318JuXPPlcw2EOEpIMFM6fFBTRV+YIW0cEarM4EiZYyW1AitMZt2Ii
	 yrhyjnJR49aHei1PheM4eX3Jtf/O6yP0vpN15163uW+n1DOGKnBTPOmAts3g1+Nv9aWgt
	 Be61T320ndOnLcbnz5qYaSWqvWvfa8FLATssmPvYGxeQQ6gzJht0aL2bhhbi7QmgLzRXd
	 e6P9I+2za8/RDkAZd+XsvvylH25VMYQcRz2KaanxX3Ae+crIYDwlSlJm2iFohl6ptXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=qrWO10HzV0M7DzaG2wh5D1Meq1mD1jI27J97rru23Fs=;
	b=ZH5w8vj4Z9qqwux6OV/1D1ZhDa2B0WypVlTDjoSYhmMkTTsUULqMTpQQpQhPgwaqEVLq
	 eSZxDPpGYwahO+sxWAZ0AmsviwYjWhZkIjBddKiaQZ+Hi17+RnG27vcuJ3oATBxpmKY0o
	 wpJ3rQxbdeq35nOb+0mbb6kfoincNniLcOcO9tVg5UXeKP8GghglEgxyRwL7o0udr1mcj
	 F+OpWwdUaYNFRYLTh1awODu4TlLUxTP1UoYDCkmxwb2yEGH9F3QHj+Ej9fP9/BBWYXxdR
	 hpNAz75uynLq33k5iD13wz8k45SWB9WqrypmLJRTFnv8mfIvh0KN3icK8i2IU2K95mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+XyX2zt;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB63F606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB63F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+XyX2zt
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c15956ce07so5687536e87.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631967; x=1796236767; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qrWO10HzV0M7DzaG2wh5D1Meq1mD1jI27J97rru23Fs=;
        b=v+XyX2ztSmBMxCpivJIJVnydea07qPU1NSG9IJu2RkTIu8tf3ozjXgauGhCKklsbBe
         8XoPoDV+tOXcBRKZTbFLM8rO6zTDf81zOWY8NhEJuY6srXyJMct+afKWl+Vx/+IGcu6D
         jzJh8xTMrSirrjgVJwVqA1yXldveO3xu5WbV79EaG/72R0jffjRaM4SizXF+jVOe17jd
         YnfJWO0DZqP+LUotPo6thftm9sdIrOvyq7D2fZvaGFQp059Svr6pvxRUgMcW2F3FyVp+
         LWgwzZnfHpfpz1ky6TCUvF0Dk0tiknqWQYV/8+69JrMvAyObZCiSQjwkDNvpbE0lCiYO
         QTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631967; x=1796236767;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrWO10HzV0M7DzaG2wh5D1Meq1mD1jI27J97rru23Fs=;
        b=pAcnxDXQ9GpZuvrnAXVMV9oE3bac2+vnYXuRLHJP/SKWnJE2wAEzaROCwQaPd7xmEK
         sO/vkzgBs7iT2NKjGeOfToMS2TaK9LWZakKGrKoKqbdVi8n+Me10bocwjrDJ5vIwdooE
         bmvj3iFyJ/cH803vickzVCwzVvJSDF5gxN/dt57weaRK0hNYW6iSjC14guGf72Bg6HGG
         abE+ygjG0imIUFrAIeHvnzPGWukVsqXCV/efvQ0qDA9GQLNlA08ebUsDO1622PriLICj
         9m8BjrglOnJugE779r1Al7ubRv3Ob9ApkMvCniILpFd/U2u7KZkH71H4HxCMNvm4pElJ
         nNAQ==
X-Forwarded-Encrypted: i=1; AL+hErFcPb6kmsnMQlxpP/yilxGocv3mv0/xXOgJ95iW1/OxhX+wbOOlK9UORctNv16A9ayq8apqOivgItf4@vger.kernel.org
X-Gm-Message-State: APuU4Z9SHAbkJwYg9t8cMF+zFrBpCzESi7+PQeKoRoWjbtte31VISO0w
	32k/r4eF9dOHgOoJ/85tVhBFt7VTMa1FEIbHsvFlsnLwL4+Oag/DFql5
X-Gm-Gg: AZFdTZcDaMgTzsK2eL1zJ0KprxPXkg7qIcT5uSFJ6Bzi327Q5h2uS2YetIydfYf0me5
	/0hw59Y+OIFOx9ZXnCywdpfmlSnF6uquCaTmXMJg0SAjsb7GUCoJ6zbbkvsRrJ4tjQzuyeTu6gX
	OfTUMnQBT2keQ9kaa6/GXLwBXPqlNFXI+2buQsWYdsEeoa9PqyNgEWIfI177q0Dagt5Qxa21emA
	zf1nV1QQ5klldiY3laDaF0aINYZJYcbZ8bS2qSP3r+YgwNGa5DIscWkSXaZwchSwowDk4j412lQ
	F4wE1N3kFx9hP5NtMOaWK2YcacA6QGjwCGTmOlfrNQMpzgbGX0bbn0nCkPB/Vy29duz34ACyA5B
	zbBbkSFTuSVHxPIRU8qGj8mkJXWFvT2+wRH3J6KKZx8erYJYFv/mqbo9lUHuXGyDGTXog1pICnj
	4VZf9sITAmj6ia7zC/7bK3s9CrI3in4uo5B2l3o9DuifxCtTgSlbhIjDhg/+lx190XEPuUMkvT5
	vSpsiKraqd5j1sTLOE/+HWW8CzQbMCMzrKN7aADB2ltVg3HG5KymS4rnS16D2HrsPnS2CnyE6U0
	H8Y53qvrkjZfJLdBvF9raN2Ehf5pimBehKuRvU/kM7oof+i8R50dZQ8=
X-Received: by 2002:a05:6512:2509:b0:5bf:ce43:979b with SMTP id 2adb3069b0e04-5c1b7c0725bmr5141409e87.21.1795631966994;
        Wed, 25 Nov 2026 10:39:26 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ee57dsm45217441fa.7.2026.11.25.10.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:39:26 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: sashiko-bot@kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
Subject:
 Re: [PATCH v3 2/3] mtd: rawnand: Add Cortina CS7542 controller support
Date: Wed, 25 Nov 2026 21:39:08 +0300
Message-ID: <179563194871.3.18108963585378703111@gmail.com>
In-Reply-To: <sashiko-outbox-233989@kernel.org>
References: <20261125-b4-cs7542-nand-v3-0-0b6d141c102e@gmail.com>
 <20261125-b4-cs7542-nand-v3-2-0b6d141c102e@gmail.com>
 <sashiko-outbox-233989@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

This repeats the EXTADDR question discussed for v2:
https://lore.kernel.org/all/179546920557.4112741.10222765658884997584@gmail.c=
om/

I compared the generic cs752x_nand_pio() function in v2 and v3; it is
byte-identical. It supplies all NAND address cycles through ADDRESS_1/_2.
Both vendor GPL drivers explicitly clear EXTADDR for erase and OOB
register-PIO transfers, while using the full row address.

The earlier read-only hardware comparison used non-erased OOB data at
0x08600000, 0x10600000 and 0x18600000. Full raw page+OOB reads, with
EXTADDR set, matched OOB-only exec_op reads, with EXTADDR zero. Each
upper-bank result differed from the lower-bank alias. The new v3 cover
also records a fresh native RAM UBI program/erase test and preservation
checks after return to OpenWrt. This does not claim OOB-only program
coverage.

I have queued a comment explaining the vendor register-PIO convention.
I do not see evidence for changing the bank field on this path.

Thanks,
Fil
