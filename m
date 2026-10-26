Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792980977;
	b=3g0VLWQNN6xvwyK1RsJQ57suqCQ14YzRq+kPHcgoUM0j/JYRx6datl94GrQop/XHSeui
	 PxapqDmWVT2b0fIRALAcudkti4CNb/ycVYrRpqTvGqYSTZDMV2IxsDhkh+m9PKCcQKJs7
	 ZdpQQlP+QIgkmM1CJY+kjN8gijOnBCgOvlIvQ1DYEayjw++/3Id2tb7t/nHrq5CX2N/He
	 G5rzAXxZCz/vFterzRA5HAWQSUwuVznGS+P6SL3dh945K1c/hTbJUyem08CZapLVgFasd
	 eHMMj35G6Y58jT14kpAmmiXuAdWXjzsuo75Eqv1LOZ90t/oo6LnjNs4mgLO2crZqfpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792980977;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=BkPz9xb8Q75g14OAt/OIFr5xinXkw2AsPNq+wkH3Hg0=;
	b=fjemKuZG8dLEXmlsL1CvjUFboBeCZzMudub/FulG8Hg2IbZuOZ926GdfPN9vCUujHZ/3
	 XPnqZR2YagWXsdB6+c9zwEdWIojrD14sag/phfEJ+9NiS7uLwACEGsdc9D0x8DMJQWYs0
	 pyjChZihi0D9ipkHLD5MbqcxMBfQCLYvNNWYfWh0PiOdysACOC5/vDb0cLvtpFiLhQorS
	 KgWxmCY9BYGnVNifxZcGDmWyeA6QIt6jjOhSvKoT5YPiyK+QulCanyUMYs36kfICAfN8q
	 MvNIzo1aiSoNlcVeGQI3WiGk8yzDta7fdfTlzy8hDruwiRjNyjV9iuv8cxqxzc58Wvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=pEC4r4tO;
	arc=none smtp.remote-ip=162.62.57.87
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A1C606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A1C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=pEC4r4tO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792980971; bh=BkPz9xb8Q75g14OAt/OIFr5xinXkw2AsPNq+wkH3Hg0=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=pEC4r4tOA//D8o11twP/g/oLpzNIIeWGVVZbvwZ2W3CPe6hboP8NF4p5WhBS6ly/U
	 YU9FWqJOomE6oJIWxx8BdGCju9XYsicfYoAomqZxh4Gg0rfzAFv8oOS9JtmwrKU6oP
	 SGMXyLN06fdZmsXnvsjoS0MOMW6bEVi2xSSWPtaA=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-XMAILINFO: Nc5/rdswZ3xKtkFXBg/w+tTYaqoW3muN/KBx/2VjdMJXXRgezlnyGZjTBnikIy
	 kQGOY6uyv+DDMqewotw2ng6wylWoOg45BnGTAoUi+apEnUdcVdhN7Oe0/pNcr5Mv7FnjWZf4Beryb
	 dxXy9st8UxKMpU+LY4W0Fzm5XSi6Hk/9IdBha5O3Eb9QDfQVWOJ9PPln43Gp7m0VqGjQi8KiD1YeV
	 8YiW9X20PPaMDcvXndGGxSMyJ4i3paUoX1f4zPhQrFMsrHv4Sh74oQVCUpN2dHfE5vQGDLyeaTuev
	 P/oHARzaQrAAR2JlIqgaXvGKidhcxvGrcSOIi6GzvgL08hISwx5HnKZUR6wdD6P51letQfGcJqezb
	 /6hPOd0clz24sEITmLgBl+AXeJvlgpccqg4aKHYRiqSidlmLbQKl/jL7qZg3nWvChh5TRKVyVYYSm
	 CJceflNK8JDe6QL5Xf86WZpLbZ1oOzMeV9FRNhl/ZR6o5Rbh2hN+ULbcCLg2u9bakFSMR6PXpz04R
	 kpKC5IpmWG/VV3Ruz0fNyOTTTVdMYNxfAXLOaOv1qa7PqMQb3qKWdGthCWtQZBukjDR5hYr6eZIQW
	 YwtHvotTzYCMh2vcFyvMyWas/XZgTaC3XqTEXksi8cxe6xGbzrkCRsZyNPVGi+9agm+cd6qZQvpWY
	 7lbINsi06J4Pzi73Zrfsyhoxsp1xal53nppwxgaZv+6TN8HeLkrwHFezAqh6oBIVSV6jrfWhwdC/Y
	 GJc6SGh7PCVeYVyNRT2c+BlxlIQEeK6mWIwOSOG59wEnEQfBhI4qKg8vbVODtxIpMF4+sFQVqIlOR
	 K/HaDxH73NpNbaOxa68/fFjEnmSrG7ItJwvVMMiaZh8de5EhEmRvgQfeLTifVeBk86Pt/bpi36SPJ
	 P8ooFp3k3IM9dVp5+H3m3kVUvnOk05BNLXDx778N9R4DIy3GsMPNpFGxmXL3Ztgcdv1kNRnyPl7lJ
	 OSVSLf4hC4BJygo9PKSzjZt/pZzjKxXHivoaWQ4FC3r4k8+2tcOgj7p518CoYj7QMX18MQQ6C3kB0
	 T61ZE
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?c2FzaGlrby1yZXZpZXdz?=" <sashiko-reviews@lists.linux.dev>
Cc: "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?cm9iaA==?=" <robh@kernel.org>, "=?utf-8?B?Y29ub3IrZHQ=?=" <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] pmdomain: rockchip: Add RK3572 boot peripheral domains
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 26 Oct 2026 10:16:09 +0800
X-Priority: 3
Message-ID: <tencent_E5D3E8C95427388C2C077C213AF8D137810A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261023-add-board-ok3572-c-pmdomain-v2-0-79ddd42e92c1@qq.com>
 <20261023-add-board-ok3572-c-pmdomain-v2-2-79ddd42e92c1@qq.com>
	<sashiko-outbox-182875@kernel.org>
