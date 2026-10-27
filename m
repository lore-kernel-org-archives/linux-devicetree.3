Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084095;
	b=dbvNQrx9dUc0724U7rWF3UBdb0y/HJCqF8YZdeVWIKE5OJJjDAI3uLSD7sDjKsRiSzNG
	 25Nv4GDh9pjr99no8ma7qmOVQTWA3PVMgKo+LADgDu312RhAbpn1mkcjKpKOdAPpZVBGc
	 uMMh2MemdH8xa/AyjGLftdhh4AomnAVBpuPTWWMvUnprvLyVq8h+RQ6kLNg66X3ScOVFz
	 Q/a8GAnyYdiUsRFuYPpnsQdMa3K52w6mobwwZGGGSp92SxHVtfu8zIt6T2uHYu5CmM7i6
	 HX2hKn11GkSdFUIxQPnc9sqW2kGm5EcyMrF2gGY28ZpZF8fCz/kfAjrWGKj5o7AL3Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oEXr1K3EZeJQI84eHYprlnMC5Rarw55WE3zGp6jDEkE=;
	b=FlRVXm9kqUl+raapx4qjMPUPSOGzT/ht1XdvRK1ZC7/ox9ZK4HyiD/Wwa7m7NrFSMpNQ
	 yEGidxRvAg8DqbLAOgRXafeEMJTIfqlINkkuIALA81WF061WwuT8rmT+wQOQYj2gWDi4I
	 pqNjhzpjsfrG+9NnTIL8ZXt4K05Sgt+eCnBGBZ/bFTnMXVJ0JV6pubO6NommFGqkbgR7Z
	 podR2tP6AmxQg2sBr2daoY7Gqi5zxUS3MpjKBJjnrPSxnQlgFdeXem1ggDx1fnjmSYjIp
	 4VrMZlXRfr9xm7WPl08XL9x50cW0EsSH6+46q0jxGL7iWOL4dXyHnyk+F+oDKG+SYLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rbm2u1OD;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED6606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FED6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rbm2u1OD
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso18499795e9.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084094; x=1793688894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEXr1K3EZeJQI84eHYprlnMC5Rarw55WE3zGp6jDEkE=;
        b=Rbm2u1ODARNBL1tpPkHcrJM/nHYPU7J8ag3G/Z7wD9ZUxWbcU8zU2GfDy84PQZqBxI
         olGNMC0m9AmkJQMUoBagRXCjfUWnRf72LOO6b8ZKHnif1ixuAo87CkfIcCF2+c6oDo5N
         Zl90Q0Y0wquDTGNCkQp7AsQhS8KWjiVBICgCGQoFmHqGDy//4y8okmwwXdrNLN3LRqUn
         XiNDojM4jhEPtC8xX8wW9xNGR7AXZDCLKqCLWasUszZSmZgmWpmE2DYt/pIL21A0gmmU
         hDfGOgrCWfkynb4anQleTR8DpQW2ISV5cbX4aiTSdtuXDutGLv4CwG/UtbOyuEuXkiPd
         FiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084094; x=1793688894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEXr1K3EZeJQI84eHYprlnMC5Rarw55WE3zGp6jDEkE=;
        b=nyGE5vQajaVs3C339Q44WPt9ZBe8vgp+o44q8VZebxO1WEnVim+/vTIVpnsXJghnwN
         0Ol1T7lUGV5N/vPEmaLXtFLcMmwsY8ng6+caBPDlo+ta0/zCIHrRr/ir52kh4ivjlRx0
         2LFjeBCRmmYQsBemoIavUvNd4hu6p/RGmYEkBuOtV8dVkZmybdsbkMs2sfrlCwso6ZHa
         9M00MEjKQPmrhuBjNZ/rviz6aL2byrGKlqrgeCgPcuJzERldpURcF7tuzl4CtJDpn14c
         g7SvYkpGdI+OMeNSCvY/bwHZ3B7m5UY7s8pz//X/SiyLdzerqLAOFjflFtEym+nvmiSx
         qETA==
