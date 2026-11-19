Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053115;
	b=Iz3itW+zjsVuFVSNZc9PhYpnz1+Vhfyz4OUmVbB8la40D8uKTTFEuGuzigzptZdhRIBZ
	 Ts97FpaHst9coq7HvFMMyzp/s1wDz/P+42cPWCN4ldqBemW4zMbIE/hg1fiZk5dX19U6a
	 VyRnmm4Cff9b8B/uiJOWSERW1R4Fi8ZZ9oh4gwFHejQ4FuFpNJ3A+p5srelFUK2P1Pj5U
	 Oxka/z3lb3GB3r9i+aNBPZGklsloYGEvrCo8QtOuR/XGDvHfpJHHr0HkIkR/Kz/h7sLlD
	 q29GjqM3uVv8Fz42s9CgQAVITCn19o+pPbLAmdhfsUeEFi+QUI0+Zw04o5iGjjABfiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053115;
	h=DMARC-Filter:DKIM-Signature:Received:X-Originating-IP:Date:
	 X-CM-HeaderCharset:From:To:Cc:Subject:X-Priority:X-Mailer:In-Reply-To:
	 References:Content-Transfer-Encoding:Content-Type:MIME-Version:
	 Message-ID:X-Coremail-Locale:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=xKnGbRReVP7/6EtA6bvqrLNcEkw7iRvaIjHUWgYt2jU=;
	b=XqRFp+J+b+z+Ip7gK+ft/HA4w5+yTBqKenf/Ym3uQIW0A8nxquscrwBIXYtECFCk3ZYg
	 WVn8jvzzew7WuUdbeGoCDMGxTKMFnZyc7O8uw60ihiUigtz3hmQxd43i+rKR4AVW3n08Z
	 7eyykT8aJk35GTN2AZwyu8MDQFIaXiJ+n3v47K5ACzAMQ+TrxITL0nSYYF3YRgESwbVVe
	 TbLthoF8mWxHdWUdsHN+fWRYD571yR5HyyIXsY4bs56foe/qkdiFFyPD2y5Bcb7TCnQ+9
	 jHWf7NYBTvVT3dgFVS3+bXd/CFf8y+ywohu3g6QmYqAlwWxqqdhXDkMwrKIkO+V1y8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=eswincomputing.com;
	spf=pass smtp.mailfrom=eswincomputing.com;
	dkim=fail reason="signature verification failed" header.d=eswincomputing.com header.i=@eswincomputing.com header.a=rsa-sha256 header.s=dkim header.b=uEPtt3dr;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B68606A31C;
	Thu, 19 Nov 2026 01:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B68606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=eswincomputing.com header.i=@eswincomputing.com header.a=rsa-sha256 header.s=dkim header.b=uEPtt3dr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=eswincomputing.com; s=dkim; h=Received:Date:From:To:Cc:Subject:
	In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID; bh=9AtsLTpnTqLali66WvwfiLZu7NzUAAV3xsbx
	/gFUz88=; b=uEPtt3drfRYDCQzIG05FoTnV6ooLDrkZfRVEgpm3nO8W0Hmc+03j
	ynXgzVllxG+puW1BtVBY9a1NS4r3EGsBWBTuvphB1K/id5AQrBelSdhcHS6+uIwW
	ZrTlZ4w/jMjtPnQoXgM4Rz2+0XJO4baFEcqZotwFbcp9gEVyRb42kCA=
Received: from linmin$eswincomputing.com ( [10.10.96.205] ) by
 ajax-webmail-app2 (Coremail) ; Thu, 19 Nov 2026 09:51:32 +0800 (GMT+08:00)
