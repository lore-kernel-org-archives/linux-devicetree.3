Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C2345D90D
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600994; cv=none; b=XfF7zjMN1tfIzowAgJp58jR0prfOGGIJ7m9jQ2DhtMN1betMUelhZCYq0O4hx6UTDnmQWjDShcUEwFTLSzmT/M8IA68KIH78WpNiwz8E4i2+gyfrfXFiHjvZuMRuiCFEdGUg5wQS6V4zwXgVk74iMa1By0eOzafm9FnLBP9IEuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600994; c=relaxed/simple;
	bh=xuYApr2qWZXqJ7pnlIxx/vPxMRV2f9KFjGcz6WImdvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S35o/9xm8ocN0s5q6Dhq63IcN4I+bJ/RRSyuq9ttKrT/udLnuLqyfcDTy3mq6u3usNVgBM64Djry6K2SlGEoQ7bUR4yL1yH7Wjy877RqzPrhDQ/ADS5Vp3PO0SN4usJ5DKgNA2IY54noAuIUh7mOL7L/5HE11+NS1fLH3jZbdmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-6740dd8b4b0so2491505d50.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600992; x=1791205792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BaSNmHda6KzqKPwX7Da3e/YKu7hL/7ztMKV1umyjMjo=;
        b=qCSCT7ZUfITAQxPFUXuwse6PfyHR9PuvRh/87nyYvvwk/qUBonpHPl4njCRopKMP99
         LI/MJGIMjd+OaRo0xM+OCsCfEFHKeZ6muqmilrU6ggls8yWWdabbghsfNgIQEziNlY6c
         TXVqpB+U2FK7eQqbZiyLuDZVvBXjcKDzr63f1GkLG5VEjw8kk0ecD93hytvRvW5ZfV4k
         2WcmimJpvfgakhpnyq+rUG9RbNFvfsKwNprBKYGvtpyajQGAiQ8YoEoosJ8s9Xbrm6V2
         uqj3U0WAkYae2I+iZ6SBC0xpkdmvUkR13oFvfpIDa//tIJaitg6bQHIoQyhB2ukWhKGH
         fXvg==
X-Forwarded-Encrypted: i=1; AKwUvBysnH6LY8p6leLk5Uzt1JRbybQJlnX+dIzl5AhSq2zXhR8upsa+hpwKtcTQCjObo/FGHX2CZXFQsela@vger.kernel.org
X-Gm-Message-State: AFq9FYJzfcqljnN1VOKZN/DYlFtEdz5OcYXKPr8A31A3iozmYoln3FFI
	zpsa29x9rTg82aLk/ECRt9DWdCMCc9bC/ZXyu37ItJlabgxs6f7PcMGwxI/WBMBd
X-Gm-Gg: AYBFou13mDKbxC9ncMQEc0bq/tELQK7FHNw+Wg/QlDZgJWgt+gZThb7b6hTa6ea76MF
	g6+dB4C8p1c/82s2a78UikVwmg1yYIV9AFi+P3ydfWrBUU/gTxkHczt1FC7n5/cH1tSo70MoHxt
	yFtFeZYx560SEVQwEpQf2LZvXNtGwAOa/YZoyNslbtwZH6VIFRz5WotjWgQKbkup62wW8sm0QCl
	GTrum70bF37ymhfTAnvUCmrIIfNpApze1IHbt3ccUDrjZkT2TOxaggc+QzAukQ1n/zo5eGz6y+p
	OyIucTumTIltCB7bbs4stCt6lIsDUUWnqHvgoD0IkpJnMhcWbk6jMcUT+Yr066IYBFnqrl/8KW0
	jO2IgwLorlrApIpiDmt7twX18Dt8cmOO3asEktUxdjU6X7yr4bCQK3BncutxJ4sOngVIUAV05CU
	JFgLY/azWw68XhD64kFusApW5rQcJAqS0SYNRKzKs7+IKWbcfaCh+8hc5e/FMvXGJWH9egG9voo
	Vbst8nVuqljI13mO0iSMP266wteU4cZCIFOHg==
X-Received: by 2002:a05:690e:b87:b0:674:1248:2b88 with SMTP id 956f58d0204a3-674124834e0mr3323783d50.6.1790600991538;
        Mon, 28 Sep 2026 06:09:51 -0700 (PDT)
Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com. [74.125.230.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dabed8sm80616516d6.12.2026.09.28.06.09.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:09:51 -0700 (PDT)
Received: by mail-qk2-f39.google.com with SMTP id af79cd13be357-93c67dc382cso152228185a.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:09:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8mLZOo0nU1TLecNc5RBIqZwkNCV2u72rbEEaIprueWx0oeWLLyqzecZVKUFYt2z3tw09PgstBub6l@vger.kernel.org
X-Received: by 2002:a05:6122:1da7:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5cb090282e5mr5364701e0c.5.1790600512952; Mon, 28 Sep 2026
 06:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903205153.283553-1-marek.vasut+renesas@mailbox.org> <20260903205153.283553-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260903205153.283553-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:01:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdALBm4qBpobaSN-O99Sqzf373tyMVOix252E7Mqjt6Q@mail.gmail.com>
X-Gm-Features: AclHuK8yjcBPkmYx_9D-prY3k3lNAhlUTr3iLBx-i-uhHIvrir2OFt7Ni-g4t9c
Message-ID: <CAMuHMdUdALBm4qBpobaSN-O99Sqzf373tyMVOix252E7Mqjt6Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a779g0: Add PCIe
 Application/Local register reset
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

On Thu, 3 Sept 2026 at 22:52, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car V4H documentation R19UH0186EJ0140 Rev.1.40 , Aug. 7, 2026
> attachment R-CarV4H_UM_009_SRCRn_FSRCHKRAn_FSRCHKRBn_r1p40.xlsx rows 410
> and 411 describe PCIEC ch1/ch0 Application/Local register reset. Add the
> matching reset into both RC and EP DT nodes of both PCIe controllers.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
