Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38263AA516
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276383; cv=none; b=LGs0f9MeNrmpC+Yb6ltQVAF1zxQEO5ySWjanlpvKc8VxK9Q9L5HRUzINDESbIAI61A1ysg8SIvfNl92uD9Ksi0vRZfycKsldoJ7BMcsakggRK6ulzl7AMaWZ6VltjdqBF6SwUZ3YqNs+/icgp9+/3p+wI0CzTFqPTHDD/St1Cys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276383; c=relaxed/simple;
	bh=L314OVt7jzJjhCVDOKBkuT++0Uzl9fPon89IPJAPcK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyyTPhhSkpfPQ79GogOthz8Xdg0Oem613nwDiowoNDRAUuTQssDlgJMK9kmlDY+OT09s9bpMnNxaaNghOxaN0JcwX4UK5VUwmwo1dJsS2xTWQK1DdxOQ2py8PgeZCWDNGFt36oHbFPJh3x0GCBCd4xumGcusVVAiyW2OS16UMYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dskaInVl; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dskaInVl"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35a211df8e3so161282a91.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774276381; x=1774881181; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZBfJFwgoEUz2EcnixeOofm+Rp3x7VxxVqxoB2WloHc=;
        b=dskaInVl8Ew0God64P3gYw3D0y90EDa1/kQOZO2oIE3FtstqI/GjCUNo7xq6oeL2C4
         yj4s5LTQEY5yyoWVp/DoDXu6pP9T3qU2I+tnFnjJeQEUfB9FpKTYGy1RDxRtmNMjrCNe
         9lFzIjLP0T9gli7mrSFjnYzn+Vt5hX2dJdyAWY+OnLoTnpxOcLzLjhlOfnNnfIQzrYx7
         /Tj5UZVVFsZ/Hhtknjtagi88BgaM9rRxExsLhZJ9DQDZgGptx5yLisTCy6Tf01Ghzvof
         akeegyBQ9btDPz7DRsa0zyGVJ46D1MA3UlApOx4nPJ8FuQoVdNZz5Z0Iep2GWi1+Y+0l
         Gb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276381; x=1774881181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZBfJFwgoEUz2EcnixeOofm+Rp3x7VxxVqxoB2WloHc=;
        b=Di0K+9C4eufN1wyR8defShJR7eP/NN0FODEeVhIPU0ZsvsVzXVMSbHISi/C+5clWyn
         KpPBNaecM11+olawZ4bsq2MWrxGhC55iGp6Sv2Sg7QRoclvkcI6pe1knuU7B6sYAODi+
         IkUfs5ZDHjetWRfSOoMb/TDfY/0boqwWgaeJ9YhNS2liMteXm8US834qP5m6vIFw5Rkh
         PFi7O5glUgvTcBvPZPDgrVRmEW26bDuoa5vARj0hDJSNxjxGw19Qyq5312eK2L1kTjhR
         8+HA5nrbDsggkocgJxVo1ey77p4gd8xMhszAjGLIRZaAeaZbfUTptjxNdm+nWUIK7oZ8
         13yw==
X-Forwarded-Encrypted: i=1; AJvYcCUbrRMv5UuV5Gzi/ZhvQxJrfE6iRJvyoIoE1USS7LBXu+Fjl3njKnIsgHfq4TIuJFNm8bJMAuI7+74C@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6n56ozB9aKeuG66oOzzlheQ7+SchGFTsmv6fC5Wq/O8AjvDht
	N59VqF8Ry6mnYNTbrVhM/V7P75d2/2fMFAZ31/o2TuxpBOmqrMnXwzeK6qeV+eTfKU0=
