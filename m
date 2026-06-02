Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B57373BE0
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388368; cv=none; b=tuvZvt0rt7ZVVSKgiFcoyvAd2N/Mo273QGGNu/u1aAbqG8NeD3LaZStzowAPZsk2TRIsKcdHNmBQ8Ze8UZbaHahN5O6d2H18FN1r47vjkZ7oQS4JIyNXQa7oO1TVcE+KU+RGW/kvxmKOWBuZ1lynTq/Vq6d9YKoPwssrdfGH06o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388368; c=relaxed/simple;
	bh=a7FQgUNWApzW4RhPeXmT/dWcitDUF58z6lXLLcsZjdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JymlKWWbaqcHCZqJDRQ9TOkwePW5eW7xnTGRu2gu2iLCK4xddGSQ9+O0x+w25aMMLnC7eXch9UNIm9cI88mwRvstauDT2Q/tAooG2i1l7V02A44VE7OqH47S2GiqW0A44qxrpaF3aQ+3KlWvvkTKPlimmOfCx0+IPLxJjLhxwZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbwp+cer; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbwp+cer"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8585ecdd71so1108060a12.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388367; x=1780993167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sHA0a5BnMK9iNWfr+zrxwSYBSacMq9cdFigCfIzgg0=;
        b=nbwp+cer1/ME+fTEWOTz7kEJEW+sPHc9dBlqqAbl/7bnKnOOo2JI9wz9e0/W1PzMGE
         MkUzLHdBByyUWCWKw/3zPoPmapu9y9p2IOaTmBxfYVcueEJdUNBkU0Z80FsjwHeZRQKf
         1v7/FLhfc1bmXSw7v2eGMc1ho0n2+gWCU66nddTQzPway+3zuHxCZjlyGy82LujS2lUr
         17KY8aBkrsHi5MqjFYzTgktcY49bsCll7JGpYKO6GRvnOkst+lRDZ2vy0d+aTWTnQTzI
         WbYqHp9YIlwkMu2iDZjCZw/35cWlMXGrKIkeXrzdVJSo4yTRKTFNTzLZ2wxOVJl0sKD6
         N9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388367; x=1780993167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9sHA0a5BnMK9iNWfr+zrxwSYBSacMq9cdFigCfIzgg0=;
        b=Z3TX/Ega/LmSUiaaQWQtyiIt3IJHqAYLOXiYQYeQzaQJjLGghkar4MH4QoM6MS4hzf
         uXsHZ3kPRS67arDh1xuR1jPm3JZnmIgYnARegCm+nZomnk/90ml9fNCz7YYxRfkh9QBl
         bTOgIfnzv4WFE3hPU/RPm2nvcndcVIj6tU84vwvKLGaNjUnwORlSfAa8Z7lgPj8GQhoD
         CX5DA4xD3g24dhC8iJdUC88UusH1wx/zaQiVK17N9ps+dhnWdgfKWhoUv8xdzJyMyyMM
         CRQ7OhYLLmohO/MVRxGvMU7vxDmCzD/sT0cDosbSCsjcu1ICaxJon25qjsotrD/Y7m9X
         lluw==
X-Forwarded-Encrypted: i=1; AFNElJ/0j/AsUfZ/nuHgfw1GLlvzQnN42qxSWYNXjXjFRv0eXD4tfJAUSFSmNzRuDDdu9PlAw2if9ngnOeuv@vger.kernel.org
X-Gm-Message-State: AOJu0YxSddfXZT1bX5JAozulV4RSOwx88p2PhubLD8/LgaVvT+eXO77l
	Ada8htwfoNA5q6iIFdYqNarM48tFo5fBx3DPD2VHcLXnDeZPZIVMi5u5
X-Gm-Gg: Acq92OFlkoe2+HAfCcgQ69eqg3kywtlueSIij1xJIKq9nO7tLsRhMXdBuo/8jC+dTn0
	jNsE9gsFDK4t1HfPe10qBIxDFPufYosSlLhWLP4RZ0Rp2LdQmXfDvFfrJV7gkNUGKVx1ncynlqb
	1MARu2hpOnKCzsTHSAY8TiD1xrB2rqlgKwRRowLIKsNDhbnlEMeo7y+uksUZA7qWdCdQwpSIjNz
	fujRRlvDdCRZ2uk38pLiNCCaykBbB3SHHVebeptc+UoNlcIjLEdvkI85me4p60TS2FmAm8a5SXw
	RMb7uCQ4ClnFd6b2Z07hZjgaiC8Fs1Ki0Ly+eMQgxnv6M167Qlc6jNFehfoy+MEMJS+xavSJ5eX
	dRCV0Z2Em9TVTHCnSDxAlIbKxn7gO7JlikFR4gnZRTu3FK77KQdIyew9kPmV9XkIvdR73mpnGmo
	nGv9n3O2Z4dDbKWCUWLtAKOpT0os5yTWyYqge7HMRKzPUx
X-Received: by 2002:a05:6a20:9595:b0:39b:8905:4e13 with SMTP id adf61e73a8af0-3b427be8514mr16806476637.6.1780388366793;
        Tue, 02 Jun 2026 01:19:26 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c858108940bsm10413308a12.5.2026.06.02.01.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:19:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Date: Tue,  2 Jun 2026 16:19:05 +0800
Message-ID: <178038833103.2088679.3632311874557644565.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 30 May 2026 13:33:42 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking,
> and read I2C slave devices over i2c4.
> 
> [...]

Applied to for-next, thanks!

[1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
      https://github.com/sophgo/linux/commit/eeec80c3ce36ead24e2f53d88a24dac1e3de8041
[4/5] riscv64: dts: sophgo: add SG2000 dtsi
      https://github.com/sophgo/linux/commit/2145cd2f0082c11177b062e1ecbce121c3b50b43

Thanks,
Inochi

