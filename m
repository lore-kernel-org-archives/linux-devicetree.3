Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737230;
	b=LiEQcLDmz3H0uJKfl5iLHL+0XAvRSpotvn1GNp0DHHZCsTVB3TSU0BSTcDzmIRTptxg3
	 bk/XdEmLgG6WnWMtgdwZn+Z2rCA+GF8ye51SDtsMDESERgLNqmWmOT+fvMUJN0s/wp3J0
	 H9YqvtHED5U3giBXPDzozPqLQ0qjTsIlWbidIrc+xmaUEezDAEclHL7XNAWE8sbL2wiLy
	 e8I/CH9LhSCgQxjchsZSenBpY/DDWB1AH2zRZggqBnGayzvTfgwm+fUVFjccRznnREMxg
	 33EGeaoPOb/oTWy1869oS5ZqXElj9/SnqK3buLmGt3uqcy7OeJFsmma7XzGLlp4lGAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737230;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dCeztQ5HxwDrALbFNUBOun9ui9uCjFJ8+NCiMnBHpH4=;
	b=ihqvkBqHW2wYmT6J4spZoR8JGL9Oc8BpeajDuuuvB+SIEWhz+kp6h9ammogeCgCEEWva
	 ax+fayweNviOxL4kcY2NytICss2EuIkKPEExoQ5ooiT7CDlMbVE473jZ028lVTXbnlyRO
	 LjfICnPhTByhhxnSk7tTMEiBKEIS9AO3szpGtaYKpCT3679jVaypEq3PxwoUDGv7WPAfZ
	 f7kI2AB9naYATV0wS5TO9n3KAXpBcjR0L/itb4P4z2iUv+RgnvjfdOVUi/x6hWtgv/QGh
	 jz5LOdTLfmLQzpxzBQ3m+SV94nCSq5+4tcaGwjRKgggazrBaz2TChiBc9D1W8nPp9Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sp7wZQby;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F849606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sp7wZQby
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3F21F000C7
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794737229;
	bh=dCeztQ5HxwDrALbFNUBOun9ui9uCjFJ8+NCiMnBHpH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Sp7wZQby8G9fJkxQfaUelhWxj05Vyksd5WI1/IKXarS2c9BzL2ezKV3H0OywEPdWu
	 59yIx0oLg9N6LkPsUOw35YLfo2U3huqsodjN2egf8+bXtOMkDdcjjMlBqJFj2b6gZm
	 uH1brRWgF8BgIRu0YsdL4WlM8RTD6/qkotPnxQju2PtAgtRYwRWYV8ORZRP6MkWhnc
	 HMQ5zDEK4LlLsbeCXLPbIW7eHZ1J4FlVanE436/e5Ur473ZgXcon7CcG3f8ealsbMM
	 Yu1eeH38zLVqwDi5m/fxZwqbxvhZUnxt4zIAOdDvVbIKurvECB71Jb1Lhrgxpbp2fs
	 1uRIPkwBj/4UQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b8082af2ffso315523a12.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 02:07:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGD+UqTSAIhBgj0+MNKrVjb+sTnprUyKd0ReoFT5W0bZreJnnTms/3nk8h+6IV5WryuLh/G2PB0dqvz@vger.kernel.org
X-Gm-Message-State: APuU4Z+H+VC11ZYR1+VL4joShkQBmFpb7Df7xK5jyTlJdvO27k3JUiI7
	cVGlL9c3efzx7tQ74U2LA2ToggShp2a/o6Y53VW5raYj4Suv1tmdtCqP7ehV6+f7Nx+y3EqwDgE
	LyTiqtwr/xJgIgfz6DQYOa7Rqmsw8CG4=
X-Received: by 2002:a05:6402:42c6:b0:6b5:76be:be54 with SMTP id
 4fb4d7f45d1cf-6b7c0c6fac2mr6104789a12.35.1794737228536; Sun, 15 Nov 2026
 02:07:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792988985.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1792988985.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 15 Nov 2026 18:06:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5o5UYAoq1cBoBXxP3-jReEHKgjFbFswW+6q_FMBqHA6w@mail.gmail.com>
X-Gm-Features: AclHuK8xpqb4LMAXdAN5nwsCuwWH11cUlBYujIxrgNPO5PisqkyzXwB5SmcGFG8
Message-ID: <CAAhV-H5o5UYAoq1cBoBXxP3-jReEHKgjFbFswW+6q_FMBqHA6w@mail.gmail.com>
Subject: Re: [PATCH 0/4] loongson2-apb-cmc-dma: Fixes issues and pause/resume support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series:
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>


On Mon, Oct 26, 2026 at 12:31=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
>
> Hi all:
>
> This series fixes three bugs in the Loongson 2 APB CMC DMA driver and
> adds pause/resume support on top.
>
> Thanks.
> Binbin
>
> Binbin Zhou (4):
>   dmaengine: loongson: loongson2-apb-cmc-dma: Fix cyclic residue wrap
>     NULL dereference
>   dmaengine: loongson: loongson2-apb-cmc-dma: Fix residue for queued
>     descriptors
>   dmaengine: loongson: loongson2-apb-cmc-dma: Program CNDTR when
>     advancing sg
>   dmaengine: loongson: loongson2-apb-cmc-dma: Add pause/resume support
>
>  drivers/dma/loongson/loongson2-apb-cmc-dma.c | 134 +++++++++++++++++--
>  1 file changed, 124 insertions(+), 10 deletions(-)
>
>
> base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
> --
> 2.52.0
>
>
