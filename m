Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0822245BE3
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776816; cv=none; b=NwLRTcZVECdT09q0PReJD3zfvitsF16bgRTYkif/cbo1izy6/fsGaM/9qxoaB4iO/jXFYyGWBik43JZC+gtKb+MM03wDn/shiCYavsdoATgVhCn4ObyD4eEiDBrC95Gex8lTPYuRm0PgJ599O9SKONycvuwnhRAs49ct9mvplEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776816; c=relaxed/simple;
	bh=WXRZsD3v33qBAuPkHtARz2nCLJEB+edBNngFTzuWl5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYYAxgzEBaCUriY/kXSHwNT0q1LT2jaU1Qdc9Y9d/hkDK7xDQaVt6YSOyrgIwtlz6bfYx6yAMBqWoCFjwF2oweoNIURs3a6L0iAg8Ai4uzd9GnfDdy/tuGT1VAbq5wb48c2VO58cgaCNbOekuyfGapDtbHMp2P4QDGcazluJukM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c7d1512dbfso2804681e0c.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776814; x=1789381614;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hSWXrsN8UfIXC+P+F15lvL0/C8YBIn2HdB2Vgr/1RcY=;
        b=NrU+XOEzRNXMJILqglamXKTVSkNpaCpa1NbQnPdpKMmS16vKnNJ6Ht+sERNBeTmHuI
         k13YP6L7FY7hD3Bhf/pDGUf88BAZPbtIUJs0nPspHWSuwpz8zJfMb117O7YlaQp11XcF
         cVqvR6xFIi7l2/U0MY7/yLp8WgH6IGTPPjTVtHrikZkgoKbLJYaIcaN91YOmxXQMdhya
         XPH7THNQY2skc0LsxmfnS8+g6saQirVjYMgopz+xvV7QWcw89+/ODDMkDB+L6jy/v9B8
         u9/AK/rXV2t4r+Kd+S1lKHepH+LzUFv2doeDaFL6hpaoGJweBIlW83/odPm3CWmLgGY8
         ExIA==
X-Forwarded-Encrypted: i=1; AKwUvBz8niYfLFaeImIYwkMaDIjE1hXRMf0AkYxq8Gx1Y+1NcgdPdbDe7Ay/2ntSLmNkMeATtc6LbppMeWv9@vger.kernel.org
X-Gm-Message-State: AFuF++lJ00Fa3jEuVXydNjq0SGRclYIwN0VGEju+/3Agiy6ISgnT99Zl
	mAl/PtRRIbLWhG9tFEz533NTrop/uRg5w38Pf9T8T/6kqVQRAHvZQcm1iDm+lOT9
X-Gm-Gg: AYBFou2XBr0riRtpgc8VxTx5C22A2z1hX4aJDjlrM7M4V9VVFMGpKP3RqUF3JTgET+q
	Ud1FIj5OC/i0mS9i+HfD5HY+T8/V/6GLL9mdSUTHFMkV24XdiRW9/+Byvbi5fPe5MWHuVJ1JuZi
	nUNCx1TyTKM3vhBUGMJcn5gO6bqW14/lA0Y8cagJbYZ90T431zspt/DCGMvos005Z6bAamXeJh6
	bXGnHu2HTw9wACvlMdy06Yw1ctEAYAi71b+KUWC9Qkyq5klNu/8nCeJjkQAKGpeyM4syvp2HxFf
	JHFsbAaAjadsk+rpFiem1oT3M7sVIxnGUk2JEBn6i9Q4oxTVV9xNoG+8G01Vz5Nr0BS97XVnK4Q
	h9sy6Px3V9FTxaKAlsTqYBOxNgKHI99oQqq8IrPHwinzyyzDyqNQTZlkwuQBzTEn7M9TiW4geE7
	CyR89ZlFoooekCO9Bp5GzeDaA/7RHESLHY9MR2yNB1CK8Uyr42TZnobz2upUVPHLI0pHo91wk+M
	SQblEPPWxnG1M1zi75w7m2/jw==
X-Received: by 2002:a05:6122:881:b0:5c5:db2b:5baa with SMTP id 71dfb90a1353d-5c7ed7cba16mr10293889e0c.6.1788776813836;
        Mon, 07 Sep 2026 03:26:53 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3874acsm7250119e0c.15.2026.09.07.03.26.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:26:53 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-966e7380109so2636016241.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:26:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBXct+yT7MMUTV8ZMiSUz0phvBStAr7MgCWJyZyUDg4R5F1qdQ7rQIAKW1uB/w30ALKwFH8nXaxHBd@vger.kernel.org
X-Received: by 2002:a05:6102:578e:b0:778:4fe0:8297 with SMTP id
 ada2fe7eead31-78a4aa70e09mr10103340137.11.1788776813353; Mon, 07 Sep 2026
 03:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906173234.522400-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260906173234.522400-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 12:26:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLxG8xSHwTneu=xT8bxs4io7QSw7ziyPUDo6nc-zx6Qw@mail.gmail.com>
X-Gm-Features: AcwNN1XXd7v4I08TWK48osXGJh7gXuS6LbVWPy2G64ghI87CCZ4swuROz-rYLO8
Message-ID: <CAMuHMdWLxG8xSHwTneu=xT8bxs4io7QSw7ziyPUDo6nc-zx6Qw@mail.gmail.com>
Subject: Re: [RFC][PATCH] PCI: rcar-gen4: Add missing PM ops
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 6 Sept 2026 at 19:32, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The R-Car Gen4 PCIe controller is part of a power domain. On R-Car S4
> and V4H, this is an always-on power domain which is not shut down in
> suspend. On R-Car V4M, this is a dedicated A2PCIPHY power domain,
> which is shut down during suspend, and the controller loses state,
> which prevents the PCIe from working after resume.
>
> Fix this by adding generic suspend/resume noirq ops for the controller,
> which tear the link down on suspend, and restart it on resume. Use the
> same PM ops on all of R-Car Gen4 to gracefully suspend and resume the
> PCIe link on V4H and S4 too.
>
> Test case which demonstrates the problem on R-Car V4M:
> "
> $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/pre
> $ echo s2idle > /sys/power/mem_sleep
> $ echo platform > /sys/power/pm_test
> $ echo mem > /sys/power/state
> $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/post
> $ diff -Naru /tmp/pre /tmp/post
> ...
> -00000000  12 19 32 00 07 05 10 00  00 00 04 06 00 00 01 00
> +00000000  12 19 32 00 07 05 10 00  00 00 00 ff 00 00 80 00
>                                           ^^^^^
>                                     Class 0604->00ff
> "
>
> Fixes: 0d0c551011df ("PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks, the output of "lspci -v" is now the same before and after
s2idle.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

I don't have a setup for endpoint mode, so I could not verify or refute
Sashiko's claim that suspend will crash in endpoint mode.

> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c

> @@ -952,10 +968,14 @@ static const struct of_device_id rcar_gen4_pcie_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, rcar_gen4_pcie_of_match);
>
> +DEFINE_NOIRQ_DEV_PM_OPS(rcar_gen4_pcie_pm_ops,
> +                       rcar_gen4_pcie_suspend_noirq, rcar_gen4_pcie_resume_noirq);
> +
>  static struct platform_driver rcar_gen4_pcie_driver = {
>         .driver = {
>                 .name = "pcie-rcar-gen4",
>                 .of_match_table = rcar_gen4_pcie_of_match,
> +               .pm = &rcar_gen4_pcie_pm_ops,

pm_sleep_ptr(&rcar_gen4_pcie_pm_ops)

>                 .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>         },
>         .probe = rcar_gen4_pcie_probe,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
