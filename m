Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634268;
	b=18MpTQTp/zBnTDjWh7gByOifv3TjVq/J5yzu42O/luhl+ZZunB2CCy3QnzMKhTn3LIxP
	 iEeDe6rpzwg0vM//vfY+DD5NB89srIQ0yekCDHcneFngGEUekTeaYTgaAiueaBXMyTIHU
	 b/VS8R21rZ6yVPBn4zl3NOrwOUuVC2lr8dZdkqGUFlSIUpAf8+phvAAUTOiHzjF2cM1sQ
	 jNVEAVOKDHMAWxkMt5Vg+HYZk9h9XxznkcT3fJj9O7WC+5/N1L+SbF2p3Z3msb8/wuhqJ
	 GJUNsnrYsMfMXuURGZVyUXvFfH8PgjRJ1go7XpKLk6AjdrFTSPawjETa11Q77bCM1GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Vn5QeghxKopwgmJC1JLC3ndSunXCU3zxobPFDaZ1R/c=;
	b=b9tj39Moe3v9CW6m9xfOjvXPJ6WcJi/MefKz9kEbTlFJHw2RkJVwAip9hvn78DL6OVQi
	 HPeMwFslyh3MFWB4PJkB0CGcgxWONwqvPF9/8gc/jzkpk18kA6DZdEtewSgvOkhCesFYI
	 kMrBkYfr2mhQpnkpvUsq+zHsxwnPFsx7dUi3ZairBRo/RaC8tZU5e9Znj2aJ7ZTem6CbK
	 ga0Z+qOghZKUCAz0OU01hm5WPesVU57FnYotAPu8vdnMIWwW0go8XW8l61dcdWt5FPiax
	 wFZBV1hO9866TL/EqbJkDoW/u7kNNbvmindR4EQxSnV0FQ4uZ4v55k1fx7HqE9Ielcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="pvBp7/tB";
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661C0606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pvBp7/tB
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso5214651fa.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795634266; x=1796239066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vn5QeghxKopwgmJC1JLC3ndSunXCU3zxobPFDaZ1R/c=;
        b=pvBp7/tBpC1KSjYcZGoQVAbwKtI3KuoTioFuA05nFzjOLfCmy1gzs/om0I2tHfavRB
         yP7wd8NaLh5diwgrRFebK6Gec0OpjEbLbqbesceF8RpBwkYV9NEESDgr/+JaWXAWM2s1
         zVVbYvkYIuVNo5A9UX/5fGyzqXUNmc9Lb1Hr9S+7DhCUDyt2CWeQBUiyxYKxpyFHF4Wo
         WQTxTpKJ+SBZrDtd6LIphmcpAl2g3ThzWu39jZN12bxfiUqskPthYJHrgzTvat5q/EGF
         KDR7VAJshgus3unhbCoE8Uz+i35+I+y0mtw/W0v2K1C8f7LxlLxHUuXzqHT7keskXDdk
         YXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634266; x=1796239066;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vn5QeghxKopwgmJC1JLC3ndSunXCU3zxobPFDaZ1R/c=;
        b=sAha+YJbYgUGCJOFpQmf+WQsS7dka5uwh591ZzhV/io9N/ybFp4kqkb4J2GpCBddcf
         pBjH+zntIQMu3APW9jur2SBuoEqm0MEJNitSKupyfWiIYCFioZqNk3lwmnQuZ18Bw4K1
         V7xQ5/jXfBuLtu+5rHUBn2RbJr68+M/WOXF4VJLcU1cEIx8zXT64uOsMROK5zMIdv+ek
         Mjry0H581V10FKhlZtsTiiYEkwoUVxKG0XNdamX57pp06xm8b3Uttl8n3Kp2rGqykJeV
         ykWcEpM7W0qwbuyAPKNJSbIhuY70rmeFu8FFkkdSYNTpYjAlOxrEbLM3QScgZW86g+ey
         txyw==
X-Forwarded-Encrypted: i=1; AL+hErEYPT5LbIGdFADWJrv4JR938GYnJwUi3vCbQ4qMrrv+/HWf7XRDSjQx7Cy8V8UeZHLulwPSBrqtvh/u@vger.kernel.org
X-Gm-Message-State: APuU4Z8IGzicqPG1DaLO0qD5vY9CCnSfJdYFiVCeZncVMfarE5qkz7DV
	StLo72oyetS8fOKhdAU37Yb6rqVl5GL6PCFLUofJl54hX8hauBurIOX74bysN60NdEE=
X-Gm-Gg: AZFdTZf2KTPET/zraNo0A+7a+TeZdDIub/fwhrppLvNarbaXR0tMrfAhvj2Ri4Wwwn/
	6T36Rhmi5CpBhFbUCaAJeMu5oFBmf1ln0FfitnlwpQfWlX+ebP4ljVxJNXR/hqNDGP3Ab0zLvnW
	nHXfkwt+WUsZISBD60UviJ3CWPdHDU4rc6wSphnt3tVVv4VI1/G6sOzZq7rdSYToDFDNCGJT0kJ
	nQ85gQdEMK6Cx7D5aMPGCXuSkQyO/un+zR18drOP3pNZK5BBBE8RkwVPHzZjs575Uo7McOIJM+u
	P+x22zK65NBEVFMiDjHY/rYIlA3JoJjkk6Dx/VYX4EEM7N3TcikQzsyUfm6mkzMs3hU/4CQ8bZ1
	LSDpdw0Bmt0tEtw9ZTXsuI7ZowndndFK0/5hEfBtMGnefTFf/8FBUhykRbfO7TSd5gIY9ES/+MM
	UfMB89LJUBCey1bmieTnEthD40oqz/96983yz3NMlMhidXM/4gntrgHPizaBv8e3TuXtDiMGCQv
	3wfKqcG4LkquvkWiBYqgkQPZi/Tkdu3hI72LzkSqV8tSne98mlt03Et4XfxKdfHqu9CFoOVr5se
	l4JWfkd7I1KfFRVUwC1T3+To1kNEBjCh+mk/oGc76iAceOzWb5gGGayoirJ97AmgAArnN4XBGUy
	Phd1IZ9c=
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id 2adb3069b0e04-5c1bc785b7amr6416689e87.3.1795634266419;
        Wed, 25 Nov 2026 11:17:46 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80537021sm45702711fa.28.2026.11.25.11.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:17:45 -0800 (PST)
Message-ID: <c88c7906-efab-4956-bb56-cf9ca6734c6e@linaro.org>
Date: Wed, 25 Nov 2026 21:17:45 +0200
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
Subject: Re: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test
 pattern generators
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Rob, Krzysztof,

On 10/31/26 13:21, Vladimir Zapolskiy wrote:
> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks.
> Describe their register spaces and the non-real time CAMNOC AXI clock,
> which is required to get TPG output frames passed to VFE.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

that's a gentle reminder to review the change.

A report from Sashiko bot is a false positive, there is no intention to
support the old dt bindings:

* https://lore.kernel.org/all/sashiko-outbox-191924@kernel.org

-- 
Best wishes,
Vladimir
