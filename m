Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9814B049A;
	Sun, 16 Aug 2026 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786884553; cv=none; b=KMqz9LOWXedvmoCAtc7VTW29SqEN8xfwXyPJNgdIwT/cSO3nnsPbD5eWHCZL6MUCvZ8NNHwVb3CclgQnMoLteXo3CHbnAs1QgIJvt41FgxJg+s6/648hjU/cArNnEwz7FE5SaGj3O1uJydLB+rxYs0dFLqOd1VDqlwHn7vfjtCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786884553; c=relaxed/simple;
	bh=8xeSCS2YI1dQ6ACetAfj7iAYg4mVS0nJaQNqMk76rwI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=M70dqpyP7zavek0Ibu9wmDvA4/i5e4awWEI6QFoqZMjl90oGc9TdvlGXtRalHVpeVAWnKTXOdhlA3iQIy9wTw5raRuXXIwKb40GykpWqIr5vywC+qk9b+SspUzNaxxdr8wy6anegTdhbwMc0rwQt36LT5rbzq+jYo7w9rgUEvcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZKQ6hHDG; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZKQ6hHDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=8xeSCS2YI1dQ6ACetAfj7iAYg4mVS0nJaQNqMk76rwI=; b=Z
	KQ6hHDGc16FxYH6VnX3lwlTTuhz0DgAO+EeM40AwbOC2Js57zlbgBw6Vo0DivuYz
	k4idzZ3x6N/dtcZtcKopSFrPcO4ubBfugJ+qjpJtFNqZsTU63XD09qAX0VfI3Ydi
	LV0me+O4eDC/ZxxIadVRsMqsQS1/xlhjiCaVPl2KWo=
Received: from andyshrk$163.com ( [61.154.14.86] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Sun, 16 Aug 2026 20:47:08 +0800
 (CST)
Date: Sun, 16 Aug 2026 20:47:08 +0800 (CST)
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
Subject: Re:[PATCH v11 04/21] drm/bridge: synopsys: dw-dp: Document missing
 reset line deassert
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-4-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-4-0d508505f383@collabora.com>
X-NTES-SC: AL_Qu2TBPSTu0wp7iadY+kfmUgWjuw/WsG1v/Ul1YBSP556jCrp6yoHelRJMXX9zsmrEg+xlzSHfCNT0M9dRK11eZMXcFtjQ4Frsq6oUGvCHo/TTw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <2b761354.18f3.1a00a9c9379.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgD3HxNMsYFqiscyAA--.25027W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxgx62GqBsUzUMAAA3a
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhlbGxvIFNlYmFzdGlhbiwKCkF0IDIwMjYtMDgtMDcgMDE6MDI6MTAsICJTZWJhc3RpYW4gUmVp
Y2hlbCIgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+SWYgdGhlIGRy
aXZlciB1c2VzIGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlX2RlYXNzZXJ0ZWQoKSBp
bnN0ZWFkCj5vZiBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0KCkgYW5kIHRodXMgYXV0b21hdGljYWxs
eSBkZWFzc2VydHMgZHVyaW5nCj5wcm9iZSwgdGhlIFNvQyB3aWxsIGhhbmcgd2hlbiB0aGUgZGV2
aWNlIGlzIHVuYm91bmQuCj4KPlRoaXMgZG9lcyBub3QgaGFwcGVuLCB3aGVuIHJ1bnRpbWUgUE0g
aXMgYmVpbmcgdXNlZCAobm90IHlldCBzdXBwb3J0ZWQKPmluIG1haW5saW5lKSwgd2hpY2ggc3Vn
Z2VzdHMgdGhlIHBvd2VyLWRvbWFpbiBpbnZvbHZlZCByZXF1aXJlcyB0aGlzIHJlc2V0Cj5saW5l
IHRvIGJlIGRlYXNzZXJ0ZWQuCj4KPkV2ZW4gd2l0aCBydW50aW1lIFBNIHRoZXJlIGlzIG5vIGd1
cmFudGVlIHRoYXQgdGhlIHBvd2VyLWRvbWFpbiBpcwo+ZGlzYWJsZWQgYXMgaXQgaXMgc2hhcmVk
LiBDb25zaWRlcmluZyB0aGUgcG93ZXItZG9tYWluIGRvZXMgbm90IGhhdmUKPnRoZSByZXNldCBk
ZXBlbmRlbmN5IGRlc2NyaWJlZCBpbiBEVCwgZG9jdW1lbnQgdGhlIHByb2JsZW0gYnV0IGxlYXZl
Cj50aGluZ3MgaW4gdGhlIGN1cnJlbnQgc3RhdGUgdW50aWwgYSBiZXR0ZXIgc29sdXRpb24gaXMg
Zm91bmQgYXMgdGhlCj5yZXNldCBsaW5lIGlzIGRlYXNzZXJ0ZWQgYnkgZGVmYXVsdCBvbiBhbGwg
c3VwcG9ydGVkIHBsYXRmb3Jtcy4KPgo+UmVwb3J0ZWQtYnk6IFNhc2hpa28gPHNhc2hpa28tYm90
QGtlcm5lbC5vcmc+Cj5TaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFu
LnJlaWNoZWxAY29sbGFib3JhLmNvbT4KCiAgIFJldmlld2VkLWJ5OiBBbmR5IFlhbiA8YW5keS55
YW5Acm9jay1jaGlwcy5jb20+Cj4tLS0KPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWRwLmMgfCA0ICsrKysKPiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMKPmluZGV4IDIxZDYwZTg5MTI2Zi4u
NTJlM2IzNzI1OWE2IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1kcC5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMK
PkBAIC0yMDkwLDYgKzIwOTAsMTAgQEAgc3RydWN0IGR3X2RwICpkd19kcF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2LCBjb25zdCBzdHJ1Y3QgZHdfZHBfcGxhdF8KPiAJCXJldHVy
biBFUlJfQ0FTVChkcC0+aGRjcF9jbGspOwo+IAl9Cj4gCj4rCS8qCj4rCSAqIFRoaXMgcmVzZXQg
bGluZSBpcyBkZWFzc2VydGVkIGJ5IGRlZmF1bHQ7IGFzc2VydGluZyBpdCBoYW5ncyB0aGUgU29D
IGlmIHRoZQo+KwkgKiByZWxhdGVkIHBvd2VyLWRvbWFpbiBpcyBzdGlsbCBhY3RpdmUuCj4rCSAq
Lwo+IAlkcC0+cnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXQoZGV2LCBOVUxMKTsKPiAJaWYg
KElTX0VSUihkcC0+cnN0YykpIHsKPiAJCWRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGRwLT5y
c3RjKSwgImZhaWxlZCB0byBnZXQgcmVzZXQgY29udHJvbFxuIik7Cj4KPi0tIAo+Mi41My4wCg==

