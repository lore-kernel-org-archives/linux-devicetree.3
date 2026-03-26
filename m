Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A4E3F54DC
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774528814; cv=pass; b=FKT/2Fc4zPvevVYESccClZJHtFe9Jsp2d2UbOkF98cTN+kub5UtwA+gyoAyPq0BhKgW6w0p0qU7SdyF2GOJEWtSVoXvNDo5Dic/Mjs0FCU8kRFnfJ/z5tEm6EPrF2jcLIMLfkaTwYDKbbjZUs5i6D20X1B6+l+ly8OkOg0xPtE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774528814; c=relaxed/simple;
	bh=br+vYtn3MgIkH/VxY9CA/UzoyYOkW/yDEj9oP2gMgts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxOL7d904n+whE7jcad/Pj1rMAUp43izxxFIOUlgLFYho8nCK370h6zXSBW4dDVXVij8rbMDb1v+6YxWXCRZ2wXHRkOrpQy3aHTj2yYqw2zDoRJWMmQJobVXfZI0AhtzVSTnOQMypl03d17GaVVSinLMAnm2oeb5hdYvJ/wUGlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rw6zj228; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rw6zj228"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e4a04f059so1044772e87.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774528811; cv=none;
        d=google.com; s=arc-20240605;
        b=j5Xcs0LNWRFjOclCsgczlLWAEWfKr+zji69wU3woXvnX2FDXv+rtaMuCaOdui17dcl
         IS0VEeMc7AsF/Rs6vClmCsfZ9vBfzpNhP57VwZrwK3Vbic5loRprebhRWHFD98rjW+co
         cB63i06o1IaSAADDNdkk2cCmr0nFIU5doNGtlg9Jwb1lyBinWgDY1GOp61o8Nwh0y0Ux
         W4m7LJ5owtchLL7yaQDJbaru65la81dyWx0238BZyIbpttSJH4o9nK0ayVXvZ18SCLOQ
         Twy8xxqYaSgoDb2KpA9tl0JoX5vInJRF/xNFWkU9zBMm+fCD5GJLX6XTf0HU3h4lfyBp
         m8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=48CvZ1Y5htSw0CsA/IUWJDDVtqJpwQfkps0eeueb7wc=;
        fh=pTbgZF38k0EPw24jGeKmmuJNqtsNTxgXn27LvByyYR8=;
        b=QTZ4fwJJcqx8c1TcT4KMs/P4PUdk9h6h/YanT03JkwGembupso+NjuyytA8UOp2AKX
         5Fh/W0CCyH9Ldj1XuXjIL+SwAA3HxtqLpHIo+QYpols6/Vu/USN2Lrk5pDivyRGA3XvR
         +r8WI6vnUkL4YB83iXxDB12g+P4DKqeH/kXm9I8JMAT3sqWMMsjHv/Ho0GrFe6MRziET
         VyNchcmJ9PqxJuyCzOtzr+6RysWKO7M/438N6dtonuhcoqC+RlOZ9hJdCNECjXis+NYj
         VLhjx8ChqDAnJQehX5w1GTyLtoPu21JjOtuNeXATP4cK+mxnwnsCiJfDIX1TcvW7mGkM
         GpZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774528811; x=1775133611; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=48CvZ1Y5htSw0CsA/IUWJDDVtqJpwQfkps0eeueb7wc=;
        b=Rw6zj228Jp1AVgAmsO3EwKk5DIMaLdk6KovFl8buq8alXAp3SWwtV6tyrJm3FzQPzq
         jLRyxr7SBdIrSi16KnPEU569rxBvpJW/gvCw1+68JW8AhaaEO2PDXkJvtz8XDT9weH09
         xhVByCtDi8fLklVT7aLPWhTPj8cxwQ8In+yc7CNahxf1qZVoNCwTemR738RVhG50iaqp
         hFIXEWdpxHxqVHxp46qWIkDivB+FIB7reatlc+veFiaBpzVzasXNpgogCL2AZu0FPD+g
         Iv0qJMos1xI9bCUN+K8W9IZOKfUGY32zqC+77LYenUFv5KV6Esg1CZu+Zi5lSvUUItOp
         iH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774528811; x=1775133611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48CvZ1Y5htSw0CsA/IUWJDDVtqJpwQfkps0eeueb7wc=;
        b=Scf9laQ4VFVpnuKBF7ENNr7p41zrQNjHWMsU7PKpSol/t07lLkS1CLbcWJ8/kgI+Kx
         2DgEPFKeyJQwAsWR7n80y2dCbYY1qI2j8etHjsV6Nx2zoP3N/nC7eAVDs0GB69cdRCQC
         3dKiJphHnBtshQRRhbuCQzzadO59kaPAFGjVjyr1Ug/gwLS/hwIBAcN4D/iEsqlZdKSa
         lEhpFAiCbbE3CKwhVKlqyUODWN1mk1/2dnk0ZM6xEyrdchkP7WPLqphUm/evUJRR71pW
         Ru0DA1aN6ydLQ5MtRQsPU4PMRCEgCAa06krGWvf5BwxCMagFEd5Fgh+etIx8pzXT/0Eo
         pmwg==