Date: Thu, 19 Nov 2026 09:51:32 +0800 (GMT+08:00)
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
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: eswin: Add Milk-V Megrez
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20261118-eic7700-megrez-v2-1-0113ebc5b670@iscas.ac.cn>
References: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
 <20261118-eic7700-megrez-v2-1-0113ebc5b670@iscas.ac.cn>
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
Message-ID: <9caa3e8.a5c.1a1f1807f9c.Coremail.linmin@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID:TQJkCgCXUhwlVv5q_SsAAA--.145W
X-CM-SenderInfo: 5olqzx3q6h245lqf0zpsxwx03jof0z/1tbiAgEQCWr9068EKQACse
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS0KPiBGcm9tOiAiSGFuIEdhbyB2aWEgQjQgUmVs
YXkiIDxkZXZudWxsK2dhb2hhbi5pc2Nhcy5hYy5jbkBrZXJuZWwub3JnPgo+IFNlbmQgdGltZTpX
ZWRuZXNkYXksIDE4LzExLzIwMjYgMDQ6MDA6MDUKPiBUbzogIk1pbiBMaW4iIDxsaW5taW5AZXN3
aW5jb21wdXRpbmcuY29tPiwgIlBpbmtlc2ggVmFnaGVsYSIgPHBpbmtlc2gudmFnaGVsYUBlaW5m
b2NoaXBzLmNvbT4sICJQcml0ZXNoIFBhdGVsIiA8cHJpdGVzaC5wYXRlbEBlaW5mb2NoaXBzLmNv
bT4sICJSb2IgSGVycmluZyIgPHJvYmhAa2VybmVsLm9yZz4sICJLcnp5c3p0b2YgS296bG93c2tp
IiA8a3J6aytkdEBrZXJuZWwub3JnPiwgIkNvbm9yIERvb2xleSIgPGNvbm9yK2R0QGtlcm5lbC5v
cmc+LCAiUGF1bCBXYWxtc2xleSIgPHBqd0BrZXJuZWwub3JnPiwgIlBhbG1lciBEYWJiZWx0IiA8
cGFsbWVyQGRhYmJlbHQuY29tPiwgIkFsYmVydCBPdSIgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4s
ICJBbGV4YW5kcmUgR2hpdGkiIDxhbGV4QGdoaXRpLmZyPgo+IENjOiAiSGFuIEdhbyIgPHJhYmVu
ZGEuY25AZ21haWwuY29tPiwgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsICJIYW4g
R2FvIiA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+IFN1YmplY3Q6IFtQQVRDSCB2MiAxLzJdIGR0LWJp
bmRpbmdzOiByaXNjdjogZXN3aW46IEFkZCBNaWxrLVYgTWVncmV6Cj4gCj4gRnJvbTogSGFuIEdh
byA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+IAo+IEFkZCB0aGUgY29tcGF0aWJsZSBmb3IgdGhlIE1p
bGstViBNZWdyZXosIGEgTWluaS1JVFggYm9hcmQgYmFzZWQgb24gdGhlCj4gRVNXSU4gRUlDNzcw
MFggU29DLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4K
PiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2Vzd2luLnlh
bWwgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9lc3dpbi55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2Vzd2luLnlhbWwKPiBpbmRl
eCBjNjAzYzQ1ZWVmMjI1MmU3NjA4MThlODMwZTlkY2NkZjBmZGFlNmNmLi5mNzMwZjVmZjkxNzk3
ZDRjMmYwNjEwZjkwMjRhNzQ2MTFmZmVhZTYzIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9lc3dpbi55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2Vzd2luLnlhbWwKPiBAQCAtMjEsNiArMjEsNyBA
QCBwcm9wZXJ0aWVzOgo+ICAgICAgb25lT2Y6Cj4gICAgICAgIC0gaXRlbXM6Cj4gICAgICAgICAg
ICAtIGVudW06Cj4gKyAgICAgICAgICAgICAgLSBtaWxrdixtZWdyZXoKPiAgICAgICAgICAgICAg
ICAtIHNpZml2ZSxoaWZpdmUtcHJlbWllci1wNTUwCj4gICAgICAgICAgICAtIGNvbnN0OiBlc3dp
bixlaWM3NzAwCj4gIAo+IAo+IC0tIAo+IDIuNDcuMwo+IAoKQWNrZWQtYnk6IE1pbiBMaW4gPGxp
bm1pbkBlc3dpbmNvbXB1dGluZy5jb20+CgpCZXN0IHJlZ2FyZHMsCk1pbiBMaW4K
