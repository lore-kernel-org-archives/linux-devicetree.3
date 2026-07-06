Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175023947AE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344390; cv=none; b=Zt+8m8GhawUcbtTi3aRJH+SPMs2Gb03lkNBxSCN6eCzVcV7tcPr8uRNKxbjgCGRmHWBmHN/t2EXkGZwvG1ZTSS1+qevu0xoPblY4E2OH4QlT/Dsm5n55q4UOjHN0+vm7UxHMyfb4itwtbIwpOm6kximoNTGO/yZ2cezV9H4BgiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344390; c=relaxed/simple;
	bh=2X1TGST7uNQ4I4baBGRTZMrzsyrjAmmsqM/GevpKbSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koy6wCixct7WmJ23J49L91t36LNjH+05d6lU03itNziOhaFq6DBB97zqlB0Q0QqJDeIQ71fvVauQ+1ADB1o4fLzfix+y/ZqeCZcumvh42bjJouAH31WKuSjpT6FRbnEon7aAITpejZ4kWCcDakVYsGKRzKS97+qDzeENyc69b4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hs73lySi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hs73lySi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so23091655e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783344384; x=1783949184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VewHMeV2HgLnExdf3eHCgLjBbEBUzVfCGkn2dqN19pw=;
        b=hs73lySiIQQG8zGbGy8ac2CZfCccA7sAEDMOwRwP9xHtM6Uj7QnfGnFODkjpfSzz8+
         NvhDdt9FUZlACoI6zT6N6gfvDJ87SZG7UGRXjX6OgsUlQyIQFQ42HyEUjG4eN96tLb0+
         gzqsXo8hI+MLl3zLe44CvGQA4ywU6rC+oPonSg1qWsNBLaSTxB8xZdPyTNfWDmIi9uVZ
         /hCw+kU+dpU9xvkUAl4GqlBq4pEb+AFyn1X+4N9yFsV6ZV1FeMCjYJvGuejOThR7zGr1
         UidPdQiPTDzakebinsBGAvYRI/m7lETQv/177p+wrtEZ6vl9UL446Azaov0yHQ+Cl0Qa
         bj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344384; x=1783949184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VewHMeV2HgLnExdf3eHCgLjBbEBUzVfCGkn2dqN19pw=;
        b=jVgslzQCCI6SCC05LyHYuqFaNC2xQv6ZtH3g8H85PHu7f60L9DwHSUjD0Ym+xahtJL
         eaxzyi6LV2y9lpcVPwNEGSMRXprLRvwvqQaaQ85iGXhCjkJKxWiWeDms0s7/Bx0lYwyj
         9h0lXR/jSPOwcyzRZsMUKSyT+4014SN/3lju0GRF6qD7j0N7BRmacmDqez4u7HP5iETk
         40J8Poy6+KY8Fd2lrTFIH3Q11uNUZ7/D02seW9g4E86CSQPbbncDyvmyBemHoTTMn1TQ
         EqGJ70mf5lj+5t0i6ZlRO1hC1VhuFfPNGAvkTFV4LqWOanD43ZuevIuyx6E8YPGg4slP
         qw9g==
X-Forwarded-Encrypted: i=1; AHgh+Ro7nGMHC3sgoYqooWMvwZvH9MFIPuvxL6uupvKVP3Dj4FLO5rY9Y+P5m9HX+rp7XPycaU4QPCqSu4fs@vger.kernel.org
X-Gm-Message-State: AOJu0YylLvBJBORklCTo96AZIKFRuRuzwjgAhUGC1tD4owbOScDA7r/l
	rL5Mkiq9rTVQVU9k1WLtm7/La+o306b8RVDO1M8SxjGQ8P1SE7Oo/N0+xDpndwN3eCU=
