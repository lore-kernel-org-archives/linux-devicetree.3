Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.90
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450889;
	b=NM71HjVxPDle0mmXRS2hDzhAs0OGiFLBj4TCbEmplEwc04NRTBp5QzR9kAAL9oa+wrVB
	 hxtbdt5F/bLukfWVMT9jDC5aa3M76QXoo7btybYfMumpVzyM1o2Hj3SOwpaCL2XbI+Du0
	 7bRghiZnWRjXtbZ9FpVcUTs5PmoCZw74q8XZPQAswaYG7BJSLPlXz3qgN1+UC/qQwSKkn
	 1Up980jKSJ/R36YiCKjyTtvDhMUrWWTwWXoc9x/luL9gdc4p1IiIJDO3EtWyLnqouBKoz
	 0Yi8n/iZBve5Q/m0XEyTHNnyErNdHmRa1OGqqWqMahCvFqmqpfOKUo3T+95IQ4KkDFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450889;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=emO6sEIDSkEFWkAyFtAW5uo9IdZWrTOY02AsTAB3ghg=;
	b=d0edOiH/kCFDynJSie6aIqxHPdrK35plwFptPcHcni3olrbjOtPHgZdb2qK4WISMNjRW
	 QgSj8iXpvmlIqObjoqVCOkDEJHYS7pLGqOMSXFJ014IOLKxVzyaMQxQtHWzUW+r42qKOx
	 83ptNimgGd3lv4f7CZKTVmQ9L3zK9UHc4Jfa93BtRQM/OzpDUKVRlP1KmeNNaldEvAM1q
	 ALJW6y6TFq44DcfdUStFgc5KZ8NJT4JRe3YASDKlkkYDupQqBsNFtf5pVoy4SfDlyCmhc
	 BHXXAYpW5UoYHM9gU8hKZpBMdsj4YHd4XXJBj4nMTZKOOjxDBy8knqkIheNoiZ02lWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=r-sc.ca;
	spf=pass smtp.mailfrom=r-sc.ca;
	dkim=pass header.d=r-sc.ca header.i=@r-sc.ca header.a=rsa-sha256 header.s=spacemail header.b=kbEdxGlY;
	arc=none smtp.remote-ip=198.54.127.90
Received: from out-zbxj-a90.jellyfish.systems (out-zbxj-a90.jellyfish.systems [198.54.127.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08B4606A31C
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 23:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D08B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=r-sc.ca header.i=@r-sc.ca header.a=rsa-sha256 header.s=spacemail header.b=kbEdxGlY
Received: from DESKTOP-290OH2S (d207-6-150-133.bchsia.telus.net [207.6.150.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j7rcq5L1Gz8sWN;
	Mon, 19 Oct 2026 23:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1792450860;
	bh=emO6sEIDSkEFWkAyFtAW5uo9IdZWrTOY02AsTAB3ghg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kbEdxGlY9Nlbf4rp/11jWG32FqrEyxlFiYY1zJbOTD/+utKtaYNDlVzg8jgCqtgGB
	 6K4uPO4SeNrtk47TN8NZzN8CUIGZKuZ8PNrGlGG9EtmYXQ/3Ezn7HPZGci8vPK+nhz
	 MDLzYkXQF94JKsOnSSYNr+d+5Nn9aGpEOXEi3f6d2MqQDKNdPUf0BAagTYLlubK9PJ
	 N+3fcNxexu0Cpb8BMKcdgQEgx34J17WYCDxL/F2DMviO6MtbsMGnGVSD/Pjp4fl8Xf
	 2Yjs/X7Aq2YkRdLI7I90SEVWbubj0grzDbgIxEx7TUwXB/fG2FmNLhAtxyFUcPnvrE
	 VkzOWlCdLUjzQ==
From: Ross Cawston <ross@r-sc.ca>
To: markus.stockhausen@gmx.de,
	andrew@lunn.ch
Cc: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chris.packham@alliedtelesis.co.nz,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ross Cawston <ross@r-sc.ca>
Subject: Re: [PATCH 0/3] leds: add Realtek RTL9300 port LEDs under software control
Date: Mon, 19 Oct 2026 16:00:53 -0700
Message-ID: <20261019230053.503-1-ross@r-sc.ca>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <010701dd5f94$d636ff70$82a4fe50$@gmx.de>
References: <20261018194339.132-1-ross@r-sc.ca> <59f75e7d-9b56-441d-a4b5-58ad3862267e@lunn.ch> <20261018232015.527-1-ross@r-sc.ca> <38ca5375-ecea-4361-ab26-c044f38ceadb@lunn.ch> <20261019054233.1884-1-ross@r-sc.ca> <010701dd5f94$d636ff70$82a4fe50$@gmx.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: ross@r-sc.ca

On Mon, Oct 19, 2026 at 08:41 AM +0200, Markus Stockhausen wrote:
> [...] it is currently beyond the time available.

Thanks Markus, that answers it.

Then please drop this series. The PoE LEDs of this board go to OpenWrt
with openwrt/openwrt#25341 for now, and I'll come back to the port LEDs,
in the port nodes, once there is an RTL930x switch driver upstream.

Ross
