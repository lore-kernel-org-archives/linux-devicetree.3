Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F89C4369A;
	Sun, 16 Aug 2026 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786884654; cv=none; b=NadQQozLoBxNL0VdPdmRrDGANn4JyMgDPxkOhWZMz823Ddi6IZHhS55CPKOP1Iw4XWN/fFq7sBXPiEEXCmHqoY9W4eCsK8EJg1x6pwlPcFOmIKez3HiyBrkdsg8G1fS+vvGxCgKu5FVseTRsCTi1+pGOtAVeGCqZec+BpLSc9io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786884654; c=relaxed/simple;
	bh=vLOs8/Cq1hY4p3GUBLBBD+0bp3Z46zJBwR56Gx9TMjs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ckSAy+/3spwO/xg2VPsmjkapOvitt4Oxym5uUD65U/ikW43pdSS5Y3XgUhgApnpIqMdUSTpTsX/3eXBHrTJaIkxpD6jmWLAMUdxI4T4ljEXijYMsKioOHZBy1nx/iPD2XRjDjM5xffx1beXhCj5jjT9wg6nZfQhEibnG9GD+E4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jBMk5qmf; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jBMk5qmf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=vLOs8/Cq1hY4p3GUBLBBD+0bp3Z46zJBwR56Gx9TMjs=; b=j
	BMk5qmfKwRIXscCZbmHieCZOk6SXtO+r/9McydOhsctfTSANtbPUBq77zGaSZmid
	eUiAxNv1DxN2jHphc0FPSu+WqIIaU7YVbGN7mpPGDYXjEbwo0QGCYsqgrb9bUIYj
	6SCql/6pvtTlcIHwBpI/h+o4ozX59uh2WwjtIOdPXo=
Received: from andyshrk$163.com ( [61.154.14.86] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Sun, 16 Aug 2026 20:49:01 +0800
 (CST)
Date: Sun, 16 Aug 2026 20:49:01 +0800 (CST)
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
	"Philipp Zabel" <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	"Dmitry Baryshkov" <lumag@kernel.org>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	"Alexey Charkov" <alchark@flipper.net>,
	linux-rockchip@lists.infradead.org,
	"Damon Ding" <damon.ding@rock-chips.com>,
	Sashiko <sashiko-bot@kernel.org>, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re:[PATCH v11 05/21] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-5-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-5-0d508505f383@collabora.com>
X-NTES-SC: AL_Qu2TBPSTu00v5yWRZOkfmUgWjuw/WsG1v/Ul1YBSP556jCrp6yoHelRJMXX9zsmrEg+xlzSHfCNT0M9dRK11eZMXpuotpAjslLbAL7XqfVDlCw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4b076889.1900.1a00a9e4c9f.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgD310G9sYFqmMcyAA--.24943W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7R2W9GqBsb16fwAA3w
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhlbGxvIFNlYmFzdGlhbiwKCkF0IDIwMjYtMDgtMDcgMDE6MDI6MTEsICJTZWJhc3RpYW4gUmVp
Y2hlbCIgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+VGhlIGRyaXZl
ciBpcyBjdXJyZW50bHkgbWlzc2luZyB0byBmdWxseSBjbGVhbiB1cCBhZnRlciBpdHNlbGYuIEVu
c3VyZQo+dGhhdCB0aGUgbXV0ZXggaXMgY2xlYW5lZCB1cC4KPgo+Rml4ZXM6IDg2ZWVjYzNhOWMy
ZSAoImRybS9icmlkZ2U6IHN5bm9wc3lzOiBBZGQgRFcgRFBUWCBDb250cm9sbGVyIHN1cHBvcnQg
bGlicmFyeSIpCj5SZXBvcnRlZC1ieTogU2FzaGlrbyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4K
PlNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xs
YWJvcmEuY29tPgoKICAgUmV2aWV3ZWQtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBz
LmNvbT4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctZHAuYyB8IDUg
KysrKy0KPiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMKPmluZGV4IDUyZTNiMzcyNTlh
Ni4uYjE4NTY0MThmNDQxIDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1kcC5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRw
LmMKPkBAIC0yMDQwLDEwICsyMDQwLDEzIEBAIHN0cnVjdCBkd19kcCAqZHdfZHBfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgY29uc3Qgc3RydWN0IGR3X2RwX3BsYXRfCj4gCWRw
LT5waXhlbF9tb2RlID0gcGxhdF9kYXRhLT5waXhlbF9tb2RlOwo+IAlkcC0+cGxhdF9kYXRhLm1h
eF9saW5rX3JhdGUgPSBwbGF0X2RhdGEtPm1heF9saW5rX3JhdGU7Cj4gCj4tCW11dGV4X2luaXQo
JmRwLT5pcnFfbG9jayk7Cj4gCUlOSVRfV09SSygmZHAtPmhwZF93b3JrLCBkd19kcF9ocGRfd29y
ayk7Cj4gCWluaXRfY29tcGxldGlvbigmZHAtPmNvbXBsZXRlKTsKPiAKPisJcmV0ID0gZGV2bV9t
dXRleF9pbml0KGRldiwgJmRwLT5pcnFfbG9jayk7Cj4rCWlmIChyZXQpCj4rCQlyZXR1cm4gRVJS
X1BUUihyZXQpOwo+Kwo+IAlyZXMgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRl
diwgMCk7Cj4gCWlmIChJU19FUlIocmVzKSkKPiAJCXJldHVybiBFUlJfQ0FTVChyZXMpOwo+Cj4t
LSAKPjIuNTMuMAo+Cj4KPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj5MaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxpc3QKPkxpbnV4LXJvY2tjaGlwQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcm9ja2NoaXAK
