Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795867532;
	b=eHZ3yCh/MbTCxgP3932C50ZbJGWyHwKLFCgHRWZdCnc03TPsbroNP6uEmvWh9QVCZsU7
	 rIlQ3pudRb7zmtAa/qfGdG6dQUM1qqP4uG6Cab9O1aBYUU5Iurc9K+EPYD5AJtjrhlLjv
	 rHqJFmrjB0h6zLyjy4XDmBSk+qDnc0Hd/lE7wB6Id9KX92q7CHOSwjf3ny7z6CBr8CaZS
	 rwn5SuvcaTyDgNWK4W4rqP67X1vIwzHirY8NPbQfSXzYcfqL4xjxA6KKcAUsX+Ma0Q7KP
	 DGKGMfWpcdrzFyBMwuKMvyN4byaoBQF72C6695ue7CIXvt7XPCI86d81sqpfMMK3P5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795867532;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=zhLw8h4HlA2IsKnllJNhxSyYZ3Ck64MzhVwf8ascMCE=;
	b=WQsfKQ/sPtAU4mdw/s0L3u+Ad14pFiEQ7jyvY3wSTFoXeZoGbextvH8I50iAcDEo780U
	 yUObbGBYf8aYSKW9teizE+81KGTsnNQYELv2R6jgMtKwrhtIcVn7d1VY4buXUssSfXVC/
	 0scCx7uMt64DFyONq2dfZMswwXOvEujiJON7PDo1Xv5aoQACvP1SqdbYd2xhtKghOcycC
	 lLqHbtSkmzVHpZcOIlatnya0bN8r8VGTz5qFkzkZ9U2MdvzqLAiCNzOLtV36TEL4qiFeE
	 XBE7cJVeZu3C2otdsFjanlJ2WgeuwazkIvKHohQ1AMJzHEN+rIih9GR9yhPv3kSfbhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=wFhoEbJZ;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C66606A31F;
	Sat, 28 Nov 2026 12:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C66606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=wFhoEbJZ
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jc89s0xR2z8vTq;
	Sat, 28 Nov 2026 13:05:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1795867521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhLw8h4HlA2IsKnllJNhxSyYZ3Ck64MzhVwf8ascMCE=;
	b=wFhoEbJZDnWnwXiton1Qseg0esMkwUVXiv/MewTO7ljMoP7L56KpD8trzh6BxoDAUbw+Pd
	+ckdanl7LMwmoYo9KWgKJKeS2T6pzc3GVpPq6fGL7NidncBxcOKxVfTdP7VXjgdpaAd/3+
	hTtdQyUC/37BCRCgQTK0Fq90W27VlWKTa5DUWXJLWMEXiDWiudjM4FmSf7GBIND7QV2dcO
	+c8MhJ42q3lxxCU2RWG6h9jocvb5IBynpZlzf4abAOBtXaDFkyNnBRR2gY3hYjc6eSjUes
	iNFJdzUdQW6c41Nk9AiV9ctjDnp3742HAdooZj9B8krVAxAFEebObYsupnZnuQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: =?utf-8?Q?Fl=C3=A1vio?= Amieiro <flavio@amieiro.net>
To: Lee Jones <lee@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek
 <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/2] leds: Add support for the is31fl3206 LED driver
In-Reply-To: <179577304392.49650.9635005979653207009.b4-ty@b4>
References: <20261120-add-is31fl3206-support-v6-0-0969fd6292ab@amieiro.net>
 <179577304392.49650.9635005979653207009.b4-ty@b4>
Date: Sat, 28 Nov 2026 09:05:07 -0300
Message-ID: <87ik1hduvg.fsf@berlin>
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
X-Rspamd-Queue-Id: 4jc89s0xR2z8vTq

Lee Jones <lee@kernel.org> writes:

> On Fri, 20 Nov 2026 10:25:57 -0300, Flavio Amieiro wrote:

>
> Applied, thanks!
>
> [1/2] dt-bindings: leds: Add issi,is31fl3206 to leds-is31fl32xx
>       commit: d8574fec0e6f0c71626064f415239d3859f01021
> [2/2] leds: is31f132xx: Add support for is31fl3206
>       commit: 5d3bdf40e316f47e7e3f8220b97bbec658852a96
>

Thank you! And thank you all for the reviews and the help in the
process.

--
Fl=C3=A1vio Amieiro
