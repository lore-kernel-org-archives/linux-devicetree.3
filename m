Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB323A8756
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485877; cv=pass; b=Kv+8pFwqhZW3UQB4R16IJFWYN1EfQKI9q6cXGZeICkExBpiMfQhhx3hZBAOFZ/0bCvGoNxGNziF2FQLro7vRGJvqyrw7Ja6MDK3B/hmFuck+tx1Hi8BK1pcq/eRBx6XNC/IuSUsKXEIR3UbtB4ySMZoeDQZFVl8KczzKAeKiLyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485877; c=relaxed/simple;
	bh=i/U9A7yRPAY4kDdt2TZne5uXtp7WyfA5K5kW1M/+YpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IC2t4zpOnAVRmutcm+YLxx9bL3ftRuIKvUUlbh3ra9FpxfN4JSSj8LhkIaXH16rR+U87bBAohrU5T3WACkTyu/4GHJIimiKYGt/cZPJMQ8YJspslsWy/amJe6SWp8nx1jiUSLFwdzPoFk6NUPvXwdlAB7kpB1BgAuY9/da92+qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGFi15LR; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGFi15LR"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f30a4601bbso4055826eec.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778485865; cv=none;
        d=google.com; s=arc-20240605;
        b=hS350nh4kmUrSzwWif2+cnSDbBTQgw2vMDZ2yycd4Ju6vZi0/MYuSK4AfoSDXrDgIW
         E5BFiCiPX8wPqPVzDYtOWvsEzAWy7VAQeHRExvA0ZdDIHxetuc5ykGCLvzN2JEPU47BT
         gOvfLC0D5IEyrr9Et306iaGHhIDu5AH5PhRfdl3A4KbdsymHCW5orRsNAAqa+dJkWmWQ
         Cgp89A5RQus99cBP53q1g+0GLxGiykAa8mS0u6PRfseYuTZXIYJMJLXpL0GxPU8iUeYf
         Ypbayn3SYinUW0XRFhumg/db4LExvfWpD8he1KnPkuamEINpkRZPkN4QK/BA7CFLt7LK
         x6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wyh/IqoMoqEVIxAkKMD1Hz6bqVnL8MjKRcdCkUg4L5k=;
        fh=MIIjKpfBEZwWPv16oI7u0/9951h5hOfDd2WN5Rc6we4=;
        b=QAQE/yu295Hd0LuISomtM2SSMm6y/PnGTombk06KxpPB90DAqbIGl6y175LFbBtjL0
         ydEBvjARzKdkxE8KbnJdXMQ53KlTnO5uYgj7T2DFDgw/oJ5rYnyubPJg+tOlc2EDweTQ
         kmyFGuu+GSwrcEKZYEhmrhbSq+CIXU3YqPXe0VakicJyLjcD7HM2yqFLQo/DcyK5OiHE
         nBd4bjDtpfHjk/zjIHtSuSoacAi7V1GZ75pdUZapVxgnaVQ5UUeYnPMrts8vCdFGNeSo
         1s69f+nz9x51bCx0Cuqy2jLEFs0kgFjlSiFEAF7bkGNpyi4o/MKsUDql9ILq2WaAyjEL
         gSBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485865; x=1779090665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyh/IqoMoqEVIxAkKMD1Hz6bqVnL8MjKRcdCkUg4L5k=;
        b=qGFi15LRem2TdiiH5zMNnwmfYPs/ON22DWSGJ8WPG/m2Gdabgy1a7fXEv4x3ZNqC+b
         VG6AqmIEFSxWTs04GFJYJVxs+mPF+ejHVGN2Jr4n/bWagphOTrOwJyBSomsv4LUNpCr9
         yK5G/tAS7ZyyQZmmgrJOZEKJtPckhUEoEeKdA618Jr2f1LrptJYio13mvydWZv4l/2no
         4LtwX1yzpqvI7LJP1E9dDavcI78PbNbLm3HrDPyckM6yhf79p2CRL9XIoTdcsa3zH28w
         BshQYLCuv9eLX0oLWn48SbQJ+0g2m5Xmmf5bg/EfTOsBEkHmF+LhJQXtsWHLYYQHPo43
         rIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485865; x=1779090665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wyh/IqoMoqEVIxAkKMD1Hz6bqVnL8MjKRcdCkUg4L5k=;
        b=prU9BIQAMd0ATKwykj4DftfrFfn26noCmo9pTUPlFn1h8ZbkVSy8AFkwDEDv+Z95xo
         NVw2i9JhUPkh9IYNNcDL5lC8QYlfjExOmskKOXRXTEVVcssrRVqw+ILn9mVf92Y+jSAN
         i5Utjm+mr7fHpym5Dvi+moBT+bOGUvEFgEqC7A+jyM71EVrBTe1vi+0CV/f2yHtH4ht5
         NxZ5ehgGwioHT/yYRsTsha/1uFhK6ubR90771T/ApO6JLR2tqGPgHAOOpsHLgyruihGc
         9fqiSTONrmIk39GbEC+2Ua5S+l4yHxGk50nPNln6DMktcTeN6GDuFOQrkTrKA/3xJumY
         ULLA==
X-Gm-Message-State: AOJu0Yy0M7w1rNWs6mgldqdnXuw9p4vB3nVa4zrX0VEINaFYsjtr9Jlm
	8HG/X6myljR9KgGG0Pd5KFATYphWYGb+YzV0vPgpm8eNhe8MIrQXcrCGfaVJEw/+7EL0EjjpQS1
	7uazfs4cYBPTZKqPxgyAH6HUNG0xC8kw=
X-Gm-Gg: Acq92OHYx/wYpeO8zR/TzM00PiVnjwae3xY43up1lq3NSTf2FczwtsR8V4q5zWmKQV/
	8ihgBZRbE+cVYK3WMPD3ZlgTRISKR8jzhRWAwy5/KRpDd8IcpEa6YmxDHOYfdL+1/5THqZuyVWz
	VvokDTb1lXyx63LnZRip32rLnSmGaQayJ0FqXFhjyDvOp1ppQ+k8afZfyKUjDLu13AmF/ZucOQ7
	P68M4RXo3w3hne1IRsNQ4NuMrut3/KBPBAAG8rlbiHg7m03jD7ppS7x88RnwpndeuLauqq9GTSX
	QsmvI9F7
X-Received: by 2002:a05:7300:fd09:b0:2d9:cfa6:3d34 with SMTP id
 5a478bee46e88-2f54de847b2mr10437683eec.23.1778485865218; Mon, 11 May 2026
 00:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511074752.24745-1-clamor95@gmail.com> <20260511074752.24745-2-clamor95@gmail.com>
In-Reply-To: <20260511074752.24745-2-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 11 May 2026 10:50:54 +0300
X-Gm-Features: AVHnY4IKwqYhBV3GVgfTQtAGxo1bElvhJtqAavzaJZ8v6EPFk7busgpraB9ajZA
Message-ID: <CAPVz0n3i9vvDoQJvQ7914EH9QfguBf9LJusuyTXM01ccoEgK4A@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: display: tegra: document MIPI
 calibration for Tegra20/Tegra30
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:4=
8 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Adjust Tegra114 MIPI calibration schema to include Tegra20/Tegra30 MIPI
> calibration logic.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra114-mipi.yaml   | 41 ++++++++++++++++---
>  1 file changed, 36 insertions(+), 5 deletions(-)
>

Please ignore this. This patch was send by mistake. Sorry for inconvenience=
.
