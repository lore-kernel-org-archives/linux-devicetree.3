Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B323BB10C
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 03:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785901244; cv=none; b=DOjGZ8dxj7iHH/RFrfQi2snrRKZYaDPmaSxTOdA6CXXEMh4KdfrONjzuW82YTOytPgBYfNKPQvFWI8+/pKmEoD6TykGqUFgRcNhwMThYNW07TDv+ApD9KvvAL1ltSRr2fUGpNSvton/uA4TyHpHCdcZVCBxpFaLYDMOvbxBXT4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785901244; c=relaxed/simple;
	bh=9bRo+Ywi3z6M397Ttk8WJOCfNaXfPL/cDqxTv2yA2Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhfUde/DKxxplpPH+jiFuSIw+sSkZ9zrAlpxNUIfaZIC3zmxNHDJ1fnpQbfY2WC7CCnWo5sT1X9960Q0NSg3Afq1zOBNzBHedLM8eOFfudYOCaserkbPAZ1AGoGogFXZYfQHNDkc28s+oIlrbO62zDb0nO3Mg5OYQCfSWdcH9fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6n+AYVx; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6n+AYVx"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so492823a91.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 20:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785901243; x=1786506043; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b3uhTNsEfEA4V2HM2KbClDOzdBojungNZKQ+/eKrllo=;
        b=d6n+AYVxTgvuQaBP3tvTDmtUa+BufNiI0QFRb7MP6o5tWa1v92kxKQT9945R11vRvV
         9VhSZ1XJU26KUnSXR6CiwcBYyEKReDh2DM467CincLHDeBSQEe/lofMxioEFa5Lpdx/7
         c1lRENYeL0mOFpM7yq7yjVmPrcr33CENBNBXZALnao8XzhA6GqBD9v/nGUCGIDp6m8ot
         ogVgV/L2xuCetRLMuf9T1A5LoMJM/jIXuyqTva6ElqGGZGqOO/cvYXpocS7i76TZR/5r
         v6ieGIoSr+4xFK7Oig+LKiH+P/s93d6uiRuZePE//UfhG0B/74aBN2bKMLR6OW8rFpfj
         bAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785901243; x=1786506043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b3uhTNsEfEA4V2HM2KbClDOzdBojungNZKQ+/eKrllo=;
        b=p74q3CsMi/vu+VMSzb5XYtQDFXAQP6QQgO3qLB8SlE7ETKIfygsTR6ABMkaYXES0St
         HeRqm/ZIXCwpSodSd/eyzl/EI7GEOX3IgMPEhBbj7voabnLlEwUd7rVlMU7IhMGf2wql
         cORBol9aljY4rFsPMv2ErkWVGgFt463PihoPNvsih6tij97Z3aNmGfZ/WsEYj5aHYZSu
         Yz6uKIyfu4PwVbseTWE0RPElAiEXG0YrrXelapb7jYNFK+J8xrVXL7IUw+BcIUbn8xK9
         tsB419wd//n2B3QYC4CJbZfZqj+h/3CnA/oXhQNdLzmPwNpnulX8hUWbwyee4y8BYFfb
         joHg==
X-Forwarded-Encrypted: i=1; AHgh+RotQCNQR4NAIOGWVMfHueO7AqTUWezy0YWBRucrSXKnJNJOGX04h/DDjG+Hud382h7KdWcVQ6Lz8RE1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0a62bRcwjdOj8IztFGl+uuKpoMtBmzoH97BYeGTWhBYRMTaP1
	3Kw1Bxy6IsokGF02C0zf/lY6aJyTuQUDfzUZ0apeICNl+d+uLQUPzAv+
X-Gm-Gg: AR+sD12wT3Lg091RPUOxqoHtJU768tyNWqQ8QY+ZfT+zezAHQNlFqNyYFDAv3EK035t
	93/CRh0Sp0ZQ6bci+zk13iO4IC9pEjuNOAIGwn996zdw7jN6NObvh0bKVr7RvfcwGAfon2lflin
	YxA7iC0JDfb+ZnTG/JLUL15qW88Wu/c+q5e8uq38Vt6KQCD7+D7a52gj99051f09gjw17KWHsNI
	hdSA9/nZE/7NnxunSumJVCPMCsO09dRTdh/cz3OklRIyTs3GE9xd6G5+u8sST5SQxc7W23JZCCF
	PqUFj8jnx4e+3qU9yelz6cIm0MrCZCvbCjI49JFEq0KulnEhkMhKzw/IdXvX0QwxqA1d1uK6/8o
	QZvw2wkTMa5fGvxlstANZKt+tf9Xf9Qy4LHfPgCFxKgHEN/eYDsemMNAKNuQFmopbQqBA6pIASH
	I6UILl+fFUoMQtQVy0wX3xI1yeEvSUdpTeVktYDwVqjTDVxprjhZBHWc6YgQ==
X-Received: by 2002:a17:90b:1811:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3903bb0ab77mr3022104a91.0.1785901242802;
        Tue, 04 Aug 2026 20:40:42 -0700 (PDT)
Received: from x1 ([184.3.251.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903917a5d0sm1534085a91.6.2026.08.04.20.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:40:41 -0700 (PDT)
Date: Tue, 4 Aug 2026 20:40:39 -0700
From: Drew Fustini <pdp7pdp7@gmail.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/8] riscv: Detect the Ssqosid extension
Message-ID: <anKwt4llzgwySljb@x1>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
 <20260729-dfustini-atl-sc-cbqri-dt-v6-2-7c22b05d461b@kernel.org>
 <c38f0bfa-54fc-d141-c166-7355901d8ad1@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c38f0bfa-54fc-d141-c166-7355901d8ad1@kernel.org>

On Tue, Aug 04, 2026 at 08:47:04PM -0600, Paul Walmsley wrote:
> On Wed, 29 Jul 2026, Drew Fustini wrote:
> 
> > Ssqosid is the RISC-V Quality-of-Service (QoS) Identifiers specification
> > which defines the Supervisor Resource Management Configuration (srmcfg)
> > register.
> > 
> > Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> > Co-developed-by: Kornel Dulęba <mindal@semihalf.com>
> > Signed-off-by: Kornel Dulęba <mindal@semihalf.com>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> 
> Thanks, queued for v7.3.
> 
> 
> - Paul

Thank you for queuing patch 1 and 2. Can Patch 3 also be considered to
make the Ssqosid CSR handling complete for this merge window?

-Drew
