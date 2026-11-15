Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753157;
	b=bJwgzeKZjVv5cIy9N+B5EYAo+jQ6qUx9Evqvos6TDC94Qgew/kXyFLLGzjgy2UVd7l40
	 0NyfzA/mp1zpLeARNs9FADzCN6x0iQQnSt8wBxhl+RmZenP97Fet6U8eqwj6gCmXOW0Pc
	 hff9G0EPfiiU9PupBSgi94z/AYyjLV8bOo9geGH/ZAY3m9OqiTG3V6Wyg6i8jRUJZ3Fjx
	 nE7YIb3a7j3B7OlbRZs4DfahfWCYWZb4C2JykXpzCT/wRUznWMUQvtNvosU1Ku/FMEW5D
	 T6aswo+PggPTrbHVp/d6aBa59gsQXXYdWVTh4ugSopmzhyHHZUty6I49E7fOuRF5ROQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753157;
	h=DMARC-Filter:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Bar:X-Rspamd-Report:
	 X-Rspamd-Score:DKIM-Signature;
	bh=3MBdZCa3+pc0zEIK6T3rmt1yKKRJeNOUk5g02fXUNZc=;
	b=pwlfh7k9s7Y6JvUxW5xiRDwnjFm+obMJBfLGVrCPAEvUSE7KnRlDK7qOVU6+zcsADiTH
	 26X8tUIQ7sDvpC9aOfd38vEIdMBgM8qE/enT7b++8HdXT4f/2TERGhzDYJCWPBx7mi4C3
	 l7KUVqG3ErsW54KZIkI7BTI4zBPnvtSiH6hH+1njsZ6TeOT4MtR+IeUA3L04NPYQoU2y2
	 G5DYsC6WFzPUYc48HQkiMolVVcjuw2svPjBEOuumT6MvopIxu99WVcgk8Njrr6w8ntBGW
	 0uR7G89XSWfxEIdCl9CpXpAKaCYRFDIwofOE7Xzjf36T3D9SLO/FWyW+nY2Ar5BCqUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=BXgAcNYY;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D788606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 14:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D788606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=BXgAcNYY
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id A01F260D7E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 15:32:35 +0100 (CET)
Received: (qmail 32341 invoked by uid 990); 15 Nov 2026 14:32:35 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sun, 15 Nov 2026 15:32:35 +0100
Message-ID: <7f2ea700-ddd3-41b9-9500-63a44c321648@lausen.nl>
Date: Sun, 15 Nov 2026 15:32:34 +0100
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
From: Leonard Lausen <leonard@lausen.nl>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable Wi-Fi on the NanoPi M5
To: Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261025205339.14539-2-leonard@lausen.nl>
 <4b7bd146-93fd-41f8-ad3c-88333adc73b4@rock-chips.com>
 <20261026070821.324094-1-leonard@lausen.nl>
 <e028ba53-0c69-4ba6-9b16-8648b8a787b2@rock-chips.com>
Content-Language: en-US
In-Reply-To: <e028ba53-0c69-4ba6-9b16-8648b8a787b2@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: -
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.992814) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -1.582814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=wEW9XVAV0DUg1t10qy3lbNxLg4TAA4TlBE4rFTXyck4=;
	b=BXgAcNYYDk0LWEkWPTYakA9wmgidxf1/hV9wTaYI6vyCuqmEP/scby5qY/cCYeDzXWEZconqiN
	muPFWqC+DU7CNGSzfqcwHPWaObKtp4vQA47ZWJlfrEoh82xWzq8HbgpRXZ8Pyyt4l8eBKh/cSNCg
	C6ntv2511UkbwaQWWt3isuaFuf/iM/UGPidSups3frU2PQgq5r64se6LLRVlx6O9eBuYn5Q3NquI
	E1q/eIprbxbg3mIaibNFL0GlFl7UHqi7P4jnf/Sazb2NXY54NIfBaeqWk3oThwOjACmUBtj/PijK
	PVDGPGylSYucwzjhRFqJhDDROTRDv+cUXgJN8+yjw6tLstrJz05Yldy188qkJcpOMsUTmk0R8PaM
	fg3hrlMu7uc7h7FVj/xTZkGUULMTaWA6PZ/jRVZdQH7iZgTHYfp2vbEM6n/Rrt00DswvMj4zXx41
	VXjRH+hue9HpSJuo7pXv4ukSa8skt0sIvEKCKbShq1zgaZ5LFMcdz2c6KxN+tAjh8ceDM4UjFJB7
	XFHCjNLyH+qRzezA2coUNCd+gdbQv7xl4SvPYy4EbqBVqGmBwjSLS8kV2yiqGxSUNNZLOU0HWtvT
	ya/xwpBJF2Wr7sKWhWyHUgnKTk5P0Vj12+PZA0IlYF8uBBeK5m3+9+VxmumDlgR7EScC44ui9tD3
	8=

>> The NanoPi M5 has an M.2 E-key slot for SDIO Wi-Fi modules such as the
>> RTL8822CS-based AC200. The SDIO controller is disabled and the module's
>> power sequence is not described, preventing the card from enumerating.
>>
> 
> I suspect RTL8822CS doesn't work as-is, unless you need to apply it[1].
> Please double check it.

Thank you, Shawn Confirmed your series fixes SDR104 and improves the 
wifi throughput. Throughput still stays substantially below the 792 
Mbit/s raw SDIO bandwidth. I prepared a few commits to remove overhead. 
First two are at 
https://lore.kernel.org/linux-wireless/20261115142330.359247-2-leonard@lausen.nl/
