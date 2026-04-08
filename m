Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C6F3D0929
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657129; cv=none; b=XCtP2u5MCAyiCuGlQcjIyumfFt/k3cR1sz0MSlmwfY6tcJZdF9DbjC/QhDKOyIBTXoCL1V7tdUgY1i1wbDJB8BHRXSN8R415b2l9LRUJQr90NpXX9XEeo/rFKuklWdBc8NtceJ29/E4T60VezCZGb5r6OmawRC1pvRLD8nL3b+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657129; c=relaxed/simple;
	bh=q/HxfJDEIZsacxEvj6AcEnUXO0EJ6z7DmUUMEIj9M7s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jqVRGk40r0jOtv4cjOviRQzIsh0EAyXi1xgD72HHEJ9hHe+ixMD13Z/yJPTlwXWAXOzuY7zki34Nlr/7pGYZLDKJJE/uDy2NWnBQp71Hf9iCDqNRPP9qMabi/3w4JVeKtQLUDb3BilBXEOS7PvhTcgUZ9CmI431MmMC+iDOIE9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFywtgs2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFywtgs2"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso49217705e9.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775657126; x=1776261926; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/HxfJDEIZsacxEvj6AcEnUXO0EJ6z7DmUUMEIj9M7s=;
        b=fFywtgs28FzjFE+RY0Q7SkaL7CnP6buZjte7Vw4lYPQg3lJRuTr7vV9SGlkU+PW66w
         d68PY5ynKBkRA+7Usm7OHFvkkKXQVfUJvFwiGCQDWA4RUTIcNKg47AjWuV/CyWECxlO3
         BinEnXUqo0b4yT+b5Oyu0ARnZ7uCiZnbP7r9YLTkJMy4kZcfjM3cVq+IIGYGOxFaOKGv
         71DQzVXP9SwI3zGu7mD2TZKoyxV8+aen81uDzVX3CTcPO+AxfY+NMdcyMGEBDCBdoo+b
         BVkOoFhYepTTgok/g7tAQiNvbMHj77ImLsjhPIX1MYnKgRcF7pLkCxgcqCcS0f7l6hKh
         oVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775657126; x=1776261926;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/HxfJDEIZsacxEvj6AcEnUXO0EJ6z7DmUUMEIj9M7s=;
        b=ldqfh1Vv3uelCW030sIMegVrNewq2cLLoIfcmoqMpmS9PEkW+f7T+tYQUNaqjPeYbV
         dCqOAwl5zMiKPUiZiLA+GwAiR+U+FL4gwWzbPEQuT+RfroTr/O5IAwbr5S4YlWhhzDoz
         RAjlLvhwLm9TZBMpECLI88yhhlLDHjBBWb332VSSpa+rqgXzRiHb4QJsASWhJXnuxhrZ
         hujNCXLev4XKUrwt/bX/JRT6yViaoyRRWeA42bzlm7erla4sdkJGOcxv78IECEELonzs
         wbNEZFFyMwE/VlnV2lvGDNF40PNZk2fCLMaH4wFUCpryI91eK8aZ30eAvyT9Nd2eqOz4
         1Ldw==
X-Forwarded-Encrypted: i=1; AJvYcCWuZSI78KqLlfTiEtrJjSu9MtTTZt3ZNSBRyPLtUmOgEviD/Dovehy1gBJ/eGb529pja58oJRgr9s6r@vger.kernel.org
X-Gm-Message-State: AOJu0YywXEs6LclJMTdFaFpVRaPzOB+IrY+Ng39liDFuleMcZ5LRHnqs
	qG47JGGXcck7P3YWLjGmXtWxsw/KXqpo2eOwbpItIvxROl5dMdC0Tqql1Pdu0I1Autg=
X-Gm-Gg: AeBDietCSsV6bxhfmNAj9jk/DvwsUoQ+PCA3gBuJFfmu3XGk8eCMnrTwkTDUk6NMYBj
	y6QlmHwPIMhG1WvoPvoDKNbphAKyvbjQofH4LFdbVqJpmWZEhwyLnwYORANOFOwaf0JdbEDSkCW
	mVsr8tTqbIdS/UO3Pz5HKeFoVPDS4+gRelw8mienX60E+xE9uLK0nMBYVqZI5snarnwdj4z/shT
	lOhAv244A4AAzdaOhav2AqvdVJ1bGRuAIxintfaHvSqJg+/lPelcoMvhS6+zbHSq2q8fxp0wPbD
	sFUFIv+y2bHu6mSjmHwWXAGW9kLenTKiuVmrr4+mWYVSCsqGCzYVsRaqRYZ5tzhDz7T7ZUVAAeY
	MdJkCur/Rn2mjI1qNw7JHZ7iY23RvcPrelH193CeuwyDa91yFv2Q2ex6OtAh0Yxr1nVC/iNv2aL
	/npVR7ystAIJ6slkMDf5P4BKqFiosPjF/46mr9/p+1LeRNDJLr1PSESH1loBGvY9/BaMoFQXghP
	C1jddiK6rsioTDLPg==
X-Received: by 2002:a05:600c:638e:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-488997b23c6mr299995865e9.24.1775657126171;
        Wed, 08 Apr 2026 07:05:26 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9775:58c0:569c:bd74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f08sm61358898f8f.6.2026.04.08.07.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 07:05:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 15:05:24 +0100
Message-Id: <DHNTX1T5S2UO.28SO88SS2HDOZ@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Exynos850 APM-to-AP mailbox support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo
 Choi" <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Sam Protsenko" <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jassi Brar"
 <jassisinghbrar@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <d9c714fa-988c-4b0d-b756-c6e7a40da587@linaro.org>
In-Reply-To: <d9c714fa-988c-4b0d-b756-c6e7a40da587@linaro.org>

On Thu Apr 2, 2026 at 9:45 AM BST, Tudor Ambarus wrote:
> Hi!
>
> On 4/2/26 5:20 AM, Alexey Klimov wrote:
>> This patch series introduces support for the APM-to-AP mailbox on the
>
> If AP initiates the communication and APM responds, shouldn't this be cal=
led
> AP-to-APM mailbox?

Yes, there is some inconsistency in the naming, in the downstream too.
If this has to be aligned with datasheet like in the comments to another
patch in this series, then name should be APM-to-AP or APM2AP for that
matter.

But let's keep it logical. I will rename it to ap2apm and will re-check.

Thanks,
Alexey


