Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C8D3CB2FE
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084047; cv=pass; b=W9pSRavETACCWv8nYnr1OQ29ka6FvUkvA3j4MOgUW5UtDd04oBRS/H/DE4/LLJQB/ZPCOs12/BqWvFManfQu1bxqL9Y+UJD4o5rBhqkWBVTGYGaX7r/5nO5eJQrWolyhRh0+yiBSfq5M4rXNt4mlzj/Ozrtel7kPSuTY2SXn1po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084047; c=relaxed/simple;
	bh=TEdCx4Ul4BPkVidIQLKMS6KkTXZps8JZ9GJQJ87hLI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7F+Olm6fEsbWSY/RBeoqqzgHhmZZjq+HGPw6G52Dnk4NBq7Qz/4MTx02EQlx1J1n5iFZ8BnYTU/x0/cw/swClpFcHnyBt1FAh6Q0dFP+UNaUPsB2HNKz59yQZLXn9mmkV3Wx9QdtqWYZysaZrOIhSa7adCYn8jtscapeiMN26c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O48KkhDw; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O48KkhDw"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-307263ad0cbso8983171eec.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 02:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781084045; cv=none;
        d=google.com; s=arc-20240605;
        b=aJpTUZNofdXtIcajYTjHeL0lu3kq93Si97+bf0rZ7xcifPqUJY75lE4q5H70DwuK5r
         9uizTJcaxSknbTzKlge1vBSajosZ5Guy+ZDo14m2kodIsJ24Qu7t1w6rp17gX6E+fqH7
         ejRnSHv37vQW5ReyZ7r4l/gARRZPipkUl83F01B3S9SNOjZ2xnwXDlAJb0aG8abdOjuy
         JYdBKb0niKTOB46CMPJfIL4TkV+JXSBdf2or29daTtP9BEfwPSgPShWiwo5O+IVC/xwl
         5T3hyhinXtIU8GOdMZOn23aK9KeXLGpJLc2OclEK3tlodH2K9H1xcVVrQkBgjybpbMG/
         MDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I/WBNx7vmi5VT9dRS7lbKabVM89kwH/AFfI7EJS7Ghw=;
        fh=VMy8Y/F6zWgcPPlVygqzyIezHCxeDiGdt3gDdywINok=;
        b=da0FMjJZp9Hxqk1jDMOsYguMFb0xp0mnZzOcaW/w4NH/nOXu2UW1/IPLa23NIdg3o8
         Zs0h6SQoTGguBQlj8kILqKfACLzAfyH+Ba1OQ/UgSYhiQy0LCyGusfHF+GLw3TCquQ8u
         owOdlkkxb+qySJjLseIyMGQs5z2CAT9AucvtqlPpsjrUZcbDDt6oKzN+tS707UsXJi+A
         igyMIoN6CjYVH5MCNWysfda/GbKfArq9unZI3+d/9H3JFtVFGO4qOoWHPX2akXMRYxNt
         lNR5LR1b9M4d20/M+HktzPdUW1CZOpOpChkHH2nAIUVKyms8LWRY+VPOmktKpKFf63zK
         mTsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781084045; x=1781688845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/WBNx7vmi5VT9dRS7lbKabVM89kwH/AFfI7EJS7Ghw=;
        b=O48KkhDw4b9ie38dSOwhENbOhrKFtAC9GMzhH5sNlNAUv7HMI2IlSijZhcpI98us/o
         DYdZ0rxjcBsXb48g/PYWEZ78JaefrT0mzytZlBBabznYv6VC9LJYZL4t5ZuvqJWh1xE6
         by0Lyhk2R18ojiBi/MX2XC9Jm0RDJ8H3OelBW9ua1Xrq84tuw0iKurPciNNQMczRMaNZ
         1afo/wQ6fr43ySzDaYqgVmqIDV1XV1rkVLScsWilGGN17NOq44srPbMf7f/6RU1K9Vot
         jL/Jmcxqj44P/p21JKikTJhAvy458fhkpNGaX6w5RaqtdPwRXTtVutkueUmgWbGc/QxU
         BotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781084045; x=1781688845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I/WBNx7vmi5VT9dRS7lbKabVM89kwH/AFfI7EJS7Ghw=;
        b=kI8ZPAP8BNxwZAKRoYs4ppLIQQGwmlI0kF70zPsl9wjccqSH/GD4XxAWP0wv7tb1Ac
         T8xy6OhLd5on3fXrO/TS35mHk4iSh00VJ4MG654skAFbrzmI1EGmFX2H/1RmMJJ0sj/9
         HDQBNlprYg+LfzLsv0dpAqSeE1y38GfQH4Ls2c7Ppp6ZK+QDcRk3uCRNHDoqbdRbBUUf
         pJDBY6z+yUjnDWu6640yz8nrGHGaXbCp0Hss+wgq0QguYw+2ZDsOs9SjHfI1lRO9cKV7
         9yl1uCqCQBEpoz3obcFp74L1I3Z9R2O9czUO+Ga/cBb9UHaX/Hy1j8vOQuoQlKnvz5rY
         VchA==
