Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD392472B8
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206999; cv=none; b=qF+5yWlU2TynlZsyEUplh2Vep2mgLmFTsMJrothaLlDb38bnmB2uiYeZ0NioLwnpB5ArxAXUCp/JUU2HakVwfjTwzohwX++OR3pi4CwDUTv4yEs7bmTLPAg+5252cSMX8qywCGgRhdmkRgBEXNy50y8aR2q+8EotX7rK4oD6B6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206999; c=relaxed/simple;
	bh=6kIH1ANk3srlp8dDNIH1duVV9MTpe+sd+seqU3mPp5A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kfTOVMX+vYtx+IyIanFUAmdX/MkCjteJk4n9zp4dzQfzeXQcrXZ6tZXtO7YJP896ZEAS8cBoNHvAicVNPMVIEEaOGNHVr7cxXTuG5q0cABMDFYjtHrCNMsoV/y4DYKjhL/EZGPOxw7yfg6rujWtPYWfGXdrmUFT23ej0DUguvQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9YazmGV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9YazmGV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso7247465e9.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782206996; x=1782811796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAhVKTcglJuremrfImjaywPyVqu4aubOLdy7WaNPAJg=;
        b=Y9YazmGVEeLykjxhAkWcKLh/UnR7+AJyOVHELYjY7Kp4Lnl/GlA8ievUF57F0UjvW2
         FcVcyc3X4n6nFUcfNNflcBUJ6FXQEIUjIBwGEMRgcM9mCvLrYcjfwhpQVK1R50pya/Nw
         zl2iTT4TjFA/SDv39iCdAh4kUvo7JuqERKiRsbEsnETvDmG126gjpjQbFB54d2YO5g8i
         JkOrgHK8OuODCq+/cWB/t66Z1AeQz4uy1Fonlbc/VsMLkE2mTUmczBjLv78dR13wcZpU
         iSFBBNfIFD+4ZGNz+zqLIeaZj0AgXqpTa5LMTZGaUv/JutcEe6hAnwe1Q3w/iIDH/Mzb
         cjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782206996; x=1782811796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OAhVKTcglJuremrfImjaywPyVqu4aubOLdy7WaNPAJg=;
        b=TktS7td8zVb9QgjFkC/ONgNYS94TJ54hnwiH1fS3qPgv0f0QLeJKTs+e2y1hO3JQZy
         FJt/aQVBggC+Ix/C7LE6wIGIm5Ham1ANQk8BUtWMPxkvNZVaD5BdYCIG0cu+vzL/3nH/
         UgPgRK+fdels1ter2uvvNIXVQgc+ldtMs5v6NHTXVnVxtgf4pGkLVE4tykHVujB+Z9i1
         sv8QvqKRz4ByjCDWTo03kFvm/mV8hcHqjgLp022Uo8xUxVzB3VBvnH9bUTiG8eIY1RIf
         6TF5khaqG6N7WefA4ylErbPjdYRkkyu30wfN7pxV5Hl5hyghA8uoa7B1CBHmXRF65TfT
         xoUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1wo1lpBnjVAnQ/DWD0hJdmMOf2zUXcRD764gPGl86YtZvGEgRjFkLaJX9ISWZANLTH2D4E45K1PDI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1QMV+2ZyBuktMxtQXlFNTXu59YiCxpuxx6pp0LFNMAdXPLiUR
	WPpefX33MgO3pblEntNIgcfGhQhapBq7Os+NRBj2BtPQiN4lit3Fp4YE
X-Gm-Gg: AfdE7ck96RMl+dsa/s83K/wv+V6xPz4YFja4+Ta6KzMIo2nXWM/BTg3BK8FjLrXKbPN
	3lb0N9l94qbwcdIclfA3JPXV3I3A585pk4gPgfEbYUKNOS9UXodqrN7kawoWAOACPvd7KAuyLn4
	USIziev1Tm9Hx/QcthlxNUOE4LAcwcUs6zQFZPDqTnFK36uDeXSBQzC3ojdxqyPMr0DDwRJr7+A
	DZSIgbOlkO7qoq8TkLrRL5kGx6PMdHgI9XauZ/C5cz+9iDfEKgHJu7YupcOtepOV3Ja12A7YX9V
	dl+uzb+qhsjEQBQ/WJlwwiWN9IYeI7WM7TPVgPiAK4ZPFfsymyaVBFaQQuwFkLIDQM1Lr6dp3C1
	LZmInS+mz1AMpNcjTvQll0GKmgZ+BvEiusVyYRBYsxpLIsNHJH9X3+jaSdgJGXPSr6Nmg/dFfkV
	Z/jXyzg4nu/9D2WrcVE3M2BxAjB2yGa6poHFpIIvbj4L2Fxz+zOz5DkNuRnTLpmnAxVII8LH9qX
	5ab4CsP2iJQ7J9vlpm78lQCAGOl7GztyN4bVhHW5DXXwblv6Jxfng5StU0hMg6Ft5BzHH5p4Oug
	2HreZISLqa1kFALYt53MUqYTJqeD+mqxTrKDYn5VI7lOvoypmH9qX4c=
X-Received: by 2002:a05:6000:2489:b0:461:a15a:4160 with SMTP id ffacd0b85a97d-46a7fd24e47mr4547391f8f.13.1782206996068;
        Tue, 23 Jun 2026 02:29:56 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c57a0esm31850073f8f.27.2026.06.23.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:29:55 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:29:53 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jakub Szczudlo <jakubszczudlo40@gmail.com>, linux-iio@vger.kernel.org,
 andy@kernel.org, antoniu.miclaus@analog.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlechner@baylibre.com, duje@dujemihanovic.xyz,
 jic23@kernel.org, jishnu.prakash@oss.qualcomm.com,
 jorge.marques@analog.com, krzk+dt@kernel.org, linusw@kernel.org,
 linux-kernel@vger.kernel.org, marcelo.schmitt@analog.com,
 mazziesaccount@gmail.com, mike.looijmans@topic.nl, nuno.sa@analog.com,
 robh@kernel.org, sakari.ailus@linux.intel.com, wens@kernel.org
Subject: Re: [PATCH v4 1/3] iio: adc: Fix incorrect reading when datarate
 changed in single mode
Message-ID: <20260623112953.000066cc@gmail.com>
In-Reply-To: <ajpO9zaZbIl3x1uC@ashevche-desk.local>
References: <20260622221550.374235-1-jakubszczudlo40@gmail.com>
	<20260622221550.374235-2-jakubszczudlo40@gmail.com>
	<ajpO9zaZbIl3x1uC@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Jun 2026 12:16:39 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> > +	return read_poll_timeout(ads1100_new_data_not_ready, data_ready,
> > +				 !data_ready, wait_time,

I'd actually be all for using `data_ready != 0`, to make the condition more
readable.

...

> > +		PM_RUNTIME_ACQUIRE_AUTOSUSPEND(&data->client->dev, pm);  
> 
> > +  
> 
> This blank line is not needed as they are coupled, but I don't know if we have
> an agreed style in IIO for this.

I'd be surprised if there was an agreed style, as there aren't any IIO drivers
that use this specific macro (not in mainline at least). Additionally, might I
suggest using `PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND` as it is more generic?

-- 
Kind regards

CJD
