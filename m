Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.205.69.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515101;
	b=N1u99wPWy/Ch5NriRXDD3Nmt2EtP4mhyh/q7SyvYqhLKiAaDuOesOKkYT1enK5r88c+o
	 MJEzjsP6Vca/5OJopMK8ZFp9jeSKNn/Y6BsLAHIT7xsbcDo3T1LhD/0DqLrK/vZLnR/hH
	 /rAWoEYTncR5vRVlWbTegSHcnaLoE5PCEtKaiCP+OYmOKVp2uajRyQKUWvk8XDt2pkPch
	 wkjFNgBRCWH3YXThepLmXg98ficqzzGWfaF6Tdt8/SMx1B64JbfgJ8NVW5YtLfO//joFz
	 xWJTT5dZ4Kl2rPyVzPKyt/U1DNhm2d0g+DV6vTDxzPx0pa1+6QnyzBZZdDn7PfxAhhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515101;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Feedback-ID;
	bh=PtSio2YcRjUGo/PTlEArxH4x2rEk7BbnuEJRInP3kq8=;
	b=X/x8qKntw3k/dO8CSTPP8ElTSmEge/7vDCFaTu/YDfjf3CcIHJtmBDauW0yAqsQlsCxh
	 llsdE5QTBTpWYJ6RH8dwz0GmcAeYQPUynRi8tF2ZIxzCP4JFxzxYnaLRg8WNQjMBjcHZY
	 Adg6KQhFXDoQRZpgM4sBQUGt1F2Dy+XkVYcrrkrSCfmfTZWjAPUnAW69YFgBFtFqkG5Zg
	 koRkVk/A8szRl0AZZPgp92Z4nCDNirdRrPxY/kgRH4UIgauwEYBvOvb9IpklRUq3X8+LK
	 FD2sGQU6CBFew+ykMkehz/8G1VZuaKqvu4jM9HjLpjesTDoy+fEgFZ4l1CrLWIVrU1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuta.io;
	spf=pass smtp.mailfrom=tuta.io;
	dkim=pass header.d=tuta.io header.i=@tuta.io header.a=rsa-sha256 header.s=s1 header.b=t7oWQcTR;
	arc=none smtp.remote-ip=185.205.69.213
Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F95606A327
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 20:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F95606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuta.io header.i=@tuta.io header.a=rsa-sha256 header.s=s1 header.b=t7oWQcTR
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id 457E01A390EA3
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:24:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1794515094;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=PtSio2YcRjUGo/PTlEArxH4x2rEk7BbnuEJRInP3kq8=;
	b=t7oWQcTRLFV8EfH0Z9oCKiMWx7TBp3nr3wLRNSNbljvlUHZjaLPmREOyIRGbKrZ0
	mVeBkE4uxgOVvD2WMaQf7sLbf0XyMhzc0vnfUvK1YmVqLHhDE1pFVB69pOoMze23bbQ
	/MhnNui/4xCqFeM9YdCzsn2vX5SFL/cB/JpQu8M364hinugmww/43G0N+n8JAhK+roV
	auXKF+rjcUjVQBtgTBIndD+GW2BQoKx0YJh33iN3/JxhHPe5V3uYzW3DM8cDcL4LvIT
	j9nk7fwTVQdSssnunLg9m/cuoVTHkRwp8dt6y+NqDDhQmhZr6rx6nCFbfykiQCxF+zx
	Tn4NnBm0bA==
Date: Thu, 12 Nov 2026 21:24:54 +0100 (CET)
From: servpol@tuta.io
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linux Pm <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <P6GQkBA--F-9@tuta.io>
In-Reply-To: <avEHPVdx0NlX4dhy@venus>
References: <20261021-gl-e750-mcu-v2-0-9bd7e7c2e0e1@tuta.io> <20261021-gl-e750-mcu-v2-2-9bd7e7c2e0e1@tuta.io> <avEHPVdx0NlX4dhy@venus>
Subject: Re: [PATCH v2 2/2] power: supply: Add GL.iNet GL-E750 MCU battery
 driver
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Feedback-ID: 01bb77f0f6a34f22cd96c09b0ff79382356995353b38b124f21de10af076a9961e02969e72277f7fb26516500e6c215bfc:TurnOnPrivacy!:tutamail

On Mon, Nov 09, 2026 at 12:35:58AM +0100, Sebastian Reichel wrote:
> The Sashiko analysis looks correct:
>
> https://sashiko.dev/#/patchset/20261005-gl-e750-mcu-v1-0-499d2e31f786%40t=
uta.io

Hi Sebastian,

thanks for looking at it. That link is the review of v1, and both
findings there are addressed in this v2 (see "Changes in v2" in the
cover letter):

- a new message (they all start with '{') now ends the previous one,
=C2=A0 so an event that follows a status reply without a line ending is no
=C2=A0 longer appended to it and lost;
- the poll work no longer clears the receive buffer, neither before the
=C2=A0 request nor on the reply timeout; it only consumes a pending status
=C2=A0 reply, so a partially received event stays in the buffer.

Sashiko's review of v2 reports no regressions:
https://sashiko.dev/#/patchset/20261021-gl-e750-mcu-v2-0-9bd7e7c2e0e1%40tut=
a.io

If you meant something else in that analysis, please let me know and
I'll address it in v3.

Thanks,
Serv
