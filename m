Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F4F223707
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776958629; cv=none; b=pMdVJ6uDGmQdMqT+POGq4+v2IYtuUn+7NNuHQaY8wsIB9ohreqbN61ZRPgmnWOQ9W5oqmfXT3fkjWMjW8uBYwvcvbHlY+394pm1AtC2eC4cHM6/nkKOA9CzJng7h30VvEDPTjdIIW9UiFnAQ5I24uLP47Gg8aWH40bqm0faey6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776958629; c=relaxed/simple;
	bh=FxeWSHojL9I2hjnDP74oJjigeNvPpCt587ys1nSqs4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAJwtBYEK2vcVFradbXTEgu8NJXmvUf85o1BAnztOoexZZ3MSy559WZXvDIs09wWkJoL/JisVMDl4FRsQh3R0o9sFfcDCap7g4oh9nFSdRBn1XaIF73bukgRjqumzZY+M/PLEnH+BIyp9ZoxLPl/8JnsIiANMDauarDTXYTU6b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QOIYJgeC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FUwkUEIr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QOIYJgeC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FUwkUEIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776958627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gw+/sVmfB0haxvhnd2I+rhbcypsN/pcDpOnZUNWDrB0=;
	b=QOIYJgeCJPRmeNjhq36UNB6HwuhJF8zFp1jIB7cDmYrmANgxucu6tr2NJ5lp0DVbAu2b5V
	gScS50hUXhjxl4Mfblyhxd/jVZJ5wnfTc0O4fd2lUvZfqQ4++0wohS7ivzDqfSPHPYuCVi
	ZM6YiXxYRokbkhRtNbctxrY3PUGcWhs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-mmCTR7pyMbK-MPHr6O5wDQ-1; Thu, 23 Apr 2026 11:37:05 -0400
X-MC-Unique: mmCTR7pyMbK-MPHr6O5wDQ-1
X-Mimecast-MFC-AGG-ID: mmCTR7pyMbK-MPHr6O5wDQ_1776958625
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50eb8bad331so51025671cf.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776958625; x=1777563425; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gw+/sVmfB0haxvhnd2I+rhbcypsN/pcDpOnZUNWDrB0=;
        b=FUwkUEIrfRZteYq8QTVHC8f+bWdI5CetWe9q40aKmF3wsnecnu8A3geFSBkSQZYNjd
         x1nMJapPTE4NTxj4rSueiG1kH1JbmAq8UtMHOS+UL5ZHmWYXWjSzX/mLSs32YrR8vKv8
         rqBSmWRZebaQGYxLOuiZXJASfzVKqxLLrHPJk85J9rFml0EkGj5N1LhA0qv+CvKmpjPU
         XPfHL0zy1qy2f71NzOrsBP7Sci18EtaUwUhgS/2mAcnj6r8A7yfxuh6vhkZdDaH8erB5
         aDeRrf6fTse1br+AjOxA8w+Tjhmk/KddmY2oZd27dkscuMpBtpmLQbOXaet8CxtEOttb
         xK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958625; x=1777563425;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gw+/sVmfB0haxvhnd2I+rhbcypsN/pcDpOnZUNWDrB0=;
        b=cm0bFV6b+9O9UkyecAgy8SeS24JPLnE0NLi5hTXz348+uZS/aewQaSm7E/XaezNwbE
         StMcX2I3C3pth6rW7Sf5ZbzM+ivk5GDSyRhjBj7HGwt+kDuftXYtmkQXWB/HGtuIxKVl
         uTO3rSn7auvaYD/o4lIEt9/8rX7iOhkBeI9VaxF9dNR/aiV7XkKIr8lvEh1Ptufqg5YG
         xGX4QlzY1AATYRoFdNvTAvBhJC6emohJPCYqpFdWJg4SxCTn7nUQClHUA3UIsEUStpnD
         mZAtmAihY1VexzoisHBkmAGwYdOD+6Ccau6NQvuZuAFBL1zP0hpLD1vUAuWeLIiJ4Xi1
         B+TQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iugYfw4Xv0OcuwxYSaTFhYGqx2HPf2UyU4Dsh1CnkMiHNe2pX+yMAd3v16AregJgQu79EtyAevp7I@vger.kernel.org
