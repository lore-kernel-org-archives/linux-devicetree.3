Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964455;
	b=WgvAvVeXMu2Ggasz5A3HjoRP63MGtnDz+bFqOBxZBg+2SWmNtbOWFWMHECzoPyZ4bibW
	 jy56K7u/QD04K4aZ5uzXg6nel2RZxcDThK2LI+zaPVIKszg/ABkj/y9tOLHMOkD5p+gm5
	 nknllyzF0ANbtQvsDRUVpWE5WCTXc5yblCip+rSL3UsMbrbc6hASY3qm1Z2poRHtSBYEw
	 oJ1UNkP6/B4fXVRC3j930AxFPMAUI1dXZT63irCCpQ1o6f/GhkEiAJIkQMowkP4SxmHID
	 kph/kcelxTvZVo0zxh7DqyL2TN//UsxDewea0tMOQG697FUoDAyNC7h14RrQQOUDu3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GqsfXmArDx1BFEFrYigXSG4u66Q+cf083qtsOl4mkRI=;
	b=XT9QNP73RlquAUmNJp1RAn+9fHMlhNhAOb/c/l6+7TK5gGJAK6kabRSHqwF3wbt70OR9
	 0Zp+Jw1uLtAb0M4FlklRhkd0Y+AMw97mj2a4UnVqF0iJM1gGxhjhGre2gISwegKTsy7Yk
	 lzW78qs0XcU3RvlGvQXy6anvTQUj/Tt81Rt2TNpiup4Po2O8zV3JlNVz6vxFPU1BzbAtJ
	 y9yr4c1VVvbFqYZuKIMJmiU+c/pT/yWx62KJw8u8josuO+sKPxZCrz+sCNRenQw+ygdw/
	 +Z+1naDFzRgucA5FUiPcCOiTs8v83LJF9OqE4UahsolXvnGGCAF+UQ3Zm1/6Q5H+DjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="zXO+/C32";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F145606D80C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F145606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zXO+/C32
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490d59c3edaso364127f8f.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964453; x=1794569253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqsfXmArDx1BFEFrYigXSG4u66Q+cf083qtsOl4mkRI=;
        b=zXO+/C32AlStvgI0+EYAWE2/Lakk51WyJPlKb6utiwbTK9+74CTcnXu12Wf+J/7NuB
         BdOoD4ctlP0nDHnnTAP14y2UXjeKB14fwhpho2iJ6q3ClTWXfFk6Cj7nJ3WNYSFpcTMg
         jbCSpb8ga0BL23ipmALQoFILzAVZewCiMgRMMW2zkFbS9UT+Qybk7Io3KpC7M1GZdodh
         a4QITzKhwTU1iA4HYSCnhVhpR2eMx2R+icRk2lyGDB+DtlyGJoVlMLPk2lzYyA7Btcjt
         I/jJS3hmHNXqxs01UtHPwjiHIwg+VofbkfZQOarqN7o6L2TO6HQavWc368QZ0IZdGvhP
         iBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964453; x=1794569253;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqsfXmArDx1BFEFrYigXSG4u66Q+cf083qtsOl4mkRI=;
        b=zhgxsubxRxW+9il5PqFVC3ekZiK+VTtJZxa4qj1dojWboiv8WP77NYv+0zqS3kE68q
         2xcI2PiM+D0oVMB2eG7ce/4e1K9IlagzNyzzvM67UF0QbUaDE29x4WIfLcTBjFz4D173
         4LOyp/Zqzqo1m7zT45kq0q5A3zmrbLBLUVF1gcJCe/dj6Qop8QbUIUm31JpruNgR3sOm
         YYFF7veaHtpuojMUc34E3PW1jyIE9nkrBy+cmp3lxTWy7sAnsXmg7g0L5QL0iXG7fojv
         +RQdEhWKF7bXws6YCHYORqqrh8Lry3+ImUZK6AAtOOoAQ6Sus9DGxcjo6q/6QTWAxjhW
         +vug==
X-Forwarded-Encrypted: i=1; AL+hErEE0SG8PE6xCge73O/TUaCze/i8VpWLiHFJZoSsSBd1iNzVGFDKtio4iXLm7owp3rbnHO6m2LEf7r2g@vger.kernel.org
X-Gm-Message-State: APuU4Z9hNdk23/TH7NYf7xxN7Kc8USt/raC5HEMnPkXq/Esf8an0BaDP
	P6+8yvWDvCmNvRdabkws7wY/AFi3asy0qlPgpcf80PJtCrShoncFpg8n12j+Hm82JDU=
X-Gm-Gg: AYBFou1NchvmT9Jj7jMxpf4IDn5pDGE5wfKdaPD+g863yxQ+3iMqu5tfSC5Eur83yeV
	EFgi3GHMJj8xU50HNaIXvSfJ69TD4PBTD0F3e+vbibA25HGUJoNdn77Fvnl3iQocOfljWtgHUNe
	de6zjCWpVPvnRNKXQimkjAfCK/XKZxy2ftvs1flmHE0yL9YVYFE4uVm5f4qM9vnNCT44XRhevH7
	+B0jYxSJ9E7WxsClnnpz6ckjuT49vxxphcGVVZGWGnwBvtFKsh/UvnnA7RzJ7zbHNPxcbW4zwA2
	OPhDR+4PmGo9zWpM8hmhFOr3ZHt1gn4Bt8RKCURpHooSdftYouhYRnC8JAACv65AaG5HnKTCD3W
	8GA6EG4xi6ZllcMxueZt7IusIQFOfbogBCGN/eOE+tAZlm4ZurZrf5qTZY7sg+S2AQTjMyUvV2y
	msYAnSRsRgeChDyYbQ4pkIEdVIx8uspQZnbuf82Z6k79nubfq7QHpsxsJDjqAjXS7vyhP3fhpn2
	WtBl6OOKVG3lGuEnPgjHpJvi644Zki+jrFYmhx13mesBWtLgAQN+PpiUsPtnoc2LJJLdLcrI0+C
	afXgd6t9tq2Eq1gYFolCNqbA+KrWha88KrLfcAAUSFWQB46n7satX6CnglbuxOw=
X-Received: by 2002:a05:6000:3c7:b0:48e:7475:fe7b with SMTP id ffacd0b85a97d-4911906d185mr9499122f8f.6.1793964453377;
        Fri, 06 Nov 2026 03:27:33 -0800 (PST)
Received: from [192.168.0.167] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d73286cdsm2941196f8f.28.2026.11.06.03.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:27:32 -0800 (PST)
Message-ID: <e210c5f1-6a93-4387-ad1f-66d4ed35e00b@linaro.org>
Date: Fri, 6 Nov 2026 11:27:31 +0000
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
Subject: Re: [PATCH v2 4/5] media: qcom: camss: Add support for SM8150
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261106-sm8150-v7.4-rc1-camss-v2-0-39ee37787b00@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v2-4-39ee37787b00@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v2-4-39ee37787b00@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 03:24, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add CAMSS platform data for the Qualcomm SM8150 SoC. The camera
> subsystem contains four CSIPHY, four CSID (two full and two lite), two
> VFE and two VFE-Lite instances.
> 
> The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> layout. Add CAMSS_8150 to the version enum and to the shared code
> paths, then add the per-block clock, regulator, power domain,
> interrupt and interconnect resources.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
