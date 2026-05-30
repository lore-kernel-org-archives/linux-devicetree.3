Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AC1233928
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 01:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780103789; cv=pass; b=OoINEGINs6DfTCKYxBPjO4UyfSMN8FCwNQ5IPWDbW2UJyQK8oeucmdQNFsv6HV/Dn8itCi3vw5auGJbPHakUrdQO8c73UFHKiQjyI+0PT0UJ6SkdirafP6OO+Xr26ZFZPxXE8XHZfTpaWVF2R5EGRebXy2jarry/w+R61QLbfNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780103789; c=relaxed/simple;
	bh=PVZJKq0QZpDBs29p42qzJsANdYgSGTjFMDU66TixMSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vih5yDRAHcCyVYIZbj+fGD5Hv/7qwALvJ34Nqf8qzhbArxgS+FKi9P00pDzYMzlL1AVtTnjlVhHHlsV360MllHlWOwj/8VeZIUXA35IgLZfUcpEEbhJ3DAjJyghMCXesI7EaVOkhnvYcVD8O1u7grxv2xdKvlwySKVTIdjyWAak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYHBnzaC; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYHBnzaC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4909def6a21so5600605e9.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 18:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780103786; cv=none;
        d=google.com; s=arc-20240605;
        b=VH3m9zQ7ih2QX39j0OueOT9m437tFMw0zpfoeDFXhs3HaXjH/2rW/Hyg964s/3GioM
         mxLU8B5+UIpMt9lPiQfW2OfRWnhNm6q5uAzqMHLYxCaZwvH9qVfLs+0D4tUUIXPgmU3q
         2CcZmiDfkOREZuwDuECX/TSF6EH7bebl9eqNPnjbbqrpgYKX8CYkYgWxq16300j4YoyN
         zgzAr277GnFqte0YSa+yM4M6qcy8YaOvsmsPqqLcTvvY5W9D+uR4MW2jgG30sZbqj+tr
         xtn8d1R0KT3OsQJML7VYNMQQA2IyrEwVfpDllZbzU4tN52yaPXCn0XG8Y8hTL6vbJKSY
         u2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uhtMF2ezlNaaALDfyaxkEF9+57T983SySMQAR7CATi4=;
        fh=pRj03E1onxRqWo0+hZ3ZLMat3S0rY+gcR+BxLvEXeXo=;
        b=hr7ZkE32HWklINC0Lele5wYb40aDZPUpRS91ZzsTgFI9dqVsE5x5G2SJl+wenrOqOX
         cHOHiidotB8A2Qu40TozU4Gp2C/euNxz7tKXHjIw5dsbd7e4LSPxCGlUoyvotJAfou5d
         CGC7V6DXVA2A8NbLr9WzxZhIDYbWPrQnHWIuP/cmYl3r4mFGy2r/KKBaP2syDGCDW0nc
         rCGXp2tsbVhQvi4bANBwPQ73HmqAGvIV2Enrf7V7+u77A8/EitlZDJpi8FjWhAaTjcWU
         c1kMVEhB4D9epD2STLGZlnogA0QuSRR4JbGuiyTGP/1CRCNdGmSUCgc+RfAF1Rk567Tk
         J69Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780103786; x=1780708586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhtMF2ezlNaaALDfyaxkEF9+57T983SySMQAR7CATi4=;
        b=CYHBnzaCY5sSGUn+lbW1M5OYqT22AsvTWcZtCbEXW6D0bGj0QtaV/8O+WFiaz/DlCY
         zXYFHC9AKMT+izxfTFwoJr/DFgQzlOEZgmg1NjGqguCx5eRRWbHlASVv+5IZdg1XQoYK
         z6d0T8xcZgZoMLpNA9/OIBpLm9vqzUa/Vh3zr5OAlKItz7wQzZKVkW7xjkssPOE26wDh
         Al/37nCRYzVU26xYBypxut2LvkF+iG0HKMqu3UH43OyQjW1c0HLXRhXNOnenLHu0zZlv
         4JfMGlTUNc/s4+GbFcGucMzlBaqJGEoZH5cKg6YwKujdrKUPpI1WQ3iJdvwDN7SFSJ+K
         z7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780103786; x=1780708586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uhtMF2ezlNaaALDfyaxkEF9+57T983SySMQAR7CATi4=;
        b=SWPlelxELF6+MibuRKSOJjB1QNIA0MH4V4myvRxo2rGeDcAEhyMHKTYT9lvEs5vHQ5
         qOlFErZRkble1fkB60Bpt1RA6NHbFT7B28mHgkLgLj0p1TzUF5wRivYkAPcHLEluBwfM
         IjTYAb7AC0cC5jpPPQDWldYxbccgo8/FN0WG5eVATzpROLUK5YzD5VtLzWZMWfyOZ6xV
         Lyvd708A1k+u60jDs14nVGe8NGNvPL+S2sYt1LV4+IFwuD14tiYYV3Nv9lexSW35X6cc
         8/qrBWZHc7+tQI/hOb6Q29loSBizNSoSj92SBv/dFENp8OTmP1qzTGq+MgWBj9hscZFN
         S78Q==
