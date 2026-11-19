Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.101.248.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053174;
	b=PDY45IJ9HRqxMyiq9c7OFUobT6Pg7fxjWYo5P1I2/ZX9FAQ0OAwVeHo24Ep4qfmpqH3j
	 9HfCrZ4bpynh/I20JFLj9fJ/hhuISg9anBBaLNC/uCxFAgsoZTKyWKIWWgjdij+8hDvOt
	 Y8IcTuS8TxfGowQbaOcLxg9XlApOzJe0w5B5kowTnZtq/cwD3T9YUwr8IZ/ZXrZkGIgRP
	 SsYDhP5hVQYe7pzM09nhtq6DCDx0Kpo5KuWGgi8CocMRtzsqwPaeO5PrU8q92hqFprsk0
	 vKSKiDP3BgMg2fPQglyJtfwM22tdGNcO0gnSMBi7JMRN1ig78Do5/lma+XbW8AsSkJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053174;
	h=DMARC-Filter:DKIM-Signature:Received:X-Originating-IP:Date:
	 X-CM-HeaderCharset:From:To:Cc:Subject:X-Priority:X-Mailer:In-Reply-To:
	 References:Content-Transfer-Encoding:Content-Type:MIME-Version:
	 Message-ID:X-Coremail-Locale:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=5M/5lxJkM0TyI7QXLtWHuq57KaIWU5NZYtWYB5EtOKI=;
	b=i7jnIIuajsC3V+nsJfqhVu/Pd2JVhtit4CDILqLpvrc49lliushRsq3p328xhvpE6aR5
	 iriNjgTzYYC2EDG+v0JpmIAxLz5oSppk+Sy0M/0J26KsAflRYP9QJqXGhVN6wi7zjeotN
	 zd7YHp8rLtkvl7AwqVdX6sPBKuGnkW+VHKmJJqIOm+9jizDJwUkAL8xF0WNkNZVm/TjLk
	 2v9hZV8dPqARpO+c6EzGFNHCh14MRZ5a8yVoqXasZSXVAgxTUkCAhNYZ1btjUKyKvp6AW
	 7pCgmM5HyRP5mrO6LboGj/7MjbF5wy2gGhzj4WlDAqxe18bBKg20xIL6h9WZUQrmJrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=eswincomputing.com;
	spf=pass smtp.mailfrom=eswincomputing.com;
	dkim=fail reason="signature verification failed" header.d=eswincomputing.com header.i=@eswincomputing.com header.a=rsa-sha256 header.s=dkim header.b=GcNzir3O;
	arc=none smtp.remote-ip=46.101.248.176
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E963606A325;
	Thu, 19 Nov 2026 01:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E963606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=eswincomputing.com header.i=@eswincomputing.com header.a=rsa-sha256 header.s=dkim header.b=GcNzir3O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=eswincomputing.com; s=dkim; h=Received:Date:From:To:Cc:Subject:
	In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID; bh=AtyI6ok3Vi6DM9HN4m7xODIlo4sq1C3Mwjjp
	S7DX8MQ=; b=GcNzir3OMybN36pC9Rb1efXHqgzIRLNyT9470N0pz/pHEWGBooSC
	y/ZgE/73OWkrEMT4JiIostIx8taYEBG1IgVOSXTxjLOplYPpJL0UI+x9VQz9SA+A
	DS4EAQc/36vt9CdGFSGWA1bsCiCHjeyZYRMOVpIF0iiTl5+o0JUpv4E=
Received: from linmin$eswincomputing.com ( [10.10.96.205] ) by
 ajax-webmail-app2 (Coremail) ; Thu, 19 Nov 2026 09:52:37 +0800 (GMT+08:00)
Date: Thu, 19 Nov 2026 09:52:37 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Min Lin" <linmin@eswincomputing.com>
To: gaohan@iscas.ac.cn
Cc: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>,
	"Pritesh Patel" <pritesh.patel@einfochips.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>, "Han Gao" <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: eswin: Add Milk-V Megrez board
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20261118-eic7700-megrez-v2-2-0113ebc5b670@iscas.ac.cn>
References: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
 <20261118-eic7700-megrez-v2-2-0113ebc5b670@iscas.ac.cn>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <7edd04e5.a5d.1a1f1817c2c.Coremail.linmin@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID:TQJkCgA38xxlVv5qBywAAA--.133W
