Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CD940B396
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 21:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792187324; cv=none; b=m/a0KtmvUejWgYgdfMJ8e0FyqWJUcKqLLDaasYbvn83t3Lfknuekoi9UuJxlRGZgs2QzCfvRyYtAA7/qpgNO2FSxEep7FmqYi6kPSQS4BW/bLZIXTZ5u2CVwEDG+X8Ras022O36rPRlGtiS1aJt/JZa3m3zcQ/FJSRjf+kKVCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792187324; c=relaxed/simple;
	bh=vHDTCK2dGVe+D3aHp5cDy0Nnns8/vCBii2fB6P4rL9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=muDRRCp7RQcMHK51XuHcewSnyn7woB5qY4b/95kaN+V1Z8VN0UbM3nvG5jCPqYCHW2W5ZjhCz1IH4rN5aclAkUB1sEkuyD66UPqBMEPzq3iRBJakvqRwtfA56KDpVLkpHSBD7ODtsBZ4Ovhh+Cfbori+SJjnod1qECxSR+5XSU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0/vIQuh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0/vIQuh"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so189166f8f.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792187318; x=1792792118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHDTCK2dGVe+D3aHp5cDy0Nnns8/vCBii2fB6P4rL9k=;
        b=K0/vIQuhbLaq/49N3SaAx359tDZUVwG7Ptb/KMX5EZjncgZXchJ+TbW/HBZtTbQyMf
         5gBvrFDtfcKGmccaF20POCr9l0uRoju/inwvt4Lwdm6pXJSVJpRBLQcVVhJaIa4lOTuI
         05JlPBzCZZXc25PsMzo6yPsUt5ZzDPFWYHioutSLP8T/AuBo0VyAAh1kA+sFM4UGfmzU
         MxfqTRm8N/Bxlwkw3CCJDSWTAFrjXzCGO2J85xwcjx240SLc/JE9guH3dR9XfqELT1R3
         yRz/bnV8JTXAhGtECvLS4M8IRQ0Trdi4eNOKVFmgvW6RhhXQYohGJZdIbeTWNsdIrcTe
         8qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792187318; x=1792792118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHDTCK2dGVe+D3aHp5cDy0Nnns8/vCBii2fB6P4rL9k=;
        b=iff8XzZgAuH07562Vm4t2WFuhS8YvqYHLtSbq6UmmgINqe9MMssPVZGfWXIk8a9a33
         jB0Eack896pP4k0rEK42hKlCyf1GrtEMs4SElCuWjjnqEvNLiltHkeoFfiw15lk5GSV9
         NHRZD/NfMt0kcLjSC02IM0EAHidhJlgssvxvWuzWNPs9fsCLZs8zwbBcl2+/gar+AtTo
         1vriClSKldTyX8tI4j26MgazSTyMlGZN5QpZDn14KEu+Q/Dy8DmToK8tXhHle4BhyoVG
         WkSHQzH/MN6FR+oR2UqDZPtnNYS3tEPkZGcL9JZkHzUikAJI/2pAhPsABzquOlMZqxRQ
         4RnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZXMGnVhu6m8S4l09ZsWyUyC0i36pjtpVjuUhvcDuKJpW5QXFb69l+HsBBAIFfLq/DcZhGQEbQWmSM@vger.kernel.org
X-Gm-Message-State: AFq9FYLTtMvJ5Z/hX+qmM6BelfMUEYgVqGUWVJAwMNAsa3zLsofvhKt+
	pNy5A6WyhCExRypVfCH8IEoGSFNpNVKxgkbaiKE1gecxXopSKZmwsrnI
X-Gm-Gg: AYBFou1DOuridWhF3w6TwSDAC1mjqKdvCiGmrlX1Cxpf/9LjNdeTjFoDD3xQfqgMUtQ
	ovK72eppcs+W5m0pKdCgFwgahS4K7jLpwauiDVXq1pIJRVhCE9RNgLAzSYBsR+eljGehrZCH1dI
	tYyn3xMLrCAnpFv6jCUfWZYNtei34+n3BVsiQ5EOjiXnhNEwVEw55DYY21mgkOrrUd9UAf08aVE
	GRdYg51ORyo/LyBbAaZ1sKsezqu1RarJ2QacK4RQy1YRf2+uGghPWEealmecuh13AMNGa590wXk
	F5Dr8BVX+AWLctaIBbTsk3hrg9ROBQYjtQ8Yd7Vdj4/+MJjgJhbHcCkLJXLpL0BbcCHGDnBJD/A
	DHTRWYVucptzoRexSGoietHwHWjL/RSUDj3KwhQLNsJaboeAueQsX8qTm63CGEDISyPXyUD/23T
	AzLmuYuBD6eRNG1OcBZ7thZoTJTNlzN/+0j+O425guj1RXpQHzGLq9Qh6ooN6wipUIDuFoIxjXn
	ZL0Frut6PrKmj050+m/Je8J6LV8s3wELpQxw6/OrEWAsMdT+qeS8lsUoVHeyOJlII2j8qRr
X-Received: by 2002:a05:6000:3c4:b0:486:fb08:2353 with SMTP id ffacd0b85a97d-48e07bc3e93mr1724560f8f.31.1792187317851;
        Fri, 16 Oct 2026 14:48:37 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a24sm7557302f8f.49.2026.10.16.14.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:48:36 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Simon Kruse <simon0x+git@proton.me>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov13858: Add device tree support
Date: Fri, 16 Oct 2026 22:48:33 +0100
Message-ID: <20261016214833.967344-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016210802.60605-1-lsa.uz@pm.me>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com> <20261015-ov13858-x1e-v1-2-acdd918f4fb6@gmail.com> <19662dcc-4a25-4d18-a3bc-6b277bd676a6@kernel.org> <20261016161618.209290-1-geocausa@gmail.com> <711e8518-5054-49ab-8432-346049a86cd1@kernel.org> <20261016210802.60605-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On 16/10/2026 22:08, Sergey Lebedev wrote:
> Please make that v4:
> https://lore.kernel.org/all/20261016210246.58562-1-lsa.uz@pm.me/

Thank you for running the suspend test, and for tracking down and
fixing the stall. The next version will declare v4 as its dependency
through b4, as Bryan suggested, and will not describe system sleep
handling for the sensor.

Bryan, on 1/2: the next version also makes the clocks, supplies and
reset optional in the binding, as you asked.

Before sending it I will rebase on v4 and run runtime PM cycles on the
Surface Pro 11.

Thanks,
George
