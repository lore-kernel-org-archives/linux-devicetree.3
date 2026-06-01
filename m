Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F236682A
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303643; cv=pass; b=i7AE4bycnP1uVCe4JQjFQ8gcmxLLvXxvDJf9792XMB42p1BLdLiPoXFZKn6DPdzDcc/6LhrzyxYAZcltTcK1zaUPHIWQ4/eGZHGYKnTEFs/HNgLUcVE0fAi7Gxrat+zcaz3uN8OrMEU2gKCs138mM/swohfxsScDxEbK72DNSK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303643; c=relaxed/simple;
	bh=Lz48MYucWeck+gFRGbDt33LqAo8mtb/f0FIeJwdCjaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGGst4n7kxXw/3Qx+vDnYoFRNi1MsIsk7likJiX/sdLzc+/v4wQW3JlCwSHRg8okHNKivxw8x8u90UhwikFQV7+S33uRXV1A4IjKPIizMDA963fsNTzo9vp8OaSAC5jESAVrUCcKEzmSVRBGDCuB7xgdt0TNwF5sxc6650Q/yvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBcM8gp/; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBcM8gp/"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-91550eced6bso140149685a.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 01:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780303641; cv=none;
        d=google.com; s=arc-20240605;
        b=fUWFc4a/FV8v1bEjyqIoHuBWFMXCIbyI9dpVhTbVy9mMJB1svAkcFDI0RX6ie37Djc
         ySwu3z+bmnOTGhNlxVpgeYA3aR6QXlQeaAyioCUduLIzCIwQK114+IKmzhqw3eFEoFTz
         YZfmJsoCJjikkZ3goWTvqm2gnLQCHbNs50X7C08ICFsuRtsGbdJkSJFWYZtXlz3nMJfM
         sMQDZZXbdZtKxe0gpcKR40q4SGIAbusXQCwxi7i6AUojGKxKtKBWUNgY5h1AlivBJj3d
         9sqhAlkr4NreSUVku3woJL9W7TXMrUKxt8Wnbmc2jn4LLGxBZi6m9L4JlWskI9sgHyeF
         fqYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CKxWnwT4qMFwN6R1bhhj9rNzN+v9rhOvJPe8dtaWsgM=;
        fh=xFY/NWcB/S0uZX62UCecZCCIwYVlpfJXTCv0ir8fI4Q=;
        b=LooPty9P73LkH+GFk1AfL6jB5uZAaxsQgO5s8SG84AxBGWjWdh5jC6GmtfUWdbDx0l
         jdDC2yBC0MtoRRX7Q+mPU9Faq9iprY5xqkDs+j4GyIldBkJYjpj51jlvbZJ737Q3w0mX
         L1DbdkpMWdUkUACB1Sjd5bK2WW6dwv1TJQH6vrDuJ8gSUjDYOZHKTgOudzAkScjiuI/V
         Vx2ld8lpSsvW7iVw2OLOoeDvRPrg4pFsomlpj+aJIz4thMrvXq2EfRc+qXsBXnUwZW+M
         o7MOyT3GFWwPOTi7nzIQYr22rpBdJNWYGDNtxbEknP3Vo97w/gUeaylolEIlFHepGBjm
         dlsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303641; x=1780908441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKxWnwT4qMFwN6R1bhhj9rNzN+v9rhOvJPe8dtaWsgM=;
        b=RBcM8gp/YI4K1rCXtgV7jMztswwfmoorvKQch++/6z757+E/lovWGY0sM2pEFjdUWQ
         uM82Y+Z0fpTcqka+jdQU+r43FKXwo50YEbzo5Racg+mZh01aIyBsNFGLzsJXbEb3RCIh
         rIMB/xFcguFCSzRB7oH6E9twQQp23MY4b12oAm8kT3kOLAWJgdIP2dItaPYnn5pmc33u
         BRiaibmx+kGU2n3mHgtOBdIfvu3h6hCkdbcgqku36oyataHe/1horqP+I9V0v71t9/bc
         VNZkdl293b0rboQC1p5Yh5nEAF/gTaCYvAlE0X+NHiw3jeybBMHps+WZgdg0Tq43DAoY
         KTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303641; x=1780908441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CKxWnwT4qMFwN6R1bhhj9rNzN+v9rhOvJPe8dtaWsgM=;
        b=aYhXmPyef5WWa0HHVEHs/yb/vcIpVxFsJxmOO/7ISrYhlLKFzUaT6Xb2cicjoCTQLf
         MIx2J2ufk7sfHBtV+h89MjzKExKZHbKtWQK6aX7lyvrnmYZGFVcYfDSXxXUzEOoxf2Uk
         mNUluMsrDa79ceBYHDY9upQR1r9WCqPWawHv1mZ63ZAwjr/DDp1dONGUKU48ZjyTAw+S
         QIgyM59uhFEuxDHrC59pxnQdWG9xR7VQFEmXoDAqcT//KEf6uykS86pvQCC34UcpEHzA
         VxXWPfAYrbR+zM9OuIG8HR44Tcd1Y/IFNX6IBxqA3FnsYKe3cQpTSMe8QObDSFnz36JR
         9trQ==