X-CM-SenderInfo: 5olqzx3q6h245lqf0zpsxwx03jof0z/1tbiAgEQCWr9068ImgAAsj
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS0KPiBGcm9tOiAiSGFuIEdhbyB2aWEgQjQgUmVs
YXkiIDxkZXZudWxsK2dhb2hhbi5pc2Nhcy5hYy5jbkBrZXJuZWwub3JnPgo+IFNlbmQgdGltZTpX
ZWRuZXNkYXksIDE4LzExLzIwMjYgMDQ6MDA6MDYKPiBUbzogIk1pbiBMaW4iIDxsaW5taW5AZXN3
aW5jb21wdXRpbmcuY29tPiwgIlBpbmtlc2ggVmFnaGVsYSIgPHBpbmtlc2gudmFnaGVsYUBlaW5m
b2NoaXBzLmNvbT4sICJQcml0ZXNoIFBhdGVsIiA8cHJpdGVzaC5wYXRlbEBlaW5mb2NoaXBzLmNv
bT4sICJSb2IgSGVycmluZyIgPHJvYmhAa2VybmVsLm9yZz4sICJLcnp5c3p0b2YgS296bG93c2tp
IiA8a3J6aytkdEBrZXJuZWwub3JnPiwgIkNvbm9yIERvb2xleSIgPGNvbm9yK2R0QGtlcm5lbC5v
cmc+LCAiUGF1bCBXYWxtc2xleSIgPHBqd0BrZXJuZWwub3JnPiwgIlBhbG1lciBEYWJiZWx0IiA8
cGFsbWVyQGRhYmJlbHQuY29tPiwgIkFsYmVydCBPdSIgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4s
ICJBbGV4YW5kcmUgR2hpdGkiIDxhbGV4QGdoaXRpLmZyPgo+IENjOiAiSGFuIEdhbyIgPHJhYmVu
ZGEuY25AZ21haWwuY29tPiwgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsICJIYW4g
R2FvIiA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+IFN1YmplY3Q6IFtQQVRDSCB2MiAyLzJdIHJpc2N2
OiBkdHM6IGVzd2luOiBBZGQgTWlsay1WIE1lZ3JleiBib2FyZAo+IAo+IEZyb206IEhhbiBHYW8g
PGdhb2hhbkBpc2Nhcy5hYy5jbj4KPiAKPiBUaGUgTWlsay1WIE1lZ3JleiBpcyBhIE1pbmktSVRY
IGJvYXJkIGJhc2VkIG9uIHRoZSBFU1dJTiBFSUM3NzAwWCBTb0MuCj4gCj4gQWRkIGEgbWluaW1h
bCBkZXZpY2UgdHJlZSB0aGF0IGVuYWJsZXMgVUFSVDAsIHdoaWNoIGlzIGNvbm5lY3RlZCB0byB0
aGUKPiBVU0ItQyBkZWJ1ZyBwb3J0IHRocm91Z2ggYSBDSDM0MCBVU0ItdG8tVUFSVCBicmlkZ2Us
IGFuZCB1c2UgaXQgYXMgdGhlCj4gc2VyaWFsIGNvbnNvbGUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L2Vzd2luL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9ib290
L2R0cy9lc3dpbi9laWM3NzAwLW1pbGt2LW1lZ3Jlei5kdHMgfCAyNSArKysrKysrKysrKysrKysr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2Vzd2luL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9ib290
L2R0cy9lc3dpbi9NYWtlZmlsZQo+IGluZGV4IDIyNDEwMWFlNDcxZThkODk5OTZmN2NiZmM2MTY0
MjVmNzA0YWYzN2UuLjVkYWFkZTgyMmUxNWVkYTQzZWVlMTExY2JmODliYzM4NmJiMDZmMzIgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9lc3dpbi9NYWtlZmlsZQo+ICsrKyBiL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvZXN3aW4vTWFrZWZpbGUKPiBAQCAtMSwyICsxLDMgQEAKPiAgIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICBkdGItJChDT05GSUdfQVJDSF9FU1dJ
TikgKz0gZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0Ygo+ICtkdGItJChDT05GSUdfQVJD
SF9FU1dJTikgKz0gZWljNzcwMC1taWxrdi1tZWdyZXouZHRiCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvYm9vdC9kdHMvZXN3aW4vZWljNzcwMC1taWxrdi1tZWdyZXouZHRzIGIvYXJjaC9yaXNj
di9ib290L2R0cy9lc3dpbi9laWM3NzAwLW1pbGt2LW1lZ3Jlei5kdHMKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAu
LmE1N2NiNjExNzEwODdiMjBhMzllYjk2MmY5YzQ1ZDljOGRlZDM5MjUKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9lc3dpbi9laWM3NzAwLW1pbGt2LW1lZ3Jlei5k
dHMKPiBAQCAtMCwwICsxLDI1IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBNSVQpCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoYykgMjAyNiBIYW4gR2FvIDxnYW9o
YW5AaXNjYXMuYWMuY24+Cj4gKyAqLwo+ICsKPiArL2R0cy12MS87Cj4gKwo+ICsjaW5jbHVkZSAi
ZWljNzcwMC5kdHNpIgo+ICsKPiArLyB7Cj4gKwljb21wYXRpYmxlID0gIm1pbGt2LG1lZ3JleiIs
ICJlc3dpbixlaWM3NzAwIjsKPiArCW1vZGVsID0gIk1pbGstViBNZWdyZXoiOwo+ICsKPiArCWFs
aWFzZXMgewo+ICsJCXNlcmlhbDAgPSAmdWFydDA7Cj4gKwl9Owo+ICsKPiArCWNob3NlbiB7Cj4g
KwkJc3Rkb3V0LXBhdGggPSAic2VyaWFsMDoxMTUyMDBuOCI7Cj4gKwl9Owo+ICt9Owo+ICsKPiAr
JnVhcnQwIHsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiAKPiAtLSAKPiAyLjQ3LjMKPiAK
CkFja2VkLWJ5OiBNaW4gTGluIDxsaW5taW5AZXN3aW5jb21wdXRpbmcuY29tPgoKCkJlc3QgcmVn
YXJkcywKTWluIExpbgo=
