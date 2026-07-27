Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A9C238C0A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785115414; cv=none; b=ERf10Rx0dhSYxCJhKzKDDzMLsq2QyukrGHdba+Eh4RAX8+PsWQtkmBFYYlgdcwOsvF5qlT6rcOz/xDaEJARsucrU9Mca409YgKO+oelMs8jNnUWJl759W2EFzqP/BN7uu+hqKodhZ9mfQUssNVCCKUKXw09pvK/42iuoM2ZInRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785115414; c=relaxed/simple;
	bh=nr73zAl2QgzoXpdmKXg+2YQMVP+hiBGn0WZp22+cFWE=;
	h=Date:References:To:Cc:In-Reply-To:Content-Type:From:Subject:
	 Message-Id:Mime-Version; b=T7Yc3SkXSGEl2xIuyWt2bRt0zO60w7i3c7mETDbXpGPqsKf63QaYwaFl939liaC0puYjZpoDrEOc9snwwkEi+E7LkYVGwZB6etSr5TcGmSjPYPrzmiCoPJxGiCemhGX2DRkPuelMUUu7u2bXGyEp+7oM7SoyVBDKFBAPjJXDuCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacemit.com; spf=pass smtp.mailfrom=spacemit.com; dkim=pass (2048-bit key) header.d=spacemit.com header.i=@spacemit.com header.b=KUft50Lm; arc=none smtp.client-ip=209.127.231.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacemit.com header.i=@spacemit.com header.b="KUft50Lm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1785115401; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=nr73zAl2QgzoXpdmKXg+2YQMVP+hiBGn0WZp22+cFWE=;
 b=KUft50Lmwf81FryrxYLC+RFO09ePppd7pcLYSlEpLVDr9CVz6nfTrmQbB3tb3Fu6quc5NA
 18gSXgH6YgWiEkU5RkGKxcS+GVyvh/jWtpVFOho/+zxeoAVYpuAz6kceDebPo+Lik1uEIY
 70mHYDUfQlgnxpRuomdqHBpQlic19ZDYOGs8WomCfeI7OaxL8TkAHp4eoFLtcPl5T9St5J
 I+2DIsdvf4sVdGBLO/1DwIOBttzc3jlfy5/CtU4WF9JcUZtGBq7YsIBh8A/tlsjGpnTzEB
 R4lUefbmTF2pcTPwlIBrCr68HpkZSPWGLrKFse7otZtjp+/zUvxulnI/9TXIag==
Date: Mon, 27 Jul 2026 09:22:31 +0800
Received: from snode5.. ([120.237.158.181]) by smtp.feishu.cn with ESMTP; Mon, 27 Jul 2026 09:23:19 +0800
References: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com> <20260727012231.1025210-1-baihui.liang@spacemit.com>
X-Mailer: git-send-email 2.34.1
To: "Frank Binns" <frank.binns@imgtec.com>, 
	"Matt Coster" <matt.coster@imgtec.com>
Cc: "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, 
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>
In-Reply-To: <20260727012231.1025210-1-baihui.liang@spacemit.com>
Content-Type: text/plain; charset=UTF-8
From: "Sterling-Ash" <baihui.liang@spacemit.com>
Subject: [PATCH v2 2/2] drm/imagination: allow probe when no power-domains are described
Message-Id: <20260727012231.1025210-3-baihui.liang@spacemit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Sterling-Ash <baihui.liang@spacemit.com>
X-Lms-Return-Path: <lba+26a66b308+a9673a+vger.kernel.org+baihui.liang@spacemit.com>
Content-Transfer-Encoding: base64

