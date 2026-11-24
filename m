Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513998;
	b=acc5xz6GLP58QWQmCreBBlDEEoqSHZQU02I4+5D6OM3Nfc0kWZ9jHHW7bHlQBRtEOOX/
	 FrTq8KB82tp4+l6+0r+F32h9prZgTGL5ZNizbm5fcOEVS2iJQcU0cIzlAsL+H9siLYR0m
	 C67CN3hAFjCiEGeg2+L90AQEqhtAzx4QL7AdVo0FkE0gEVqXRxMqlCs7zbdRqXG48IQcg
	 5rHOk4NzEscz2+zMt3EJznKQ1/3g2V2VgrWWXveUhVVNOSWEQZy/6YlocwHG9qPbbgcw9
	 UO05IPO1e6Ezwe8gZJPCG35yvkyBb7kR/g7zl1WAb2zS7tv+eMIBPWtFbfV9J0W4caA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s3HEy2luFzOKtpXEMJaCVU6qsnBsmUBR+KRo1CZ+Kxc=;
	b=KXKVnRcRqt2vTtJvxt1MSlaQF2Anh7DW0Z9Ahwpps0SuL7RcKXbRdEIsfEOrwDUITPvf
	 uDhfF0z9gdMAmd/ZeG8O377UgDPe6dXfWeYSgtRzlPhs7RJMSd1lEgsDeJJCqlVGiBu8S
	 +k3BRsE8h3o4eB8D3nKDaAas0t6NlJ3BfeE0RM7PVGP2gTH6Xh8NWEFh/fKdbIcTYvL2o
	 bV28DEoDcFAsmkbYfoUWiE56ZhNNzhwBkAZ0oBkhigzJLcrHlrsc10dfVmq1DQqrHL7g3
	 v07M0MfqsG5h0+78GfDDmSCd5oghlFsXUpHsxy9Mtqv3qtD4VXOE9+ejoAF2JwDddXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=o13itCkh;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A34606A692
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A34606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=o13itCkh
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so37354405e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795513991; x=1796118791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3HEy2luFzOKtpXEMJaCVU6qsnBsmUBR+KRo1CZ+Kxc=;
        b=o13itCkhMBF029+oImbtjlAQZs8479YW9/eib40OcJPcvsnajrtdwXo03Nl5nLZkur
         TQLkW4lWYxsfZlqOKgV5tJwIzNZ6sbb3NkpvReSLnkPpwiROhhBib4JxYRLSBHnFhk8n
         cdeCvYAbGTzKLvv+ctL4RaUISRw26U8N95eDywwht0RlIp9cbqjbsFcpmBEP4pNUoXcO
         MqyY667zhtA571uVGj8Fuo14Ufa9S1EEqRzQSBplvX8L4W3vrmw5w0VPZDLKODCPPl4/
         nm5uZi4/9p8GIdYukk6ooqIxsbyyGDNczi0v7NTdw7ppYBMU+8vsPJ59nE+cF0q/bHHx
         SyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513991; x=1796118791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3HEy2luFzOKtpXEMJaCVU6qsnBsmUBR+KRo1CZ+Kxc=;
        b=Nienw1fmKxm+Y4yQklII34a/Z6ML6GHPqvXzSirnDq2VlaBRyKGMZung+wgpNwihhm
         ED5i1nSaT4RbaqGRfabHfkc6FFwiniDtunu2DbsobSAl6M1a1y9cDL1lJjZG29qroONT
         itOmGpJNlNsgEXrhutxNap/c3gPHyiDCp5Mfy0TYneSatdQk9puOM+2b+K4jlHxcPdrE
         +3Et7c+E+UMFTvwb3gJbTpEDtaYpdhTSp3SEFXlUeCvrkmump1RDL1zLX8OgCF8z8abr
         Vpy2eolLvilVDuKGFvGAv+2DHELRaXs4HXyxQ2ZXyYVWAqjeNSoKXMPSuIeA35Mn18hP
         n9Gg==
