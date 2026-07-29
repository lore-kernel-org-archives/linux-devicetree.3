Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209A43246EB
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785290149; cv=none; b=kt98UutRcBxf3hoEvobVm8f6f9nUQla4Vg4Vx79XCxu6FJ1lJYaQioNGF8lIoktnL+MkDpyDkC8NmIz/I8gOCI9+hnBzei7c6cIx07tDsXCy6Ar8xXtbvEcMm+iwNktysKzi4VQkCxTfNmxdw18qiueuLeYA6aogvw/GalxzMwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785290149; c=relaxed/simple;
	bh=uNZvcbJs/pdC9ytN6jQCPgX4Z+OKYj6tcEv+kHCGMmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oUJ/H+1uiz8zobGFrOXf1/3+Z7+bpl1gY+sWx8uGVAjqhmmLEl4VOUO7N0LGAsA7oXZkzOZnrl1WfpYfIAgv1LSVHWr2F4QNUr5ZpP51xmD/AKBtB2/dHS/CrBEzUDmmmbty8Rlffk/PQU8TLXFXGX3IzmvF4DqoTlzprzhgcqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQi2PsPJ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQi2PsPJ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so456306a91.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785290146; x=1785894946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7grHuSDIPRW8L8mo7e1hpwggYcsc7BeN7mOCkn3pJuU=;
        b=gQi2PsPJg5PlaHuF7LPbgJ5RTyFJjRuiY+xPplcA4ZEPeUdF2fwRtej1a6Qb8WpWNC
         H/JuwoHb8knDpmgRwoEjMQ7QaPDQrhmQTWDiICOS+NzmkX9jgrP0tthNhFML/6Eb8qmy
         OjMUlqlhoTBNKWs5x7faLrPZOs/oUZf6WvxYwT6IVD66GIkYyPhKSsid7eNPx3IvgKk7
         W66UIIFrpPO/FXzPp1ePUWt5MMgomGp72d6TehMR7kXYOIqFnZQDjGLyc6LOyGIFtVO2
         0UOA2dtj80/xqw6fWN4rw0RXqHe8wCWeLhDJeRCVpTAUNSuXa10zGKWc8SAPcwSlRvq8
         ldOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785290146; x=1785894946;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7grHuSDIPRW8L8mo7e1hpwggYcsc7BeN7mOCkn3pJuU=;
        b=Ic9tG9vd9CbnHK3VWrU+Om7HRGQQNS5faAF40ZrKioX05OSeyI6YKjwimpRMAshOTS
         MMmenAaFlsGohThERA9BV3NnBAGtSpAXSoQI024o5DQL/6K24QrGK8Pvxem6tsauYzgK
         getsS7gcL7vL5anE5D4hXpRMN9FqyYiEZnvCNP4+IT8Qnm9MVhMV3BZhh9bB+FJ6b8P6
         YE8YXADePEp+w3outSZQKNpZDzi4XSDQpi7MXq6yVmIJR0ANGFdo0k5oJts/VgcaSz1i
         vW37C3N54M2DMvqx2dHnmTMoVhR3WoM1VRocSCDC3Fq8k5lZk6jkw72rb7829UncW+ED
         8SpA==
X-Forwarded-Encrypted: i=1; AHgh+Rrmowlm5klL4Qe+crHS6WXdIPCuYbp1GkvHDOKZWKH5TsiA5FyLtdY2X82/KwPZq2MwosG5pmTi8YDE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5QXzdLbRCWTfXU79gE+4eIjtXXG7GSr/cNLtve0uu4lmfY4Tx
	blQobsdg/d/kXkrU0jkqXBAT2vRfRZhLXY5A+WjkkIiUiFRAIlFWB+JL
X-Gm-Gg: AR+sD10oRI71/e8KmqHh01GVwwuVikcPMgsLglIKIe950veJHKdjribtK+QNzN9pj52
	hlfEvRAtcKP80uVb1e4KuLoLwLAEyrQcmQdYm/TJulUv264nRhW9ojxV3RtFCcbCSkZZSTGYuUa
	YiGdPE/SE729ihi/KTcEwRBixayj/F28FZpGcPM4U+ouZQvpbESp3h6+qcd4Xwg1h9WNctn4SIy
	FjjpY4x0ENRp37Zanmb3wia4g+oHkQRF65oHSzBh/NPqGByJ2eWrpwHffBNKug6m5RoeFrf+Tlt
	fYCL6bZUgbFPrIH+uzbK0cuBtwttvMmrnUiJOGhCl+IIGXcIXKklFmV255rCz/pUKHjZeeAY6yn
	RJMQxhXVBQaRPW3ZIDkPJCEprESKt6O98F4BipGFOdGraNb4X4fXW2KMkGlUIdLGedG5xN0cHv9
	b2RiI3vnfmxLuknCZSaLsrVNDPV2D+mFqF8plTxivo9iSSk5zDOEWDV8VgDHFZ5QEbR/3sqw==
X-Received: by 2002:a17:90b:3b41:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-38f6a30c840mr4956125a91.5.1785290146311;
        Tue, 28 Jul 2026 18:55:46 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642dd6casm1984373a91.13.2026.07.28.18.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:55:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com,
	Alexander Sverdlin <alex@sverdlin.org>,
	Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v6 0/3] Add initial Milk-V Duo S board support
Date: Wed, 29 Jul 2026 09:54:59 +0800
Message-ID: <178529008850.164571.1818758565125739771.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260615120324.1527881-1-josh.milas@gmail.com>
References: <20260615120324.1527881-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 15 Jun 2026 08:03:21 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking
> from ethernet, enumerate the wifi chip, have bluetooth, and can
> read a I2C slave device over i2c4.
> 
> [...]

Applied to dt/riscv, thanks!

[2/3] riscv64: dts: sophgo: add SG2000 dtsi
      https://github.com/sophgo/linux/commit/022d1bd8b08257966c4a00fc21fb72a828bca870
[3/3] riscv64: dts: sophgo: add initial Milk-V Duo S board support
      https://github.com/sophgo/linux/commit/0cef4f813649eb19476c98f763128561f5bdf969

Thanks,
Inochi

