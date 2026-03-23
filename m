Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64956F2F2;
	Mon, 23 Mar 2026 04:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774241386; cv=none; b=gnq0SE1Tz7BxmDpnGGpqH+NbaY24Y0VWRNdlEgBuWhT8WFM1Y8UjvclbABwouG95LFwUdw6fD/PIUYuT80gjwGeKzDbj2oyOSGf/YKTHpoP3aNCP8OIME4SZB14KMO+0aIV3b51B2jwbXmezDxUi0UGU7Ug3gM33uMPMdRrlxfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774241386; c=relaxed/simple;
	bh=mp+LjzpMuZG850lrYXU8iwy1SSLp2XvPgwtRt5xiQJY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kFfsF6kLCogXrTIyOD0RnZROkJc9gcbKE/sGxLcfle26fsAnRP4Xoen/1zHeTvBMNBiRVal8orqOSi2v7aVk6Kjdrfh7pqT9XbHUh/cFZf5KdQRwT0DfGXy5PczIN6Z3R+PqaE0nRlb5X/+MbTcW26n7xLwZ4LU1OXTQ0eItPfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=ru3PCh0T; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="ru3PCh0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mp+LjzpMuZG850lrYXU8iwy1SSLp2XvPgwtRt5xiQJY=;
  b=ru3PCh0TM2OO9QfHgu+udY78VhedFXOLW1VvKHNtAg2dCWDUj/5k0L8c
   WLNJCcOk8mFtGYFn63gyV5kHzC03VGvT47IJjw3nLMO74Bbq3XpHLMMdr
   9OQniHfzrsF/ZLi+DBesqEptgKGczpLgCkq7jlO1m+3A+aqr4B3HIuMJ5
   MTUsIyxq8DC+Cw3GoNbfonJPWb140Wmvjgk/0xIO1jWgJkkKR6XK5RKTX
   YDD7hic8Blg+rh5HKq5UnEweRMK+jnqv9chfi4YWNiN769hlOT2HYGPC3
   PV7f8P/iJhyLmxngrfga9D8uJWRzHqlVSMXqHwezycvyTNFj+uaPbM5Rk
   w==;
X-CSE-ConnectionGUID: kb46sQxkQ5+xxebp8RhGxw==
X-CSE-MsgGUID: Wzjc6qxTS0uIwYWA5nG/lA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 23 Mar 2026 12:43:52 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw [192.168.65.58])
	by mse.ite.com.tw with ESMTP id 62N4neax025559;
	Mon, 23 Mar 2026 12:49:40 +0800 (+08)
	(envelope-from Hermes.Wu@ite.com.tw)
Received: from CSBMAIL1.internal.ite.com.tw (192.168.65.58) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 12:49:38 +0800
Received: from CSBMAIL1.internal.ite.com.tw ([fe80::d8ab:6241:9e8f:18bf]) by
 CSBMAIL1.internal.ite.com.tw ([fe80::d8ab:6241:9e8f:18bf%16]) with mapi id
 15.02.2562.037; Mon, 23 Mar 2026 12:49:38 +0800
From: <Hermes.Wu@ite.com.tw>
To: <krzk@kernel.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
        <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <Pet.Weng@ite.com.tw>,
        <Kenneth.Hung@ite.com.tw>, <dri-devel@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/2] dt-bindings: display: bridge: Add ITE IT6162 MIPI
 DSI to HDMI bridge
Thread-Topic: [PATCH v4 1/2] dt-bindings: display: bridge: Add ITE IT6162 MIPI
 DSI to HDMI bridge
Thread-Index: AQHct35ADNu8wpErNEW03Aq6VbBCCLW7kYNQ
Date: Mon, 23 Mar 2026 04:49:38 +0000
Message-ID: <fc373843fd524c2ab567dcf09110c33b@ite.com.tw>
References: <20260319-upstream-6162-v4-0-7268483ef03d@ite.com.tw>
 <20260319-upstream-6162-v4-1-7268483ef03d@ite.com.tw>
 <20260319-conscious-grumpy-wren-2b05ee@quoll>
In-Reply-To: <20260319-conscious-grumpy-wren-2b05ee@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: BAC67AFC2EA0CFD98A1126B6AAF5DEFF21CB5DA1B631A9E178D9814D8C1C98412002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 62N4neax025559

SGkNCg0KPk9uIFRodSwgTWFyIDE5LCAyMDI2IGF0IDAyOjM3OjExUE0gKzA4MDAsIEhlcm1lcyBX
dSB3cm90ZToNCj4+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIHRo
ZSBJVEUgSVQ2MTYyIE1JUEkgRFNJIHRvIA0KPj4gSERNSSAyLjAgYnJpZGdlIGNoaXAuIFRoZSBJ
VDYxNjIgaXMgYW4gSTJDLWNvbnRyb2xsZWQgYnJpZGdlIHRoYXQgDQo+PiBzdXBwb3J0cyB0aGUg
Zm9sbG93aW5nIGNvbmZpZ3VyYXRpb25zOg0KPj4gDQo+PiAgIC0gU2luZ2xlIE1JUEkgRFNJIGlu
cHV0OiB1cCB0byA0SyBAIDMwSHoNCj4+ICAgLSBEdWFsIE1JUEkgRFNJIGlucHV0IChjb21iaW5l
ZCk6IHVwIHRvIDRLIEAgNjBIeg0KPj4gDQo+PiBUaGUgY2hpcCBhbHNvIHN1cHBvcnRzIHVwIHRv
IDgtY2hhbm5lbCBhdWRpbyBvdXRwdXQgdmlhIDQgSTJTIGRhdGEgDQo+PiBjaGFubmVscy4NCj4+
IA0KPj4gU2lnbmVkLW9mZi1ieTogSGVybWVzIFd1IDxIZXJtZXMud3VAaXRlLmNvbS50dz4NCj4+
IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2NDoNCj4+ICAgLSBEcm9wIGl0ZSxzdXBwb3J0LWhkY3ANCj4+
ICAgLSBEcm9wIGVuZHBvaW50IHByb3BlcnRpZXMgYWxyZWFkeSBpbiB2aWRlby1pbnRlcmZhY2Vz
LnlhbWwNCj4+ICAgLSBGaXggZGF0YS1sYW5lcyBpbiBleGFtcGxlIHdpdGggPDAgMSAyIDM+DQo+
PiAgIC0gQWRkIGJsYW5raW5nIGxpbmUgaW4gZXhhbXBsZSBiZWZvcmUgZW5kcG9pbnQgc3Vibm9k
ZSBzdGFydHMNCj4+ICAgLSBBZGQgcmVzZXQtZ3BpbyBhbmQgcG93ZXIgY29udHJvbHMgdG8gcmVx
dWlyZWQNCj4NCj5SZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtv
emxvd3NraUBvc3MucXVhbGNvbW0uY29tPg0KPg0KDQpUaGFuayB5b3UgZm9yIHJldmlld2luZw0K
DQo+QmVzdCByZWdhcmRzLA0KPktyenlzenRvZg0KPg0KPg0KDQpCUiwNCkhlcm1lcw0KDQo=