X-Forwarded-Encrypted: i=1; AFNElJ+OlgQEEbJfW8XixXJoMYh7SWu5dxeI6l0p8er5JBtBFN49SshzsBbs/Wrdxh/KSpXp8f1f4OIiLz2o@vger.kernel.org
X-Gm-Message-State: AOJu0YySjO67bbG57mnT5FSQCkDA7T/bMX5M1fDDkTQxnODj0Ftdk8kR
	Leis26UNP4pXgnCbZleLC0C5am4Ys6Y5S+wSkJJ1a5tF/nMjiQT7dQDK1CeDVj4g3yrSArIItGs
	EE4IwWN7dQVkKX0tll71kceTGuVnCqqw=
X-Gm-Gg: Acq92OEa0D4UgZ8ce1o87gM8uJcOYSVTSTkK9Dsh4tEtKT3nKCOgBEQLQyt0+CVrxZY
	WYZ6RQWksfUcLR0SQFlYe0ZLJQFa77YEnuH/W7CCbv74tm5Zc0TCyDZbfee1Q/XH4F1EpPuJBlP
	hKVegxRxTRUmyrKfgwgGye4Jgckm3pKdanvvFYpgGZoc/RlZHmvWNDW/pLwZGVOTHmahYSRqkcx
	ENejm/nzFq4lp2OPnhfPtnp12El6xflOzwugN96+rRtq/pwSl/qfjcpifr2FIWKhrBFagFK6ggy
	22vhGxSA35jN2kbH/IU9UNsIjGOt11FtZjF+jDnJ7plbVdU=
X-Received: by 2002:a05:600c:4e92:b0:48a:7aad:4425 with SMTP id
 5b1f17b1804b1-490a2901aefmr29792325e9.3.1780103785647; Fri, 29 May 2026
 18:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529213506.37462-1-jbishop.dev@gmail.com> <20260529220113.CABB41F00893@smtp.kernel.org>
In-Reply-To: <20260529220113.CABB41F00893@smtp.kernel.org>
From: Jeremiah Bishop <jbishop.dev@gmail.com>
Date: Fri, 29 May 2026 15:16:14 -1000
X-Gm-Features: AVHnY4J1EQplGx6EDAXNaim1X35PETCeRy45Nv7d4cYMfuCuj0QUrBJHVErQBa0
Message-ID: <CA+TTa56LOHAadhpVe0dcttVHHCp8m41bLLoO-DD+tLyCmLAVfg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: convert PXA USB bindings to YAML
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, and good catch.

ohci-pxa27x.c does indeed explicitly request vbus1, vbus2, and vbus3
regulators via devm_regulator_get(). I've added the corresponding
supply properties to the schema and will include the change in v2.

On Fri, May 29, 2026 at 12:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The `marvell,pxa-ohci.yaml` schema omits the `vbus1-supply`, `=
vbus2-supply`, and `vbus3-supply` properties but enforces `unevaluatedPrope=
rties: false`, which will cause valid device trees to fail schema validatio=
n.
> --
>
> commit 78f580ae03eab5d588221a2a8289471c77c1c517
> Author: Jeremiah Bishop <jbishop.dev@gmail.com>
>
> dt-bindings: usb: convert PXA USB bindings to YAML
>
> This commit converts the legacy pxa-usb.txt binding documentation to
> YAML schemas. It splits the documentation into marvell,pxa-ohci.yaml
> and marvell,pxa270-udc.yaml to provide machine-readable validation for
> both the host and device controllers.
>
> > diff --git a/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yam=
l b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
> > new file mode 100644
> > index 0000000000000..3f7935384b9f5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/marvell,pxa-ohci.yaml
> [ ... ]
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +
> > +unevaluatedProperties: false
>
> [Severity: Medium]
> Will this strict validation reject valid device trees that provide vbus
> regulators?
>
> The PXA OHCI driver in drivers/usb/host/ohci-pxa27x.c explicitly calls
> devm_regulator_get() for "vbus1", "vbus2", and "vbus3" for enabled ports.
> These requests resolve to the vbus1-supply, vbus2-supply, and vbus3-suppl=
y
> properties in the device tree.
>
> Because these properties are not defined in this schema or inherited from
> usb-hcd.yaml, and unevaluatedProperties is set to false, it appears that
> any device tree describing the vbus supplies will falsely fail the
> dt_binding_check validation.
>
> Could these supply properties be added to the schema to prevent validatio=
n
> errors for existing users?
>
> > +
> > +examples:
> > +  - |
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529213506.37=
462-1-jbishop.dev@gmail.com?part=3D1



--=20
Regards,
Jeremiah E. Bishop
