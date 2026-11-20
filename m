Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193738;
	b=y8Jo8dfNhOk5/e2LT2HXDAeZdBqhDhCbVbXu8aI4HvvworUEtOJgRsx31VuZ8HNBWq5y
	 JLXoAnQNB4IR89A4CCCFhDRG+iB2NkghaD/j2/7dcnlyl7wAHC7J65mzg4rNqR9Y5k1K1
	 XGQBkTtmKwXru2GzULoavm6bLliGjxXMJaTNfc+Gk7+lETj1SDmrYmq577GCFc3zCZDT0
	 BekX8sMBjebOdA+iI8JV+wDHH4YzruuSu3Ngnk1EZy1lvv8qTpgIU6yrr38ONOjZGw8v3
	 ijIwWNZ0AsdfeES/7zE3AcDWihZ6nbNU+Re9355ZUqDwoZLgAoX/k8VmDog6+ZEzBCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193738;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=snCMBOAglodr748wRnt9xySVHP/f+6uaFvHz0+tjdM0=;
	b=bQd8ynWTF4YPLwbaisKgspPvYJrquA/d03OmZhSTIlCbVPoPSThpd5JfzhjTM1s/g+am
	 CTkccHVpWQC+Q56Jq1jTFug9GwwmcWhOjKzHlZxI295zRRYgiL7QeIwNWzQ0YKWFtagvD
	 d2jRK1b8aAHkIuW6mncSNw3yZ/h60+2g05lWkI/jCmkfvF6OOuKbXMbQQHoxwiVzOZA/I
	 /Vv2nfzJbyPjGhZ8eODuwW7soUmLnYk4j/xjIq6zNxgvho+GUTOsdC5DE+eo8KZtr03+s
	 Y4ujZvdgkla+8Vehjv8+eQZLeAe4iZ8L+6JDi4cWDmYKoZf9m9gUzITu138Zoc19nnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ZbOeqNtt;
	arc=none smtp.remote-ip=43.163.128.53
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42138606A333
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42138606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ZbOeqNtt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795193727; bh=snCMBOAglodr748wRnt9xySVHP/f+6uaFvHz0+tjdM0=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=ZbOeqNttmDLDSsQ6C1wKyG4shRRWkqJg2zW6imq0aTNIK5pLfQ9T1Tp/qqOjEzL6f
	 M/Eq2x3rWYetUqST5iTggUgWAxO2Ma/1ojPHS0bBrWBnHI7+2AShksHRjtZHf0D9+J
	 n4ZY6VOPpNJyf+rV4POFtzjve3eizlB/FbVJXjsI=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-XMAILINFO: NB8AK7fcAs0KdrHQ5MculXsSnCvP/x+NaTXr1bzxOr0qWgcYZHV/jV0qCihvZU
	 D6sNKZ+9bwHJCV6T7pFiiux/A5lqnrJtZeIrPX1MTQG7SuiaoSZkzO494h8jX5aVx1AUnOOebH8Ru
	 Ev5ogkSY0Pk1L+ZTJj64CCai+sEKAPvirvCsvm95WLd4Otx/D5yEUHMMrcr+D2w9GjaR15bjHcfyd
	 0+Sr8q7zarpX5ysqvkWI7+jrvzIQ9NQj9NeehpyI86ouwkIB6xCO6VUK4yM+0CVkphfLlmD+dOKzb
	 LdIHUGwH/Wk+6Shjw8v4luncHs+eLS5I56x4Hj8r8/43faoANN/m6YLWt8t2UrEe8ed48U9lOffOb
	 bD43kWfShPpcGvMgiOy4T/4OLdWALkTMBIqqTxp413x/ao7GCWtNwgMrbAIIl0Vw278Q1tCjwI17H
	 ioJyOXc5oH1D03s7H4rBCqGRKkQ/st+38ikGwm6CRWrXqlNSG8uzA4+BQpk7Fdhtw4KNJ5a51sHpq
	 Us2G47XkCKNKttJ4SUIEMaoV351BtekCx8uGWHKjHzgZ8sWSgPTdpoTRqXl7c3boUUq+jeUmSzdGl
	 eGjOok3HzIjyx4HI3AvTu8c4km0UFt2kv7bNCgA797cwNuzy5SwuQc77iBORLjSaxIvchfPnlhgBn
	 rqiO42f1fe67qKc/gXy/socyzdx87cxUZu6rQrdjuSNAHBq2ASfGnUM+3Uxko3XeAB3bmfBep1sZP
	 06BZJHkSSAshxbIOty+Z1k07ADeynjRLF+tCba3UR4DOctxHZFDXk5h6Re+waOY6R6PLqvwj3pLbG
	 gVzd7fCm0zbu2wQabiNnd6O/7wxHh2FT3KVrBeKW9ynzDNmWTsK1RJ1X0iozdR71HDHh/YjypoLfI
	 EZBlzusn0dCYQMV5ptrQZnAT+xwG8pU4M/a83gVSioNIs4cvmtDiIW0F1GL6BGFgRLIhTz/wwmPbC
	 v+lkpgmOai0eTj1IuM7k4EE3jr+REaoVaZvI9bmtD0vS7KpZGpahB4UeRrVrCKC50oNC3ZbVCfmDw
	 pGlSijwrJ5VdnABEKzVwHNU75JbUgLiWeNVoRPSySaJMf3Rq1hvGphg8r1S/GCSA8sqtI3y7+zei2
	 0sfer53Js+0lA2jKzbQRfRKI
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?Sm9uYXMgS2FybG1hbg==?=" <jonas@kwiboo.se>
Cc: "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?RWxhaW5lIFpoYW5n?=" <zhangqing@rock-chips.com>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v2] dt-bindings: soc: rockchip: Add RK3572 PMU and GRF
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
Date: Sat, 21 Nov 2026 00:55:25 +0800
X-Priority: 3
Message-ID: <tencent_71414D193416327F09E723DB01C688137E08@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261119-add-board-ok3572-c-soc-v2-1-86f331024ae6@qq.com>
	<0c495655-9ec8-4d16-a33e-ef4ef3a8f2bc@kwiboo.se>
