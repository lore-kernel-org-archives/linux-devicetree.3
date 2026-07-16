Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8639385D88
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224235; cv=none; b=IJsVOlh2cv+fpILTBF8oHSB226dfvLpHUw3OmY7V4YzCR72uN8QaruiMHbwUidHEBQeHluff6T8B9Ax0Bc/hXTvnBJR6G8DKgEZ5LMqW+XsbVWdiBCZDQMgkexKck7WhDLy+yHfyDqLoe+MguBoa0JrIZWxSxU5zE//6skcYEbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224235; c=relaxed/simple;
	bh=9J8M2E4nCSvX004xsytxrQ+sR2NrUHgAAaEVDd+Gzig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZTy03iw8piAUyt0PcZoyY6hlkirzrOKEG1WMbdZVqD2vo9GiRkwx+5beZ8LjepMb7C9+B9UE8tyv/oFhjvlAiJGY9ll/WyWRszxaeAYTOwbOboTdEVIqp9L43cf0QvSOYXxm9h/f9994Wgnxnr2qcZU9oCgC+heJV5TonvSI90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQIgXHXq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lm0q0NWs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQIgXHXq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lm0q0NWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784224232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2N4WfjYHE7wwtUQtU8XSYvtJnFaogNRLwB8anl/OSc=;
	b=eQIgXHXqPlRRGhcpoK/os0H7DFk5q9mwqA5+lqxyhYGcZLYPHUc1M2SgH9GCRHrtSfiAjM
	HLXLC8nXPiGhoP8QrogtsVVpHnT9KCFrEmu4iVdVC3b12IrWnkuql/vEvNHxropd+eUX/V
	aH2M586rJId2t/1kiku4T8ce+20gUGg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-XOj8wnfFPQ-tBRigYwhS_A-1; Thu, 16 Jul 2026 13:50:31 -0400
X-MC-Unique: XOj8wnfFPQ-tBRigYwhS_A-1
X-Mimecast-MFC-AGG-ID: XOj8wnfFPQ-tBRigYwhS_A_1784224231
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90410c668adso123522966d6.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784224231; x=1784829031; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y2N4WfjYHE7wwtUQtU8XSYvtJnFaogNRLwB8anl/OSc=;
        b=Lm0q0NWsw2OWwSRUBrLNk+hqphMp7DBNuCYCut5gm8U4LdbP5YHCE4WqKxkDXY9TDN
         kH6E3divpGcqQHBMsvBa4zCtzl8OdiFGfLBRvRQNvaEVJUw7gQAFLV+jHvGy/iXGFW+3
         fbJntYpAGEo5NivXkXllXztwW4UE4EUj03vmxk/15b3KYyK6+yd5R8nK5Cfz8RkWggIE
         IDuhtMnIJyELPb5A1wMgUsIujTgK07YYqwGXYgmcWHlzu7PJc2ouhI8oW5VJ7bW8AMJf
         oPcz38XKKg2BNWBtfDaN+q6wNvV/ti8ct4QSVImrtUS/la7c6bnO+T5H+YvHt4VwtyQ7
         h+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224231; x=1784829031;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2N4WfjYHE7wwtUQtU8XSYvtJnFaogNRLwB8anl/OSc=;
        b=GSexhU43cOpyDw384EvFd6Q4njjaNXJgKKSkPRSvxYRRrqqyh3WVz44a9+rLpV7RRn
         O4QIp8W82Vuf6wjUAYoIa9Zkh3/6jm/VCI6JmoNjafayVMCbNIe6j1SlwbTfeoJ81Y8c
         9sYWBrGAxGXZ5qVpuzipgU4fufT85W29L+kl71d8OWAmudAh5fespEwxM/z1gV6rzQX8
         Zzd4qBZCsWXV+NavGa+usELfN2I2qK8k0zgDyBpun2kGWrFQIzNXA9rmASW1kd099lOM
         aunH9cfv4zj2i6OT2rhLCTdfR1rRNgVx8YRQa76TTwPsAABGmVmdUWR4a07SOEcubF/T
         4tgA==
X-Forwarded-Encrypted: i=1; AHgh+RoGKX47OU8ftk0AfbpJJkmd4eacon9UKp9jHEf05NYx6hPX7aNI5FvziCkCF3bRPHVoJx/Lt31xoDp6@vger.kernel.org
X-Gm-Message-State: AOJu0YwYLZgjhYgGP3YBO/b+nrojIqpHXTslu2ApjJq5DM3/SAJ5BPpO
	mawLRiasMnnto4kxt+kPwTxC9xbKw/hkA5vhOqrj8tFT6sd+/Bcg/CF5vrRuTTnAAg277HYhH+0
	3HJXWioPR1q4oQp9MOfqcZmn1qr8HDlbMUeCr3e8r2doFlIgJHUVqlmD2OoLpEJI=
X-Gm-Gg: AfdE7ckbz61hfRsmLaMDzQXY+GJgpO8MElGxZFKrSx4lZThvu0O9D059ZhjzKwI1kzE
	COkP1ncC3W3nqe53Tteofaji3CqHVU2Edk2HCsxW0rLKnp+UwiOt6GDiau+HF3RXyzbrZxrQLil
	V01PGqE1kBCoXuG8Q5F0cZKA1hqf9UEkx/7aRLdxMmNE0/UCqcM0IhZ/WFkKwqKzuQTi7R9ZgnF
	p+yNxk3qmOYdiEe0tEq8dLSnthiSVzg7CvWoipNY85AgTw6uYUeLQlDNcLgcgZsjVenR2nPo4Lf
	2HIpKz2vxng5n6OJPajlGnt8UUCpw/ND7Yf/oq5aPCbcJWN5MTfi6veiP2vDn+KvpbUeFinVruU
	SAdfykp79kY6p5fGt4XRm11bj4eaPwulyRhA=
X-Received: by 2002:a05:6214:2b9a:b0:8cc:d588:4523 with SMTP id 6a1803df08f44-90747c2f10bmr115232126d6.13.1784224230689;
        Thu, 16 Jul 2026 10:50:30 -0700 (PDT)
X-Received: by 2002:a05:6214:2b9a:b0:8cc:d588:4523 with SMTP id 6a1803df08f44-90747c2f10bmr115231786d6.13.1784224230237;
        Thu, 16 Jul 2026 10:50:30 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd81f4bbdsm219440956d6.36.2026.07.16.10.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:50:29 -0700 (PDT)
Date: Thu, 16 Jul 2026 13:50:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: wangjia@ultrarisc.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: composite: Export devm composite pdata helper
Message-ID: <alkZ45CDRc8DMSrc@redhat.com>
References: <20260714-ultrarisc-clock-v3-0-4b1ccaa26b37@ultrarisc.com>
 <20260714-ultrarisc-clock-v3-1-4b1ccaa26b37@ultrarisc.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-ultrarisc-clock-v3-1-4b1ccaa26b37@ultrarisc.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Jul 14, 2026 at 09:35:07AM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
> 
> Allow modular clock drivers to use
> devm_clk_hw_register_composite_pdata() by exporting the helper.
> 
> The non-devm composite helpers are already available to modules. Export
> this devm variant as well so users do not need to open-code devres
> cleanup.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

