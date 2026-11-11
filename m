Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371036;
	b=zCPPTqLK5XC1Jl8NKmZQgn9SCwZzKVpqcYLVlBx8nCBiMxW3xZCGx6icbtS4971ZiJ7s
	 2Dtz5686r9591rqcY64emFnrURWSVnkmZlLmxh5BlbMuTY6TuEUBMIJwjf2v9BKnY1wEk
	 GTLJNHIfEb9k11ZCUkY9NTAqSYXNwY5P+eISxXzu6lYmQmTHOgyvytPdijvrf8LpDcG9p
	 DOPUviSW8L5ILlwK5GYBQ5jIHHBwHiYt7NWEcNyMaADp5q01NXbygzkGTkGOmvZ/HOWhn
	 5gYMrHvfPZ6HlSfb0JtTr8l8FCC6FkaUodAKOx6cl8C/73xeGCqLZSSqgKnIuvgnwGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371036;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3/oMUvfjnRDqTYECREY0yvKf+oNzhYCqjwUaHTL4kiI=;
	b=fMV10zgVJvj/Q1xI0Q1+WCIhi+zyiIQV7Pui2PcbaTZIxgygpitOqriG6u00Nb6CIfSY
	 86rPWlDOy55gLvAbtMTRJRHli0XllDutlTSE2yJAzpj6vvgo9r1LDJx5JAf1jA1xmnyyX
	 0vuyIn2UePRVpOACtnnD1GYU4WFYb8XKc7OIiwTTlRv9tAI4GufPvI5kt8RXQWEff4Bmu
	 63p4cexiIgsKjjl53kUrsDogyjktu8Czi/LQaKF4etu+LU1msCSqx0V6un1/g8qzN3zwm
	 zNlaHgxWlB5JRaGxusF+fKMCn/LJYFw2do34u0VzgoXZIlxyp5VPtz1oJgV9zQmY52A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762AC606A326
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 762AC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b336de3d38so21773647b3.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371035; x=1794975835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/oMUvfjnRDqTYECREY0yvKf+oNzhYCqjwUaHTL4kiI=;
        b=YC9THvJl/QPDdxnX0WY7qL0HJ2L6nskAPK/XT8Dpx6RzFhrFWvw5VmSS2lxCuQvJLw
         plBS1Am3/6fYpll6Snt/FKIw/5t6xKDIJT3HddshXQLBO0Gjd4McvBb2FEFYF4BdH+lC
         eglgj42XDpJZJ6kCS7qpXKDQupYJVB2q6ugxIcHOFRbweLc9GBzv9WsYQdsaT8Dmb1OM
         4l4PPu1eDh2ol+UifkJTdN7YF1xO41Kmxp3fOUlRYhJH7vMf1ey98nxptJ2mWVNoLynl
         MLsbBRw/qh4xjjCJOn25OcQP4ItsCmIyZil01LLZLoN2vTP7ow3qjOdYuNdVzU1PY2xo
         q4gA==
X-Forwarded-Encrypted: i=1; AL+hErF/Yro/YU2TSraQQbl8apHqwfxkh7RBP1lnySIcLyi39HPVzy4aSnWNJUsVkduPdCXqS6dsnESU9kl3@vger.kernel.org
X-Gm-Message-State: APuU4Z/O9UrB3dIwDtUvRtkEcDgAOq6RT/7t7fSamaTDk0WrmdiNZKwr
	sxVHvTAyk/kzV7rtsXoKf1iio7drSfBZHPGHJDFXo0HwUOvYhRQVA/DE
X-Gm-Gg: AYBFou1u8gFAwgKbAy4A3JKKiiBxxMrGwvndl/61MOIWgk7CAIxWZ91Q+G14iLFZYUQ
	ViOL+KPuRvu521E12FtRueWcxRzeXRZ1M5RsroskMBLmxnkwAFRFhDe68tGgS+30OcXlNAzxHIK
	VhkCl54HRacKpnwKxpCKhkZdE2T8g+nDsw/I3iXRBzcDU79vF1EPhDdur/m2SLsCTmXVIDEntXa
	mhPqPFTVmkDOVUiEq4Sh0p+1eHJlnIp4BZRxIb7Zgsh0cAczKCqi3QRIGB7hJABWv3nUfetby+I
	xvenksSomQOTzNrrmNMACDB5pKMfoQVhdq70KUT3pAz8Cqvz12OmoE4zNnheZgYmNIm+7kON8Fk
	Wun+w/AAwsqApwCaTYBhZclwiAx3mPSz+mYEYYtyToMQeGex3Vuph3tr/D2EJ+GpOn5d0m1t1D+
	N8j6dwWNbfGiRdBkKDc/zY3qF/9w4D2EkojgP48nDmh6NNKRP9NIej1xacOAeuEDwIVL4JBUZHr
	CrqkUwTUr8v/jE5mOE/ENbddw5U1+a0tUyJRS9pzAXCzSRKONFBcFobx49a32DZlTIphJsTJ2Xb
	ucP00GVKbOrwt688x21/hZJFcNkGs3UFLFmYcQETM4TQHthkvMKn7Q7s3Rb/vPtOVEUG52US
X-Received: by 2002:a05:690c:7342:b0:8b3:23f3:134d with SMTP id 00721157ae682-8b3a80ee26emr9648857b3.42.1794371035274;
        Tue, 10 Nov 2026 20:23:55 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:6378:bcd1:64fa:19e3? ([2800:a4:806:ef00:6378:bcd1:64fa:19e3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933a165csm36073107b3.14.2026.11.10.20.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 20:23:54 -0800 (PST)
Message-ID: <fb4d03b3-eb35-4aeb-baa1-f4df54653192@andrewgigena.dev>
Date: Wed, 11 Nov 2026 04:23:48 +0000
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
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: ice: Document sm8150 inline
 crypto engine
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>,
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20261104-sm8150-ice-rfc-v2-0-d697bbce0278@andrewgigena.dev>
 <20261104-sm8150-ice-rfc-v2-1-d697bbce0278@andrewgigena.dev>
 <20261106-offbeat-hawk-of-purring-50a8aa@quoll>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <20261106-offbeat-hawk-of-purring-50a8aa@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> This part should be a separate commit.

I splitted it into two commits in v3:
1. Add qcom,sm8150-inline-crypto-engine compatible.
2. Move qcom,sm8150-ufshc to the standalone-ICE UFS binding.

> And what about eight clock? All existing DTS will report warning? I
> don't quite get the need of this move.

After the move, SM8150 UFS no longer provides the ICE register region or
ice_core_clk; those live in the standalone ICE node. The only in-tree
user of qcom,sm8150-ufshc is arch/arm64/boot/dts/qcom/sm8150.dtsi, which
is converted in the DTS patch, so there are no leftover users of the
embedded-ICE binding for this compatible and no schema warnings.
