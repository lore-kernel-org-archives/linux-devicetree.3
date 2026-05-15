Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4C6429800
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836594; cv=pass; b=hGX69kYo+eub8El0huPU+gJK/wO9hWVjnLTtdFS4kOVOYAacW7KWGC0rcuTtBrAI27JroqIaiShCjTMylp5U8KP3Q7l2errGzL69PAnnLZfi6WMiY/EWYPQKgvoUQGHV4pJFs66JXf3Mfjf4KDKGE87sZ+JQwnNtLkLnZy74BVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836594; c=relaxed/simple;
	bh=O1osj9DRGlh7LQXczkymCUHM69wwL6MiPTCJNt7k5Zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvHkPAj2Gqyr74dunc3GLfFD2yvToW2QOX8ihwo5gNw1QPUi+5ZF5RnI3fefDqKxnbguA31Hr54KaEVpFSkGu4YSMB6OuyAclTGt/P+KtLU787KHKBPAFbmes0k0jpWLzG8ndyIw5gqKzltwvz306MVmcgSs4djrFxzR4/Mu0zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=daLT55mO; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="daLT55mO"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39393ec4ed0so77845251fa.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778836591; cv=none;
        d=google.com; s=arc-20240605;
        b=Fg173MVAahel9JifdbDTOawbRUHgiB8xvdOKK5mnlQ4Nob9c1ogQp9RRiyB67esewZ
         PeLsUEdUfDv6VFl1xN9BM/2g5CYD3Y02BsBtNhEmQOngIqe1vLDk3x8cuwUswrccgm+B
         alSnzEyBeRw9KxypK68YfmB7WQA8bZPkJ4ynHjwtKT0XbOnqmdoayoQ29/U+TtO3BCqM
         v9fKam7h7oXM3O1T6dQUfB0bSr30lfOZnzZBuAG5ZyyFACV5/ggPxPmBtHUdoctCyn/V
         +jS5fh/e0ulLfzTnFWlyWqk6hPkFcBn1lRTkKga6++zBa/xJfgGYdmuD5lbEAGlaUG2X
         0wTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOPcS/H8/U6wPcyzeNn2Tnxkz+5P1nEugos5oRv4JHk=;
        fh=5WCSlCdW36QhzZvQvq8eWktIMPZJpvvc0fCjFHOOtqc=;
        b=J9SQECYlu2fY0ZeG6by1T1EZgXiC0eZdxn7hrxz1hbEc/WOwkQqbkqNaerL1pcLZYk
         n1gVqGwojig3CAy1qeMYD2duBTFkCvy6EaoooD7kVz9UBarR9LGYuW1KGHxijTVx5deo
         3ft8Ep4stsJP0LoBkjuNwXpd0CAR4DaKb6GrrYCbajroKHgbcuAi7Sse0yMLcqYFc8P1
         0Ps8ayxXqDOMNfrnx9hCdttFvfxX12mdrWJrRQt5Gdjcr4TyS0WRWfRRiMnq/fNB2BvT
         wwuCn979PNT80OWnebZxptDHcDXlp1zMpd3OcmsZanszj31CAtUWgs3D9BU0s3ISFkBK
         gXmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778836591; x=1779441391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOPcS/H8/U6wPcyzeNn2Tnxkz+5P1nEugos5oRv4JHk=;
        b=daLT55mOoeJ/6ZiYq0of3mLN1STCti1NRMqhacQG4vwStEjQgbhSvSjip0uUYd9T7J
         JGDghNUbdpipTj9z0zTjdtaB17o1p/4SdLcV8DqL4OMlV3Il3aNXvORGCpADSS3DHyGb
         PAapOkhfjcJt5NpuCVaf/M9TFdFlM8trUmk9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836591; x=1779441391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOPcS/H8/U6wPcyzeNn2Tnxkz+5P1nEugos5oRv4JHk=;
        b=AjDQeoy3g9SsQai9uGa7duYiHsMSvEjfHYMpRf5cUXH90f7+vMwENK0sy4mWPjo4Wp
         +C0r74Pv4b4Lv8rOhNJm/B76rwtpPFrKTLOenVC1XjSh5rupPYUEtBTKt0T+nGsVB8Ru
         aaNt0lzzYB1MtrMJ23IiPBZ9FAze6Zyl+ikscOiHrLlJ/zOe4bVnjG3Fuy3X+MCG8/PZ
         k8G4YcdCHPsYmNZiNTjBIC1eCxPdlCxcpHmPLp/h6CD6eU0L6ROJhdA4Wg0Y5BjcQJtr
         AEZr0DkUWg0G+XSrvXLYGQViVlh8vyUndSbXAN7u56ZB7FAd/yV/VByKUo0qS+OuWoWC
         3BBg==