X-Forwarded-Encrypted: i=1; AKwUvBx/YL+XYrBpSBQdRb4qChrxwxOouDherm+hN2i9eL5P5ppn5QwrZy+ccG7ELpNFGj2x3q+d5Fg/8dYz@vger.kernel.org
X-Gm-Message-State: AFq9FYIh98gU7sAF5efM9MTxcdD30eSuy90DwfgvbgH/SqlKP2rgkU4S
	/VWSPGU+o+Asdn27wOPDBmWyxTQHsK4OIjp5emvjvsVkqmBNIf5MQYQx
X-Gm-Gg: AYBFou0Ig6Z+OMYaUhEpx4vNX8RV+cMb6i84HIPJuBcTyoqjhQvreoC8cbBGYUgaDDL
	E3jvQUnJtH0Q7s/U5/75brQXwAe0tRroBCQA45IvDfJ6Gyb8PL842TJYkW1Lw9IgZhJ8S8TcF6h
	alIYuHl62RDOW47LNYw3LSa/KAzNtUs+kGIS+Zdd+gJQjkZE7guZZpj5Ex08+QTlyz74By5Zri0
	0ZVirCddNYkvhUyLCHmdr7W6XuY9LFz48+xezPUovmWMvzYf/+tRswypZZALNVocBoVGb+QKWGy
	WtusuDcGpQOQjeafyd/pSYzZOEtkK2J3xwAPLPXbRPUE6CSoOLjtxT+VeDR1dk5zn6sz0viSvO2
	Dc1UIuvVF0GsdiUguHeKMsaM0ImNIlILGNduAKv1+OLo9BEFt3PPS2gd2hTtLax3rTyZXsC8Qoc
	8ZYfs7zhdq7qH+7Mn+xRVWsImWWU2wcRPeinqsKwPEWC4E7RgHW1Y+ZQkoDqJ0H+OSeWCbmHw6Z
	8LNwlQP3SO1+p4Vp+APgKYurm9JAjh7KQR8AQefQtijWvYWc3EbqWtmSAgYFeTt+0ozVyGujA1g
	fADDCToM0O6lWCiwC+PqjO5zxj4R+2ODPr1aO4ISPu1zLE8JA1VvOr+xMIUjpsNf3CWUdIxooZM
	MlOcls2FV9tnV9nZiyYB5+pc1pTibw15XNrw7YSJxMIaVZ+Pt9jLwO0dLHs1WIXR4Qw1eQnWmXr
	/wb3Yi
X-Received: by 2002:a05:600c:46c3:b0:4a2:fd2:9855 with SMTP id 5b1f17b1804b1-4a35acbd173mr173946805e9.13.1793084093615;
        Mon, 26 Oct 2026 23:54:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a4cb7bece3sm189318425e9.10.2026.10.26.23.54.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 23:54:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix NVDEC boot on Tegra210
Date: Tue, 27 Oct 2026 07:54:46 +0100
Message-Id: <20261027065446.97098-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261015-b4-t210-pd_nvdec-nesting-v1-0-39a36b622eac@nvidia.com>
References: <20261015-b4-t210-pd_nvdec-nesting-v1-0-39a36b622eac@nvidia.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 15, 2026 at 06:58:01PM +0900, Mikko Perttunen wrote:
> On Tegra210, parts of the NVDEC hardware unit are in the NVJPG power
> domain. According to the TRM, the NVJPG power domains must always be
> ungated while the NVDEC power domain is ungated. Model the dependency in
> device tree.
>
> The first PMC patch updates the PMC driver to handle cases where a PMC
> power domain depends on another PMC power domain (other than the core
> domain). The second device tree patch adds the dependency in the device
> tree.

Tested on Jetson Nano (Tegra210, 7000e400.pmc and 54480000.nvdec with
nvidia/tegra210/nvdec.bin) on v7.3-rc2 (5b0764a53235):

- Unpatched: pm_genpd_summary lists nvdec as a top-level domain while
  nvjpg stays off-0. Writing "on" to
  /sys/bus/platform/devices/54480000.nvdec/power/control immediately
  resets the board into TegraBoot.
- With both patches applied: pm_genpd_summary registers nvdec as a child
  subdomain of nvjpg. Writing "on" to 54480000.nvdec/power/control
  powers on both nvjpg and nvdec, boots the Falcon firmware, and puts
  54480000.nvdec into runtime_status=active. Writing "auto" powers both
  nvdec and nvjpg back to off-0.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