In-Reply-To: <0c495655-9ec8-4d16-a33e-ef4ef3a8f2bc@kwiboo.se>
X-QQ-mid: xmsezb41-0t1795193725tg1wj8w7y

SGkgSm9uYXMsCgo+ID7CoGRpZmbCoC0tZ2l0wqBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb2Mvcm9ja2NoaXAvZ3JmLnlhbWzCoGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvYy9yb2NrY2hpcC9ncmYueWFtbAo+ID7CoGluZGV4wqBlOTRj
ODNkN2MxMzguLjBlMGJmOGUyMzRjOMKgMTAwNjQ0Cj4gPsKgLS0twqBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mvcm9ja2NoaXAvZ3JmLnlhbWwKPiA+wqArKyvC
oGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9yb2NrY2hpcC9ncmYu
eWFtbAo+ID7CoEBAwqAtMzAsNsKgKzMwLDEywqBAQMKgcHJvcGVydGllczoKPiA+wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAtwqByb2NrY2hpcCxyazM1NjgtcGlwZS1ncmYK
PiA+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAtwqByb2NrY2hpcCxyazM1Njgt
cGlwZS1waHktZ3JmCj4gPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLcKgcm9j
a2NoaXAscmszNTY4LXVzYjJwaHktZ3JmCj4gPsKgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAtwqByb2NrY2hpcCxyazM1NzItaW9jLWdyZgo+ID7CoCvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLcKgcm9ja2NoaXAscmszNTcyLW52bTAtZ3JmCj4gPsKgK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAtwqByb2NrY2hpcCxyazM1NzItcGhwLWdyZgo+ID7CoCvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLcKgcm9ja2NoaXAscmszNTcyLXBpcGUtcGh5
LWdyZgo+ID7CoCvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLcKgcm9ja2NoaXAscmsz
NTcyLXBtdTAtZ3JmCj4KPiBBcmUgd2UgbWlzc2luZyByb2NrY2hpcCxyazM1NzItcG11MS1n
cmYgYW5kIHBvc3NpYmxlIG90aGVyIHN5c2NvbnM/CgpJIGhhdmUgbGltaXRlZCB0aW1lIGFu
ZCBjYW4gb25seSB0YWtlIG9uIHNvIG11Y2ggbXlzZWxmLiBGb3IgdGhpcwpmaXJzdCByb3Vu
ZCwgSSdkIGxpa2UgdG8gZ2V0IGEgYmFzaWMgc3lzdGVtIHVwc3RyZWFtIHdpdGggQ1BVLCBV
U0IsCkdNQUMsIFVBUlQsIGFuZCBzbyBvbi4gSSd2ZSBvbmx5IGRvY3VtZW50ZWQgdGhlIEdS
RiBpbnN0YW5jZXMgSQphY3R1YWxseSB1c2UgaW4gdGhlIHByb3Bvc2VkIGRldmljZSB0cmVl
LgoKT25jZSB0aGlzIHJvdW5kIGlzIGRvbmUsIEkgcGxhbiB0byBwb3J0IGFuZCB0ZXN0IHN1
cHBvcnQgZm9yIHNtYWxsZXIKZmVhdHVyZXMgc3VjaCBhcyByZWJvb3QtbW9kZSwgRERSIGZy
ZXF1ZW5jeSBzY2FsaW5nLCBPVFAsIGFuZCBUUk5HLAphcyB3ZWxsIGFzIEdQVSwgTlBVLCBQ
Q0llLCBDQU4sIGFuZCBvdGhlciBoYXJkd2FyZSBpbiBhIGZvbGxvdy11cApzZXJpZXMuCgo+
IERvwqB3ZcKgbmVlZMKgYcKgc3BlY2lhbMKgcm9ja2NoaXAscmszNTcyLXVzYjJwaHktZ3Jm
P8KgSWbCoHJrMzU3MsKgbWltaWNzCj4gUkszNTc2wqB0aGVyZcKgYXJlwqB0d2/CoHVzYjJw
aHnCoEdSRizCoGVhY2jCoG9uZcKgaWRlbnRpY2FswqBhbmTCoG9ubHnCoGNvdmVyaW5nCj4g
dXNiMnBoecKgZnVuY3Rpb25zLgo+IAo+IFdpdGjCoEdSRsKgY29tcGF0wqBJwqBleHBlY3TC
oHRoZcKgRFTCoHNvwqBiZcKgc29tZXRoaW5nwqBsaWtlwqBmb2xsb3dpbmc6Cj4gCj4gwqDC
oHVzYjJwaHkwX2dyZjrCoHN5c2NvbkAyNjA1NDAwMMKgewo+IGNvbXBhdGlibGXCoD3CoCJy
b2NrY2hpcCxyazM1NzItdXNiMnBoeS1ncmYiOwo+IHJlZ8KgPcKgPDB4MMKgMHgyNjA1NDAw
MMKgMHgwwqAweDIwMDA+Owo+IAo+IHVzYjJwaHkwOsKgdXNiMnBoecKgewo+IGNvbXBhdGli
bGXCoD3CoCJyb2NrY2hpcCxyazM1NzItdXNiMnBoeSI7Cj4gfTsKPiDCoMKgfTsKPiAKPiDC
oMKgdXNiMnBoeTFfZ3JmOsKgc3lzY29uQDI2MDU2MDAwwqB7Cj4gY29tcGF0aWJsZcKgPcKg
InJvY2tjaGlwLHJrMzU3Mi11c2IycGh5LWdyZiI7Cj4gcmVnwqA9wqA8MHgwwqAweDI2MDU2
MDAwwqAweDDCoDB4MjAwMD47Cj4gCj4gdXNiMnBoeTE6wqB1c2IycGh5wqB7Cj4gY29tcGF0
aWJsZcKgPcKgInJvY2tjaGlwLHJrMzU3Mi11c2IycGh5IjsKPiB9Owo+IMKgwqB9Owo+IAo+
IFRoZcKgdXNiMnBoecKgY2hpbGTCoG5vZGXCoHdvdWxkwqBiZcKgdGhlwqBzb2xlwqBjaGls
ZMKgbm9kZcKgb2bCoEdSRsKgYW5kwqB0aGXCoGNoaWxkCj4gbm9kZcKgY29uc3VtZcKgd2hv
bGXCoHBhcmVudMKgcmVnwqBzcGFjZS7CoFNob3VsZMKgdGhlecKgaW5zdGVhZMKgYmXCoG1l
cmdlZD/CoFRoYXQKPiBpc8KgaG93wqBJwqBkZXNjcmliZWTCoHRoZcKgdXNiMnBoecKgbm9k
ZXPCoGluwqBVLUJvb3TCoG1haW5saW5lwqB3b3JrwqBhdMKgWzFdLgo+IAo+IFsxXcKgaHR0
cHM6Ly9naXQudS1ib290LXByb2plY3Qub3JnL3UtYm9vdC9jb250cmlidXRvcnMva3dpYm9v
L3UtYm9vdC8tL2Jsb2IvcmszNTYyL2FyY2gvYXJtL2R0cy9yazM1NzIuZHRzaSNMMzU3LTQw
MwoKU29ycnkgSSBtaXNzZWQgdGhpcy4gSSB0b29rIHRoZSBVU0IyIFBIWSBsYXlvdXQgZGly
ZWN0bHkgZnJvbSB0aGUKUkszNTcyIGRldmljZSB0cmVlIGluIFJvY2tjaGlwJ3Mga2VybmVs
LgoKSSBjaGVja2VkIGJvdGggUkszNTcyIGFuZCBSSzM1NzYgaW4gUm9ja2NoaXAncyBrZXJu
ZWwuIE9uIFJLMzU3NiwgdGhlClVTQi9EUCBQSFkgYWxzbyByZWZlcmVuY2VzIHRoZSBVU0Iy
IFBIWSdzIHBhcmVudCBHUkYuIE9uIFJLMzU3MiwgSQpkaWRuJ3QgZmluZCBhbnlvbmUgdXNp
bmcgdGhlIHBhcmVudCBHUkYgb3RoZXIgdGhhbiBpdHMgb3duIFVTQjIgUEhZCmNoaWxkcmVu
LgoKSSdtIGxlYW5pbmcgdG93YXJkIHlvdXIgYXBwcm9hY2ggYXMgd2VsbCwgc28gSSdsbCBz
d2l0Y2ggdG8gb25lIG5vZGUKcGVyIFBIWSBpbiB2My4KClAuUy4gSSBwcm9iYWJseSB3b24n
dCBzZW5kIFNvQyB2MyByaWdodCBhd2F5LiBJJ2xsIHdhaXQgdW50aWwgdGhlIG90aGVyCnJl
bGF0ZWQgcGF0Y2hlcyBhcmUgYWNjZXB0ZWQgYmVmb3JlIHBvc3RpbmcgaXQuCgpCZXN0IHJl
Z2FyZHMsCkN1bmhhbyBMdQoKcHctYm90OiBjcgo=

