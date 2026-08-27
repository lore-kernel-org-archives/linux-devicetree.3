Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C25476046
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842852; cv=pass; b=qJRuMoejCw0eItCY6HUXuG9HnOW4q+r07qTFnTsT9IPDxylEcT6Rv6qOIgPHURWq12R/5M/F5Zsz5M/gnTl5TwgSeL/0IhJnGB9oZjndhpVXoQcJlyo+YVdWtFDQ5VSv6c3ErJnYS8bUjaZoBSdvCGfidlEixFPkLvSitSAPAH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842852; c=relaxed/simple;
	bh=W3Ab3yphKMxYz1/8CqZ7FpqnITfODGN1+Yw8aaRTaYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxJ54jbCH/p08L7lnA7c5nqd3K+fd7YM79GDACm+DFUIm7C97ZcZ1ASMj7vB24/25j/v8vAF3cDA5e5MH9YQuGJtQ98+q85Xp/X15Cw2gdegXJxDB4rLjfQrpv4V+nRL3EQ09i0EA/rqJ43r/nb+qLA6/+3WUszqscCw6KmQsuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N/v3ToNJ; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N/v3ToNJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a5f95a879cso9241a12.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842849; cv=none;
        d=google.com; s=arc-20260327;
        b=JJMuAfXikMr9TEhtjtkvpRGqCkNWrx+yIovIiL30rGYcxdrTLjOcVRZPP47VnNex1N
         Hn6RY4RvpG/1gJ1zwJIrCZRrxFBGg5vsCoYBHSYNgpp9A4yglIwIRU7waxk9WzMJnT8s
         6jXJFuoSrZXDIuoyfFk/NhcJHV9iGJe4D3kVlsSwTSvDmNhG4uafGVUOBttrxmFqowTG
         8ulBsQq0TtpU9Za3UbQzGhsjQLqMwIE7joRGth9rE2boaNborVwPKL7alecIbUYaavV2
         GvFyhGHoTN+AxJceUlypSKjti5lgh6ChhqOKrC6XAHqtsqjy7ytuqYSzZe5tlavNV240
         Q8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        fh=DhmFLMgBlNL0lUR30Z/m9f1ofN7iFI2kvNZRTnBpS50=;
        b=Mp7poQZ0NLi8TBZgajy6qirUva0kfW5vQhOsjoQffmr9iQMtgL45aF/d7hzuDGMFko
         t5VABwj7wBFKNYKrhAwsC6l0Afmayrv2krQTjtna+USM9kzfhly2XhIM0tkI2Au2oedE
         UPKXXA+VYnekzwLJoVr9F1s4/6cGAyqGUezgW5wY5YbyygiMzgQwWeTxBohFJ8FP6Gtu
         ioMJjYLUBDmj8DvVKAwh/0BX8nptnT4riNXwHYaMyi97yihaFUIIsHh2iAzIa4TAbMyP
         S70LffqgKnHT1dv6UCnWxRQkI0snMdCjiThRPxHnylra0xWbw1UmCaShLpMci1cfJfYm
         kYhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787842849; x=1788447649; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        b=N/v3ToNJU3GaR1Gi/EN5NS7dDb73uL8y7wKjgFBc5AfT+3MmPd9Vkvsiti1/s5Laf1
         /QO7JEa2Bc3O0CHFUNcfdEF5X9l92+MvtAF0dv9156l2X1WXhayO5kapSEZIBPbBUcWS
         +CW03OsKd9r5TbbZmGklkWtgwbGgvMnPa9f76mSMyjuh7aOGD+aF0kotH+/nfrz//SZ/
         PpKJbbBd91H+J163qMoRdu8T30MLyvxGnBx46lm40/k2y9HhFHlaDTMgw+Scgx09hngb
         3QG6AxShQuK7CtdS1zx54v0sJtKbCzopJOD7W0BOZMHk2yx5ybEtQefDARNzg+VotiIA
         U3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842849; x=1788447649;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9lxairpgLiXIXVMdCgp5oBtZGa2taxpEkryecJUmNAE=;
        b=Cp3vnx/GRfCLLHbZ0IhVl5VaDOteX8CZQmrcBY4CnY6OCjB6bqqhXwr6Qq2HRxBIe8
         wgtSICAreXevv6g/kq3wO/U8WLAgEqrCfKZx/WrJ78C+dWNezxKqGNkv8YgIgZYsMfIJ
         x3m5ANwjaywO5TS5qs7X6k7W1g6aPXDXdz+LclzDaM34WxHG+vO6zBqxhgnjdX7PmUHO
         rFUNLu0ugNBbc4ihaT2CI75G4gJ/0RCf9c7butdtbEedBZjRx9/2LNSJ/kWAcdhTerhg
         B/XRy88cK6za9bOOx6p1whxsTD+dk3TQ8jFbDmPnRn5IF6hoa5tZoIAEtA81jP8Ra2LG
         riYw==
