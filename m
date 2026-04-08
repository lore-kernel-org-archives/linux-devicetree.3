Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED82930B50C
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663198; cv=none; b=T91cYLJJuU4mEcuVjaCJGRZ09Zk9gbyqRqxxSZuVk2DTzY4dm3xeLIemw3q+Ihk0kXam2Ubz9Jdu/F1StCHE4VekulSendHa3rVyVfPgRBFIf6w3ogxsAK9ceOGR18AfDZMmVJzwavOp9/CtxM7+SarUt6kw1ht38G8p9djQhGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663198; c=relaxed/simple;
	bh=V1TTOcmexzvL0zMGH90+djDV/QILglULKt5i2NNrPeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdM5WgAI4PEyD0R6EHxJA/KRupSjXnizsBuG3b+gni8PBZhUi9uVS1LE2EEHoHk9OA9KJo2uBbmAIp2Rv0n0yaKWTNJn3yJ9FyfAuXcguPAs8mXj2/Y7mp4KzR6dt8zNHGGmL2DLmVPSqM4PM0fm/rLvomfGJfaYug9xLnndZM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BA9JNBzd; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BA9JNBzd"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso644235b3a.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775663196; x=1776267996; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R5zH5Yy++LFl5X1883WPkm0h00qGtgJqcjU1g/XLy30=;
        b=BA9JNBzd8Lb5daOid6hiG9Ov+QJr/xcwSHdoZnhDrGwyM/pXzemiBr/II69zar3dgK
         rrZ+lUHwML0QwZUbzcBJsF+m85dKq4Kpbk/DS15pSiieEuDA4N7F05DzMRRXzt/gJyf1
         PNxY+WxWcPbW1MO6Ih27q6ErPhRjAeRXkfZVul534Kf0j9mnENHwjhkKCpcBpt/kuRC6
         9onxKxpLgQ8KORiXelstlPUtEJwYLNu55eUhBdL7WV0NCvroWZtLPsJqBrFM9Lww4vxb
         ytcIrwDzBqjfCqdX4VAAXJLouQWyNq8qWeF0ojTVTbSMP2DQfYETg6YD0d1JLFCKH31V
         dmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775663196; x=1776267996;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5zH5Yy++LFl5X1883WPkm0h00qGtgJqcjU1g/XLy30=;
        b=gnuIQomjW4ex8M0hDsTbloDZ3VvkM6ddRV+sI1bolAPbNx6+wUabXZ2dJnLjai1YXr
         eFIfNCWcPG6UHhmL8Alto1/OdcERAuU76RbB0j6vzPj4KFBokXQw/JjfqFWcd+mLvqmI
         ho0xLMiX5GY4T6+UQskP5km599wgi+lab5HG9ntLcxVaFlT4Oe0a3BTlSjPuEhqEfaVG
         PMoIP5vos8gCg787eOwyz9T8l6lvmCtZCr9PqyDyVgmlJt08bNtvXygkos/Iy98PCsqm
         j7VzSN046VxJkMRlTmX5oqQK+ZPtz3rFK7lZVPiG801HPZKt5ZRQcyF7siLUQuEL7FVE
         16eg==
X-Forwarded-Encrypted: i=1; AJvYcCU+DObIwNuUXre2aH0ei1RZ1eN7wF2vsggIH3uoErJt1s8umts6TUyyeTczUlKbInyH72Czpvlipc7q@vger.kernel.org
X-Gm-Message-State: AOJu0YzSjUUYAlOda6D5GVT7D/cqLsThPs5AZj1yJfskQ/dWurgSV0Rb
	vrcXgV9tzqQyYmevhKvIP61OnLHIYz7u4WdcWaPdOAL892itX0WckOyOVCPajM1vfUw=
