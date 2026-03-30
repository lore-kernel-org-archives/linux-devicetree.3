Received: from courrier.aliel.fr (pouet.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBE83C5DC8;
	Mon, 30 Mar 2026 11:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868486; cv=none; b=aaS6v7gRUpDFrHRWlFrownKVm1o8hWOzlw4uXWi2OtQc9seXw90abjkfaSgPxJAgVb1WSks5NaMszjXLsFrFXpbNg728UHbEvee0ZlKVW+eDSDW/lc7o0o6R86jold05+683VR2v5E5mTm2+o3n7snVUsQBB0luuDXeRldZkcZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868486; c=relaxed/simple;
	bh=gPOPxtR9dBImR4mZtM3pZ8L7sTxbCUXJst9ZTpej2H4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YA39+hftwtufqPlL46+vHunwctqYTi9eCF55ijMoHNPGmRxOrKfgimwdDJxeO7Gw9854/x4tnt/Go0tnsjl/TI8SbDRZ6Wtvt5PQ8uMkIiRanHt0sCHlR/oBO8FxTh/ZbzYcFtzZOTG6Xtox00V9yLQf4ape5HQbtXNm50ajiKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=I3kEhhRb; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="I3kEhhRb"
Message-ID: <02927f87-fa91-457d-af2b-a7610ef481e8@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774868480;
	bh=gPOPxtR9dBImR4mZtM3pZ8L7sTxbCUXJst9ZTpej2H4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=I3kEhhRbqYk2rPZmeCBhucqJlRJGW1f5ryoQGi6LsiJFIohGgdVQFL46R59CPh37J
	 wgqLajLhrX5Lr+7+7TrIqpe7I1kaVanF5nxpUqDx5oU4vTsYy50JfFTL9RF5WWmNJ3
	 Cz1hY2y1ivnZpewbI0vTBLB4WCPSkVk+sb/HYm00=
Date: Mon, 30 Mar 2026 13:01:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH] arm64: dts: amlogic: t7: khadas-vim4: Remove invalid
 property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20260330-fix-invalid-property-v1-1-e829c4d806cb@aliel.fr>
 <36822ad1-c73d-4903-bd39-091874558f10@kernel.org>
Content-Language: en-US
In-Reply-To: <36822ad1-c73d-4903-bd39-091874558f10@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/26 12:38 PM, Krzysztof Kozlowski wrote:
> On 30/03/2026 12:21, Ronald Claveau wrote:
>> Fix introduced invalid property for Khadas VIM4 sdcard regulator.
>>
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not allowed ('enable-active-low' was unexpected)
>>
> 
> Fixes commit?
> 

Thanks for your review I will add a Fixes tag like that:
Fixes: 60eff75ac67b ("arm64: dts: amlogic: t7: khadas-vim4: Add power
regulators")

> Why there is no such change in recent next? Was it just merged?
> 

Yes it is in next-20260327
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts?h=next-20260327&id=60eff75ac67bbf5445bdbd2842b0109ac591441c

> Best regards,
> Krzysztof

-- 
Best regards,
Ronald
