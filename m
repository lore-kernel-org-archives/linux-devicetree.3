Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B612837FF6F
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 21:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843183; cv=none; b=BFUMpqZt5XuYtBZ2/q0h3pUULnGx92zSDxqMZ8orsDA6sC7BLM3U4rPc2dG25F7t5qwioAMtN/iwtqv9Pf7Vsqu8DQ0fZhnbkaiDQF6RBcQ0S8ViIf6mPgjpo46IQxllYGFZWWeolXAbLMGlmSMG6KY9oaod4L2I687aHD0Oh7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843183; c=relaxed/simple;
	bh=feNkQA/WNMJM98MZaQ+RDT0qpn4QbLWjzuTh/F+bh/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlOcSpw7PIjcotcLsxaASwzkX4jDfh10y9hCqfIUNVPgmV5I5tlBwf2dMKohO2d/Aw6Lgqn2iEtZU8IRAxd7sDspPSy3MnVtbdm6eSLSx5YZyFUXY1NnFbXTMfQuZ8m8PSglU5pXdu9ffP6Km+8FBxhsSVNpCZ8CIcFxguKLBLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SepNr15C; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SepNr15C"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c45281a06so5302329c88.1
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 14:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777843182; x=1778447982; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLgYvdpEC3Jx8JbxFUMvysrL+yedm7i0WZ9Ynxwtl68=;
        b=SepNr15CjJPwTiTgvAKk2f2mN8u39NrivcP/LiV+lOXCC6c1vgEYCHJS8cKe/86UBO
         GxADhEgZXO5813JKPFR4S81o3nrG/fqQqgu1PhBmi8nUS+4CQfrJgvOIxbvqlQ5WWCxE
         627EaQ+Iny6BPOOFS3axB+MKmfBGEvSaQDafBm7ZAgWfPwtUDjdx8mvZxhd9IxZKzObM
         vVyizuNXxas+CMNnK6tXMn/h0tsk1HFd5ITN3Rte/0e5aAIiwCHEhZkifDUiv3DrLV23
         bD+A2pO+Yss0gBgoVk5ZZ+5OTNP3TnOH5+4rarrmW7ZG/PbGQTvCS6u1rK8cZ9BaURLd
         5aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777843182; x=1778447982;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLgYvdpEC3Jx8JbxFUMvysrL+yedm7i0WZ9Ynxwtl68=;
        b=bUUqmMeVSWbII9gz2hpAy8v2fsJPFxkJ2RUew0dSMYJNh3VjhgOY02TqGne5CeeIDn
         eLSEp+ETAaIIBJogmINrjJyItI9NR8x95l6cCILgfPr2K88D5yVpbvHmD0ZFXMjq6VD0
         UiB0sS0fmXtZCnhwd34cpwKknRligSvsDQd3tCEsoSbIxdT2c9atdJmdxpusx/rgHEGc
         zHptTyj4OcU+RpM8BLm6DDEZy+X9lPiDSjErSmxZoWe8DhgCWx2uajrOp0VQyjKUuopG
         9knaw6PADDbbDZXxP3eBdit6Yib7n5/rJyblFwb2oH6kito7euJ3tHMNjTM2HOcc41Jh
         mhSg==
X-Forwarded-Encrypted: i=1; AFNElJ/Uu4+e0gICe+EWplJDkIGs1HVQiyKeJbusOzVvLeo80+8JaRqdRkwP3HJhG3h2Ncn0OkH2O7rKtTlr@vger.kernel.org
X-Gm-Message-State: AOJu0YzSccACQvb4MsNgH3rDZ2axP+30mXbK1Jrj/UBCdhv4sZOKWp5X
	sVf9E4tjYlWVdyRB60h3s2Z6eVBphzriE5tq4CJeDgLP1v1hV9v81P8J
X-Gm-Gg: AeBDievR+LiywM+Frw75te8JK2zhQXFNp3WBr+CKQpLxTqVETasA37g413DU9IBxU4m
	nZif0lzuprdxvQqfMAI+hcnmynXeb6xw77YFyG70J/pzWJk+o8oIy2u/xew9leo3aAdo7SuwK14
	FuekGt3+QM/YbpVZZNdPTCqBuWrhvdFxG1O6zptkk/AOO0s1F0ri/gRpzc3N49ao9y3lagOwkBT
	SPJF5uFPG+uTL9QgdkFncJ/mnYG4y5tvMObDH/xoxqa0p3sfwEp70LxMcNHOISXu7eNG5EFA4Qf
	k4cMU5a2eiaMqAbvamS0qPzLHKRsK4cBQz+zLLA0qmIY4wYr4+yf4R53rsOQqL6h224Fp/UwgNz
	gzt6LAOyx17vDJlgy2qpC2aao5Wk5DlN4Uhg2l1Azk+ej/5m2tauNrgIGRBD+tdVlbsW+CDj8hw
	i/RnnzvjbWmt5Gb4UdslVshgxqt5+Ms/D4vp2WHm2gdzFsGrk=
X-Received: by 2002:a05:7300:7fa7:b0:2e1:e5c0:7992 with SMTP id 5a478bee46e88-2efb91b4ce3mr2926137eec.8.1777843181672;
        Sun, 03 May 2026 14:19:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3c24e738sm13058644eec.31.2026.05.03.14.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 14:19:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 3 May 2026 14:19:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: CL Wang <cl634@andestech.com>
Cc: wim@linux-watchdog.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	tim609@andestech.com
Subject: Re: [PATCH V2 3/3] MAINTAINERS: Add entry for Andes ATCWDT200
Message-ID: <68db1ae4-c95a-4512-891a-1da7452cdc1b@roeck-us.net>
References: <20260115081444.2452357-1-cl634@andestech.com>
 <20260115081444.2452357-4-cl634@andestech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115081444.2452357-4-cl634@andestech.com>

On Thu, Jan 15, 2026 at 04:14:44PM +0800, CL Wang wrote:
> Add a MAINTAINERS entry for the Andes ATCWDT200 watchdog driver and its
> associated Device Tree bindings.
> 
> Signed-off-by: CL Wang <cl634@andestech.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 12f49de7fe03..1a1c2b68252a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1817,6 +1817,12 @@ S:	Supported
>  F:	drivers/clk/analogbits/*
>  F:	include/linux/clk/analogbits*
>  
> +ANDES ATCWDT200 WATCHDOG DRIVER
> +M:	CL Wang <cl634@andestech.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml
> +F:	drivers/watchdog/atcwdt200_wdt.c
> +
>  ANDROID DRIVERS
>  M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>  M:	Arve Hjønnevåg <arve@android.com>
