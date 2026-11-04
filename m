Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793765664;
	b=3q7Qc98v5YEjFkH1EfATaRxDv8QZt0rtUrIGdSubkwJNdjEiCh/i5PNofIgfxlwC4lG7
	 TO8y3aNxGZfdVvVqNqzPz7o1Yzfsb8c9KTNRXp9aSgZQss9tN/QSSuUoUMPhpi8k5bOd+
	 GaLbdlSgbmurwgFl3zgiRbgQKC2FvVSJdfArQd2vn4jth/nYRDQCC1GEOMhrv1cox+Oc/
	 tdvYwpSTZvgPgZ55SzOsU4iw3GKQ6Xd+PV9mtl2+ur9t5/s5K6Lh2yQoeCZjCbhDywIyh
	 1MbfwJJKzb09wG3psCWPPX1k1LkO9aJn+G69dxgGLdbH9B0Jh6R/LiVj+JjG/d20hfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mo2jrEhx3R1WdZmEd8pAxQMx+AigXmp2SsMuSvDCixU=;
	b=P78qN+y3suwYbtk62QoRP2TNypC5+Hukj3ljP6pkjWP5xFIVRc/Xb2GPQkQmhq3PSlZ2
	 cu2gxs+cDp/wmy42LAB+syvFvYZ+S/Cloof2fvcTZL6qFEh0kTUVMAzUcMvpTVMtD7Afc
	 QK1G8u6rz8r5uxt1AccfDS6jBuDlCx+u9819LXvAiCizfyjXl7rTNgE89ee3atDmSCk8T
	 3853SzKtyhwboZhJQmvn0geFYRahaLilEfyme11/xMqVs06SgcPjv3LrxQ9BD+bsPPI5A
	 Uj+zK4vqI0M9jLa1fsNPrnXDwPyS9cMGD45hTuyj6L07W7BUoS3k5whorzO9mh9hwDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="bzqQDg/l";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C45A606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 04:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C45A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bzqQDg/l
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a18fc7a38so564724eec.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 20:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793765663; x=1794370463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mo2jrEhx3R1WdZmEd8pAxQMx+AigXmp2SsMuSvDCixU=;
        b=bzqQDg/lMGz6dfQ7rqjvLLWKj2SVqN8Lq9OKxulhAav2LnwZYXQdZpmC6NjI+BM7Fc
         mX2vXoYj+74+aTstbYN3ykK+SGEgJxP5l/cLySrg2TF05mjSHi/lgG5TsqZFgdvcPknE
         sBQzJOhoL1hBrSbDU4FFMijklZCS/vu66Xs8KZI0aSwRXVub/X9SR+frX5Z4xo1FVswG
         mfqBe4+jA0PESCQGHJDnisxP+vAV43qNDlMjuIHTuHXNTlC2hFXuaVUuRNVWp0kBQ7+w
         abaR+5oODDc3xKrGLv3pPVJavBHsG5mGZQgtCKl6D3pVWEXued21+12lul+RJEgZWYWj
         TiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793765663; x=1794370463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mo2jrEhx3R1WdZmEd8pAxQMx+AigXmp2SsMuSvDCixU=;
        b=gDlph8AOzkxCjE26Cp8GIAazIlr8hZ4EC+4EjPsH+xPOQ/W2ywpKeJxAURfzyJfLz2
         ez/Upn0kc37ryyAciYz7UwmsS1YXPLAuahow6/IZ9SbsOeWKv1KCLD6b2MOFB3z8qqU5
         DvLVulKJFl24ORJ7760u7DLiI+m6ndZZdlSFsO6VlzPPSasX1VDlwy4wuDoTX5hDD6dg
         SVEdI7HOJXYqluh9J7P73kNeGQ3NHK7XD27VzdzSU29V2zc+taJpCHEmXtaRRPoNL6Bn
         iFrq8kO4vrLdpLo4J0FbjKcSCl5Zj1J3NUTKOYQhoML5aPQbjO47wZ6CmR1aBvrza87u
         xeQA==
