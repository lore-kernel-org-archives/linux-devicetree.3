Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D866437F32B
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785017167; cv=pass; b=jbVXzTuNgBe4x/GVQzNGod82lan2LzNZlODmc8FoRf9dZtZUomKyqdIn90pxFDdFcqBuQWXyuQYMbzzpxqpZgqM6hcWyVeSSdPi7gabqjAXIpyigBxjCWZIgMGbxKq9dErV6JHi2Xwt9Zl7OYxbVKtGuJTKSyGfONmTUNgVXexA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785017167; c=relaxed/simple;
	bh=PuJxkWbxxjGwAHNUh1rcqgo6iNIRPAowfqugEAiHDOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1kzN8xICcVcej/xo3cdpmOLryQ24Qg4pYfQf2lreUdJZtdEH4i7Wltv/UHtMTLTFKxmC+Hh/xKZi4AvNnsUCTAlCHbInDqUDTygyxF3o4920xnz6mLUfI0XbwQCS9+A6ACp+a1zuQQC28/derDzPdDS5Xkgi1UzY3CQNj8wiOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=qzwpqnwu; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="qzwpqnwu"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cad4170e8eso23278785ad.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 15:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785017159; cv=none;
        d=google.com; s=arc-20260327;
        b=aXOMkAcPUm9w7b8u4CloFSN0CKOEI4tSLdiFtOVnK77zQ89No44uEDqUyjekQhqIHP
         zGT/AmeFU9TC0ndH8SNiTZJkqIsEJvhiqsJ5VgAoi7AZHBx8oZ6EPCLjkgf93JttBrkC
         aLBta72ObUZOqqjXiLSPYvoTNGib2bV9Z2UtiNiZkDairByMk2Ql4CQw4iYm/VRqUuwl
         ww+l1lJIfyG1D6RyWgFL79g0UOHeRLQgUEfOJTA7mBPgk9fLXHCrQH3Lq9lkRwbrvld4
         bmYJLQEXJR+opcZt86XBeHEvDgp++tx01pC5o+yAqYMvf45xrUw2GHg1RxaWTBc4MPtr
         syaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zImywQZnzpvQhiwmwZ529O7OAp/WrjEjQ2gnTEWU+lA=;
        fh=MrAS2QPfZkB+hS1pdruP8RTgx0XmzjxFyScCZiFdgjY=;
        b=I7fSZ5F66QUuxLnmbGn7PvbeiiROjFeml2GmRtBibbe+wk8+5/blEzBMpKZ3N24JMF
         gntQOsBBqEWqsY1Bp0IJE4aK/jWJyOgSrun5Qh/2+V0R0c4K+OU8DsC6+iiaA04As46g
         OyLtjOtsk1eo3PrZtJQsEvGaNu/yP0LRt9yWLC69gdk5Y/LP+39ZE28DwbkcJ+RtlUXZ
         PM08qHWeHolk7sM/E1ybWLzefJ/nuHjv2H/EsA715VWvMkMibTGB4EKzB6uC81+fTQDM
         TmhboWFX3W9LOE04eilnvSqAPgcOS90tIdnnlww5e0l4b3Ur6xHO8Ga2g5obvSiLfbAV
         KM7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1785017159; x=1785621959; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zImywQZnzpvQhiwmwZ529O7OAp/WrjEjQ2gnTEWU+lA=;
        b=qzwpqnwu9BV3OhHOqDlLIsbmurMYPVqzAgOy/8gSMts1FKVlMRVz3xH8qRjezm5kCM
         8EL6CfaKxyBoX3wmLyfJVT9t9ov29OOtIYlCal79RNrbkRxslakqdpqkzMXDWb41uvHQ
         FONox5h1KSTnoLoFadk2M+aBCaoUKhVAclqV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785017159; x=1785621959;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zImywQZnzpvQhiwmwZ529O7OAp/WrjEjQ2gnTEWU+lA=;
        b=KthJMzxSxfF65wtZqVcywN80RTnWJ/1DTYHDs1ziRtyDPq+D4cwI7uBIT/jtn5zokd
         JYN10vFznZfiiTzMPB79CEvjPT0QZFpA2ZT0jxAlQzKC5cDvLDESExx6o8zAHwObTx7E
         ED+aLr3tgLxm7gug/YvaMus9L5zsJQs1KiTHqwPXi7kszEKf6IhwlI5t6t8mUahaxc2F
         m4ZtUe+pDJWYtqAeZ4gw3Zj839JPlOmB6g0DW1ZHAaHT5jcJVqgBGM3mlkPBeOtfnWD8
         BV768669SSr9dyprBx2LFmkQ9VMRiNqka1rNlOq2uBxycL8wToEHTpQXG7bG5nmJnAh6
         Kf4w==
