Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00954137BF
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791024360; cv=none; b=Fxv99rkUqaYLJB2LguG0ZBEkqmdgBeEU2BfgsBrKBzxGr3+gHUXQ0y1NrcSRLZ2QlcKfWRIN22klIDoCl0+9nCeLgUAO10vWw1TGAL5PL2q7LWsZPgcRIqq80csBkNe83jkrYZg9ixhpO860ylSCab+tQmgYCuWImV/A6sPXFRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791024360; c=relaxed/simple;
	bh=yk9FkD+JS1tHx2piExJrz00C5iQ7PsL+msSyrNMAWNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hn8o1XSXvDghEAkpDXNaePei+qymyCYfGIQC4xtUyIXthtJq2J5ynHlYMNmr2fODoRSO+4mWG6izrljXTl4kyeuVBuy635SSUYAL9Ini2aH0WHJJN0W7FfJl7MZ+k0Mi8Zrbysnc7N4XpgnrhpcsyXzfeexv097Qr/8B4uP9EuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lyLOGqqY; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lyLOGqqY"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3dcfe205so85186166b.0
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 03:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791024357; x=1791629157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezx4xzy/gAlLbYrRv684J3BP0hR2VYyaFcE+9qMDACQ=;
        b=lyLOGqqYLANJW8O8xGo68iSmAwDLaIr7iTuFPbDIfo2m3lkVxQK6zSmh/9mknGNJCX
         54Y7xDnz+WWxTnG64CWVFVAXPqJwNJ68zJ3ol5qmY+aoeOW9Vf8qf2YHrXNtHuMyFdBL
         YwyEk4yx1fpL4SMVbjgBtAyHz9qwJTBEr7lpYC/eNZrYhClWpvuuWeIcMmg9wt5Jtisu
         Zfd1bEZjBjhwFCK78xkwHyBEnLJA934tfwR8zNiBJeu2ys1+zl0HfbaiE9dbIKR1reR1
         /McgjmBfhu5AMb0rP+Wi4WXuZNxKdaOnDZG4jFCv5lAFDX68Xe03INgxt4Fh0hHl0KD0
         +GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791024357; x=1791629157;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezx4xzy/gAlLbYrRv684J3BP0hR2VYyaFcE+9qMDACQ=;
        b=u6WpZag9qO1lvtFxH46w6Hji2+gzYDn290XiPh+Msx4FoSReAag7GXUCKFu80GCNR/
         t8E8qkeB1Z+vVSfqEU5H670QWJjhJaTNUWhpylOUEm0krMFpm2xegTMYbFK9220Z5pbk
         nSp8+Hp9p8/USRKB+s4c8Wosac+MAMisInRo1522dw1PE0ZZVHzCWwXGSpIMQSrn3t5v
         5wI9FAeQmbHycEB5A4SKnXChujMV9iU3o+wTSB8VcMb0yehaObPBm+Y+ieRJZq/oNGz4
         uLMbhxztB7ro0v+7osWTyZ3p9JrGI+lBTBGxNe8YcK0CeYJeGqFZRyRwAS79tZbOEIKE
         l/Bw==
X-Forwarded-Encrypted: i=1; AKwUvBwcoyqGSqz16GXDkL6vPAwqU8FFnSgAvPuFMLptZWM9YyGJp7DRNIljARCIZBOkuQ9MJiq9pXGHpnwd@vger.kernel.org
X-Gm-Message-State: AFq9FYIMenSHleM+ohVHv+F4032TgT8iUGKRfsAruGoJzOYJI9ZONvQV
	cmkcpUbkAZE2AWPSLV3KlGKXcz0CRttra91UimUVRr8krE7uJZ3Cu2mJ/xdhIHIpADOfsZtsDIi
	YKg3WIPY=
X-Gm-Gg: AYBFou0dG9YIV1JWuYOrZHIqeWX7ZgeB8qIUvl1Q2nIpAShGc85e6KDjUQp8rvDAqXs
	g0MIeCsKwxLqU1W/svRfKphobKxymKyACTBaSMDrZzKQNs3DTBGhi3lPsLKznhuwv2bRxKH5tJi
	eYzZAWTl7b2o4UWONF3tjPMsOOPd17Joh5AeDvDizOtMwnmv0299IJ2KjLl3NoKbZ6nDQPjWOAg
	1NmXEq7youU0KlssvVHRpWWSQfrmFma+qRaQyjZTBv/04PzH/5OdEvShRURar82jaV6HpMef+p9
	q7sDfv0hKGKaC3rP5Qs/K/GCtPJ5qFLF1Y75fa8nUWr3zBE5uNzXIQ7RuoyxQ8HxvsNg+BUkvgj
	JNBKNrR4WtvAtTSD8DTRut2Sl8Qryl1ySj3PfUOyCTNOhqLTALyCC3dU6TAjJgEngEW/CfJy9Oe
	xjYuDFpVa9p96avZr4nnguewrvuGPNB0hF4d0qfGtfx2BPxv3t2Fh8gJ+NXmdJyYlS1I50mM+2b
	4XMQo0u8Nk=
X-Received: by 2002:a17:907:6d24:b0:c2d:ca8d:435a with SMTP id a640c23a62f3a-c2e4af80457mr432580266b.38.1791024356730;
        Sat, 03 Oct 2026 03:45:56 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd26bedsm186675466b.34.2026.10.03.03.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 03:45:56 -0700 (PDT)
Message-ID: <80d0d390-a0ca-452f-b8fd-a7da85bdde92@linaro.org>
Date: Sat, 3 Oct 2026 11:45:54 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf
 syscon
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
 <rtlQmJQ4ykTc4dV6nFJIqsjY7h9hUEOCFQETkvIiKG5GSaRI0L45Rmi2FuzpULqJC8hFjPE_3D4kyuRqgJNOdA==@protonmail.internalid>
 <20260915-rk3576-dphy-v2-1-b56e68b54b8c@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915-rk3576-dphy-v2-1-b56e68b54b8c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2026 11:42, Amin Gattout wrote:
> Document the syscon compatible for the General Register Files of the
> RK3576 MIPI CSI-2 DPHYs.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
> ---
>   Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index 7bcb4e2f47ec..e94c83d7c138 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -32,6 +32,7 @@ properties:
>                 - rockchip,rk3568-usb2phy-grf
>                 - rockchip,rk3576-bigcore-grf
>                 - rockchip,rk3576-cci-grf
> +              - rockchip,rk3576-csidphy-grf
>                 - rockchip,rk3576-dcphy-grf
>                 - rockchip,rk3576-gpu-grf
>                 - rockchip,rk3576-hdptxphy-grf
> 
> --
> 2.43.0
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
