Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC803B5E15
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745284; cv=pass; b=ljpydQEYcHjVaziYy8CD2lPDPYHoHbKNQDKyuiQJiGUTEGc9AdY7V6i+cnPIn5Z1UJ6sNW821sFXlgRqRVTgjaeF87Jx1XdfJgDnqyLuT6lqrY+kRGB8j9FCRyKtjyxZqG2kagO0/PSXxNmtjk7aFmIP0wmMy0QpEkPD/QCzVg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745284; c=relaxed/simple;
	bh=Peu3vBUCBh0f1zerPCNNUt5rFHVtmuDuEYHbyCMoE1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sC0z0kPpuBgme3Z9nbJBRTDoIJGcyhLseZ2rapHwSI7Q+wSuLt5tv6c+zwPs5vs6LM8DJ9/sibP6Gcu+vU55zoRLTSyMZ4Z4TNM1Kv02IkEobvLM1FxXPamY9PGpHrgcKFLZR636K0vOPoafgSGFncwlomQgdvkKxQUEPjifLTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fk5rYuUa; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fk5rYuUa"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so7794866e87.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 00:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778745281; cv=none;
        d=google.com; s=arc-20240605;
        b=ke3kMznlwDhC7FrYeK6JNdzX72fM/AWl85TZEz8JDHyE1dGlg+HqvnA0IXhg3cnI2A
         iH/GJgfeC1NcdQ3/a5hvEmqayRX4HqTMjBZwfjEZPZdSfrUNZbbJ/FMK4fKkGmigToCx
         iXbwwxO6qDpgbjOLhfVDUP6mT1hQ9Y8t2aCJQKlWgt4Wjyp4x7YptXLdAArg3435PUi7
         y6aU22Zy/EnQqTJd3Pdt3CLvQWkhBNHuvn2nHsHHOtKkcwLQsZodG0O2ELf9gePaon77
         4w7rzbHCCPSskrKEQxHFk2uZUrjIgjDyKY9Htq9PPZo3AUOEWsUYNNOEoTzfNpdbfEZZ
         R0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XR8EnK64dtfqn5p2qNUwy1xl1ufX9OqaX2p8lb+U5Dc=;
        fh=++zE3BoMxqGpXE2mt3yPBa2yizvGFwk/uienNCOdkek=;
        b=G/rwoHhYW4JVoIc1SzjOQiWPySa/qn6t24754IredykUhGtbYn+NhikNc98zd3HK0w
         xKMBSqs9MHoOISuhVTCc3stDVVBsCYchaPTOzY7pPSMjq5sKXPItr87gsXE9Kw6mMwrr
         C7G0w3xq/IovzkGI62Tjmjc0HjfH+znn/nMHOC7yOUkh7Lz7OCtfKF6+PuL/2rEyuWtK
         pZWWMjcbAz8Gt6Ff2+rkV81UENka+hUe/cA2CcaE+zIezbYvfNFJS5KjeSaiaLOUpIxd
         xewbymeNFdnKjYVBOvyGXAzYLYeEEBlZH0D8TD6/hpSBuhU5yvW2g4ozwC82v+qBPNnG
         XIlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778745281; x=1779350081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR8EnK64dtfqn5p2qNUwy1xl1ufX9OqaX2p8lb+U5Dc=;
        b=fk5rYuUad61a/xL+GW2MGdf6aLzGI6CgqHre6u4WBZHXW+Qs8NKX6z7x3fnVha+DV+
         Ie+/dYms9qma6oka8Fq3PyH7B2hLfSZxyqgTP8W1boR/WixraI0YaGK3xqAii1ip0neX
         b+BxLIvSWoQtd4q0vyqcNPRsVAP6g04W6wzs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778745281; x=1779350081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XR8EnK64dtfqn5p2qNUwy1xl1ufX9OqaX2p8lb+U5Dc=;
        b=E8+yyO+xYcX69+shko93mRPtMWYN47k9zu9DAgRqRb4wIZx2tZ3HK9qsJg/44h/Ckh
         dzC055OWcAz+kIB39GSc9Qi0XDI/6uTAW0pmNUhAVWL4ho5B/G+OZ6pAuBQqx5526kY+
         7BJhz6TUHsaNvQQhdPfBT8alScAb1BRNGoDom59sve3aBqhV88npBr89+hg45FlA6b7E
         3XIlMYLadQhgdns1VhnQGU8HDpqTgk+l7EEnUB7capSwjnp9L48mznDRucaIW0K+2T6k
         F1GBvraDehW8wRy0AkauyJ4rnB2wHbarANcNQk3HWc5x9ceOLyE17GTHlxVU+xcx8By+
         pwKA==
