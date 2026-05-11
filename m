Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC61C313551
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481637; cv=none; b=UsmJyjy+A5jLGku7qfbzkpWPtl3249nz7YAS7eLVHOtxlQxSgAZ79D+2BeWEU+9Ungmy83INWmdDwTLf6mCMTTgbvvAo4xIOXdF86Q7zMRkaQF86LVrekqd7+DtSjtfMjvFuSPo3kj/sfQ15F10C/tW2WfDaBo6tZ9HXEF1sQNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481637; c=relaxed/simple;
	bh=NmkPyrRTIjWyClkVXUQzYwO7m/ITRKRWvNzOoU9dgQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DABalNwpXADHlcqlpxVV2691/Z7FVwsLOGI+D6qJDkcsJ7qolPTwMLCmNISG01Ah5x+y7wWSp2zYEMT7phffFm7J0eCqKSiaoiUYgAtjTFT2Zxg97BLFtKA0hIfXDk4JhzUWciCz1CjsOB65GXdYXh492D+ytfxTTLaLeCpT7mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQRjZkB9; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQRjZkB9"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-834f1075805so2755788b3a.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 23:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481636; x=1779086436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bp1SzHVVQniSVO1ea05q69qwUsggmYx1Vtvah/rM9Og=;
        b=eQRjZkB9w5qI0rFyq8OHkUwXWRLwKcYIkrBEywihUBZfTgeEvk4yOxP7HKlcGegCMc
         LUf0Yech4r9d2HYyCMKL9hXWNhxUa686nnhHvxZ+Nceb9xEUubboDmXRJf2DWnYSWszy
         re53OVHCPtUav1Ws7OB0gh3TIHlvc/2El1U2QuNKosR5sNB2ZyJwVUbnz/H13GnDK8n+
         CRc1H+HgK6Sggkr0o7IYerPxuFidqBKq0og121Mriwh5FeFm/39FTXN/qI7TNeg3HugW
         /8m+N3K64UrD9qvIAmLVPXXb7QC+OTjYi+EbK2LmQ99ZcRrCpR+gOd+ShVWwvOoDVoLW
         L56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481636; x=1779086436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bp1SzHVVQniSVO1ea05q69qwUsggmYx1Vtvah/rM9Og=;
        b=JjB01Pzo8syk1uQ7IEzd9p9TBkiI7U821gzKs+b5fnLVNKB66p2tIKICeRUPUoimK+
         mW5TCX68GK5cQm83BYhoGM6kIu2bALsrhhlV3rebHH2Gp+z2hS8Y2q8EHvNdC2wEhF+A
         4527g0irlgNN1o+0NCgNCUb8Ne+lRYqcDga6o8hRE2aoN5DTV2XEma7fZWoPNwZWVtPG
         DLpsC8KScwCatLXHv3/DldZFUB9Is67Zt/V2xblYtl13TpkdV6YfTteclIlwjUAoCL/T
         J5BgiNlyC9numVeso55OGEtdbTQQYIE8Wh+0n+6YADu2IVjWrjpkNkLVED6hUjG2vPnH
         +/+A==
X-Forwarded-Encrypted: i=1; AFNElJ+BPfQkfHKnoDVVKCcWwSHbG5I5bjGtNHUxT8XAsdV/QMVhw+mtItG8+EvGbtiS3UCKgJk1hkrv6a5V@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2gq/YzqmI/tMGbeF0e+1/+KucZVU9zKbCSF5iPkcjaX9oxkPb
	Dfl7Xu2HZVMFXSwIgs4qkg+m1usPrgB0e2dptNM0WPyh3v+nfpx8eQzl
X-Gm-Gg: Acq92OEVhD5+v4DESSEGOkH+C/3MPfJ3qJ1VBoIcNpzemb3fMeci7qDyjg3do1eVCZC
	1KYQCb+a6blV2loutlPAnlmlRHA0mPyjD8Mmp2KK4kGugrTF/Yq8WZndVwy7E5XnuIZ8rn9xCNn
	Rw/SXi3i/JINEuZjAex53y7OBTs0SkCEielQBEQa8PxPg8pp24ZwOlsUk55/vfMZcF94NpzdBAr
	TJrhC08YHrhvJLmd/2N7fWPLK560NSZXfvEle4hSzlno9FNZkvz8kfESegKj2Ftgd2F/FYXhK9o
	tg6Ro6MHIKNCrd/TkJ6Nr9ZTQOwMz4S+pznGlLtmcRFnX+9wCx1m3bMl8LXmRycRZ+b9HfZjcQk
	mka5VfNC2/ji7XY5TVN6S1cRPdhUxTWBWpn9wljl5WGynhk6gUd8HTfUY+UdDVJG0ptpCb5zsE3
	Ic5jLEwPgZeH3IkxjHwfyMrvg=
X-Received: by 2002:a05:6a20:1582:b0:3a3:a6fd:7fc1 with SMTP id adf61e73a8af0-3aa5a8fc80dmr25500333637.14.1778481635951;
        Sun, 10 May 2026 23:40:35 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267689d76sm7967107a12.11.2026.05.10.23.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:40:35 -0700 (PDT)
Date: Mon, 11 May 2026 14:40:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 0/2] riscv: sophgo: allow DMA multiplexer set channel
 number for DMA controller
Message-ID: <agF5dRASi8ombhFM@inochi.infowork>
References: <20260511063719.460049-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511063719.460049-1-inochiama@gmail.com>

On Mon, May 11, 2026 at 02:37:16PM +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> This patch series add fallback compatiable according to the disscussion.
> 
> Link: https://lore.kernel.org/all/MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
> 
> Change from v5:
> - https://lore.kernel.org/all/20260426012921.673953-1-inochiama@gmail.com
> 1. Add dt-bindings patch for fallback compatiable
> 2. patch 2: Adapt the binding change.
> 
> Change from v4:
> - https://lore.kernel.org/all/20260225104042.1138901-1-inochiama@gmail.com/
> 1. drop patch 1 and patch 2 as they are merged
> 2. Add ABI break statement and clarification for this patch.
> 
> Change from v3:
> - https://lore.kernel.org/all/20260120013706.436742-1-inochiama@gmail.com/
> 1. rebase to v7.0-rc1
> 2. patch 1: Apply Conor's tag
> 3. patch 2: Apply Frank's tag
> 
> Change from v2:
> - https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
> 1. patch 2: rename "AXI_DMA_FLAG_HANDSHAKE_AS_CHAN" to "ARG0_AS_CHAN"
> 
> Change from v1:
> - https://lore.kernel.org/all/20251212020504.915616-1-inochiama@gmail.com/
> 1. rebase to v6.19-rc1
> 2. patch 1: remove a comment placed in wrong place.
> 3. patch 2: fix typo in comments.
> 4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.
> Inochi Amaoto (2):
>   dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for
>     CV1800B
>   riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
>     number for DMA controller
> 
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi                      | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> --
> 2.54.0
> 

Please ignore this broken version, the right version is 
https://lore.kernel.org/all/20260511063818.463877-1-inochiama@gmail.com

Sorry for this noise.

Regard,
Inochi
