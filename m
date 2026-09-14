Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F69749CF26
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399658; cv=none; b=bF3EZVC4xlecysFceocvyKyPYgziRV8WYrQGhmttrBOBDQCC3qWwgeJd68ndM9MYCEtcRU++8ck+usKD/v1Ko3P3bfP8QEwElLnq3DzDcVc3EtUwxv/mp9SHvUW9c66ZU42il3w0PBn1CLPb1KhRHnOu3LwDOKbScTvApeVCwME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399658; c=relaxed/simple;
	bh=ZS6o/WSKtEv+tq7yhpuj7HzqHie5XNyiWlWsjAP+xCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFXv5jMM8gRnvEwlFd1TIMa4Rv5Crs+5wM5qJXj1qR6CCdAXnCChIh4lfCVnfvIwNE8dnaN7mMHF+Pvwir12/VMkpZk3UHCwB0EW0exH4GWp5ydjHIwG7WHjYTuPPsAuZtz1I317uOp8ODre6IMFjOeTQM3U7wBY1cSyRK/0vk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJoGEX0m; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJoGEX0m"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db22383fe8so15381895ad.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399656; x=1790004456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PfRkneusuDLpVUWSi6geaiexHAd3QjIrlrdoCv9lokU=;
        b=KJoGEX0msOBtMKlBpSKqAIUFslkNytQB1JCAN+tPMCPdP5KTBiQmYuJRTeaMl6y5XE
         SXymhypvC7n/GjSYEiAEjgmQ3qtqZBK7xcfQ1oarzEhEjHVldgCp8cXl0bGPXB0kxs5X
         nAB6E4b+Gaf73gbNTf/oLzUFw9QFDmQVu5tfVCh+HJXx/lqDiw30mhmiNtmL53Wk93zU
         7uGPANZQaz0cWewU1AxiZW4MYFhN6Tfb32bmxn2pHA+sB/XTELzbHZhfH69abkOhXN4Q
         hBoHzsJoRsV9/g+Ko7vf0xCgI+fni7++i/L5qlSM4E4T/J0BJpqGxR7k9op9v2HBNNpf
         dpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399656; x=1790004456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfRkneusuDLpVUWSi6geaiexHAd3QjIrlrdoCv9lokU=;
        b=P4lI5PMgOCmcBg4joy9pK0mZ8An6OmfWwXbDfAW5ypJ5q+7SFyjfLUtPgMgD6OhNIv
         g2Tob35cJr3KszRbASQ9ERxlby0dIsq1HoJcE0aqys+piXtlB41QZY7y1yWafbO4rAKC
         14G+RjUACbKY//32AsnPiUxiI13rJbAG08oloKSA3dw5Urm+q0zjIb2XueFfPdrk+60G
         rA96b+K4cM4ro11i5E6TQZxhgTIG8YrvGSoNwmWvIHWe8cc8wtgnPhR4nv2/P1FuhUUm
         1AO0t59SESBPKeAQuvzEvSkJqKPO4LOjRx4jq4yLFo7CjhEgwi6S2aqnuuDZwI3EDcac
         +Fog==
X-Forwarded-Encrypted: i=1; AKwUvBytrxcOvY3dN3EiWUasyCHBz7KJP1ETeV17mhsdt93oUHx4tMvBywX1m9ZlmQtQh3RsrYbqYiMeo3f+@vger.kernel.org
X-Gm-Message-State: AFuF++laiNCbwgn2D3gJ3m+yB0N1o8zIPWelOg6aCurgMXHQh7ojdqnp
	QVbSOLCLdDBJiFUYrx0tUKzV0J9hQXn8I07laZNTv8AZLCxHpLjkiLU+
X-Gm-Gg: AYBFou3xskPP9zy1ZuuGocTEQ9/bDuBApmNLXVPW2xNHNau5b4UU3RSxJzXnYsqYrnO
	ifU8q2zQW6zu3bRg7b+09a7AWc7ki/5XQlx/pJpSiOeDx1MtiBeXPmN8Opx170jZlPbA1IShjEn
	edNlIPsm9qdrLrAfZN3dDVyzCqD3hyTvVfV3cTAhbVdh0yrJDBSrGGPdaeDOGlAdNW5UYshsWt4
	otehZj8CQO1TssbapMtIbFLUdUgtLJbuypzT4DysVKyR1UtXl/skehenLzAkfTFrtX+F7VdmKLD
	56lmigOEaqqdeJYXnrqNQ+vcVT7I22mi0ZntIclRUcRGmLSFcNFrhiYE2ibv0cwt/Pzbeep2477
	4ESURlZe0oODfZlRDeQBsTneb2KWQcg0nIrQHnimlhPI6+7vHYdGlzEpX6uyE+Oh5/XmzWa3Kek
	I70E2CaLPHsJG/cBHHMNDD41Ok8pYCDHE2B7RWAy6I9dk76wJViXA1vYy69biHDfOM25Csuxqxp
	nMOxN6LqW2E
X-Received: by 2002:a17:903:1b47:b0:2dd:7549:39d0 with SMTP id d9443c01a7336-2dd75493c43mr14817515ad.18.1789399655793;
        Mon, 14 Sep 2026 08:27:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ce92e99sm51522035ad.25.2026.09.14.08.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:27:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:27:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Message-ID: <429a3f35-2ef2-4e92-84e1-be605dfef31f@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-3-522def70acb4@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-3-522def70acb4@linux.dev>

On Mon, Sep 14, 2026 at 04:18:03PM +0800, Troy Mitchell wrote:
> Add the Sensylink CTF2301 temperature sensor and fan controller to the
> LM63 family binding. The chip follows the LM63 register model and can
> provide a thermal cooling device when #cooling-cells is present.
> 
> Do not provide a national,lm63 fallback because the CTF2301 is not fully
> compatible with LM63. It uses different conversion-rate encodings,
> extended local-temperature registers, additional fan lookup table
> entries, and device-specific PWM and ALERT/TACH configuration. An older
> LM63 driver would therefore not operate the device correctly.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter
