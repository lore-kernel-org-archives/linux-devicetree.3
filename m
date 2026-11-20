Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795170409;
	b=3QxlFWZ2PxKk3gNoL54WHIIl2RHUlLLa8Ed4Gk3ux2FUttRdJr+nOm5VND0KaS8XDp3H
	 UO5v9WqjqYB6jk8HwicXKxO2nFLhRvInv9FzUd0umk8v8SyYVuo1y60OBbyQSis4PiwIg
	 AB4lJsO4jnkdFU+UeY/uRXxrJ9mXGkdLEaeASFqSxjhKaaPbx0PS+nSxSLxELIEHuTc6l
	 Z8G39LecWr/2CkCyvupeMIziwf0ROtVie0jrYK/xN2pOpEEZbR+ymLg5tuXYiFxTETZbw
	 4YDGPVxJIgTRYtDCJuQkyKE2EKiE/4lp9ij6lXsry7wZazwF6LvXcBTvkDMoZtozU2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170409;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=j5Ce4d8nCM+piZH9frIPw21eODt2zq4vwjw4r8+6bNI=;
	b=oIP2df7tPUsA48a0f3mVzQ74sQ1v26gvsFOu4fEM3Hw4TvIxtqBHnk6wFPN8oVx5++bz
	 i6Xp+v4K6olfhnseL3VQJFBnhvmHxvssza07XygvayZJLJbXqscvhv6RnAtVONiqN5hoP
	 ztJjWG/2fyLK6i2EHnwEX2cAtzkw4p2P2lXLpHmrQHMCllqGfgd3DdaEiW5A1w9eZrbAH
	 AH9dRY43zEy73MHaEWIABDGu6L+txwqGzjeaLcjA7ZC0gfgHzmZMorHcpOTmiiI07YYvy
	 N0f0TEiC2ip+s2qeOydWd/0f9RfmIy+NajLQ5anMjAfoKV8XxJNT+XXo8qzzxhhX1Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Sq8HoMfT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7743606A331;
	Fri, 20 Nov 2026 10:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7743606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Sq8HoMfT
Received: from localhost (unknown [IPv6:2a0a:edc0:0:701:a74f:3cb8:3e85:d062])
	(Authenticated sender: fdi@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C42CC202348;
	Fri, 20 Nov 2026 11:26:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795170405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j5Ce4d8nCM+piZH9frIPw21eODt2zq4vwjw4r8+6bNI=;
	b=Sq8HoMfT3XG0l9P0SmFcK67og1lgWqB7xLO4i0HzF0IY52ob9ogJUIiy1qkldCkwa4dyKH
	VcCPaHOkK2F1BKwNBh4+qLBVi8zmUGdgjKpgAhBYWFn0UfzUABfA+j68Ur71So4XVdTany
	8yZX//j7LOT9oP1MSFEV7o9Li1zU099henMckecZ1/jldwbS2dkp/rc3Iv7+rRu+hvCvVH
	M7HXArO0aOqeSzT0QJ8KVE7vx/Y2hoc29IZq96YisrohSVcikR8FPoqEuVaKv0VT/e4iiM
	zF3ia5Ch8ws2ACOESEQSDR2zABWJnoJTEm0a7KNegid8B5z1BqqyqC9V+2HZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795170405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j5Ce4d8nCM+piZH9frIPw21eODt2zq4vwjw4r8+6bNI=;
	b=K7PVPwC4xprzdbghWsTfZ1WVXXRuduZaUC37obVf/2++llZk6rbmRD2K0usWXErezQuFBU
	B85b3L+E6xGvXVJi5IT0cp7Gkb/HOLqXKdiCd7x3iFKBlzm7XNfcRo6uQ091gE6Nn7BNk7
	eugQp1YXVsy4KTnvoJLCAtyei2nKdwwLvdTB5PDNSG9TRl7fT0OcxsUj/yFQS3V+JHl8yz
	7z179y/47AFc2OXmesm3DBk28QlS638Q01RkyQIRSoL4jJaEMqbUFSdhI8kHuMWEihvaa7
	WPJbxRlvc06M41uXp15I/Z61tsIFv5F2jRiliwnEeieNMPaAb0bP6wMqQ2GZpg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795170405; a=rsa-sha256;
	cv=none;
	b=PgJ/LQn5mrtT/eudvsFQ1hZF3AHyTkNwSc/5HTY17o79eY6QEcTZkDp17d6M28UF8J+xQ4
	n8fR2FqpSB9TRMgP15nqLUqQlKsyR7hlo0cjdMZjAnPCQe+pZtGtyMqbTR1wWRGCXs1/aw
	ptLAcCKxR90yPakgY0uTVq7XPuO1P8lwMHbnbkUHd8fWDVID547a4p3bwvsZfkx2qifIRo
	7LAF98iXd4vu8YM9jLXx98sgXiQT9M6i2dTJyLcqoBmgP3pSAz2vHngZG0mCGiuW2SxOhQ
	8VPOsr/0piTmL5/UjAfAQqhsVQHa6sswfKOTiRVDrTs9ySUBxOO8vKJhazxPzQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=fdi@pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
From: Freimut Diener <f.diener@pengutronix.de>
To: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, Marco Felsch <m.felsch@pengutronix.de>, Justin
 Jiang <justin.jiang@nxp.com>
Subject: RE: [PATCH 1/5] arm64: dts: freescale: imx93-11x11-frdm: Enable I2C
 level shifter
In-Reply-To: <MRWPR04MB12117B415189A3EC52A69934E94782@MRWPR04MB12117.eurprd04.prod.outlook.com>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
 <20261120-imx93-frdm-fixes-v1-1-78dde22a56fe@pengutronix.de>
 <MRWPR04MB12117B415189A3EC52A69934E94782@MRWPR04MB12117.eurprd04.prod.outlook.com>
Date: Fri, 20 Nov 2026 11:26:45 +0100
Message-ID: <87cxrzbxy2.fsf@theta.mail-host-address-is-not-set>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Joseph Guo (OSS)" <qijian.guo@oss.nxp.com> writes:

>> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
>> @@ -49,6 +49,12 @@ pcal6408: gpio@20 {
>>         };
>>  };
>>
>> +&lpi2c2 {
>> +       pmic@25 {
>> +               nxp,i2c-lt-enable;
>> +       };
>> +};
> [...]
> Can you please move this into imx93-11x11-frdm-common.dtsi?

I don't have access to the i.MX93 Wireless FRDM board.
Are its schematics publicly available?

Have you verified that the I2C level shifter is also present on
the Wireless variant?

I'll move the property into the common .dtsi in v2.

Best,
Freimut
