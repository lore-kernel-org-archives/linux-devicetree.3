Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9520549DBB6
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055056; cv=none; b=ciqTBrkB2BUEVFHs0TppsxKkFvV9V9QKxGrCN85E0qzpQiEyCKtqUHQUT8wKW1gP1QgAfwaUc9lmlXoqoeKKX/SzXS1J7FRBMs7XFrC9Kgf+/sRn1eo4yViZ7US4Ew3+pmip3xd9akeZTbkqMjgLXO8Du6DJ052Ltn95bvjHBDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055056; c=relaxed/simple;
	bh=xoSMGcPrzf+w4ikyCB84AbmV6Jpjst1FcJWplTx8esM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fl2n9EkSmpRBrw3bYtldEYPWi125WOx60YPVXTqny/3NUzb3jrVPhzIM7x1MMk29TNa2UWFsq3sOjZIljo6eRvHwC8gac36m9hpYOIAfNln8LTWLE0xAFYVEQSmJ9H6zR7zmObhehJFh68MzJYGxduVvqDMfQTRVxLKcmnCb+zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQ3Samn+; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQ3Samn+"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so2771334a12.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055054; x=1792659854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAp8nRUf9PkjRjYtrHFE+R8uyBzEHqKOUymE8wD/INs=;
        b=fQ3Samn+P858XwzOXIVfDZwxT/bskJ2O3BrrkISWkWOuh4248zlzPX5zxwI2qNL2F0
         4QlPqYj7LP5mJAD41wo4k51wicG7L7Y9f1QJ2ykXeqw4RWayUrMIJx+zE0qXGRQMfKso
         ZoO4MObKUXhmOJtU1QJPZI8q9Ww9SiK89QN0yhS0oCaPdBkUIotyieYKiBaB2or9uMvZ
         hURy2YOV/a56ZDFwEitcunTJEGqQ7W8mWnzmecZ6srUB5xUlgCh7R05N6d9KTAPhFBqF
         wEzM2PFnBOkVvuIwmnJHOhK1ypqsTAlMmw2l9gYy/Pje51Vfs/6RiTZJ7V6MYiwGJzn9
         0Guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055054; x=1792659854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAp8nRUf9PkjRjYtrHFE+R8uyBzEHqKOUymE8wD/INs=;
        b=B9phravrNTF/Q9n7MMC0dVzlb6TV5l/m9OZ0Tls00iU5UQjfhRYLssL3b6VvtL4ODa
         j9Hd9SM1BE2qBKkaKC1Cxquh1vNZl/ZR/Z8IwugGvepH0vVOb+bz15NW8x0bkb3T/WjL
         oNuDm77l3jt1HkcwneQsS7ew6ed9AZzX7ORWyFZZtgicEpREV1WfAL0T5a39ImvFOWMi
         1nxbxsQJ1cEHH8sZznPzILSOgtg42r8gYAT2zIZcCeQ2puuehL8s24vC81Iti9gJ6FDM
         l/kVFzrh6JPo9yTQ82oi8kMSfyik33JurgUs9FJRQSLCc8KptNiSCR8tuMV0OiJPjRX1
         3Y0A==
X-Forwarded-Encrypted: i=1; AKwUvByAI3XKpQWQn3hz6fDzzgLrK5affAnO24/h53/QlYG94S5cbgu/crWDEI8H5QZgCT/RXCVzVMl0cApF@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+1NbqHlQKfcTuFfzStGDGtWf3Gv7IqcVsbttkcWI861rmO0yL
	pg6un4JRRh1Sf8uZysv9/pnsbOGOcCvOGRCRGLn894vB/UudHngzAyEG
X-Gm-Gg: AYBFou213BY5wANJp7Ff/G/t1iNQHqWZza2KCvBKRsH4+zHNvXlXL0BYYj/nf+cZrXk
	KtXjLadymFF5GBRErMM6IVGJflIc79KRrUuewLBhoSIfyDmxOvwRnPwTWKCK+3r1YSiN8i+jehZ
	r9cK6qNqdnqGLcNEGDlNTMczjFrg6MCcu2Z4LNZTVPFxiBiixMRMtuHZaqdF0fSUjIXzbOLoQfJ
	fVi8xf0ISwcB+/jfh7c4bdHMAtrYgUaJeeG4T2ztlYLySfQLKEiDZiOi4yDZpncajD8b0ToDPlH
	uab/NoBTK0cvjtVSoStPfwgsxfG9bKtS3LhnQy0LFdgfavcvURPH61RZ4SlvsANa+p5RS5oVAWf
	ZzEeYNRm+xxJkoh9oz9ljN7n6pxliOuZfQ/wg7Hil7kXSx1tDZUSmuto1bKQUa793qf0T3uTp46
	sOcG6pm3V8MNJuB5aBWe995WYp7iORLXFN5NJHJW/ZLslzFaNxXmzOpgAGRM8qgaVFAMtJ
X-Received: by 2002:a17:90a:e7d2:b0:3ac:a521:959 with SMTP id 98e67ed59e1d1-3aca52109eemr559134a91.29.1792055053807;
        Thu, 15 Oct 2026 02:04:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm3869119a91.9.2026.10.15.02.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:04:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:03:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Message-ID: <atCWzDzmknrsMNNQ@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-4-inochiama@gmail.com>
 <20261014-romantic-pretty-petrel-36c7ec@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-romantic-pretty-petrel-36c7ec@quoll>

On Wed, Oct 14, 2026 at 01:43:50PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 03:45:15PM +0800, Inochi Amaoto wrote:
> > Add eFUSE controller node for SG2044.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
> >  arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
> >  drivers/nvmem/sophgo-efuse.c                         |  1 +
> 
> Review code before sending.
> 
> Best regards,
> Krzysztof
> 

Yeah, I forgot this, I merge it in the wrong patch. Thanks.

Regards,
Inochi
