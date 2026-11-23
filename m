Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438095;
	b=xt0u5svDwkH2NLPvjZm/l31dlEId1girNXUJ+ONXaZep2F7g1v4K02S4xjoIpawbh4MS
	 mkK6PEYkkcRveHYYqIavxCyEz2h10EA557jOWnrixImMoHajW+oE+FRQLjuIY/ISncBFu
	 K6j0qOB/fDkoF5AHsjsOh2DAd6X2GDuIURkVcP7gJFEbZ6TKepzMTM1rda1V8Nm1boabg
	 GGffv5xZDGvrPPdnVgEX/01Qxu7GCL4cvgQp/2z+3ZbQtFntB7QTHRI7aFzyWPAQMCDRo
	 2CJ1szI2WyvO675OL0QU04eXF5P3eg2/z1Gnnr4b7m6xvs8sXMcNIb+5b11Y4w87q0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438095;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Last-TLS-Session-Version;
	bh=KYlDHaU0d0BcNbHJgBpvpRlrSDERAzx5Le8G4/1rMoY=;
	b=2EA7rIOdu0QTLLO1/GxdHoZbthobFBakXnlI7oU1YTSIVY5kGk/xXb45KplAsfEToLaK
	 z+QdbKpJUNOIDfANQ8kZ+Vl4H17K76zVc7Ak3YRYXi0nnsBO6yXj2P06IJIYDrZ2/7CUN
	 OiI2eSun7EgsWDiHU2bIyfDnS/hBLSIEaaO6MUhn/mJOuc9ZxJqMfXSG64HKjmv6MydvE
	 b4KDbS3fgj0xT9GGPs4ZhD2WUtuSY0q9amU2J5Jm6awG8SqtWM0LpLvuGJnQH6RKCd9y5
	 WGj4DQpOCrB5zudV3X3XyyaA6DBYSCc8AxX6P04NTlnKf4vzsheHMNZIoRzdGkeCF2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=e8iUMloO;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D75C606A330
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D75C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=e8iUMloO
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9107D1A1797;
	Mon, 23 Nov 2026 12:48:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D6D7601E1;
	Mon, 23 Nov 2026 12:48:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73FB511E68F49;
	Mon, 23 Nov 2026 13:48:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795438087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KYlDHaU0d0BcNbHJgBpvpRlrSDERAzx5Le8G4/1rMoY=;
	b=e8iUMloOyNJ5zVEl5crV5boCsvIE2wqWJbvWJD1T/kqsFeIKQNBGWqNcHnCOFXGUiNYLY+
	sGj+sEJ5Ef750Gq6UB03oHHNijrhoaM5+i268AOMVpa/UREepJVHTthHBtSm40OECGKN4t
	g4f7lblY4VI/EFFs4FdqwdpjwEXfiD3wdu0OgDrBuHtqLrl6u3mdU9oy+Jwfc3MZpP+Yav
	qsseEMREUtf7fFvyWmDhSPmsj9JNcTfkkFx9omDo3/Qiuc4GM/ukV1G8O29b88Lm+TixkG
	8u07UvH8Zj746anst5Kk2/7wkKrVQefA/k0euVl7MVC8n6xWdRN7h2TnbhjcSA==
Message-ID: <06c5bb031304c493763b829899211cb46efb96f8.camel@bootlin.com>
Subject: Re: [PATCH v3 0/2] mailbox: Add Marvell MHU driver
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Sunil Kovvuri Goutham	
 <sgoutham@marvell.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 13:48:02 +0100
In-Reply-To: <20261123094542.44101-1-paul.cercueil@bootlin.com>
References: <20261123094542.44101-1-paul.cercueil@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
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
X-Last-TLS-Session-Version: TLSv1.3

WW91IGNhbiBpZ25vcmUgdGhpcyB2My4KCkl0IGRvZXMgbm90IGNvbXBpbGUgYWx3YXlzIHdpdGgg
Q09NUElMRV9URVNULCBzbyBJJ2xsIHNlbmQgYSB2NC4KCkNoZWVycywKLVBhdWwKCkxlIGx1bmRp
IDIzIG5vdmVtYnJlIDIwMjYgw6AgMTA6NDUgKzAxMDAsIFBhdWwgQ2VyY3VlaWwgYSDDqWNyaXTC
oDoKPiBIaSBKYXNzaSwKPiAKPiBUaGlzIGlzIHRoZSB2MyBvZiBteSBwYXRjaHNldCB0aGF0IGFk
ZHMgc3VwcG9ydCBmb3IgdGhlIG1haWxib3ggZm91bmQgaW4KPiB0aGUgT2N0ZW9uVFggYW5kIE9j
dGVvblRYMiBiYXNlZCBTb0NzLCB3aGljaCBpcyB1c2VkIGZvciBTQ01JCj4gY29tbXVuaWNhdGlv
bi4KPiAKPiBUaGlzIHYzIGZpeGVzIGEgZmV3IHRoaW5ncyB0aGF0IFNhc2hpa28gY29tcGxhaW5l
ZCBhYm91dC4KPiAKPiBDaGFuZ2VzIGluIHYzOgo+IAo+IFsyLzJdOgo+IMKgLSBSZXF1ZXN0IGFu
IGludGVycnVwdCB2ZWN0b3Igb2YgZXhhY3RseSAzIGludGVycnVwdHMKPiDCoC0gUGFzcyBJUlFG
X05PX0FVVE9FTiB0byBkZXZtX3JlcXVlc3RfaXJxKCkKPiDCoC0gSW52ZXJ0IHN1Y2Nlc3MgY29u
ZGl0aW9uIG9mIG1ydmxfbWh1X2xhc3RfdHhfZG9uZSgpCj4gCj4gQ2hlZXJzLAo+IC1QYXVsCj4g
Cj4gR2VvcmdlIENoZXJpYW4gKDIpOgo+IMKgIGR0LWJpbmRpbmdzOiBtYWlsYm94OiBhZGQgTWFy
dmVsbCBNSFUKPiDCoCBtYWlsYm94OiBtYXJ2ZWxsLW1odTogYWRkIE1hcnZlbGwgTUhVIGRyaXZl
cgo+IAo+IMKgLi4uL2JpbmRpbmdzL21haWxib3gvbWFydmVsbCxtaHUueWFtbMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDYxICsrKysrCj4gwqBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDcgKwo+
IMKgZHJpdmVycy9tYWlsYm94L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMTEgKwo+IMKgZHJpdmVycy9tYWlsYm94L01ha2VmaWxlwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKwo+IMKgZHJpdmVy
cy9tYWlsYm94L21hcnZlbGxfbWh1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDIzOCArKysrKysrKysrKysrKysrKysKPiDCoDUgZmlsZXMgY2hhbmdlZCwgMzE5IGluc2VydGlv
bnMoKykKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWFpbGJveC9tYXJ2ZWxsLG1odS55YW1sCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9tYWlsYm94L21hcnZlbGxfbWh1LmMK

