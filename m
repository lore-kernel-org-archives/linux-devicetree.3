Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA6F48877F
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393602; cv=none; b=A3E0mFE+pvxxkJS1wO0/7jUdqr25xE5MUnOso1zTR8TEm1SNcZUaXFEy7hSCbmNg+kxs7knQ/9WfEqxKXf0cCKdErrGrSSnQjAHIc2ORB6fSlBDV3asCtbyqNoe6nsA0X8+dYw19AOgCPI+oXOc9uJdJ7T/dDaiUpLiz3umHOcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393602; c=relaxed/simple;
	bh=P8xJGaUWRfCF8FqZhZvElxrMdxQK2gqfDHniHzz5j+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ad4b+YIhCEcp3aA3Pp91Qq+QK3BPGaFpXX6YQ4VGM9e+NeBDqYyYmVw9H4S72nIGsEpE2MTYPYyZssNB8s3dgknElFEjEmnXJMxSDdYUJA4dSB7A6sKo2vEgUXCsuMrSV7epVdpTFRu4DMy8E8wOEW9o8I4TQ+nSOPxaxDo96DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eab93a9862so269651e0c.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 00:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393600; x=1792998400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eu8vGumKNUEJq0ogznls0IACooxNZPVx2SWES3Vu4VA=;
        b=cz1t5hxN+RrN/N1moZFlfGzaIzKdtqUTaIdI+Pd6Ax/PnGA3x2trfje3yV1kip5zkO
         Je+i4Sm712O03KnokTdW6xM4NwH44eNr3bFzNepzDPTb/QMsm0RYcHo/0OKq9XvtsKPU
         X9/oZE1WYLiNsCBXvdzQ/TZZkn6CwlQbU3lHGWzhUkBlQVkm4E5dkIAu2E5RcFDCW0AR
         QQhyO9K1MSjcFZX5PNPFleI48MNVPo2ihpFy53P2dovyj8ybm9xDuCGOaaBUO2BaZruH
         tiLb8Uqg5HBPhdu+s6lJOOjhJ2kAEjL7epGs7Fb7RzZWbtR/lDmKFIAnMO+ulWzx+IaL
         UzDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1ibK3jDoNU6RXQdYUDpaASnlxUoWva88jD0ycQFA9rZZuTSbbjHz4XhjPqfR6ijfyHgXTvn7xIJtC@vger.kernel.org
X-Gm-Message-State: AFq9FYLzs3b1RrX1NvJ4+clttJWQgWwKnzyJY6bADRkiAvkeG/q4A/3E
	WRVJpp3pah4tVmUIPT/8AB7lOTmeK8iNfcoI4jgv9+5Fh77wbDF0R0zIFtOiTodO
X-Gm-Gg: AYBFou3439DSjAMEQGAcqQuo0VAUUA7Aj+SHdaJdPDGyWeTwasa1/zF368S7rP41Lf+
	YAkNG9EtJyWX4s5GEwckckU7cJRcZk0LhNZLkbLANoVUMduLQ4RYSd3A2rkJ/cD+jvkNCOIpqYl
	HOq0w6KHsoqKL/5pOyRQA6kabE+NPMXuk67D3x6n+GB7QqppEcCd35ivjS6ROG88/aIQEo3OzfF
	tAujGsAHsnbRtGzPx1eH8l5p8GAv1Voix3ZtdCmG0rnKAWTdp0SUXfmSBFVdIm4uCdgNzVIFJTb
	+oblyhwCSyb9sGHQyrlSeECAvYXbuD09A7MeryTa3XTPkgtUml36xKwr5JbZ4+tYqkus5Lmq4Qq
	fJ+cByAPhR69DtHEvs0CY8k+a57+E4ZtCdHEhFIVFaIVHnsG0txUT88kdfLiMvTv+dHBN2MB6lP
	MfdXmfGFCiILRZ5zlLbJnx0Na1fhdhTYD1MXu3qjr/rs79c4v54JAqjvnt/lpV564k6lXoo5h4y
	V5QKNcQDov0aH321esxR6809++VLaAyPejq0NsI
