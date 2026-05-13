Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26FE40DFA0
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683189; cv=pass; b=Cu+a5k7syscT96lTTR1s/JCcFC+zUjyQqsogX1wemtMODDJ1ovdxkyHYOyD9es6StXi0G2IO/enNKv+7Yv2zu+NS6O5WYbSMmvD5b6/46xlD6+n5strHnsBzTqBKmwqeRKq2eGuOgU0oNJ1idPp7lsgQNK0aPQ2EUs41FMq8n+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683189; c=relaxed/simple;
	bh=l/XQjj9rLqRtlvBFVD1JrhsL5hgklQZ3IW+6owvNEYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bew9n0KmjhnaSdvpYC4eoxusZbekJnwW0fiOt62a5zZoG3F1IA27P2KC9AmcWnZVEOKFHerQCFZEyExNU2mJW/6hgUupQpl5mnd0IzbiIUzpa1kIg6kF6FY1BUsK15Ef4E1Cf9SCQI+SQQUB806y/LWiEKxP0N4WPta+4cqWqOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V432Ocy8; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V432Ocy8"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bcda7765d64so657648966b.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778683185; cv=none;
        d=google.com; s=arc-20240605;
        b=lm88YV7I88m/fE4f6LVD7ZV1BHy7fMbrf7idM9szRHcnwlgXYwOU9dlhNQVBf828C5
         zo+asU7UL++ypnjtkC13WupuhzXixMzdG7pLzoYqDhmo+TdOW4/7y6RS2nS/w3X9K/Nm
         k9Hva3qtwWjxJJlc5SKTVfgwgVqy4VCP1JsKv5cjk050afb3aZTKmaPCR4eCy6WCm6aP
         B1N9aZJQcPlcz2H5T2n6JwncgNhVdubLvKq2aArz04mLCOV0A9tSAMLo5CTPAArR50sG
         OfDZ0GS9HlICpv+oBrKO74ffBXSBSx8J3mTJ5N/+Jbm5tAKR8wHt7nqQZ46j5QV+YYTH
         4bcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OaBPAaai2do6tTEr5ZFJIJdibTEdzt3Q2IEnGfklUBk=;
        fh=nB1ijmMCOJAgqCKPU+wqkr0aV619LRLb57FiRqtcb6A=;
        b=Gp4xtdCPN3gl2Z+rak6QzSaInAEMjikp9L3q3VozBdTgfCvhX8F4OyG9xJltyP5eII
         YBheSkCKZ6kjEhgyJibl+/kAgSOCbcClkSrjDS1ps62/UZQS9ZHP5HgyuWAUBDZi2CJl
         DA81GiRMLTb36xybnau4PJWrel4GhZBSt0ZkSDhzPXsuCNYgymq4gp5aKfHGx6a0narT
         BGhtKU/RKccsV6uJ08noLPk7u4SjRLIt3byJ6zMJ/7rXS7BRUfHNeXqlpOK4XLuOL5l7
         Tvf1gOyuKUSJ+r1J0cs209bXDen3+gy6LzgAy1hI2NaGjGmtPT4j2jayyNTVhz2jyJy7
         qXGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778683185; x=1779287985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OaBPAaai2do6tTEr5ZFJIJdibTEdzt3Q2IEnGfklUBk=;
        b=V432Ocy8cTsERf9CrLoXg7tDbLCb3diqd8azeegBmZKVBD+gimJ/MzcpyYE5Ma+fVG
         v1+jE0ig10ijKDsHxJynSbImOApWtqgYMM2iZV3+Et7+v1LsQAQFXsDrhbISWN+bvmao
         1dYcfYswfzkMjxj9APrFk43Jxt9ad4Kcl1aJwY3I98d4bHOP1e+lwbb1hSql4lmc5Wqe
         DQ71VWf7ISqthIkwIw1/JeWH2ZpPo14bxX4gRRrwFXeeQyO7atRmuScGFzbNw9iUH4J3
         95nryXBUfQdAPCeEpfMMp68A/LJXusqTPHvU8xNMOp+xk8Zbdj5579169iDzltBGw8Sg
         IFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683185; x=1779287985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaBPAaai2do6tTEr5ZFJIJdibTEdzt3Q2IEnGfklUBk=;
        b=pyuczkr1HEsBlxphkvatp2lKsk1wRQrXAuOLvt9gcOPfAVvPEBco7eTC+LjLyFDF6c
         K6non6zonVzx1otjZYp+8rT9E8AD+429g3AzM55gilORA/O5Li0vy3dqcDesYdJYvMMI
         ra5anE+egKYUgf8HB0hmmQ2+2lJQGfQSIwCq/xnBdvYSA5tEaQFsKjJu8cCVOTagxty+
         Hb8d5KfxiNI0WngEa0Sks/GfJgzfj1eLfIMD3tRf46tKnXPehnU2N4ihjJNNhmltvkVF
         qUxT5hpZNdSRF0jXXXkGvPpAHphGX/iS3RAr9vGoROHSVlnl0A0eNgIZLbpBmPf32vTM
         MP7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9LqnhxIqCH1WgpuOBc+F0RQmaIbVdDWsAIxmRu6aVzP/oDiNZ4qI94rcBnoH795pDOeffhGO2UnKgA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq6hXaTAwc+clj/9M9W+NFT8kINJK/qix4Ier0kmd8qzT3oxBB
	aTg4PsLW+DXr1f76fuwjeJjf6PGx4u0fiMq5HqvxDdICNlvCZL+lh5Rfstl5xMWi3bCaZjY7YNN
	TzMtYR2HoCbXQK27qlNk5jCdZBTqlfCQ=
