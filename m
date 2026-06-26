Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACF21EB1AA;
	Fri, 26 Jun 2026 06:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782453726; cv=none; b=D/tWVB3deO14xjCg5FiDB5UzuqfA9Bo0LOwFql+QsmZ37FF3Ml7Tj+0HjNwMKPGjFCl7bKcLyLJr0v8sgt7IxYuRVNmGaLYWL5HDPJwiJWIP3D7EOB5UxdopurwLwMMiQVehdFC1o4NyPtdJV/Nc2N+dLestqkn6/3zGhQdnU0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782453726; c=relaxed/simple;
	bh=QkrqYAWIAXB4jhZ2FHHrGvfC+mhwJpqlD+F4Zkbzcts=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=PUsMHh73g2GOUO8heYVa8yOF6Gen+X1Qza8dWOW53dziKE/EkPlilRYR8VSAN3dzn9gfbs5cBHIZypBNn6E2ShtLNCAMo/3zs5ZQ/xdrh+obNizEC74O3fIa38kImjBnLjhkg0QNuFChz5A+sPbxMrDolmKdu5hEfiwtMjmlYvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from luyulin$eswincomputing.com ( [10.12.96.77] ) by
 ajax-webmail-app2 (Coremail) ; Fri, 26 Jun 2026 14:01:42 +0800 (GMT+08:00)
Date: Fri, 26 Jun 2026 14:01:42 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Yulin Lu" <luyulin@eswincomputing.com>
To: "Conor Dooley" <conor@kernel.org>
Cc: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>,
	"Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	"Min Lin" <linmin@eswincomputing.com>,
	"Samuel Holland" <samuel.holland@sifive.com>,
	"Darshan Prajapati" <darshan.prajapati@einfochips.com>,
	"Pritesh Patel" <pritesh.patel@einfochips.com>
Subject: Re: Re: [PATCH 3/7] riscv: dts: eswin: eic7700: add pinctrl support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260615-that-scarf-e048ef152676@spud>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-4-pinkesh.vaghela@einfochips.com>
 <20260615-that-scarf-e048ef152676@spud>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <55962658.7bea.19f02850fe2.Coremail.luyulin@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgDH3aDGFT5qhrYuAA--.8386W
X-CM-SenderInfo: pox13z1lq6v25zlqu0xpsx3x1qjou0bp/1tbiAgEKA2o9WJgTKQAA
	sn
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

