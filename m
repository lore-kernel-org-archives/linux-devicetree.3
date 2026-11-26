Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698646;
	b=zSf9fBh7XUVTtM50KhaabuK4DANFlGuHFIvFGRLHRuItEIDbZKi5DLlkMicP5lYZymPG
	 XtMi3oqg17cE3rXnDtmn2n4W8QWBY2g2fEq19r9cuDzHR/gSYYJhQC35vitd7EcqJ+P0C
	 X21ZOajkqyMHznlHZRyzXjbyPrJoNR+m+3JvAqnSzjcSKYMpcQ83qSjruAaqPmWVwrj3L
	 /orUfm11UIo8mt5XSGMbYUWVaX+hZtip/nbYIPbdCxrRYXyAlAsjLG3yaa+AvG6UCd3l9
	 KpriauQM36ZTMk/Ol9gR/1lctxdYDlh0SRMqVsh7haT3STyc8hgN7fskQZ6qONH/FBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698646;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=8lzx438I9zhWgrnJA+oH7tC0er2jtBCrxj4IPB3U0cU=;
	b=ieKtiCRXTRAFj7pyQG79bsTR4BMoJFaq8QlRLudq7lIs4k+2oTZECP6U93lI7yajHRwW
	 FWlbB9R/SVI/7wsg5OplIOJlAhAYys8S7c/hht9Dq9HwNRoMF2t/DTs7zPfylx0Y8SRye
	 X+BC9wtA0IVHuMhHfL7WH5Pi499hKqL3t2HvljSmMcypTJZhC9COYodwljiNe8Yfq5x0R
	 7eCGL+APC8J+v7Mej8+0IfzQ3pSVdg+BG3RAyNrl8w+yekOnqLhw6GyjXcqTjDM5GowHp
	 +UpQ3nLx9C23BRzZS7TIrfrqX+XN4G8VOOu2ED40CX5s+Jcx4P/mjwAz24g/5ht6/EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4084B606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4084B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-990a39ba4fbso1836278241.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:10:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698645; x=1796303445;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8lzx438I9zhWgrnJA+oH7tC0er2jtBCrxj4IPB3U0cU=;
        b=u2T+vz/r3xb7OYStxJTVk1nMkmYWSkNQxqGYks/3jLWUW4mw9sCRaON6gc01nujTn1
         w9MmMO0AmbobwD7fPxFL1DIQKRJJDt7TGNor7w9NwpwoK/SJGDIuqYfJ9YwMatvonQpQ
         k8zCwpoHuTMRs9CxWeuc+7HeZ2dNipCh5M5NkL0apKW6mpfHfr8if2FxDcwHvA92Svbh
         mE85HDkOyygvObtzL1gkqbAbvcp1RhGexZfC5fz16n2elUAN+jNNWqqG0WHjDlKHGt0C
         X272H7BZuQpW8HsECUTZhT5LqprEdBUck9LC/1OIVIk4YEh1qvSTdflF4FZvnZzXKAFB
         eayQ==
X-Forwarded-Encrypted: i=1; AL+hErHnOfsZhI32kHGBHnqxwRQhm9F476ASQ3a8Xgm5eQrqA9cDDRR5BTfH56F33SUcxyW9Ijcq7jHI3UuE@vger.kernel.org
X-Gm-Message-State: APuU4Z/9bbvusjOkA5ySh7QkldmME71jsX4D4BQYMfELYewp/HMm8Q5T
	H2pQoGedOF12Z33w+k/Cxhzq8bkARL5oWYdEvEQLxsgRGc8OIAFqMddhhNp3Er0v
X-Gm-Gg: AZFdTZfqdBWw5vmbfhGagpSJrbpGrKoepmCyGbwBxT723mFcPF8iKWf3MUb47D2szY3
	CTjDISdNJYKv9XcVqakcVd4SBr5NAJuu+cIa3bFE786xJX6E7LWUmdJLf7qVx696oqYvwLaZX5P
	7IzJeZspdi5uStFQaCX6rcS+Q10ORuFAMaYCoC3ePhxVanzkh+QQk8mJSq4fk/G9bdSQHTMr5v3
	30xfFT/SPhav5VrIQV/FrBlnQ1iXdBwKTGdX+6Lh3qPgPlhD6zG50QuHCRuUmkCAoNCKM/9UYQw
	qff4As8MFTC1Uo4IYPovPGGMfx92+GRBkxX0m1VvRCP9srqoorz5blB7pUnDmhCNJ1ryeCDhD5W
	KTtDXeH/h4e8sdAt/Yq1JDGwCI90Fkf7Vjd2Ib0BPlkosY4s2rJnAq5bgRF1UmIgUKxwH/4cBrc
	4SH1j2eZ2FWawDiaEa9uwlS3E3oALsXPUREIv33vE5MGRvxEGJDkRLACWR8xRqamKggqlUypJ//
	o6mI+RUOAhISJCZlIjFqRdGQp1YT1osY4tGf6sf6YRWmsgHEq8brXzjOwWu8HtqNTNfiYNaVfZx
	o3Kqfn4cClBusW7txeRajorZAO33irO5I4iyxAqrUtuBAYbvfUh2JklWUbbkr96YR1bbvHg=
X-Received: by 2002:a05:6122:4b88:b0:5ca:fc48:5634 with SMTP id 71dfb90a1353d-5ee8aed35femr11430781e0c.11.1795698645047;
        Thu, 26 Nov 2026 05:10:45 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0686b1sm22146324241.10.2026.11.26.05.10.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:10:44 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ecda93627eso2238392e0c.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:10:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH+aHuE01ePcwFkHSRyRYDVGqscdjTTs8lbt6ayywTBaX9qPlax2/yuxGmVyZ0xwYLqCWi3fSgifyTs@vger.kernel.org
X-Received: by 2002:a05:6122:1352:b0:5ea:d1c4:7cbe with SMTP id
 71dfb90a1353d-5ee8af79c4emr10201505e0c.23.1795698643771; Thu, 26 Nov 2026
 05:10:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp> <20261020031049.969895-18-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-18-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:10:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWk9pZdJ+eh0dNHrZSMVDe84_rsvmrD=pC1Fjy9wEyp1Q@mail.gmail.com>
X-Gm-Features: Aa3M54pKW-6JgYTYZWdXwvcVTMAw8E4E5W6RppZyD7aVJ1bsffJTTTgDbIyWkEQ
Message-ID: <CAMuHMdWk9pZdJ+eh0dNHrZSMVDe84_rsvmrD=pC1Fjy9wEyp1Q@mail.gmail.com>
Subject: Re: [PATCH v5 17/17] arm64: dts: renesas: r8a779h0: Describe the PCIe
 AER interrupt
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> The PCIe controller reports Root Port AER notifications through SPI 454,
> separately from the integrated MSI receiver interrupt. Describe this
> interrupt with the "aer" name so the controller driver can use it for
> Root Port error reporting.
>
> Append the new interrupt to preserve the existing interrupt indices.
>
> Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
