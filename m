Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593863D7D97
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836352; cv=none; b=XraOwgPnh7Lr6SJQCMhFYdv44Bqa+iJClv78nEP7A6x+U+tBCRYEadAvZuH45GNknY5ajW4CcjhV8rR01MBekr9Cg25WyXBpVFOp67VcZTBNZzWuceJX7uE0Nwb3YpjsMt0kopOydxf0QvhGvkkaipJb0+0PY4YWXFBUrmhIELQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836352; c=relaxed/simple;
	bh=IVX1psQg7ZO53TJ7iWhI8o/DZnKxxZyF+3P5lFmYSOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIUhyarb34NdLvXKwZP667sqMuUq1O0mlbfWHKK/Bl6+Pg6//MmNt4pWQwgH+8aAfti9MlHSVDre3yZi0HjYf4h/AYn7LJVwSy7f8vSP2tGVuiSwn0hvfQhwDS9AH4CzI3Ohw595iKRLsEo/9hMuKdid8LFgwSBjwj1mnR+GDNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J8T7mZFi; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J8T7mZFi"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35c124d2613so1440348a91.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775836349; x=1776441149; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BpSOIXXZ3ZNpAOx8++v8mFOwpFQb2y00e+UwJxOC5kE=;
        b=J8T7mZFi5az4buZu0m0o30pyJqoRVVTcFsl7eR3wdZTt0RZxRhtRx2TzOBwQqqFoxd
         MsraO1NNWc5c1WMAlzrTE9Tx1jvzdMW7blapUqzdxFNzQF6wLEshZHf4WTdYaofEkwMg
         0IotKG2S2JW8pjXUy5Q9NghVG7JM1bzqqUI+EKaNtJEUjly6k3VHGLIqyhuAUJNzNPFL
         GRnHXiuZ9E0j36GRqEz32cPbnK/ykYNI9dkNHf3hXHSLUUYDOVMKQsuu6NGbrWimVdFW
         NuNlg2ujn5pGznvYJlfk4FDjbu+ioCVDHxHeE2Ak1nGonhGGe6Ce+c7xExiMGB4E+tcq
         WiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836349; x=1776441149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpSOIXXZ3ZNpAOx8++v8mFOwpFQb2y00e+UwJxOC5kE=;
        b=aVPUAD+NDdDe90u0+EUfY9NGDvdfKRGpftSgTxr4FI6kENKCnyxNU54lNfIUTALfDB
         NXFbS04g/4xKjgaa576DQA43GsiY62p8Il/I+cPqfxfIN9nq7YNXg0buxF3lAfIBT45N
         3z8XXZZAsCzW/g3381DMHBaOLk3GZvFfilDlp+DcW+ZMnoS/xm/IrqG4SC8jqjdNCMUT
         ou/eIym83XZ0JBaJ/3Y//rGZPpEDdVQDLtrQDxSmSK9Z7T+jRa9D5Bq0FD9XHEbn0aY5
         YSkUWpBA54ktknD6qwXUb2bUm5DieSJ4yIm9i7hEb3XpuwAUFz5r3uH1rfeFpXwg3fj9
         HvSw==
X-Forwarded-Encrypted: i=1; AJvYcCW6KpAWIfBrxbV+qJfImUzO7r6a/IusPmu2zpoo+BIv0AtM+KpIVrTvt1oYGyqZ7XOe4nrcADtFhPjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxJc9nLulKMgIKll5i8nz4buPzGsH/HkgyAVfiNEkfn7tYEHFpm
	jwGdhbMUvCqw086MUdpI96q5tg7ElZDHMEtBrRjwbCi4xMJWV+BLEqnO2dSXhGi3x5E=
X-Gm-Gg: AeBDiestEJVGnBg99R8yw+fvsBAOfj4X3KYHAdBe0YWwokOX9X6BIZsnWJTeoIzSmon
	Q6he4i3RiC/rxGj9zcmR98xqmZN8c4/kIS3RtgNJ4rjGolXnp/g5D0eelx6nuqYHJw2fxpUnHlu
	lAijqueH0YdocXm4CKUl+3r0WLzILraoYTvVgXFnQ5vmxZIVxpz03ZES13pJnt5MNdy70oEUA01
	ob5mtAV/rOoMiwC81moqst5RDCqU9UOy1UickgmSH6lSiswdcK8Dk86JfAvyZnFxL3PvId8alM2
	Km443y4ppWAQzbFbrniTvSR/meat/n3TCYVYclkJGWxbUvIOJKDm5kdBATXWElSonG0pcVkRKsL
	tJiUxR/74+swke60HSd8aV779KOfeRrtx3RpNHVGF578AWvsOsJSbtei6R2qro0PIPUM8+5Y/tx
	bjMMuUUn7IQTqXtOdUSC2rUDlc3t4=
X-Received: by 2002:a17:90b:2fd0:b0:359:d54:846f with SMTP id 98e67ed59e1d1-35e4275f708mr4213158a91.7.1775836349298;
        Fri, 10 Apr 2026 08:52:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:372f:d8dc:5d88:3c78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f25aa2sm33630105ad.55.2026.04.10.08.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:52:28 -0700 (PDT)