X-Forwarded-Encrypted: i=1; AL+hErFrGRkhHyGEJ9oyTZHMU2TROxDOIr7BEFatLfKzQGfKp0czd+pz0Oc+krQrsXI0BKSU0VgLDWP+2OVV@vger.kernel.org
X-Gm-Message-State: APuU4Z+UwtbZgCN47LaswIJmgshC7Eza+awdOgCBQIpR8OUGkBdp12CD
	NXwBxo1AJ2mByIpg2ndoU5urO/ulc79EW6CrcluY6Ih3BnFM00bQzsV4HAlNtWsZmaY=
X-Gm-Gg: AZFdTZcMWPzTyBewVY4+SBhkfkFV3vSeTtKjtodnQ0/9C6PCvISbMJm/PjmcVmU9FiH
	J0wE7vHMW4oERbuncNj84guKeySwqmagKjld4tdRV8fI7m1il3u2eEWTxted95IqnlwuhkiMeq5
	gTyIn4gSjXL6Cbjaks+CdmvvJwzQo92XD0gUNTgMOYo5hwNq1Ad/R1E2nE95Qc/ND9w6t7NtB0E
	YYKCBPFfqJLlcepF4KKxjb801vZlBPxw3dTn8ifsgYOXBRw2QLkyBUjFSJdc4RCNc2MZ6Fahpp6
	vHVXtP1CZQRbGOudJ6Elbca3tUbLErxAFcJJH3F3/3eR2L5plPp29LjNdamXelgQ74s0xUY0OkX
	Gll+N4TMwAZRBhYbP5MoYDkdN/L3p/Rn3XyrUaARm+5zP1bYeLYDjL5eu0pjrpijDCyKy6Lhgul
	M30is3C49Wdx+mARWbBNgU369Rs0r2/ycRSporoRhk01V+dYIvLoD+znvgfKAEbfnLdwvFh8K0H
	2QPf3schDNlDZR+jNfMCg3G3dF8nwtg88Vmwecgj6a3lTQeUuHD80BOKgfhfkpK1gIS4Ym1nx1W
	KNr84PKuhMJb3uinlEWEEcfdDLMRBSF5EbYrMKzSpWneYQH6+yW4yS0aKYnLjZyKU/7KvEmOuRR
	z5g==
X-Received: by 2002:a05:600c:4e0b:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb88817920mr309330195e9.22.1795513991045;
        Tue, 24 Nov 2026 01:53:11 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm435581505e9.2.2026.11.24.01.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:53:10 -0800 (PST)
Message-ID: <2fd706ef-8205-4564-bed7-527b6bae8790@baylibre.com>
Date: Tue, 24 Nov 2026 09:53:08 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 5/8] accel/rocket: add a GET_PARAM ioctl for the
 hardware version
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <cbb77a43deedadb6667a84bd1c57030cf1c9ce74.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <cbb77a43deedadb6667a84bd1c57030cf1c9ce74.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2026 00:01, Jiaxing Hu wrote:
> Add DRM_IOCTL_ROCKET_GET_PARAM so that userspace can tell which NPU it
> runs on. DRM_ROCKET_PARAM_HW_VERSION returns an enum
> drm_rocket_hw_version value, taken from the compatible's match data when
> the first core probes. The PC_VERSION registers cannot be used: the
> RK3568 reads 0 from them.

I also spotted that the vendor driver uses compatible-based matching for
this kind of thing.

> @@ -197,6 +224,9 @@ static int rocket_probe(struct platform_device *pdev)
>  		devres_close_group(&drm_dev->dev, rdev_group);
>  	}
>  
> +	if (hw_version != rdev->hw_version)
> +		return -EINVAL;
> +

This check can be dropped, we can assume that a DT that gives cores with
a mix of hw versions is invalid and broken.

With that change feel free  to add my Reviewed-By

