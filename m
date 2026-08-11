Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F26A429816
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786442408; cv=none; b=MtoHf9gJiEARNRAGDeUoZ4ngXpvj1AVLoIIRGSB6VdxgKW6vTHP+1tl/tcZM2ZALpW1OmNITd3p5OQnheisuNaOI/a11wWM7E7IjCCGwL0LyrtPqOcpqSoR0qdbxuRAO/X8HWl9k7mnknd+fLqFAgan1r+FCVfICMEP8j+/z8Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786442408; c=relaxed/simple;
	bh=EzvbIapqp81oCvN/rV/sMmpa+Qq6k8aUToOc45y9d7I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uFot2ZKLiOT4eOCUXRdM6Fe46Odiu3ubiyzrd0QWD+DsM9V1xTbaDmwS0RbawWXVq/brvMnBAEqBsKAd3/wvjMLRUv513NECO4RnRRDfSxDIpQkHr6uy7AQO9vLLKz9e/KnU8vomYCMfDiHQPDKiP8q+33t/e0eiDFw1zVBHoCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=jVuhIJGP; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="jVuhIJGP"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1786442401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gb9mM62YNa3M980jvsV0Wc3c2VWrJY0STu0zD6FpqT8=;
	b=jVuhIJGPr2KT8VjXH4U3yJK1pu3vLLHRt1BQIVy9d9kQqYhLDZmifAp2f4x4PFL3WTQ2Np
	Jx76bQc4wLFA8wQ4ZaMnvmo8sP5mZIgVw8X2/46QiG2MOFxX0ftzoLwhI2JX84/NSEvMui
	8sZ83raoI40xnIlE3DQQLNSSaVoUg172Qi+fgmNv4nbUM3lIH5P5SAvtay0HJVwIzB9NCx
	5NpqSWL9WBs8aNy2WEzzSTdMDW52wLEni4OKKL2wRJI+480JDArORR28B9b9Fle0mZ4RBj
	3cK7qBDVH8WCs43qJu+YThfxjOz8xlkBiCh8sehzJazHWk/xhghUhcG6+jAS2Q==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 11:59:33 +0200
Message-Id: <DKM0YWWP935E.3K38J0LJL6AEE@cknow-tech.com>
Cc: "Heiko Stuebner" <heiko@sntech.de>, "Rob Herring" <robh@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Jonas Karlman" <jonas@kwiboo.xyz>, "Joachim
 Eastwood" <joachim.eastwood@gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable NPU on Radxa E52C
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Jimmy Hon" <honyuenkwun@gmail.com>, "Chukun Pan" <amadeus@jmu.edu.cn>
References: <20260810100000.2643814-1-amadeus@jmu.edu.cn>
 <CALWfF7K2t4nt05a4TugBjOQkaQK=M=+wDSeG26B33znyMMzhAQ@mail.gmail.com>
In-Reply-To: <CALWfF7K2t4nt05a4TugBjOQkaQK=M=+wDSeG26B33znyMMzhAQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue Aug 11, 2026 at 6:39 AM CEST, Jimmy Hon wrote:
> On Mon, Aug 10, 2026 at 6:20=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> w=
rote:
>>
>> Like the RK3588, the RK3582 has NPUs. Enable the NPU cores and their
>> MMUs, and connect the regulators.
>>
>> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>> ---
>>  .../boot/dts/rockchip/rk3582-radxa-e52c.dts   | 34 +++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/a=
rm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
>> index 854c118418eb..dd29a3ea7031 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
>> @@ -300,6 +300,10 @@ &pcie2x1l2 {
>>         status =3D "okay";
>>  };
>>
>> +&pd_npu {
>> +       domain-supply =3D <&vdd_npu_s0>;
>> +};
> Now that the power domain has control of the regulator. The regulator
> should have regulator-always-on removed, so it can be powered down.

Next to that, quoting a question that was raised earlier here:
https://lore.kernel.org/all/b9a5beb6-b701-430c-b667-44780736dd89@kwiboo.xyz=
/

"Why is boot-on kept?, NPU is likely not needed until OS has started.

With PD domain-supply the regulator should be enabled automatically, or
is there some other issue that requires boot firmware to enable this
regulator before OS is started?"

I do realize quite a few other boards have it too, but maybe they
shouldn't have it/them either?

Cheers,
  Diederik
