Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4C9346FA0
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170134; cv=none; b=cPJcmM0gI8p5Hx0/LMWnaO89kGTT6ybMMHKO4iLZ0S0A0dit8wr1+RbaBFvVjQNjde+M4mVVcrRKnN9sdpYbx6+x3y18QOaMULHDfp/qw5Gwhvs4AVEmNjYrVceL3tlCnVkrvuAjg90UWPdrubE05MDf+Ja2cTziO9nqZYtT6UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170134; c=relaxed/simple;
	bh=9O9rAbCp6LhGpKp/O/bpx6Kd7dSvDjEqDrMSqpiXYSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDC5ukhHrWATx/ZbgTf5g2pcUOjRNcWhtO2ypQ3iLNF73UADtHIw6W+HT1iTbcCdN6iXVRwzNd982FrRppiVOxzh9d5A/RD2UtgZz4bhM+2GUwfM/2Rcfx4PqdtP3R01hrhrZm50lyLdGnkqYkcLxSorBnpCkhgfEX4/vCwI1Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hfWYg+3Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UdvfcPzN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hfWYg+3Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UdvfcPzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781170132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3uwOwtcNS5mjb7Xnt9p/AnzVERIGWIFYdvxM1P9+a4=;
	b=hfWYg+3YLq0PEG6jvo0n1hRp2vECOfaQzcYtTRhU1t2YIhyzVzHM4mWGhNkdYxxe5NNmsC
	7Z9dLTgwt7ejGFdwYwUCTpCKqEZQQxsrB7sg7PneaOwd4boy8AGjGGV+oPs+IHHd7Vyx7c
	uUuC4QtQbfFKY6gxtwB+pm+fRXW+E+4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-llx2m1aGPNmCYz7FOu9vBw-1; Thu, 11 Jun 2026 05:28:51 -0400
X-MC-Unique: llx2m1aGPNmCYz7FOu9vBw-1
X-Mimecast-MFC-AGG-ID: llx2m1aGPNmCYz7FOu9vBw_1781170130
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-45eecec7667so5401541f8f.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781170130; x=1781774930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3uwOwtcNS5mjb7Xnt9p/AnzVERIGWIFYdvxM1P9+a4=;
        b=UdvfcPzNPivwmdPmfFZeQ1wHGlC3QhLDOpCyi1dmQ2YXXdLhs+AgYzNDBlCUGQpHEe
         aXnHhvp0/HthClsiL2KgGYQUuWgZpVbZaLKIYLpTQFE9KfhzIEHdQcIrSm8tXK7RxMUr
         MKD0+Y6gxqmtXHx+5/zW9r5VPVbjQIsAdBddv7zF4k/Vm25HDPCOgI3Ekt/C/9ohyeEH
         TURNTSuIXTJtAZB38vh/ACi3hYMaZJSIG9dkNfm4C8jRyiJOJLiy0LfXH8fOjX50XtsL
         jCFuh9a1nY7MrERsjfKe4NyH00Ww35lv84HxHQe3E8upL0vf/dxtmFFrxymQKA1w7IAv
         utOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170130; x=1781774930;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3uwOwtcNS5mjb7Xnt9p/AnzVERIGWIFYdvxM1P9+a4=;
        b=JOn4JExT5jjahEGeQwwfdIJq2j3F4X4HTv/Lir8wNfiXdCrfZZQjE6NNf9aE+OGOXA
         NNhGVXiQZs5MKHSWCSJ3+FV92VCGX7e7TlhE2uppSZ7l4mzRSK/xcRqLDqQuAmafhUVS
         sHhDR6aM7vPtiM36A/bi7+abbMFFkJ8agFHXeEX7YptCIs0b4cDrDOr4Ed9op4whJ5KT
         33o4rh8sTKa1ERX3zWdPI9OrPrF50jKuvv5x+JRJjNPrRv6aNe0ks41613IH0ALIC9L/
         X32cOZ74xLJDCHYIGn3Yhfv1229HuKDI93jhx/khUWmd/AjWkRT8a1QWwe/skTNYALab
         vh9A==
X-Forwarded-Encrypted: i=1; AFNElJ8+Vu+ik/qSrRaSbl6Vm7//R2FAfcBOEtA9mpZHIVcRKOEfcKmvUnlD+lq1lbzzz6l1v17b3bZjJnbi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1m78XIAYB6D8e/QPIj2e0qJnp69dy5IC9kU7S5UnsQocfgG1H
	oQ189e86agK6xHMJ8akSXUIQC76T8uXCuRvi7RjT6y5azA8ibi7Qg+RBW9Xi+A1vwq4kSIhhHo9
	MsBU8jHiNtMudu8qWZUxY6c4K0n4C2USMQfnIgJWUzZiKWTQ5LWnAgOaCOR4qltE=
X-Gm-Gg: Acq92OHyAktSmKRBYfNfSpWONb1xx3D120yZEeOWDByrvl8O8+vWK1n3sZWBSVDIRSV
	2GnElByXJwpD2AoBP+894ULHHHQ8EVDpk3mkwtQjmTfDbGzIa0p2CeSAxH66KsVFx5Q/1QyZtOU
	7b9oEkEL42oRbJyWKusxkLD3IuHQ5q2f98o41m2PXVVzk/MgLOsS6LgeMGv4MHxF1XVN+ax84xk
	vcdZOI+VdjBRo9o4ytQz9V/nwXwrlsG1mcr86/2OAM9ubFFIQJWCInNAMlcggo1qJ49rt4UV8t7
	2YtOGsJTcbHDbLfOkSmF2cWzR8e6vwNe3HFDCD9HHufs9ilc9mUlVMtEAuI1o2PLs02RCOeumBA
	ztnkNfH7p6+UTMZdFHL2oRZ9kRkJHcQPYJPUCzu1FkhKWBoa9WGjbD4SvC9FTktFMKQ==
X-Received: by 2002:a05:6000:4289:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-460677c089fmr3386192f8f.25.1781170130019;
        Thu, 11 Jun 2026 02:28:50 -0700 (PDT)
X-Received: by 2002:a05:6000:4289:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-460677c089fmr3386136f8f.25.1781170129620;
        Thu, 11 Jun 2026 02:28:49 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm80443345f8f.2.2026.06.11.02.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:28:49 -0700 (PDT)
Message-ID: <850ba1ab-78fd-45b3-9411-97d50bb02ed9@redhat.com>
Date: Thu, 11 Jun 2026 11:28:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260605-ipq5018-gephy-clocks-v3-0-f232d9ca0966@outlook.com>
 <20260605-ipq5018-gephy-clocks-v3-3-f232d9ca0966@outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260605-ipq5018-gephy-clocks-v3-3-f232d9ca0966@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/5/26 2:41 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add RX and TX clocks for the IPQ5018 GEPHY to enable the datapath.
> 
> Fixes: f5f2b835e316 ("arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

I think here we need an explicit ack from arm people to take this patch
(and the whole series).

/P

