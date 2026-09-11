Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC84626982C
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 03:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097832; cv=none; b=Ziw1Yg75O5OMZEzgrjt+NFTaCbcM3hYNATScWgryKBFj2kLULcrPvEGxkaDcZXkth7iIZ/HZONZwNTKyZs+JPKVoNkj6W8s7WruJgF0+FUxzkbpjvnac2OnGkneKK5X2AB+FxWVi+N8sMMdxOMzmsxQStlMtRbM8zU72QCpilSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097832; c=relaxed/simple;
	bh=jnxbrAUNCi8h68fjyd8ZlDlk84mac5zqMfeH9/mmBI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjR8ojiag+0jdmghlCIPWvUviXOVtF5RdzzXmHlDjm6J/vYEu/S3QiwvbnGQMExfLdiucFtEkPfnSbIrUqpo3cubkDm1Yi2Xm83LFnHCbildDrw2fGeyp87+fxHjJWF0YKT3a0PceKDp3RYabQqpJUMOvrYKeu+1JbaQdfn2wCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkYW/9qB; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkYW/9qB"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398e9698a70so500558a91.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 20:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789097830; x=1789702630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vTrVSBkVGPXm2gcTE8fmlqXbs+T/1ViJad0b75wnA3w=;
        b=MkYW/9qB+6iLfHw0caDUOAaqQ0xW6BmFU5TPmQLgofu5E8WvDUpp5SCiYDV0OdmClx
         QM1OvYRzSzrnFztyGMHisZgzsUxP63IUL5u4qWYFpaaJOQq2krPJ4mHy+4sCsUmLWH/p
         AQHaq4hneBsoqeSS1ZNjvw/cM1lv5Z8aj+8reIWneQC5tzHMaznaXS9RMz1KcAkI0IaT
         pDIDX+c0TfdTZ1Lt3UTaNX3gxzBBXYxAf7SHdIyK/dSIwILSCEaRsJVUUuFqqqHQyafA
         xFax+V3/bVFZzVf0PIAKz7yWBxfcSzlVJOoXeuH+0nrxFaXT4BXFrqzwiL5ItwDbjCnJ
         ri6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789097830; x=1789702630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTrVSBkVGPXm2gcTE8fmlqXbs+T/1ViJad0b75wnA3w=;
        b=F8itKlZ56bPD6Uq88A+GmOGd55leJ3MdM1gBqn+lsCUsLEylzywqzdfiqJr4cTAiD8
         JElvlUcL2ATxWvfXkH8sXZFT2xcIoFD7xxtPP/pMKymeqx6y50l5IDmYqO8yxah4iW69
         Ckr1O3z8ftcNEpo9/M1195oyjKvoY+QTbIhJ9qfWMOynj/vapMSMLudOoCcxh4L22R0F
         5OtRe9b0kd2Rpv5dQ3i9Pmy7kry3TPSaE0AzvCFU1SBQawNRd2xjypP9s6HUldvNWnyf
         /SSplvMajBQTsnxNQlPFHKz3G0kw01ts+DxrIv3+u5EQhJsUYXo4Nsq/j9znRInOW9to
         yFnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxY6BzK4/jXfCJNxwQRqP8qb1qvtxz4oCnDLNGKmqtD1XS4q+/DyINiUzo93lshXWl3oI42+1LhfWFr@vger.kernel.org
X-Gm-Message-State: AFuF++leywuUqcmMEgldVKsEKzz9jfD++35DMA73SSCUyAQhFUDOMFrH
	kvVTRfX/VD5eqypbuOTjbfluRNPIarVzkQWotywA5+WLoGs29ytU1YaJ
X-Gm-Gg: AYBFou0e1EylO1ulZd5YIvBhrrkCWkaAX/wcHeWYd6UJlI/GhCmxxkfJC1q1Jdc3/+T
	wcNVTREskMX+3lcD59JbND5YiDB7R1dFXBqxVFSHdM/FSP9h3fMUuXJzhMyxy5R24bwaQW5EX4b
	w2qTJMcdbOw41QMcnQ0dW7m7+GmWGOzuDa+khWj+x5ccSfOOaJ72wmFIHr9yBm5gENDAQAjPhIs
	IQ3/Dtzi7ZhlDFzko36aOs7N+x9E+J9QKTbtbukoHcz5B7QVEj41EHA5bygjlc7PEChSaEJNkn9
	02DTmSVmizHkNunVD7h9et38h23cr9KdCn/OviQud4SXk3+a26XYvcmbmFsG9egu8VIXM3o2qe7
	VrzyDpBy8AsrIrLmMx3ytCgooGB3tCdjxiU6BX2zdCxt+TPg8QznZkVd8snq/2KmQQ6cxD+vF2C
	51r0/TIUEfHtP2oxUjnv80TK33wEZ93/WYxHoufreH9Ol4LBfordj+Hmf6rSHebPWxkOo21KtwU
	VESrjosadpfsG7Rz+rrriA=
X-Received: by 2002:a17:90b:384f:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39d9c1c016bmr3307088a91.12.1789097829777;
        Thu, 10 Sep 2026 20:37:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95713602sm2537488a91.11.2026.09.10.20.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:37:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 20:37:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zakariya Hadrami <zkh@mailbox.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, zkh1@proton.me,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: watchdog: mediatek: Add MT8127
Message-ID: <8bd4787a-1666-4f92-960f-287bc3b918a6@roeck-us.net>
References: <20260910-mt8127-amazon-ford-basic-v5-0-3cb9eeaffd5c@mailbox.org>
 <20260910-mt8127-amazon-ford-basic-v5-1-3cb9eeaffd5c@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-mt8127-amazon-ford-basic-v5-1-3cb9eeaffd5c@mailbox.org>

On Thu, Sep 10, 2026 at 03:29:12PM +0200, Zakariya Hadrami wrote:
> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
> one.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>

Applied.

Thanks,
Guenter
