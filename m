Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B68D345CB2
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 05:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055876; cv=pass; b=G5WTp+K+dtUD1uE5Ffnu/CsSSOgsacZCx9wWwY9ZO8VYwVMYcAheFOHuz0n0aOzH2sE1EMDaU16YsNxJkpqVGy+AinOsqv4Lft9aBn8pnqr2b2lRXeHL5P85T/n9Im6OfpP8SjgYYhJD7pXYV04bF7yhyEQVPHaqUJW0WHj8asE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055876; c=relaxed/simple;
	bh=KbIXfvFcY7x15KYIAFY7pXTV6R+NXbaxeXVE6hcTmcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhATjlE0MKfX73MOUYdaLrxFnWoP/E8j6AlAnCfZzYnd9CNwj0igzGdVeNwmIcsOrcQJD5yDRD5Ml3hM3WQMNvp3u/OqheI9+joo1F+dL2sjlxj1SagdQYCyXtq3SKulw0c2pIWlaNfFTKHS8ONsWFCQdJqRBIlfhs0Zq18i3IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=g+0MRnkP; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="g+0MRnkP"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e67555e24so8634485a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 22:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783055867; cv=none;
        d=google.com; s=arc-20260327;
        b=nRjDvL5eU7BoiHxH4itpyz0kMvv9v+4vnW7hOHjfPaYgs52jSXiKtsHtlAiDhc4uDz
         nc/skqlwANdcCKOHxRhq/Pi/tZ7kCdekrhgmVYPa/XH+zNQSN3cBCdQ2bm6FwDqPiZJP
         /7mtC1/kKNNRbxuGNdRgmwjhlRZF206plXvklgjdx4VZtNRcuTZPPYpbzqolddxOAk/K
         RREaYHpW0XaMsopfbCA7w50tdk5EQL33tsq3tS8f3nPIjl5yJ0xDX4edbZ4FVCtz1DYX
         eiTIv7mqLJcSwFOCyfo3slRjuXu+o2cvzY7h4h30z9HzWksxZXvW0HvttIHBHBDPjC0Z
         uDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K6l3anb2Zu682WaKsqQwpeXUesaU9kfmxufkIavL57g=;
        fh=G6aj36HkKZfUpoa+4qqpe+FXT6yffOwhO8m3RuFH8qo=;
        b=qLnfFAFPU7DndICSevwYx3S+1WEPMg58d+k7m994gYeI/IEB0UvsDJlNYvsyvuPITR
         e2uH0pEk7Z2/eGwba/6c5ZvcNo4Rdvc0abTug0dlabC+yalGstVP0ThtE9MAvwc1VW9u
         yIT7Alx3b6v83CqBdNrCou8hC4zfwQsQeJYXT13bnlloDk/i2HKzKCzJcfJ9GNQ4+T7d
         m6mHLQE3xT+E4mW5x4DDp5iCy30RzG4tXANgJ+LtskYumR04VRJGkB3GXv/gCzmy/V+h
         VpSr6O5S3X2kelRiMARwMCszS+4RQg8xBlcuO8MdzD8WWXk70gz1R41qVpaFpcvfV2Cj
         AAxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1783055867; x=1783660667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K6l3anb2Zu682WaKsqQwpeXUesaU9kfmxufkIavL57g=;
        b=g+0MRnkPUimKwTvO4SsSN2/j9e/ly0Wvqswq7DM9k2+dEVJz1p/GrnLB/UWZEXKp8P
         XhRT14fWfltL8EN+GMmIv9ILaZq1eJ0igoQMGJQ8o+7x6D+CSZr2RAtPxrgfWsSYxLBi
         185n4KQC+AqZxElkyEIjqAanIfGh8DEIPdNTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055867; x=1783660667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6l3anb2Zu682WaKsqQwpeXUesaU9kfmxufkIavL57g=;
        b=hgMSXocb7M997Tsth7/rEjjryGqpYrZYajkZGe2QkccAvMdDxS8163S61t9IFTSFvX
         VbndqIlj/KtvbULS7/TjmDYKBDI95QLuZT0KEbK3alVrLvXXaa7A5zkyibVRsEdMcf7S
         mPwWhP8xHZYFYCCyRwzFXUeyZY6jl4ndcRtCBV513YfL6VX+BaZ2SwcmreXNx+IvZo8w
         ulyvB1z7B7Ka0bpGGH/ynQzxURoEZY4H+FbHewJPYNuSnpYjMHPt/C9vPPsQx9oCBv7J
         GyNeuyQZJhREFwHviufkMMCZXDCgiPL7N2UG4Emp97oJ0fN9i1g6AOC6cniYLjv91EET
         FlOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqcvx6UibthrfNn2TKfyz9G4B3AjbkNg3Be0y8BCDr7xnsnF2L0UVwsbrfliPP1iYZXw30JHlOBjZwg@vger.kernel.org
