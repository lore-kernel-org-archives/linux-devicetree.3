Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573D547CA72
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349180; cv=none; b=izpq4jxDOM2R8DTTNbBAwYwFQIK0FEBNlRevLa4TcsvpWOhl1Yw2htfBXXVrlCxS+N6qcaucyfF/sWpR+YJ87SrRNzOdlgoDd1X63BSmgD+2EKZJ0O8FLN3jl0lvmmowaJqba+LTuZPpV2hfp1WaF+6f7LCly8o+vDn4HEqqjRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349180; c=relaxed/simple;
	bh=GrBIm0BKS+Mu7/OLWlqezUi4tFJ6U0Srqj6VjLPOZaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Coas/HAMI7Zv3Ztdg6lfHyvL40OMomenJFJTvUHuLuA0MY0EM/8CLfMVeeTRoHp92HL+uenemxB2SOiiOAzbvzrdjMzD2NA3JjDs/wOcSrjUuxvrRBAhzlbr1I+94plZbraTufjLMomU8AdaYmqEXsFSbOORMgSiXe87q+5I54k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97ea7f0d417so344245241.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 04:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349177; x=1788953977;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XEAVGW99jRYpfKK+i5q1QjOfB2bMJtHxW0mUFyR7MIM=;
        b=bGKyv/3bHPHLbF83w5rlntO9n0kqwE77cx1GHErXEcCjtR04fmpAXlPPId/LS5j+g0
         R5ICFbwhx4HPtgXA6mO3HrLR4Y+jue2kydWbOIBmNC5oNT03so7BDidzlH/JB2XsCjzd
         UZb3vRcTotTq/Ne6nYT0Dmotg820QzCI3m2N1GxUO6oQoauZhagkeTIBQRiXxwW7f5dF
         v0nhqVk0QgDgsyvXiyRHbj0BPvPpI+q1hp7imEDyumzY8UHju9ebgyBEwqCSMfCWwbfR
         TCXLxtZLGgOzEyaoej5+qgaz6Eu0m2OEF6ivd1KFfNzlI5wl0JDkeYeQRv69eeNVlREl
         btTg==
X-Forwarded-Encrypted: i=1; AKwUvByuuC70FCvHDCo1U/bR2loR4k8oHJRXEIM9JaL1o7Qjm7TSmlBKYDRePHwmJTwAMjTFvW4qG9QypIeZ@vger.kernel.org
X-Gm-Message-State: AFuF++k7hUPkr8wMMzvY4TSGp9hJFhDnwjx1h/7kqk3jZKlbxzHm0100
	tCX1AZ5Bt0E+K4h04wcHod3yAYIT/Dj+Bw6ah/45vu4uKs3ySRn5gxlbiOwtUkT9
X-Gm-Gg: AYBFou2UR32UEl8EcuHjDihenLe9+frgc3OiUNoKVFoas0x+6oucNcRvix4xAeYEtig
	bjwA4lIFwJIbnl/3MccQrjl969aXB2wwGNj0OB48XMaKWHIGjbqmW4gAGDlxGCBEOU5W2wwHSag
	h1XNuT4pjR7X2FJLVPN2m2eayooopv8E880GkYpbz4OmEaOxOEHHyl1ZOjlqJHb5XET12ZWJklE
	4dEz3wL+cXn1tEqvF99hAi7wY3cHDL2n3MK/yhycQeKL/U6Uw/FFwO/tw5HeNhuSpeVs8JsfbvM
	yXL9UBfm+Dd6gE9u32BBXQM3v4EhSxp+qTdAzDof9sFMddSfMbL60KzXrKhX7NjiVj+NV4MCbh8
	dd9WNXtohBlcZHCSfDAWqLh9CZLWuesQExa2iqW1F9A2sXQa6gNlXAd5xKF2/c3TyhCXio45m9P
	zrIjdMdtfpjVeWRsQOUX3KxhyQJZwn4GxIe5HAe7k9JIihswxB6amHWB8JG5SynZxOKqysKeJSE
	qBy6+ju8MjZpqVNm8pBPPyX2byR+w6xueC1BA==
X-Received: by 2002:a05:6102:3fa8:b0:784:5883:9cc4 with SMTP id ada2fe7eead31-78a1f326a40mr1200971137.11.1788349176904;
        Wed, 02 Sep 2026 04:39:36 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980673c9da2sm1879201241.9.2026.09.02.04.39.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:39:35 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97cbbdfc2e0so349377241.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 04:39:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZx9WkHC4UJjC86zt2pP0BBzMHY4vok2cW4RiKfUxkCKi0bbeiXDJg/zA6stKF69DYUHK4VaIW281n@vger.kernel.org
X-Received: by 2002:a05:6102:faa:b0:785:bfc7:26f5 with SMTP id
 ada2fe7eead31-78a1f33dfd3mr1197143137.12.1788349174855; Wed, 02 Sep 2026
 04:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:39:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCRF_r3TXCRYZs_-AAn9WL36HUF4_VjGs4Y8Y4T2uRTA@mail.gmail.com>
X-Gm-Features: AcwNN1XYp2AmohzI9M0wS5P-4B-ztdbPdhzMYLGxaK77VTrG86b4xj0U-T2WG1g
Message-ID: <CAMuHMdUCRF_r3TXCRYZs_-AAn9WL36HUF4_VjGs4Y8Y4T2uRTA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Aug 2026 at 22:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.
>
> The GIC ITS does have master interface to issue transactions to RAM.
> The interface does support cacheable transactions, however, it does
> not support shareable attribute, because the AXI port signals are tied
> to inactive in this implementation. Therefore, add "dma-noncoherent"
> DT property into the GIC ITS subnode.
>
> The GIC redistributor does not have cacheable/shareable, therefore
> add "dma-noncoherent" DT property into the GIC node.
>
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
