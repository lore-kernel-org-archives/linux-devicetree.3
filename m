Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721753;
	b=L1/cHHSnP2B3JSILO8NrrN/PrAxN8XV8HALlFmPDmaz2LSetQmvYHcQSufSvaoGwnIk6
	 2mAfnvJT18x2vWgHQDeqW3gc2XnSJlSCEY0xuKBR7ZIAqbdV7DIkt3RptPf5ztsoxIKWo
	 Yw0bLsER6XczH5Nbtpu7y7yZARu50EcR2lftRdPahGnGwgbDZHWsZ/xi9SPrqWIQXB1fj
	 4IjamHKtXMQ1DBJjWWNbAHLTtZT7t3Pm95EDvqp7lH7sPOG72YwXnTBHSf4qvV29aQxYr
	 o0PTr4k9CD2ka5aYu5+PwrqGR4jTnyoFL/XbStVBhPR/BB/LOyu7uZyHvRFYCwlr3XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AJyEzxnFilSuKrupjSrd3QaNv2TToCy8Tn714k4Frwo=;
	b=FwBV2W8px0yYNl9Jy/d2/yKWyE99YPE3K9tMaZ5gYU3lqTdSPokHtiZ3FabKZHMZYCv8
	 fQFjKDYwwQ5VyYisvvds9rU9aO09HJC6Q7xX9DXqZpkxsHQ2SNx/G65AedjyItkQBIiEL
	 +9u/4jCgPSawzEarxDQIfw/rOJvFR+QD92ooOw++t065dk9PQuL/qaoGh0+zVRE2UWjR5
	 lMPnVTYhQ3+zQbT1q72mpc77ozDL17mVUNPfN5eDLIY67CBSoUDbgOU5ICsRGMjw/o5Lg
	 AKqjGGDOQ0RLlGmceaG+MWu/Fp8QHA7F1h6maDuoTl923G0rurQwg5DfOX58OgAD/Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N6bPXlOe;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C879606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C879606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N6bPXlOe
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so1563385e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 19:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792721751; x=1793326551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJyEzxnFilSuKrupjSrd3QaNv2TToCy8Tn714k4Frwo=;
        b=N6bPXlOeCto0Xw2q8GWbXShiK73KSeIs2hmlz4VTfcv3cAbpYobZAt88gMpOm2lBHw
         M2WfJeRF6ZYKReLfipIpDUfAnbhsUsv8J2oQW7l1iK/5BFKX5UR9US08NB2EImhYxU01
         2LYE468fIOMwkAgcUbeK18A0/ZLhnrOFo2PLaGYrpw2YgPiNsFcqPE7KgYGeV83cPrxD
         FpIW5fQs9yEITiLjip/HEMToKsJMw1h4sWvnRhwc4bj0nGYObUyUW9BKyBpxz/jbhbZQ
         KB5f10X3NGyq3jXPSCbI6gkZJLGk3MRSi/OUtQCBoCmZigi6eBIaVazUcUv/Q2qG5inq
         g0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792721751; x=1793326551;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJyEzxnFilSuKrupjSrd3QaNv2TToCy8Tn714k4Frwo=;
        b=CW2yq+KxtnL30RxfKb0spF1STbNmo/oFYQVuUqH90LtAlNREfhFl3FasshGmUI+ikf
         08scjosX1CksErDlDuFwBCYI7vtOQL4tFrS5iN8WBq4b5d/eTSfBcPxPYtoKnKR1DKrA
         6vXv07Kmm5sMoklRlAmk3vvU2apm8R1Yvq4e3rbVmrtBYvsMBj3z9rwye1Tj2OUuVyoC
         DeFvk+Ci29IYZfxD+nBU/zK8tBcZr/QrPzLYFBeKJkiWPNOH710qb8lH6LgsDEVoEPaE
         lDXR8R0/PMBlEFG10qiDc0UjEYYoT3td1kr7cQD3jLNwS3NON668LSgX8R1b9Oe39Mvh
         0GLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+SFRHNd1OHI1xVznCEbFxdQXzU7aK1OCHg/6dc5HW/A54zFQ+nM3ETNUKgKX7OpYq1Mh59FVNdjL3@vger.kernel.org
