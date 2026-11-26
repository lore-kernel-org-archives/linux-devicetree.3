Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795738839;
	b=G3a1zFAK5Ht+SzmJJ0baT6GVKSQQ9BDZYUEPVrR16N9BkduyzzhKeriiqjmQ1THryEgz
	 qv+4VuoihHIw9oUNj60QjxETEt+aXeHyuO89KHIYoNajeFFPdlXzO/F/mrsi53K9Z/QrW
	 m2V2NepeJwtNIv0njaHw3FZUx5MrTeF4ATrMlF+9VKVQ9EXKqHm64FFTootdpznqGGAa5
	 4/xqu1Amthlz4xljVriOfag0bDboVIc/nUNZcehCrdW4tEatUt5PNLmMpizWNoDFlEEc4
	 iwQtHAx/YesqbYBiA+CaU7YDfhFGS5MRMrHhDq3Tcac0+R2hJ1tafGgVhucHtYoOpJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738839;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=H6tRRsQCF4iyzVxbUzhJCcNKza/mMttiKLDZ5wLU/Wo=;
	b=28hCgpw7SSVfK9+ihsNz4i3dPOpwytugUKBlbEMRlEUA/NN7FtMFlwj/Y9B8S708R18E
	 Q4y65XYlDY0SuKl+nPziflB+afR1qV+eZB3K60KMuh75xkCyi4AkwzDWo4Lpi62G4ybIJ
	 kUuXvgvAbclWSKLvjgh79+2Mx9ryyoK+IeTAyiMpf0ex5iqOar2RN81E0CmpPWn2PdIeb
	 N1w/KfRCKstcQtXefmXIo5E5Rujjdn7bjVCIc9RYNHIi53e1ZmqFX8l7n5kkXpH36lSri
	 xafNlbXdMDDtJCCSmnJV3548tRfWXFtEWFjuPMIuBktcQEwzY7P6jXxSIKlai70msrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=SpcLCQhB;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF9E606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF9E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=SpcLCQhB
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E30810A5CD;
	Fri, 27 Nov 2026 01:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795738832;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=H6tRRsQCF4iyzVxbUzhJCcNKza/mMttiKLDZ5wLU/Wo=;
	b=SpcLCQhBdkzksljTDxldG6WmnKmqpLXIivzMR94GmIDRFQRYx5Ka2Fmj88IgSpC0JA5dsW
	edkpaGR1OSTHY4CxAf4C7PJaKbh1zvNxlFMlxMaTg2EDyz3I+4NqHkn+J0L/sPvxKap9kS
	u7h+uNTDptkbZ7uPkrRBCoH8A3Tng5EWazvkGE2keLlEuQeFFK7WWEhtJteIAic0rnRBPH
	semGo6osjkKpX6+Wf0tja23NeZFCSnyAktoZLCeZOdq2quvBdaBLeX8lv05PJXkBYukXwz
	+Qfi/XNihhED6v8hawCh6qMZob4DIz6fh5oXQhk05mZthoN6L/KSUUwVPP3PPg==
Message-ID: <1ff22f13-08e5-40a4-b061-07b50b0135ef@nabladev.com>
Date: Thu, 26 Nov 2026 10:26:16 +0100
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
Subject: Re: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel <kernel@dh-electronics.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
 <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
 <4ef4ff8128b049d59a0ab23bea906468@dh-electronics.com>
 <5e607c068ea54d5a859e1de82c1574b7@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <5e607c068ea54d5a859e1de82c1574b7@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/26/26 9:51 AM, Christoph Niedermaier wrote:
> From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Sent: Thursday, November 26, 2026 9:25 AM
>>> On 11/25/26 1:56 PM, Christoph Niedermaier wrote:
>>>> From: Pascal Zimmermann <pzimmermann@dh-electronics.com>
>>>>
>>>> Tests have shown that, with the current pin configuration of the
>>>> eMMC (usdhc2 interface) read errors can occur with a certain
>>>> type of eMMC chips.
>>>
>>> Which chips are those ?
>>
>> The problems occurred with chips from Macronix.
> 
> To be more specific, the model that's causing problems is called
> the Macronix MX52LM04A11XVW.
This would be good to have in the commit message.