X-Forwarded-Encrypted: i=1; AFNElJ/wnTs0w0PtTryJXuCO3wUZam3K6bx68jBzPwFASHBNl85Cz7XpcPHPE95IZtiQeafslhWnzSSj6vix@vger.kernel.org
X-Gm-Message-State: AOJu0YxMsPtu9JiXxhpRXKRSwfm00ongqCOKzwc5PEdKQoyKbU2i1VUq
	ktO62eNok2W+sHSysRolhnDawuMDkZwjyPepmi4X8rRgn4K0Jb5rmOqR314LAabsnzSd+Pg59Cc
	d8fk97Yg7iwf5Ccv6FhogFmyhrjW12xdcXBEJ1ioy
X-Gm-Gg: Acq92OFwtxjmioFp575znQ1wJDHl+bB20HG4zrybgqa5P095Mw7SU7FT0CnTqQYBmdV
	0stlRlAK1qzPnfN277Z2mCLzDPe3ETFqCqipKhLd33yEGgKsgIP0ZPkZiS1k0TETBEJizAgktBV
	zX+9fQ6YlWOyRZHsCkWdgQJJIEP6iiL0imQdsIrVSI5fwM9mgGryteIeWjkfq+yvvLylpgBjXzn
	9n3+yKXNu17XUQYzSdNo/z/Ql7JJ/hoq8kpVHpkkg01rJ5W32dDyJaDm6bx2Y2UL1ASKtc7V9ic
	BTWkDuQBRgH6DWHBfv4euMGM+H6iG39+8djgbA==
X-Received: by 2002:a05:6512:1307:b0:5a8:e363:6f7e with SMTP id
 2adb3069b0e04-5a8ef947b4amr2826701e87.17.1778745280832; Thu, 14 May 2026
 00:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
In-Reply-To: <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 May 2026 15:54:29 +0800
X-Gm-Features: AVHnY4I-K0fe_Bfh0y4hR9dkGGPUD3Wz3qssE4qO52Iohr3iuH-UNE1unWWNmOk
Message-ID: <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
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

On Thu, May 14, 2026 at 1:23=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> > controller memory access could be limited to a small region by the
> > firmware configuring a memory protection unit. This memory region
> > must be assigned to the PCIe controller so that the OS knows to
> > use that region. Otherwise PCIe devices would not work properly.
> >
>
> So this means, the PCIe devices can only access a specific carveout memor=
y
> configured by MPU for DMA? If so, you should use 'dma-ranges' as suggeste=
d by
> Rob.
>
> 'memory-region' also serves the purpose, but for PCI, we have the dedicat=
ed
> 'dma-ranges' property.

I think I need some sort of guide on writing the 'dma-ranges' property,
because it is not working for me.

I'm adding

    dma-ranges =3D <0x42000000 0 0x00000000 0 0xc0000000 0 0x4000000>;

to the PCIe controller node, and dropping the memory-region. The WiFi
driver subsequently fails to allocate buffers:

    rtw88_8822ce 0000:01:00.0: enabling device (0000 -> 0003)
    rtw88_8822ce 0000:01:00.0: failed to allocate tx ring

This is dma_alloc_coherent() failing.

    rtw88_8822ce 0000:01:00.0: Firmware version 9.9.15, H2C version 15
    rtw88_8822ce 0000:01:00.0: failed to allocate pci resources
    rtw88_8822ce 0000:01:00.0: WOW Firmware version 9.9.4, H2C version 15
    rtw88_8822ce 0000:01:00.0: failed to setup pci resources
    rtw88_8822ce 0000:01:00.0: probe with driver rtw88_8822ce failed
with error -12


Also, using memory-region seems more straight-forward: I have a region of
memory dedicated to the PCIe controller. I describe the memory region,
and assign it to the PCIe controller.


Thanks
ChenYu
