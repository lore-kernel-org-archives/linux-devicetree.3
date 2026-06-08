Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F00830674A
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 05:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897030; cv=none; b=XCX4RW4Sa0J/8h6Q62JY2d4Pz5t9cMaUNn0Ptr6TV6/BLGIVqrrqNBWuY00mGeFO2u75bQl5mxy9+c/FcIW3U8ZydJiE5s9fFITsCvYSnJ5rpUOhlWJB1Ir1G7dprj8tEPqC9+ElJYmGSn6m7Hjjwuj41bSfPGXT2VuuEmW+qQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897030; c=relaxed/simple;
	bh=as6aUcNr8pYRXi+K5EHXNogQnWjAD2RD1NlxYEUoRSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iraD8+IiA3r3VikNESlA0J2Bp3TQeaO+4yjYvk9A3lwNCHeRh/DCpsUB0kPqdFimU1jaRyhs+vYoln5m277MwdF0VFT2DadV1ytKv1fNgegdoGGPSL45mPsj9ExHGUNpW5JtExSY55CHyV0zStuj+zEOZvMsfPHZszaipvbk7Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uLeUaycy; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLeUaycy"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c859a374903so1250109a12.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 22:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780897028; x=1781501828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L6AIP1fKlQGekvl+Me5wDofffuQ5PdwnrPJErlJrKwU=;
        b=uLeUaycyHECRLtIvf7Vd7Dyh/ab7Aqz60ZGmTVaEBGYlBKWXkG0SsajccwDf6vuZNG
         q2O88SjC9Cr0+/fIuaepvmtNlfKM6Lgd76JPxKhEErQkkWZzULR/mKsKa/a0u96dmCsB
         qIOjHnhZ+PadyjrQBc08Hi/wT/4xy8nf39i/L9KPvey3b2zRvyomGzoL5C+BL/Aad2AV
         XCV43KbnFeiHGD4pxBpQGZM5RQpZH3s4+xHpxjwkHYf248ZnhA8YltckpYHnwv2o0PaV
         DJv6SJKQHKP70YiqbajqmFZ7kg3Z7dI0IJSuuc0GHAcaGPv14NvgR4gTWEJK8inBzTM1
         0srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897028; x=1781501828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6AIP1fKlQGekvl+Me5wDofffuQ5PdwnrPJErlJrKwU=;
        b=pxH03LzKwLabNaZAuR+nvxl4lAwiQ3G1scYiuo43uJGxjPMRPKIDtHfT3YTqP8XAzl
         p7NECZqInz2uHcBiQMgaCSRwVq+5NkI+0gEC4AOPyDP9ZajHRFtg1zBRRwHmwvngryJl
         XhDz55oqO4uGUjoKxorPQLMb9CMFHjhYwFwmvfiwWlJGLvZ/PdZunmh+NPGHlIjLOSz3
         AjoIKo/yXLxYq8AKoUdahaZLXahG3XD9UebTBJA+voFlGWP8Hw8SNb3VDTM3yLd/Pd7z
         2GLSiRrzO+cOYZOO/i/SE+pGv2D3XGlr771x0EiJczRJ18pegskvUi3H5r6qJ+fS8TD1
         CvUw==
X-Forwarded-Encrypted: i=1; AFNElJ9UjHHyU/3LqKLguKob8+h8NPNFACOmDTL1zQQqA4ptr6EXdptGqoerrp49KAYyWZay70ag5Ybsd+FA@vger.kernel.org
X-Gm-Message-State: AOJu0YzMxxIrteqhCiQe+gIi6/73QlDhF5a43JtdwLXc+TpOBF5yg3iH
	7HP3SHEgiMvFI9sIuMjq0x4rrJTWPQdG4H9dv42sGe476FA2ULWTCOR24naaY31Q2Wc=
X-Gm-Gg: Acq92OHe1CWatn8/fC7jZhzxTxIZP3D0M+S8GIUa0C/hhva1jlLG8ok9qvU+XgB017M
	evA9LO0MHCOhXHM3ONTn/GfB8JLfgAf9WDW8eQroP27ouIhNVnr9utE4bjB9IstY9sVDzBjac+Z
	yn2WNPBKcqTVpPPd5jgC6phGrf5JoXINCnclKBOgCHeXVGmfzrbvrj5MsIZ+xAaLOBjWAB5Vv+r
	qek7NDtEt8ViJ7amYSouKEHN0mdUXmzmq7z0phb4z00FR0J7xkzdk/MIshuKY3dblD5bMekv3Ut
	T6aWYMfwzhb798m8/rTe6fIr8gzGg4CGBjfp5hx59kGFzi9LwtqbOaxvhPO1ZKb9LBBq+zOpQdr
	xBuK4ma8sWoah32mD8iA7Gt7AInt0ApyhD3cc3MlkRJZLd/X60mkIY0mdFTGPgbBuXZm+HwvBUV
	ICMRras/h62Zk0gruLA8c7ghYEvP8g6VOYhA==
X-Received: by 2002:a17:903:388c:b0:2c2:27be:39a7 with SMTP id d9443c01a7336-2c227be3b18mr99546265ad.29.1780897028229;
        Sun, 07 Jun 2026 22:37:08 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e05fsm173360235ad.54.2026.06.07.22.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:37:07 -0700 (PDT)
Date: Mon, 8 Jun 2026 11:07:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Add cpufreq scaling support for Qualcomm Shikra
 SoC
Message-ID: <fvixbefu2yv3iyoivhgb7ty2fz2tod3rvpier7ymiuxugkeh2n@b3hrqngirn7y>
References: <20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com>

On 22-05-26, 20:46, Imran Shaik wrote:
> This series adds cpufreq scaling support on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
> Changes in v4:
> - Drop CPUFREQ and use EPSS in bindings [Krzysztof]
> - Update bindings patch commit subject with correct subsystem prefix [Krzysztof]
> - Link to v3: https://lore.kernel.org/r/20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com

Applied. Thanks.

-- 
viresh
