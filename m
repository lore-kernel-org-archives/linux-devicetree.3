Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198018;
	b=wPFofE1ewPiu1NTxbwQq7O2jqNM1l9yO99F3KY74ySDwFF6r1LzzAY1sEsDMkiGQU6Nk
	 /32jcoN5ylBTWGRX9vnouSuLedkvtqqpbHAbhvSTdYZN2Hs3hs9hM2jNPI5hxCGXUeWb+
	 9hYrmdG07feuS5xjGEUfyhiP5Vsq4VAlYRwNoWUCpdYU8OrWjPlYSsf1SZcGtittXzH2i
	 ujkODPN3WUITNwnXVbXDu3idwLJABjt3ss/91cznNRoxXvBdtBpcEmQqqyHTxmHDCUJDL
	 t+QyXxX1U8PtxKnQkAHPZuqDfmbUkq8CDUpV/iIbBLi1+t0L9W7Vb22iAncTm0j0L5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198018;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=RjQSrv1yD+Tngr9908szhX2afLv1bRiBxHzUtNPcG6E=;
	b=F0cfZWFuZUPT/ezBu7i/IagG4q+ulxInXbtGW3jD8iASkDtarZWaLRWGmmaw3RCgsClO
	 zuGBnyBTxNmm44rUuwN5hzbroxFAFZlGNE2KJvX4U8lEV4IULap4Gx72hbNvDLOr+Hf4J
	 4r+CYfLON+N728lOcR2ossY2fRh67uqCdwm9tMXcbjH4PKgoNcXVlZK0/CWwEhsxHhCqw
	 c/XoDP6tuZTvoohC+GM9AWL9WTrYmdZ5Db3BAcZsrQcofGoskQZxIY/8sq/8MhSu9oYWe
	 0D2Lyv4iOVpZVv4y4ArvIUfO8ZS8jv60sMvQID4CNnwf8ofMItukK5MG8MsD6y18r3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	arc=none smtp.remote-ip=185.70.43.166
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A52F606A8AA;
	Fri, 20 Nov 2026 18:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A52F606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795198015; x=1795457215;
	bh=RjQSrv1yD+Tngr9908szhX2afLv1bRiBxHzUtNPcG6E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rOCoNZ799DIhPxpjuvHDzG4WSh4IGY5ImTaGHS29EQMtn3cVEWXlab0mzCZFIS0Mh
	 cjZIaUOOoXi32qn6WzJm8A+YcgQLtJfZhmr9kczULVRxKKiJ7+0MTYz02FJOIGidVL
	 AszJ3bEZMXIfO2fG6b1/YiAA4fF9pxN4gG2+gwNpm39JtXilEU3K1+cEPGFFtBLdKQ
	 sDTi2RFne5bIKvneecFirtrtn2eyQ6TERSI2ZP0tdYXRsSL9HuevPJWdjBoOYUNzP/
	 pbSfFdWyEmmhPl3FbcCEKFUulpUmdmkPcQxyjddq6eltcQSoOBL80J1hOk3NgajtYz
	 B6t4rlugzOewA==
Date: Fri, 20 Nov 2026 18:06:49 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: "armandas.kvietkus" <armandas.kvietkus@proton.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Subject: Re: [PATCH v5 2/2] media: i2c: Add Samsung S5K3T2 image sensor driver
Message-ID: <qjgDobQW2E9-BIRG3wngPQtbXtCcJGG9P9wsJ8zcsv_mSgsh2L2V1_QFe87ecTw2AqfAmdsZnByIr3ZufwEm3BTsCd9lS4i_sdlpcMiryxk=@proton.me>
In-Reply-To: <av9vzLSureeB4j41@kekkonen.localdomain>
References: <20261117-upstream-s5k3t2-v5-0-1f7f5fde9e2a@proton.me> <20261117-upstream-s5k3t2-v5-2-1f7f5fde9e2a@proton.me> <av9vzLSureeB4j41@kekkonen.localdomain>
Feedback-ID: 164226125:user:proton
X-Pm-Message-ID: 2f23f7fa03f776ee8220f7e572cc51da66405739
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

On Thu, Nov 19, 2026 at 11:53:16PM +0200, Sakari Ailus wrote:
> A lot of this should go to the cover letter.

Moved to the cover letter in v6.

> Does the sensor support other number of active lanes than 4? Very probabl=
y.
> But this isn't reflected in DT bindings (and it should be).

I can not test other lane counts. The phone has only four lanes wired to
the sensor, and the vendor register tables only set four lanes. So I left
the binding at four lanes.

v6: https://lore.kernel.org/all/20261120-upstream-s5k3t2-v6-0-dd345fa4201c@=
proton.me/

Thanks,
Armandas

