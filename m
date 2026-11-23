Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795426329;
	b=D7EmAXAeuYAryvdj6XJopa5eZoxkUUbpT6BptXm0noM3g53u5q81VyMSjuGs4TNHs7tk
	 SJ6xI1AL8dS8gtqDh/+Ee5fF54SAdtvXM01AqMBJYtjVGUECwvBHW4tNhRMYM0JUrfVUa
	 CcfjhfxiUrtZxMKYlwrMztL/9x5lt2nmPcbF5wtaUpY0zPQwy6Oi4d8RfaouAEfT/uW3N
	 1zmeAiNNJY43DisRqu7POqrd+2dviBekx5KqDSD24kbDIsa/6vg+PdjB3+rV7yE0SEJEx
	 U8ofbfWNTLqliUXihfsydLAa4dPXI/AyXTTsaQ/nzIowo9hhPn2Url1q0DcJI/lwhFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JqaNNY8+fBRcbsHJnnz48qA9IbD7DLdSU3+18Z2kgkk=;
	b=ty/yPFAyq4peTaakUsT/ure3MLk6cec9W+fggexyToifWQ9bg8xd6a1adSRq1zTx5Ow/
	 T2K0C3QzH+3J+/SudrPiEOtin/hJzC0VlPxgZ4p4lt3QYf2f8eLEgmxrtqyXpeKN92a2z
	 3GNGIe5rbJ/yU7DEEFb0mlIbhXlKvP36beMDIl56F+3UyGy3Bi+/81ik5n78QW8C4chhT
	 y3JuvBqbqc7eeCQjixH1L+ZtUKyEMBYI6lO/7/Cq6SQzWIiHincMO0/OS8yILLQaSLYle
	 8OhJ4sa6plh8xz/60Qa3As+TJvmycdp2Z9FK8l94kAcHlqJzib92AC9ZCxKZNw439UQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=imfeXxH6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7AC606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C7AC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=imfeXxH6
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5126505cb3so385474366b.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:32:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795426327; cv=none;
        d=google.com; s=arc-20260327;
        b=TfbVaHw2qrPUx4vMvbKrFq9lmxEk4P+i60wMG5iZRh6XgnI6ZQ2WOmaCJ1EM6j5R+l
         j164QmEHBxt6TX2h0vBtZ3g/TvcSAwbPBTyd3k004MT3HcH8gpx7wt8CopJIOHmRoK15
         HEKMM0E63ZRVhBnEjWr5N2oIyKm/WMuPJcMg+D6a49fSZNlNoKydybh+g2L6K5HrSjrp
         HRlfEJF3vIvX4Sa7LonGEzBbzvip4ycxNk4mV5xfSG+986labCLzy/YovPC5HpKzi76v
         eWGZ0xEhQp1zIGUR6PmCFMbIruoNVY/McOF7GgrQtZKNfEYy+NdnXw3S+y6tu7JzkpxK
         jVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JqaNNY8+fBRcbsHJnnz48qA9IbD7DLdSU3+18Z2kgkk=;
        fh=8xIgUSxyW4Q6tpOGaFJYM9WMpEvOO1IExOrTHSRFhvU=;
        b=hXIIMz35XEfAhSIXUzXdNuEsLkGHA4VwRy1EF1JBQHQ1SNSE3pcrrHHIyAi0HTNecl
         d4T0mIay9Cy3QEuD0Eo1/dpg61FOWI4jdGsm402aTOgy2IvMfZ8br2IpexoYYWRy4JFy
         yETiVOZnWddNYsK0yyL0S5NLCVo4u+ux+5sEE+nCThfL+FXZjX+lhfI08pWpk7vg0see
         Wc7HGXcvqWC7+oNqX1tP3MrrgFutpq15fNRZ81VQoD35RNaGDc/gM9n0y9BMKwMXNc5m
         WdnxVDV3vftrungiUEdHo3mh8BY7AacK82Solzgiv8nChf0SRU0kakZlyNPi/OYvM9N1
         Yq8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795426327; x=1796031127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JqaNNY8+fBRcbsHJnnz48qA9IbD7DLdSU3+18Z2kgkk=;
        b=imfeXxH66PBpj/E84EZCxuqW7Po7Duqu10Xa69+uMMVtV6g2StkpPtgpz6WE9RdgPp
         qAf1rYfavtizXM5Gj1QZnGeYNZx5QesbKPyFU9VGDTZtj1AT/JRkYMEFKOHP89Wc4yar
         dKGdm4OOx4y9cRufchgiqXMcU4Wcgmh7VHDoETtFv8RN+E553L8l5JKr+si8jzZShpTf
         INhKo5slDcVEKG7NLRyMEHGQfZiiFvJUkVs9X41yUDS9sSabZPMyT0ugB8o3TdputLpT
         wCAk69LqnrJ2/LcQjmutaNkB+UOKImwVAi3G5j3gCApMDga5jZosgSb/c48Bp51fXm3Y
         BJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426327; x=1796031127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqaNNY8+fBRcbsHJnnz48qA9IbD7DLdSU3+18Z2kgkk=;
        b=1tFZOFNuHfdDkex8L9l0encQOY/CSsZdTf1Mx8Wffq6wOHciT0LDWZ+wWHVkz/ch8k
         WIZkICWvyOBr4pipMQ1VHUH4jaSw+nNfQAtm8HQckfFqnNUDChVsgQNF4QOneb5vU3VP
         RlszkeGLm1m0LbTP7zSxospXMdkQatjRDtEuXgWr1pcZ0dDuP6reuaDDCYL8gAa16s3H
         SDnCyv0A/tXt2uEeBNFNbJoLuKcRTOceKgpfFn4Syk+npNTWzN7Nyc7p/m5m+qTz2Ibl
         PRHby+IZt6qij2GEoUUcywjuSNoZPSYwESGn2bcqiLLea76wxAeXMAqcr4U3IaprW+0J
         2miA==
