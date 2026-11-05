Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871876;
	b=Bx7UWgpIdIlORifLs+nUsBKYu1WkkuIkqXU3KPKtHois5KoL+wiG6kpphl2lm+2Um2Af
	 8AdFD8YgJh+8YMKgnk26ZNZRmjBsLYid81uJCDf5pX1jueyPa7Ia5DUbtHQzh1NoszXv+
	 QH8DQ1pRjWVd8IrdfJg+ckC9ful0cDY+3VWFgoIIX46oeYQXKl8N4niEgE4yUsSkJ65u4
	 I/qfSKg4gQUyxEiv73Jzb5ppqqjZdO60l/AB4nq3y5p+pHrdp1N/4GYCd5C2RMnwlzlFe
	 SN42KKyGQEyiGM9pCh9QavM3RV++yvNG/oFnN3jMdS4/PtDiLmQbotaFmcuoKebvjIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7QhU4psUp36lRhdSvaABTdCrK79wA+X/bI1t7JAA+P4=;
	b=juP++Fw1e1rgeKKZxXftxU6W5jWelBkoo7o3jKKM+lnWBfemtVCUzODXPMm5DeqXWY3j
	 Up8A1eH9ntHFiyFZXiKxY3euayCXOW8YhVavBWk7b3qf/udEp9GE6SNw7QMCCQ/NAoHuP
	 iqM09kxXh1RH8l2oFqrI9ocL/DWFeu856PPpFCS955ZbOPTyL6ldbo9pI76fsFK8CBisf
	 zqTMsYG5MhEs7/kNu+BOF69OfSFWesLLWUl4KbyBLKtNd/kcpfQ9UXehlqErIcYT2VUv6
	 xQry2UOM3Tu2+sEUieE7Bp6VF9oCuPvvpG3/tp2Vbjy9UABbOwuezul0b7SjPs6stpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tRkOqEU4;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C0D606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C0D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tRkOqEU4
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so1288380f8f.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793871874; x=1794476674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QhU4psUp36lRhdSvaABTdCrK79wA+X/bI1t7JAA+P4=;
        b=tRkOqEU4xOzE7XVrSahnzZw+u+Bg+xLCpTkl91fr/FbW0pcnhNr9FAx3T+l1yNJqNY
         wtu4o+HNeSsr3GQ9Y4PIY2gJ0iNQSyc3FVJoDgC1M37qnJzbxCySN/8cUiR9s2Va+DBk
         KosHb7H0Cxd5RsHmRdULYyyBcbwoEqsLCzSl0vH+p4RN3/7gmRXOBbwpaAHG0uHWyxcL
         +MqGCI7/uKRT1akFropCNXnuEd072gwImdusnSv2T2vu1tM8gCeH10HLraP/JALreFzu
         y1Dy1i3xxfUDA/QuIkMRBtbFdAOM4gqDbju3s3PkxsA4RoiBUjUP+k+eHki80E+TxhiH
         8KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871874; x=1794476674;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QhU4psUp36lRhdSvaABTdCrK79wA+X/bI1t7JAA+P4=;
        b=VMcz5ymFf+99rQ7CjITLwQpxEBhLwdfi2giGrkEw9/FAI0hYkVN+mVJhtPdMDMN3oR
         Lzjy5wQJfKTW04UwxcT0tuAHMb6sT+MD16tchV2LGDiLV2swneTzlbtjfcPVmUFu8O3q
         Vhp2+xWOzcWJ3l1/P4UDLvBWOfziQNucKYYTRJSTSzwunTtGDbMvoUbrMfBMOf/VhbwR
         UUVPy+NW7uvKmX+135uRkhD9pCjr1mvdPweNmxg2uRN5TE0Vdpo+r8yBIEXAnu7M2pIU
         O6Td+B1ZbCU0IRo1gu3k6J9l2g98ZNh3fP72fZeCBQ9Wy1tDuVp+YEMJj71gSRhhPy4Q
         ig/w==
