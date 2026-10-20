Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459871;
	b=1vnvpuFMa5c76YEP1W4Ca5Wz9S2qlNPHABr08wMWLFvMnfeRNR8FAU7aDxPYrPqbrMcG
	 1YodWxJ9hep7/qWQu80Yj37ClsW1NI3HsgzJZdFcwL5iCleKxFpim2zC7eBijePmfNNaJ
	 drt0ECAFlx9InKBXwMw4/ZgNglkc/+vDACo6uR3osXXQtfTD4pEiYLDDtZNJgmoBUw3wv
	 JhH9FfxPjFWU2XjDXbQDuZX4yK024wKPFNjYxRC0WqLDngOtTnm150IzHjTfnc9CAxcUr
	 LHH4fIXrYfInUAyQRXO5QxrhotZY3hHSIWXGLgbC3Rdmfha/DVtsfpq12xjh/3kjofA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FzrF64kiEKqqwWT5o3bxL2C80x1Hbvhrh6y19AZ3iRw=;
	b=Lg+6QuukcEBIjaxTeHLGrwKfsdUCN8t647IJfi9DUvpE3vaewz2LD2uU5kO3peOT6+Mf
	 dLkN5RDMfyXN2xC59JIUZTBd3KYomGIy/KW14WVHhqven5vhXommrYOY8IL1QcUMui9ae
	 6UCfuKoLRPqoTGY8VnVb6tdly67GVXlo1/xHCL9OakMjQSumHAiuuJevlPJjepFgDAChs
	 q1czgEF/SQrGMmKoaYxWPmHFoNQsaTyPL1KvTge/IdWT536M2UUYYYtFIPrw0xkEyXk3T
	 GtfswyqFRuBFF1cHbn+VBiz06zxvXJODuuA1fDOLRLC0ZkYSBt7ABMuP5YfxijLMVEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aPdLPZff;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE1E606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE1E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aPdLPZff
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so5371733eec.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459871; x=1793064671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FzrF64kiEKqqwWT5o3bxL2C80x1Hbvhrh6y19AZ3iRw=;
        b=aPdLPZffNmo217G9eWGlRm1FdljKwmlMRRhAYx4MmC6SLEKjyRsg8qO+e+UU4wGfvK
         IXxJKWu/71cohwDuIAM72o/901AzzXVFeZ77ai8hv9VfcGWR0iGFF03S3/8r0AkeI+rk
         MmEHUgxBULR6/gEWt7F4jqrP4gB06tCzw0R36h3mYFNJwFKdzxAGXo8xSDD1cUZaKixW
         JLRFEeZ5KnqR2IQdmpyRdrLMGxT2y+7geNUYN1cc7/3tZDN6dfb1ONb+fawinXq3kKiO
         DQl1LKXtuLia+4Ta/39Xng8xFeZ6ebvCiIWk9VWm0rM+i2YkypHQHTFQDBxHRYI3Xgfc
         72WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459871; x=1793064671;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FzrF64kiEKqqwWT5o3bxL2C80x1Hbvhrh6y19AZ3iRw=;
        b=SwU04B4OgXJ7B+8lHcR+Sz4AnYcpjWxRpJtnjzzVYu+afZLT4kW9Fxxr+kKTQrOH3g
         3w6qZN3jYviZQHYPK9uI3IUdF7o+oIGyrouGkkhyzG3gZDGj49IycS/pUvc1BtcVlmtO
         2dz+FqTac2lgHesnF+u06ME08Gt45gBKDdjU3Wdp1GrMDvckLAzGu3DHfWt9cT8CSgVw
         ztL/S/cylr9bT+wrBIGiFWvFdN7pipMdlUg/3QC8Qfzt6jnZ0297DZe0yyvZ3Ie/JJY5
         rBpuc4x+abCOuq05ZwzY+Mwmg9erpIKCrwBvChNJoR1PuKMKeY1rGBjTF0s9Tux0+l71
         bwcw==
X-Forwarded-Encrypted: i=1; AKwUvByybwq5rT5kQ1EyWgkKjisWF0w+kSgJu7Wk3N+n9k/4zzj/4tmx4QDLZP+RAF0HbFDREjWyB07U+CV1@vger.kernel.org
X-Gm-Message-State: AFq9FYK/LhXcSwpYbU7hldHVXqO15GdGTPdcjqX9ZXaOc5faAtEUeMHd
	zwJYkh+XyWmltIzB/ZZLM2fz3hwTf5ClLTSWJ9yjXkS5G+sEuQWeUAnEsvlezA==
X-Gm-Gg: AYBFou1B/hvvfnptPMAGh3ZH4sLiY6n4N6xJnoLOsEh6ODUl/TpUvOirbfd/+zIv4R4
	BHRSwyVFRfMpBKFDxQoUfrd/gKbVae1fxlWex/kTB5XeHqgINScaVMD/yOIXyi/mx7evTa4f3Yr
	olE3pXh0VPgmZUDc5FZQiXG7A920pYceJxY1J+HpB/yMkIVf/P3dcoe6vWr/I2eNKtYaIMKlRb4
	uXDdd7ioo5D5u3mbJophx91V7N6IYz7CzSfzjZNMq0sgumY76jYrRDUNIyu/9VgOR5Snr23LtLH
	FHAyUNJfZQOHlTr45Iy3ywJTGXfaz6c1q2pFwSB+2R4onNY0aKqul4GtpI2nQUqG2GNuOA8n1XJ
	YLwJ8wJ6Gw/wI5qThkBaBTCaMDEHwt4lVATmuFrG/tHzSn33Bx6ghhZZGStWF2qRZKUFivcmc8I
	ts703t/QAIL6aMuB6D6BeLGCskzxKce14tQahGSIaOJlzqj1zzqg9+Hafk2m4llonSxPFXQY+dD
	FqTXeIjQE59
X-Received: by 2002:a05:7022:f51b:b0:159:aa67:28c1 with SMTP id a92af1059eb24-18512b3e25dmr13513794c88.20.1792459870405;
        Mon, 19 Oct 2026 18:31:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm25427211c88.19.2026.10.19.18.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:31:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:31:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: qcom-wdt: Document SM8650
 watchdog
Message-ID: <4b808464-c860-451b-b179-fdaa39e14fbc@roeck-us.net>
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
 <20261002-topic-sm8650-deckard-watchdog-v1-1-7d7f7d71d88a@linaro.org>
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
In-Reply-To: <20261002-topic-sm8650-deckard-watchdog-v1-1-7d7f7d71d88a@linaro.org>

On Fri, Oct 02, 2026 at 11:45:28AM +0200, Neil Armstrong wrote:
> Add the SM8650 compatible string to Qualcomm watchdog binding.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
