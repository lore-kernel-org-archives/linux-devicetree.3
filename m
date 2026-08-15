Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635D63A1C9;
	Sat, 15 Aug 2026 04:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786767650; cv=none; b=KsWVQeTfEH19wkot3n4lah40gKKjrukJs7Xoz3TWAY7lcfic4+WrK5enXvyFW4It1rt/ZRHFh4iFtA2yKU5VbliF/IsycVX3C9JEYCSPMC2LvHY7Hlj7QlK9HvuFFSbUrBJmqr6FzTlJyLcpxgav5/XD+uU/0D8m6jQNn7tHA2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786767650; c=relaxed/simple;
	bh=dA0OSzoDNKW727pAh/7aic7jAlZ5P9aahphHPwNynaQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XuL5O2+8MI5xLY+nBcBezgl11yG57epKI/wXfG7UpvHq/iFUcHeUCfZ/qu+FUJzCf105+944qiLOU71CZ4rDdVfCm5wSLCudO+DD0CLGYsYpfGkm+po864TaU1a902r77DLvBheXZXHbcUPNV4laFD8VmmBKdyqezGLV056885M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.94])
	by APP-03 (Coremail) with SMTP id rQCowABHUD4E6X9qdn5xBQ--.61198S2;
	Sat, 15 Aug 2026 12:20:20 +0800 (CST)
Message-ID: <4a9f42be8c540feaf3e9b7c63e15ac2cf9548941.camel@iscas.ac.cn>
Subject: Re: [PATCH v2 0/2] phy: add support for TH1520 USB PHY
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Wei Fu
 <wefu@redhat.com>, Drew Fustini <dfustini@tenstorrent.com>, Jisheng Zhang	
 <jszhang@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, Yao Zi	
 <ziyao@disroot.org>
Date: Sat, 15 Aug 2026 12:20:19 +0800
In-Reply-To: <an-tu75UOjleqcA7@thelio>
References: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>
	 <an-tu75UOjleqcA7@thelio>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:rQCowABHUD4E6X9qdn5xBQ--.61198S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1fKw4DCry7WFy7GrW7Arb_yoW8Gw1Upa
	yxGFyrJFyDKrn3Gr1xX3WUCry5tr18J345Kr17W3W5XFyUGr1jqa4DWryj9rWUJr48Xr17
	trn8JFy7uF1jywUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPEb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFcxC0VAYjxAxZF0Ew4CEw7xC
	0wACY4xI67k04243AVC20s07M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r
	1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr1l6VACY4xI67k04243AbIYCTnIWIevJa73
	UjIFyTuYvjxUczuAUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

5ZyoIDIwMjYtMDgtMTTkupTnmoQgMTc6MDcgLTA3MDDvvIxEcmV3IEZ1c3RpbmnlhpnpgZPvvJoK
PiBPbiBUaHUsIEp1bCAyMywgMjAyNiBhdCAwNDo0MzoxNFBNICswODAwLCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+ID4gVGhpcyBwYXRjaHNldCBpcyBzcGxpdHRlZCBmcm9tIHRoZSAiQWRkIFRIMTUy
MCBVU0Igc3VwcG9ydCIKPiA+IHBhdGNoc2V0LAo+ID4gd2l0aCBvbmx5IHRoZSBQSFkgYmluZGlu
Zy9kcml2ZXIgcGFydC4KPiA+IAo+ID4gSWNlbm93eSBaaGVuZyAoMik6Cj4gPiDCoCBkdC1iaW5k
aW5nczogcGh5OiBhZGQgYmluZGluZyBmb3IgVC1IZWFkIFRIMTUyMCBVU0IgUEhZCj4gPiDCoCBw
aHk6IGFkZCBhIGRyaXZlciBmb3IgVC1IZWFkIFRIMTUyMCBVU0IgUEhZCj4gPiAKPiA+IMKgLi4u
L2JpbmRpbmdzL3BoeS90aGVhZCx0aDE1MjAtdXNiLXBoeS55YW1swqDCoMKgIHzCoCA3MyArKysr
KysrCj4gPiDCoGRyaXZlcnMvcGh5L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+ID4gwqBkcml2ZXJzL3BoeS9NYWtl
ZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDEgKwo+ID4gwqBkcml2ZXJzL3BoeS90aGVhZC9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTEgKysKPiA+IMKgZHJpdmVycy9waHkvdGhlYWQv
TWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICsK
PiA+IMKgZHJpdmVycy9waHkvdGhlYWQvcGh5LXRoMTUyMC11c2IuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAxODAKPiA+ICsrKysrKysrKysrKysrKysrKwo+ID4gwqA2IGZpbGVzIGNoYW5nZWQs
IDI2OCBpbnNlcnRpb25zKCspCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS90aGVhZCx0aDE1MjAtdXNiLXBoeS55YW1sCj4g
PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BoeS90aGVhZC9LY29uZmlnCj4gPiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BoeS90aGVhZC9NYWtlZmlsZQo+ID4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9waHkvdGhlYWQvcGh5LXRoMTUyMC11c2IuYwo+ID4gCj4gPiAt
LSAKPiA+IDIuNTIuMAo+IAo+IEhpLCBhcmUgeW91IHBsYW5uaW5nIHRvIHNlbmQgYW4gdXBkYXRl
ZCB2ZXJzaW9uPwoKSSBhbSBub3QgcGxhbm5pbmcgYmVmb3JlIGdldHRpbmcgYW55IHJldmlldyBm
cm9tIFBIWSBtYWludGFpbmVycy4KClRoYW5rcywKSWNlbm93eQoKPiAKPiBUaGFua3MsCj4gRHJl
dwo=

