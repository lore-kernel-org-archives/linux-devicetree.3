Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72AA1AF0BB
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768871; cv=pass; b=Qi03IMBb7L6CZa4wyhorX2TN4xBIpTLvbuaFe/swwD5+HYyzBDQnzWPADhBPpqU88JLJ12GklUEFl/yitIYVncVxAeLCeE1+tYG+sfaWbCNCq9yWTzPjDMOCUsFZ4A3JGHR8GGlRNiFKtWZKRpks7lZ/gJf+TuISd4T4T6b1Uek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768871; c=relaxed/simple;
	bh=k2HzGmqyeadeBzQW8i+doTwWk61csXAnKcDwOMAX0GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKiw+Vk93Cakoe190Rn1Nrv2sCW9ChU0msoBMhsJTTuxgVhW+64un/oBK8JVi+bnX1yzPSC0QZWN2dvCInXJF+PUQ5BNoNawJFgW0coWHVMwIp1+pGsO4OzlftJb1KUqfe/ZJmNXnTRxnFWBaW4zbKoQl4WAFib8p+9Wwb9yv28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHD4XUFY; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHD4XUFY"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6de3360d905so1313679eaf.3
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 18:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768868; cv=none;
        d=google.com; s=arc-20260327;
        b=Vj9CIRcMUWdFMsMpz+I+Fy5+kqcVGVKggnKaQFC86xvH6arTUDSqe97hsxn3F/NMyU
         Pc5uO19FcmOgs/76UnPJGG0lqYZ56IEF1+fLj2Qi3FBYg4vmLWC9Nc9SijFAUpIc5fMh
         RvSyJIa6xL4FiJYgu9IOYf/J+XVtzQD92EXbI9H9iKmWV0sx2vQMoaVgXWzfoSUhF1P+
         edA2O9DJ5g6Jod4KuYwV/ivYr13/qZgYN9Oz1IzvXh2/WFIOiN7z7Q3xOBpZjwWz9hQd
         jDgYRezw5eXU87zmgREc+ea85/bzCKONIpM5fF8ZNuS/xW5uEQZzWgfNdp7Z20utDv+W
         AVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pDa+xMMOc/P3nrGCK4nQLiDZ2Nmx/iXraUyvbmKuLDc=;
        fh=1SMk90RmmGUHqOzb3kOuQ+skRjggTa10wlTRcZ7Ayms=;
        b=XymEJQlf5V1DgBEDyBy3/drhZYREgVl12UC5K2EZW90tRj/m0F9kmI0bJs/EU93/mZ
         89vOOG2GNrycEbKj/jDuaoS+IBE2twCaJ9Ci5rZcVdxyjoy4PO6KhlGSq1iAtvFBLoq7
         pxk2MAGiEpDBaXmilqUc2zf8wM3SEuulzw/t7+WnuBJwSrHTAfSvQn5AloqX62JL0Aej
         mLes/cLIfWZqiK5LneFtK9Uf8M5faJN/ZWtCK4KfCfGymj2qmsou67OF56hks6MK9M0I
         mU2jfypBgTVr4hdxUG9OS8QGLVJNodBGtEayz2I2XX26STm8TwJ3riKOAzdmW79eAMGd
         FJAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768868; x=1792373668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDa+xMMOc/P3nrGCK4nQLiDZ2Nmx/iXraUyvbmKuLDc=;
        b=AHD4XUFYDMngRPW7l4ht/3ozFUEfHb26ZlklT+/cWN8VLJuhHWAspgR8tNRt31vRWM
         7s/Kl7Se/2N8mvcB91lA65jMTly1fP/kFY6exRpGjx3u7Jcd3D7AFrO0WIYWsSlcICmu
         fXo+OjVX110rGjuSNaZLqfGJsZpChVSdXoBV+FdMli0vtYbXcgqa8s7j6LL4HZ00pD4z
         zbRQ/zQcjvIDKoB5rStrrbfDxJZNue66iNhWGvT6GmZHqbwPWluzgDYEjfAAyRwGtxzk
         pKR94GGfZjwnmckrtoaD3nfOty0c/zAWZNaEn898veJ4VupHOikhZ+9zDMXKPZ6IRadV
         M2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768868; x=1792373668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDa+xMMOc/P3nrGCK4nQLiDZ2Nmx/iXraUyvbmKuLDc=;
        b=Pc9/z1ZpkVTHl+qvcwDyj99jFhFL3HVxIiB4onnwdMBuNuYw1CDHUXvgIMvMyKgtkv
         6wWejaCGyAnuQVMkl03EIZwAaycXdVAzXpKOSwlHriEVJtdwuxAuaLzHsjgL9uYM8eKy
         J3T68Hixm282c61WqkBcBXE4ciQiI79ka1fvGAVIdcbF30n5mF49O+mXS2YykIEAXjeW
         fAWupNZm8Os+nLiZnXeMoXZBE22g/L+qxn1s28Dy+7WT2aAPb8PnOAi+QnRw2XEx1ic8
         7zlztuJ2JqImNdqa/VvxFjYOEeslzyDs5XSA+gvmjrBCGZSp6HTiO3A/SbdettSm2QOg
         qitA==
X-Forwarded-Encrypted: i=1; AKwUvBwhpQQ53QaYQLjrzTviqkleVE/UyAok8Y/M4OncKp4q6NPRwckDJ1FfamqYxUo+orbxex5XStAdNsmy@vger.kernel.org
X-Gm-Message-State: AFq9FYIh6Bf0qx3e0j1GrAbCq87K+16shFx/mvOrBrjsv35EjYlewkLn
	Q3Cg0EadvIrekhRSaX+ZmeV+0JQhq9YvmgPC56lyz5JgJRLCHVWsZVKIKsbU+EetAvry3EUHVBi
	1NyUflg+A1tXuwy7PzH/pFj3hEGFBiBY=
