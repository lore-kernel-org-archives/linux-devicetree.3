Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3546F1FC101
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555365; cv=pass; b=VVgJSIBAPujJCKOWcrIM65+qK/Xsi4NOztb11e8wCFNVlITwaoo06ymjMvlNnPnX662IWgU/drKylW1oVZkpv+wh4oaSO06STZDrQmBlXUDlSvow/+spZ3qZYf0cKKldLq+0cDD02Dfbf56FdrQ4PrW//UjTQK50GfP1iuexels=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555365; c=relaxed/simple;
	bh=9QKYX+S6lwwCw+mTheY9a+AJP8+EDfhOnBM9LIQmtAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFNWf9JVXSUxXDF8KviARaJMfSp+2ihTV9DwzTor6gffi+9E1HycofEPjK0yIE89qa8QhzwLmVDDAR1doKtqdboCpLOeEYetgRaUYizf+sLy/+PbKhpFgakpDrWwq0LJUJTjKzKgEn7pdegU3jE51m+c9uLIS3Tlb9YXH+5c394=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ddnheo1k; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ddnheo1k"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3660ab73adbso3133131a91.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778555364; cv=none;
        d=google.com; s=arc-20240605;
        b=a3IyXYtooQN5ypVtknGnwA90AJ/pJrKb/6RnX0bsQIMe/fRe4ljGvx8Gu6nOrpe4TE
         s0W166LXZWWtglvuBXxKyCdwid0jK05oEXrz1hEYIfSxHd3yIRD6fTGsz5ZO27rnkrbU
         XZ4upAVguE5+AIcu4de8XM1klT9GmetY0yNYY46GKwP+DSymqDriraibT3Ji9YB8vpp1
         dyDGyHEfo1MM3ecCGiIJMYe1MzRCkQOZZpZ1BK+lALTG7mX3/O6YoZGUP2rMmFqHvOe9
         pYOg5vO6HbnSgD7C2frW4yN0no1JHnvG3TzqUAo0zXOmEk870RP4XA4+u/1MjN7IYfRJ
         JiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EVqJBMgrgpMjKXDoG3OlirV/gMnvN8dDwKNZrZpdCCc=;
        fh=BTFMmwSYQ7jQA/XD353vzWNhvReGu2nW87d+vBSOKzg=;
        b=OvoEQ7TyvURwGBz7a2Bhs/jH/GG5Kh85Dv10YnbzKsQVljD+UmAwQ+dGd7V1cPIR7w
         MIWZq4rLGawp+BzVlHCD3ndRenAqTtenqRQiDshwOz+qn03eeRa6mxi9BvR4Q4q8gzIy
         NsQct4kXAxiv3PINk/jlVVXi+6HkyrbYi4R62VRVcUshEzPVHEmvSl63mZWWXfUlOKWT
         swpESeWG8kN1fpj2weY7atTCKguygkXK1a5aAC6xu2EfH07cpT5cj8X6F1DmF/Md+eF+
         Mo0LQ2BS0D3FkgET4c2qc09qHbLi6rqHFqRf58Q5d0K5WyIpyp+vH/jkOuyyrh93PH3t
         t9Ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778555364; x=1779160164; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EVqJBMgrgpMjKXDoG3OlirV/gMnvN8dDwKNZrZpdCCc=;
        b=Ddnheo1kcPdtHY7nXGvQ1mOQTIIxk2Pegk6HQEOWV7GNaDBnpppFUqAvZ6IE1DcvZN
         FFkPSQYJLXiTTYLV212K37Wo2R3LWY7+d4rON3tWs2LV4CpZ8Pz9X4lFnwkYp4v1bZoh
         oLJjuUEPaF45YPueJF0/eu4ZXn1S2XYVEeBa6EBzlqOhGkGqRFsizOr1rdDTk6ThnqRT
         DE4xkUMrxErQjhPEniJxM4qhap8qRyaY4mixq2wlGE1MToVDaQ6bILfWhhOkg46dETQ4
         Rf8wN0cLtXKDxxOBoT5q57Xnl6w/ny/OnIpTwY5a2I2feU0abYWn9fewpeQRQQjdoVE4
         Taow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778555364; x=1779160164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVqJBMgrgpMjKXDoG3OlirV/gMnvN8dDwKNZrZpdCCc=;
        b=c90f5qlWb1G79RI6tPUvcbT3c48y4bnS4hbGsu+mKCHZWe5gynbJNf2/XKN7bY96Pw
         Ilxzhd1ZEUwt4aXV8JM96BpjduaUIH7tXWlmW1Kbzr5HHhc2iRA8TIvK61E5HgAF/Pwe
         XfxNtNkSc+CcU3+APxBm5FTCsvcOqXso9aF7ErDWbKbgHU15epzdsR/jc9v8EP/js+Wz
         l//W99jsdijbBTHQ23hN8rai1FvOWTbx0TF/VtdfAZz5BvbnFU8Q9zZwOibFRzaBqIQw
         7yDAxaiVW4jwIjQkCr4CUQWhqnaH7HOyJI8Po6TyaZ2e2hRmm8DS+wUpdFN9n4BQJRke
         /gbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XxfQEKRxPVn09L9V1xypH6M5yL8XikytF1Zu4HxOjFEhtV0BdwVjqCIN+6sLvoGE8dxJLDKZsMneH@vger.kernel.org
X-Gm-Message-State: AOJu0YxLABF3QqSil39Z0NIqU7SeesOYXR1gFQdUQV6XRbFxEOYWQHBr
	BScCGNv0zPnSIi9gc51OSPDlMRyD0GC2qHH0dLsrIkEmEPa+46DuTt/Nkd90oXnpEmERVvIhzjv
	lUCPMfW8OEkXDDscqgIHCJd5ozEMoZkw=
X-Gm-Gg: Acq92OFOYDIy8M1zWjZJlKbq/w3hpjCp85ju6hKiP+4ltL9keHL2PeOBdDZWcYJclt6
	BjqL7EvJzIHazl3vw4XanNyZpSL7cso2k0u/sgEtk8c9s7AiTXUK6aprHNyNN22MK1Utg68qCJz
	sD37qzwJRhN+bUc2ZOmTjrOWGisIIX1DPzsSyMyiTLUkv8E1Cko8LqiuQ8du5QRi4/7mA4oh1Mj
	pTdtwu69+U6XJPYQbsNY5IVRVcu7T3LwCb2UZT0IhsfM/Ti85W4vz/zXeFJS1LNhwW+WtnW0Bqz
	Ce5vRY5iXb+jPgoxy3j6cgWxDbDf1pbaBAMWJA==
X-Received: by 2002:a17:90b:5344:b0:35b:d795:cf5d with SMTP id
 98e67ed59e1d1-368ab8638d2mr1858065a91.5.1778555363550; Mon, 11 May 2026
 20:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
 <20260510084303.122426-7-phucduc.bui@gmail.com> <87bjemn1yv.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bjemn1yv.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 12 May 2026 10:09:12 +0700
X-Gm-Features: AVHnY4IsmAqqmxNkupkaRxtbCeEPAZIEnld7T-VRBsXE0b6nsq7nw4VOw_WWfjU
Message-ID: <CAABR9nG4cxwX_fjF3yihRbDP-qb4AxAeZdSww2ENY4eE5ecHyQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] ASoC: renesas: fsi: Add shared SPU clock support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi

> Am I suggested this ?
> clk_spu   should be merged into [07/10], and
> spu_count should be merged into [08/10]

Thank you for the suggestion!

I will move clk_spu into [07/10] and
spu_count into [08/10] in the next revision.

Best regards,
Phuc