X-Forwarded-Encrypted: i=1; AHgh+RocGLYUzCOFtmmA2SVVa+eAUzCHHnemjpcJTjHY2d0qOSwWoyC2Qy/K0eGgqgLKMWTp+pHlfcnyHD/l@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3qaxN5SyXFyqNAjtzAW+xzH6PlQJwSwio4BBnkIts0oMS3yRx
	TJX8ZVzRhFHNl6m5NaDyPMY3sSwmtlZpV5Tm/W0gWbGSE9obpj8cW0Y9cEa+zASEAj0mnG8jsn2
	3lwdxQ7FVCDHhyivp9SbpIAE3LMH1Xm13P6j9+e6arA==
X-Gm-Gg: AR+sD113eMEymz/mad/HGj8FXs+ACeQLPGfP2LTa/q1wOVJ/2xdqdOTGJdrKfaF3z49
	kR2px5tYGD1jFVG5jCSB6pm6hy7bs4l77fX2wjQjuW9t4vJmGYYLuwWGzRVDCo8czM7/6MB/pYa
	n00rluOieTxJWtSCsJwHyTxmqxFus1nBqaRQmU7OOTifeVh7OM3To+06auZJQlzkaLYqlm9R9S9
	jTm9rtFFC9MYORrVzwuHJM7Y8sMNEYlY7wLRSJrA1RAerzRDWqUx7Q83d+bt0oWXeaDji5JRuad
	zGN+KZVgTJqQBDDR0W/oI8tfg8UGgMV9Wq7IYD80SoWG7Lw4z1GYokO4KOb5Jsq177Fhm7fa6/X
	5oERil3A1S4QkKOkC009pKMMNNaDK3UdOu2zSRRIlMq7NWMsW0YNzZfy1atXQ95pk52Fk69JhOt
	sj1iKdcYb/zCFpIJETBioKslMMzZHlf+JrLdgrH5EXxFPSNN7SbBgE2+9jlAbo
X-Received: by 2002:a17:903:22c9:b0:2cc:864b:539 with SMTP id
 d9443c01a7336-2cfde687914mr33554325ad.6.1785017159017; Sat, 25 Jul 2026
 15:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <CAMVG2stKmNxe-mdqbqO4MDLDrJCiNXw9kt8SA8egYAmByf9fKw@mail.gmail.com> <0eca3486-57c9-469f-b846-8c10ec07ffba@kernel.org>
In-Reply-To: <0eca3486-57c9-469f-b846-8c10ec07ffba@kernel.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 26 Jul 2026 06:05:47 +0800
X-Gm-Features: AUfX_myiHAoB9UrW4Ep9Nn6HkjmTDkhFOjfKf8GaUMMaVbSg4cGPO6RekbYQPSY
Message-ID: <CAMVG2suGdLUcA1gCjNq4xi_wq8QJhx3LeLcNqDJpgBUZLZ-2uA@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] Add dt-bindings and PHY updates for CAMSS on
 x1e80100 silicon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 25 Jul 2026 at 22:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 25/07/2026 14:47, Daniel J Blueman wrote:
> > On Wed, 8 Jul 2026 at 08:06, Bryan O'Donoghue
> > <bryan.odonoghue@linaro.org> wrote:
> >> Changes in v12:
> >> - Updates camss sensor find method to find the sensor in the CSIPHY port. -
> >>   Neil, Vlad, Bryan
> >> - Drops dependency on passing polarities and positions. Moved into CSIPHY
> >>   port as agreed. Neil, Vlad, Bryan
> >> - Omitted mux to CSID as discussed this will be done when splitting CSID
> >>   out as its own individual node. Neil, Bryan
> >> - Updated Reviewed-by: - Loic
> >> - Link to v11: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
> > [...]
> >> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Works for me on 7.2.0-rc4 with 'qcam'.
> >
> > Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
> >
>
> You cannot test bindings and I doubt that you actually tested even the
> driver code without DTS.

This series was tested as a dependent of and together with
https://lore.kernel.org/lkml/20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org/
and other dependents on my X1E setup.

Thanks,
  Dan
-- 
Daniel J Blueman
