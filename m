Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913138;
	b=hmhB4iwH5xqBGH6/PoBfmr0480MO6fdPRP6IngeoLK3RUGzEQp84uj08P5qzT90A1viY
	 DX0inxeffCbIi5O8XJHfVMirb+yw3/bK6Ide+SvwPudz0Sdnp9dOi2pB5dlInodJjiuEe
	 slVvTMFf1vAH+PglysmFx8O11mN8PLZGmHdj16mTeYbTiN6R5RyXRdZ3q//CZiMO5zbK9
	 Lm+xGj7EgmdAg38HrabQ8nPhieDdSW5yi51XZLvZ/xK6woTLHjVZNNxWUFVEM4XnMFiI9
	 fWrEme25ydkgPg7KdWiXQ3eu8NXoNg/m52/jEg1Xu3QKVfCm0ureBydikODJT+h5q7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913138;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OGkkwpJSIV9JuodiKgIqIixCIYC6eRR5jxC6vkeLTsI=;
	b=HznmPWS79twlVAqD/ulZA8krTPytxtfekvq0j3/3F3cvjj9QMjT5bhQvukVUb0Rh3ova
	 U8OlDFpkXSQs7slalndXLn9oROWXyEL6Ri6jeJMt9FRVxJHJRUiAqaio0neFH2kYaXRt5
	 aZbWjJjchA7OhtB8EJIha7t6OZtY2qRGqahMl/roiyZdWQbX7jyKp1lhdnognDYX20QSo
	 fZgYeYQpMDDyHZscwjXFKIOBtQ2tLkJx/+y+7LmtQWQfk952UbCsm52KI0oT3Ljm7h5yX
	 oFygGCMY35gaJuP9aqVg9aTxtTV/00nyIF5tuI22TEI8dCq8el1KQmBY3TLbfANsx/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fA3iYOXk;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AD1606A332
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9AD1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fA3iYOXk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794913136;
	bh=AWiCLlaXwkS9O/yDPdbP2rIQCE4NPNdDIe+oTb7DwIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fA3iYOXk/D4kjKxt/cE1G75LccaMVAyweIYIheFvJ/kngEoAOKj64VYs+lHoAxF6s
	 fa2ngDRMnHkHo2/UEELtoigkHnDmV6YmKdhrTtqJlrfpTNZ99ZVZggH0UMdHhgwazv
	 z9LB4CFofk43b37Ylv3MSSMmesQ39rYOO5BZAMqMkulShQumxa1QHoxzWzYUjVCetu
	 wJo2G/MHpQQvXGgqkfSXlTlDmFmxmp6cyUvdPCHil8ogF0zNg+e1usSKM+VbeDlrro
	 zZyvmseABgdUKdZERBDU//TMddGwPkoha2MhBHyIHRO2QFegCP7zaB3r6C11zEyEgK
	 TmCJbA/gOUoDQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C894C17E00E8;
	Tue, 17 Nov 2026 11:58:55 +0100 (CET)
Message-ID: <df9dd11b-02bb-4cf9-93f1-6e79868bf4d4@collabora.com>
Date: Tue, 17 Nov 2026 11:58:55 +0100
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
Subject: Re: [PATCH 1/5] arm64: dts: mediatek: mt8173-elm: Clean up unused
 MT6397 regulators
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20261109141233.983830-1-wenst@chromium.org>
 <20261109141233.983830-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261109141233.983830-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/26 15:12, Chen-Yu Tsai wrote:
> Several MT6397 (MT6391) PMIC regulator nodes in mt8173-elm.dtsi are
> not actually used on either Elm or Hana according to the board
> schematics. They may have been copied from the EVB dts.
> 
> - buck_vgpu: Output pins are unconnected; GPU power is supplied by an
>    external DA9212 buck regulator instead.
> - ldo_va28: Only connected to a decoupling capacitor for the PMIC's
>    internal audio codec and fuel gauge ADC blocks, both of which are
>    unused as both boards use an external ALC5650 codec and EC-managed
>    smart battery.
> - ldo_vgp4: Only routed to a test point on Elm and an unpopulated
>    resistor on Hana.
> - ldo_vibr: Output pins are unconnected.
> 
> Keep these regulator nodes in place so that the regulator core still
> considers them constrained and can disable any unused rails left on at
> power-up (such as ldo_va28), but drop all their properties and unused
> labels. This is meant to preserve prior behavior.
> 
> Checking the regulator nodes against the schematics, drafting the change
> and reviewing it were done by an agent. Manually tested on a Hana
> (Telesu) device.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


....but this patch does not apply cleanly, so I couldn't pick it - please resend.

Cheers,
Angelo
