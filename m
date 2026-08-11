Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E00392C24
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463786; cv=none; b=t9hF+M3UcGLKyfEdGXdxA50Y+zPj5XUtFebOflZa3PXY2mPF77AMr1XeqU05X3nVWsf2NquiMTabTfsBckDO3dcTIPSNFOWEicaTvZuYOubVOc9ffBgKF96FJY9+e1r+mXZtrbEMwZQ71DsIyashbYaP55lsMcOk16L1lTBrlUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463786; c=relaxed/simple;
	bh=Sb1+twgrOTWLGdPeeqQJ1dS+BWBviU9Qq9qcBqdu+MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3t9WEed2EAM66cQx9dTVXo9Qxmzop7m50q640Ueae1qXHkK/2DDlnhGnTgEMTZODh/A5yg42B5ow2O56LSQVLRUVqj/1qeCBp/B53X0VypiovFzf4Y9VksTtqnOGfSRUZ1Ag3su3WLp9C6BiJhEdGgJaB11tjOloJJJb7x/Xu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJxJ+7/r; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJxJ+7/r"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacb8416a1so1184965ad.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786463784; x=1787068584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U7Um8ni1h3/FFAIOsbMa44HizVaLVoKUwq8OGzurZ7s=;
        b=QJxJ+7/rBe2W68AzP0o2g2j+Xdj8Fn8F01HknZWf++Zv1BNEH3mxS6KYbtmIsTEln4
         Vs/uI0am35121TEhhKZW+8nrLo2DUpuRxmwZCiJAcoSYa4/crSF5MB6OAkegKVaJC78V
         Ncts8LGvWaYcalwtcTiM+z9O/0oCLO610xSDBgs0+0YS/9pLjUzgL05sI5Iy96DHOE6s
         9twwYLDcE8L2KP1s/fcHbR3p+X4zSVO72YCYhVQKGH+dzLRhkXny+q9nJrvBIcHo9e6B
         qs0gC+Gf2ZUVz3u251R9XxsTHjfblsm106rjV00altt/szq3ZA8RN+MT7wLJEm0rsehG
         maPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463784; x=1787068584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7Um8ni1h3/FFAIOsbMa44HizVaLVoKUwq8OGzurZ7s=;
        b=O0G2cjrO93gxR1fGaDOz7YeAqYV1KuhWVo/KpBNkFpaNiQaFq2Qil4EY0PCUy/EvPI
         QBCvrcedZwbv2T9TWMBqWKHQsIWgxy0sTetDbf0ad3+Yrn56QDeyZVM7QBaGM8awwGEY
         ged5XyOz8deAlbmtvfSaOE1h+fz9EKrAyq5Vd+ws1G/EmLjqDI4Bqq9lQ9/TZ2s4It0a
         AghCzVqhjMe1B/Tm/d561IGNoRcNM9PAsgtv+qKqUpRHcA7s2QKFSqts23SWcVfoeeFs
         UFK1M7k1tsxA5cTc/mEvRPsL8EhA9x4D/l9+LDrwUuZwJxz7bIPDcgajSErenIPNfG7R
         7Rlg==
X-Forwarded-Encrypted: i=1; AHgh+Rpo3e5aiZveei1sTlNW+m3rIrLLpydHC7NI+TpEZFWWm3NFQfus3oG3QU/FvFs+THIayMcMfZFSfhH/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy+0ddcqYxk70r/5zl3yRSTyVYhaofl41gJJQN6OqykT4gA1Hm
	22VbheTIqwWonZP2HvE31NxnxFErrfE2ZaPJeHAklH//mXrdLNE9q4J+
X-Gm-Gg: AR+sD13cvnVFogSGNCqY3f73yqDEUGuDUo68aGO/oYccpHd/5NVebJcobxCNC4xeF1w
	cDAuooKPeM4XbPPx09tOeQnmI20VtmbOiLmPRmZtE9DEzMq2zIZltmCyqMuoutBR8/qDCfXdkzL
	s059Px7WvFQka8Go4+Y36g74ePK3tCwvaRt0CEEVaBOmre1bFx6T8UIawkPTn2TwwzqAeyoCjo0
	w1azOAHhAyjbajO4h86BYZ+vyFQa/VJm/NHpTCcp6AjBGzRBKCAJk/aIdqdpwkeUTeyFDHTBOfv
	X74hm4BHOsAF3+sT+Qt+SMR/opNJJjfln7OfiNJnxiCvIq7Y0o40QZvrCy9WsJfU5J4Vxd+al6X
	MxuusWmZwV4CG/sVBWahuOr6JIrDD4VHlpA+6ZuOOOGqKWexoxRwc8a2Tskqg2ml9hSXagC/bAE
	pUhk36RaOEJPh9vhcSH+0AvMpeAnxbyYENDRGsjRCzZzPusjsZi1WHXMDbJG7SG/1EULDDCuKBM
	g==
X-Received: by 2002:a17:903:4688:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2d317927528mr51471865ad.17.1786463783806;
        Tue, 11 Aug 2026 08:56:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d31623c9a6sm10392305ad.82.2026.08.11.08.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:56:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Aug 2026 08:56:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: Document SMSC
 EMC1402/1403/1404/1428
Message-ID: <1d559b5c-9259-43d4-a72b-c1a54d62d85f@roeck-us.net>
References: <20260731113007.145322-1-clamor95@gmail.com>
 <20260731113007.145322-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731113007.145322-2-clamor95@gmail.com>

On Fri, Jul 31, 2026 at 02:30:05PM +0300, Svyatoslav Ryhel wrote:
> Document the basic hardware layout of SMSC (now Microchip)
> EMC1402/1403/1404/1428 thermal sensors.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
