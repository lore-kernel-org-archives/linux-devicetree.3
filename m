Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B563C4B8D
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787163338; cv=none; b=Mji7edyBgKMK7VAFL0/eSNlov0H/fKmZbL3gF4d2tuAflHUzhNWqJCgTX+Ssep2Y+VJfRE170vnJu3lYuv1Rt5UdrGpQ7lOhXird3ns6v6XxrO8/hMa+5SjuU0d75ZR4xcmdtQ8GjcZqK2V06gUDmn3PGQh+fwY5LPu3uPX50uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787163338; c=relaxed/simple;
	bh=+TsZrEMv9PPisb33yms/nZsKIKo0Ndtx28K5SceGad0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qeSifyhv19SIclR3EqMu1uhxzCeJwZHbc4KYM7LsHrbVJR7bO3HBEqJyn+/Kq6rU1DppMV+Sx01Aw8TjyLcJH0nYX2Eq5leedkkyMfrVZBod39ZkAqE5ytoKMpGMwnQqOsB6rriU3+DsqBBkUHtpQfRjs2wKSE/VnqhX/mjEMWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=gjmErCg7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="gjmErCg7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceaf8a1265so15795935ad.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1787163337; x=1787768137; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+TsZrEMv9PPisb33yms/nZsKIKo0Ndtx28K5SceGad0=;
        b=gjmErCg7qI7fTQ8j8A3VvX1j78wGM7iEkg8wtnyBO8IY2NCab7ISpj4Ou5ZvGK+73+
         i59KDxRwv5ugjB1fm7nXl2uHWO3GB4S2ND6Gi9kGSufjAxZfB3wu/eg0VQ/V2pvMiLf0
         bx5wkGRRjF+t7DeylIHqwhQ38Y5xfpR/uGCEI0ZsM/63Tde27gNXQjbB8iYjwW1cpNv0
         PqYnWS8tYQLjXOHadGxpc2JkPt9nXYRU75ekzHMqaIkn8rFAEhoSrVdBqVdglvsjOk+P
         23Rfe4MBCRsrd4+X3ef27Rm4FJa9bSlk4Tsrz/sNV3h0WRJwbv2HDK9mpH2zxpA0AtUV
         tsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787163337; x=1787768137;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+TsZrEMv9PPisb33yms/nZsKIKo0Ndtx28K5SceGad0=;
        b=OaJwk+qJc6Gy1CF/Apl4/evNcU+Q5xJbjg6c6Ykn9lcWqpqvzg/Vngc+hGGtD6xbmF
         AGuC0irvhETyuOppU1jgxAoDhVCeauDLPUMfPcmClv1CqZjrT1MUvgjZwEao5ILm9qjy
         td05tS6bHgiyw636mXlsi8bM1GFETVxNkxGNp4/BJElL4iDrI0iRP+25rPevXeSBvCsH
         7/jbgOlUgRCT1sHa/rRMtjamYa2RL+gzmivkZ0RReXcA3ICSkM/kl1S7Yq+psawYx/2k
         KpVLiPxCN9RdF9jjiAf4lKky/dVa5ZuCX4jMHIQDWXSXt6ohKV5UAHemwyYqkNqoMt05
         9hhQ==
X-Forwarded-Encrypted: i=1; AHgh+RplHvxBoB/AvjEMW7X/qGWN1DsWNHM4Wh8I4wOQ21UbpS7gBd3ePcz6UBYKUZdUlwia1WsHEv1WJ+SE@vger.kernel.org
X-Gm-Message-State: AOJu0YypwJX0VBea9jYmSEHLnU/EI40iB7iECw8Vy/uoHc1rei2Yhq0X
	d9ovc6/q4g9GLRNNA6azq+R101SLq50kHWLoZjtoEkgXdhYmIeW0TpY9uqHCa7VsoiDlnbCAqzd
	yIi7PLmc=
