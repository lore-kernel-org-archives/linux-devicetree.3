Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657BC3DA7DF
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958943; cv=none; b=R+RIitrEn9+1IZA5kyuKEDGFOC7CVll9tpfY3oTp1sctKGck+wAi8eTK4PyBipIDRX19bfbBZVY3KfSbC4VRtqJ6O0g9WHKyBr+Wf+2d8lU3CLVPzn/xnG57dsk+z7BTRwrMi5txYksi1DDvOocwIP/3sPDF6q27Q9roInGVviw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958943; c=relaxed/simple;
	bh=j9Pi+ZLX4OZ+1G9Ee1d8lNIg/X9OdRMm+shG3FZAY0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1fDGmedqfmvuWjHKrgJzyRM7k+U9enJL34tK2JhXm7i81fH01FDGyV216hOc0powAPIKbeogazlZHqqwxYTvD5A1Sy0rYFjuuHy0wtlelWaGiNWtGBfZVoY/nBN+cvST35ikfN+3GKzoafU5ddcTAD3I/8Yhiwxq9QMVB40Sh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=TteGEv3r; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="TteGEv3r"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b81a2d33f7so474087e87.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788958939; x=1789563739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUgF/CrYctElW8HYQdRdPRn47TT9mqidw6R7aTL1YFk=;
        b=TteGEv3rw5PRh3xCi7RSZmo/XfTpdNoLKT3o7Fox3/2GC4IHNB2ykOR0AM75XfsnlN
         46dFl78auB0XQtZup01uxByqtQ7sSuSS6ec3O7ekCli/4CLYgSCTSYfLF1coBs9CQCpp
         p2OWw9XgjF3oDIFNe4l04YyTOijfe5GIJqxfKMU9zdMJPuVeC9b9HWPDnrhRrjmuX9P2
         6uQfctIbZR1dGp3kJ75cHE2qr5ydQvEtm9rJqfS2dIJMTN7a/6uienhtR6TxUcTVHL0F
         QvDbTMHMtVOIIWM9COzpy3bJThgzkHzEjV9jX47Xovlai/hdpszrhdZi4zzTAN1cvi/a
         Q6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958939; x=1789563739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EUgF/CrYctElW8HYQdRdPRn47TT9mqidw6R7aTL1YFk=;
        b=dDE+43xe7HOnMVZWSQiTbQy81mcsKnMHY6dAGyJbjsv0V8xvn/ElfxGN71MBpteHtP
         sUJx6ryk+q72ofwCil9uoowX9tLaWAPdkOzaerfuuhulOA5cR8ZJ5HNH0CKflmdh+gcW
         /iEqSPftSfZSlgToXKkZyIxh4VxBfP8eyx0FNU+yLgcC4m5T9IwjqA7P90fV24z8XlrQ
         d+/lh5/qaOy4qw64JD40K48OvirEoVIJbs9hNqlzWkyI9K2FHN/K9nomZ18tcbIQl39t
         0j5xvVCDz2/eF6zgIjEZT9DdYqr8hPPTor703mF8+dueMAk7an6O6e9IwQo2nrDLuYKj
         VP4Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/cnJ1Rp0Ph6GsO2APrX+UAz/adl7Fg5jEMtOGYCePJOzjXYSxuZll/cwfEVIw6bdsg0/lpwW4ZnSs@vger.kernel.org
X-Gm-Message-State: AFuF++mWSqVgoqJM3JLoIi90lyFRBD9ndO4cCQwnrkmkqch5fu3tpir/
	eRPhxsnXi+lDTKXzbz97ARy+vacp/HjYw7oSbWFOcrln4uvQHeU4kvf/Hch7usQB/Co=
