Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE1739DBC5
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 20:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780517707; cv=none; b=eCsrIwFCZ3YmaFl98bTVq0jANH2tDOskcVLhyVP2QBxqexIB1zJiATNXIG+3DhEiq6Onw9l3qihFW/o7KH0zEWQXTSDcBXLBe4p2BD1rfmy0qS1YAdoi3aSef9I2iZVIqj3/JmQIOM7RMdla1fWBWA1OZuw0XMV0XnS3Z8KJ6hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780517707; c=relaxed/simple;
	bh=sO1nneZ4T7xV8Woi5b1grLQBOHrxGNQXxrPZI2WzrAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTUrJfU5QDmRTz/is8FbRcjDl2E4fsUmpAgRQlXCMHWvbg4/vCjZlSt0WOxyERpR//uGHJh+0/qHTEt58rpK+UnHQAmzCyxlWEhSWZbrrbZVA4gD+F7ENoJaUmPtMRPuFk37ql4EJIiJfQ1A3PTepPR2wD4UpcTggQtntFKT63k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3pKSVOp; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3pKSVOp"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-441080fd7b9so199966fac.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780517704; x=1781122504; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K/dIMvjAW3Fjg5zbaaxJs4cecWXi6epOwVSNNUQhQXU=;
        b=L3pKSVOpLbVz+Uv2/tzNaI3QA7gUJOb1GmmM+MIXe2xc5Ujn618So0zwNh0QGbIAIF
         Qwu3slk9yfk4W+5u/eTzohKdcfA4B7+BpeAqwKQFysjg5yDEcWHKZdy11Zd+XY+Fm6X5
         Xl5C6MbgsHMoK6uzfKogm50e2zIzZtZgE2vC5gZw7b/nti00P5NDbem0/qKabdhrwmIG
         /gRJ6+pcf5Jb65GdSWw0rvD7RHRjS66rMUg6JEvzF5i2lc7VTS+Teelnqlgdi92vIvAo
         fCv1Q8ZeEI1ZdqkdA81ElzU1WgCN6k7wjmFjzGazSFbkjLfhflRNJCS7BMYEnUHIrVjz
         rj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780517704; x=1781122504;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/dIMvjAW3Fjg5zbaaxJs4cecWXi6epOwVSNNUQhQXU=;
        b=b5p5H+tiOmRVPBmI8PNDXOiN3CX4axduA41VVVjNT2zpLKEsoIWMnvjRfL1uAXro1D
         I3nNpd4OODhFchBL6b8UfyHNR8TrmKxZEJx5R0t34fYsa/ta7scxcm7MihEgsyQQ7+zu
         mlI0dZfjF7UdJyjDTBK8RMfmhBKYXKRyZnUO/iZ5WNoEjoxIIBFDtnY90/dC6S6o6Q0E
         AW90yyYsL0eqpXevMMuO7OYq3yZXprnCsfpUq/Jw7y93KevAH3arNkRw5h+/X++XpZ8e
         h2dX7gttHy4UH0e8WcVFPUb7YX317ZGJXp90AIO/Wj2UIFCTS/ywJmn3ymZgZ3n0Tlw6
         i0ug==
X-Forwarded-Encrypted: i=1; AFNElJ9zk6RqR4bAvlnUand8Y7wqFfRj0FfiRBO6sE3mTM171F9DqppRdNWdGz8b/lWiIcQsv/8RYm3SV6C8@vger.kernel.org
X-Gm-Message-State: AOJu0YybPRnkWccjsQEk+Jxaxj48KH/x5QKeybVxtOjuf7Fw/EqYgkCq
	VFrnfUiw+Lie8hLEG5afZ0RzCK/VG3EwNYImDOzBByH4qweC8tBEHwlk
X-Gm-Gg: Acq92OENAeDNjWpA+MLx0w90As5Wwx3H551sQyX1g3VyUWRotfO+fWS45FdkhVvwM+W
	Ur/g6aJHyasVQsdzZzSM8KAs6qE/epp5k43wwRBad2eQqxU2xw2K/7FsHQHM0+Eppux1GFx4Q8b
	EUcQWiGQPrV5oz3UUTpgCa7FTZYZaP5xhigYmdrsvSVOBYf/y/q4esafAKEIZkmtwiE4/kCFZ2x
	Oe5JIRA8m/cLODm4gomCIyrjhCmCQavZCWpBXgTe4pN047l8ptr/BdYA5gTo8Uip/RbQ1og9Lvp
	3vrRX5jBjCX7Z28mBkTJjYC+lq1Rf/tFqQbsKng7NFVJNBMLQSz4UYGKV1eljBe2BpFlocdpCjP
	+p+ALvnDpePtPRGVJpwnJXEo84u2eVlYlVwkpre3HuThnzRxMMBXfCX9doOjMJiTshhtq3YmNv5
	UnusM64INXcHP4V5b/u6EDy7BLW6J1hbbE9bb5MDg=
X-Received: by 2002:a05:6808:d48:b0:479:fc87:27ee with SMTP id 5614622812f47-4865aa4f1b8mr2895892b6e.1.1780517704461;
        Wed, 03 Jun 2026 13:15:04 -0700 (PDT)
Received: from gmail.com ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d8500f0esm3003888fac.18.2026.06.03.13.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:15:03 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:15:00 -0500
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: input: remove obsolete matrix-keymap.txt
Message-ID: <aiCKBXqvOmQ8gC_t@gmail.com>
References: <20260529052246.4934-5-akash.sukhavasi@gmail.com>
 <20260530052311.271791F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260530052311.271791F00893@smtp.kernel.org>

On Sat, May 30, 2026 at 05:23:10AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The commit message inaccurately claims that 'Eight files still reference matrix-keymap.txt', when only 6 files actually do.
 
> This commit removes the obsolete matrix-keymap.txt stub and updates all
> remaining references across the input and mfd binding documentation to
> point directly to the matrix-keymap.yaml schema.
> 
> > Eight files still reference matrix-keymap.txt, forcing readers
> > through an extra hop to reach the .yaml. The stub has not been
> > touched since June 2020. Update all references across input and mfd
> > binding documentation to point directly to matrix-keymap.yaml and
> > remove the stub.
> 
> [Severity: Low]
> This isn't a bug, but the commit message states that eight files still
> reference the text file. Looking at the patch, there are eight total
> references updated, but they are spread across only six files since
> tc3589x.txt contains three of those references.

Yup, my bad. I counted eight and wrote that, should've said eight
references across six files. Sending v2.

> Sashiko AI review · https://sashiko.dev/#/patchset/20260529052246.4934-1-akash.sukhavasi@gmail.com?part=4

-- 
Thanks,
Akash
