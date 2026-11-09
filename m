Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230885;
	b=pnzXGa7Gp7+24jpO2VNT5BCZI9mVeKWx1O1TM151ya5eAF1UOShxsbJ5PoIZtMGke5VO
	 ayzF3McoJZA/fY2tsnmIU2by6wZeC7o4N/bngUKo2VWQX6oMdlHZKWdn5Jx94OgFz/A58
	 Ww1ouxb1d7UndUOz7BnXqDtwqMc67q8au6iBPhuKvHGuGZCsGS1IINhNC+e1WQJrNi+SB
	 jtx17O+Xmr/mljfGb0uU83T1vURQVrFlqLDn4nYVaFTN4KMZSjkejGvHjeAI4bFthYBbn
	 D1BqUjZVT+a+GX1v02G4PDqcXzmwowCiOESWfmFvU7t9aaK+9ypg38v8lbZgh3dmjEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230885;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=d1CDxwvd6FwMPzqWiptzkkTL3Tfq+jCUCb3bvgTMGjI=;
	b=AQUyYjtiDRrZzx9QMjPq+du/jfPtMQuQlEIp/5VSROP+znBRbmWFMQk3IRAJF0A9w7QJ
	 0g6fynt//aCtbkFtmpaKZZpqtOjYevF0Imc6MrSzf4sai4JXeI4ASbBOqFdg4sCmgnbRP
	 M47TFRxTHvr/r2p2GRfR26xWKG0JoVdxdnmF7eLnJFv9qEkZ3kSP+rQCrrfwKBIoywm3L
	 Uw3sUtSMITi+kLkQhhxMOX9j2zjsNw9Y8He87Nw+LlSeE8FNzSfEX1Wq/YvOYHrzpyDOv
	 tfFLeqV6BIqZSEBG2rioBd0v5caHMkHmPagMVy/oCu8Ah2N86pRWr1YKVkhrjfk9Fdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nVzjVU8O;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3004E606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 13:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3004E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nVzjVU8O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794230879; x=1794490079;
	bh=d1CDxwvd6FwMPzqWiptzkkTL3Tfq+jCUCb3bvgTMGjI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nVzjVU8OkAQj5/qD5urYjmL2pK8F8+9HDrOTDT1+nSYUY+UJU5hBj2SS6P5RwKfT9
	 h2aFdqPTQ5RC6RYY+n3U2oUWia5S18b2w0q2fs148IfdcyFnQT1N02e6BjJD//KEsb
	 lAvcTCYW2E9YimJGTuFfVw0TE7nfKc1B3CU2hQVOvup5W8IdH2CCz+oumLuigxDCMk
	 L1IYwFCfXvm5QuOQg+nTqKVpoK8d0OZyP34yGMYO8ODihmXusbtvX2ddG8StX5qoiA
	 X/VFM3irnn7RBRgv3Pwj7v9jX+ZxIgWLNVkkiJHem5sv+pGf4KOYiSA9et3WFn1T8P
	 PjD7zOD7wSHZQ==
Date: Mon, 09 Nov 2026 13:27:53 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261109132746.22125-1-lsa.uz@pm.me>
In-Reply-To: <avHDwGAe99WYaty9@kekkonen.localdomain>
References: <20261109093353.3757-1-lsa.uz@pm.me> <20261109093353.3757-3-lsa.uz@pm.me> <avGwRaKSqXdtXkII@kekkonen.localdomain> <20261109124610.85065-1-lsa.uz@pm.me> <avHDwGAe99WYaty9@kekkonen.localdomain>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a3bee21ddf5233bc865bcf357b8e7637d7aa5563
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon, Nov 09, 2026 at 02:59:44PM +0200, Sakari Ailus wrote:
>> >> +static const s64 vd55g0_ev_bias_menu[] =3D {
>> >> +=09-3000, -2500, -2000, -1500, -1000, -500,
>> >> +=09    0,
>> >> +=09  500,  1000,  1500,  2000,  2500, 3000,
>> >
>> > Is this
>>
>> The sentence seems to have been cut off here. What did you mean? The
>> table is vd55g1's, in the control's 0.001 EV units.
>
> Uh, yes. I meant to ask if this is a firmware limitation. I guess so?

No, it is the driver's. The firmware has both a target and a
compensation register (UM2829, 14.7.3, Table 39 [1]):

  AE_COMPENSATION       VALUE  15:0  SFP 8.8  Compensation in EV
  AE_TARGET_PERCENTAGE  VALUE  15:0  UI       Percentage relative to satura=
tion

where "100 means saturated image". The driver writes the target from
this table, 27 * 2^EV, as vd55g1 does:

=09static const unsigned int index2exposure_target[] =3D {
=09=093, 5, 7, 10, 14, 19, 27, 38, 54, 76, 108, 153, 216,
=09};

So +2.5 and +3 EV ask for 153 and 216, above saturation; I have not
tested what the AE does there.

v4 keeps vd55g1's table, unless you or Benjamin prefer the compensation
register.

[1] https://www.st.com/resource/en/user_manual/um2829-how-to-integrate-and-=
configure-the-vd55g0-device-from-a-hardware-and-software-perspective-stmicr=
oelectronics.pdf

Sergey

