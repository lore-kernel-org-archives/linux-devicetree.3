Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4426F2F2;
	Mon, 23 Mar 2026 04:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774241191; cv=none; b=nTjvJTzE7yijQc05zkZCtwUi/bbwNXx7Q1NyU9TKPAs5Sa0Uxi7D/Afdn3iP8OWMWqKkeEi1AzfKcueI4+czXYXhWavYF2Su45EQOkxPDIz7pmKC5XAtZJU3SkkUCpyyDM7bA5E5g3bnavZoYjxq+wpsxr7Sd9T/IVgMJy0xI+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774241191; c=relaxed/simple;
	bh=OKVwvexU9SbR55MM+0mJMB0nc5iLhT3H9VVd3exUhQU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BuJn4OpjqQUvOGPpr7k7jNm6BC51Lw1qlE6hQG9BPnzzlfzbe47jjRyWxozXOnzQjSRPO9foFFb0GvkJxI+zkCN/oLaoGJxPzn+V8STcs04T0ka5mSgNorRwAn3zgzrEuv96lfkcxOe7hdnBiehix4b+vHdYabKMGcDCRy0y4KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=B5E/aJD9; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="B5E/aJD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OKVwvexU9SbR55MM+0mJMB0nc5iLhT3H9VVd3exUhQU=;
  b=B5E/aJD93pjV8vtsnigkANLIiF4e2Yy17ZoD6vA8wrlSlvBj5efDZ3qM
   v8vdbMb5kpqVQ6datBHsjHm8t06w2B9REnHFb2H16TXIfB26H6ZpiAfNN
   p2fYDrPbSkDi83FHG2yu/k25V7gAam5y6Txi05MSQilwClGbm/ZJwr4o+
   3r9+Ez+UwynH8FVdVb/py2yZ32l2D2hhFXvsSC/pSM04+ynDpl3iu5LAL
   zZRPs9jnVijGc07W5GtRtUjmXeTLdJ2ijyVZ60E8mGRm/7tXUzgYKm9wQ
   kXkgNW+PQLs4bLjVh3fCGfNP8RQJSU5ahUuuUbWxiaGZB/N32nH7G7ZqY
   A==;
X-CSE-ConnectionGUID: nB3M4yN4RLmAUOGcMkp5zw==
X-CSE-MsgGUID: foAuN8TRRoWmE2/vgC9JKQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 23 Mar 2026 12:40:29 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw [192.168.65.58])
	by mse.ite.com.tw with ESMTP id 62N4kGxN024570;
	Mon, 23 Mar 2026 12:46:16 +0800 (+08)
	(envelope-from Hermes.Wu@ite.com.tw)
Received: from CSBMAIL1.internal.ite.com.tw (192.168.65.58) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 12:46:14 +0800
Received: from CSBMAIL1.internal.ite.com.tw ([fe80::d8ab:6241:9e8f:18bf]) by
 CSBMAIL1.internal.ite.com.tw ([fe80::d8ab:6241:9e8f:18bf%16]) with mapi id
 15.02.2562.037; Mon, 23 Mar 2026 12:46:14 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@oss.qualcomm.com>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
        <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <Pet.Weng@ite.com.tw>,
        <Kenneth.Hung@ite.com.tw>, <dri-devel@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/2] drm/bridge: Add ITE IT6162 MIPI DSI to HDMI bridge
 driver
Thread-Topic: [PATCH v4 2/2] drm/bridge: Add ITE IT6162 MIPI DSI to HDMI
 bridge driver
Thread-Index: AQHcuneKy57cBKFSlkOX7a+1wbKKi7W7ivSg
Date: Mon, 23 Mar 2026 04:46:14 +0000
Message-ID: <482dc98deded4d26a8084228836c891f@ite.com.tw>
References: <20260319-upstream-6162-v4-0-7268483ef03d@ite.com.tw>
 <20260319-upstream-6162-v4-2-7268483ef03d@ite.com.tw>
 <hylxawutrdmwxem52lyhhprkdm4oc6bnj2w6z5p2e2czvwmhgq@apcxe3lg6kgd>
In-Reply-To: <hylxawutrdmwxem52lyhhprkdm4oc6bnj2w6z5p2e2czvwmhgq@apcxe3lg6kgd>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: 3C89DE082D516FEEA55C891635D75017EF9B24E7088310CB5E32D5640DFC06662002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 62N4kGxN024570