X-Received: by 2002:a05:6122:4fa2:b0:5ea:a0d9:e5d6 with SMTP id 71dfb90a1353d-5eaaa6791ccmr2079037e0c.17.1792393599879;
        Mon, 19 Oct 2026 00:06:39 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990836389b0sm7773374241.11.2026.10.19.00.06.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:06:39 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5e941201909so513025e0c.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 00:06:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwsAtqn6/7fC//CsWNpbASO5zU7oZdwMy5RFYg4p7trwbKLh7rcj9OUP9vqSboTVOGfZA2dUkraczRl@vger.kernel.org
X-Received: by 2002:a05:6122:f1b:b0:5ca:fc48:5634 with SMTP id
 71dfb90a1353d-5eaaa419d47mr2207684e0c.11.1792393596973; Mon, 19 Oct 2026
 00:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004011851.866833-1-marek.vasut+renesas@mailbox.org> <atMEOFH8isshAwN8@debian>
In-Reply-To: <atMEOFH8isshAwN8@debian>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 09:06:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEUNBA8mDjSTi7MwsSMkKbfftu6OLXdbei8oUxibL_5A@mail.gmail.com>
X-Gm-Features: AclHuK8T-_1RFv1uF7KAoei6UxD8kd-EB3eCG1Lls8ceu8LKgfvwrJWWOjqTf_U
Message-ID: <CAMuHMdUEUNBA8mDjSTi7MwsSMkKbfftu6OLXdbei8oUxibL_5A@mail.gmail.com>
Subject: Re: [PATCH v5] PCI: rcar-gen4: Add missing PM ops
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Koichiro Den <den@valinux.co.jp>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mani,

On Sat, 17 Oct 2026 at 07:18, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Sun, Oct 04, 2026 at 03:18:13AM +0200, Marek Vasut wrote:
> > The R-Car Gen4 PCIe controller is part of a power domain. On R-Car S4
> > and V4H, this is an always-on power domain which is not shut down in
> > suspend. On R-Car V4M, this is a dedicated A2PCIPHY power domain,
> > which is shut down during suspend, and the controller loses state,
> > which prevents the PCIe from working after resume.
> >
> > Fix this by adding generic suspend/resume noirq ops for the controller,
> > which tear the link down on suspend, and restart it on resume. Use the
> > same PM ops on all of R-Car Gen4 to gracefully suspend and resume the
> > PCIe link on V4H and S4 too.
> >
>
> In the future, if any one of your Endpoint didn't allow the link to enter L2,
> then you need to set the 'suspend_poweroff' flag for V4M or other SoCs which
> pulls the plug during suspend:
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?id=f845c1e2d2d4506802244ea2a378ae7b04e90bfe
>
> > Test case which demonstrates the problem on R-Car V4M:
> > "
> > $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/pre
> > $ echo s2idle > /sys/power/mem_sleep
> > $ echo platform > /sys/power/pm_test
> > $ echo mem > /sys/power/state
> > $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/post
> > $ diff -Naru /tmp/pre /tmp/post
> > ...
> > -00000000  12 19 32 00 07 05 10 00  00 00 04 06 00 00 01 00
> > +00000000  12 19 32 00 07 05 10 00  00 00 00 ff 00 00 80 00
> >                                           ^^^^^
> >                                     Class 0604->00ff
> > "
> >
> > Fixes: 0d0c551011df ("PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode")
>
> Note that I changed this fixes tag to below while applying:
> Fixes: 0270dbe4f891 ("arm64: dts: renesas: r8a779h0: Add PCIe Host and Endpoint nodes")
>
> to reflect the fact that the V4M support is what caused the issue, not the
> initial driver support.

I beg to disagree: the bug is in the driver, but it was exposed by
the R-Car V4M DTS addition.

To make life easier for the backporting team, I think it is best to
list both Fixes tags.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
