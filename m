Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F2D379EC8
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785348803; cv=pass; b=oqZ1DslK3QBPRyW2+JvVi6VePl7asjgRYm1bLwhRgygLxoTvQeTU4agNWyuClKUm/9SROyXzOyI3eMOfjiXGbVmRcgz6T7moeTrhQMwt7YKUAx/PaDuZbEuNqRZ+BKZWfP6fNx0hKcAl5lT4nrCOdB322KU58Mw9L7kao+dZst8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785348803; c=relaxed/simple;
	bh=l9Uk7VyAGhBOCH47wMyEDvu7VOuPXGyeXwTOqqtrNwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1WbbEo1sdIrqQl9KA5Y8V560pnlwpXDUn7ZmmoKGdFh5ND1+l9/yybuSd+IsEJXFuIqUx1rD5DjUKSN+/0mKV1g5rbDyboVkMomn+yc1QpA8ide0LEhaAb/YVU+6ZfmnMvq9CSDZbt4uDvy0EAYyDeXXmmrGLUFw0E6nah4lvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXdM78FQ; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXdM78FQ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a051b73866so1668858a12.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785348801; cv=none;
        d=google.com; s=arc-20260327;
        b=osWWKlS92S+FJFgLzpxBI/odYCvhnI7tNYAb0Xe3H0bM340Eg59tRJHL7cATTChOBe
         Burif74KaO+55yoNvwbLlqJiBJZT4Le3hWnyLk6p9rdZkhQSvL0lc4Y8YDwTOW02Li8R
         8+xU2rSHJxUHlOUSFDAY+Kze/hdpZPxxjO0NfWzKuZ1QXrDdWRn75oPrFuqz7wEmXAuJ
         YLWyFcUkWn37AxQrebC40N2u+eyIlIYC3FZZwHk3a5YT4a3B+Z/VV/ZJ6Rc7I+tpdpVp
         Un1ifSlvTMwds1oL3PtzgnbehbXbxKNhE6hOjL7pNbYvWyF+jVMJJ5M9jIfAfx6V1j4U
         PBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w1z/xndzybZ5D+AlRgPZw9qYMQrcZbDchb7urQIjmOM=;
        fh=dvwdQjDdzp8geEq1ZPh69UD4RyuyC82eG3537ggWc+U=;
        b=gi5nY1yc/EY4JoQoyvgGSytvJYwLEYv1UE9HGAuKMsHcSdCegbmcQdCFt8PKSxwRX4
         UGZvv28nlzcxZCqGquvspurlyVVjgnKFP81doO71PHpVUNtf2C+k8lVnaszo0Wr9w1Pl
         H7gC8AQSIJqNSA8V+4eQeJzQe03hGjXwEOzGkoiD4MzqwsIQTx9EWtkEX5DrjFgPXlNr
         gbLMeE3Ers/LL00S4b4OfonHzl01qwdnJs8r54xT/uoy7rPPaa4nRj0Gy8kg+T6a5bWO
         RVutnchco5dC2IFoPd41kmLt3EPDHNNRgJPbXX1BjSeQxHs/KZPR/85qUd88PqO8cC6I
         i5UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785348801; x=1785953601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1z/xndzybZ5D+AlRgPZw9qYMQrcZbDchb7urQIjmOM=;
        b=YXdM78FQofmjdWCB9Set1P1CbXFia9LTTlYsZxtoOXo9peUSO4I0xexFTLaCy5GLE8
         6ma0ZCmnD4faHQcTj/o7RK8e8SXdqMYrhjV7TcEIcu+rd9vXdfqL00hC91w6hIv3YmZj
         wSpxxHUbbFw+FYbUp9ZSKI9eG6Bqni1tKEcnJjuym+bQx4NDT/1bLYh3FZEDE/RbCDSq
         TzJRalUs98o0TxIUZA1uEwX+/p+hiHWEa4x9kHblA69anWOJEfgEqXy37JBNpO/Y+jrH
         hj5FdJwt7WnmahnrIVxDDn24/QeNL14Hc21SiKruQxSx33WSYlfMwKRQk5/IjVk7ix+w
         efuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785348801; x=1785953601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1z/xndzybZ5D+AlRgPZw9qYMQrcZbDchb7urQIjmOM=;
        b=rQXKKQB6ampcjMG3qoFX86QOF0ypk0Rxa87dsUBAirE+49Vrp1nlrjgQakxmnO+HNJ
         wj/lUXU0F7O8YPF5yB+a1+ZbbBjjahC8EI16bKrlmTz0FRuxOQ88iZSn6gy+GSPNER4y
         BBp8rUnG/gfHKLInMFJe6cXCy+mQ6HdHQHGlxE7bVWfJzLqWHR76JFbjhHeKRGa1ZVg1
         X3HKE/XrQJNPLfB9kqysODCngc969M9ZXq5qrDLWQziBIFDX/EGOvjwal2wiCL3z1+n5
         vcBxf9T9I5xKZ1GepeLwu0GG5q0ArKj1BUKa4yeIgKxvv8pxfAKeZkxWcweYrTZvsVFD
         XKCA==
