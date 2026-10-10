Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01300357D17
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637977; cv=none; b=cnw0pqqdFravSMN6PNbK5KFJMTguRQlZfOuM25zqZTi7GxjFXwRLDSNuN36bb1DYD/KjzS7P4Gl87z95catDk1YvT/uMFfxkwrcFwN+3AOMyw5JRnw22bx0eYrJS9zatzDS531l1WUO9bjm3tpvVgfB1Kfwyw4UMxcg4FOoTSw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637977; c=relaxed/simple;
	bh=GO70TcOu4snjn4J9v5/1WhvrxhDNYWLtV88rhep71RI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=eGnJ8V6esIxOmVVwluXghEHN9kcT+HVW1NzUrTEXmNVbEOiTlDi0AJAlopaHgsV1oJYKwBPSqgrjgJT/8iDtt1WtyUAYcPF+04XuW7sq6b12Eo0ni5653AQriI8Tswb/aGs5JtQB3qIX1DLwccq0YtvVx1HShDhhcRx/SNGGm+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2NXZfBZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2NXZfBZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512DD1F000FF;
	Sat, 10 Oct 2026 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637976;
	bh=VVs8FFAOSXxWO9nG8FKUx1eNYLMGDne/Xv2uGuRlWwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D2NXZfBZeh48mmowKloG1Oo5Ki3A1jx+DeXn9HOBCgIKKmj/uvS4ip0LMK3RN6v+X
	 UkRh4OXLCwq6hKMTz4dzeIOu4xWUuZbt0a6b9hcpHV35nGQ/f98om2sQA59pG+7EU0
	 F7jqepzIAElU/kwNHSjikfDCBaJInOQQliZ16j+DlsCDJaYDensZS/W7oLBNio7REa
	 ypwu6W+2VDobIgKcnw7vuntq4RNldzhdhUOHvfjdrSPsuhUFd+bwp1G+3zMHcFqODy
	 YXmVqKMLmRNqurcGOMfI64NRMBHmRladQ21y8tKuY07vn0tMYBEdEtuTI52akSSOUb
	 zAT0P0+4xYmpA==
Message-ID: <sashiko-outbox-166574@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/24] dt-bindings: PCI: Add ZTE ZX279128S host
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010130024.177503-13-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-13-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:12:55 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pci: dwc: shared reset GPIO model forces usage of deprecated NON=
EXCLUSIVE flag
--

commit 3cd514331eb31d5c998faa82fe1883e6405d010c
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

dt-bindings: PCI: Add ZTE ZX279128S host controller

Describe both DesignWare hosts, the two control syscons and the shared
Wi-Fi reset lines. The shared-resource model remains an RFC question.

> diff --git a/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yam=
l b/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
> new file mode 100644
> index 0000000000000..57a4e966109c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
[ ... ]
> +  reset-gpios:
> +    maxItems: 1
> +    description: Board reset line. A device connected to both controllers
> +      (the MT7915 Wi-Fi chip of the ZTE ZXHN H3600) has its lines listed=
 in
> +      both nodes; the first controller to start resets and releases it.
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: Second board line that is driven together with reset-gp=
ios.

[Severity: Medium]
Does this shared reset GPIO model force the driver to use a deprecated GPIO=
 API?

Modeling a shared Wi-Fi endpoint reset line by duplicating the reset-gpios =
and
enable-gpios properties across both PCIe host controller nodes forces the
driver to use GPIOD_FLAGS_BIT_NONEXCLUSIVE to avoid an -EBUSY exclusive cla=
im
probe failure.

include/linux/gpio/consumer.h explicitly marks GPIOD_FLAGS_BIT_NONEXCLUSIVE=
 as
"DEPRECATED, don't use in new code", and its use in new code is strictly
forbidden by the GPIO subsystem.

Should this shared resource instead be handled via the reset controller
subsystem, power sequencing (pwrseq), or represented directly on the endpoi=
nt
node rather than duplicating host-level GPIO properties?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D12
