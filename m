Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52747442B08
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838598; cv=none; b=dLOiILKZDWTPV3DuGogaiTrgeG5wTWfZl/oEJUkj1hOucpEBiAj6WThZ022R2dRyrBdyzxUqadbEcaV+d0ztNY5XTHIjkNDZG9mlvXbvUTNx9JVibxd875AkJ95YV65KJidBIXsoRmNoWF8ZKbn1ps6E6B3eUVQCGGagysNfhmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838598; c=relaxed/simple;
	bh=7f+4mzELTObpPjWDb2bQLAcMvXmQA6lI634JqMznuyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXL9395pkB/kweh2/S+KhuNKk8XGq+lzJvcSIRIWsRRBgfRSvgYwSU/TLEFsnykVQg7vF8C+9Z/UqcAw3XX6gEHoeJKNWUnZSudqyjxCH9wY3SKTHgyfXCkTHDlly2iGMXpJ3an8N355A67GSujH8tamk7F97PITfHkqxQRyhJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqTCB/FJ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqTCB/FJ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1105237a91.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787838597; x=1788443397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZcqJsOk8WyALrofDgPKRhkK8TJsmoKsFAfVulwjePPE=;
        b=pqTCB/FJx7Ds0Y8GAFkIPYENfJAg76A914YUq/vrCSMp8nmW1CMO1l6nIs6IQmwyvC
         MBXoir4myybcXcmaU67ICh9sWNufwBGvP8vzxN3/FBZwfOafzpW1PcXin8trFA4vwUPB
         L1PMvUvTz+B9npMpLyC3d59tfiQOwQ6R6w/yyyciW3Bb8bqUmA6g7BVuuLSHXM/6rPIx
         jgdfi80Z3eLJ4Xk3a0BQGrTv7SyepE1LiCMrsMC5JbjkIUZmkCVc79HeRHBbR4h9nAzi
         rpKBUXaPxHqLse34y6bvKzqJl7lHp/lPO526H160GUVD+KUsyM2AWmXSKDjb6IMnITWd
         E71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838597; x=1788443397;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcqJsOk8WyALrofDgPKRhkK8TJsmoKsFAfVulwjePPE=;
        b=b178HMpXcudq5maqtwKlNo3CnIW21rSkTp06t+Lq3ka/0c2barFFCNjctWXRMl/gaG
         1eWMol+jDRGbvShnCzEp3aM0s2r7J0OSdGKLA532pEyC6DidCCGPGJafw4XgrcFKFhjl
         lrgWqZB14J8UnkJy4MfWRkv1Z3zIos5ezUWv765tgUknc9E4AFtQzzOJWu66xvfGJzwr
         8aU/95cU4Bl9vILGskLRQSZv6gPakUHnsMuJQvTVR5VP24eimw0NoUeoWV5Ahu09c79Q
         Are+eSDyTC18X00E85Oc80pgdE3iwQ9q5uZnUfmwtqv9qtrxBQeSWaCfvwQ+8UkQ4ZlW
         XbdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGdU2DOxJyCKOQzsr4WlnY0RrrImpWTdh09CKVpcmiWjpovSB4r/IkpvwlfrJtRcTsuxYj3AXhRCFJ@vger.kernel.org
X-Gm-Message-State: AFuF++l9zBRj25mX7Thz5JhXJJfAKk2QcXJgvJxRgAgaMxccspYesxQ/
	WLJocq0qJuRsLWg5s3xMb0SHngR8kl4G8RM+TRmwE87qtHY+FbQcSWV2
X-Gm-Gg: AR+sD10T/vedIes6UnWwFU7NpXsCDEKwcJk/KZC76G8w0lVVLz2f7Pa1XLf/NgwExU3
	qNx2/OjYr69PzBnX+HRk5N8G/LfEd8Dlw+0pQ5ehij5sQXcWWx8iokHmldEoiut14lWPlbS0JSB
	Ssv+gmjKhmggV3njNP7vQ+TxhxxgpwZpjHzB3P1Rn+nYSZC7X2sQ0dLrIoXDcSS0L3WOqM2hjK3
	qmwX9vJEbSO8zUYBJJFQFCOz8QsbwkWUkSHNFg6B04693JbrcJQ1oj8mXAbrFGvSL8EQPhxQJZo
	2Wf6195s0ttUIvJwbW25mcz4TipkSZa3HVUKC0u42XuwjU4bIx4C37XitNvJvP70QR6UUiz8Kil
	4d+vzQYILD29zpHCkkglj0FDYpgBm8WRWqkWr26/TjYFxPv3DLybWmsPkPqRMpf9u/cSnyfiH8L
	zkdt0UuzPz6VvYW1pYcjYXVnP5qzoOKydGXAv3DAZfm841yCijMZ1cc0MzFpMNVyR9p1WGUc87I
	w==
X-Received: by 2002:a17:90b:3949:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3966cde3f0amr31804223a91.0.1787838596310;
        Thu, 27 Aug 2026 06:49:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd55a4sm2941117a91.7.2026.08.27.06.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:49:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 27 Aug 2026 06:49:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: samsung-wdt: Add
 exynos5515-wdt compatible
Message-ID: <a7290d71-53f3-45fc-b9f9-f7982bc15b8b@roeck-us.net>
References: <20260821-for-next-lucky7-watchdog-v4-0-d070cee5009f@member.fsf.org>
 <20260821-for-next-lucky7-watchdog-v4-1-d070cee5009f@member.fsf.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-for-next-lucky7-watchdog-v4-1-d070cee5009f@member.fsf.org>

On Fri, Aug 21, 2026 at 04:14:49PM +0100, Aiden Isik wrote:
> From: Aiden Isik <aidenisik@member.fsf.org>
> 
> Add a dt-binding compatible for the Exynos5515 watchdog timer.
> 
> This watchdog requires a syscon phandle, and the cluster index should
> *not* be specified, as that does not make sense on the Exynos5515 SoC
> (due to it only having a single core cluster).
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