X-Forwarded-Encrypted: i=1; AFNElJ9EBOHfa7C6aEi7IGbAkD2uc0lOKqxhVGdETGpmGqbxExlTUNnt+P8bGLysnT3lCy08L8T3qzLqQyt4@vger.kernel.org
X-Gm-Message-State: AOJu0YyaNNd/bCU0/50GbS457OqtlBO44e8kmDngO7wjAKBb7e4csAEu
	hvxZ9sVFoi9GCMV8UGacYnPerl6GCZFGmWQp4nyI+wo5OVAkGo5c7yU4Tc0W87TMNn0JEPXsTDX
	PWSbqaTGsdEvtLCigh7+NsBqnFk1236JZkm3rY8xf
X-Gm-Gg: Acq92OEJi5ovlxln0y65zGFeSGos26Uv3rSB/3VPRZMoYH2sHfAxT8IiWChQQOlLwTK
	a0gqk1p8KgGP/uka4ijeb9pWGvM//JKsqlxKdfI4ty9mzrFlFhBSEz/mao6sSnFJTXnz5XP1S+M
	t5BFUwyOLmmIv9WOdkjjsniLBxhALnVuDo6qxHGWRjP18fHLVUyy1TtKdATWAPSsdHVpyGgeff4
	n6TnpnpQFHGBGR6QdnlGrYf5T8FX67uylt9qBQxtET4LNcDUXLbu2Xah+B8E6K5Ow5qXexAZEgK
	aXTkXtreldQ4Cf216FLv3XYezlsk+ezpL3Ifgw==
X-Received: by 2002:a05:6512:3a87:b0:5a8:9d61:d89b with SMTP id
 2adb3069b0e04-5aa0e74cb3dmr743386e87.37.1778836591069; Fri, 15 May 2026
 02:16:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
 <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com> <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
In-Reply-To: <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 May 2026 17:16:19 +0800
X-Gm-Features: AVHnY4IdOj2VyhMXhY8fbMZzGCWoX3mgZBp9t_yv23cB0YsfCPC7Ce9B5m4dook
Message-ID: <CAGXv+5GBraoTrQatQdrM5b+dOteL_Y5K7_UQBUt-2L1x=c94KA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 7:48=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > On Thu, May 14, 2026 at 1:23=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > > > On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> > > > controller memory access could be limited to a small region by the
> > > > firmware configuring a memory protection unit. This memory region
> > > > must be assigned to the PCIe controller so that the OS knows to
> > > > use that region. Otherwise PCIe devices would not work properly.
> > > >
> > >
> > > So this means, the PCIe devices can only access a specific carveout m=
emory
> > > configured by MPU for DMA? If so, you should use 'dma-ranges' as sugg=
ested by
> > > Rob.
> > >
> > > 'memory-region' also serves the purpose, but for PCI, we have the ded=
icated
> > > 'dma-ranges' property.
> >
> > I think I need some sort of guide on writing the 'dma-ranges' property,
> > because it is not working for me.
> >
> > I'm adding
> >
> >     dma-ranges =3D <0x42000000 0 0x00000000 0 0xc0000000 0 0x4000000>;
> >
>
> So the device DMA address start from 0x0? Isn't it a 1:1 mapping?

I actually don't know. But

>         dma-ranges =3D <0x42000000 0 0xc0000000 0 0xc0000000 0 0x4000000>=
;

this didn't work either.