X-Gm-Gg: AR+sD12hHZ74UnOEi2h6KkNrSIa8rxwBbK5gtgG6s2IF72GXZd5vruhLqjP7MBAxVLq
	W15v8wdMs0TNI5bkKBfKBr1tJYmKK4q2aQl/XXc92cy/+kThPuzHhmCyxzrg18STZ0MwDkqYCbU
	uTy2i9+jwtkztXq9p/yhKeDHCb7X9ECOPv+sM879eut0lZEgT6nTL5URYaih2zN/3xxuw/m6/qg
	I2bfY5rib8E3HqV8Wny71BqqRglbsZGpbdS0bBhTnzFQiji/vSpoVuTEy615BYnHyRKDHuS95x+
	QSX0RiqSk/D8wwm6To3NghF120TlSkaXclcW5WnXh1tS78HtDUVTsfFIxtH5++le7SpMCQZ68vY
	bvHpfus1SiFpy1RH6oiDERmVLRJivu6IPDD0uyJp40hVIQ1drVZMwEsXizonTpxc+wa7jBYop1K
	VJ2aMWy9Nc+mZXQdDP+sMR3KeicCZg3kXU98OcsO7uVVbcpa+XGqgh2LcTLukP
X-Received: by 2002:a05:6a21:6112:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3cd011b446emr14251391637.12.1787163336516;
        Wed, 19 Aug 2026 11:15:36 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3ce17sm13729159eec.1.2026.08.19.11.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 11:15:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 11:15:35 -0700
Message-Id: <DKT4J20H0F84.17L06ULMZXN4A@nexthop.ai>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] of: teach overlay code to keep /aliases in sync
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Herve Codina" <herve.codina@bootlin.com>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
 <20260819134923.0a67838b@bootlin.com>
In-Reply-To: <20260819134923.0a67838b@bootlin.com>

On Wed Aug 19, 2026 at 4:49 AM PDT, Herve Codina wrote:
> Hi Abdurrahman,
>
> On Tue, 21 Jul 2026 14:36:31 -0700
> Abdurrahman Hussain <abdurrahman@nexthop.ai> wrote:
>
>> /aliases entries added by a device-tree overlay are stored in the live
>> tree but never enter the global aliases_lookup list that of_alias_scan()
>> builds at boot. As a result, of_alias_get_id() returns -ENODEV for
>> aliases declared inside overlays, and any driver that relies on
>> alias-based numbering (i2c-xiic, spi, tty, mmc, ...) silently loses its
>> pinned id and falls back to auto-assignment.
>>=20
>> The gap has been public since 2015 [1] and reproduces trivially: apply
>> an overlay that declares e.g. `i2c99 =3D &foo;`, ask
>> of_alias_get_id(foo, "i2c") -> -ENODEV. Bootlin's ELCE 2025 talk on
>> PCI DT overlays [2] enumerates "i2c muxes" as one of the subsystems
>> broken by dynamic overlays; alias pinning is the underlying cause.
>
> Are you sure aliases were mentioned in the talk and were the cause of iss=
ues?
>
> I've got an issue with i2c muxes but it is not related to aliases.
>
> What made you think about aliases issue?
>
> The issue I have is related to fw_devlink consumer/supplier relationship =
and
> I have sent a fix [0] with nothing related to aliases.
>
> [0] https://lore.kernel.org/all/20260630103010.413688-1-herve.codina@boot=
lin.com/
>
> Best regards,
> Herv=C3=A9

Hi Herv=C3=A9,

You're right, and thanks for the correction.

The "alias pinning is the underlying cause" clause was my own inference,
not something your talk claims =E2=80=94 I shouldn't have written it as if =
it
were. I now see the i2c-mux issue you meant is the fw_devlink one you
fixed separately; conflating it with this series in the cover letter was
wrong. Apologies.

This series is narrowly about overlay-declared /aliases never entering
aliases_lookup, so of_alias_get_id() returns -ENODEV and alias-based id
pinning falls back to auto-assignment. It reproduces with no mux involved
and doesn't depend on your talk.

In v4 I'll drop the "underlying cause" clause; I can keep [2] only as
prior-art context or drop it entirely =E2=80=94 whichever you'd prefer.

Best regards,
Abdurrahman
