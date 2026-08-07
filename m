Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718453EC831;
	Fri,  7 Aug 2026 23:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786143620; cv=pass; b=FwdlENPSI1SzZM9i6Dj5hhAvvn7/gpIBoSCLG7wI3Jb/xNIoop84SVrbRqR8J65f/9VXHASNzmH4bXVcIHUsh11UWlXSPv57mjteEoXif4YlskHH5tzyRzNHZ5MU5Rajqt6MBrgOjznpUOtjpxDBHIw1lVCwtzI1Inar+9LKECE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786143620; c=relaxed/simple;
	bh=RDt5rThi+8kT19hmjx0kwC6sp1JSxLXiSSDth6v/0cY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6ZZI2jCKkr2H5CKolz9gab1D97qT6316I5TTWQbyBuoAowkjETzufacnm/0iIZ1hk/8ll3PWNVUTDjWQZn9uVKFvmsL3FbP23++6aDOOaVYhHRKFholnDw9jmKgrR/dCDgJ8pK4eFY67zSYZ5VscOvAOYTBocg0LVY9nCXqY0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=XeCRWaiX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="XeCRWaiX"
ARC-Seal: i=1; a=rsa-sha256; t=1786143593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LLvs2gpzS8SgUtUeacIC+uzGYsrA51G8l+88ra5+zuOVvfPhbzDxcn5hA9Qx4vze4dBxsH2fEHaJOuy+KVY7xg82Jo9ibM9xX/7fRL7JY45G5/eCBCO/EJk1+9erZrTwqeo3ut/wCSO/LwluLBSTyhwKiP65QnRD/J9y7NMmfDU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786143593; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PovC8tV+FAuVh4jx5hdX+cj317qClrsgi5NccKsJXzY=; 
	b=hv/wsn2ijQkgORKJ7b0MjtG2iTAEQkVwgr1utp3aGUuITv5EBw/ZAiUXHmCMBKSa+NsYa+qZO+X2hg4E+DSd8tQeLWeQdiRWZvANI4IdMKVM2xjb2ow9ky4mc+HBNXlLLkulWZdN0afYpXxS7asXKcaqs0rheAc8TJFs6rsK9hE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786143593;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PovC8tV+FAuVh4jx5hdX+cj317qClrsgi5NccKsJXzY=;
	b=XeCRWaiXBEkaCg/JPc5k0y2jYej7omXUEAkV69DJrmxWCawPoKVeAEYZv/6RS739
	gQmdeVP13IIi8B9bsX39gH5MNe+IQPjt3lEksjayj5Bq6FtYY4/bU+H61C0MhvG/0zd
	n6zT2PKhOXXsN8MICg9TBwH5pWR5hT0XurlMt0aA=
Received: by mx.zohomail.com with SMTPS id 1786143591981605.2798606263314;
	Fri, 7 Aug 2026 15:59:51 -0700 (PDT)
Message-ID: <00d6ee9d-0ef1-41d4-8cd7-affb320b84f4@collabora.com>
Date: Sat, 8 Aug 2026 00:59:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] phy: rockchip-samsung-dcphy: model TX and RX as
 separate PHYs
To: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-3-cf9cc34a412a@gmail.com>
 <7e55b8bc-d11d-4b25-99ee-d5d181be158f@collabora.com>
 <CAPwA33Jnp6N7a=2tcrgEzFxXRpbxEO25ktrRDiea--9Uy5upNQ@mail.gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <CAPwA33Jnp6N7a=2tcrgEzFxXRpbxEO25ktrRDiea--9Uy5upNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Jason,

On 8/4/26 07:38, 楊智成 wrote:
> [...]
>> This approach with the "first" variable seems unintuitive. If you need
>> reference counting on the BIAS block, then use a state variable
>> "bias_powered", use a mutex that protects it, and call
>> samsung_mipi_dcphy_bias_block_{en,dis}able (from
>> samsung_mipi_dcphy_power{on, off}) unconditionally. Those methods shall
>> acquire the mutex, check the state variable, {en,dis}able the BIAS
>> block, set the state variable accordingly, release the mutex.
>>
>> [...]
>>
>> Not sure whether you actually need to track the power status of the
>> individual PHYs (maybe you actually need to track the BIAS block status
>> alone) but anyway I would appreciate if
>> "samsung_mipi_dphy_tx_power_{on,off}" would set the "pd->powered"
>> variable.
> 
> Both of these lead to the same change. You are right to be unsure
> about the per-PHY flag - I checked, and its only readers are the two
> "first" computations, which only decide about the shared block. So the
> two flags become one count in the parent, taken and dropped inside
> samsung_mipi_dphy_{tx,rx}_power_{on,off}, and the "first" computations
> go away. I went for a count rather than a single flag because the
> release side has to distinguish "the other direction is still using
> it" from "nobody is left".
> 
> The shared-block helper will use lockdep_assert_held() rather than
> take the mutex itself, since samsung_mipi_dcphy_power_{on,off} already
> hold it, as you noted.
> 
> One thing I am unsure about is the enable/disable pairing. I could not
> find an enable for this block - the four BIAS registers only select
> bias currents, reference voltages, the HS output level and the BGR
> chopper divider, while PLL_CON0 in the same common block does have a
> PLL_EN. If that reading is right, there is nothing to turn off and the
> release side would only drop the count - in which case maybe the
> "enable" name is worth revisiting as well. Does that match your
> understanding of this block?

My understanding of this block comes from the TRM and the downstream
driver. TRM states that the BIAS block is common (= shared between RX
and TX), but Downstream driver does not care and just writes the
settings for RX and TX unconditionally.

There is also something weird: the register description in the GRF
indicates that RX could be in CPHY and TX in DPHY mode. But CPHY and
DPHY require different values for the DCPHY_M0_BIAS_CON4. I'll try to
ask Rockchip people about this.

BTW no objections to renaming this to e.g. "*_configure()" and use a
flag "bool configured;" if required.

> Separately, I noticed "first" also guards the APB reset, and only in
> the transmitter path - once 4/4 enables the receiver, a receiver-first
> power-on does not get one. I plan to move it into the same shared-block
> path so both directions behave the same, and check both power-on
> orders on the board before sending v3.
> 
> I would like to fold all of this into v3 together with whatever comes
> out of the PHY_TYPE_CSI/PHY_TYPE_DSI discussion in patch 1/4, since
> that decides how the two PHYs are told apart.

OK, makes sense. Looking forward to v3!

Thanks and best regards,
Michael

> [...]