X-Forwarded-Encrypted: i=1; AJvYcCU9SK8BzCyFVcCoEFbitk1OW/2/Eg5KeygH6BHtEDsBfqlz6/armFPFW8VkfkT2htKNg9HEJ7B8etQH@vger.kernel.org
X-Gm-Message-State: AOJu0YxQz4tEj5ogmILCeih9A441AV32Hf8LLEk3bulJewODorNeTa8R
	FJNF5zZN2rbiQfqMVqkwYQX+VX8Xq2TyQQEW8a65PAOpVsuLLOgM8pjWXq03DqKv2DyF8oNaXkr
	OSq9hWyTM8DKrjCJeg7J7d51Iuwc0mnjx2JlN18cXjw==
X-Gm-Gg: ATEYQzzzwzXxYyPj6zrXb3z5H9GOfeyzSrF7dkc0BfDs0anHTFXTsPVIGJIwmUiP8gT
	yoSZFOj6R/86EX7xKnHJiNV5yJ5kL/XzjnDaBuxfU6l5e+6PIn2fW+wQ/lcsaWJ7/928FP3gKfG
	WRXxnGS059EpZHe6w0cJ9ys1rN/Kmc8QfSiahfEA2wPu7R6ZlQ19++ySMl0tRx5TUCou/QI7eSZ
	m60DghQvJKVYtJkJmxKXnFmABfyL/ZtP7SEATGJiePMqiN6jmkcK5Y76SKs7seTa0A0jE9HZqPN
	IKfNLhI=
X-Received: by 2002:a05:6512:1306:b0:5a2:7d1a:4043 with SMTP id
 2adb3069b0e04-5a29b99d856mr2665316e87.20.1774528810562; Thu, 26 Mar 2026
 05:40:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325225439.68161-1-rougueprince47@gmail.com> <69C51640.8070408@hisilicon.com>
In-Reply-To: <69C51640.8070408@hisilicon.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Mar 2026 13:39:34 +0100
X-Gm-Features: AQROBzBmRNtgc4rNYofWXMIcZkHCVLXnq4xnye8DD2kjvOTL1AOG-2hkznear-w
Message-ID: <CAPDyKFq6F3PZgqTtHXZPQPPBvdPhsQPtUVHiZV6X-QXvS42+CA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mmc: hisilicon: Convert dw-mshc bindings and fix dtbs
To: Wei Xu <xuwei5@hisilicon.com>
Cc: Bhargav Joshi <rougueprince47@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, zhangfei.gao@linaro.org, linux-mmc@vger.kernel.org, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 12:19, Wei Xu <xuwei5@hisilicon.com> wrote:
>
> Hi Bhargav,
>
> On 2026/3/26 6:54, Bhargav Joshi wrote:
> > This series converts the Hisilicon dw-mshc text bindings to DT schema
> > format and cleans up legacy node names in Hisilicon board files.
> >
> > While testing the new YAML schema, dtbs_check flagged the hi3660,
> > hi3670, and hi6220 SoC files for using the non-standard 'dwmmc' node
> > name prefix. resulting in warnings.
> >
> > Patch 1 Convert to DT schema
> > Patch 2 updates the Hisilicon dtsi files to use standard 'mmc'
> > node name.
> >
> > Changes in v2:
> >  - Patch 1:
> >     - Grouped compatible strings into an enum.
> >     - Replaced raw numbers with proper flags.
> >     - Fixed property order and removed invalid hex values.
> >     - Added explanation for clock order change in commit message.
> >     - Collected Acked-by tag.
> >  - Patch 2:
> >     - No code changes.
> >     - Collected Acked-by and Reviewed-by tags.
> >
> > Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
> > ---
> > Note: this patch is part of the process for applying to GSoC device
> > tree bindings conversion project #
> > https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> >
> > - The file is enabled by arm64 defconfig (CONFIG_MMC_DW_K3=y)
> > - It is used in following
> >     /arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> >     -included by /arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> >     /arch/arm64/boot/dts/hisilicon/hi3670.dtsi
> >     -included by /arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
> >
> > Bhargav Joshi (2):
> >   dt-bindings: mmc: hisilicon,hi3660-dw-mshc: Convert to DT schema
> >   arm64: dts: hisilicon: Rename dwmmc nodes to mmc
> >
> >  .../mmc/hisilicon,hi3660-dw-mshc.yaml         | 117 ++++++++++++++++++
> >  .../devicetree/bindings/mmc/k3-dw-mshc.txt    |  73 -----------
> >  arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |   4 +-
> >  arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
> >  arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |   6 +-
> >  5 files changed, 124 insertions(+), 80 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
> >
>
> Series applied to the HiSilicon arm64 dt tree.
> Thanks!
>
> Best Regards,
> Wei

Usually I pick DT bindings (patch1/2) for mmc via my mmc tree and I
also just did. Would it be possible for you to drop patch1/2 from your
tree?

Kind regards
Uffe
