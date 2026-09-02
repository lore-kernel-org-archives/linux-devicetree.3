Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25A037EFE3
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363641; cv=none; b=aex2Q3AZ84AdKNP5cbXWjBoVXObJfc/6D2Q3Tmzfxm8adij4XTf8WVAIs4WaWY+4bluv3jfW85AdpuFBNtHYP22nbkmTB21EgNb2xhEJKvu2gUMtE/aZEmmiNm/NbgZgRupm0OomK98BIQCO9khMoupsOPuI2GSEMO60V3jX/wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363641; c=relaxed/simple;
	bh=0zuSQQlpTAcogubeGK9Q+eqQpXU90+aksiuAKusVb3Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qRpsRA+7CjUV9K41R1ls0sMq4WRV7IOOyt5CMQbOsNKtzWkuTA+rnvAgnDmKJ6sKp3axWCwYgfZY4RAMEHDioho/wr0sVxl3++yLsO18+oUJE9P/IAgckvbpGQy6gZDUaIwzwfvS2m8JYNL14Uz06TjjIleL5trmu64EjgBguxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=iLxRKM0C; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="iLxRKM0C"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso1553964a12.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1788363637; x=1788968437; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0zuSQQlpTAcogubeGK9Q+eqQpXU90+aksiuAKusVb3Y=;
        b=iLxRKM0Czj1pQnuvrPjz27elxH6as0Mw9QSUCCPY3k8ORl2k/t5T7GHl7AoOfn/Ukb
         a1WxHWPk/mzVJTCRuTP49H7FnrYbTtMzCLaPQdyV8XFmJ7xpG3a6xiIIM+cIqPI8roMh
         HNMJS2rBxvnL7cYopHG62TPoO7UWgE5/E5OwtOEo/Tpm05a2ucxNmn7iUAHHluLwRNBd
         T/gufPqCKVzVC+4BNPmcM/wPt3up53yAcsgQIynXIDoBfR9rrdAzF6ZKR8rSVJgER5UO
         b8D2WuskRdX1adxeXE2lD60m3aXQij1V7xuZBHljBfefBQLnvXg+1oUklj1sq9FE6qwr
         LdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363637; x=1788968437;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0zuSQQlpTAcogubeGK9Q+eqQpXU90+aksiuAKusVb3Y=;
        b=dccilBMsnI2RMiskCaPrhMIlTXWCFj29Ulxtm2PjuZxaKmvhfy6ryrQCJU401ScIJ/
         R/+YnRMcwoZZ31c1ASa7nFcZQPj7sN2MpG+rMBPZ2oCV+5zjg9sptm2SbaMJpr4qQqRE
         4upLBV8SMhPqyvJ0sabihhumOPI0TMlsI3GCXTzzpUmdxL4G/atO1B/OKsKfJfbMMv9K
         puBdx5mge3cSLG685mPMd5/zgVZbkIXXZpbjFCaIAbz6TxDdBOE6o2DgcE1/Bdpx76KY
         DtUJfVo1QkDzKRW5Xl8IysdEv0m/aGh9/i2fXvnDoaVWlGE7H3P+bgFweWXg+FZKS+k7
         xATg==
X-Forwarded-Encrypted: i=1; AKwUvBwzlFGgAA1YCF+VM0w97Cmk9e4tweO5PG6NjX2Ajz7Yo7WENIGLB3vnf9ag1QUh2ylBYyI1lqhJx/NH@vger.kernel.org
X-Gm-Message-State: AFuF++mFDLkkxq9eqYRpMAkwcfBm76IobypkxZkM3CN0M0pE/pa8GCE6
	uy1CLHxYSCpTLh35s/LbDQyL81szgY02dqDMx7nMb90ghMY6L+IRb9r47K2v7s/+5ojOhu6gvIA
	E6LtI5a0=
X-Gm-Gg: AYBFou11EL3DbJu+nH5gu25lxfxIu/uXXCqEGckzTkdC4OkPvXdmGoUsIO4oDRl3dng
	v3EEbGdL8RgKkjsKPniAnBxlUAGPFBVUgVWJhdgpigKPLMiifFleXjAwO6oTndbpWbgDQ9rPK2p
	IBEVe7IPyv0yIHjMEFYE3TUEYgnUCyUjf4zvx68H/TaOHl6QTYN6VBjrjhOHfwNCimYv5HX5rx6
	ihybD5tbwzBjXS73Cy12f+z9y6t+NBcvs6WB3qB2d0dXz0cScbxDR5F7lAEsVxHGz0HYMJXvo6Z
	hSRM5cAmPm2fYCNy626EVPVfg2L1RW/9CtgT2JbnVdtwwIeASFD52VBPXIggCUS5aZphGhXTV6C
	1oDMqBCYRc6YUJw0P/gQWjztUaNyJCtl8gKIRc/hDHf6eNi/fuEFHK/Thi1sMKn6o6Dql/AhPqa
	1CRe34udrhPBNYxbORVKib7CRjJc/5uUxNAj5n5MlIatKetIBSUOLx95syOJmx0ejH7WQysfvvl
	r8c
X-Received: by 2002:a05:6402:218a:b0:6a6:1719:3f42 with SMTP id 4fb4d7f45d1cf-6a68257c26dmr4666942a12.6.1788363636908;
        Wed, 02 Sep 2026 08:40:36 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f932de4sm1280187a12.18.2026.09.02.08.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:40:35 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: qinjian@cqplus1.com
Cc: linux-arm-kernel@lists.infradead.org,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  linux@armlinux.org.uk,
  devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm: sunplus: add SP7021 LTPP3G2 board support --
 withdrawn
In-Reply-To: <20260902104545.67794-1-ag@ffroot.co.za> (Andrew Gaylard's
	message of "Wed, 2 Sep 2026 12:45:43 +0200")
References: <20260902104545.67794-1-ag@ffroot.co.za>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Wed, 02 Sep 2026 17:40:31 +0200
Message-ID: <sa6a4pzwtjk.fsf@dev-ag>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Gaylard <ag@ffroot.co.za> writes:

> This series adds device tree support for the Tibbo LTPP3G2 board, which
> is based on the Sunplus SP7021 SoC (quad-core ARM Cortex-A7).

sashiko-bot found several issues with this series.
Please don't review it, I'll fix them and re-send.
