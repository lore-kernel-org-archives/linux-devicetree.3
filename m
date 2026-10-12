Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1251F6FC5
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768891; cv=pass; b=PHxDWONYEL471JDzSIekbLe1Tji/HCePb/9fd4fKbVKbKcGGtlznOLEzmqeRCviRRlwMuvkntodYE++pl9HgZUpGHG+HFqtJpI/lzGeNyvCdKVheonT+aeKLOwgjPv9hoQME07eErbWMjiaM5z48OhJx9xTfM6YlRMDSuaqud1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768891; c=relaxed/simple;
	bh=qyHBCINY8BuIFSHWxGWlHH3StMfbaDeRJF3+IuIneyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m88G3VKEgMIP1gCT+Bo0rlCoZR9eOcjIRkzAGBNijCsH9PhuPqmyrxTHIdDc2u4e1z8pkpUoZgGyz/EfKiQQpSPoLk5tAG0RXn2sVS8zl4l5auSxKwc8+MfvqUpTYWi5vBSgIfVEJbeIj+5Xo2Vgad4pjAJQ6JycNwqxxtBQRrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSkxkcN4; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSkxkcN4"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-483d290f398so886232fac.2
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 18:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768889; cv=none;
        d=google.com; s=arc-20260327;
        b=gUmwNTYslCheG/1lOZpGR4/T4oGIW2MTdNm0kygK1MgLOYjRt0yV7+8nphvf8RDAbI
         T6+LOsvK5GHJIlvawKLvpeVaEeZaJaIvlH825pP1O4Zst43fQIltLtzy087iArQv07om
         r1W2KDh0olMSImEoY6PxSLJ6aPUxebo5zHbpj/oNMkqmxTy6jN3ykERs4sm3m0d3PdfU
         sfB0642UOkUkDHUAliWlkud5VEF1eYNmSgQ7pJGSU8KO05afoxdNZsoIpL8JlqrzednI
         j/E+e2USVLckFJ1fURYT36G+wZ5XGMzhQmE91Zanl0G2nejvcSwMTJggROaOtmLYpMBp
         lWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yd+VV6HCPCXSlFSdL5xbsRPgSPrExlGh9Pya53tbL44=;
        fh=7J7+4GZqY5rsSWSVG/N19pKM7t3TF4mxMkR6s6LjICI=;
        b=M3kvMmpCa5hzeB1dPpd8FyO78Xgo5xERvP67iVDjPxj5wbrq5mUsF4sMsMBWqN/rqm
         QKIrF2eny/+prF9jblTYv3y+mksUXIJj1zMmxIQ26g3iICkYiiVddqv1MwcvpFBgbBRR
         UQMviSS+UP3uVE6/toKe5PnAocN7UdgMt82Yl0MT8OUMhGiPKh4FIdlEHHqOnxrh291I
         NuQSQ7bB9+Rno1uLp1vX5P877qQKDE/utm8trPjAMGnyordVvdxPwQSTQ1b3/hUzGmWd
         JH6JyCXbo/Zj+8vrywk5CqeEiU2PRqzUmhiyuPenIw89fpK55mnfZF8wzKRTEOP4xop0
         rJIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768889; x=1792373689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yd+VV6HCPCXSlFSdL5xbsRPgSPrExlGh9Pya53tbL44=;
        b=iSkxkcN40y7VOeR4M4t3qOgjIZtp3pA4Qm4B/tT5KUP8gRDo4OF1NcdUvPV9WRBX2c
         Uux1biAMKEk9rgONYwVIxcF9efz8rfGZUHqCWZlnyRoKFfTy081bjeH8cqQelHGBMFwJ
         pMUDBhnHOtZYX5f8YIdUM+zrwJryV8purt5qMIGJLK0YtzUMKVbkd58vE65lFeowPHVK
         jGuyM/BdPaORk3JoeT2niOoZk5sJW5PaTnqCM1GMwbwUyF2BzHPApm+7qNpYfGOSyaro
         lg5IFt2ODRYPbn+nxNoscF06SYssKH3ssLEJSZilNJcaIwiC4Hhlat9Wgm8deW5h9qBt
         kBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768889; x=1792373689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yd+VV6HCPCXSlFSdL5xbsRPgSPrExlGh9Pya53tbL44=;
        b=RYmnqHdvFTrpK/tWlmu9yCjfliCqV5Iv00Qupr0/JUrrwB+J6Ys2qEA7rGtT6+uvFH
         JyhRIfLmYtndA4n6w0TFI2WfUUQQuF9962y/gw9KtLqdtK5NwB34iC7P3Nv5A/HA8Z91
         U2R/Njpsyg2W8JJ8fhOfwWmN9vOT591CzUVJrYuMWuEymqgrHuCwMztNpAuB3HPQpy5l
         XxrCSG9aHHz0SyIaAnEq7bZvOK5hz5Dsi0zFewd6BXGeTj7Eh+cqXUWVY5id2OJwpyKs
         RjbdSdi9BodIckjICql9idDwn0PPstSfij3VqC0DeqaIySycioqtGECyW5+f7zRurOer
         wgKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzNzm0Iw8DUuYakvlUDOylpTwafuhL5zVBph8izcUMNh9fLY0alpshHwPW6iYBhDp1epsxRv1FjB4t@vger.kernel.org