X-Gm-Message-State: AOJu0YyjBacy1HBDzJ7NZkIWnDSVyJx9OBGEgYxkK/XqGQKnQLyj6k3G
	bdWlEMlncSVGvSOPJPQR0uPvaLa528FWumVi04jqxtIofcifNmkqmHcv6s8AVGZJOY9lVqhZTTe
	l4/wVF+27KtBfW8ULkqShpAICWjuWJ4p9AgiYvE2n3Q==
X-Gm-Gg: AfdE7cn97EYd9EKcoyDH0nIbSCEqBE2quw98E3mwaL8QKlciGnxGomlKTldV9sQ0zIP
	EhM6AKd6F7qcD6BD7g+Wq5vtQgJG1KJqjaUTX+2/WO4ZRR9YU5uEi8fJwq90bCCPOhzFGCBtNXq
	eiSOrDrHFcqrEbG3qf+AbV6fR/i7D1t2CaR9hBscNSu5paYUPt/F3gd6fAxXkIw60DpVrhOzzqT
	prr8YCnQECPn7KtFvkLZXTPYchtCQD9BBZAjeEsY1IkEE1LNpyGNejaX7mAlqkOAlSIdHQYho9U
	qR8GLHg/qNIPEp8KiY26V1iG0ROqQbNRjg2VmRkkZ+FElg8nEqEGFeB5fz1NSt6Sd+Wgq5wsiWt
	PapPcVmQKwMRKpKkZtrRCikIVYPIni64UY+WxGUha/OCn7p3K
X-Received: by 2002:a05:6214:3206:b0:8e7:8d53:240f with SMTP id
 6a1803df08f44-8f4248cf761mr110821046d6.43.1783055867015; Thu, 02 Jul 2026
 22:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701122941.2149121-1-pavitrakumarm@vayavyalabs.com>
 <20260701122941.2149121-5-pavitrakumarm@vayavyalabs.com> <deb73385-a7a9-4ea9-8338-b7da999a5e9c@gmail.com>
In-Reply-To: <deb73385-a7a9-4ea9-8338-b7da999a5e9c@gmail.com>
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Date: Fri, 3 Jul 2026 10:47:36 +0530
X-Gm-Features: AVVi8Cf_Mm6lcVGfPvzxRziLw13q7u7bjan5v_Vba5wx3_pZK1z-DIssqtslyN8
Message-ID: <CALxtO0nLReV_qoxP6q46a2kSXrsXOsWW18ZZ9aFagn5ATSpk6w@mail.gmail.com>
Subject: Re: [PATCH v15 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
To: Julian Braha <julianbraha@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, herbert@gondor.apana.org.au, robh@kernel.org, 
	krzk@kernel.org, conor+dt@kernel.org, Ruud.Derwig@synopsys.com, 
	rbannerm@synopsys.com, manjunath.hadli@vayavyalabs.com, 
	adityak@vayavyalabs.com, navami.telsang@vayavyalabs.com, 
	bhoomikak@vayavyalabs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julian,
   Ack, I will fix the typos and spaces.

Warm regards,
PK


On Fri, Jul 3, 2026 at 12:48=E2=80=AFAM Julian Braha <julianbraha@gmail.com=
> wrote:
>
> Hi Pavitrakumar,
>
> On 7/1/26 13:29, Pavitrakumar Managutte wrote:
>
> > +config CRYPTO_DEV_SPACC_DEBUG_TRACE_IO
> > +     bool "Enable Trace MMIO reads/writes stats"
> > +     default n
> > +     help
> > +       Say y to enable Trace MMIO reads/writes stats.
> > +       To Debug and trace IO register read/write oprations.
> > +
>
> Typo in "operations".
>
> > +config CRYPTO_DEV_SPACC_DEBUG_TRACE_DDT
> > +     bool "Enable Trace DDT entries stats"
> > +     default n
> > +     help
> > +       Say y to enable Enable DDT entry stats.
> > +       To Debug and trace DDT opration
>
> Another typo in "operation".
>
> > +
> > +config CRYPTO_DEV_SPACC_CONFIG_DEBUG
> > +     bool "Enable SPAcc debug logs"
> > +     default n
> > +     help
> > +          Say y to enable additional debug prints and diagnostics in t=
he
>
> Most of your kconfig formatting looks okay, but you strangely have 8
> spaces here in your help text.
>
> - Julian Braha
