Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2292472B6
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 22:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783893634; cv=none; b=jsLlpdU88uzBCOyVf/ebO+IMu8r1yH6liS6LUw5ImYTye2TtJATej4OrEOZWxiwn/JSCkk/sfSZEHAyTuxdClkMFLFiH7sqHCT6+jIUyoGkrJyqNs6LXFq6h2g9hrAkTjKjzR5+aq5LIvGprYkUMb8FFyBUFgkyP2ZF8CO0r0MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783893634; c=relaxed/simple;
	bh=veaiSq7II/ruoHT1xIwCXs1Q8DVtMWJs8KGBIWEYhoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0EPaDgHXyzdCAA3IyoGMpyWW+KEHyv+8CRLCvrwfjSoECe7iVety9l4SxwqIoLjerDgDC8MqdpaZ9YnV0f3m/265luPVwmRlz1Qp7f6vn0M+tajjDVbhvTizVOnJvpMiRQOJXa/MUAjzc4ovNWdejc+GYgII5M9iixPZ+zz0LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=GzBDB7Eg; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="GzBDB7Eg"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51bfb91795eso18963071cf.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783893631; x=1784498431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mw42W47cvCq48JjABnRIE5S9vXRaDxPhdeJG1XHceJQ=;
        b=GzBDB7EgwR+uWR/88EDVRQkJ2FQhHnHCbfIzu0oGMx4ad6SHJOBhlssMQHP97kNxoO
         sVj326qMQjHqDIcwLCWOn412uAST0XMbX6sABGtoX9H+e1Wr+LFZvSZaB3oNY7/+/2Je
         HrOue2VycEt4vJBpG/MYBpWrpphHL06qrrO4Nr8Y+CpaoUnWryqRvuEMinwcFAUfn96k
         pROSTWh1f4Ks5DIzF9XbfJcJ5YmmAOksHt4zZ09Fd27/lbiHYYtI7L3yNdsAdaxfAaLJ
         gpZHPkS57y55S91xGV1m7LtFWoK+1fjmDDPvrEqNvtu53nl+GHxePtWD/fjYUpIqkCiq
         0w5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783893631; x=1784498431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mw42W47cvCq48JjABnRIE5S9vXRaDxPhdeJG1XHceJQ=;
        b=VQq33CEV7hfv9lq9mckgBtzAR7Bx1kkBqAxnLdrEBgc1dG8V+l+UUc8nF5b+a5RMUi
         UJmRgRm3EUqyOxkd0hCJi9z5TS19sd5ixXgIY4rVM9aiiJ8E2WyX9wE0UAHOhDNDWoRi
         MRpWpebRDMJdivl+CQEdREDyEc2ypW65HnjZISUTlKXzSddFoS3mM3tIIk1Qdse1nQE+
         ySLzbwwZ6a2QAWVwb1r4b/HgF2BIHZHV9rQIYxnx9IauNmsOZuYWfcv+NxEvVwg4ol0w
         sBWgPcwZntgT72s5n5yR7TshlsBRAbRns1EAcn3UcWeza1fs7dvYuQEnzJaHyHhG2NbL
         TYOg==
X-Forwarded-Encrypted: i=1; AHgh+RoInhVJG6fPf9r7Klnh1z0wNJL3a3UTbKI8F/2NEhrhBwVLfbMd9fvqw6UCJpIaXlu2XxRXvShN2Dy8@vger.kernel.org
X-Gm-Message-State: AOJu0YyVpzTe6hpD+3UJY7ckr/8D7/9bHulcCmTKFG+0Ru6gGSGEkRSv
	TBOufvKXnZsrNOkYIqxeW8NE+7zQpor5zn0XO4RKMlSeT0T4g/42V+ZVO9Fy1hrzTmJYIO0HhuF
	bO79/
X-Gm-Gg: AfdE7cn1ENk8hzEH8G2cDfyMAecDjIbOuoHzXqsKfLW/16ES/Cz/EphHD02kLDWWPAf
	XRzqUvwNBgSMAIsG2ZGff2v4Pd4FcrF/ORaG6bVLXyZ4FKzb+G9LLH7VEE4R6cPU82VPAMS7L5Z
	h+uAgl9nWva4x9kcKaFBz1n8P+fmGBKfPoFwV/cy5Sk+ikHpzuCETJ7wTjb2uYRPCkclBAIX7YX
	gGORQEywtmSYoF2xn1HCUzAieHaSe6i6yTXA+corwlZyimLDsaUNFCiaSHb6PGTNGVXbNpSfOoG
	DBJSIemx7ywMcnTYWOyYBriTfAO4r3Rtf1LkP+SQFfCzpwDEktmlXq7GCwrzh4sIFvdLFUBONTd
	nnE9eNSqU6YsYo57oKyfh1QEJLAVUpV1PaPKjw2yZToc62cusqtJ2RCS1coil
X-Received: by 2002:a05:622a:ce:b0:51c:8fb:fa54 with SMTP id d75a77b69052e-51cbf1f5fa9mr66777941cf.57.1783893631369;
        Sun, 12 Jul 2026 15:00:31 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caae2068asm68895591cf.17.2026.07.12.15.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:00:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wj2Dt-0000000BnC3-044j;
	Sun, 12 Jul 2026 19:00:29 -0300
Date: Sun, 12 Jul 2026 19:00:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com
Subject: Re: [PATCH 1/6] generic_pt: allow missing sw bit in DMA_INCOHERENT
 case
Message-ID: <20260712220029.GA1835788@ziepe.ca>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-1-80e10cdde2ea@reactivated.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-1-80e10cdde2ea@reactivated.net>

On Sun, Jul 12, 2026 at 10:18:51PM +0100, Daniel Drake wrote:
> When working with a iommu with PT_FEAT_DMA_INCOHERENT set, generic_pt
> will attempt to use a spare "SW" bit in the hardware page tables to
> denote when a thread has flushed the CPU cache after modifying an entry.
> 
> This means that other threads know that they are not working with
> cached/unflushed data, if they come across the same entry.
> 
> In the case where no SW bit is available, two things happen:
> 
> 1. __map_range() defensively flushes every time it reads the PT.
>    This ensures all data that may have just been manipulated by another
>    thread gets flushed and made iommu-visible immediately.
> 
> 2. An undefined reference to __pt_no_sw_bit() is created, causing a
>    linker error in order to alert the developer that they are going
>    to suffer a performance penalty in the previous point.

Ah, actually this is all setup like this because it doesn't have an
implementation for supporting no-SW bit versions right now. That a
mandatory flush happens is not something I thought about, my original
plan was to put the SW bit into the struct page memory instead and
have some extra barriers..

It would be better to not call the SW bit code at all if
PT_SW_BIT_NOT_PRESENT so we have a clear algorithm that explains how
it is intended to work (ie mandatory flush) in this case instead of
disabling the linker safety check of using SW bit without support

Jason
