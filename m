Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681041DE3B7
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398577; cv=none; b=Xbxw9uEi0VWcPm/8XXs+KPye8UKFhjvKvDmrtHUrNllJoNkKEfievqpzKIo1Ve1Cci1BUfG+hv7TF6NtlvucJ9VHt0Fxi22lHrS/Id1Hqj4wLsvx5JnA9If8q0+MKikaHFbDQjuiDKpQOIuAhooYe9KLLjFHfKi/lPrkfsAGXOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398577; c=relaxed/simple;
	bh=By3Ou6WJvbdPzgAPVPN5nuBbD6epbX0LP9TideIC+RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hrzJ+93c5aDMEzpb03Tf2n43svPIb8SV9xZ6L52t+vZzUjN6hswIx81COorQ9+GvT+2i4U8alnx9WcvrvNJMXJDgOgUwKojNrXzZbe7ZFf9cVFNUETYBDvqfY6y+GedGjc08KPbFbuGCsr2jk/34UTBFOFX/suaWaUrsYLn1zlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYJCJYwV; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYJCJYwV"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50b2ebca625so4192581cf.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398575; x=1775003375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVriyXCxKTMRvh4VYnzoi9ecmHg2bwe0SbN1igFKrG0=;
        b=gYJCJYwVWQUYR/uprTWZPKBbBF3lXy0AdFheZ7HcLYzaN1CQM6jr6X+6EjWOKVAk/w
         2HIAgljy4dFl5E+CsdiAzrV6EoqW7TofNnAfqwP9Ll+1IeI2zyZdk7bdG/OfngJ8WQJ1
         S1u6aS8NTxwyX52USCxAVOvcwl77qFBrxTx97fCWJOiAPkhP5+F+7h36eVlSkIBHo9b0
         FDJueK1MWhPT/mJ2CNTWexzim38qF8ZY3gGZkTIBh/Y1ZgsH9j9RFOfbfuvjqodG+Qo3
         79hHFzHGMqcNv0Mvj/TLg6l46VDKszFF1K7wDqPXA31B2pkkDJzMoPc2Rw5MYnLg8AAj
         M3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398575; x=1775003375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yVriyXCxKTMRvh4VYnzoi9ecmHg2bwe0SbN1igFKrG0=;
        b=ZUIKdzjTgA1MLf9RIHaEaZVRHLuUrFthOkuvcf/OtCD9fdrUVACFtMhJUgA9uWZVsZ
         vkGXOyPMXtOxMubdIfXnIcp2HBEM0NnrYuYjn8FxQGaGMmz80smaT2CJxqzzOzNDmCD9
         aJoqo3SjNDuL8zcrF6PgQDtTYah1+NRXvK9qxGacitnf5t2adJ3ZmfD2KUQ+BNhsU2Jv
         O4UPc+KezFIPNW2fiOJow0oNtJxc18hvwuzHqGvQRVTkqD8GDLq/rG/V/tCNGrL09K0N
         Colh11XqLEX0uTCTAa5Oi7D6nvapWOztqA3TvKdb3Il/yWmR6He4+TRroluFEZcrE6NY
         mqOg==
X-Gm-Message-State: AOJu0Yw2poi01MdRk+iU5CRlekwOXoHZ7ZnBkEssSR9aPBN6ygBLY8lV
	7tmBcXzgiZxRh+TTaJC7LF8xqol/NLKloj8/MrLs1qNjrqJS07l4wKg0
X-Gm-Gg: ATEYQzzmyPUSk2CZk81r1tOCP/mrQaop20lxi3sc91Gr+b3dYq72InEcPN7oVzpR9Nd
	POekeVj8L++Ydrbn8xMs6R9jOoiU6uYVcdqw19ZhtYZ60Az/0BKMp7FsZmJdWewa2aEFMkfJgum
	48Fve2GzV+/8Ts4zrBGjS/e15kxPbMRtjqz9kgarMK2zNL8M6NDaDE2wqiDAXjnEdqxpMlFf1c1
	U42RrL+D+qFfNqVpeJzju+y8MOiS+E8ZRTAbbKydaZXw6/Nz4PJ5Cx160IqNlZg1LSG8NaGMZ2X
	Nj2LeYSpardZ5yHmJiwYRw7kjB/vAYyVTbDmRgI1oUYLeYUDPWnl3CmrsKllKwPqHqYlGqPtR5l
	651h3gcqghT26XSKQllxW0CRa8P1/UlOYbYcbbrp+BjYUu/Fh2DfKlAuIp6LIh6fSQUfwmXjmop
	nRqTqnV0E7Yfx/G+ALyy8wXQJChj1C/CP+yM1paWUHYMD5P4TVt4ufiYy+Bs6ZOhOJz0A0xdPSD
	mViAvDNDwwPHg==
X-Received: by 2002:ac8:7f92:0:b0:50b:2dd5:2be with SMTP id d75a77b69052e-50b6ed70684mr73711441cf.13.1774398575338;
        Tue, 24 Mar 2026 17:29:35 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8534f9ccsm129996976d6.39.2026.03.24.17.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:29:35 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] soc: sunxi: sram: Add H616 SRAM regions
Date: Wed, 25 Mar 2026 01:29:33 +0100
Message-ID: <3682916.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20260324164357.1607247-7-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-7-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:54 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> The Allwinner H616 has two switchable peripheral SRAM regions:
>=20
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
>=20
>   The mux value for this region is different from previous generations.
>=20
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
>=20
>   The mux value for this region is the same as on the A64 and H6.
>=20
> Add data for the VE SRAM. The register values were taken from the BSP
> vendor kernel.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


