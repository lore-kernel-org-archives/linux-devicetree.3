Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294892;
	b=5OkoZaCDeXW6ylCe/uxa3LoStr9n9+kxacYI2tyv/smSEeIQ9sTuNogu06OADOM9meY6
	 xzA9Wn30dUHeuOzeeIzIrAw2DZVqVHIWQiboeh9NEFQ1iZy24WwY+e1qfrPqbvSLlyMPC
	 I5zN20ULdz+KiBpuHNIe9eQLVNRwlq0Kjv9kAL6qdxUNmfifuaZA1U4Z7G81X5KJlHdB7
	 yObkR/oiXrJBui/+gsHXqz/IH1bUn63pfURuwny9mkj2oq3EY6QbavLvQeCLmugMUjGuQ
	 lG9oN/vX8ldlCPQDf18IDWj28BPutf8hvIDV1mgVC4zTfBh4erfeRimQWBaATvjPlLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294892;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v8vAHChTalJyPKJWjYAU8hJ9rNARiHKrkluyFMh0zh8=;
	b=Y2484bQHh5wgY+w6kcWPf2AKKPMILS3m6i8pCut1oksbzJaDMIeY061Wc6FaJ2pRS77T
	 8UV3yObN1rM5YibhQ+eDrvUoqaGgmMKKk2XjlTg5TYQTqX97g/Rd7wRm6NJawojhu+9Gk
	 S03QcjJHEvwCkKqrqwhBhQQx4GX18oknctaOru/+0aMPRZqB6suoxYh7YE2vdFU7NGez+
	 IAc8K+2J9eVJtQZCVUo/hN9ePEwGnUDjGHrnCqja4uT5L+hsi/PEj77Azc3NKKoUnYwd3
	 5rqk4x+3BWgwSIE/yQ1IYOI4kgFR3dDblQ/BArniFgVQ/VZDO3S7Eqrt92N5u1y7tYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhcIcnDa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D3606A330
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhcIcnDa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291951F000C0
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 21:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294892;
	bh=v8vAHChTalJyPKJWjYAU8hJ9rNARiHKrkluyFMh0zh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PhcIcnDahk93XHX6nhVEyhzqPt5GML6+Zl8sQA0Ax2ohQ+5IT8DChhIUmK2Pn8qZI
	 pL6vyZZfGf9NWndz/ufGc9Y1eByB3h8etOTfGTkfMSB14pW1UtngpOIf/rL3RurMv4
	 a3fppe2SppuOI0uPoRo1NIUjKgbuBrQFlp/nxdkIUd56noxL6pZIFEtO60X9maoWoW
	 73Hr4fogCGQaWM1fmV9oJJsbGa7Lyz62RAEXQH7L0uBL3cYCCAJvOvYkoQLcXZawdV
	 1pv/4CFES8fTRs0t/4hf4Zr9LAsfZZwq7PtHj8AXZ8qNoQa5KhmxDWzWoeiccEJiqf
	 58mjFX/aM/xwg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be47aa555cso2479981e87.3
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:01:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFme951rHKNL0imcjz9QW3+NAkF0JOyEtghXRFY9N5ASHYxd+dXMQwSCcxaZ1p+em9hRw1mUTpHM8HF@vger.kernel.org
X-Gm-Message-State: APuU4Z/5AkdajvIwSBZjYW91mccZF+D8x8omUiT/FRq0946+VsZPAcOb
	4gFPJ1slrc5mr7mN0uvBXf+L9DH16+AFJAMcSGOQD+3L/GHHGd3pOhirdNavf3IVUPAtwrofq1a
	5X5NsNXJM2lm3oYUkLqslJZgJd7RyHLw=
X-Received: by 2002:a05:6512:31c3:b0:5c1:465b:ebe3 with SMTP id
 2adb3069b0e04-5c1bc7be4b6mr2356062e87.13.1795294890748; Sat, 21 Nov 2026
 13:01:30 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
 <20261015142552.4128028-2-ryan.roberts@arm.com> <CAD++jLkrWojU3FeTPGOCFHHsbmTGYG0Tz3b2nrn7mMfsDssCQw@mail.gmail.com>
In-Reply-To: <CAD++jLkrWojU3FeTPGOCFHHsbmTGYG0Tz3b2nrn7mMfsDssCQw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 22:01:17 +0100
X-Gmail-Original-Message-ID: <CAD++jL=fnRBZJ-H8SMbZDr_1-F-aRbq6QRN_ZqaKw_M4cJFBOg@mail.gmail.com>
X-Gm-Features: Aa3M54rcr2uec6946c6ceFg_f82syIk8ikAg7SN-MP8cTPlIYobsjIq52BzG5Cw
Message-ID: <CAD++jL=fnRBZJ-H8SMbZDr_1-F-aRbq6QRN_ZqaKw_M4cJFBOg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/15] misc/arm-cla: Add driver skeleton and documentation
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 10:47=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.co=
m> wrote:

> What the patch series needs to do is tell us how this topology is discove=
red.
> I.e. will it be discoverable from the hardware itself, or will this topol=
ogy be
> described in device tree or ACPI for example?

Hm what about I read the whole series before replying to individual pathes.
It's righ there in patch 4/15, mea culpa.

Yours,
Linus Walleij