X-Gm-Gg: AYBFou0Wt0usmUMmEiPSm6KIZ3OhfOH0ouN0LciDF8RYnskpJz02qsCwwVtbgAy6C99
	SKTK2RYu47Tpik945mr4C9JKL1aLuWRzOBcXeFoIkjz1eu+ZKTUeTP14xqX6WDFx35M1ILQuoHJ
	zwfcHTOvHEsPAVdDJREAzqtGgDjIDCCml/muB7GBvjRiy07XRidvkRO8pxTRZMaDB4u+/ZeHhOj
	RerL1IeMK9qoifml3xJzMDYWU7zcM5+X9DF5qJpM7uBUpofEmAE5DC8ICmiJnOnPi+ODqXBR3RK
	3lXnyO+WvY44aNNuxqqSre0LErcmYeGMsfba0HGmdC5AlR2brFMGTnwQkAUFnU7pV4wShc38JrT
	q5J7LcaTRqIT6+uxEjfXJGpFllvHEfyPyXhLkQk63Qt1tu8aOmgn+FXuzewhRJ6ppBdqjKR+yTN
	yyFEUuYt4ddV+SyGT8b0iv8QIsegbK+Crka55QAVxeu1rBAEJzpX6RfTatUikVyVMOa+MZVYg=
X-Received: by 2002:a05:6512:3f16:b0:5b6:1a7c:59e6 with SMTP id 2adb3069b0e04-5b61a7c5b4amr5179834e87.64.1788958938948;
        Wed, 09 Sep 2026 06:02:18 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166f6ca3sm3792717e87.32.2026.09.09.06.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:02:17 -0700 (PDT)
Message-ID: <9131cd8e-240d-4991-a248-a497f490474f@riscstar.com>
Date: Wed, 9 Sep 2026 08:02:13 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] PCI: of: drop the reg_num argument to
 of_pci_set_address()
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-pci@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260908213459.2519059-1-elder@riscstar.com>
 <20260908213459.2519059-3-elder@riscstar.com>
 <20260908214601.7716D1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260908214601.7716D1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/26 4:46 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Leaked OF node reference counts in of_pci_prop_intr_map()
> --
> 
> commit b3af32f45eed6da355a4a96246bdedb364fe0855
> Author: Alex Elder <elder@riscstar.com>
> 
> PCI: of: drop the reg_num argument to of_pci_set_address()
> 
> The reg_num argument passed to of_pci_set_address() is always zero,
> so get rid of it.
> 
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> 
>> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
>> index d66c702218081..1caabbd4c18b5 100644
>> --- a/drivers/pci/of_property.c
>> +++ b/drivers/pci/of_property.c
> 
> [ ... ]
> 
> [Severity: High]
> This is a pre-existing issue, but does this code leak device node reference
> counts in of_pci_prop_intr_map()?

Given of_pci_add_properties() is the only caller, it makes sense
that this would be found (again).

This was reported last month, and at that time I said I would
investigate and fix this.

https://lore.kernel.org/sashiko-reviews/a647bd56-7dc8-4fec-9d96-834622054cdf@riscstar.com/

I fixed the other problem reported there (possible null pointer
dereference).

I still intend to fix this, and will attempt to get to it soon.

					-Alex
  > When of_irq_parse_raw() successfully parses an interrupt, it acquires a
> device node reference and stores it in out_irq[i].np:
> 
> drivers/pci/of_property.c:of_pci_prop_intr_map() {
>      ...
> 		ret = of_irq_parse_raw(laddr, &out_irq[i]);
> 		if (ret) {
> 			out_irq[i].np = NULL;
> 			pci_dbg(pdev, "parse irq %d failed, ret %d", pin, ret);
> 			continue;
> 		}
>      ...
> 
> However, the function returns without calling of_node_put() on the
> successfully parsed nodes in the out_irq array. This leak occurs on all
> return paths, such as when map_sz is zero or when kcalloc() fails:
> 
>      ...
> 	if (!map_sz)
> 		return 0;
> 
> 	int_map = kcalloc(map_sz, sizeof(u32), GFP_KERNEL);
> 	if (!int_map)
> 		return -ENOMEM;
>      ...
> 
> Are we missing calls to of_node_put() for these references before
> returning?
> 

