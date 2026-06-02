Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327D23B992F
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 08:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388544; cv=none; b=YPZL0zN0Wv1eLAqRc8xS0CeCDQAMx9nNQFr5DlFCFeOgaS/z/bAM7D+i/MZDLqAxrh5HaZ8a6VsdWybZkRULd31PibxLNqN0kOe9Rph1Ff1gnOmPoRsYoKdoYB9fKPcHhSiPaiWM1P5FeRFZAAota6zt/ZEptSh/8JW6nuQ2HdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388544; c=relaxed/simple;
	bh=EJikaUMJCTIOu24FQfnsiP8Ha+Alj5V2JdWUXPbDzPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fO4X0fTbiehw6CbA1gXF8NwhXhthllHkFU0nRer9F1lMuXfcA/G5qHpJ1L4LLojkRfMudGnLuyZ7liUfCETgKMOPPuHNXWjuEU1QA/aqOYkp1iSk4qbI+pwcOvBa/3fHNp0wIn4UKqvIqZ6Gcuteu5w2uEKaNvRhfXyZ6H2g40s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I26RfAfL; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I26RfAfL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36b9033d230so2416647a91.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 01:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388541; x=1780993341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=evjuzAv8DSTdE0Ve2B6VtbgLhoX9BoKz8McLMZToRaA=;
        b=I26RfAfLfB6+dqTlsdbErRAwuCbPyt4XVRRls4J45JgBcIBEiIB8v9xTSgQiCBROfQ
         MlpBvkPYX1LLcSvIpbOIDh/cwHZlheTWB5j/CReakDBcDAke2qNu90xXD2GpnRD10Umy
         jKdCdbDJtK0aYZa9pendkCiK2Hf2AjNgJkQj6iyR7yXTHX7JM2HubKjTfX5i2aXELUhd
         IpMuKwsHaXwwO0cyUvBrFmceCBXTOxTsV/IVpR+idSHVpAgfjFi+SVkWPrFWK6Ohcnd0
         YQza5JCjHlScyM455LqUCB8FNt+8cKkJ/wMO5Hd8yfkDWmxdBcjZvlRBNgsWPBLtOHjb
         OltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388541; x=1780993341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evjuzAv8DSTdE0Ve2B6VtbgLhoX9BoKz8McLMZToRaA=;
        b=Wbxjo3IDpU9q9OijQA1xb/ESi+a0QTGeGJmAPXRIrsSaHQxYGZlPga5uYi7VlWFqMc
         qk+50j1LC8Tvdo/opglpldERREahFbP338YNMJzQttcT9TRy/0LUWjTcz0JfGQmLrd+N
         nt5zCIz4nHK0QqUAF5oEP537oFEvlA5/RKkIYpSzh+XrZ+M9hs5NBILtP9sf18fhfvrU
         7uPw8689Sm5qEZc4hKqN0HJ2qYes/cww0psoztDFOtcymy+WBJIZ0+l0skghr+ANmCCF
         EL6pa1SYIClmKOt5cBOH8HqCoQMFxWQhzDYaHqVVPGuC18aHgah42OScu/Jx3Sj3Vah+
         /5TA==
X-Forwarded-Encrypted: i=1; AFNElJ/0Rakt5NrC0MB2/vEieVCpeq41Ac35LA8At1PDmSrcMQ7p8owbVl8pe/a+enMoup8yFeDVRLfgK09c@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3U4jKtsChf6Vz9KZtQtDjGSADWWSaPS5NOaJCb0nRCNfJvdxC
	ptirkcdcbeCqBg9aV4/FCpstDyrR5ZZv7y9lgcvGBy8hbB3REaTz9vz8
X-Gm-Gg: Acq92OFW68nQ2aVHrdNvFra0vyx1NGiPr6IJAiGQHKu+FfTBPgnMPVB5nCa6fo3K2JB
	WkrKv7XnWVQqU5ntDzEP7HbJdTWnLu2uMJ9AUjxzwf622yl26nXNErAoTo33Mt91hc1HvFxJH6x
	ARzTSkeKsiipNldK29KWugsW/sK7KJqvWnrTxYqsE/NnrYZcPjn1xI8yGQ99EP9q7QZ9aLgOirR
	7fAFL6jHpjZR2I7Pbfq2X1/X17bY9Mx/nfafZotsJ28W0l/Gf3dRRV/5PzaBzXMyCtPaoBjbLhK
	woEtfpoICCT43oszat+JUgBflxLQsatW4kEM3sl6JRWfJPqdnCnqNKOC/+CKXhFQEN53awWAR29
	zWBK5YvZl0Po8jozIeHa5hWw3oa55EMPNol2x0xSH5UnOg6vQ85Z3hsf1ldp02CnukCLSuOwcYY
	1XznNZc8sRLeyGTBa7Og58c4mDeGusUMbWQg==
X-Received: by 2002:a17:90a:d006:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-36dd98883ebmr2740656a91.15.1780388541458;
        Tue, 02 Jun 2026 01:22:21 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd931ab67sm1864181a91.16.2026.06.02.01.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:22:20 -0700 (PDT)
Date: Tue, 2 Jun 2026 16:22:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	hanguidong02@gmail.com, michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board
 support
Message-ID: <ah6Se6TJM-wS8UVP@inochi.infowork>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <178038833103.2088679.3632311874557644565.b4-ty@b4>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178038833103.2088679.3632311874557644565.b4-ty@b4>

On Tue, Jun 02, 2026 at 04:19:05PM +0800, Inochi Amaoto wrote:
> On Sat, 30 May 2026 13:33:42 -0400, Joshua Milas wrote:
> > This adds an initial device tree for the Milk-V Duo S board
> > with support for reading from the SD card and network over
> > Ethernet. This is continued work from Michael Opdenacker's
> > v6 series [1] on the ARM64 and RISCV side. It has been tested
> > with ARM64 and RISCV64 to boot from an SD card, have networking,
> > and read I2C slave devices over i2c4.
> > 
> > [...]
> 
> Applied to for-next, thanks!
> 
> [1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
>       https://github.com/sophgo/linux/commit/eeec80c3ce36ead24e2f53d88a24dac1e3de8041
> [4/5] riscv64: dts: sophgo: add SG2000 dtsi
>       https://github.com/sophgo/linux/commit/2145cd2f0082c11177b062e1ecbce121c3b50b43
> 
> Thanks,
> Inochi
> 

Please ignore this, I apply the wrong patch, A new thanks will be sent 
after I fix this. Sorry for the noise.

Regards,
Inochi