X-Gm-Message-State: AOJu0YxR0ckZbBEk2JUHlAs/dLUizjrbA8qDlw8Mue6pVg6JBNZ0d32Y
	7fRQuGVTuzI+3kie4jxtsSP2/gQ86rorZPiV0/qChlN4YYaeUy+nh71fTNjhiVOKopmryyLc8/l
	nJ6jv8DiPrABDvlayubgFynmTnBLanFHEQV3gZivdKfvOrBGytTnVEj6wXbjabuc=
X-Gm-Gg: AeBDietzpsEQy8tWH/goqiOkX4OuQtwci2CxekXVF0cqy7EdvPecHoS7LmLcPgY4eAu
	cfIybbTgHmu52bqbYOxnPDkCL2TvmSEHaoJlKBc8m1Q1r6BnMU7XQgMjFPNf8c414XIR1YkOrIM
	S7GioXXP/OsQx5HcTC4OTtgPhqT3Ls/jD0k64zVNdgJykFrlcy2ktr61fWo6p+qvlILdpT9/Ffi
	NHlAx7U9HW3bLrdgCG30sswJwldyj5iFBspXrURQ9saPdXtDRaiR5EHfv2K6qcahu1I9I8hARac
	nhW0OlhYgkIWQelZ14URZO59zSor9wsvh3Zcgfwg9eEq/nHInOgz+TKNqMw3EU5TUlyN43Nyrf4
	03z5iyqiO5Vp+WPja/+MMNlaw7KliJ9ImRNFnPYTqU2w1r+jmX2JNM+uUa5xlpFHg++E=
X-Received: by 2002:ac8:5e48:0:b0:50d:af3a:d8ed with SMTP id d75a77b69052e-50e36c495a7mr404228221cf.41.1776958625023;
        Thu, 23 Apr 2026 08:37:05 -0700 (PDT)
X-Received: by 2002:ac8:5e48:0:b0:50d:af3a:d8ed with SMTP id d75a77b69052e-50e36c495a7mr404227811cf.41.1776958624557;
        Thu, 23 Apr 2026 08:37:04 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fc42c7fabsm41552511cf.9.2026.04.23.08.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:37:03 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:37:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	benoit.monin@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock driver
Message-ID: <aeo8nn-eigzlojWx@redhat.com>
References: <20260423090904.2108-1-dongxuyang@eswincomputing.com>
 <20260423091114.2326-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423091114.2326-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Thu, Apr 23, 2026 at 05:11:14PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add driver for the ESWIN EIC7700 high-speed peripherals system
> clock controller and register an auxiliary device for system
> reset controller which is named as "hsp-reset".
> 
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

There's one minor bit I am not sure of.

> +static void eic7700_hsp_regmap_lock(void *arg)
> +__acquires(lock_ctx->lock)
> +{
> +	struct eic7700_hsp_regmap_lock *const lock_ctx = arg;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(lock_ctx->lock, flags);
> +	lock_ctx->flags = flags;
> +}

I don't know if the __acquires() is accurate syntax. If it needs to
be arg, lock_ctx->lock, or ((struct eic7700_hsp_regmap_lock *)arg)->lock.

It looks like this code is triggered with clang, and I tried compiling
this driver with:

make LLVM=1 KCFLAGS="-ferror-limit=10000 -DWARN_CONTEXT_ANALYSIS -Wthread-safety" \
        drivers/clk/eswin/clk-eic7700-hsp.o

I also tried with 'make C=2' and I don't see any locking messages from
this driver.

Brian

