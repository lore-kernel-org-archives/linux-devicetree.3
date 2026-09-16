Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D344AA018
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553567; cv=pass; b=H9f0/qoHlFeVbnAlILMJp0FZEZqgl7/ZR4fFF4dvSEZVMibta0b6Ja1Jny3PwbrrE3RUfnFvJZS/83Cee1uVcpZ90M18cKVh6xEQyUPjAGx77QGBlAOvcYpoQvR9illWTuA3UGnto3gT0a00cvE79YkE8IgLHgcJuO0kjLjpN8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553567; c=relaxed/simple;
	bh=FcMZAWu6Pl4djj9zhAk6RGVFzPCsFGY0WGARMV3Tby8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gT01ZTmMCyqLvlE8k9Y8smIABAQkbFyVjcE4gxqW7jNS1ysaKyZirmaRuT7u2lD2L/ceZKbrzPWJh7tmiTfY3Gcv72YonnKlhJMSp8dJXBRta1RaQLw+bVbaZnGZsPaFx7lYII2spty25e0lwppQnnfPUC/kvpJdgSxLkGD75AI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=oT2Dsa4y; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="oT2Dsa4y"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso5608705e9.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 03:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789553550; cv=none;
        d=google.com; s=arc-20260327;
        b=M6DlAbqN98RoPjhOp4XQLQVLRk8SfAgGoPfVdnesXKhJiilfNCFAAZBRAF4WkRTG4m
         4uDSks/UNuP+AoCDyxDWljUiqijI5rVGVbEURcvqEVdomm6efv3t/8xyc0nB/iHuh363
         CjX8rd6ilwbAIi4v5LT6dYfG14MZcocGRswNUlO+dSB59Piw7a2hXUToX55bgN1q3Q58
         z0InxCeizHlmcys4jxg1bO6fBrIXf83l3wNjt88Bro4JJkD2Coov5PJ/fKBS3yCbN8AZ
         OeXQVqKwu0JGfapdLxHHnbaTum4R30n8YHRnHaO/H0H8UGLwmbHcE0bXlOTrdOhT5/kt
         KgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMvnu6Q+bhTIDoi1lbqTiSXnAgA138OR2uRiPsRsuJs=;
        fh=TlfHv7ZvHKf4oMBZLS+mRS2r7rT8SWG7Py/YD5cp/vw=;
        b=IkWwouslQIurLI0qscnSl+rPCIud/ik9YT0uCEVcY3/HY7k1H/A9hFg685WylPMtxA
         d5dO+pOZwc06vTK8EFw765Dy4wfx2aMcN3p5oFcHAKop3l1djzjsagi7T7+e+LxykLmt
         ppy0qxkgHgXWZgSF3byWqyP7ZdXqZeyB3Tb7UwLpSn0kSMq/o4MmBSdgL09VnqR6MBDS
         wkKczKuXsH4RD30Q24Pk8JywJjUosuA394UoIjD/WvTpv2ZnYQkVFJQbUVFHl6XxnMQ8
         RQt1TlSmfMI2sZKdGlbhQgmGgwpfdaVug942gW3PeqNY4oCRiRqeWYI/HDjWQGz5j7VC
         vDuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789553550; x=1790158350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMvnu6Q+bhTIDoi1lbqTiSXnAgA138OR2uRiPsRsuJs=;
        b=oT2Dsa4yx3+dHLscDy3ZY+lSwK7V6pmb0dHhdUF8HM+3ZVgBjSm5S+jBPGPziqCFvh
         nefhVwCCwfX/abaqccUI2fEOs62vVSyIU6nn1+ms3l+bt5g1ibRnxAgSeK718Ck8Fe7A
         5OGxkQkrTHvP3DNmZ5Z1xXI63GelHMN+F7SD9DMmRqHEecivXvoHF9FqoYfGquN6YSQ+
         ji9SE1sUqEF+s29lfcSPXjYKJFxngsIEyWEs6xvc/RsO4+7MisNtv2/6/k+2d05fAGzQ
         fbGs4NaaYgXRtpxSV3JrrrWq4gVs/T0OOCDTUbgyBq4y+1OLUhZEOq8taGzt0eC7nWt1
         WAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553550; x=1790158350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMvnu6Q+bhTIDoi1lbqTiSXnAgA138OR2uRiPsRsuJs=;
        b=tW6u7P15l7gdR2Bl2BNqFywCYcPfBs0UUqVDlMlmCpsCvcYocrIjloNms3D7dzRNOX
         fjbBUTzFkfvaInFDhGBe8JPNFnTLTE4bHWYlTTymX0vA4fzzkzy4xMqY07XJ/a11rlVI
         JWkR/EfwvjMCHs7gvPn/Cw3Tt0kY/JSsL2w6pwprhjq5guX7909xErokjwTIDjaPef+3
         2dzLJcPURzRQqIg8YHSLWNehvGA8vTH3Q3ubBmm/EI2TeDXVYD9Br9weD9kcI7KI/G6z
         FMACgusvVLsnUtH3wF+0cQN4ohQbIopYz51rEo5UggLUIskgSJMCxozzFeoIEWMSgwo5
         9qtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMvYJQLQ1OUyBzk6WqpAoqxKChmOHBXYrV/OxpY6w6skkFmFQRiW1qDCIKSH66PKsOHSJJyxeqkbs0@vger.kernel.org
