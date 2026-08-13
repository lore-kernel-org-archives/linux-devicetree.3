Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AF0404BFF
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631030; cv=none; b=legXSXkmabkSjf9fK6T4TI+FX7Qls/CW6fURbbjKMQtQKGdDyuWW5usJyejVWw+fWCLOiLtssE/R1ze2G3PentwvCKC+lYKKtzR6hpAFPrSh5uoZqr4VBTRw2ENPt94LjGCgkU5zEsB8KBD5gAlt13rinbfuZVBp1AbE1Jx0/aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631030; c=relaxed/simple;
	bh=xzA6z/ScLQYJHgyemPeQLuBov2qwLz98o4xTEP7Bomw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKvu7B4BaHT/FBQzxcQnzP2XePCxislJlZYNYrhVTsgM44wTGvR5AIAQoYx5zDlSymaaVLb64jWTWb01ZjYRMoxfrYabEDaQGKemwgAGRtl2sKf8PySILgOxM0QLQjL4CeOzplRRhb9s1qzNB5bggg+OdvmGaFv+zN6TOhC3f20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Ny6tl/Ko; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Ny6tl/Ko"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so6225605e9.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786631026; x=1787235826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zAK75b8ZUtjKJXv+z/knfiDKVadFa2L6rKVWPT2qQc=;
        b=Ny6tl/KodaHSIrpr3YhGQ9SMgRJ14naUzlZee0rVY32T0OhFFNYRC9dfocN1Bwkkvf
         0LV79OYDsCIlbak351iadjewtHq3qDK7l2v1an12NHiNE/eF5j2Q0M9k5RGz7PpOz2d6
         w4uW5XhAOVwYf9Si+HjeaQiw5Pcphtgg0QV2vmB5ptugcn3D8tRMmdsXcBlN3KFupnk5
         HFHphB2TD7nOjHEh54loe0mYKqXmKrmBLwc8Co2K+gnEMAvbSI79na9/D4Kgiof4QU8g
         EC1VDn4gUQspz1ZjzWJp1Aqa58rnLaDH70/rqFuDID9+imESMdYXrRx8te9itn5wG99d
         Vy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786631026; x=1787235826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3zAK75b8ZUtjKJXv+z/knfiDKVadFa2L6rKVWPT2qQc=;
        b=rbr134uYGnoIrZWcNWeSyai178LLIRgxnLNYsGpHcaLWtIfPQZnKNGOfz71Gn0oONS
         UING0DXMME9hOuDonrDC/zGLv2WYYVkqS2uJLcAFSrWkIoUKkJi4VNuHmdDkpP96OvEe
         bbcIve/ChqjHwQRy/pwF8r2K/uJELFERWBuDRpcXEsxVim2Sum14nWCQ2ZbwBHyGpxTV
         JIIV6kr/mI3AXgywZxDpU4ejf9VE/J6lRz0CtpdODU8jWLp5wuHmV5rVcZgPmrsm0PWC
         XCQJd6cQwKWlngFrxGK/GIGRUvApdAk8bEmNPY607QWtUfSfh4oACu4iP4GE/Q4HSAHK
         eeCw==
X-Forwarded-Encrypted: i=1; AHgh+RovGFmva3Y5jw+fbOJFxvZqiTYTOeIxSKWkbIKnNCsocwTV3dTqUFyjNsDVAJHGZSxGTiGiDJYezolU@vger.kernel.org
X-Gm-Message-State: AOJu0YwUZ8UmGFlN3Gkaxy6RjAyIWmPpsOHe6sC+dCK0GQk7wc0D5ohp
	HRIrw5FOZZELElGPO474MIkwvTidU2JU6t7GPPo98mcEqTVU8OtkRaBPagdIE5vBjWE=
X-Gm-Gg: AR+sD11mtIksAj1N72eIlzyX94PI/EgpRA+DJ370sBG/5Y6Oxp35kxKyTnjjn/iXPDD
	7/kk0WbOcOGce/WOJEY2C0P0H8e+S2HY188nURQ1B6G/cyu7CvzOQ91rvDyumZkPAR390P8ALCL
	STrXQ+tNnJm9oPcn3p2GWkCjETaPmMeEAv/fIsBn9pCnSx7QeTHVXKCxa3r0AUGAme4x0cQubuk
	1HQmHKLpVusTCmE9cjfWFXFDoqwfs0Oq/rpqBOg5tREDl7xPK3cpWg3G405NmBeb1t5fuC6xJmK
	aByd3gkKzrmZkIn2KtZvChug3/OR0Yqa3lvy8vgoy2jandgWRPD9KW+crKzz94k+pf0In7dNgN9
	ce8VQxX1KC/sN3Wo0E73GnnHtiWrQlpiH/bEtDY3gx+U7L6X0dPh0ZlPDKqMlvFyOnIun6lPV6+
	RaFqBc00oETxNVKxd+NN/RIDBQWX+Iam8dC8JU0Lnn5NygRJKGd+rRbiNTD27H2dCCgbCpyn9jT
	BAE62HY9uVY2QhcSKud5S99x8zYui+I87NxC7c6kRvKccn+O7qQ
X-Received: by 2002:a05:600d:6409:10b0:499:84fc:4548 with SMTP id 5b1f17b1804b1-49984fc45c0mr29737445e9.5.1786631026583;
        Thu, 13 Aug 2026 07:23:46 -0700 (PDT)
Received: from ?IPV6:2a01:599:447:e518:cc7c:e59e:1489:db94? ([2a01:599:447:e518:cc7c:e59e:1489:db94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981e2e266sm51262395e9.2.2026.08.13.07.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 07:23:46 -0700 (PDT)
Message-ID: <15d1ced4-2400-477b-800d-fdcca80559bc@9elements.com>
Date: Thu, 13 Aug 2026 16:23:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] soc: mfd: add ASPEED AST2600 PCIe BMC device
 driver
To: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lee@kernel.org, =?UTF-8?Q?Gr=C3=A9goire_Layet?=
 <git@gregoirelayet.com>, andrew@lunn.ch, jacky_chou@aspeedtech.com,
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com,
 linux-serial@vger.kernel.org, mfd@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
 <178609182923.193353.7287772568467157519.b4-review@b4>
 <CAFi2wKZdJ3LxJVDqC2K79T0JhoOOWSj=ZmL9pB+Lka_aXDXatQ@mail.gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <CAFi2wKZdJ3LxJVDqC2K79T0JhoOOWSj=ZmL9pB+Lka_aXDXatQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/10/26 12:36 PM, Grégoire Layet wrote:
>> But you're adding the UART devices here which now means that the core driver is
>> doing more than MSI interrupt init.
> 
> I might have misunderstood but this is creating the UART device by
> using the 'serial8250' driver.

You're right :face_palm: I haven't had enough coffee when I reviewed it.

Sorry for the confusion!

Tan