X-Gm-Message-State: AFq9FYKdHeQd9JWGpMVpSktMh0xtH+MjbOj4c2407LsvPnILOjCHpXrO
	7lKxZ2zp+LySN6g5qhWR4HJgJpN17vrtkd/+Eap8F13eqhJVW/0wAUn7xgK58ALyJVPYeuHcexg
	8NMZxhFpM1t1uJKFVeaHaTJTLh1BamVzPD6ObJ2g=
X-Gm-Gg: AYBFou3qAZ0wCtSPtKxyyWOt3r3zbfxxtv7CP8Ne7zNTWSHjANbE6JHxdDq5BPBpaCk
	lOdUwpKWjgSh23yxWmX9yk3ca+53ytwHuL70cHxhnzv8OaxVCouwBD4NEVDpf2XSLjddo6taxUP
	fZkARr9dbh+8I90abHhMjk7h5Ml5TQZ0sRDVATAFLuKJ0UShxum25A5Klnxe/x5dg/GAIJdzEyO
	y+/F3gLyT+68hWKkcR4RXEdYOPlpwvpLSoV8pKLc9nsr53+dTGP2UtXEvkxwSWP0+ReDwwPyuzO
	CStr6KbQbUALhlWdIHe5fNw+2TORdvdVAXmZmr5r/pO8Vnw11E5uejg=
X-Received: by 2002:a05:6808:1a02:b0:4f3:f7da:3e55 with SMTP id
 5614622812f47-50c56afda4cmr7587631b6e.62.1791768889038; Sun, 11 Oct 2026
 18:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001230547.2752114-1-robh@kernel.org>
In-Reply-To: <20261001230547.2752114-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:34:37 -0500
X-Gm-Features: AclHuK_cf01zBbe15tZZMxEgmQJZJDXkL40OgLYY1zsEOSoV-94elMUOv7zsFl0
Message-ID: <CABb+yY0OjXwfv2+S1zxqYKEtZean-=SNLjfUF_yS3cV6E9BfYg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: Convert hisilicon,hi6220-mbox to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:05=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Convert the hisilicon,hi6220-mbox binding to DT schema format. It's a
> straight forward conversion.
>
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../mailbox/hisilicon,hi6220-mailbox.txt      | 74 -------------------
>  .../mailbox/hisilicon,hi6220-mbox.yaml        | 63 ++++++++++++++++
>  2 files changed, 63 insertions(+), 74 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,h=
i6220-mailbox.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,h=
i6220-mbox.yaml
>
> diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-m=
ailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mai=
lbox.txt
> deleted file mode 100644
> index de9fbf722bee..000000000000
> --- a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.=
txt
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -Hisilicon Hi6220 Mailbox Driver
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> -
> -Hisilicon Hi6220 mailbox supports up to 32 channels. Each channel
> -is unidirectional with a maximum message size of 8 words. I/O is
> -performed using register access (there is no DMA) and the cell
> -raises an interrupt when messages are received.
> -
> -Mailbox Device Node:
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Required properties:
> ---------------------
> -- compatible:          Shall be "hisilicon,hi6220-mbox"
> -- reg:                 Contains the mailbox register address range (base
> -                       address and length); the first item is for IPC
> -                       registers, the second item is shared buffer for
> -                       slots.
> -- #mbox-cells:         Common mailbox binding property to identify the n=
umber
> -                       of cells required for the mailbox specifier. Must=
 be 3.
