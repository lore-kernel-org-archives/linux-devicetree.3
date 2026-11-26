Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685514;
	b=eu4ron6lHP52NdkqofcnYS/wu4lke3WToUmQQXfmu4+ZP/xITKnN9WRVUcxJV5xoZ5HA
	 Ucf3m7UYEHH1JMv9Cs3+xdF0J6f9+jvpWUSKTe0+SwctxiGk/bJzWnCtOgIvyAvRx6a3y
	 vCr53x1rJwBr8QljkJjNUKIQaX3+WVJ6nKu/khMkvuTk+YZ2ym86lQ3KI14j0Qhg+MJIe
	 8ez9Xk8z6JNSawhRH4tNfanDwXI1pDWEybKXI/VHEOBjPUkW1yLTa2Pm32NOBb7+KCjKY
	 mo4pLOJ3zRm14DJTj+t9LiLivpVIQy/K+wgvoVEneJEX1+lSkilGTr6w5JKAlLcaRFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685514;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=XiE2A+nPWbGW/mZXk52KfFKJUg4c3K9Dh4chIc2gpC4=;
	b=nrRudDak9wI0foL3aNkNkXXzts6q3304lh3KTFfm6vmNjj3iYTLNkZKt+UEO6vDgB0rg
	 Ns+oqp8C8748bApj7Yvsbx/PBk9gyyw4AB3XUFyomIL2lHZAcN5DWfYGlBQToPWQ3PMWj
	 7N5N3c9T4jdN8/6+QdFCyoRPPzNInpsNBxVYNdjk0dLpPt8AycPDY4B0tf0DszCk7YwjC
	 4nrJs+idR7Gn6cLz0sU2RykiRhKu7yCkwz/LvRWM4S+LCzr/6mbdXZUCugVpIzaRq0Y3G
	 DAS/SPxYMZWcpAFvk149JEVNoSZdJPPim3b2iRM0TxcbkGnBTf53OeD2tJwNF9mDiSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SWHOsaxW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80278606A31E;
	Thu, 26 Nov 2026 09:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80278606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SWHOsaxW
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A0491201A64;
	Thu, 26 Nov 2026 10:31:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795685505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XiE2A+nPWbGW/mZXk52KfFKJUg4c3K9Dh4chIc2gpC4=;
	b=SWHOsaxWA0zf75mAhcC4osWitX6SywANv2RbLcM+5sYJ6tSEaeAZPQ7pzmWTx1Qde6LypC
	ZUyuXGy1Bi+6pu8TNw7P+nj+0n3EAcCNgSDAEBJ2GZPE3DFL1UQLDEv/erM2p5TUiFMf3v
	vyx0I0Ka9FY/5y2OPeuyQsiMQoYq/+qx1vufLHOeVY9bzhjLf9Z3NgaSs6wL8Q4KBzKNBO
	j5MH3FxKZGdQ563XMf0D0ULcycJ7uU4vHOqWAKyjPF0SETRckxEu5R82J16q5+sX4Osa91
	OCi4FIGc6oPhT0k2Y9IYqEMjuCHgcHevaWj1flNN7+S4yEirOYcaop86ithrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795685505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XiE2A+nPWbGW/mZXk52KfFKJUg4c3K9Dh4chIc2gpC4=;
	b=QjNOwqtDTmxWKFMfwvple8it0GEaYu+5eKaV8wx0mo13I/kgVHcDIxllQT2nOBFxVT84Xw
	fCBwHCM0ak42VNEa7ICPb1aAD+EJfGSv/LlqnI5hcggfnfVARbBgcidSTYQUlUE8nkNsXC
	/NARyNy0RabDstavRJ544MqZvoznU5PqDGmzjGeWgrch9GeOCdtLQJdJJ19wP65t9rMrmY
	St/natczgTmGzg7g5qMtDPodKt4tlg0ADgOdMWhyrZS3FV+AzY5aUHvWljrmBkJIkxeShC
	U1uAP29wbjHxka5u7igTcGfFl+3h3TYvAmdB33FudGO+STOdoAd0wXgr6x/HAw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795685505; a=rsa-sha256;
	cv=none;
	b=RioTwTWTH3V7nOMvNr3+JCxK9ympGMTVLjUQvJHoroWJssJlkQ/SOItCduf+6AcYZJVheU
	EkmeKp9ImHPVl82NnCHYqs/0Tnh72eSdVOZEXgQO2waCschYSp1/Mqg0oaFR0RXX3AyGP1
	hpfiRJPoZxO3qVYcaDcu+f7mK4aK5pRAZIyoet1EH08eh8hMNzqmeebpxQZ7xiHHhCcAlg
	651uuWTdEyeyW1g9qXwkukp26THBbGOSuoLTDfviynHna+ff1/1/E1hLEL/XjgZ6Nl9T7x
	Dh00eElh8oiTha1Yhw7ZSyrojfir1Q+4Ts52gIy9jfhbK8NbOfdcJMZAuEc9Sw==
Message-ID: <cc7b9e00a518e234a81f18cbae805babd8452550.camel@pengutronix.de>
Subject: Re: [PATCH RESEND v2 2/3] reset: amlogic: Add A9 AO reset
 controller support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet	 <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 10:31:45 +0100
In-Reply-To: <20261126-a9-reset-v2-2-e3d850e68725@amlogic.com>
References: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
	 <20261126-a9-reset-v2-2-e3d850e68725@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-11-26 at 09:24 +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Add the reset configuration and compatible entry for the Amlogic A9 AO
> reset controller.
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