SGksIENvbm9yLiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKPiBPbiBNb24sIEp1biAxNSwgMjAy
NiBhdCAwNTo1MDoxMlBNICswNTMwLCBQaW5rZXNoIFZhZ2hlbGEgd3JvdGU6Cj4gPiBGcm9tOiBZ
dWxpbiBMdSA8bHV5dWxpbkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gPiAKPiA+IEFkZCBwaW5jdHJs
IG5vZGUgYW5kIHJlbGF0ZWQgcGluIGNvbmZpZ3VyYXRpb24gZm9yIEVJQzc3MDAgU29DCj4gPiAK
PiA+IENvLWRldmVsb3BlZC1ieTogUHJpdGVzaCBQYXRlbCA8cHJpdGVzaC5wYXRlbEBlaW5mb2No
aXBzLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFByaXRlc2ggUGF0ZWwgPHByaXRlc2gucGF0ZWxA
ZWluZm9jaGlwcy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdWxpbiBMdSA8bHV5dWxpbkBlc3dp
bmNvbXB1dGluZy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQaW5rZXNoIFZhZ2hlbGEgPHBpbmtl
c2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9kdHMvZXN3aW4vZWlj
NzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0cyB8IDEwOSArKysKPiA+ICAuLi4vcmlzY3YvYm9v
dC9kdHMvZXN3aW4vZWljNzcwMC1waW5jdHJsLmR0c2kgfCA4ODggKysrKysrKysrKysrKysrKysr
Cj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9lc3dpbi9laWM3NzAwLmR0c2kgICAgICAgIHwgICA1
ICsKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDEwMDIgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2Vzd2luL2VpYzc3MDAtcGluY3RybC5kdHNp
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2Vzd2luL2VpYzc3MDAt
aGlmaXZlLXByZW1pZXItcDU1MC5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2Vzd2luL2VpYzc3
MDAtaGlmaXZlLXByZW1pZXItcDU1MC5kdHMKPiA+IGluZGV4IDFmYjkyZjBlN2M1NS4uZTdiYjk2
ZTE0OTU4IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9lc3dpbi9laWM3NzAw
LWhpZml2ZS1wcmVtaWVyLXA1NTAuZHRzCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2Vz
d2luL2VpYzc3MDAtaGlmaXZlLXByZW1pZXItcDU1MC5kdHMKPiA+IEBAIC02LDYgKzYsNyBAQAo+
ID4gIC9kdHMtdjEvOwo+ID4gIAo+ID4gICNpbmNsdWRlICJlaWM3NzAwLmR0c2kiCj4gPiArI2lu
Y2x1ZGUgImVpYzc3MDAtcGluY3RybC5kdHNpIgo+ID4gIAoKLi4uCgo+ID4gKyZncGlvNzlfcGlu
cyB7Cj4gPiArCWJpYXMtZGlzYWJsZTsKPiA+ICsJaW5wdXQtZGlzYWJsZTsKPiA+ICt9Owo+ID4g
Kwo+ID4gKyZncGlvODBfcGlucyB7Cj4gPiArCWJpYXMtcHVsbC11cDsKPiA+ICsJaW5wdXQtZGlz
YWJsZTsKPiA+ICt9Owo+ID4gKwo+ID4gKyZncGlvODJfcGlucyB7Cj4gPiArCWJpYXMtcHVsbC11
cDsKPiA+ICsJaW5wdXQtZGlzYWJsZTsKPiA+ICt9Owo+ID4gKwo+ID4gKyZncGlvODRfcGlucyB7
Cj4gPiArCWJpYXMtZGlzYWJsZTsKPiA+ICsJaW5wdXQtZGlzYWJsZTsKPiA+ICt9Owo+ID4gKwo+
ID4gKyZncGlvODVfcGlucyB7Cj4gPiArCWJpYXMtcHVsbC11cDsKPiA+ICsJaW5wdXQtZGlzYWJs
ZTsKPiA+ICt9Owo+ID4gKwo+ID4gKyZncGlvOTRfcGlucyB7Cj4gPiArCWJpYXMtZGlzYWJsZTsK
PiA+ICsJaW5wdXQtZGlzYWJsZTsKPiA+ICt9Owo+ID4gKwo+ID4gKyZncGlvMTA2X3BpbnMgewo+
ID4gKwliaWFzLWRpc2FibGU7Cj4gPiArCWlucHV0LWRpc2FibGU7Cj4gPiArfTsKPiA+ICsKPiA+
ICsmZ3BpbzExMV9waW5zIHsKPiA+ICsJYmlhcy1kaXNhYmxlOwo+ID4gKwlpbnB1dC1kaXNhYmxl
Owo+ID4gK307Cj4gPiArCj4gPiArJnBpbmN0cmwgewo+ID4gKwl2cmdtaWktc3VwcGx5ID0gPCZ2
Y2NfMXY4PjsKPiA+ICt9Owo+ID4gKwo+ID4gICZ1YXJ0MCB7Cj4gPiAgCXN0YXR1cyA9ICJva2F5
IjsKPiA+ICB9Owo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvZXN3aW4vZWlj
NzcwMC1waW5jdHJsLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2Vzd2luL2VpYzc3MDAtcGlu
Y3RybC5kdHNpCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAw
Li43MjkzZGYxNDZhYTcKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvZXN3aW4vZWljNzcwMC1waW5jdHJsLmR0c2kKPiA+IEBAIC0wLDAgKzEsODg4IEBACj4g
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkKPiA+ICsvKgo+
ID4gKyAqIENvcHlyaWdodCAoYykgMjAyNSBCZWlqaW5nIEVTV0lOIENvbXB1dGluZyBUZWNobm9s
b2d5IENvLiwgTHRkLgo+ID4gKyAqCj4gPiArICogRVNXSU4ncyBFSUM3NzAwIFNvQyBwaW4tbXV4
IGFuZCBwaW4tY29uZmlnIG9wdGlvbnMgYXJlIGxpc3RlZCBhcwo+ID4gKyAqIGRldmljZSB0cmVl
IG5vZGVzIGluIHRoaXMgZmlsZS4KPiA+ICsgKgo+ID4gKyAqIEF1dGhvcnM6IFl1bGluIEx1IDxs
dXl1bGluQGVzd2luY29tcHV0aW5nLmNvbT4KPiA+ICsgKi8KPiA+ICsKPiAKPiBJIGRvbid0IHJl
YWxseSB1bmRlcnN0YW5kIHRoZSBncm91cHMgaGVyZS4gSSB0aGluayB5b3Ugc2hvdWxkIG1ha2Ug
bW9yZQo+IGVmZm9ydCB0byBwdXQgbW9yZSBwaW5zIGluIGVhY2ggZ3JvdXAuCj4gCj4gPiArCQln
cGlvMV9waW5zOiBncGlvMS1waW5zIHsKPiA+ICsJCQlwaW5zID0gImp0YWcwX3RjayI7Cj4gPiAr
CQkJZnVuY3Rpb24gPSAiZ3BpbyI7Cj4gPiArCQl9Owo+ID4gKwo+ID4gKwkJZ3BpbzJfcGluczog
Z3BpbzItcGlucyB7Cj4gPiArCQkJcGlucyA9ICJqdGFnMF90bXMiOwo+ID4gKwkJCWZ1bmN0aW9u
ID0gImdwaW8iOwo+ID4gKwkJfTsKPiA+ICsKPiA+ICsJCWdwaW8zX3BpbnM6IGdwaW8zLXBpbnMg
ewo+ID4gKwkJCXBpbnMgPSAianRhZzBfdGRpIjsKPiA+ICsJCQlmdW5jdGlvbiA9ICJncGlvIjsK
PiA+ICsJCX07Cj4gPiArCj4gPiArCQlncGlvNF9waW5zOiBncGlvNC1waW5zIHsKPiA+ICsJCQlw
aW5zID0gImp0YWcwX3RkbyI7Cj4gPiArCQkJZnVuY3Rpb24gPSAiZ3BpbyI7Cj4gPiArCQl9Owo+
IAo+IExpa2UgdGhlc2UgNCBmb3IgZXhhbXBsZSwgd2h5IG5vdCBncm91cCB0aGVzZT8KClRoZSAn
Z3JvdXAnIGlzIHVzZWQgdG8gY29ycmVzcG9uZCB0byB0aGUgJy1ncnAnIHRhZyBpbiB0aGUgWUFN
TCBmaWxlIGFuZApoYXMgbm8gcHJhY3RpY2FsIHNpZ25pZmljYW5jZS4KRGlmZmVyZW50IGJvYXJk
IGRlc2lnbnMgaGF2ZSBkaWZmZXJlbnQgcmVxdWlyZW1lbnRzIGZvciBwaW4gbXVsdGlwbGV4aW5n
LgpUaGVyZWZvcmUsIGVpYzc3MDAtcGluY3RybC5kdHNpIG9ubHkgcHJvdmlkZXMgcGlucyBmb3Ig
dGhlIGJvYXJkLWxldmVsIERUUy4KUGlucyBhcmUgY29tYmluZWQgYW5kIHVzZWQgaW4gdGhlIGJv
YXJkLWxldmVsIERUUyB2aWEgcGluY3RybC0wIHByb3BlcnR5Lgo=
