Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3295511E9B
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 16:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797160; cv=none; b=dgHV6no4OdAAQ9UA+vaVASkok70uqALhY8p0tHEPENecbPp9fpw+UfPrJmm/mCyVfjcdcJxvl90493NtUtnhwgMWnwC9Eyw+j5NUBoD88STiAAE+/lXprZk1784ncQcUP9dWW+giz4bI2z/748KUkaG8xfPkCX/FmE5W/dsMOnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797160; c=relaxed/simple;
	bh=hU7eRYQ2L+6W3KSv4c0PzkTILRIgPmu556oNrVZACTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vn7v/a3hUacbqFhjDZ0tqsU5CkKBMOZePBDlSHd/bkeIOc1B3JMI22kVj8tEYqe4pkcXcymPMRTFRP64cK+BRQaGBpnouH66zpuBdivZ2QRvjjXv6z5HhIBQoGs09SfAjy+oBVM4IE0HQfwvXfOcLlDo0hsteAnS7HYnbg9By3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c67175d176so1644589e0c.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 09:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797156; x=1789401956;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9kwN9YV2UIWR9vTDW/+7DxPdDKrz03iqFaixNrlJ+1U=;
        b=aVE8Po+0vTY1dM9vGocynfAZkX09P32tf5PBqrw8R+xxZm8SC30d3hSQ4vIHZ0nLwd
         1Zx1unCuphbHj7Q6jecPDFNgQMAKNarqGbyQtWdL4HnnvMu0w4b/jYpzQ0DCs6xTqRWk
         ZsvJ7Tie4y2/w+N2X7DojmavBWbFIQMIjHaYR2nUjz1h84PLkAASgFAQVh095a+EdFI3
         u57k0Zz1c+PVhaK+ibFeUCvAhQ7WgVnr5AbNIHkskqNDWoZC9rL+PTOV5Nay22N7dhKA
         G2efmaPdfvHMB4WZi+ICkZQqZl0gR61+Mb3BnXWSmjPJMlDvmeL8A5JuclwJvHHvBK16
         PuFg==
X-Forwarded-Encrypted: i=1; AKwUvBzTd13t1+NaVoPbPM7jaBeqkZrp724+K3yP9bSnbbPYiWVPI0YaNnRhMofIfHvsHgxrUlnRaKAxysHq@vger.kernel.org
X-Gm-Message-State: AFuF++lE8+Rj80G+vpibPDa0yw00TMllTa25MszRQPDi572OQ6y0VN1B
	LIpoQ6/fsRh2SfJNiikJVX/PmXP9aYW2xFNDqZy57EeLI5NIV8ZRvXMQR9buVv+L
X-Gm-Gg: AYBFou3K7yLcpwJn6LuLt+NrM63pcFHGR71y1eErS369k8t4g1IszYx90QGQPQ8+1Q6
	ynqo377HuOr6w7ckk0Je99M9a6caFUcv4EQB038PTjW698aY7NmO+91Tn2mk0aKA7fVz453PAxd
	S7SwHw0g5RLaPzht5CRgD0kfbdx9StDZfIOzr7fqr3dM1P7lDdL/Y7EQx1s5h9aeipSiz1OG0kt
	q0nyu4H8Sb4We6x4UCv9elzUMvcYZuthiMdAsXsDpbtWkw4KdDCpRGu/+bAhlW/xYHtZw0pZfu/
	bEC1d86vfrGX+t/uzsTXqVy3CjCDuD5HKrAs23CbIWlsYAZrDdIs38WfOQ5ZDWjhjC3RnrGLJtW
	B4ds+Y90M27MX5tPgFkCb4F73TEGGKHDLv+9+rHmsPWAkmUmS6aTmCumNMea5i6I5rgOob3VuVs
	NV76Tqz1SNhv6Ft5rhWm6S5yAkyGROVrl8XfCLdg00ygEwPTUEdcr2ICvwN4sbOc+Y5QbrDL1mb
	zrd1A1Oxz5bRlL1byr079UTV4cKtg==
X-Received: by 2002:a05:6122:4689:b0:5bd:81fc:ebe9 with SMTP id 71dfb90a1353d-5c7ed087c0cmr10548795e0c.0.1788797155740;
        Mon, 07 Sep 2026 09:05:55 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eec7c37sm7552099241.13.2026.09.07.09.05.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 09:05:52 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c67175d176so1644541e0c.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 09:05:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByuUBwWMJYZbXmiEF1AzZt4jrnqYfYMoCykdNCq4I+F4Qbql4iQSBGeAGd/jhmDPjlZXT5JQcdLnj8O@vger.kernel.org
X-Received: by 2002:a05:6123:67:b0:5bf:b500:c4f4 with SMTP id
 71dfb90a1353d-5c7ed285aefmr10980239e0c.2.1788797151556; Mon, 07 Sep 2026
 09:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153711.653861-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260907153711.653861-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 18:05:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxPf41iwq15WSMqWiTgi9XM3CXJeH_-e+FS0T3kDMz3Q@mail.gmail.com>
X-Gm-Features: AcwNN1Wm8DHsL2a0zy-uAEM1hkCTVJZKfNb68aES8fX2T4VBPEpycd5vofPPqGA
Message-ID: <CAMuHMdUxPf41iwq15WSMqWiTgi9XM3CXJeH_-e+FS0T3kDMz3Q@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: rcar-gen4: Add missing PM ops
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

On Mon, 7 Sept 2026 at 17:37, Marek Vasut
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
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> V2: - Add TB from Geert for RC mode
>     - Use pm_sleep_ptr()
>     - Call HOST suspend/resume ops only in case the controller is in RC mode

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
