Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAE5388899
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792338007; cv=none; b=CLOgau7rPUweS/xLMbYP9E8+7MQzX++EghsFSbecCk8E8GbuxKjz+v3sxf6R4aLstDEAL2wkYfmPckjplFQK9UN8rFryMXlf9Wk1R2TEINoR8pDCLlALAfGScl8HcFXhGoVvlHZYvS7fOtSrLXtuCJB8p+Fd1gDMYSoJxavpGdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792338007; c=relaxed/simple;
	bh=9kce7fsbYEg8ixtIkmlAmfJH7Iu01tFp4/06C6lwBc0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f3GJTXlMtem7/R6WT3fzAljkYGpE0W2FnXCTBc1zX3IMDgmGqQ8PyXloDfENdSh/pxM+Tn9NQhsLcuB2aLFypKafmga9RhLajw+4kn0RaX2yeCODZp7xCbtf4uEXphueaEN7uq1+EBKX6D415VyE6d7kE0j/Kx7zSWCq08Ph6uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lw0fSaXM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lw0fSaXM"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c418e215671so155204066b.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 08:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792338004; x=1792942804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LpVfLiNPs0OQlpSkKCUQyoFk2dyYHH/SWsGcZu3oWUo=;
        b=lw0fSaXMH8D2qo/O30jDyePsj4Xc6M/lJygMKqyWRmMKdwJT/KdoCvyH7duVriYVxT
         ajGcJYqHQJQWo7h6UWFEoCdQLZPHqxqLLFbFvMBbAlt5Jxd7/5nO8+9XSC+K2FMaQEFM
         HlfM5MAfVS046fY/G9g66KSi4MdLFPRCWbrEMXbLHGB+RRkHHf/YbquLkym/VMq80bJe
         rSVQ5ZHCsJXKIyl1/3RGDvh8Uzquqle3F9Apc8IqDyQrrRQCPzeYcQGNoQy4VkAEpzdU
         q7OeKP2QvR4TjtaN2CO5+cDupJrB6buoPFkETJLli6mt2+VJd/nQ++0TqFCmZOIWy+z0
         Ej3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792338004; x=1792942804;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpVfLiNPs0OQlpSkKCUQyoFk2dyYHH/SWsGcZu3oWUo=;
        b=AsP57Tu2LTOnGjKzoRGKLolfmjaDem6uk/k9HdJrmSYBYjRIMPhbZ9dZTbv+OzEDUL
         9HjzhpIwxKe6GhonTMhha8Ij3nfpt0fhH5iNDbJWapA1WkAa+uMiZux3MiyH1lM/+Ca9
         FatKCNlfITt1KhWIAajicYBE2Rc6++hBMiS5X4Vey2TyjlT2SrLTU1DqhEqI2VbvW/Y1
         cWF1aIsrOScZ/FW0BBNBj4L27NgaQGAxxvu2UWU6qynmJ8sPvuD+h+ZuGHNDFwGwkvJt
         CH8wxHk/1pteyF0M5pcMsJPW+og95v2s5GV9ClPFxPFLQOGG6kXxZwiTTSvjaSwLH8WT
         Wr4w==
X-Forwarded-Encrypted: i=1; AKwUvBxEoiWZs0ECDVM9bJMW2dWHOGloybxiiMeAM7WIWU6NJ7CT+OgnwuUC0hmREkfZj3NgdwawfJOM3MS7@vger.kernel.org
X-Gm-Message-State: AFq9FYKK+JeYvPc249HbIWg/yTGoPhCQyrGUsM7vuFyr9Yraz2425vPD
	hWw99p+JRcHn8NIQW/yoPmIelLi88kt31+70ZwJg0JLEQ9vCeEoa7OIq
X-Gm-Gg: AYBFou3k5TJZGxvgEfHhAq7OAqRZOuBr9Z2pCBdneWykGPzxuBv+71DVt3UcKyRWqVo
	WZiGykWxzt3k1OqCQqQMj1di05rlKmav5p/YgB0oVynzJfmxbrXRT8DYZsM+i9cON0jB/iOlMQU
	oqfnKqd56a+Uqs0J9FqTi2QNV9/RsTZmI3NG4J0rOzD14S6gh9IfShth3GM09aTaxrQz4Q37DHg
	xIpCXRGzNPlma6YUM4X+45EXzXd507hH9BGDA/8lp0JHVIsVv0MBpYKXvODb2Dw8zt95lA9IAG7
	ajkUnWESpPo7r4X5tH6y+V17reXYCjnG7gP0sJGtJudW0kDe3vVHgbiYSrNX0VMS8/QLejt7QBD
	TR9SbRKISiH+GR6n6TwwyYmd64LA7++brGeMm8FSeHi1WQ5EWPMc54rxMqd4lm3HZh6AWTIQR2O
	w5Wk14hzbt9O26vWvJxm/rkZFGsgqsEZJkCqKHTo6fUuuGZtw+vXA3QSmDWU94cSGN7LfQrKZLN
	/9oKni5nvd8RVy23xOxOktYCeuSXhTsDlxhZN0AusOCuyKmtOqptOaFeUAaTLZISgVgl9Dpsk8G
	NIB50VjiAViHazaY5e+mnfTuaNVrsZwT2XLXpifX97fBm0TSuSXaGWEZXELT7jGp0owK2kinco0
	xRGpqc71ada4uwC1gwLEXgm/HpMCCDjIoM/zTg6HoeZ6FK522iPh2tRKViMxhzVWZ
X-Received: by 2002:a17:907:6e9f:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c419d34fa71mr381776866b.17.1792338003922;
        Sun, 18 Oct 2026 08:40:03 -0700 (PDT)
Received: from systembl0wer (brn-rj-tbond05.sa.cz. [185.94.55.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb4ba6sm268672066b.75.2026.10.18.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:40:03 -0700 (PDT)
Date: Sun, 18 Oct 2026 17:39:44 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: wrmfwv@163.com
Cc: nuno.sa@analog.com, jic23@kernel.org, robh@kernel.org,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tenglong Guo <admin@micronull.cn>, Sashiko AI
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: iio: adc: add documentation for
 adi,ad7816
Message-ID: <20261018173756.35a0eca9@systembl0wer>
In-Reply-To: <20261018110015.39497-1-wrmfwv@163.com>
References: <20261018110015.39497-1-wrmfwv@163.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 19:00:15 +0800
wrmfwv@163.com wrote:

> From: Tenglong Guo <admin@micronull.cn>
> 
> Add a YAML binding document for the AD7816 family of ADCs.
> This fixes the checkpatch.pl warning about un-documented
> DT compatible strings in the staging driver.
> 
> Reviewed-by: Sashiko AI <sashiko-bot@kernel.org>

No, an AI cannot be credited in any tag (except in Assisted-by
but it will be deprecated). The v2 review returned several
issues as well, so it's definitely not worth a Reviewed-by tag
either.

As for the binding, I've sent a patch removing the AD7816 from
the kernel [1].

[1] https://lore.kernel.org/all/20261006115119.1416-1-joshua.crofts1@gmail.com/

-- 
Kind regards,
Joshua Crofts
