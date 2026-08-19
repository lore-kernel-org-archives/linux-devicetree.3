Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7245437C927
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148170; cv=none; b=DLMeLPVnZxnhHm7lNWb4QzBMMO4ry2c9rhwmdosHzTGh8BURTy3sAYVtIdpNya/Ik4twSjvWMUS0hBvx1rq7vXUPiRR/+fHoLocGO6O0L9F5MkCSh2cx9KH9hXNdO7oTZMUlPHo3dkewlhIqz2fVCiW7MHWARhIoE8h6qGkUYh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148170; c=relaxed/simple;
	bh=0DLSrAiTsD+9mc3Vb7d5/lW0XmN5KPP+fle4/Gx9vJg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=pOMhuL3fTRChUrtSeKDaMi+D3yZ7fESoJL7LxF6tAL8l3cyJGobf6VQHCqBe8d1CuehfkKDrt68HBvubxdsS6h/Y1Q2gw4J/rL9A+R3AkO5RrdB3HZdLIcNFR31QPZf7aSCrzCN1vkLZYYZ7XQMd1neFf9nV2nqmZQOoAFWtnHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=DV4zNoAj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="DV4zNoAj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so13738265e9.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787148165; x=1787752965; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Co7HS0jVxwA4gYnxXevJyYoop6np3ZD8A3AJ6SheuSI=;
        b=DV4zNoAjVenIk/c0x5DIwTQE22PSjNs/YlX82tI8scwfTfSuVd905uj1C1GBTWyS8Y
         WnfvZ0WtqopYuSPuFi3kdMC85rzqCXiJoaYHK3fraXv5sRVsnV3wOXC47ptI7brUjOkb
         442OvQDpQDQZH6jlP8MFmMewqa7w4CjZa9OqaUhFO5q5zF/e1DuvNjTUbREPIvVau96n
         4ID+Y+UbXGofbO5BE8jcROlwb3DNylw2oHZUy8J5awdPy0ySDPUDZjkNGit+hO1nGS55
         kKXc2LQc2cR8Wop33FNK7Enr069rmzIg7d2iw3N0f7h4yhJYgjNhPMuomaUxilVmmbhu
         cTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148165; x=1787752965;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Co7HS0jVxwA4gYnxXevJyYoop6np3ZD8A3AJ6SheuSI=;
        b=Z8SF0f38LsJD7NB4P4AgUCJt85sFWHJAtgVtkGyt7T5Ei24SvPUpXLNq1GVNrTY8wv
         4xn7uxLZIz4g0XrXWbjIwasK7FcSrZvRu+APWX5TUcoN3HxffTHjVBcoyKUJqBuZRTYS
         h88wZDlKqZ7TsTuhZP6+g0+EU6xfaxrLIdL15LuUGlivySRjTVZiByDYpNO5dFOlSfW0
         6rPqHxV3LrieOBpAPg9PgLBT+MpKAKourC6ZqaBxRZXFg0G6dqK2keAFs8uUPzykK7JG
         spnpvhHreXk6RJItQRa3uANZmVuVJY/X1Muki2L7sHmfAE1yX2QrdMnHlHJOTK7FMrZR
         p2qA==
X-Forwarded-Encrypted: i=1; AHgh+RpcUP1JN7Do6KuxD7fGLF/40F4ScCyGpAIscDsDymqCNunuUA2FCK0eIYGoLDa/EcQ1x5rIZDvzpjAN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx80mz+oDOo0vprmcenPV2Hj6BxXX+ao7vg6XukROJ+umXfZro
	pOrULjL0AszVrNzNYr4bkS+4T5XdA8rBvDlFe4Afx7/pwOLS5ubflTAoIb4jn1dDkrk=
X-Gm-Gg: AR+sD10lLzOiCRuw2bU2BlAvpemlyd3h4tG8h42P14jmnhDob+ez7IVpK8ONdsIgSvk
	6ccSXoHQHC3rHPsC+QkfxGbqB0O8RU65nL5bGDDJMiq0x/7Nfn5fKlpi9eniwkloqoA0Czt4klu
	8YKMt8BClE3wj3VzZkJrjo2Df/S5l6RW/dSPg06Bxd0nbpABuPXDryRFcmm1GDLPeiiUFKmAvDK
	MLSnIEad16sYQ8VN5gJ/Imw4I3fBOIYxC1miZv/Pk2cUk1iherlaYXRIf7fcTw5an3YfL6K5msl
	qCjpLHjBTXOoXb2LPG6AcEGbzwMw6q2AQoeyOjccjBObgvP17pVEkpR0YZN3NF0ml8cLIXdmwGR
	MGGW0SLzqBj6JNvqmsALqgATSxwlJqI1xw/slucOJlMIg/FSRQ6eHCl7WKgGazMu64iK5gbwKSX
	Jxbwi5yDpMXrjA45nn6mH+uqC4zKP2NThHxRAWSVExaUM93zBSZHawzHZU8nXukrt8FwLQJh6T9
	Lpfjco=
