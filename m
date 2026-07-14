Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDC93EDAB8
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013097; cv=none; b=rCcOSZhcsutawJmOqWjp+D7lvELgOpwXLAh+lNYSjkyNB+HLUw1zXPp1FQzB6UxAEOw2oWFKKu7S4vF80nKaItfXdae0D8d+9u34ervh4VeSokMpd1OLchMaPXUjTiTg4wENvI1f5E1dhDBnzWp+OQOVjBh9YgXkPLr51okDzxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013097; c=relaxed/simple;
	bh=coH8VC94/khLrpGYl34wxhGzd6kX96i3kKwq65dq3Go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kf7S/eHL3wsqzHAWnYylhDVb7ugiA+uvrW1y5tMkM9RtxCGYB2gcn1qQZJfNsbH1CIGbm42jKJijOeDmvoA56uyxwGStJCiLUW6z0lqpScexo15Y3RAQverS2VP1ALtFdFPXH0w0/fKB5v47aeNOJok6Tp444SlV+elH+0MiFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJCfxaMG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJCfxaMG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f75f7172so25793945e9.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784013090; x=1784617890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZwJYLmaCN63FrHksr4D9gyqJ9UQ3ZjFepwTLBT+MyQ=;
        b=dJCfxaMGqNCJqPHbVgLWA/hi3TkJGZKcyjwXHE/m6i8L8iVd/Cxty5flV3LKYdsstu
         9OolDHB/hJiyNCYjGWsdoNzTcYIns1cPsBP8WyDpX+g/zRHzHbdsq7biQMhl52NPKmEE
         QOtmF2Xo3t6MW0DbzwbOddzOdhvQEG9GMgLEeFZbNBLnqoP32B72TNAPiHAx3E8++QU7
         NpEcT6ZhhmrS3Wd7Bign4MWfped67BJW++u3G3ddAILPJFGWKqfU4jEJqjoTwSC0Quoz
         bW/To/lm429juJFAGknIORTLflKE99m091k3xYK+k0Pk+LJu1v2jiuRTH6trIT8wxpdW
         vMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013090; x=1784617890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZwJYLmaCN63FrHksr4D9gyqJ9UQ3ZjFepwTLBT+MyQ=;
        b=XFQxfjw6OuJQbNtq2UDkYvArmzgKylWrh4HBLyzwPn9bXzCFPq7kDoyT6cbAL8OZH4
         5yCYtp1TPf0hY4zZvnH2i4ZMVQqn4545KK6aCFwZ/76/0uXWQ/i2kChdmx6tK0TKy6WA
         y13dOUZmhXwhIuonlFF11C7YhWKz9zRAwyuy6K1GPiT6dp/ZEz4tC4xiKNu40bFJ4BCT
         xX1yYg1UkfrR144kINSgKlpoUXTtcxBtnDpPpnbznDlISGMKi9C1+8X0TcOrkaRHStP4
         oz5q2ogAzIuwKjg/kyYnAsx4rfdKaXmsrkj4zDZMW7mOQq6+gjBzkc0iy1Ks2Z22Y8b+
         lIjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqAk7WPsKhgUfc2j1diUrAtqGVW4Yo18paovkPaFzKZ0qFM1QYOuSJTewLFagCnuAxOkqchfu1boEG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2CyRG+ML0Eezr9OBlIcwYY3jh2ZW3XKNH7QqB1Xu+6KFbA5Ze
	CuWTThVHheubTGCRjbvmg9Ln0Om165g7lh87M0wI9timdGVti2xtscWbdlgzJJewNfY=
X-Gm-Gg: AfdE7clS5Dn28c0L9nz1acIbwabfi2wE2afS3heHYS2+AoAJFZYrtNIfIh/izop2GM4
	2jbd546An3iLaDcLWMmVDYeMD0cbsmlHzL+evALacppIMC73xtyhdJNUQ0UA3OsWpUx89bmZCjO
	hVGISs0jnA7FjEUZrojf15nsq5EnfoVO4F6N6Z5TmwkdQ0b2ShR4k/itjHWIvsxDy9aVLNmr2tW
	bVBloWe3dgv+VW2ip5ya0HQHKis5vldxsg1zjBvvJusDd00n1MT02G0deZ/NRHRJPhRmwkf0H68
	hmVSZWQf0m3nzdzYAOZ8JQfMeOd3qfDtahmtWnm2tVtUes3+LWiQMEIx0aO5xp7ai4W6MU4/6Vz
	rMgWrOdvmlziM5TbQqREaCPoZ+zbmcYAc/emqxVbWnRCDR+ts9BsN0XOmj31nlf0NaK01ZfsaDu
	j1eYXcXzNSnWKMCoFmV6BTiPJv
X-Received: by 2002:a05:600c:4ed4:b0:493:e946:c0fb with SMTP id 5b1f17b1804b1-493f87804fcmr139236605e9.0.1784013090553;
        Tue, 14 Jul 2026 00:11:30 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:6c30:6cbd:7b12:2745])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49506a1fbcesm58016765e9.0.2026.07.14.00.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:11:30 -0700 (PDT)
Date: Tue, 14 Jul 2026 09:11:24 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	chris.lew@oss.qualcomm.com,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,bam-dmux: Add
 qcom,shikra-bam-dmux compatible
Message-ID: <alXhHH0mGvFeUMd7@linaro.org>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
 <20260714-qcom-bam-dmux-vmid-ext-v1-1-3f29da7cca76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-qcom-bam-dmux-vmid-ext-v1-1-3f29da7cca76@oss.qualcomm.com>

On Tue, Jul 14, 2026 at 11:02:31AM +0530, Vishnu Santhosh wrote:
> On platforms where the modem DMAs into the BAM-DMUX RX data buffers and
> the XPU enforces per-region access control, each individually
> DMA-mapped RX buffer consumes an XPU resource group. With only ~16
> groups available, the per-buffer mappings exhaust the table and inbound
> transfers fault.
> 
> Add qcom,shikra-bam-dmux as an additional compatible for the Shikra SoC,
> paired with the generic qcom,bam-dmux fallback, so the driver can match
> on it via its of_device_id table.
> 
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

IMHO (the DT maintainers might disagree) this is not a different
BAM DMUX hardware block on Shikra, just a different firmware
configuration. I'm sure the existing SoCs also have those XPU blocks,
they just don't make use of it.

Personally, I would rather describe this with an optional "qcom,vmid"
property similar to your bam-dma patch, allowed for all SoCs.

Thanks,
Stephan
