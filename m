Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C31338B14B
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 15:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783263848; cv=none; b=eNIRjRq9MluzE/glxVMqWUKOpa41bdz5BEb0M/80JfW1uPvNmMQv8P7c4I1EVYcLtZhSDt8fd8Y4l4rYs+W3Q5Ujkp1FklbVIymyPoNxMuqeY9ioLd43cLIXlqKVYJ5X1Y2lT06iAb1bGWe1hHkIwnZAlfF/HDRW1HttcCdmZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783263848; c=relaxed/simple;
	bh=xDmpCCfiVsMSNDriEdlqzNwOZLcxeATB0tFwGgiZPfU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rSX4ot2vUTE3jM72+KN0cZRr7RhwRt8zwRQ8A3e9vOCeCHAU8f5ruiyHQ1mDOs4np2eJlW8RVZpTDghDcFywgvvpPzkHNindY1qD3cAr4Cz61dAoEnt04MIA1lIpLwukrjyPkAdvdd5/pD232ytagqB9AVeP71VPtXNkMN6NG2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHarapyu; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHarapyu"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6a149bfb2a8so887238eaf.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783263846; x=1783868646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVH3mXWR+NE3Ci3wEZjPa2qoxNuA5tsUKMUk1a/4Mig=;
        b=XHarapyuegf+P3PhsIIBQecbSDbtgsfNyY4FwrcWyR4lZ8606DFF7Q9tsN6Z9WhVSd
         RO6tnuxtWjALFxM0WODXzUR4G4qJSwT6q/Btt9Cld2EFNwBTyufcmg0wjbVV2chB8TvM
         raV4qclSUS7aSHRfbeEsXz1i5IpyJHCPAFKSXwVEIQ1Sy5E+sgx/bngfz3SHZ81hpX7H
         J0fYW8ob4v/9H6RHTspzezbEv9hGYEECPAtRVOygs4zOdJadkSfHUICP1I8pQM1boBc8
         hmmYWIKt8eV2U9ua3wq8euZt5CzL3j6u394th43qPaEOWgkJoAuvC0Tow21zvuE9zY/s
         VKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783263846; x=1783868646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVH3mXWR+NE3Ci3wEZjPa2qoxNuA5tsUKMUk1a/4Mig=;
        b=KW899OyzV0IivmFayHbPq/7cZ8ASNGfbxYJIHah6opE8SdMKB0gKT42QuNDCILeU74
         cAzNKhlNpR1mo23AUZSYGBvxnFthl/rfgPOF6TIbQTl6lScjnYONzrO+Rb0V76xLD3Ec
         b19LSvOjhnD3YQZq6EahdTmmkL5Ky2mzDnfGCndQS8CajpunZY6nioa8b4wfiKYsAYYy
         YClZfSuqmmaDXqkfDDiTHYpUB6ronuxGcMyyEcf335iDixWKVTliOqikfEWa8KPsopOa
         aLVDYLmMe30Dfje57rO2USy+9GFz+pI3cQNRjxEWLPCxq18IUkxeOUrk2ecSq2Gb6frd
         spUA==
X-Forwarded-Encrypted: i=1; AFNElJ9ObKxjhi+KunhKu7X0uiQFu/RA1TIobtiX92rs87EkxwImc8F6zqXgRi1ksonvZ3TLcyOQTvnddA/g@vger.kernel.org
X-Gm-Message-State: AOJu0YylTXCjGPZjDAE7938n8QmbYAzzkmPVOreQMIlYLzDZ8S5Iylnt
	D8FBaBxREIhT5TyPgeHn1Bp7cuIvDytfX8gXJNhGM0wUs0DikIgdNP8M
X-Gm-Gg: AfdE7cmbjIR5iv4rwOEqoCie5iSiJNdTn1Ww0mf3b/fv0Nn1N+xVkymFHvRh8GvuNsQ
	qstz/3WUTQ5DFO7bGgU/Y6PZ5ZwkAkxXbW+pwptq8mvnuYwmC56MDxUD0gXBSj/vLbEz5Ghq/tV
	71WmMrJI6ik2sXRmnpqQrJVEtupBQZY89MdH1ooE2Bga7iyMDHQ6socAM4B6/GgmOrnTzal+Ad4
	2xzQ6cXWTVo+OmjOVXMYiExh9U3nhbHy56D32iByft+VPY7EinkgQE6tpgOk9O0xoKtb59RTjto
	dUZm3frctcTunq7zxsqdxOsbEYbl4DUuOaTQ/AvONO7jhCjAs83iV43YNBe60JJBtTPilPsWFgr
	il0VVABzpCfW1NQLYY84xstYOhhMByjE3q7WJ7L5h7yrLOGunLkr55oV3N3Sl65kpWkQo5JP97S
	1IlfgcFIgnYyRx1F9ExoBsQcnMVbcMQI28WGtnq0BduA==
X-Received: by 2002:a05:6820:3096:b0:6a1:7cce:a3a6 with SMTP id 006d021491bc7-6a32f5a9c42mr3716595eaf.54.1783263843948;
        Sun, 05 Jul 2026 08:04:03 -0700 (PDT)
Received: from linuxescape (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a310375f67sm7263111eaf.9.2026.07.05.08.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 08:04:03 -0700 (PDT)
Date: Sun, 5 Jul 2026 10:04:00 -0500
From: Maxwell Doose <m32285159@gmail.com>
To: Avermoal <avermoal@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal
 Simek <michal.simek@amd.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: convert Xilinx XADC bindings to
 YAML
Message-ID: <20260705100400.402a91a2@linuxescape>
In-Reply-To: <20260705085308.8819-2-avermoal@gmail.com>
References: <20260705085308.8819-2-avermoal@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi there,

Firstly, please wait around 24hrs before sending a new version and
additionally mark it with [PATCH vX] (where X is the version of the
patch you're sending, which in this case appears to be 2).

On Sun,  5 Jul 2026 14:53:08 +0600
Avermoal <avermoal@gmail.com> wrote:

> Convert the Xilinx XADC binding documentation from .txt to YAML format.
> This conversion is part of the ongoing effort to migrate all DT bindings
> to a machine-verifiable schema.
> 
> The new xilinx-xadc.yaml file was created from the original .txt and
> includes all necessary properties, descriptions, and examples. The
> conversion also fixes a minor typo in the 'xlnx,channels' property name.
> 
> Signed-off-by: Avermoal <avermoal@gmail.com>

Sign off with your real name (or a known identity) to comply with the
DCO.

> ---
>  .../bindings/iio/adc/xilinx-xadc.txt          | 141 -------------
>  .../bindings/iio/adc/xilinx-xadc.yaml         | 186 ++++++++++++++++++
>  2 files changed, 186 insertions(+), 141 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.yaml
> 
[snip]
> -- 
>
> Changes in v2:
> - Fix conditional requirement for xlnx,external-mux-channel (add
> if/required block)
> - Correct reg type in child nodes (use maxItems: 1 instead of items)
> - Make #address-cells and #size-cells required under xlnx,channels

Also put this at the top under the ---, it's very difficult to scroll
all the way down here to read it.

-- 
best regards,
max