In-Reply-To: <sashiko-outbox-182875@kernel.org>
X-QQ-mid: xmsezb41-0t1792980969t291znzck

SGksCgo+IFtIaWdoXSBwbWRvbWFpbjogcm9ja2NoaXA6IG1pc3Npbmcgc3RhdGUgdXBkYXRl
IG9uIHNodXRkb3duIGluCj4gcm9ja2NoaXBfcGRfcG93ZXIoKQoKQ29uZmlybWVkLiBBIGZh
aWxlZCBzaHV0ZG93biBkb2VzIG5vdCByZWNvcmQgaXRzIHByb2dyZXNzLCBzbyByZXRyaWVz
IGNhbgpvdmVyd3JpdGUgdGhlIHNhdmVkIFFvUywgbGVhdmUgdGhlIE5JVSBpbiBpZGxlLCBv
ciBza2lwIHRoZSBmaXJtd2FyZQpub3RpZmljYXRpb24uCgo+IFtIaWdoXSBwbWRvbWFpbjog
cm9ja2NoaXA6IGJyb2tlbiBzdGF0ZSByb2xsYmFjayBpbiByb2NrY2hpcF9wZF9wb3dlcigp
Cj4gLi4uCjEuwqBJZsKgcm9ja2NoaXBfcG11X2RvbWFpbl9tZW1fcmVzZXQocGQpwqBmYWls
c8KgYWZ0ZXLCoHdyaXRpbmfCoG1lbV9wd3Jfb2Zmc2V0wqB0bwrCoMKgwqBnYXRlwqBtZW1v
cnnCoG9mZizCoG1lbV9wd3Jfb2Zmc2V0wqBjb250aW51ZXPCoHRvwqBmb3JjZcKgbWVtb3J5
wqBvZmYuwqBJZgrCoMKgwqByb2NrY2hpcF9wZF9wb3dlcihwZCzCoGZhbHNlKcKgaXPCoHRo
ZW7CoGNhbGxlZCzCoGl0wqBkb2VzwqBub3TCoGNsZWFyCsKgwqDCoG1lbV9wd3Jfb2Zmc2V0
LMKgeWV0wqB1bmNvbmRpdGlvbmFsbHnCoHJlc2V0c8KgcGQtPnBvd2VyX29uX3N0YXRlwqB0
bwrCoMKgwqBST0NLQ0hJUF9QRF9PTl9JRExFwqBhbmTCoHBkLT5tZW1fcmVzZXRfcGVuZGlu
Z8KgdG/CoGZhbHNlLsKgT27CoHRoZcKgbmV4dArCoMKgwqByb2NrY2hpcF9wZF9wb3dlcihw
ZCzCoHRydWUpLMKgcm9ja2NoaXBfcG11X2RvbWFpbl9pc19tZW1fb24ocGQpwqByZWFkc8Kg
ZmFsc2UsCsKgwqDCoHNvwqBwZC0+bWVtX3Jlc2V0X3BlbmRpbmfCoGlzwqBjb21wdXRlZMKg
YXPCoGZhbHNlLMKgcm9ja2NoaXBfcG11X2RvbWFpbl9tZW1fcmVzZXQocGQpCsKgwqDCoGlz
wqBza2lwcGVkLMKgYW5kwqBtZW1fcHdyX29mZnNldMKgaXPCoG5ldmVywqBjbGVhcmVkLMKg
bGVhdmluZ8KgdGhlwqBkb21haW7CoG1lbW9yeQrCoMKgwqBwZXJtYW5lbnRsecKgZ2F0ZWTC
oG9mZi4KCjIuwqBJZsKgcm9ja2NoaXBfZG9fcG11X3NldF9wb3dlcl9kb21haW4ocGQswqB0
cnVlKcKgd3JvdGXCoHB3cl9vZmZzZXTCoHRvwqBwb3dlcsKgb24KwqDCoMKgdGhlwqBkb21h
aW7CoGFuZMKgdGltZWTCoG91dMKgd2hpbGXCoHJvY2tjaGlwX3BtdV9kb21haW5faXNfb24o
cGQpwqB3YXPCoHN0aWxsCsKgwqDCoGZhbHNlLMKgYcKgc3Vic2VxdWVudMKgcm9ja2NoaXBf
cGRfcG93ZXIocGQswqBmYWxzZSnCoHNlZXPCoGlzX29uwqA9PcKgZmFsc2XCoGFuZArCoMKg
wqBza2lwc8Kgcm9ja2NoaXBfZG9fcG11X3NldF9wb3dlcl9kb21haW4ocGQswqBmYWxzZSks
wqBsZWF2aW5nwqB0aGXCoHBvd2VyLW9uCsKgwqDCoHdyaXRlwqBhY3RpdmXCoGluwqBwd3Jf
b2Zmc2V0wqB3aGlsZcKgcmVzZXR0aW5nwqBwZC0+cG93ZXJfb25fc3RhdGXCoHRvCsKgwqDC
oFJPQ0tDSElQX1BEX09OX0lETEUuwqBXaGVuwqB0aGXCoGhhcmR3YXJlwqB0cmFuc2l0aW9u
wqBmaW5pc2hlc8KgYW5kwqBpc19vbgrCoMKgwqBiZWNvbWVzwqB0cnVlLMKgdGhlwqBuZXh0
wqByb2NrY2hpcF9wZF9wb3dlcihwZCzCoHRydWUpwqByZXR1cm5zwqAwwqBlYXJsecKgd2l0
aG91dArCoMKgwqB1bi1pZGxpbmfCoHRoZcKgTklVwqBidXMswqB3YWl0aW5nwqBmb3LCoHRo
ZcKgZmlyZXdhbGwswqBvcsKgcmVzdG9yaW5nwqBRb1MuCgozLsKgQ29udmVyc2VseSzCoGlm
wqB0aGXCoGRvbWFpbsKgYW5kwqBpdHPCoG1lbW9yecKgd2VyZcKgaW5pdGlhbGx5wqBvZmbC
oChpc19tZW1fb27CoD09CsKgwqDCoGZhbHNlKcKgd2hlbsKgcm9ja2NoaXBfcGRfcG93ZXIo
cGQswqB0cnVlKcKgZmlyc3TCoHJhbizCoHBkLT5tZW1fcmVzZXRfcGVuZGluZ8KgaXMKwqDC
oMKgc2V0wqB0b8KgZmFsc2XCoGFuZMKgcGQtPnBvd2VyX29uX3N0YXRlwqBpc8Kgc2V0wqB0
b8KgUk9DS0NISVBfUERfT05fSFcuwqBBZnRlcgrCoMKgwqByb2NrY2hpcF9kb19wbXVfc2V0
X3Bvd2VyX2RvbWFpbihwZCzCoHRydWUpwqB3cml0ZXPCoHB3cl9vZmZzZXQswqBtZW1vcnnC
oHBvd2VycwrCoMKgwqBvbsKgKHNvwqBpc19tZW1fb27CoGJlY29tZXPCoHRydWUpLMKgYW5k
wqBpZsKgcG9sbGluZ8Kgcm9ja2NoaXBfcG11X2RvbWFpbl9pc19vbihwZCkKwqDCoMKgdGlt
ZXPCoG91dCzCoGHCoGRpcmVjdMKgcmV0cnnCoG9mwqByb2NrY2hpcF9wZF9wb3dlcihwZCzC
oHRydWUpwqBlbnRlcnPCoHdpdGgKwqDCoMKgcGQtPnBvd2VyX29uX3N0YXRlwqA9PcKgUk9D
S0NISVBfUERfT05fSFcswqBza2lwc8KgcmUtZXZhbHVhdGluZwrCoMKgwqByb2NrY2hpcF9w
bXVfZG9tYWluX2lzX21lbV9vbihwZCkswqBhbmTCoGNhbGxzCsKgwqDCoHJvY2tjaGlwX2Rv
X3BtdV9zZXRfcG93ZXJfZG9tYWluKHBkLMKgdHJ1ZSnCoHdoaWxlwqBtZW1vcnnCoGlzwqBv
bsKgd2l0aG91dArCoMKgwqBwZXJmb3JtaW5nwqB0aGXCoG1lbW9yecKgcmVzZXQuCgoKSXRl
bXMgMSBhbmQgMiBhcmUgY29uZmlybWVkLiBTaHV0ZG93biBjYW4gbG9zZSBhIHBlbmRpbmcg
bWVtb3J5IHJlc2V0IG9yCmxlYXZlIGFuIHVuZmluaXNoZWQgcG93ZXItb24gcmVxdWVzdCBh
Y3RpdmUuIEl0ZW0gMyByZW1haW5zIHVuY29uZmlybWVkOgptZW1vcnkgYmVjb21pbmcgb24g
ZHVyaW5nIHRoZSBzYW1lIHRyYW5zYWN0aW9uIGRvZXMgbm90IGJ5IGl0c2VsZiBtZWFuCnRo
YXQgYW5vdGhlciByZXNldCBpcyBuZWVkZWQuCgpJIHdpbGwgZml4IHRoZSBjb25maXJtZWQg
aXNzdWVzIGluIHRoZSBuZXh0IHZlcnNpb24uCgpCZXN0IHJlZ2FyZHMsCkN1bmhhbwoKcHct
Ym90OiBjcg==

