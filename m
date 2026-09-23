Received: from va-2-26.ptr.blmpb.com (va-2-26.ptr.blmpb.com [209.127.231.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4448D223DFF
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790136457; cv=none; b=uLj76TVMU4UhTGNbYYeWDYzH/hZY1mNtRKktOSGuq5pJxyy29wO8+j6qFRY+tupf71kAkG/hBKByXNEeLisfyze52608qJly6Te6pNBwZAn/8yIYXYrEsALyD8gWlYvceFLjkicE/f4ghRvghx7RNF2g/FWZpyzgHROCr/LG5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790136457; c=relaxed/simple;
	bh=UfslGxYouv/baTrSNVrAz/2uz9nr9RQGE5GC8j5a1Dk=;
	h=From:Mime-Version:In-Reply-To:Content-Type:Date:Message-Id:
	 Subject:To:Cc:References; b=eGwHc4OF0KrS5XFCIiveTVlmSN52W7R3G7G8qMYFIFVv52MhdUNC7ETKwhLZP0Gnd62Jp8UdLKJ0v4ArEuQFaD+n4FKp7q93Ta15SgOn4O29ip/Z7drLfIc1/cN0QJUA/aQxtpWm+BdPMCvMShO/6B/lmS7tK+1g6MR+ZTxuKOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=emaUYLWT; arc=none smtp.client-ip=209.127.231.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="emaUYLWT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790136443;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=UfslGxYouv/baTrSNVrAz/2uz9nr9RQGE5GC8j5a1Dk=;
 b=emaUYLWT16pLphuKBCImwM2OpWlTOIgsAhb5UDQwUdlJKzLSt7a2YRZwEkaAoFcuQYLp06
 oMVI2iVFK8Ja1STJLvazorXKnzZv+MQ4glS5ekT3EDsIRgu/mRfG30iIMpYTUJvumSimGE
 gJrY2ko8y7r0IKAlhuivjXNYqw03efGKeqzcHSFPPkv3fTTMWTDztPgEVELFx1PC6qfwyM
 H6gZGAARzhwi8V8rgVQp19TpOw6QRbl2VZaylWrky34uPOMFmabOtOfHbfaEQl6f9+kWTP
 6ThwmfWWaKIvrn2brFWDnW5Zaa+EPCjDYKkyyk+D/L2vhii7fIslaaxqJO4kHA==
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+16ab35079+f0a534+vger.kernel.org+sandie.cao@deepcomputing.io>
In-Reply-To: <DLMC322TOCGJ.2GTJG14AFBACW@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 12:07:20 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.b414918c.4333.4215.b208.49d99e9be044@feishu.cn>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
Content-Transfer-Encoding: base64
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io> <20260922110434.3426051-1-sandie.cao@deepcomputing.io>
	<DLMC322TOCGJ.2GTJG14AFBACW@linux.spacemit.com>

SGksIFRyb3k6Cgo+IEZyb206ICJUcm95IE1pdGNoZWxsIjx0cm95Lm1pdGNoZWxsQGxpbnV4LnNw
YWNlbWl0LmNvbT4KPiBEYXRlOsKgIFdlZCwgU2VwIDIzLCAyMDI2LCAxMDoxOAo+IE9uIFR1ZSwg
U2VwIDIyLCAyMDI2IGF0IDA3OjA0OjM0UE0gKzA4MDAsIFNhbmRpZSBDYW8gd3JvdGU6Cj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy5kdHNpIGIvYXJjaC9y
aXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy5kdHNpCj4gPiBbLi4uXQo+ID4gQEAgLTQ0MSw2ICs0
NDEsNzIgQEAgc29jOiBzb2Mgewo+ID4gWy4uLl0KPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB1c2IzYl91MnBoeTogcGh5QDgxNTAwMDAwIHsKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gInNwYWNlbWl0LGszLXVzYjItcGh5IjsKPiA+ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSA8MHgwIDB4ODE1MDAwMDAg
MHgwIDB4MjAwPjsKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9j
a3MgPSA8JnN5c2Nvbl9hcG11IENMS19BUE1VX1VTQjJfQlVTPjsKPiA+ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjcGh5LWNlbGxzID0gPDA+Owo+ID4gKyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTsKPiA+IFsuLi5dCj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgdXNiM2NfdTJwaHk6IHBoeUA4MTgwMDAwMCB7Cj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxrMy11c2IyLXBoeSI7Cj4gPiAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gPDB4MCAweDgxODAwMDAw
IDB4MCAweDIwMD47Cj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xv
Y2tzID0gPCZzeXNjb25fYXBtdSBDTEtfQVBNVV9VU0IyX0JVUz47Cj4gPiArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3BoeS1jZWxscyA9IDwwPjsKPiA+ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gKyDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07Cj4gU2hvdWxkIHRoZXNlIHVzZSBDTEtfQVBNVV9VU0IzX1BP
UlRCX0JVUyBhbmQgQ0xLX0FQTVVfVVNCM19QT1JUQ19CVVMsCj4gcmVzcGVjdGl2ZWx5PwoKSGVy
ZSBpcyBjbG9jayBmb3IgdXNiMnBoeS7CoCBDTEtfQVBNVV9VU0IzX1BPUlRCX0JVUyBpcyBjbG9j
ayBmb3IgVVNCMyBQT1JUQi4gQ0xLX0FQTVVfVVNCM19QT1JUQ19CVVMgaXMgY2xvY2sgZm9yIFVT
QjMgUE9SVEMuCgpQbGVhc2Ugbm90ZTogdXNiM2RfdTJwaHkgYWxzbyB1c2UgQ0xLX0FQTVVfVVNC
Ml9CVVMuCgrCoMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgdXNiM2RfdTJwaHk6IHBoeUA4MWIwMDAw
MCB7CsKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCBjb21wYXRpYmxlID0gInNw
YWNlbWl0LGszLXVzYjItcGh5IjsKwqDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKg
IHJlZyA9IDwweDAgMHg4MWIwMDAwMCAweDAgMHgyMDA+OwrCoMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgwqAgY2xvY2tzID0gPCZzeXNjb25fYXBtdSBDTEtfQVBNVV9VU0IyX0JVUz47
CsKgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCAjcGh5LWNlbGxzID0gPDA+OwrC
oMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgc3RhdHVzID0gImRpc2FibGVkIjsK
wqDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgIH07CgpCZXN0IHJlZ2FyZHMKU2FuZGllCgo+wqAKPiAt
LcKgCj4gVHJveSBNaXRjaGVsbAo+wqAK