X-Forwarded-Encrypted: i=1; AFNElJ8L0HizpCIYDRBAakz4jY9Hn7gYfjH6GAZ+BBomGO/VmD5dhWJWMArO8o41LIMj5gPrIFhubUanlZcy@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdv+Cg5xU95Y7/P/LP+8/hTq3PQ+o5zOe8ItGegvSdyX37L0A8
	t+4VBwMRlQwSSfmyDgADp/AvmlFCThltcmYde/nIKMuwOy3+b/D6W1DgsGTBxmYdvIqLJTBsIzN
	b3ThuiKkLalVJwSFISdfcjLdo6lyLGL0=
X-Gm-Gg: Acq92OFqS7whAvyfjM93+UfAlWeH959t9qe71BdgusbzOBlYIarUuac/ahexR6h3xVl
	zIBfR4MW6kPo1HWZ7lOJztW91BVovN9oi5IGAoJBDxrCo1kqbto7DysxBjV6ApF3PSvfT92UHlB
	IjMCsH3wnCN5aMXb7JyIohYWXm5D5rKVLu3XMotx3b1fc9RKfh7sx+1tb4cCWTVHiKV53t0pBLD
	oezQzHSjx5vuylhmplG5yDpjlSHYcST5ni40CNuIpwqslMqQsdUVFn6Af0nMtHrACfADfprDMM5
	hP+KLZoXrAkzj5CD0kbzkV0SKSM8fCn6oIDYbI5wfTNw0RLNzxHMy+D6y+0LcGfUilq2WWKU6nQ
	CNto=
X-Received: by 2002:a05:7301:22a3:b0:2c1:7793:7bbb with SMTP id
 5a478bee46e88-3077b2615bamr15346976eec.27.1781084045265; Wed, 10 Jun 2026
 02:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
 <20260607234343.22109-2-kimjinseob88@gmail.com> <20260609-glacial-colossal-38b4937ec620@spud>
In-Reply-To: <20260609-glacial-colossal-38b4937ec620@spud>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Wed, 10 Jun 2026 18:33:54 +0900
X-Gm-Features: AVVi8CeIpvFBux1wEAZY6Bff68TrrIEZ3OnIKWyWrYDouz-MKRCStpTldHFDGGg
Message-ID: <CALMSew+cL0_kG6W15RapxLtE+Fw2_DYdrYoRFSjENQktWw2H4Q@mail.gmail.com>
Subject: Re: [PATCH RFC v4 1/6] dt-bindings: iio: add Open Sensor Fusion device
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Do you think it makes sense to permit a regulator here, so that the
> "host" OS can power on/off the board running the osf stack?

From the OSF hardware side, yes, that makes sense.

The current prototype used for testing is powered independently, but an OSF
device may also be integrated as a host-powered UART peripheral. In that ca=
se
allowing the host to control the board supply through an optional regulator
would be useful.

Unless the IIO side prefers otherwise, I will add an optional supply proper=
ty
to the binding and matching optional regulator handling in the driver in th=
e
next revision.

Jinseob


2026=EB=85=84 6=EC=9B=94 10=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 1:19, C=
onor Dooley <conor@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Jonathan/IIO folks,
>
> On Mon, Jun 08, 2026 at 08:43:38AM +0900, Jinseob Kim wrote:
>
> > diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf=
.yaml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> > new file mode 100644
> > index 000000000..a4049715a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/opensensorfusion,osf.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Open Sensor Fusion Sensor Aggregation Hub
> > +
> > +maintainers:
> > +  - Jinseob Kim <kimjinseob88@gmail.com>
> > +
> > +description: |
> > +  Open Sensor Fusion is a sensor aggregation hub. The hub exposes an O=
SF
> > +  protocol data stream over its host interface and may report capabili=
ties and
> > +  samples for multiple sensor classes. The Linux driver discovers the =
actual
> > +  sensor channels from OSF capability reports instead of describing th=
ose
> > +  sensors in Device Tree.
> > +
> > +  Open Sensor Fusion is not a generic industry standard. Public projec=
t
> > +  documentation is available at:
> > +
> > +    https://github.com/opensensorfusion
> > +
> > +allOf:
> > +  - $ref: /schemas/serial/serial-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: opensensorfusion,osf
> > +
> > +required:
> > +  - compatible
>
> Do you think it makes sense to permit a regulator here, so that the
> "host" OS can power on/off the board running the osf stack?
>
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    serial {
> > +        sensor {
> > +            compatible =3D "opensensorfusion,osf";
> > +        };
> > +    };
> > +...