X-Forwarded-Encrypted: i=1; AKwUvBzP1Ve/l8WU8scZ21DdIXLPaUgd6cZPJLuQnZY085Z6T3S4IhSiIXtCzQZ2WWtDbbZpUzjFyL+zVW5/@vger.kernel.org
X-Gm-Message-State: APuU4Z+7ERMEZ73GiVpuplkp4HUDr7bbKqxeC/FwyZ+w6BB8aLfAw38H
	uOBwQKrltV5B7rcjm6tcINDFsOxzm2lm0h/KeuqkkCdrQeJJvSpz733J1mbRER96Nn8=
X-Gm-Gg: AYBFou2155erAoWTjl4GTgIqSJT5U6qQb4N5sKBJKR8HF3GQsDfV81SCQ9vYLdAebBm
	6/9IToGzTV1l2gsjPy4VinaIdvtoNOOVVg0K4HXIekrUE5YT4pkCFmfj8syRADE2zocwcgCMJWw
	scnGYIV0iSfcfZmosoR5Ic8mkEqCv1KspEVDRdm3aHkJgRq+Rl24LfKjV41aGGcSF3QIZDOrhid
	ql6AyqA9vfBRPF6YUb4Ootcjq0ywee5Mw59pFk45gsvBXpNce6qu1KM/xPWSvA2ApixgNULYuMe
	Xp6w22OQfVowL+6nmFpbh2IPDRHUuIL0CO4q+qERJBUA3OwPtnuMhcFjdYvqyhNA3Z2fiqR3d81
	I1qn/OfEf92IiiHyfgv1fc16pDHJfhwgsZTXXj/XeeFUrS++erpyBlpFK0IvLE1EgTLb4Jroo/6
	Y94pxN+SOQrRI6NWbTNgANKAIPrliefHmF4892h4RfO0TR73rF11HXDv8+8GdTyPmIKd1rjOeEf
	bGk3fSnattAo+94AYleubC/F+QBi+GhcZp4YtjbTLee3tWerSwS/4JKygSsJKL9ju0yza715Tu4
	xs8nSZVU1mw7MPu2oqKrgwxGVJD0rQ==
X-Received: by 2002:a05:693c:6316:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-36a7bb74690mr6683187eec.34.1793765662314;
        Tue, 03 Nov 2026 20:14:22 -0800 (PST)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca394f297sm3541017eec.21.2026.11.03.20.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 20:14:21 -0800 (PST)
Date: Wed, 4 Nov 2026 09:44:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: opp: Allow 'clock-latency' with dynamically
 populated OPPs
Message-ID: <auqxGmYmQpWVXNeC@vireshk-B250M-D3H>
References: <20261103224538.877008-1-robh@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103224538.877008-1-robh@kernel.org>

On 03-11-26, 16:45, Rob Herring (Arm) wrote:
> Tegra210 builds its CPU OPP table at runtime from fuse-derived process
> and speedo values and built-in CVB coefficients. Its CPU node therefore
> has clock-latency without a static operating-points property. The OPP
> core still reads that latency when initializing the table.
> 
> Fixes: 80728bfa8c79 ("dt-bindings: arm/cpus: Add missing properties")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/opp/opp-v1.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v1.yaml b/Documentation/devicetree/bindings/opp/opp-v1.yaml
> index 61c080e50859..3dca8f7f146d 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v1.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v1.yaml
> @@ -24,7 +24,8 @@ properties:
>    clock-latency:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      The latency in nanoseconds for clock changes. Use OPP tables for new
> +      The latency in nanoseconds for clock changes. This also applies when
> +      operating points are populated dynamically. Use OPP tables for new
>        designs instead.
>  
>    voltage-tolerance:
> @@ -41,7 +42,6 @@ properties:
>          - description: Voltage for OPP in uV
>  
>  dependencies:
> -  clock-latency: [ operating-points ]
>    voltage-tolerance: [ operating-points ]
>  
>  additionalProperties: true

Applied. Thanks.

-- 
viresh