X-Forwarded-Encrypted: i=1; AKwUvBzwGhqjPObbhcg3A6Lrwzgu9fl1oAaY3Uh5Bb07i7XQjqqRPEnAhXx/CqM7arY5NzAe/Un5jnpCVpre@vger.kernel.org
X-Gm-Message-State: APuU4Z/pefPjxc5A/MvCzb1fZpQuhRU0RmuV5AiRoLoa3ZPLtYQ+6mM/
	xrKXQfn4BzgGDY2dgjQFVi+ndvaNqhNxmRHn9ch2ggxY/jwjHqnbbxFBYVxZsEbgpZQ=
X-Gm-Gg: AYBFou0RtSMUENCyxCsEgxCILcCK2qJVwdE8ltw9C8IMGjUIOnVN+oEDbqmZhMUA+Dj
	LL0u0mxcOZJkL4Yi14TribufBPzq8AXlK2ecgeCWnxDtwpQbDr863N72/BZXZ2cMJiKborwWON/
	LoObKdJRqnUpqYKoRQRnSW7DauK5DulcypNZ25/bek8lzW7FYuRe60MgTjU2dScUCMAG6xhVm9e
	EM/8JX+yK6fdOUUumxZNrrVsHmJ9GbAhPm77j0peHCaPdj7GJq2E5OlpQZ/cEGJLQ4x/JvlcxA4
	zt+R1dyfCwtEPTkSLiEO8shwM8X11ejoMoHH4tsWo6M5WPcXSW6SVnFJ9/fIwsphODkfPiy4FPa
	5bA5aK3Jha7B65SgUZK+8oYMaie2WnU8moeDAlsAEDPlsihniIY0Kijso7zzjZ+b+bi5J14S15a
	Z3S5pW9lWPMAm3vY61LRLPHEnil7h8mTxv0XsagA3+bdyqZ9Jhs1kuE4KFTfKpaUyIT1E/kgkkh
	BIYcElkW/PkpuT6o2/H8jsL7k2WtV4pioS4cz9Hz9WnRykZpCagbURyX44Ss5xUu+/J3vRk6PHr
	P509k8sNlZf8a25hSwGfXAUTNVDYXMDcxQjPXrmu
X-Received: by 2002:a05:6000:2997:10b0:48e:5e63:bd23 with SMTP id ffacd0b85a97d-48e6e2ef96fmr29363335f8f.30.1793871874143;
        Thu, 05 Nov 2026 01:44:34 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm8628740f8f.10.2026.11.05.01.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:44:33 -0800 (PST)
Message-ID: <a83a948e-3430-4133-ade6-b30045b8b186@linaro.org>
Date: Thu, 5 Nov 2026 09:44:32 +0000
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
Subject: Re: [PATCH 3/4] media: qcom: camss: Add support for SM8150
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
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> layout. Add CAMSS_8150 to the version enum and to the shared code
> paths, then add the per-block clock, regulator, power domain,
> interrupt and interconnect resources.

That's odd. sm8150 and sm8250 are proximate both seven nanometers 
sc8280xp is five nanometers.

PHYs are about converting the analog to the digital domain and so 
process geometery - ends up making a difference.

You can get the PHY init sequences here:

drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/
├── cam_csiphy_core.c
├── cam_csiphy_soc.c
├── cam_csiphy_dev.h
└── include/
     ├── cam_csiphy_1_0_hwreg.h    sdm845
     ├── cam_csiphy_1_1_hwreg.h    sm8150
     ├── cam_csiphy_1_2_hwreg.h    sm7150
     └── cam_csiphy_1_2_1_hwreg.h  kona/sm8250

https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiphy/include/cam_csiphy_1_1_hwreg.h?ref_type=tags

So yeah going by the name that's CSIPHY 1_1 same for sc8280xp and sm8150.

Hmm so much for my understanding of how dependant on process node these 
sequences really are.. perhaps the PHYs area fully synthesizable in RTL, 
probably.

Anyway.

The one thing to do here is to please _verify_ what's upstream now 
against the tag provided there.

If there is a divergence then we need to upstream a 8150 compliant version.

...

Actually its fine, did the verification for you, the 1.1 init sequence 
as is upstream is fine.

Just please tidy up the ordering of the 8150 switches.

---
bod
