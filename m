Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C20369D75
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142813; cv=pass; b=IPWdBHADxIxrUmJWDu2nyV4r/jBy6mkd9n5MQK2Flp0U3QDa2grYH1BB61ALQsBxWGWq4BFzr30VTB165TzNnO06ecDDwg02ZpNfn5G0Qb8VE7eZtDVXtd9TIJE8N/WB0OQa0zs6ZMHkmiq0EwuYM6ERBw6Ei0aFORi1She5e4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142813; c=relaxed/simple;
	bh=wCB36lhePw43bhn1eMjIQeiRYhs/jz7LzvK3sw8DY/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1aPsQIOBjqkPn1fFq4Qf0y/EOk3rfKzZ6zHlvp+vScDDglJwNrueBh2Ut39kbGQPleZhuAW9dfSuPx+sM5DjkM2am/DWqwC2S5NObONZr2bpkBfN1zRAyMW1nKXeDfXiT8T29SFjU9ko+i0YwgmtsCJtoQDJcxoIq/0C3iTgSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTjGnxcg; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTjGnxcg"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a98604f6b4so808400a12.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790142810; cv=none;
        d=google.com; s=arc-20260327;
        b=VLw8ieKX3VKjraSVUW6g+Iunx5fLdml0KRY+jQ0bd3SY4dq2estgGgjHfm2MBxx2Fb
         lR2NTnIyIsBlLuEgyWHdHhJ+wkx2BbGuJ6o4uKMTk68bKbGWilP7fCafFnQYquLT0eNt
         AJC02TbaPy9oZ6c4SQfgZ6r+EV1iyi2x3RG+agyGD9UAU0j/cCq7erKv1zLGsYMGc4es
         B8rJWMtBHiQuBHWrOoj4ZuI1uta2GG6aklvfb6eIvqP7jfeGE6KDon7eCKy1uoJRmN2u
         P8g/Wo+JM3sMLLin1ieeeCH3iVSKoC+s4/+VA5TgjxuWVDJnJgXoXd/oy9UGwAUx4qmo
         G2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b4ipNKvv9Ha8ZyDw0UA6CxU/i2uV2iwxrmfrZjUvuRU=;
        fh=QKMiOtV/rIo0TB66p2bPMV0s8NRippHFtRCzcm19xGM=;
        b=a3q8Cn/JsB00dPaWszvlOyIi/4my8xn8ao/Kf+BFigKuPJG6GHzzswet0MHnxXEzBe
         P2O4ytRTkXjNV3jf85Y67Eot0/e2maifY01AiIgfU/ZQpDM8+F/zbicbx3Ismfs/HoH0
         K1POzUElOFscAcQATjkb3Obyqf1fsByteTy8wobA7rQ+i63klkv4Z4rIaq9X4zgPzrrc
         6dgLIG5dehpOqFgmhrcvrGkNd4cKX82g3UuXnP9jK5/Yu6I03V5fKgX2iaNzTZm9fflH
         peuoM+auwt4UYdN6+slrKmM6fIPaDqGYfIOixp6rpUSObPmbzFjVDseFttDOpWrIYAqt
         VbVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790142810; x=1790747610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b4ipNKvv9Ha8ZyDw0UA6CxU/i2uV2iwxrmfrZjUvuRU=;
        b=LTjGnxcgWtagsVEaNlaOZ2/GypUyemdq6w/gBp5f9xbwCPNKJRidx4vevPQw7KArOF
         Dk8lHjE4jpvlejKZeMTQh5vliPyx4Kl6fgvQmWGhDXwlj5OvMaKjeKlxi1tjRKeeV7kx
         fNuKWuBSwCvFuDJSETfgVBdPfB6BzJDFIPrD3sohhATa5qYfDMVKDyZS9JjRvb9iZQOg
         K7lXt/N3Mo7NgEt/cWl3pYdDnevluFUKP6FPu86TGe/EGADTukT215XfxHDZA9HboRNC
         Kv+1Uu+qtmx/VwEDjkwQrwvSK3jKDyR3Rf8Wouaq3jRHbGYTMgsaGnR0pJCVNAHyHMRy
         nvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142810; x=1790747610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4ipNKvv9Ha8ZyDw0UA6CxU/i2uV2iwxrmfrZjUvuRU=;
        b=xODrjHSPCTf6k+TAnEDN3zyQbKtawKMAb03QzjqTlvWLJRDtmGl2UNRhYmSgme/Jzf
         rOG8LG5LQ2eKcGB6cIlsqU7DmZBlNSk/3xBJU7Bqb5868McH2hVS0DlRbLn7+XMF+N2v
         vw/uoD7YaZwtMnL/8FYJvVBD6xSQt4IINn0EXrVlMzW/53gW/NzsBJ/Nyj8rgNrbmN5k
         OSCHNvmmtcWaxMFzhdEC0Jp+VGqSa2X9MUl7tzEa2GsjuC4LVoxMiIa/4yvjTIM58rr5
         5GsQnV7sSG4ciS2rDfkxIWnR/UYOiXaqaszoYGO/BUcZ4kpUAJpt0gyKSgf7i6mPUQwr
         d77g==