> -                       <&phandle slot_id dst_irq ack_irq>
> -                         phandle: Label name of mailbox controller
> -                         slot_id: Slot id used either for TX or RX
> -                         dst_irq: IRQ identifier index number which used=
 by MCU
> -                         ack_irq: IRQ identifier index number with gener=
ating a
> -                                  TX/RX interrupt to application process=
or,
> -                                  mailbox driver uses it to acknowledge =
interrupt
> -- interrupts:          Contains the interrupt information for the mailbo=
x
> -                       device. The format is dependent on which interrup=
t
> -                       controller the SoCs use.
> -
> -Optional Properties:
> ---------------------
> -- hi6220,mbox-tx-noirq: Property of MCU firmware's feature, so mailbox d=
river
> -                       use this flag to ask MCU to enable "automatic idl=
e
> -                       flag" mode or IRQ generated mode to acknowledge a=
 TX
> -                       completion.
> -
> -Example:
> ---------
> -
> -       mailbox: mailbox@f7510000 {
> -               compatible =3D "hisilicon,hi6220-mbox";
> -               reg =3D <0x0 0xf7510000 0x0 0x1000>, /* IPC_S */
> -                     <0x0 0x06dff800 0x0 0x0800>; /* Mailbox */
> -               interrupt-parent =3D <&gic>;
> -               interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> -               #mbox-cells =3D <3>;
> -       };
> -
> -
> -Mailbox client
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Required properties:
> ---------------------
> -- compatible:          Many (See the client docs).
> -- mboxes:              Standard property to specify a Mailbox
> -                       Cells must match 'mbox-cells' (See Mailbox Device=
 Node above).
> -
> -Optional Properties:
> ---------------------
> -- mbox-names:          Name given to channels seen in the 'mboxes' prope=
rty.
> -
> -Example:
> ---------
> -
> -       stub_clock: stub_clock {
> -               compatible =3D "hisilicon,hi6220-stub-clk";
> -               hisilicon,hi6220-clk-sram =3D <&sram>;
> -               #clock-cells =3D <1>;
> -               mbox-names =3D "mbox-tx", "mbox-rx";
> -               mboxes =3D <&mailbox 1 0 11>, <&mailbox 0 1 10>;
> -       };
> diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-m=
box.yaml b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mbox.=
yaml
> new file mode 100644
> index 000000000000..f4c8f1f29baa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mbox.yam=
l
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/hisilicon,hi6220-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hisilicon Hi6220 Mailbox Controller
> +
> +maintainers:
> +  - Wei Xu <xuwei5@hisilicon.com>
> +
> +description:
> +  Hisilicon Hi6220 mailbox supports up to 32 channels. Each channel is
> +  unidirectional with a maximum message size of 8 words. I/O is performe=
d using
> +  register access (there is no DMA) and the cell raises an interrupt whe=
n
> +  messages are received.
> +
> +properties:
> +  compatible:
> +    const: hisilicon,hi6220-mbox
> +
> +  reg:
> +    items:
> +      - description: IPC registers
> +      - description: Shared buffer for mailbox slots
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 3
> +    description: >
> +      The cells content are as follows:
> +        - Slot number
> +        - Remote destination interrupt vector
> +        - Local ack interrupt vector
> +
> +  hi6220,mbox-tx-noirq:
> +    description:
> +      Flag to request MCU to enable automatic idle flag mode instead of =
IRQ for
> +      TX completion.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mailbox@f7510000 {
> +        compatible =3D "hisilicon,hi6220-mbox";
> +        reg =3D <0xf7510000 0x1000>,
> +              <0x06dff800 0x0800>;
> +        interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +        #mbox-cells =3D <3>;
> +    };
> --
> 2.53.0
>
Applied to mailbox/for-next

Thanks
Jassi
