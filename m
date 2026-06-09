Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AB3EA97B
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992644; cv=none; b=RrpS+GAIvEGcKEyWsiMU4R0byU/p3NqBInxhAqY4vwJRl+D7fqSlf0rriWzpdZfqZcjbJzmB45gnMxgEtb9cj2msJ7Si9BNZeICsoHDAwRC8w6G8QJtYr5oU6rsUiLziCmfoRiiNhkQ+2jUifWOdq+v4WncO2yaK+KYyvxiK6zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992644; c=relaxed/simple;
	bh=jE2tru+MqeTMv+2G+OzJCkJ+OKi1leUHrmQ7jjjlrU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wbqgc9YixKRgK2mRLurjhIesSUJh9bVPwdTZaBYYBYnoqBanWX7K4TJNkueqHzfYxm+KUKEg5Wsvp+Cx1lN3Uhs+Qiu9/RaZtItl7ZR/czhD99zJepMYXWKzAoC2EqGk42ZQ257iaB9FwoklcTuBq+RtB++yfKMVMG8nI4vzyZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ufPzdOE5; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ufPzdOE5"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so6643363a12.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780992641; x=1781597441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JAiuzFCgz48v7S4K+eriQebtflc2Mv697Ui08D+kSJk=;
        b=ufPzdOE5UKo7Ak+e8cAoNOd/9EgPTT3rKDFnIbJZamsEsIQLJdGLS5stEAyjIYno7O
         px1ryNQ77+JKqKZEBwEEZRDqJK9Lg6zQVhPCq44uE/y5xN2ZpRIjrJjvVWc/TKbcNsaJ
         Ym02J8bJgnatknANdBhCb14iGgZ491oUX48BgtWNQNiUHIUGyfZhliwvDex59Q0cZbz3
         lXWRRcCdMigNtMkzG53CxDdkfhyJXuMr8S6vKclSJbMTj+nRq49OnRiJdTa/lCM5EdAQ
         V7jEqeDE85/59gcgYPT1umFD14RvTR5l0S1LH/de0dIBh1EcDmRlfLXJE9apJVch9xuN
         Doyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992641; x=1781597441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAiuzFCgz48v7S4K+eriQebtflc2Mv697Ui08D+kSJk=;
        b=fobNKDvF2x4AdU0zBOHUIlKcW1W9RAFKZ8ULxWSGx8W3D2VSpIiIA4aVdLKUTv77w3
         rWBl4G+rwNOw8OqO8tZw136JU3JQ4LV/ivScyWAkT05LjihvQKwDQ3vqAn58420zQpaz
         /i+87fRd7hat0siPTku/xkgLzW0mspjmCbK3NEUzz7oj/rJv7H/ASd/u5GA36KEfJEiO
         lgaoNdI79koSUNV37q++p9q2YV9pjjz15svjjP6K0V5r/rZZnRkMA+MWsy13poY9SIwP
         BcM3BjfVO0NGD+W0jYHTseEI7EEQ+nW4SiNIohcSmwd4aLgBI9p40tN8RNKN43NO/E3H
         x+PQ==
X-Forwarded-Encrypted: i=1; AFNElJ8egYub20bdyAbEgG6ZkH2nJa+beifSkjqIoqBdcLFLlHrjX1gBABDbFcXmimmfawfM87Eens6JphvV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4zCOR9JuKc1GEWkLkbf0Qe/9XOiZWKvsoNBVKbPy1iLPo5nVe
	SAzvS/ZljCqf3NIlzqzH3aapO1TOhC3HqfPMh/Mz4Ba8N0d48HfTvuw4eZAp6gSeMxk=
X-Gm-Gg: Acq92OH3HQHBs9I5Ls21aDOnVDJBgli1m6eCxG77FjPQo3V6lnmumKITdZz44LQb/vK
	EkllpYwkpkR0XltQW53rEoif3LtUJOjiwzaU4p8Jj/AuGnrt73OBh8X716mpEvYxVyyIYzbDQ4V
	8ekJC6BMNn6yFc50uo6hO7/TawJ2suQtT2zFUlZoskDDTwJtZJj1eHlIdACa30TOW3vZMz521CH
	JUvdwmjQm3Pa721TkCV6JbeRmbhGrIQUZt0k5wX6WURfzhelI+M8DL9MHXhNOj5VeYrlzgXRK/g
	1Cy86FtSoI+DF0eylCg7rl4iRBAZInWsf5gz8Ju4xUAHrQIsyJYci4WsbpEcHxkN26eGQnMp14E
	9kjLxHrV7RTDvnRpWTvR6AkaTvhvK65ePYhizrD+TEowuLtYUQGp0g3ltyQkQsPSmbOEFM8/ACA
	2UgMouKEpRiFe4B73paPHlzyDBY+K57I+BMqyORVkeHClkIQ==
X-Received: by 2002:a05:6402:4595:b0:67f:99d8:868 with SMTP id 4fb4d7f45d1cf-68fa5147360mr8164600a12.16.1780992641088;
        Tue, 09 Jun 2026 01:10:41 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:919a:5e38:ea48:32e9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm8083640a12.15.2026.06.09.01.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:10:40 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:10:34 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Message-ID: <aifKejyF7n6QsI9h@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll>
 <87mrx4b164.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mrx4b164.fsf@bootlin.com>

On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
> >> On MDM9607, there is only a single controllable clock for the NAND
> >> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> >> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> >> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> >> clock ("aon") that is required by the dt-bindings. This is not really
> >> useful, so avoid doing that for new platforms by excluding the second "aon"
> >> clock entry in the dt-bindings.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> What is the problem in giving twice the same clock? If this is what is
> done in the hardware routing, I do not see the reason for more
> complexity in the binding?
> 

I had that in my first draft for this series, but this would be wrong
IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
this platform at all. I'm not sure about MDM9607 in particular (maybe
someone from Qualcomm can confirm), but a similar platform I was looking
into at some point actually had *3* separate clocks for QPIC in the
hardware and none of them were called "aon" ...

I think it's better to omit it and describe what we know for sure
instead of describing some dummy hardware resources that do not actually
exist.

Thanks,
Stephan