X-Forwarded-Encrypted: i=1; AKwUvBzoOzvLwRI2m30ljX7utI9g2Y0mXjTPYKO02ulsWzrdbdIZPVXd4BrdeVo8IpgIPmFylzFHB8Gzg+Zm@vger.kernel.org
X-Gm-Message-State: AFuF++kuDVpL0LhmYUJeLsI7cgjrivnAnrVJbZ0SzW8yxhnCCDAu7mOc
	gfyyq/6KiGEdxui2VBeVkwRWs7Xmz9dcLDY7T7cnIb0xybS/8IEpu1oPbGmLVtW878h/Mc9dj9f
	CYFCedWmfJR+XVOElXtqEfMqW5yNdQ/8=
X-Gm-Gg: AYBFou2TFCejviNYJSCvwTQxmp9ZNvjDye0VEmEmFrhqfovEd4AltK0o91COE/2/NXj
	lxynexKsmm8n0EKruZICOSZG1HVoWJLZTFUUDGbPyzSqgaGgxyzNsp5ZjTrnJyNPY3ggDBWHxje
	GOb/edumtu5xHJCdnruWD9bszYZUBEsbUw77pdcZFMGTw8Ot6TcHg3uRX1jVNR51riF/vdXraDd
	IkBLEw3Cjah+IFktVAd89Xac12r3BkkSZQWrNRAGcgaTEQwbcBFP27EQ5WqLVDmQAGxRXBfafME
	rFUXAsjiqKs0RuS73y+Ix38yC7H6CRpkdL2lULS/S5U3fhkQH08x/swOLQ==
X-Received: by 2002:a17:907:97c1:b0:c2a:6bee:77c9 with SMTP id
 a640c23a62f3a-c2aadcefe12mr117281466b.4.1790142809578; Tue, 22 Sep 2026
 22:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790068409.git.zhoubinbin@loongson.cn> <arKwsyDwkCsIPjWk@SMW015318>
In-Reply-To: <arKwsyDwkCsIPjWk@SMW015318>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 23 Sep 2026 13:53:17 +0800
X-Gm-Features: AclHuK9BQhIFAJMfP8FhnBIMi1HpURCls44U9SRbBAmppK4kZXV4hRu-tk4ozV8
Message-ID: <CAMpQs4KszBmHDrXUZ9azYiGpsQY+LWqBSoWKB95VVO=ioh51bw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add Loongson-2K0300 APB DMA mux support
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank:

On Wed, Sep 23, 2026 at 12:45=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Tue, Sep 22, 2026 at 05:25:41PM +0800, Binbin Zhou wrote:
> > Hi all:
> >
> > Loongson-2K0300 integrates a CMC DMA controller with 8 physical
> > channels. Peripheral DMA requests are not hard-wired to these channels;
> > they are routed through the CHIP_CTRL13/14/15 DMA_MAP fields.
> >
> > This series adds support for that DMA request router.
> >
> > Patch 1 adds the DT binding constants for the peripheral request IDs.
> > Patch 2 adds the DT binding documentation for the DMA mux.
> > Patch 3 adds the driver, Kconfig symbol and Makefile entry.
> >
> > The driver registers with of_dma_router_register(). In the route
> > allocation callback it validates the <request> <channel> <flags>
> > specifier, programs the SoC-specific route register, and forwards
> > <channel> <flags> to the parent CMC DMA controller.
>
> Is it possible use standard mux interface?
>
> drivers/mux/mmio.c

It does not appear to be reusable.
The mmio.c file appears to only involve setting bit fields in
registers, but here, not only do we need to set the bit fields, but we
also need to pass additional parameters to the DMA controller.

Take i2s as an example:
&i2s {
        status =3D =E2=80=9Cokay=E2=80=9D;

        pinctrl-0 =3D <&i2s_pins>;
        pinctrl-names =3D =E2=80=9Cdefault=E2=80=9D;

        dmas =3D <&dma_router LS2K0300_DMA_I2S 3 0xbf>,
                    <&dma_router LS2K0300_DMA_I2S 2 0xaf>;
        dma-names =3D =E2=80=9Ctx=E2=80=9D, =E2=80=9Crx=E2=80=9D;
};

We need to pass the last two parameters <3, 0xbf>/<2, 0xaf> to
`loongson2-apb-cmc-dma` to complete the relevant configuration.

> Frank
>
> >
> > Thanks.
> > Binbin.
> >
> > Binbin Zhou (3):
> >   dt-bindings: dma: loongson: Add Loongson-2 DMA mux request IDs
> >   dt-bindings: dma: loongson: Add Loongson-2K0300 DMA mux support
> >   dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver
> >
> >  .../dma/loongson,ls2k0300-dmamux.yaml         |  49 +++
> >  MAINTAINERS                                   |   3 +
> >  drivers/dma/loongson/Kconfig                  |  13 +
> >  drivers/dma/loongson/Makefile                 |   1 +
> >  drivers/dma/loongson/loongson2-apb-dmamux.c   | 380 ++++++++++++++++++
> >  .../dt-bindings/dma/loongson,ls2k-dmamux.h    |  56 +++
> >  6 files changed, 502 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k=
0300-dmamux.yaml
> >  create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
> >  create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h
> >
> >
> > base-commit: 0a8dda0a15d3926422d286567f945a05328a4ac6
> > --
> > 2.52.0
> >

--=20
Thanks.
Binbin
