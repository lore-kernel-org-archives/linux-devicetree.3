Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DCA3ACEED
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276202; cv=none; b=GxHZ9n9bFGdn/SBJc839n4LnT/whdiwKc/GUjvbEuvXwuOka1awd03d8PKX3ngW5/V+CJ41VHiKY92fMl/5r9hYMC0hMyoMWvfLv0xs3HDGTQQZ99T6CU/iRhGsPXuvw2UhgXUItxXCsrTUCsUikF66ejzfYsoQ9me57D+ElT9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276202; c=relaxed/simple;
	bh=L9ELsUTCwMNy2+pfr3ESCvpylSNoN2JspHLhkSAs054=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kk/vbmXWp1kMJdpxd4zN9JA6k5hLDnrh15l+F2tCWHV1CwMClVqurGEqhAef4OdNmchHWaUUUMzWvUM9lIPPNMYdm8AvDG+gkh6rybsGdxRD6TolL3SgvbbZ4nfJAYZ4O9P98qbt9wbkcfwKb2mJM/zg1OEPFaCUihPOrJqEbDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lb8LHQlb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lb8LHQlb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so27209535e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774276199; x=1774880999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWptjvE5w87hMNihQLfqZsM0Pn6ChnKPjJO5RmlXBPI=;
        b=Lb8LHQlbKCo8jnCkYk0SS4Sk8py8AGYKtQSSS8x/8BzBxO+yznjbRN4EE+Oqp597r/
         fPdxnn3QwpnDC+626DI0u33YaFEe3IL9ZsE81A2HnNGjXUKZ764Q+YtDMg4YRCwnchm1
         5I9e6+S0g6WHKTw8tsfPSYm94spwnD+sNmp+dCs1Do81gZmJ7rd2sNOAV8WH6/jxd6Vo
         0ALUlJxM2V0VNCYnXsdg46wcmVIQE2Dc3/GrDNjmbEMuL/qeiMkxIPHR6CiIcKfIgOiz
         VsDIVaQEGPoS80YsgNWPhRnttJY0EInETY5bbl0+CyfKOdH3MdVEbMYP4xalRS0ZPFKi
         6nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276199; x=1774880999;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWptjvE5w87hMNihQLfqZsM0Pn6ChnKPjJO5RmlXBPI=;
        b=BucbpujbnzHZiA7MIKqRt9G+TpxDvXHXwf18bfGJ5d39/u6NCC0W6IIJJyTDeNAq8W
         RBMG2XGCEk3mC0YFDjr6Xg0oqxzr9T3yQVGNGQxkJxVyehESiQWE+dt1JWOGYx9gqCbA
         SNFv4XxSRRntSjvbA0jcahWTJqmcfKGRQBEHF4HQB8L8WzMbuXUMY3V/6Npl2bOxfiuv
         DSfo2Ce68S1V3EYHMHO+25GC1qIOhfRBVgyaXrIbOyfPZPypdXy4tLAWpt3I9JcljeGO
         5XDSxIvdxWHAaAT8sMbzL8enOrwNSoLo6FM0HlRJlpR7kP7kI1rlMnU1K+l5+jtPYgth
         hoQw==
X-Forwarded-Encrypted: i=1; AJvYcCXyZKA3PYzKJMEjz4oT5nuUO55Q4/sKF2AOQ2VNrIyjnEy6aqleOvf/UKLIGyPQ5Zhn1gvNPmJ8ugMy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1hWnUuOOZ71f8maLCzhJT1GOidKy+chOqEvlJkekWtyrr2/TV
	CAWEw6LqLnrTvPavmgKGJV6BVqFFYCQjlpAKXyT/ZaLpwvp7nFGdhzJS7VlgSYU8jRA=
X-Gm-Gg: ATEYQzzmiujJf+81GAo1TwdEwqC3GUEOrrQI3To7ipjLnzqG+gna6A7LQqJGZtjTnaf
	e8XQC3sOSWpo0X3reRckpTZuRDSDRoGb/5BOyceFTh7n/Uhu5dr3+1xU+WajAJLziLSL3kGAvcS
	3EH6vv8X1yOyd7mLjoiMxAidAjVgAaQdvQeLr+2q3Xj6JNA/5TTx2YS4fHdbz+Xad7Twh0Ohafl
	GxM+j9mF0Nx44rOOOeNznkPQIA0phsunKWKVZM/teLBQZhLMjo/4BRkJZ40Rkz9uTo+4ONwX3F7
	3OSC4Y2rSn463ADZlX5l+9YKmn13FaDPrdNpV+6LiWHFRJ7GhP7HYHSyqgEVE22OmsJM4lPR0zN
	mW3AtQKzyma5HEp4BSOlOvxF+TsiAMAlDIJ01Wvisszoo/+oIrkBFQujFgf3krLCosR48u7RPeh
	AAqPXqQxMEPQvn093c0dsl9mRERzaKnVkOuwYu
X-Received: by 2002:a05:600c:698e:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-486fedd80c9mr156967985e9.13.1774276198953;
        Mon, 23 Mar 2026 07:29:58 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.102.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe967c64sm280452265e9.2.2026.03.23.07.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:29:58 -0700 (PDT)
Message-ID: <8acb3888-0ef8-440a-a680-14478bba3ed1@linaro.org>
Date: Mon, 23 Mar 2026 14:29:56 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
 <3VqSGUgMUKaCja5WYOrOP8nJ_mw_eDPdItA8d1CvqUg4ASPS5IUc_aT2E-XIo0YmnYo8QltXVw8_6NDxtdqGGw==@protonmail.internalid>
 <5705b48a-fc24-4c5f-aa6d-40952f0070d9@oss.qualcomm.com>
 <edf766b8-2664-4dac-b626-551807b3e5ef@kernel.org>
 <4afceefe-8053-4c10-8595-39dab9379aab@oss.qualcomm.com>
 <4b1b5b79-df37-499e-99c4-1a965a9b2455@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <4b1b5b79-df37-499e-99c4-1a965a9b2455@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/03/2026 14:22, Konrad Dybcio wrote:
>> Sure, FYI: Dmitry, Konrad.
> I'll admit I haven't yet read up on all of the background discussions that you
> guys had on LKML, but*if* we're going to put the PHY under camss, the GDSC and
> CPAS_AHB/CAMNOC_AXI_RT references should be unnecessary, given they're not
> related strictly to this PHY itself, rather it sitting in a specific corner of
> the subsystem that needs them to be active (see related:
> https://lore.kernel.org/linux-arm-msm/cb2430f2-8601-4c72- 
> af6b-10f1ff16c188@oss.qualcomm.com/
> )

That's fair comment with the PHYs inside of the CAMSS block. Obviously 
if its outside of the block we need the full gamut of clocks defined.

..

Yeah I think I'm happy enough to drop these predicated on sub-nodes.

> For the other names, I*think* we won't need to rely on them (i.e. only operate
> the resources through PHY APIs from the V4L2 driver) and can come up with new
> ones. And hence I think we can turn "csiphy" to "core" and "csiphy_timer" to
> "timer" (because we really don't need to repeat the csiphy_ prefix)

Works for me.

---
bod
