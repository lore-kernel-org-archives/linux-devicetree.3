Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601992;
	b=aNJ1EBigpOJ8qNDv8KYJVuz8GARt47QA+Tpx+wp46qMHNFpfYbq6tCUAqGp1YaTnSB6J
	 WYxtJ025J9VYTdWu53kfKNFGt0z5MUNX2zWvl3Fy+JDj10qAoq2qMnYH39Zqia38TVvPt
	 X2GlRPNj6gg6i0JEzGEVoMKQnb2qJfULE1bAQ+zn/Z0OTf6LOmFzystO7NjILiETYhqxb
	 TK+5VbCZCmsm6cqCr/w5stIGoy+z0q9sqSlH1Q9GcjanOpDmugNcuFCsgARXWlajfeZLD
	 rz4LvMpKFrO59w/af2VKsXTpQ/mCMuOQwQpHjfEAo3XeQkK4+2Sa/mdTlXZS5H4vIXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601992;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=WNVlmcLpW9LBKmKONZI8XKOdkMMf6hESclYPJfDWndA=;
	b=wdB5vIeN15jJLa9NFDjy1WbDRIZ8aFvlWvPZsMAIj4oEiPoQ4BdU57v/wCwIRBL2UbzN
	 CmUmTusAhguXEs83wpVip2usDypsXuWOLeRl8FoORdGLyN0pQR3WKhBy2NxSccUdQ/dz6
	 vbV9UGuON7ncsXrZf1093r8zhB7aGtZs+r6OhYlzRqn2NdxvcQ/sMWleVfOlAbdEEFf+A
	 nZm5k78WI79ilwrxCsYp6pDE6+LZYOn6hG1ApddDM4I43g5jpyVTRZwOT+6KmIRnJEU+5
	 z1gAOsgeBhggzubFz1dgb7Ln0Nqiys/jluAqo/Ar8QrOx0KIt+ifCUVON3k9U3d2DHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=kBET+WbB;
	arc=none smtp.remote-ip=185.136.64.228
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20073606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20073606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=kBET+WbB
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261125101946752b8b0bd100020735
        for <devicetree@vger.kernel.org>;
        Wed, 25 Nov 2026 11:19:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WNVlmcLpW9LBKmKONZI8XKOdkMMf6hESclYPJfDWndA=;
 b=kBET+WbBj/wjUuVW1NJxbvJpmn2ugOxfOL+mLhsgusuXxZF83txndMyAG8nnxR12QMHI6E
 9Ax4XAQgLMEIFPFEdELtEVJXKVr4YTkfHnH9axYCibIvDyXgD8dS1Eqxkgirm6sHbBY7HUiG
 An6zW5lDlJ1EnXGfjY4H9pLnBPjNmEoMTF3RmUgPIpN8xPWx4BbMiJ+58XNIKHig5OV01DaW
 YUcRgFK5SYO9oues6AquXVwTb6051Ui9yQ8xGkhbrlURfXemZqrbQ7DImIuvw5h9aqhL6AHS
 t75jfhwcsqwLIcEQIPzRdd6zlUWpwvHvHDinAMvANojl8mkYGPdBwP/Q==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	thierry.reding@gmail.com,
	sam@ravnborg.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Andrej Valek <andrej.v@skyrain.eu>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 0/3] drm/panel: simple: Add Techshine TS-P0700031A panel
Date: Wed, 25 Nov 2026 11:19:33 +0100
Message-ID: <20261125101936.103094-1-alessandro.zini@siemens.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer

Add Techshine TS-P0700031A panel support into panel-simple driver along
with the required DT bindings documentation, including the vendor prefix.

Alessandro Zini (2):
  dt-bindings: vendor-prefixes: Add Techshine
  dt-bindings: display: simple: Add Techshine TS-P0700031A panel

Andrej Valek (1):
  drm/panel: simple: Add support for Techshine TS-P0700031A panel

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 32 +++++++++++++++++++
 3 files changed, 36 insertions(+)


base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
-- 
2.56.1