X-Gm-Gg: AYBFou1Fr4RInGbN2NCNl5g41w0nz0b7ayVyb6a9xn2tGkXlzPDpsBpRCflY1xvgAqk
	IDAhK08VqjqLNz36vx8PoZSa5AyRGofYKzN+jM1aFNtcqowLrHrOqz3pCMYO7SbAOBlloQV/oUp
	jmq5XPRreaA4nshkQZStvkMc8JGDxNLPhkawhzZasz7X3caILYa1LmP/PTE+XOsPXZpXodRwTm5
	X76oYwyH808Hzf0K16db2ue5APy0o2jHRUhw7wCI5i+qK9uX8Muv+sDrX62va0vW38MbHFvroV2
	QN0J5Y6/4cLJjGEH1EtNyToAoSRD94junQaQb8TxyaoSDdb4WBWdn2lAEIAjwQiehUo=
X-Received: by 2002:a05:6820:8187:b0:6da:4b62:b6b2 with SMTP id
 006d021491bc7-6ef0e6e5a0cmr5570778eaf.40.1791768867820; Sun, 11 Oct 2026
 18:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001230538.2751621-1-robh@kernel.org>
In-Reply-To: <20261001230538.2751621-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:34:16 -0500
X-Gm-Features: AclHuK9RPfsi9QYxKe1xshyF9l4fH-kCDWKjWiJN_CiVUkSbujLN4YSrez-akBg
Message-ID: <CABb+yY0WsGARMBkmyG_gbHexw0rYmdaBGEgomkARGF+3xEuSuQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: Convert hisilicon,hi3660-mbox to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:05=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Convert the hisilicon,hi3660-mbox binding to DT schema format. The
> binding and driver give no clue about what the 2 interrupts are, so more
> details can't be added.
>
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../mailbox/hisilicon,hi3660-mailbox.txt      | 51 -----------------
>  .../mailbox/hisilicon,hi3660-mbox.yaml        | 57 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,h=
i3660-mailbox.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,h=
i3660-mbox.yaml
>
> diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-m=
ailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mai=
lbox.txt
> deleted file mode 100644
> index ec2da5c9e647..000000000000
> --- a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.=
txt
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -Hisilicon Hi3660 Mailbox Controller
> -
> -Hisilicon Hi3660 mailbox controller supports up to 32 channels.  Message=
s
> -are passed between processors, including application & communication
> -processors, MCU, HIFI, etc.  Each channel is unidirectional and accessed
> -by using MMIO registers; it supports maximum to 8 words message.
> -
> -Controller
> -----------
> -
> -Required properties:
> -- compatible:          : Shall be "hisilicon,hi3660-mbox"
> -- reg:                 : Offset and length of the device's register set
> -- #mbox-cells:         : Must be 3
> -                         <&phandle channel dst_irq ack_irq>
> -                           phandle     : Label name of controller
> -                           channel     : Channel number
> -                           dst_irq     : Remote interrupt vector
> -                           ack_irq     : Local interrupt vector
> -
> -- interrupts:          : Contains the two IRQ lines for mailbox.
> -
> -Example:
> -
> -mailbox: mailbox@e896b000 {
> -       compatible =3D "hisilicon,hi3660-mbox";
> -       reg =3D <0x0 0xe896b000 0x0 0x1000>;
> -       interrupts =3D <0x0 0xc0 0x4>,
> -                    <0x0 0xc1 0x4>;
> -       #mbox-cells =3D <3>;
> -};
> -
> -Client
> -------
> -
> -Required properties:
> -- compatible           : See the client docs
> -- mboxes               : Standard property to specify a Mailbox
> -                         Cells must match 'mbox-cells' (See Controller d=
ocs above)
> -
> -Optional properties
> -- mbox-names           : Name given to channels seen in the 'mboxes' pro=
perty.
> -
> -Example:
> -
> -stub_clock: stub_clock@e896b500 {
> -       compatible =3D "hisilicon,hi3660-stub-clk";
> -       reg =3D <0x0 0xe896b500 0x0 0x0100>;
> -       #clock-cells =3D <1>;
> -       mboxes =3D <&mailbox 13 3 0>;
> -};
> diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-m=
box.yaml b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mbox.=
yaml
> new file mode 100644
> index 000000000000..c42ce576a029
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mbox.yam=
l
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hisilicon,hi3660-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hisilicon Hi3660 Mailbox Controller
> +
> +maintainers:
> +  - Wei Xu <xuwei5@hisilicon.com>
> +
> +description:
> +  Hisilicon Hi3660 mailbox controller supports up to 32 channels.  Messa=
ges
> +  are passed between processors, including application & communication
> +  processors, MCU, HIFI, etc.  Each channel is unidirectional and access=
ed
> +  by using MMIO registers; it supports maximum to 8 words message.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: hisilicon,hi3660-mbox
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: Mailbox interrupt vectors for message processing
> +    maxItems: 2
> +
> +  '#mbox-cells':
> +    description: >
> +      The cells content are as follows:
> +        - Channel number
> +        - Remote destination interrupt vector
> +        - Local ack interrupt vector
> +    const: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - '#mbox-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mailbox@e896b000 {
> +        compatible =3D "hisilicon,hi3660-mbox";
> +        reg =3D <0xe896b000 0x1000>;
> +        interrupts =3D <GIC_SPI 0xc0 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 0xc1 IRQ_TYPE_LEVEL_HIGH>;
> +        #mbox-cells =3D <3>;
> +    };
> --
> 2.53.0
>
Applied to mailbox/for-next

Thanks
Jassi