X-Forwarded-Encrypted: i=1; AHgh+Rr21wQjrgw6k4JeZR5L1isVLoYpbv5gIRzyKf3gzlA7jtqzuRiNoioQBZmknokwMP6cxtreQdV0RkQb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Bqo0d1uZj5cF96apv3byQAS2hS5URmB7w/fWrkA/Bf1azB9f
	yaGHh3KhlJJFQemY/lx9f3I7JHFLSnG2tU97Ixgxbmz8b7K1w7IwiifSCSSy+jPfKiGZsGZmc+F
	V1PzfSuByqDRxLJM/BBqNbsiuKC5Zh+t34J2M
X-Gm-Gg: AR+sD12AF3mZVN1Ryde8otYE/O1fNvnKjshGNuROwd1dvQCqOvusVlwDCNzaYIXnt4H
	oP9gbqs7HrAiefg4Tl1fdXu4C/sgfqtwZWK0AR43yTo4vIbzKzJumH/dwNgm5I/uOm9m9ufADYp
	C2+GwYcq4uAA5iYxXm0Xy67u5zfntKQ8hOXqHxoNiJp6TKT4I1qqmGuAQTiGdZWY2mkV8oxz475
	mDcdUe7EUN+ZV/Um29GBnLrSOhYLKKUYRCv6uQeRrLbtJPF6pDidhV9zuoYYldzujGPvESSi4/G
	cKFjvxu6rkKzz0tHA2l9LqsyKzGnOE99iHcPN6wGgmkkZe3HZ78Q2p22XLEv5etASsXVzlvK6GS
	rU712K9kZfPtt7MZjwJZifaT4g8xXv/ZuGyRsbx7aHhYWfd1tXNLtTHpLRALXbN7AVXdhbeBvR9
	fMnocpFbrlwJumkUs0mold0uOneNtHZybTL/SvRUBp1NVvywW829Ug7Bf6K7AIUGhFRhQ=
X-Received: by 2002:a05:6402:3899:b0:698:5610:76de with SMTP id
 4fb4d7f45d1cf-6a034a0b14amr4298664a12.4.1785348800634; Wed, 29 Jul 2026
 11:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628231156.1254012-1-rosenp@gmail.com> <20260628232714.BD9581F000E9@smtp.kernel.org>
 <CAKxU2N-3zVUM6A-fQnYWud4O7M55Ghc-wnTCG+8DD6_nh2827g@mail.gmail.com> <ba56ee70-9702-4b11-ad04-d63322ab60b4@app.fastmail.com>
In-Reply-To: <ba56ee70-9702-4b11-ad04-d63322ab60b4@app.fastmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 11:13:09 -0700
X-Gm-Features: AUfX_mxsWPdeWCTjyGu9bwG4Ft-f7FWsPOq11UXIaV9_Yv9Ny3dg6AFlEw2whJY
Message-ID: <CAKxU2N9Nt+HF-4TzB3+_5ta=28wb0xCCLuUVO6Bm=LW3ZnNmHw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
To: Arnd Bergmann <arnd@arndb.de>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 8:40=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> I saw this in the fixes pull request, and the descriptions
> below don't make much sense to me. I'll hold off on the pull
> request until someone can come up with a fix that they
> can accurately describe.
>
> On Sat, Jul 4, 2026, at 00:17, Rosen Penev wrote:
> > On Sun, Jun 28, 2026 at 4:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >>
> >> Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
> >> - [High] Removing the PCI memory ranges from the parent `axi@18000000`=
 bus breaks outbound PCIe memory mapping because the child `pcie` nodes can=
 no longer translate their addresses to CPU physical addresses.
>
> This makes sense to me, but doesn't explain what caused
> the observed bug
>
> >> commit 4f061464281d4964ce46dab60d36a09328f14862
> >> Author: Rosen Penev <rosenp@gmail.com>
> >>
> >> ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
This patch can be dropped.

https://lore.kernel.org/all/20260727140939.389-1-strst.gs@gmail.com/

is the proper solution to the problem.
> >>
> >> This commit removes extra AXI bus ranges that overlap with DRAM on
> >> BCM5301X/BCM470X SoCs. The intention is to restore the original
> >> single-entry mapping and fix PCIe routing issues.
>
> The DRAM ranges on this chip are at 0x00000000 and 0x88000000
> and don't overlap with the axi bus ranges at
> 0x18000000/0x08000000/0x20000000/0x28000000, so the initial
> analysis is wrong.
>
> > With need_ob_cfg =3D false (no brcm,pcie-ob in bcm-ns.dtsi),
> > iproc_pcie_map_ranges() is never called. The bootloader has already
> > configured the PCIe controller's outbound windows correctly. By
> > removing the extra AXI bus ranges, of_translate_address() fails, those
> > bogus resources are skipped (the OF_BAD_ADDR check at
> > drivers/pci/of.c:377), and the kernel stops registering DRAM addresses
> > as PCI MMIO windows. The hardware continues working with its
> > pre-configured outbound windows.
>
> This sounds like the bootloader configured ranges don't
> match the ones in the devicetree description, which would
> leave three options:
>
> - change the bootloader to match the dts
> - change the dts to match the bootloader
> - change the driver to reconfigure the windows according to DT
>
> Can you check how the OB windows are actually configured
> by the bootloader on your board?
>
>       Arnd
