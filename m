Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C3822423A;
	Sun, 16 Aug 2026 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786885012; cv=none; b=O2mcGURvwcifYlQ+kpHn9QuIKNmXOcJRgToGyELzxerrogIRxdK/qDziia33PHuUdcoTSQGeJZ8R+EZiiKqs2TSNPccbAQAVHIb4NbZ4++pS7UqVtPj/BoM86e1YvN8MHIJe7PN+26mPdW0CBWTLwbAUpoSyxcWNChyNkjA3ZNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786885012; c=relaxed/simple;
	bh=KtM92UjDWiVOHakM71uJ+Lae20Hh7YTTnG8gbjrvN4k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=C4wxUcfv0nZtIo8nN8ahZIZU3kIJ5H/vHQus7pnoi5KLwJvrFK+Gpu1PQE+IJpY5Tv+mj9EYYDU6mxLt4rKuF8/3NNChoG8Upo3pn6BDg9INgpDAO9wbJDSA63AabsbpdNHy+19NJwdFcjjxmCkPKFll97r+MDNLfvLQgvtVEGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ip5D4QiZ; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ip5D4QiZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=KtM92UjDWiVOHakM71uJ+Lae20Hh7YTTnG8gbjrvN4k=; b=I
	p5D4QiZkvxVOThYHJkbd4nJ92vidSeFLJw7tML2sNZY6o8SW4ctg6/o2ne6ie/WL
	VFLliQTsGgzzhWhtVegwsvfLyz3/Gd3dRRPhvsZ2I5VtpvBn4fVsi91axe8mRbIi
	CwY5sLxjdrursXz4gqRVdF8r20UNXUK5mtbRTwvWro=
Received: from andyshrk$163.com ( [61.154.14.86] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Sun, 16 Aug 2026 20:54:39 +0800
 (CST)
Date: Sun, 16 Aug 2026 20:54:39 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: "Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"Andrzej Hajda" <andrzej.hajda@intel.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>,
	"Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
	"Jonas Karlman" <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	"Luca Ceresoli" <luca.ceresoli@bootlin.com>,
	"Philipp Zabel" <p.zabel@pengutronix.de>,
	"Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>,
	"Damon Ding" <damon.ding@rock-chips.com>,
	"Dmitry Baryshkov" <lumag@kernel.org>,
	"Alexey Charkov" <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re:[PATCH v11 07/21] drm/bridge: synopsys: dw-dp: Fix support for
 short I2C reads
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-7-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-7-0d508505f383@collabora.com>
X-NTES-SC: AL_Qu2TBPSTu0As7yCcZekfmUgWjuw/WsG1v/Ul1YBSP556jCrp6yoHelRJMXX9zsmrEg+xlzSHfCNT0M9dRK11eZMXRPYLCgc9i8hWgKKkem2vbA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2c10a52.193c.1a00aa372c7.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgD33xwPs4Fqy8cyAA--.25160W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxg-qSWqBsw-x+gAA32
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhlbGxvIFNlYmFzdGlhbiwKCkF0IDIwMjYtMDgtMDcgMDE6MDI6MTMsICJTZWJhc3RpYW4gUmVp
Y2hlbCIgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+VGhlIHRyYW5z
ZmVyIGZ1bmN0aW9ucyByZXR1cm5zIHRoZSBhbW91bnQgb2YgYnl0ZXMgcmVhZCBmb3IKPkRQX0FV
WF9JMkNfUkVBRC4gQnkgcmV0dXJuaW5nIC1FQlVTWSBmb3Igc2hvcnQgcmVhZHMsIHRoZSBjYWxs
ZXIgaGFzCj5sZXNzIGluZm9ybWF0aW9uIGF2YWlsYWJsZSB3aGF0IGlzIGdvaW5nIHdyb25nIGFu
ZCBwb3NzaWJseSBzaW1wbHkKPnJlc2VuZHMgdGhlIHJlYWQgcmVxdWVzdC4gT24gc2lua3Mgbm90
IHN1cHBvcnRpbmcgbG9uZyByZWFkcywgdGhpcyB3aWxsCj5zaW1wbHkgcnVuIGludG8gdGhlIHNh
bWUgaXNzdWUgYWdhaW4uCj4KPkluc3RlYWQgaXQgbWFrZXMgbW9yZSBzZW5zZSB0byByZXR1cm4g
dGhlIGRhdGEgZnJvbSB0aGUgc2hvcnQgcmVhZCB3aXRoCj50aGUgbGVuZ3RoIGluZm9ybWF0aW9u
LCB3aGljaCBhbGxvd3MgZHJtX2RwX2kyY19kb19tc2coKSB0byByZWFkIGRhdGEgaW4KPnNtYWxs
ZXIgY2h1bmtzIGFuZCBzdWNjZWVkIGluIHRoZSBlbmQuCj4KPkR1ZSB0byBsYWNrIG9mIGEgc2lu
aywgd2hpY2ggb25seSBzdXBwb3J0cyBzaG9ydCByZWFkcywgdGhpcyBjaGFuZ2UgaXMKPmVmZmVj
dGl2ZWx5IHVudGVzdGVkLgo+Cj5GaXhlczogODZlZWNjM2E5YzJlICgiZHJtL2JyaWRnZTogc3lu
b3BzeXM6IEFkZCBEVyBEUFRYIENvbnRyb2xsZXIgc3VwcG9ydCBsaWJyYXJ5IikKPlJlcG9ydGVk
LWJ5OiBTYXNoaWtvIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPgo+U2lnbmVkLW9mZi1ieTogU2Vi
YXN0aWFuIFJlaWNoZWwgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+CgogICBSZXZp
ZXdlZC1ieTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgoKPi0tLQo+IGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYyB8IDIgKy0KPiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctZHAuYwo+aW5kZXggMjU3M2VhMmJiNTc0Li44Y2ViMTM5ZjFhNzIgMTAwNjQ0
Cj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMKPisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYwo+QEAgLTE1MTMsNyArMTUxMyw3
IEBAIHN0YXRpYyBzc2l6ZV90IGR3X2RwX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAq
YXV4LAo+IAkJaWYgKG1zZy0+cmVxdWVzdCAmIERQX0FVWF9JMkNfUkVBRCkgewo+IAkJCXNpemVf
dCBjb3VudCA9IEZJRUxEX0dFVChBVVhfQllURVNfUkVBRCwgdmFsdWUpIC0gMTsKPiAKPi0JCQlp
ZiAoY291bnQgIT0gbXNnLT5zaXplKQo+KwkJCWlmICghY291bnQgfHwgY291bnQgPiBtc2ctPnNp
emUpCj4gCQkJCXJldHVybiAtRUJVU1k7Cj4gCj4gCQkJcmV0ID0gZHdfZHBfYXV4X3JlYWRfZGF0
YShkcCwgbXNnLT5idWZmZXIsIGNvdW50KTsKPgo+LS0gCj4yLjUzLjAK
