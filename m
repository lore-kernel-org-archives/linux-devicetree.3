Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E376A4334DC;
	Wed, 22 Jul 2026 17:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741932; cv=none; b=PrIaak0bTUY1XJVBew+UW4RAkXoxpRd6zEcPK805o8gXHD+HtX8VGjZJ8EiODqpSY1oPquHZEBl7EAHpvA48LHCBd8Hpd/AqbBzagp9C5qIhaTH64yiBMt1YJ8jcz/2g3SwPhLcFfOoHCx9O1uEbeniwK608MSvovrQ+BQSmEtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741932; c=relaxed/simple;
	bh=q9HXqN0JpL4YZM70aUYER8izGdESLRBoG+RYd2FUznc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dFca55jFsdo89LoFKzq8ab+EJBYmzioadFuS+D2tZRjfsrVfP/il+/YqCZpxyG22Vmvr3oo7giSt4X6c9ltdNJSKIx7mgBeFWikM2f/KERA3sDaqxJ8crrZKWp0CVS3eOmQUo4Ai1krbg9DY39OrpkaPWhjFbZSQPFTE40X379A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=none smtp.mailfrom=mail.savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=NRS4BSUD; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail.savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="NRS4BSUD"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8F0F63D818A3;
	Wed, 22 Jul 2026 13:38:42 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id MGPVD3nrnX99; Wed, 22 Jul 2026 13:38:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AEAB23D8189E;
	Wed, 22 Jul 2026 13:38:41 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com AEAB23D8189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1784741921; bh=XqHQgw8S/UPg8nF2N5CTIGdEG9npmTfm0JPboSFY1ZU=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=NRS4BSUDpatfHTIWqazFjWlIE138Lleb63ifwOVxWwDnVsJ7ndxzoZgCEeglQ3OD2
	 dLyH9YL+PBfTMGuvH1NPBjBhTvJDnm930ld3AQNseybklMID27Droviu41dM1fiNQ7
	 PBdAlJSKprZQ1dhZ57YnITxhhe90igkpZy3fjCNRaWnC4Qooetv5CBSlBP7Ehq+kwY
	 h1hZMZ2WI8RKJtX3TPZcGYKXI0j2y4wsmxryRpfRJqSYzaTUmngIYEK0PVghO9cZey
	 2zWcpWNgStXMx1A8v4pPjnn8aJZiWjd3xsgy7Xp0SL4dgeZpCMy0dh2KfQckgBIk8O
	 0HXUtpbwAdQKw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 4VXvas9cUifk; Wed, 22 Jul 2026 13:38:41 -0400 (EDT)
Received: from localhost (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 6E2F43D8166A;
	Wed, 22 Jul 2026 13:38:41 -0400 (EDT)
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
Subject: [PATCH v2 3/4] dt-bindings: display: panel: add compatible for DCLTek 300250 9.35in panel
Date: Wed, 22 Jul 2026 13:38:39 -0400
Message-Id: <20260722173840.3576444-4-marc-olivier.champagne@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722173840.3576444-1-marc-olivier.champagne@savoirfairelinux.com>
References: <20260722173840.3576444-1-marc-olivier.champagne@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The DCLTek dt300250 is a panel using the jadard-jd9365da controller.
Add a new compatible for it.

Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfaire=
linux.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd936=
5da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd93=
65da-h3.yaml
index 4eae802de9fd..9e20e2faf82f 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.=
yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.=
yaml
@@ -19,6 +19,7 @@ properties:
           - anbernic,rg-ds-display-bottom
           - anbernic,rg-ds-display-top
           - chongzhou,cz101b4001
+          - dcltek,dt300250
           - kingdisplay,kd101ne3-40ti
           - melfas,lmfbx101117480
           - radxa,display-10hd-ad001
--=20
2.34.1