X-Gm-Message-State: AFq9FYJXog+LN3BfrUuKgxVou3IvLvV9o/68LJQMooTSdSBy69CC5y4e
	0H6gnzv/Lm5Flvmt2S9G6W6DtVsNbtN2vAqq8bRZrH3pwsZeglW8Jv+mWITlMTe6AKNVuer9U6R
	4stgB
X-Gm-Gg: AYBFou39t0aFYydEd+JAUUB2C59s4DHBDGOrRK8fhRAWJ6c5vumORv+XIN+DKOux1/o
	qiSgGxonUmQMq4q1Cz7IYropUfXzklYFVT5boKsNHAZ1L1c60D56iYkV3yxUc6A2Hdjiufcxa4y
	XVwhY/ckEYkSOeU0O5tahOFtBRchk1T1Vgv8oPbbt8tzjS1L43/7CfLdW+A2/EkcmDeXNveCBCT
	hecFUAo7PxN1eC/ppEbly8MtCRQHb5XD/zLuFqma6tPT4Nnb7xJIRwbUIOgwXXIY62ZxLWx1Ues
	F8Es52rRwWQwHyR3oQjKt+YeYbMcgWFC1bxXNdAoT6MscOFBhc/XpsmeevpE81Tg5QTXgpCARm9
	3HMEoxxURq7AduRmrCcz0BChEGQnIuPzi6kpi+73S4xGRXAIHeq1bs/HqBuSeDfEIFows42ivIk
	nJeuvltWPbThGQaefA9x+DXyIVEz5nGmBYGDdsTLX0TA5Nf96ndxscF2xsPWYdApslivVFATleV
	v+G2m4Z8nV4/LyVL4HyKK7Pqc2Ja5wpUoDykdh9lmJTdk1WuHB55Pvt+pPEfpQDclSRSBIB0oyV
	wmDx48x9nnio
X-Received: by 2002:a05:600c:19ca:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a211c65f14mr11839735e9.10.1792721750941;
        Thu, 22 Oct 2026 19:15:50 -0700 (PDT)
Received: from [192.168.0.167] ([51.37.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21034b3d0sm47718525e9.3.2026.10.22.19.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 19:15:50 -0700 (PDT)
Message-ID: <e3d322a0-43d5-4369-bd09-128152f4b233@linaro.org>
Date: Fri, 23 Oct 2026 03:15:48 +0100
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com,
 akapatra@quicinc.com, linux-media@vger.kernel.org,
 krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
 konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
 alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/10/2026 01:33, Anusha Arun Nandi wrote:
>>> +    if (!cfg || !lanes)
>>> +        return -EINVAL;
>> Lanes must be a multiple of three to be valid, at least for your three
>> submissions to be logically consistent, this statement must be so.
>>
> I will update the name of lanes to data_lanes in
> phy_configure_opts_mipi_cphy struct.
> I will add more sanity checks for data_lanes > 3, as C-PHY supports 3
> data lanes only.

Sorry the only thing weirder than arguing with other people on the 
internet is arguing with yourself.

I argued myself down from this.

=>

One CPHY lane is 3 three wires. So data-lanes = <1> means three wire 
that only the PHY driver understands.

We communicate in lanes not in pads. There is no meaningful way to 
specify pads in DT - only lanes.

Which means lanes - I think we should follow what struct phy_mipi_dphy 
already models for us:

/**
  * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
  *
  * This structure is used to represent the configuration state of a
  * MIPI D-PHY phy.
  */
struct phy_configure_opts_mipi_dphy {

         /**
          * @lanes:
          *
          * Number of active, consecutive, data lanes, starting from
          * lane 0, used for the transmissions.
          */
         unsigned char           lanes;
};

For example in DPHY lane == "two pads on the SoC" so for us in CPHY mode 
lane == "three pads on the SoC", there's no need to deviate from that.

The CSID needs to know the symbol rate - so that it can vote on the 
appropriate NOC/CamNOC clocks/rails but... does the PHY driver itself 
need to know that ? It does not, symbol_rate is not required in this 
struct no more than it is in DPHY.

Sample principle.

So _really_ thinking about this I suggest

- Following the DPHY example
- Including all of the CPHY specific timings
   The ones you posted, plus the few I found missing
   Any other relevant CPHY timings we may have missed
- Include the helper functions in drivers/phy/phy-core-mipi-cphy.c
   IMO we should use defines not hard-coded constants for the
   specification of the timings here, unlike the DPHY code

---
bod