Date: Fri, 10 Apr 2026 09:52:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Message-ID: <adkcugNgyrkHtUML@p14s>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
 <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89>
 <adUghiyZbe3fmcNX@p14s>
 <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <adZ4WIaC6WN97JhR@p14s>
 <adbzPl7ydUvb+MIS@shlinux89>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adbzPl7ydUvb+MIS@shlinux89>

On Thu, Apr 09, 2026 at 08:30:54AM +0800, Peng Fan wrote:
> On Wed, Apr 08, 2026 at 09:46:32AM -0600, Mathieu Poirier wrote:
> >On Wed, Apr 08, 2026 at 01:30:16AM +0000, Peng Fan wrote:
> >> > Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to
> >> > SM CPU/LMM reset vector
> >> > 
> >> [...]
> >> > 
> >> > >
> >> > > Aligning the ELF entry point with the hardware reset base on
> >> > Cortex‑M
> >> > > systems is possible, but it comes with several risks.
> >> > 
> >> > I'm not asking to align the ELF entry point with the hardware reset base.
> >> > All I want is to have the correct start address embedded in the ELF file
> >> > to avoid having to use a mask.
> >> 
> >> I see, per my understanding:
> >> FreeRTOS typically exposes __isr_vector, which corresponds to the hardware
> >> reset / vector table base.
> >> Zephyr (Cortex‑M) exposes _vector_table, which serves the same purpose.
> >> I am not certain about other RTOSes, but the pattern seems consistent:
> >> the vector table base is already available as a named ELF symbol.
> >> 
> >> Given that, if the preferred approach is to parse the ELF and explicitly
> >> retrieve the hardware reset base, I can update the implementation accordingly.
> >> If you prefer to parse the elf file to get the hardware reset base,
> >> I could update to use them.
> >> 
> >> Options1: Something as below:
> >> 1. Include rproc_elf_find_symbol in remoteproc_elf_loader.c
> >> 2. Use below in imx_rproc.c
> >> ret = rproc_elf_find_symbol(rproc, fw, "__isr_vector", &vector_base);
> >> if (ret)
> >>     ret = rproc_elf_find_symbol(rproc, fw, "__vector_table", &vector_base);
> >> 
> >> if (!ret)
> >>     rproc->bootaddr = vector_base
> >> else
> >>    dev_info(dev, "no __isr_vector or __vector_table\n")
> >
> >No
> 
> If your concern is about rproc->bootaddr, I could introduce
> imx_rproc->vector_base for i.MX.  Please help detail a bit.
> 
> >
> >> 
> >> This makes the hardware reset base explicit, avoids masking e_entry.
> >> 
> >> Option 2: User‑provided reset symbol via sysfs 
> >> As an alternative, we could expose a sysfs attribute,
> >> e.g. reset_symbol, allowing users to specify the symbol name
> >> to be used as the reset base:
> >> 
> >> echo __isr_vector > /sys/class/remoteproc/remoteprocX/reset_symbol
> >> 
> >
> >Definitely not.
> >
> >The definition of e_entry in the specification is clear, i.e "the address of the
> >entry point from where the process starts executing".  If masking is required
> >because the tool that puts the image together gets the wrong address, then it
> >should be fixed.
> 
> The hardware reset base is the address from which the hardware fetches the
> initial stack pointer and program counter values and loads them into the SP
> and PC registers.  In contrast, bootaddr (i.e. e_entry) represents the address
> at which the CPU starts executing code (the PC value after reset). As you
> pointed out earlier, this distinction is clear.
> 
> In our case, we need to obtain the hardware reset base and pass that value to
> the system firmware. However, e_entry should not be set to the hardware reset
> base. Doing so would introduce the issues I described in [1]. This means we
> should not modify the Zephyr or FreeRTOS build outputs to make e_entry equal
> to the hardware reset base.


As I said earlier, I am _not_ suggesting to make e_entry equal to the hardware
reset base.

We are going in circles here.

> 
> Given these constraints, the feasible solutions I can see are either:
> - option 1 (explicitly retrieving the hardware reset base), or
> - continuing to use masking.
> 
> Please suggest.
> 
> [1] https://lore.kernel.org/all/acs2PAZq2k3zjmDW@shlinux89/
> 
> Thanks,
> Peng
> 
> >
> >> The remoteproc core would then resolve that symbol from
> >> the ELF and set rproc->bootaddr accordingly.
> >> This provides maximum flexibility but does introduce a new user‑visible ABI,
> >> so I see it more as an opt‑in or fallback mechanism.
> >> 
> >> Please let me know which approach you prefer, and I will update
> >> this series accordingly in v3..
> >> 
> >> Thanks,
> >> Peng.
> >> 
> >> 
> >> > 
> >> > > 1, Semantic mismatch (ELF vs. hardware behavior) 2, Debuggers may
> >> > > attempt to set breakpoints or start execution at the entry symbol
> >> > >
