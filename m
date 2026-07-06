Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D82420879
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342542; cv=none; b=NSXXzYxySwO59EGmKAlq38uikyT72T5DsZYwLdQJ12JFn9CmRCorMR4cHhg8L/oq7Z1JE+XnCrnayDIGadVwWZFeBeL8q+T0me+fncr1O61KbQ972DN4bfXf7zyMgGws/4wYW9oS8y3UyjzIRd0zLpHuM8pa0/VDEmvbYtqpd/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342542; c=relaxed/simple;
	bh=bT+72sp86CIVIp/ogp9isiWyW9mszXa47KCTY8allM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOw1FaAy7iJCflLJfMT+PEf3ThO6DyaZYxCPGKj0xcfO0wTWLbsWvKDgxC/dfvM9GHPBHRq9EnkXjR+XXlsz1Euh2TIn3n7UBOriD6nmyoElKZXWiNTcO+65ishOjF6fEZPASfu52hrPciHFw/N0tYi95upH1PTPi6KdulOiXQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MMUj76yf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MMUj76yf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1256251f8f.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783342538; x=1783947338; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qF6R64HmcT1c2a3xEhtCiEIwl/af807a27WtqelA0FM=;
        b=MMUj76yfCLTiRtx5Ir6Rh2186YluuIkSQgyEMLvFSYXkczgMoFLGCMMnmaY0uY0SeD
         8RY+ECBhdxzTS9AXNG+yU/uhfVmU/wl/Jja6sjNT/0FE4xnHcV7pHTCrE2F9y4Yy5Avu
         gFGQ/tjhuug7Bmqjp5N2FDc1jUmzD1a3OEfS7q61WxqMpHx6rQTpZs7UT9jxdAB1UF3w
         LNOtrTDXtbxh6ArBhE6o1IbivSudMvfia8AIT9/59E9jPPegqdzHBpIvgVgeDrgFn4eU
         lZYqNYcolOdOTXdfqWS+C0EVmeV/ZPnfrGBrCHGw81MEjwgHA1FCBFXzkCb4+uWdvw8J
         nZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342538; x=1783947338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qF6R64HmcT1c2a3xEhtCiEIwl/af807a27WtqelA0FM=;
        b=UXHIFRdz0EkmMq/wHPu7Bfch2PiOmYOnRQ/qtoL5yXC1XN6st26CmUG/watcIo6sh8
         DCDvqTvHz/uXW5PlwlD4IVSBg47In/hMNnVJJfHLef67fIXwHkk0/5xMNqJrOylXOt+X
         c8hEcqrukwX3u2HwFmC/FXnqS3WnVSJm8uBY/EPsfL1VcPVFg5fQgLWqd0fay0IS9JFj
         +ZN2urPqpCiYcyMlXzH7Uvcq5OiFN5A6S2uyIyQcnx4yo6NoWGETBaLorQBaTB1lmgZc
         AiMBPithNm8/YMULlSA1hyl9IpJxBoZKRnWlduHv4Yq81h/bO3Uqw5fSk3O1nmTvt968
         1qUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5cG8oT/+bQ2FU6xAlZQvxflRL6AqwM8LAHGFLQe1PZe8Xnp2rUKnKJmzhenZWtulO4hB0hxfMdaJs@vger.kernel.org
X-Gm-Message-State: AOJu0YyosMyzy21GmGD+c3bujt0ILlHwjI06dTk0JI98MeR+MaWmF19i
	a2Gy9eq0UJYIpI+n3U7WV+Xhsk4t2vNDjkLWEMlrGZ1awofnyf7lzO+2nKP4xnrw0UI=
X-Gm-Gg: AfdE7cka9fftq1wLRr7d6A6ZQINe2QmTpqkJP5nn05wMhj9Gb7el7hslXHqcncRpyDK
	NvN27AE6eVQY4gLEZ1sakf1iIoKn9VFnDxMjbtS22ivHR32Ie/dnvsgOBP22KeRDAxfWLL3qdVl
	TZB1kB299bIIeYcvnljU1r8zQRiLIdYSZ/FZuIPglveLJ2Nvbm1HprR82py7JP1Bafx272hG7ke
	LLg9W9ATTU33polbO0Q2wIASiQVfoZ6JMdbL0V4dhksSU1bRB3vSZAD1yAHzzrjpR9T9G4qpt7M
	caog4oxiAMYaYsPdSOQ3i1rVIz9v2DtYvM6KwBYdnQsZ3Dizvp1xIUu2fGodD0NFF+aiWVDWEoc
	bVwkx1unJJt+5J6yMD4tH3IBGe064cHW4GDhJaEB4Xt8i/WDCyyQpSyhtDr7VyP0YQ68j8xhCTu
	oBiGIplKyfmYResryPLFfBE9cE
X-Received: by 2002:a5d:564b:0:b0:470:2fb1:3dca with SMTP id ffacd0b85a97d-47aac5e17damr8744560f8f.30.1783342538035;
        Mon, 06 Jul 2026 05:55:38 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm24762493f8f.15.2026.07.06.05.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:55:37 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:55:26 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Message-ID: <akult0UUSSwKQ8F5@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>

Hi Miquèl,

On Mon, Jun 29, 2026 at 05:46:57PM +0200, Manivannan Sadhasivam wrote:
> On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
> > MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
> > is missing the rest of the hardware changes in QPIC v2. There is also only
> > a single clock that can be controlled using the RPM firmware. Document and
> > add the new qcom,mdm9607-nand compatible for this setup.
> > 
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> 
> You could ammend patch 1's commit message with the information I shared in the
> reply. But nevertheless:
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 

Do you want me to resend the series with patch 1 commit message
adjusted? There were no other changes requested as far as I can tell.

I think the current commit message there is fine, especially if you add
the Link: tag during applying. The extra context will be there.

If you want me to resend, I would just replace the second paragraph in
patch 1 with the following:

---
On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
(ahb, core, aon). However, the access to these clocks is restricted to
the RPM firmware that controls the shared power resources for the whole
SoC. The clocks cannot be controlled separately, there is only a single
RPM_SMD_QPIC_CLK clock that implicitly enables all of the 3 clocks.
The only exception to this are some IPQ* SoC that are not using RPM,
there the clocks are directly controlled by the kernel via the clock
controller (GCC). Require only one clock in the dt-bindings for MDM9607
to avoid having to define dummy clock entries.
---

Thanks,
Stephan