X-Gm-Gg: ATEYQzwsBFN9kJilEJQBGdy8x6oADBm3erwyV2rpqTPlgEcWNn+WUchW6iU0VY5G9iO
	UqlMEuM7Cu1MPdRjpQAVedQ+GCjqUnivGHRxPbrFgJpivg8YZEgRj77hNaC5l7gajnT6gC4qXIy
	tG0skbbVFXvU6D9yU/Ji0M7TurJ6Bt26Cuo5EHlCP4VfabTxWyHTExQBYjF3iku3RVRbnln3vmh
	SBzRGACOQ2TWQM84htYwbBoWyCKLPpcKms4SQoPXykNisp2j3Md0yK0koCkvV2Zgm+7UIqbu3JY
	RTX5b1dOtqUMHWFPhquGjPCm+zSrH4NbfYFXvGCo28kvQe3/QThDpzH/Q91bH4ykRaTJHmbfFE4
	v5+yCobVyUF0PiIurDyRijGn0pdz56gjqqjNGDbz/DfC+Ed0d01kwWV4sTQVAiXfMFDmqunsPZh
	ZzmXB+mln2099pPncqy+ptu/zW6uaIyVJRhdeE2A==
X-Received: by 2002:a17:90b:3943:b0:359:f22:8879 with SMTP id 98e67ed59e1d1-35bd2cec783mr10505770a91.22.1774276381189;
        Mon, 23 Mar 2026 07:33:01 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:36f1:e61e:d1a0:422b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd262cb35sm4765516a91.1.2026.03.23.07.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 07:33:00 -0700 (PDT)
Date: Mon, 23 Mar 2026 08:32:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/4] Add i.MX94 remoteproc support and reset vector
 handling improvements
Message-ID: <acFPGVNOornxsPG6@p14s>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <b5e05fe6-97c4-40cd-b7cc-b417d8717aec@oss.nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5e05fe6-97c4-40cd-b7cc-b417d8717aec@oss.nxp.com>

On Fri, Mar 20, 2026 at 11:19:06AM +0200, Daniel Baluta wrote:
> On 3/12/26 14:36, Peng Fan (OSS) wrote:
> > This series adds remoteproc support for the i.MX94 family, including the
> > CM70, CM71, and CM33S cores, and introduces a new device‑tree property to
> > correctly derive the hardware reset vector for Cortex‑M processors whose
> > ELF entry point does not directly correspond to the actual reset address.
> >
> > Background:
> > Cortex‑M processors fetch their initial SP and PC from a fixed reset vector
> > table. While ELF images embed the entry point (e_entry), this value is
> > not always aligned to the hardware reset address. On platforms such as
> > i.MX94 CM33S, masking is required to compute the correct reset vector
> > address before programming the SoC reset registers.
> 
> What happens if the reset vector is at 0 and the e_entry point is at 0x800...?
> 
> In this case masking will no longer work! Can we implement a generic approach?
>

I will wait to see an R-B from Daniel before looking at this set.

Thanks,
Mathieu
 
> 
> >
> > Similarly, on i.MX95, the existing implementation always programs a reset
> > vector of 0x0, which only works when executing entirely from TCM. When
> > firmware is loaded into DDR, the driver must pass the correct reset vector
> > to the SM CPU/LMM interfaces.
> >
> > This series addresses these issues and provides the necessary DT bindings
> > and driver support.
> >
> > Summary of patches:
> > [1]dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
> > Adds a new DT property allowing SoCs to specify a mask for deriving the
> > hardware reset vector from the ELF entry point.
> >
> > [2]dt-bindings: remoteproc: imx-rproc: Support i.MX9[4,52]
> > Adds compatible strings for i.MX94 CM70, CM71, and CM33S processors.
> >
> > [3]remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM reset vector
> > Ensures the correct reset vector is passed to SM APIs by introducing a
> > driver‑level helper (imx_rproc_get_boot_addr()) that applies the
> > reset‑vector mask.
> >
> > [4]remoteproc: imx_rproc: Add support for i.MX94 remoteproc
> > Adds address translation tables and configuration data for CM70, CM71,
> > and CM33S, enabling full remoteproc operation on i.MX94.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> > Peng Fan (4):
> >       dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
> >       dt-bindings: remoteproc: imx-rproc: Support i.MX94
> >       remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM reset vector
> >       remoteproc: imx_rproc: Add support for i.MX94
> >
> >  .../bindings/remoteproc/fsl,imx-rproc.yaml         |  9 +++
> >  drivers/remoteproc/imx_rproc.c                     | 85 +++++++++++++++++++++-
> >  2 files changed, 91 insertions(+), 3 deletions(-)
> > ---
> > base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
> > change-id: 20260311-imx943-rproc-2050e00b65f7
> >
> > Best regards,
> 
> 
