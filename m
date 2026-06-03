Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA8A3FF8AA
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 20:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519336; cv=none; b=BzDV6WMv+zRdjwMLNurHabKuQWhZc+dzWPE44pnBv8MbzwtcOrPs0qQFif67F3+e9AoeYVeSRElbllAJvmoJ8AZunyoF64HT8Tw67UjnFeAiXMCuEOoS0+4kA90mtwjCbOziRxUkZkSpE2U1TjGAZuPs47eUHl/5gOrJtt/tFSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519336; c=relaxed/simple;
	bh=NL5LlForqYlh+fcRsfduuGF8C586rzxAZDzcova+u04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mblH72tdEcpnjM3dieBxm/qINdewJKZhZOvdJL7WhLKkZQkTVcMvVhsul51+75AT8SsCB9EYa/AZEGpIFGRhkzabBPEMCai896CQo3QyiubLhR+M7hUIWK64PqL6Bz9FfxhY1oPgGEijhkT2aqOi4YRyI+bilGhpeqafig36lrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jo+wIgNB; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jo+wIgNB"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-396770d7f8fso5112681fa.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780519334; x=1781124134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKtbINASkuxxe/pYPg2E1h0L+MT79XjrtpjoA45kS4I=;
        b=jo+wIgNBbxyAecLYjcLmeKFAHMwp7tZugXinVwPPjFXlJ8ADVk/TA9UClregWIkD+F
         UFYuwert/plUxkp52MeC9UUvfOa1fzGvU95BNmqGSOTIa3j7WOlnliShjREdRmo3wlK6
         vIv7xqRrrFKp6ejK1HrqAVgEO8w4n0VE4X2Zmv0QaGj0FsvzHZkOmJv/ZPqOmzlTGcBY
         rb6CobN6fo63BYNNFzW244wTqdPZ/L3B0Vu1bhPLA5B4hNvcu52/05UXOn0O6rmAP/dQ
         QmJGg0Oe7f231yhvG29hdx2lPd1nROJSeb6uRnpW9NBnytK0o9SxtxpDm513mHCADfJE
         KAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519334; x=1781124134;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKtbINASkuxxe/pYPg2E1h0L+MT79XjrtpjoA45kS4I=;
        b=NLsP/9T/H8OAuNG1dRsI0+ffO1hrFkjARpZR3xsTabeVI/vtUDAa5RF5exjHCHvg+1
         xJPH7pselqpoLoegUjJzEul6Qx9dvTcA+AL/7ELJhbSwo+hH50pU0mESq9Mcaxy9EQHj
         AgL9pwWbTumxxrL4+up5wXHbSztP8iaRGRtCnC6QOxfhfnU6TjLuUDXwE+00k5mN/9Xv
         p2JyLNgZ+ZIeDiDvlkUDnZULFmgUZmQAzcu3N51FdDyv0Ci0k9tNch5XwqevcaJqDuDZ
         Hc+1mjGTe+ea/tvDW8LE31AQBdFMH3OlIekpEu2AqkFR20brr61hh9Ibk0GRX0fcOiCb
         SkZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kGL1VPHaqCJa+zs4d5JwV6FUzGlOON7+30WoTPRuaWffvG8S9QtkRTghIsK4cDMRN8DBc4vNKBhaO@vger.kernel.org
X-Gm-Message-State: AOJu0YzPYCB+xtF+Mf77kGvguQ+mnj3KnrvzFpwSVhlH+wvwuVRyKrFw
	UN5QG70PTi8wYqQtcdarT+e7dthVzEjvlpeYPY4nRtsy0vNFyVmRFsTMCefPXHr4/A2BQLhkJGe
	FD7kEeA0=
X-Gm-Gg: Acq92OHemIAqcDBNC0gTUkePBX7JrNwDRfD6j+5Wxd11DFoIb+v8yaYWfsjDS558NZU
	YWwQpT6RNtnW5RfwMXMuUXM7M0AiNSoXSxqwapDMihkYd8JQ9Rf+hnfF7FNGcC0dUhr2hJRF5S4
	Gdmy1+NLFYmb4C3iJLuRWubiTrJEpQscg7kUClNr9cDXs2+RYpS18TMU/ED5Xi0vj1MWivKKud5
	Mkui3zPhVD4ZlDZtRH430YGLQjuJheoJJKmBg2Kat5rzKXB2xY0LwmqnWfjQ9xxeGQsYdjtwqBM
	O4SBF569O505J0wO42hYp52Dc2u3xl29g/jgyRwybUn6Y/mqITu2pBeAG1MiGZJqcVO0oT6o8rb
	kPmsRXQkm2OwZjoPQY1El96g6dCdRqIwA/Fq6XEN9GzRxP7DHCYFGQdgaqpPIjur1nUVJQzrOS5
	ACesB1eDKTnVFoB/yJuSto/pizL5d2AsK1U8PyKjiV6a42sYAmy9riI9WOFIj+TnRZKjiR+fHWw
	KH6SOLP81FLm3mZ
X-Received: by 2002:a05:6512:6c4:b0:5a8:6f01:e1a0 with SMTP id 2adb3069b0e04-5aa81edc1c6mr4375e87.3.1780519333830;
        Wed, 03 Jun 2026 13:42:13 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907269sm837408e87.34.2026.06.03.13.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 13:42:13 -0700 (PDT)
Message-ID: <6e962010-8097-4b52-9369-0727c0d5a31a@linaro.org>
Date: Wed, 3 Jun 2026 23:42:12 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
 <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/26 15:57, Bryan O'Donoghue wrote:
> On 03/06/2026 13:40, Dmitry Baryshkov wrote:
>>> Are you sure about that ?
>> Yes.
>>
>>> ipcat I thought designated lane 7 specifically as clk-lane i.e. named it
>>> CLK_LN of some description.
>> Split configurations explicitly use other lanes for clocks. E.g. check
>> the RB5 Navigation schematics, CAM0B connector.
> 
> Can you please check:
> 
> CSI_3PHASE_COMMON.CSI_COMMON_CTRL5
> 
> 0 LN0_PWRDN_B Lane 0
> ...
> 7 LNCK_PWRDN_B Clock Lane

Please note that media devices have a numeration scheme of lanes starting
from 1 (it'd be easy to check/confirm it), for instance today CAMSS has
lane numeration starting from 0 is out of the accepted scheme, and here
it'd be better to correct it and not enter the same pit.

I don't have access to the IP spec, anyway I do not grasp it, where are
8 lanes on the CSIPHY found? Each CSIPHY IP has 4+1 D-PHY lanes, not 8.

> 
> ... just a badly name field
> 
> CSI_2PHASE_CTRL10
> 
> Bit[2] = IS_CLKLANE
> 
> Right so CSI_2PHASE_CTRL10 controls lane mode, indeed. Thanks for checking.
> 

-- 
Best wishes,
Vladimir