X-Gm-Gg: AfdE7clL4CL3S4OJrIiGldoy4xwqq0TYjwt4WHTYcY5ip8axrMJ2GFgOeqY6aWjgEaP
	sqj9iiWGG4E4PMYFIzVL4Ra4KlszyDuI3A77PB5bFuWI8MdCpBGVrO/p72bMlPLdWKU0FU6YcO/
	uJg4+q8mdYSVtKuAPPI5GNrtsdvKh6cGy2N+11ktcVjIhQniek2QaXI03KBxAeXTK6OUNLll2AF
	igOP/pyQP8VQURVw2IXrdP7cdBUWmWb3BLywLlADmu6mJcJsa3JSGcKnVsWjoFxcVFDsWmFMb5h
	vc9tFMSTY1++pYOfYdtF3wXxT9dBXVPEFF90WJsnZZor3wSd2vEKqD3mIx+X2LZ5WdKYefMlR+R
	LxDNmhfTlHdAgctpXnLBzKRzmXcAgXbp+rjxMU8nrUS9aApgA6RXDSYYAKXZ1LkjbRVidXgher0
	wbbSziMTxD8G4Ghwft+3fAh7aLP9MiPnGh2Hc=
X-Received: by 2002:a05:600c:6a0d:b0:493:bc4a:fb51 with SMTP id 5b1f17b1804b1-493df077ef6mr3952495e9.39.1783344384207;
        Mon, 06 Jul 2026 06:26:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4a343csm326732325e9.0.2026.07.06.06.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:26:23 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:26:18 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Message-ID: <akus-hN7-yf4Y6XU@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
 <akult0UUSSwKQ8F5@linaro.org>
 <875x2smf39.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875x2smf39.fsf@bootlin.com>

On Mon, Jul 06, 2026 at 03:18:18PM +0200, Miquel Raynal wrote:
> On 06/07/2026 at 14:55:26 +02, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> > On Mon, Jun 29, 2026 at 05:46:57PM +0200, Manivannan Sadhasivam wrote:
> >> On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
> >> > MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
> >> > is missing the rest of the hardware changes in QPIC v2. There is also only
> >> > a single clock that can be controlled using the RPM firmware. Document and
> >> > add the new qcom,mdm9607-nand compatible for this setup.
> >> > 
> >> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> >> 
> >> You could ammend patch 1's commit message with the information I shared in the
> >> reply. But nevertheless:
> >> 
> >> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> >> 
> >
> > Do you want me to resend the series with patch 1 commit message
> > adjusted? There were no other changes requested as far as I can tell.
> 
> I was mostly waiting for answers on my questions from the DT binding
> maintainers, but I understand they must be too loaded at the moment.
> 
> > I think the current commit message there is fine, especially if you add
> > the Link: tag during applying. The extra context will be there.
> >
> > If you want me to resend, I would just replace the second paragraph in
> > patch 1 with the following:
> >
> > ---
> > On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
> > (ahb, core, aon). However, the access to these clocks is restricted to
> > the RPM firmware that controls the shared power resources for the whole
> > SoC. The clocks cannot be controlled separately, there is only a single
> > RPM_SMD_QPIC_CLK clock that implicitly enables all of the 3 clocks.
> > The only exception to this are some IPQ* SoC that are not using RPM,
> > there the clocks are directly controlled by the kernel via the clock
> > controller (GCC). Require only one clock in the dt-bindings for MDM9607
> > to avoid having to define dummy clock entries.
> 
> I am sorry but this is still incorrect. You don't have to define 2 dummy
> clocks. You would have to define 3 times the same clock (and that's not
> a problem). I have been working on the concept of clock nexus which
> may solve this kind of issue in a rather elegant way but that's not
> ready yet.
> 
> In my opinion the binding that you want to push (a single clock) is
> wrong, but since I've been explaining this for several weeks already,
> please at least fix the commit message and I will take it as you want.
> 

Thanks for your feedback!

Either way works for me personally, but now we have a conflict between
your requested changes and the feedback from Mani, who maintains this
driver. :-)

@Mani: Would you also be fine with defining all 3 clocks in the DT
("ahb", "core", "aon") and then assigning the RPM_SMD_QPIC_CLK to all of
them?

Thanks,
Stephan