X-Forwarded-Encrypted: i=1; AFNElJ+c3W7Xk1QGkKgJzjdrbQaTNDqq9/e38splWCUmyoVjU8VL1B2JvFuHaCnEWBWw7PtYLf/0Eq2Vr5Xw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx76bUjvR/O7DJxQbhXoFkZn7Cfva4CYM2Fw3TWiB9qarjheTzU
	j+w7trqS0NyOg+KqPq7QTF0TnJ3Dv5tNpqkZFWSrntOf8g5omRRQ/63G3b4yxWTPXucHGt+zkbV
	Dw8plCN0MH+4NqO7za6pbeew/2Hen3x8=
X-Gm-Gg: Acq92OF+Y5gtL0fYLr7fbH0x8MVGzdxq6rmK14/fF2gxnYAlaIHagNjVnYqKORqnM0A
	NrxxRiQ4DWioWfmA7mZ5AzV9gmbunZHIFDOGLjzFdmBspZKxCxVfzvSCzoQnPXw+oKH2Ofqhxes
	Mi8SGek64yE4MhuBjqivRMXeGIu24n6Z6yM8XcZPTzHqsAM4msyOGZ1ThL0UbVh/RScuqNdre55
	mkxQJ++yExAqLR4QtgoNys6FjND+BhfXagWWDVq9YY40omaZcCZ9Xff0An8QlGY7lc8aCfO4Zu2
	aftRAGyYbkAYt7vt/0xnBl9Wj0SrQr/60XdOHk/YmcIME72tiCk=
X-Received: by 2002:a05:622a:40cd:b0:50e:60d7:b272 with SMTP id
 d75a77b69052e-5173a7d90c7mr140328351cf.41.1780303641295; Mon, 01 Jun 2026
 01:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531171612.4536-1-challauday369@gmail.com>
In-Reply-To: <20260531171612.4536-1-challauday369@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 1 Jun 2026 12:47:12 +0400
X-Gm-Features: AVHnY4LqPWs8S4bKdnrdtTTPlTNYLqcvCvtLLp-8xKNVLphnJsWYHcJKSd7K0Fg
Message-ID: <CABjd4YxF52YZHkbF1C+cfXkiU4LW0PTNHyEDayKn-mvk6u42Og@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: vt8500: via,vt8500-pmc: Convert to
 DT Schema
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: krzk@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 9:16=E2=80=AFPM Udaya Kiran Challa
<challauday369@gmail.com> wrote:
>
> Convert the VIA/Wondermedia VT8500 Power Management controller binding
> from the legacy text format to DT schema.
>
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
> Changelog:
> Changes since v1:
> - Make child node binding constrained
> - Fix example to include the clock container node
> - Fix maintainers list
>
> Link to v1:https://lore.kernel.org/all/20260524110047.37590-1-challauday3=
69@gmail.com/
> ---
>  .../bindings/arm/vt8500/via,vt8500-pmc.txt    | 13 -----
>  .../bindings/arm/vt8500/via,vt8500-pmc.yaml   | 53 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/vt8500/via,vt85=
00-pmc.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/vt8500/via,vt85=
00-pmc.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.=
txt b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt
> deleted file mode 100644
> index 521b9c7de933..000000000000
> --- a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -VIA/Wondermedia VT8500 Power Management Controller
> ------------------------------------------------------
> -
> -Required properties:
> -- compatible : "via,vt8500-pmc"
> -- reg : Should contain 1 register ranges(address and length)
> -
> -Example:
> -
> -       pmc@d8130000 {
> -               compatible =3D "via,vt8500-pmc";
> -               reg =3D <0xd8130000 0x1000>;
> -       };
> diff --git a/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.=
yaml b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml
> new file mode 100644
> index 000000000000..e340281e5726
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/vt8500/via,vt8500-pmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VIA/Wondermedia VT8500 Power Management Controller
> +
> +maintainers:
> +  - Alexey Charkov <alchark@gmail.com>
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +
> +description:
> +  The VIA/Wondermedia Power Management Controller provides register acce=
ss for
> +  clock and power management functions on VT8500 and WM8xxx series SoCs.
> +
> +properties:
> +  compatible:
> +    const: via,vt8500-pmc

Each SoC version had different registers within the PMC node (even
though key components such as the OS timer and reset control kept the
same offsets and function). So this really should be a SoC-versioned
enum rather than a single "compatible", as they were never really
mutually compatible (despite what current DTs say).

> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    type: object
> +    description: Container node for VT8500/WM8xxx clock provider nodes.
> +    properties:
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 0
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"

#address-cells and #size-cells are automatically required once the
subnodes have regs, so it seems that this whole section could become
just "clocks: true" with no particular loss of meaning.

> +    additionalProperties: true

If the PMC binding ends up separate from the clock control bindings
(which I'm somewhat skeptical of, see [1]), shouldn't the subnodes of
this clocks node be explicitly specified to follow that binding? The
fixed 25 MHz reference clock is not part of the PMC and doesn't belong
there (despite what current device trees contain), but the rest do.

[1] https://lore.kernel.org/all/CABjd4YzJoHrx1suMbhNvrMP+X=3Dd=3DthvXYwSY=
=3DUD-4Qy=3D7-qmjw@mail.gmail.com/

Best regards,
Alexey

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmc@d8130000 {
> +        compatible =3D "via,vt8500-pmc";
> +        reg =3D <0xd8130000 0x1000>;
> +
> +        clocks {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +        };
> +    };
> --
> 2.43.0