X-Gm-Gg: Acq92OFIgvwVxFdbUo0dR1lyx1Du+XFBY0eUd1gYLeK3L5tvRiYRygQXglJrpyId+3f
	u6B1BwcQh2PNatXy9P/B7Dj0qJNDYwgLx9cniNZ6ljwosJKou4Gk5UXd/ItqpMOsVwz9dlDi+6t
	o2CMo6L48/zWLJAKabaN6jUYZCkF9YHfpC3IvZjbVJ3i3ucslO1UsYcU4Bo4F7ChRqV2ayH9pIy
	lScqpHGGqrkpU6A7fjTgPmYffBtTMZm19YD7AbBnWl+1RBTw0xwb/DuKlEtOsbgulS6UgLrV9TN
	9DsecQ==
X-Received: by 2002:a17:907:3d43:b0:bcb:b15f:14a1 with SMTP id
 a640c23a62f3a-bd23aa1844fmr479690166b.7.1778683185065; Wed, 13 May 2026
 07:39:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANAwSgREs-Ai5RxuiD4Ue-8OGGdrhnLSBmSePBrjN3x9=59zrA@mail.gmail.com>
 <20260513105030.1074335-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260513105030.1074335-1-amadeus@jmu.edu.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 13 May 2026 20:09:29 +0530
X-Gm-Features: AVHnY4LObZPjOHYcJad_9LeD-36GYglsaC0zIs_XJX_NY4Ny0UPRl2ZDzVqaAoE
Message-ID: <CANAwSgQ5-ATFGESe+=sEuGfEHwqDxg6b_QL=WJSV0gONFLmiZA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vin-supply for PCIe 3.3V regulator
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@kernel.org, gaohan@iscas.ac.cn, 
	huang.ze@linux.dev, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	robh@kernel.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Chukun

On Wed, 13 May 2026 at 16:20, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi,
>
> > @@ -39,6 +39,7 @@ pcie_vcc_3v3: regulator-pcie-vcc3v3 {
> >               regulator-min-microvolt = <3300000>;
> >               regulator-max-microvolt = <3300000>;
> >               regulator-always-on;
> > +             vin-supply = <&reg_vcc5v0_sys>;
> >       };
>
> > Plese check power tree page 4
> >
> > USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source
> >
> > USBVBUS is power source from the typec port.
>
> So this isn't from VCC5V0_SYS. USBVBUS and DC_IN can be
> considered as the same power source.

I am not the hardware person. USBVBUS supplies 12V, and VCC5V0_SYS supplies 5V
As I understand it, SY8386J UXXX serves as a step-down DC/DC regulator
for your PCI device.

[1] https://datasheet4u.com/download_new.php?id=1604744

USBVBUS is the input for the PCIe source, so this should be vin-supply
= <&rreg_dc_in>;
It is as per the schematic

Thanks
-Anand