cHZyX3Bvd2VyX2RvbWFpbnNfaW5pdCgpIGN1cnJlbnRseSBmYWlscyBwcm9iZSB3aXRoIC1FTk9F
TlQgd2hlbiB0aGUNCmRldmljZSB0cmVlIG5vZGUgaGFzIG5vICJwb3dlci1kb21haW5zIiBwcm9w
ZXJ0eS4gT24gc29tZSBwbGF0Zm9ybXMNCihlLmcuIFNwYWNlbWlUIEszKSB0aGUgR1BVIHBvd2Vy
IGRvbWFpbiBpcyBicm91Z2h0IHVwIGJ5IHRoZSBib290bG9hZGVyDQphbmQgaXMgbm90IG1vZGVs
ZWQgb3IgbWFuYWdlZCBieSBMaW51eCwgc28gdGhlcmUgaXMgbGVnaXRpbWF0ZWx5IG5vDQpwb3dl
ci1kb21haW5zIHBoYW5kbGUgdG8gYXR0YWNoLg0KDQpUcmVhdCBhIG1pc3NpbmcgInBvd2VyLWRv
bWFpbnMiIHByb3BlcnR5IGFzICJub3RoaW5nIHRvIGF0dGFjaCIgYW5kDQpjb250aW51ZSBwcm9i
aW5nLCByYXRoZXIgdGhhbiBmYWlsaW5nLg0KDQpTaWduZWQtb2ZmLWJ5OiBTdGVybGluZy1Bc2gg
PGJhaWh1aS5saWFuZ0BzcGFjZW1pdC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vaW1hZ2lu
YXRpb24vcHZyX3Bvd2VyLmMgfCA5ICsrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJf
cG93ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcG93ZXIuYw0KaW5kZXgg
YTcxZDViMzU2MDFlLi41NzUxZTJkODE0YjAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aW1hZ2luYXRpb24vcHZyX3Bvd2VyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlv
bi9wdnJfcG93ZXIuYw0KQEAgLTYzNSw2ICs2MzUsMTUgQEAgaW50IHB2cl9wb3dlcl9kb21haW5z
X2luaXQoc3RydWN0IHB2cl9kZXZpY2UgKnB2cl9kZXYpDQogDQogCWRvbWFpbl9jb3VudCA9IG9m
X2NvdW50X3BoYW5kbGVfd2l0aF9hcmdzKGRldi0+b2Zfbm9kZSwgInBvd2VyLWRvbWFpbnMiLA0K
IAkJCQkJCSAgIiNwb3dlci1kb21haW4tY2VsbHMiKTsNCisJaWYgKGRvbWFpbl9jb3VudCA9PSAt
RU5PRU5UKSB7DQorCQkvKg0KKwkJICogTm8gInBvd2VyLWRvbWFpbnMiIHByb3BlcnR5IGluIHRo
ZSBkZXZpY2UgdHJlZTogdGhlIHBsYXRmb3JtDQorCQkgKiBoYW5kbGVzIHBvd2VyIGRvbWFpbnMg
dHJhbnNwYXJlbnRseSBvciBhdCB0aGUgZmlybXdhcmUvYm9vdGxvYWRlciBsZXZlbCwNCisJCSAq
IHNvIHRoZXJlIGlzIG5vIGRvbWFpbiB0byBhdHRhY2guIFRyZWF0IHRoaXMgYXMgbm9uLWZhdGFs
Lg0KKwkJICovDQorCQllcnIgPSAwOw0KKwkJZ290byBvdXQ7DQorCX0NCiAJaWYgKGRvbWFpbl9j
b3VudCA8IDApIHsNCiAJCWVyciA9IGRvbWFpbl9jb3VudDsNCiAJCWdvdG8gb3V0Ow0KLS0gDQoy
LjM0LjENCgpUaGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50IGFyZSBjb25maWRlbnRpYWwg
YW5kIG1heSBiZSBwcml2aWxlZ2VkIG9yIG90aGVyd2lzZSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9z
dXJlLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBtZXNzYWdl
LCBwbGVhc2UgZGVsZXRlIGl0IGFuZCBhbnkgYXR0YWNobWVudCBmcm9tIHlvdXIgc3lzdGVtIGFu
ZCBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBieSByZXBseSBlLW1haWwuIFVuaW50ZW5k
ZWQgcmVjaXBpZW50cyBzaG91bGQgbm90IHVzZSwgY29weSwgZGlzY2xvc2Ugb3IgdGFrZSBhbnkg
YWN0aW9uIGJhc2VkIG9uIHRoaXMgbWVzc2FnZSBvciBhbnkgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgbWVzc2FnZS4gRW1haWxzIGNhbm5vdCBiZSBndWFyYW50ZWVkIHRvIGJlIHNlY3Vy
ZSBvciBlcnJvciBmcmVlIGFzIHRoZXkgY2FuIGJlIGludGVyY2VwdGVkLCBhbWVuZGVkLCBsb3N0
IG9yIGRlc3Ryb3llZCwgYW5kIHlvdSBzaG91bGQgdGFrZSBmdWxsIHJlc3BvbnNpYmlsaXR5IGZv
ciBzZWN1cml0eSBjaGVja2luZy4gCiAK5pys6YKu5Lu25Y+K5YW25Lu75L2V6ZmE5Lu25YW35pyJ
5L+d5a+G5oCn6LSo77yM5bm25Y+v6IO95Y+X5YW25LuW5L+d5oqk5oiW5LiN5YWB6K646KKr5oqr
6Zyy57uZ56ys5LiJ5pa544CC5aaC6ZiB5LiL6K+v5pS25Yiw5pys6YKu5Lu277yM5pWs6K+356uL
5Y2z5Lul5Zue5aSN55S15a2Q6YKu5Lu255qE5pa55byP6YCa55+l5Y+R5Lu25Lq677yM5bm25bCG
5pys6YKu5Lu25Y+K5YW25Lu75L2V6ZmE5Lu25LuO6ZiB5LiL57O757uf5Lit5LqI5Lul5Yig6Zmk
44CC5aaC6ZiB5LiL5bm26Z2e5pys6YKu5Lu25YaZ5piO5LmL5pS25Lu25Lq677yM5pWs6K+35YiH
5Yu/5L2/55So44CB5aSN5Yi244CB5oqr6Zyy5pys6YKu5Lu25oiW5YW25Lu75L2V5YaF5a6577yM
5Lqm6K+35YiH5Yu/5L6d5pys6YKu5Lu25oiW5YW25Lu75L2V5YaF5a656ICM6YeH5Y+W5Lu75L2V
6KGM5Yqo44CC55S15a2Q6YKu5Lu25peg5rOV5L+d6K+B5piv5LiA56eN5a6J5YWo5ZKM5LiN5Lya
5Ye6546w5Lu75L2V5beu6ZSZ55qE6YCa5L+h5pa55byP77yM5Y+v6IO95Lya6KKr5oum5oiq44CB
5L+u5pS544CB5Lii5aSx5oiW5o2f5Z2P77yM5pS25Lu25Lq66ZyA6Ieq6KGM6LSf6LSj5YGa5aW9
5a6J5YWo5qOA5p+l44CC