X-Received: by 2002:a05:600c:528b:b0:499:8d9b:832c with SMTP id 5b1f17b1804b1-499aa0e816bmr89871925e9.4.1787148165591;
        Wed, 19 Aug 2026 07:02:45 -0700 (PDT)
Received: from [10.0.5.39] ([2a01:599:445:d261:4474:9672:b73d:5481])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1111a7sm65896975e9.6.2026.08.19.07.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:02:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 4/6] mfd: aspeed-pci-core: add AST2600 PCIe BMC
 device driver
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>, 
 yh_chung@aspeedtech.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Lee Jones <lee@kernel.org>, Tan Siewert <tan.siewert@9elements.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, mfd@lists.linux.dev, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-4-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-4-fd7cc0b338ea@9elements.com>
Date: Wed, 19 Aug 2026 16:02:33 +0200
Message-Id: <178714815308.32179.15619694497271022262.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787148161; l=2564;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=0DLSrAiTsD+9mc3Vb7d5/lW0XmN5KPP+fle4/Gx9vJg=;
 b=Yv6DuRVXQ2eVIdd6FJVizmL+OmzjHQrDLg4pQ5mdXCZvnzUvsviM6pk+86GADUkAh8FQzylEb
 nvtlCfTGTCeAPv5Md2UT7KuGRs+InVgjAh4bWM68kaHE79DwTv1qQZ3
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

Hi,

On 8/18/26 12:29 PM, Grégoire Layet wrote:
> Add support for UART over PCIe between ASPEED AST2600 BMC and
> host. This is the host-side driver.
> 
> Based on ASPEED 6.18 Kernel SDK and trimmed down and changed to
> MFD driver.
> 
> The AST2600 has two 8250-compatible register set usable over PCIe.
> These act as two UARTs. As there is only a FIFO internally between both
> ends, they are called Virtual UARTs. This patch adds both VUARTs as
> plat_serial8250_port. This is the core driver in charge of setting up
> MSI interrupts. It doesn't bind the whole PCIe resource to allow each
> sub-driver to bind the needed addresses.
> 
> This is not added as a PCI 8250 UART device, but as a MFD driver, as this
> host driver can be expanded upon for IPMI over KCS. It can also be used
> in the future for custom BMC<->host communication with shared memory and
> doorbell.
> 
> This host module should be the entry point for setting up all features
> related to an AST2600 present on the PCI bus.
> 
> Notes on the implementation:
> The host can't detect the VUART addresses, so they are forced to
> 0x3f8 and 0x2f8, as in the initial ASPEED driver.
> 
> The MSI vector index of VUART2 has been changed from 15 to 17.
> The index 15 used in the initial driver was not working.
> 
> Tested:
> Data path in both direction is tested on both VUARTs.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>

I didn't notice this earlier unfortunately, but this Sign-off is invalid (I don't
think that "aspeedyh" is a real synonym), see [0] as there was a similar
discussion. The same applies for the patch "serial: 8250_aspeed_vuart: add VUART
over PCI" for this series.

@yh_chung@aspeedtech.com: What is the name that should be in this sign-off?

> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a9..33a0351819e6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4011,6 +4011,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/crypto/aspeed,*
>  F:	drivers/crypto/aspeed/
>  
> +ASPEED PCI BMC DEVICE DRIVER
> +M:	Grégoire Layet <git@gregoirelayet.com>
> +M:	Tan Siewert <tan.siewert@9elements.com>
> +S:	Maintained
> +F:	drivers/mfd/aspeed-pci-core.c

I think it'd make sense to add the linux-aspeed list as `L` here.

Tan

[0] https://lore.kernel.org/all/3f2d964a-4e82-414c-b373-af0d531b0fcd@kernel.org/

-- 
Tan Siewert <tan.siewert@9elements.com>
