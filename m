Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83A41D45E8
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783769970; cv=none; b=BEqEsZ7CPZW5/BuW8A0kQ+8ApKk0vpZX92/S7ygyQGER+6A/bHHL4b7IMRXPsgBCpYgl8E2/CqxCqEUT41tWRReQsZ/10KSy8kSLv5UZkmAudT2WUNvO1xZlGBIghhRcSGLV8I3vmY0zIbU733NhEX4MrHXRIzfdYdVrlIqYYYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783769970; c=relaxed/simple;
	bh=/V9aJygM45xNNQSX0JoGwGv7gQeayjRUR4gf62fYu8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzPqElmuDr2vNatYzNcGKjgyqjnk7zsJMzCuEDsO0MTwaoT3aJaJupoRxWg3EnLi28K3DXzD6FG0mH1fSPS7WjXIRzdXSaEweyVY7l7gGqiqEyqRFhfXXv7sdTphbQ4qrOEMbEFPUf+YmUmqcfPmbRxNL2KQH/AZQkt3CjCJDWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOXfdfMm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOXfdfMm"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-476a130c138so2117350f8f.0
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 04:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783769967; x=1784374767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZaWhI2wQ7rol4Vu9TMGFIS5R1vwCn0PiFCfGw57BvxU=;
        b=tOXfdfMmIudTw8IvsCuJ1rFZBSHa0VH38jd9UJzzbh3/ue5xU/C9LjptEHblia61B5
         3ZpyciqglJj4tqg6jH7UFx+7m/lrnGpNru4P0iVV0D3SIoE1b7qSZTSCLFsDuzrp3T/B
         K+PheIO0yJ9s8LxHNTxKVrQD+BFEhFzAntNASMFVOeXNGUjsKrZZQKUGkmH/gPKM16U3
         5gt/PUqFI/miP2RMBbEPR0b35w6ANHW38EhQUP9vw1ifBRsxpKmxNKgjCbFnrKZdaeSU
         XUC7fFJIW0hm9b/Z/Efo1IQwvIx7lzkiW1GOSrHKPT/x5g+1LYxn0dul+HQLR53rlANj
         aRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783769967; x=1784374767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZaWhI2wQ7rol4Vu9TMGFIS5R1vwCn0PiFCfGw57BvxU=;
        b=tAIDY1CrziFvlyw8fcMyslhIZ4cktrD7Q7bw1ilzkpiJmANMuPP2d6it5K9HXyn0cO
         MirJg8fwGbZCyJpwNzPhs3fbM+FkLnGcOkkqSyNklvidWFqAlBtt7LVB4PPokHYTNbtq
         hxTfwOLSeUp7fx4P4a6zeFB77MlcLev4UXc5WP0/J1nAUoLhSNWaGCOEYjfWPehYjI4R
         y+LPmC4CQAtNmBMqymvkaVUvByl9XCY5mDcDn4iUM1D+Zeb7qbv9faXmS71aGlNZ+R73
         OytdWG7b4mlvJgna2LjO3u/7RDr/pG7CnSXvcfsE2iB/sCFOOkwooYP+ABZl5K4MpYGJ
         UWOg==
X-Forwarded-Encrypted: i=1; AHgh+Rqr1jVGVzAtV1kTQWjfTZE3zO/Ng9CXi8WCoHDqygd4olH0k3MDyxsrsi5S9f4DxAMDinUUbN4qPEUE@vger.kernel.org
X-Gm-Message-State: AOJu0YwAWX4wpXnDsq/hWu0mfrfGJ8kVPJyoYq4lYyVOZWTk3BwxNnxT
	5Vo8Vyw58RdO/Ei2QgsCZmheGq3rerSjr6ZcuDzKPMIvb7fSAFyQboms
X-Gm-Gg: AfdE7cnRG13IWA7d3hGJ0vvxwveJ5l5xMeZRib6wFT+U2JRw8uCy9PnvZRZmkcPgLnF
	Ajp2hpnzn+ctOpfyVhYK84kBQ8oCAdgtuawo/6yeHtQ+T+E4nxVaRTFW8NWRBQlumVGjy88GUfp
	L8pkwYuwu2QdOQaEuAS2d9C7frRL7qB6gj4QeUnDJ7wBkauXoCELMWttQl+Mm0I6FAa+SpZeUf5
	yExNVbe3rSArJ49m/0TnNwmNMFlvjNW08P+jjC8FNkH0dKO3ueF9iHFJ4kV37MkCs0viKaIXMZG
	yYZG9zVQcMWQz3dKX2/peEN9errdTbR7VtQIZwPkbk1gachnxbOADHN3bXybnj+7O0GRI2prYVF
	tZt78IqDaFRvFjedHITMOO5LS/GAXZ36cqp1qu3+/3vcnh8a34PQkKh+S3v+Jgr7r3iJm3O/ITJ
	DUlJzYOZ6s0QQsOMszyrLQn2yWBMLs
X-Received: by 2002:a05:6000:2612:b0:46e:1815:6a83 with SMTP id ffacd0b85a97d-47f2dd1f23fmr2658296f8f.29.1783769966968;
        Sat, 11 Jul 2026 04:39:26 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b027:11:e106:f973:a70:bd1e:4000])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm69194942f8f.26.2026.07.11.04.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:39:26 -0700 (PDT)
From: Gianluca Boiano <morf3089@gmail.com>
To: "Wang, Sen" <sen@ti.com>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Date: Sat, 11 Jul 2026 13:39:12 +0200
Message-ID: <20260711113913.71220-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f814faf1-bfbe-42e4-ae0e-e34c7b2aad7d@ti.com>
References: <f814faf1-bfbe-42e4-ae0e-e34c7b2aad7d@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> +	ret = devm_regulator_bulk_get_enable(dev, 	ARRAY_SIZE(tas2557_supplies),
> +					     tas2557_supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get/enable supplies\n");
>
> Looks like all supplies listed above is mandatory in the driver, please
> make sure you list them here in the required as well.

Added vbat-supply, iovdd-supply, avdd-supply, dvdd-supply to required:
in v2.

Thanks,
Gianluca
