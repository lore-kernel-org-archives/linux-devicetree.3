Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4222B4A092A
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056955; cv=none; b=Ael+3+JNXqaWPOfDxW8jPHZkgcMUzCw4yCAUons6nZvZ58Zs7t15Z4yu5G2FPTJF+/rkAxoUv8fb7MWHn9ICNOWzVIF5ZirttfBxYWX6jzqrt+m6t9AJUNBJ/DYVuHG1k0X5MkIgLTTBu6DCik++NGQ6NFL/j38aixgzOJItLt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056955; c=relaxed/simple;
	bh=UTGrp+lZOAxLFmkLKsLGysXMTNUwZ9BjO56kp90DTuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVEhknAiBH5VZq0VRnG1EqHWYehziSAKyDZ6JrRF9aOfJikPBxe5krDdRqXznhIO4H5uVr8uot1cxcmrKeIFhH3hydetBejSboljVvAxU656jXOSJzBqXsqqm3QWAmzFY8OKaYzq6HmSNSq4QyhjVRAwJRU0Mqwn31sjKNYc85s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHJqr6rJ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHJqr6rJ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so601657a91.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056953; x=1790661753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQ3bgQN5Dp8+Qvmy62hDVi5O4cZCEw7wjVOCUUXKBjk=;
        b=RHJqr6rJLj0ADth1Gzp5fs7TVlYaC7iSRvFWsxRrSNeRF6snO6Up+q95yCrg867gd9
         tQ4uKmHVb6DER5yYJ5H4pIBlmQ7nN2T2nY+y+1k3rJI7rj1O/LPvgk0Kr3W0gzv31vdD
         shVbdE/5qVAHh2Fvojwki2cvkqBVWU42VSP0Dh+ESW7hTCdZDGkoJXPrlUnU9VYC7OBx
         w7XXdC60ihivG1UepRyAtbd9Z7dr0JY4TLT0Ncp7TzXDeeQNCoj4nafLsoYPwoW6Un/l
         RaJF+obAZuhob7uMBCXhII99hMXCrrh05xN6bEHkwkPOxenCCv3unmuuPkoJ3kfoTbrQ
         AYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056953; x=1790661753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQ3bgQN5Dp8+Qvmy62hDVi5O4cZCEw7wjVOCUUXKBjk=;
        b=vuO1EtggrpH9yw2fRs3MOBzeDILH6eLXSZzYiZg/iaLABN3yVJBeOpNPhYd6r2zk63
         sYmNMBM0OGq63ytmUGMLESBtEooZyUev5Bqf9YXHEqVS+6IiLe3WxHaWU9dMrhAQZ2US
         t+ktGAIoaOw3wtWDxMDml90/TtTCRb2OjFGl42b75v5RTM2euYnH+g2hdvo9p4JFfJ++
         mZR7frGgo4V2iFM5fvu170bepTDP01m0BtawA5Daprs42gH2hf8U7QZu5m9ShdoF2HXO
         VlcCCTV7nFqmZhGXtI9bX3EwNHv0P7mK4Jc4SyMPuBBPelfBRk46U49SEXaVpX7mx4Qj
         ANKg==
X-Forwarded-Encrypted: i=1; AKwUvBwvqsjK5UNy76RBA/fQQPubuP2XsubfdL1z0kPR9L9p06lrXUogswQvMIOEyMaYoW352E7Zfrg8ppju@vger.kernel.org
X-Gm-Message-State: AFuF++mRATu0xGdHGGkvClU9rvVVEVwSg+YE9PbcdV2yr7bcUSt5+ML2
	FpqaGxIRxLR2vTcIIiKpwcNIJzEdMqCM0sifjHFVamlZOTfsqzR0tVa4
X-Gm-Gg: AYBFou3CgLjVt1MVTQZzV76r3W2rfJDBYkJHla6WMO47ewcq7zWM5yWZhtB/egVfYjZ
	huBe+EVmqGRE97Ero13MRR2MCShJhCJuPaenYiKvO6FlL1QOTqJ18hActj1RU1CZPq1GlwevhFo
	NhCr4qUD8M4tkaestRV37jorKSju+2Iz/s8Z/qNB9iXWuZfkiEzg+Ym/FPsgCEUuQ7FIJ2kELmB
	P+PWstzFnPlckEkjea7OerDJG7gfmDYq+by68fNN/yydF86P1QLI0Tazp9ACTN6j+OKm/Hb8KYC
	l6qJpTpG2lKVcEorZqnJWKv6dIqDRPiGdJjzUeSf5fA6Veb60lIuWVy19mE+gO7uFLvopiQ4Us8
	wr0i8DY2QKCa2ovYCOJ3kLZkMwYiW5sWcpmTiqdfqTE8fjeolGgQNw3slyuY3FOULh0GMBzGR3X
	E8vNn7awPIuPrCxz7B0H5WRijZrspmYyfh8E+6n/FVkWaITezXtVaIXwHNuwG2S0neBbY8sKIXA
	bevVD/3pIUHenMGA2s=
X-Received: by 2002:a17:90b:3fcc:b0:39d:e78d:32d2 with SMTP id 98e67ed59e1d1-3a0730cbed4mr111836a91.13.1790056953102;
        Mon, 21 Sep 2026 23:02:33 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61340e56sm3366245eec.30.2026.09.21.23.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:02:32 -0700 (PDT)
Message-ID: <976f828a-bf48-4788-adb1-7204c27dda60@gmail.com>
Date: Tue, 22 Sep 2026 14:02:24 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 5/5] ASoC: fsl_easrc: expose individual DAIs per
 conversion path
To: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
 <20260922033428.1690822-6-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922033428.1690822-6-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 11:34 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX EASRC hardware supports four independent conversion contexts
> (A, B, C, D). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_easrc_dai instance with an array of four DAI
> drivers to allow up to four independent conversion paths to be active
> at the same time:
> 
>   easrc-0 -- ASRC-Playback / ASRC-Capture (backward compatible)
>   easrc-1 -- ASRC1-Playback / ASRC1-Capture
>   easrc-2 -- ASRC2-Playback / ASRC2-Capture
>   easrc-3 -- ASRC3-Playback / ASRC3-Capture
> 
> easrc-0 retains the original generic stream names to preserve backward
> compatibility with existing machine drivers and board configurations.
> Each DAI retains the same channel, rate and format capabilities as the
> original, including IEC958 subframe support on the capture side. Update
> the devm_snd_soc_register_component() call to register all four DAIs.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

