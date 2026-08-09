Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1FD3C5DA6;
	Sun,  9 Aug 2026 10:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786271867; cv=none; b=e7y4AsUJBYwMiNsO4jgh7+uFjT1NnYgKQH+KZhramb/G2whLRdv2IMhRvmKM6MVNMjWE7k1Rm0/34hGQ0ZRBOhLQUYmuiMcyHCqF15XbwTFpr9KIQIpNU5M0IKZjsaORvsTnJU8yyN3bbb3z5QrsEdMapYMGFuiPjA7gFIYnKok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786271867; c=relaxed/simple;
	bh=/8f/Alges9Ms2yc2fIsm5bhogqPCHPQpn6lmC4ygk28=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qwLG/2MY3AZS954wYCCdCpWbHtKztb1uXS11Kt4mYgxCVaOUgV4lqIJHmhln4q7NRLVlsiZOZW49f5zLzQzPRfO0Rttq9NqTbsaQlzHkKxNOg8xIp/a5g9tH7M++qYAVdYKSri8IJ5dKBOtl0/XBZbZ0MSGluPIiTSBBBlw+Gec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LHXOE+S5; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LHXOE+S5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8D6074E4117C;
	Sun,  9 Aug 2026 10:37:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 598306033B;
	Sun,  9 Aug 2026 10:37:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40F7611C489DF;
	Sun,  9 Aug 2026 12:37:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786271856; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/8f/Alges9Ms2yc2fIsm5bhogqPCHPQpn6lmC4ygk28=;
	b=LHXOE+S5RDeFN4aC1XC7GsR20GQXpdRq3qVD5AvSC+Zwq0XzQS6SvKbNH7loK/DbkJbMTK
	2C13xz0GgyUsCLsHQkzx7sCwN9SlCg5zZONIblEN4FLtqW+F0uBzJlQKA+2j4jjaw7n8VA
	BpRlx3X/qQDJsBZrwS074tpSZy25xc62A5d0ucxa/966uxWxwD3qxqkLs3Tp4P+K9IEeD8
	Hmx9CnsrrF1tO1ZwdEv27b1BHWXOJ1XadOiihnQcpvDsI9xJVGXco2u2t+uiOa6RxAZ3MK
	TROYjxa6dSivN5n+JkJc+gcMWkdvUuYCBavYjathUsCZ9eVJDnsEiNA1/DiUUQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ARM: dts: marvell: kirkwood: Correct indentation
In-Reply-To: <d539bef3-ee1d-43b8-8b43-6704979703ec@kernel.org>
References: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706180333.648401-5-krzysztof.kozlowski@oss.qualcomm.com>
 <874ii27uqb.fsf@BLaptop.bootlin.com>
 <d539bef3-ee1d-43b8-8b43-6704979703ec@kernel.org>
Date: Sun, 09 Aug 2026 12:37:25 +0200
Message-ID: <878q6fmvfe.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 13/07/2026 17:52, Gregory CLEMENT wrote:
>> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:
>>=20
>>> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
>>> No functional impact (same DTB).
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.co=
m>
>>>
>>=20
>> Applied on mvebu/dt
>>=20
>> Thanks,
>>=20
>> Gregory
>
> All this was applied two weeks ago but it is still not in linux-next.
> Maybe you missed to push the patches to the for-next branch?

Argh indeed I forgot to push the for-next branch!


Gregory

>
> Best regards,
> Krzysztof

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