X-Gm-Message-State: AFuF++mWQVs0sArajqVx+iqjd3ba4gjWZaN8gtUn8nFaeATCZG2H05Uw
	s0Lh263zwyT39lvX3nu0d9u8lNi5DvIRc3DtMZUcmdtX35awaS9Ybn3hj7I7uTBZC0zsAWAsp/U
	EEsGNW1yY3+QbLeR5wBnGhVhINVOjnlwqduPNz4ah3A==
X-Gm-Gg: AYBFou1rvpJbiGRVhT/dD0AMovbo3dLm2gVBZimuWdWQfk75hS2/3iFmmz47QJph6H4
	1TeV5FkJP++ly8pQL7zt3iX0L1RXNEl+opI66BJzuiLfqus+7MiDWH1G6cz8EGi7Ila8A32Os/w
	Xv6WDovvR30mbyfSjrcmXOuTHO9VDU+uC54FW++31o+FMCrESS0oaIqas7TeuoCEwezHbuqXo33
	Gqe/qEA6/KN4nF45kAB3TEi+ijJroFMN9rW0wUwpNBYWr0XuXB4r7aNP5ygWLa5SQVeBAQd4g1G
	H85DdE5EEVtlq3XovtNA6zFUsmodqlH7Zr1gYdHbkOtD5cOBXLbT3fAm/logC8CxcUNtiGRQ5Gi
	Hchm+SC8kFcrfB8lGD4ABE/NPQy2qJTYjmtfH4EdiBRmLBpG5yEPcvoAnLsQQJFBT5RS7W5x1U3
	0=
X-Received: by 2002:a05:600c:1986:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-49ea528e2f5mr24120835e9.0.1789553548884; Wed, 16 Sep 2026
 03:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Sep 2026 15:42:16 +0530
X-Gm-Features: AcwNN1XhJcdypVFFKePBGQrRcccPnauqo1pQsJ8HQwZetdLhE4E6-eyGGrD9-yI
Message-ID: <CAAhSdy3Or_uDWuQniUGguc9AwL8smF6XHhJ0kizFOJKJ0N+9OA@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] dt-bindings: tee: add RISC-V RPMI TEE transport
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 3:45=E2=80=AFPM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Add a device-tree binding for the OP-TEE RISC-V transport using the RPMI
> TEE service group over SBI MPXY.
>
> Describe one mailbox channel per hart and an optional interrupt used as
> the availability doorbell for asynchronous notifications.
>
> Add the binding to the existing OP-TEE MAINTAINERS entry.
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
>  .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          | 65 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 66 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.ya=
ml b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
> new file mode 100644
> index 000000000000..8f6ff313fd42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/tee/riscv,rpmi-mpxy-tee.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI TEE service group based message proxy
> +
> +maintainers:
> +  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a messagin=
g
> +  protocol which is modular and extensible. The supervisor software can
> +  send/receive RPMI messages via the SBI MPXY extension [2] or some dedi=
cated
> +  supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines a TEE service group which is the RI=
SC-V
> +  analog of Arm FF-A: OP-TEE and the rich execution environment (REE, i.=
e.
> +  Linux) are peer endpoints and the RPMI framework (machine mode firmwar=
e)
> +  mediates every message. Entering OP-TEE on a hart runs it on that hart=
 until
> +  it responds, so the SBI implementation provides one SBI MPXY channel p=
er
> +  hart; all of them are listed, in hart order, on a single node.
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  References
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    const: riscv,rpmi-mpxy-tee
> +
> +  mboxes:
> +    minItems: 1
> +    description:
> +      One SBI MPXY channel implementing the RPMI TEE service group per h=
art,
> +      listed in the same order as the CPU nodes.

I am not sure why you need separate MPXY channel per hart. The MPXY shared
memory is already per-hart whereas the MPXY channel will be doman specific
for TEE.

Also, for this binding refererring to only mailbox channel is
sufficient. The underlying
mechanism to send RPMI messages is abstracted away by the mailbox controlle=
r
driver.

> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Availability doorbell raised by OP-TEE to signal asynchronous
> +      notifications over the RPMI TEE signal bus. Optional; when absent
> +      asynchronous notification is disabled.
> +
> +required:
> +  - compatible
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tee {
> +        compatible =3D "riscv,rpmi-mpxy-tee";

This must be "riscv,rpmi-tee" based on above comments.

> +        mboxes =3D <&mpxy_mbox 0x10 0x0>, <&mpxy_mbox 0x11 0x0>;

Like mentioned above, only one mailbox channel is sufficient.

> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 207a6e2db70c..7d0e550085b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20577,6 +20577,7 @@ M:      Jens Wiklander <jenswi@kernel.org>
>  L:     op-tee@lists.trustedfirmware.org (moderated for non-subscribers)
>  S:     Maintained
>  F:     Documentation/ABI/testing/sysfs-bus-optee-devices
> +F:     Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
>  F:     drivers/tee/optee/
>
>  OP-TEE RANDOM NUMBER GENERATOR (RNG) DRIVER
>
> --
> 2.34.1
>

Regards,
Anup
