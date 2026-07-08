Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C85384CFD;
	Wed,  8 Jul 2026 21:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547051; cv=none; b=ZHGaP0RTxCnPZ0xxibppRXTW9WP3Uz0L4Khoe+tb418mmZWo7UUga5/sKh8ZyHUt1U8hHtM1BIBPTNo6s4MwFk61RwG/6P3+qGZnQxXgg6GQDTmctKxebQ03yeWs05gdC/Qm2NxqXM9bV+hfHr94nK4xtNm4qbZf9Wuif2xGm5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547051; c=relaxed/simple;
	bh=mvQFTHwpCfBUhnN28LwNP7Ch7nr4sPwas8Yqw8B5M0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CAGjTM8RRI85pcZp0NCl1L1LaYSODAqBehw5Ym9lxzasmp1XZnBKg5irhypgp61nKxQbdAL41XZLdfQcG2RDvAVBg4rdtO0yK1yAwrMXtsVFpci7qV1liLdMwJhDTCkmD2Fq9pALZQpeVzwK63cbv2hD9K3YDnMuzZKIYgSnuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=none smtp.mailfrom=mail.savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=UPM0sv8Q; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail.savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="UPM0sv8Q"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AE40E3D818D6;
	Wed,  8 Jul 2026 17:35:02 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id edraddou1TWK; Wed,  8 Jul 2026 17:35:01 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B66F03D818FE;
	Wed,  8 Jul 2026 17:35:01 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com B66F03D818FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1783546501; bh=bFPWZ59KzKMypwfMm9SaZ2VgVwbV2rIifq4nTNbGd6w=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=UPM0sv8QYXQ4HGy9jch9+l76hWLpVvCWdIF2NqUQX16+9myz/Oz9jX1in1Ln2tl4t
	 L0l0gRNhcfcOZie076Chr9gbccmQb6il4mBFBQD0UIZyfRyd+E+L/+HRcqOX43lSZe
	 MeifVD9sqHunK1YxEjD1ouQ2AlYswaN32iEYRE9RxMLIz/DIkVm3+rvVeoksGwHRMJ
	 YxVnxwKPC5TpXzdIQqAVu8lSsgwpWWUDBPhUwkbr4KAj4S+bK0E9tBuuhtZUWnm0hR
	 UaCqYR1l+UDxdH9mdroWhjuTgc1sF1PsBRnTzxlAcBp3NLfrk9rS4Qyq792qcV/jRi
	 D1eCjGLq5pq1w==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id SMzVmM1DrSuv; Wed,  8 Jul 2026 17:35:01 -0400 (EDT)
Received: from localhost (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 73F803D8171F;
	Wed,  8 Jul 2026 17:35:01 -0400 (EDT)
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
Subject: [PATCH 2/5] drm: panel: jd9365da: Add prepare_prev_first flag to drm_panel
Date: Wed,  8 Jul 2026 17:34:57 -0400
Message-Id: <20260708213500.1867092-3-marc-olivier.champagne@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708213500.1867092-1-marc-olivier.champagne@savoirfairelinux.com>
References: <20260708213500.1867092-1-marc-olivier.champagne@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The DSI host must be enabled for the panel to be initialized in
prepare(). Set the prepare_prev_first flag to guarantee this.
This fixes the panel operation on Renesas RZ/G2LC SoC DSI host.

Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfaire=
linux.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/g=
pu/drm/panel/panel-jadard-jd9365da-h3.c
index 1ef0c937863a..a79dc8f8d5af 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -2993,6 +2993,8 @@ static int jadard_dsi_probe(struct mipi_dsi_device =
*dsi)
 		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vccio),
 				"failed to get vccio regulator\n");
=20
+	jadard->panel.prepare_prev_first =3D true;
+
 	ret =3D of_drm_get_panel_orientation(dev->of_node, &jadard->orientation=
);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get orientation\n");
--=20
2.34.1