X-Forwarded-Encrypted: i=1; AL+hErFOXOBgKwGJWhKSIgcLZe7oI7DvEYXFOAWf8oTv+xrKRf3MB0hrGGnDZBzQvwSdDv+qLn9+t5kI2CLm@vger.kernel.org
X-Gm-Message-State: APuU4Z8LL7iNc8f6hfsPYYgC4C9OoW4vsDEVkATHeSObfDLjdCSfdIbu
	BW+lPtWoCvHDVTSPMX4Satg6Gxg3Dqm/HtYl8h/TAqKeF2JCVl24Uvk2AoS1p9ELwiSvFWYYmXJ
	aocMg2jh5mu4AQQ0tikbhMBiKMhOlQdw=
X-Gm-Gg: AZFdTZfr+o+DAbsw9w3mFnYU8UhePTAuj95musjGegJllVAzZ+P+iP7DZrLALiW8s/l
	E6mQ24b36C1iddUr2w0L/ktB1KtIOmC0T7HeNhmufGEgTqvCmyZPmX0Gvv3RI5QJKyR4AoyNq7s
	GZQZsKnV+jTUoT+QWuwdpT3WE25q5x247V49SCB4eYQOj0wnoMwqd760SxVnU6xnjJR0RBFl9ka
	Mr3APZ9qwZuNG4IOZykWQoFe9Xh+19T4Km7p8TqzRCb1mcRcWhGyqEfb+B1qo3NgVqIbaWl+E4D
	bGJlF+eB0GWPZ0YLxObSVShuX8wz+6d8eLTJEzGNOc09pFEnra3eCY2ZnhHQthLrgOt67GuQZXN
	XPvaeEP413xBdmvBfJsszluZZKJ9/R3j1lb/e
X-Received: by 2002:a17:906:3b04:b0:c29:3c97:c994 with SMTP id
 a640c23a62f3a-c513ab47f35mr695113266b.35.1795426327146; Mon, 23 Nov 2026
 01:32:07 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792986696.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1792986696.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 23 Nov 2026 17:31:54 +0800
X-Gm-Features: Aa3M54rO-ksGTZJl4gmuLyF4LQ_Lpi7KMAzUqlHvweFGPCWngAkxXQw_vYlvNLk
Message-ID: <CAMpQs4KyZbsQO3-kvKrzAVJWEFghpGG7kSmpJvniYeKYaGfanA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add Loongson-2K0300 APB DMA mux support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all:

On Mon, Oct 26, 2026 at 12:33=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
>
> Hi all:
>
> Loongson-2K0300 integrates a CMC DMA controller with 8 physical
> channels. Peripheral DMA requests are not hard-wired to these channels;
> they are routed through the CHIP_CTRL13/14/15 DMA_MAP fields.
>
> This series adds support for that DMA request router.
>
> Patch 1 adds the DT binding constants for the peripheral request IDs
> and yaml file for the DMA mux.
> Patch 2 adds the driver, Kconfig symbol and Makefile entry.
>
> The driver registers with of_dma_router_register(). In the route
> allocation callback it validates the <request> <channel> <flags>
> specifier, programs the SoC-specific route register, and forwards
> <channel> <flags> to the parent CMC DMA controller.
>
> Thanks.
> Binbin.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> V3:
> Patch(1/2):
>  - Merged the two commits containing the dt-binding header file and
>    the YAML file; no other changes were made;
>  - Add Acked-by tag from Conor.
>
> Patch(2/2):
>  - Append the dmamux object to the existing CMC DMA line;
>  - Add loongson2_dmamux_assign_bits() helper, no functional change;
>  - Add Reviewed-by tag from Frank.

Gentle ping.
Any comments about this patchset ?
>
> Link to V2:
> https://lore.kernel.org/all/cover.1791535540.git.zhoubinbin@loongson.cn/
>
> V2:
> Patch(1/3):
>  - Drop LS2K0300_DMA_REQ_MAX as it is not part of the ABI;
> Patch(2/3):
>  - A more detailed description of `dma-cells`;
>  - Add the `dma_requests` constraint
> Patch(3/3):
>  - Drop loongson2_dmamux_map->shift;
>  - Move of_parse_phandle() into loongson2_dmamux_route_allocate() avoid
>    UAF;
>  - Drop loongson2_dmamux->dma_np;
>  - Check dma_requests;
>  - Add devm_add_action_or_reset() instead of .remove();
>  - Replace `metux()` with `spinlock()`, which has lower overhead;
>  - Add loongson2_dmamux_route_free().
>
> Link to V1:
> https://lore.kernel.org/all/cover.1790068409.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (2):
>   dt-bindings: dma: Document DMA mux support for Loongson-2K0300
>   dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver
>
>  .../dma/loongson,ls2k0300-dmamux.yaml         |  72 ++++
>  MAINTAINERS                                   |   3 +
>  drivers/dma/loongson/Makefile                 |   2 +-
>  drivers/dma/loongson/loongson2-apb-dmamux.c   | 404 ++++++++++++++++++
>  .../dt-bindings/dma/loongson,ls2k-dmamux.h    |  53 +++
>  5 files changed, 533 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k03=
00-dmamux.yaml
>  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
>  create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h
>
>
> base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
> --
> 2.52.0
>
>

--=20
Thanks.
Binbin