SGkNCg0KPk9uIFRodSwgTWFyIDE5LCAyMDI2IGF0IDAyOjM3OjEyUE0gKzA4MDAsIEhlcm1lcyBX
dSB2aWEgQjQgUmVsYXkgd3JvdGU6DQo+PiBGcm9tOiBIZXJtZXMgV3UgPEhlcm1lcy53dUBpdGUu
Y29tLnR3Pg0KPj4gDQo+PiBBZGQgc3VwcG9ydCBmb3IgdGhlIElURSBJVDYxNjIgTUlQSSBEU0kg
dG8gSERNSSAyLjAgYnJpZGdlIGNoaXAuDQo+PiBUaGUgSVQ2MTYyIGlzIGFuIEkyQy1jb250cm9s
bGVkIGJyaWRnZSB0aGF0IHN1cHBvcnRzIHRoZSBmb2xsb3dpbmcNCj4+IGNvbmZpZ3VyYXRpb25z
Og0KPj4gDQo+PiAgIC0gU2luZ2xlIE1JUEkgRFNJIGlucHV0OiB1cCB0byA0SyBAIDMwSHoNCj4+
ICAgLSBEdWFsIE1JUEkgRFNJIGlucHV0IChjb21iaW5lZCk6IHVwIHRvIDRLIEAgNjBIeg0KPj4g
DQo+PiBUaGUgZHJpdmVyIGltcGxlbWVudHMgdGhlIERSTSBicmlkZ2UgYW5kIGNvbm5lY3RvciBm
cmFtZXdvcmtzLCANCj4+IGluY2x1ZGluZyBtb2RlIHNldHRpbmcsIEVESUQgcmV0cmlldmFsLCBh
bmQgSFBEIHN1cHBvcnQuDQo+PiANCj4+IEFsc28gYWRkIGEgTUFJTlRBSU5FUlMgZW50cnkgZm9y
IHRoZSBuZXdseSBpbnRyb2R1Y2VkIElURSBJVDYxNjIgTUlQSSANCj4+IERTSSB0byBIRE1JIGJy
aWRnZSBkcml2ZXIsIGNvdmVyaW5nIHRoZSBkcml2ZXIgc291cmNlIGZpbGUgYW5kIHRoZSANCj4+
IGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnQuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEhl
cm1lcyBXdSA8SGVybWVzLnd1QGl0ZS5jb20udHc+DQo+PiAtLS0NCj4+IENoYW5nZXMgaW4gdjQN
Cj4+ICAgKiBEcm9wIHN0cnVjIGl0NjE2Ml9hdWRpbw0KPj4gICAqIEFkZCBIRENQX0FVVE8gaW4g
ZW51bSBoZGNwX3Zlcnt9LCBGVyBlbmFibGUgSERDUCBieSBzaW5rIGNhcGFiaWxpdHkuDQo+PiAg
ICogQ2FsbCBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfaGRtaV9jbGVhcl9hdWRpb19pbmZv
ZnJhbWUoKQ0KPj4gICAgIGluIGl0NjE2Ml9icmlkZ2VfaGRtaV9hdWRpb19zaHV0ZG93bigpDQo+
PiAgICogRHJvcCAgaXQ2MTYyX2JyaWRnZV9oZG1pX2F1ZGlvX3N0YXJ0dXAoKQ0KPj4gICAqIEFk
ZCBoZG1pX2NsZWFyX2hkbWlfaW5mb2ZyYW1lIGFuZCBoZG1pX3dyaXRlX2hkbWlfaW5mb2ZyYW1l
DQo+PiAgICogRHJvcCBpdDYxNjJfcGFyc2VfZHQoKSBkdWUgdG8gIml0ZSxzdXBwb3J0LWhkY3Ai
IGlzIHJlbW92ZWQgZnJvbSBEVC4NCj4+ICAgKiBBZGQgRFJNX0JSSURHRV9PUF9IRE1JIHRvIGl0
NjE2Mi0+YnJpZGdlLm9wcw0KPj4gDQo+DQo+UmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5c2hrb3Yg
PGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4NCj4NClRoYW5rIHlvdSBmb3IgcmV2
aWV3aW5nDQoNCj4tLQ0KPldpdGggYmVzdCB3aXNoZXMNCj5EbWl0cnkNCj4NCg==
