Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB93E43CE44;
	Wed, 22 Jul 2026 17:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741929; cv=none; b=HB9xOtAgBGbM4s8SDktvif3AvHn2SzqyzrPpyGwCRVBQvmFh2fKOvAec1EBfYnQGwkSQ23q9wyKnFxTTNtB6PAuPZCtkNQOKLOO1xybHa2/iN/NcnTUNTzqSzYCY7vXc2a5dkPL38T7aOjaa9DnUm5P+qrVEzwWd3cy4s+9XnCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741929; c=relaxed/simple;
	bh=Rlv3OHZkyd/viDhQ04qfcHddOgTvRAu9sUhPbh+NYM8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eN3IGLb7P0ZLAlboRd1RrShbclbgZ0LXkwwIkyuilrWgb7jYwCXwZfusRfrb5GCch0HxZAq3IDkBBpfOwoLpepwGksT9uhm2WG56wNB8Wf4PMQXj1pahPcpfck0/NyOq5rVNWy7sLNTZqWXOaDAzuRrj97SCLIsxToKsdGsQmUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=none smtp.mailfrom=mail.savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=XMQ7XbFq; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail.savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="XMQ7XbFq"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 428263D81895;
	Wed, 22 Jul 2026 13:38:42 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id BUbpF93MvrZy; Wed, 22 Jul 2026 13:38:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 31AF13D81899;
	Wed, 22 Jul 2026 13:38:41 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 31AF13D81899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1784741921; bh=QOxzoDUBGKKl7Kk+ZyHuwdE+sH897v7w+LJGpJ1sJPs=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=XMQ7XbFqQCFFG2YgRldmq4xejtYC5MkBNV0ib6DWgHeCVP7KGvU5dpsS8zSc5WfVw
	 QUAv/bk0aW8UWC2DVC057S2+NvFnk3a/VJhM/mZN27G8EH6YArxdGXMV+AckuVjfAs
	 lgGUb4aFlMA6btEgixHqzJoyhw1ecIk4mgk8BUkYTvaY9+iBGF77kyGP6CBNTunY3K
	 sPr7VEL1pg1xP6RPZZj/mZqqFMfs3Dlk1Qzn3sn9HR0dJ1hgY1gFa0YgVMjFojmJqO
	 insVBLS75aCafKar3Oxmyruk0VR8N5xCsYvWNmcQF25OSSI8O0m1Qg6/3rDgOQVk80
	 9yh0VB9r6EJEg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id V8ghoQSc7LIO; Wed, 22 Jul 2026 13:38:40 -0400 (EDT)
Received: from localhost (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B517F3D8166A;
	Wed, 22 Jul 2026 13:38:40 -0400 (EDT)
From: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
To: Jagan Teki <jagan@edgeble.ai>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
Subject: [PATCH v2 0/4] drm/panel: jd9365da: add support for DCLTek DT300250
Date: Wed, 22 Jul 2026 13:38:36 -0400
Message-Id: <20260722173840.3576444-1-marc-olivier.champagne@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series adds support for the DCLTek DT300250 9.35-inch MIPI DSI
panel based on the Jadard JD9365DA-H3 controller.

The series includes a prerequisite needed by this panel support:
enable LPM mode for the jd9365da path.
It then adds the dcltek vendor prefix, documents
the new compatible string in the binding, and finally adds the panel
descriptor and initialization sequence to the driver.

---

Changes in v2:
 - drop the old patch 2; already present in drm-misc-next as
   b55a4b5d4769a650f52ea3f1ae680610169d125e
   ("drm/panel: jadard-jd9365da-h3: set prepare_prev_first")
 - rebase the series onto drm-misc-next so it applies cleanly
 - renumber the remaining patches

Marc-Olivier Champagne (4):
  drm: panel: jd9365da: Enable LPM mode
  dt-bindings: vendor-prefixes: Add DCLTEK
  dt-bindings: display: panel: add compatible for DCLTek 300250 9.35in
    panel
  drm: panel: jd9365da: Add DCLTek 300250 9.35in display

 .../display/panel/jadard,jd9365da-h3.yaml     |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 249 +++++++++++++++++-
 3 files changed, 251 insertions(+), 1 deletion(-)


base-commit: 9c99e09777509d9bd8cabb0c1132c981b4e668e2
--=20
2.34.1