X-Gm-Gg: AeBDiet3L9buPyOvSVu5KX0L99qcyw+sbQy0dcxmE8zIX5da7ar47FU4exuBnedSRmE
	WSLww/G19ta8MREqsu+cR8rAyrylzAYcPSXBkCyT9KdMZ/U1YqwcsfuBO4rJW0LszpzqgC16qko
	gOwmpZ6K/vvOojhU2whtvVmgFDWfiHvhjhZPh7mCe2nljoUqLh91DyUqXiRcrjK6sKY6/fNBrvW
	TsgOe3WY8dRaHPhBRfCFuqvegf9x5zrB/nyVP8qnNzU4DE8xxzIQgStSMGlSVw3ue+cZDkhFzFl
	nCwvs5g3SbQhKyJhwWiqMldphpqxlqoAlqKW6gqrDfAktj9BYIHW+dTqoteC9orEQNn0SB+gtlI
	pp2ZOfmLDeyu09btk1Ix874a7YJPb3kpP2PluhtCpVwmJn5KTCxZfxb6tLFAiRPtsNiR060uvra
	nUz/7gAHhwQivXNeYQLhqpqFIJWw==
X-Received: by 2002:a05:6a00:188e:b0:82a:170d:fe1d with SMTP id d2e1a72fcca58-82d001e92efmr22313731b3a.1.1775663196006;
        Wed, 08 Apr 2026 08:46:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:bec3:28f:3ce4:6925])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm21534378b3a.29.2026.04.08.08.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 08:46:35 -0700 (PDT)
Date: Wed, 8 Apr 2026 09:46:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <adZ4WIaC6WN97JhR@p14s>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
 <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89>
 <adUghiyZbe3fmcNX@p14s>
 <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Wed, Apr 08, 2026 at 01:30:16AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to
> > SM CPU/LMM reset vector
> > 
> [...]
> > 
> > >
> > > Aligning the ELF entry point with the hardware reset base on
> > Cortex‑M
> > > systems is possible, but it comes with several risks.
> > 
> > I'm not asking to align the ELF entry point with the hardware reset base.
> > All I want is to have the correct start address embedded in the ELF file
> > to avoid having to use a mask.
> 
> I see, per my understanding:
> FreeRTOS typically exposes __isr_vector, which corresponds to the hardware
> reset / vector table base.
> Zephyr (Cortex‑M) exposes _vector_table, which serves the same purpose.
> I am not certain about other RTOSes, but the pattern seems consistent:
> the vector table base is already available as a named ELF symbol.
> 
> Given that, if the preferred approach is to parse the ELF and explicitly
> retrieve the hardware reset base, I can update the implementation accordingly.
> If you prefer to parse the elf file to get the hardware reset base,
> I could update to use them.
> 
> Options1: Something as below:
> 1. Include rproc_elf_find_symbol in remoteproc_elf_loader.c
> 2. Use below in imx_rproc.c
> ret = rproc_elf_find_symbol(rproc, fw, "__isr_vector", &vector_base);
> if (ret)
>     ret = rproc_elf_find_symbol(rproc, fw, "__vector_table", &vector_base);
> 
> if (!ret)
>     rproc->bootaddr = vector_base
> else
>    dev_info(dev, "no __isr_vector or __vector_table\n")

No

> 
> This makes the hardware reset base explicit, avoids masking e_entry.
> 
> Option 2: User‑provided reset symbol via sysfs 
> As an alternative, we could expose a sysfs attribute,
> e.g. reset_symbol, allowing users to specify the symbol name
> to be used as the reset base:
> 
> echo __isr_vector > /sys/class/remoteproc/remoteprocX/reset_symbol
> 

Definitely not.

The definition of e_entry in the specification is clear, i.e "the address of the
entry point from where the process starts executing".  If masking is required
because the tool that puts the image together gets the wrong address, then it
should be fixed.

> The remoteproc core would then resolve that symbol from
> the ELF and set rproc->bootaddr accordingly.
> This provides maximum flexibility but does introduce a new user‑visible ABI,
> so I see it more as an opt‑in or fallback mechanism.
> 
> Please let me know which approach you prefer, and I will update
> this series accordingly in v3..
> 
> Thanks,
> Peng.
> 
> 
> > 
> > > 1, Semantic mismatch (ELF vs. hardware behavior) 2, Debuggers may
> > > attempt to set breakpoints or start execution at the entry symbol
> > >