X-Forwarded-Encrypted: i=1; AHgh+RpeClKcRhNCV4jfhSnBhHA3CM8+pY7PnEwFUvy7wH+2JwZsVxUYyQtWrDt386n2NLnq0z8i8BwzcvF0@vger.kernel.org
X-Gm-Message-State: AFuF++l9mgpkmtCueovn3lfSfcYVvz1rC9CWrannWvffW6Xzg7wqXaph
	aQGpmv0IehFI9HSKre5RDDCdV1wtq+zkCRJ1Za2Tsn4Q/IFQBQtOC2RKV9dkGSNEpD+w0wgL9Dm
	xgkCI6cxNU3HbNyJXZoOwL4bs9i5WxOWRAWMAAf34
X-Gm-Gg: AR+sD12MrnvNgH/Hnyy9P95UBQ7jEoYGMlnaDIXwfpYhKAWGf527LQi1+mdiQGpZcca
	BQDnYnfM+3g3DCVIi7RSqA7E1o1kYlUwT6t13MEwbjQodW34XFbik0mBnMhlbJQ+nNFH7VfrV9P
	IurTSrDJf17+n5kaGaFzMSvynI5AjhjyiuZqeKeMe7KOrkKze3QAUIZzQKKKMMS9n7t1i61dTVT
	Ymg7RzadkburBgLQveI6IRQQL1SoM3vQHpg1fbaLkq7p3pNIaS80FLsuJAsqrkjomjjXddUxdtG
	smHUaasL8d5puG54PcFdFlivzWughOSz2CPgO0WbyTFolw==
X-Received: by 2002:a05:6402:611:b0:67b:7d05:60b8 with SMTP id
 4fb4d7f45d1cf-6a5f5647937mr53711a12.10.1787842848394; Thu, 27 Aug 2026
 08:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826134048.854748-1-larisa.grigore@oss.nxp.com> <20260826134048.854748-4-larisa.grigore@oss.nxp.com>
In-Reply-To: <20260826134048.854748-4-larisa.grigore@oss.nxp.com>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Thu, 27 Aug 2026 23:00:07 +0800
X-Gm-Features: AcwNN1UTquEpZeWJV5own34vt8ybBkfXz7pYThlv5e4VIyfdz2_DSFDAfqeUnxs
Message-ID: <CAE14pddHBP6HMihTePR+-Pqhu2DKjVgRA9++5Epod6TOCLagFw@mail.gmail.com>
Subject: Re: [PATCH 03/10] ufs: host: Add common Hibern8 TX FSM polling helper
To: Larisa Grigore <larisa.grigore@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, 
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Ajay Neeli <ajay.neeli@amd.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Pedro Sousa <pedrom.sousa@synopsys.com>, clizzi@redhat.com, 
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 26, 2026 at 03:40:41PM +0200, Larisa Grigore wrote:
> [...]
> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
> index c2dafb583cf5..034ee988924a 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -563,6 +564,84 @@ void ufshcd_pltfrm_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_pltfrm_remove);
>
> +/**
> + * ufshcd_check_hibern8 - Check if all TX lanes entered Hibern8 state
> + * @hba: host controller instance
> + * @num_lanes: number of TX lanes to check
> + * @timeout_ms: timeout in milliseconds for all lanes
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int ufshcd_check_hibern8(struct ufs_hba *hba, unsigned int num_lanes,
> +                      unsigned int timeout_ms)

Hi Larisa,

Thanks for the great cleanup!

Would you consider moving this helper to drivers/ufs/core/ufshcd.c and
renaming it to ufshcd_dme_check_tx_hibern8()?

Since ufshcd-pltfrm.c primarily handles platform device glue and DT parsing,
polling M-PHY states via DME commands would fit more naturally in the UFS
core. This also keeps layering clean and allows non-platform controllers to
reuse it.

Additionally, the ufshcd_dme_ prefix would align nicely with existing DME
conventions in ufshcd.c while avoiding potential confusion with
ufshcd_is_link_hibern8().

Thank you,
Stanley
