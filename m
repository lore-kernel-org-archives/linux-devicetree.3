Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E2933ADB1;
	Thu, 14 May 2026 17:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779495; cv=none; b=mW0T3DGVyLLLt3HaPXNpwDVwltV9RK8Bu6WLJGpR2bgkj/iEWUHfjCFcg30i6JYk9+amqyHqKp5hrpBlt/UOj41dNuEvbDbk0bw29V4pDeiZUdHBAIXIhHKV7RlzMMSULnNJ4pztkxNebVpxEOp1piXZyZ3htsg355onAC/WBWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779495; c=relaxed/simple;
	bh=3PC5Cuco5w85pnBqFY1Ju+w2SKqZmWd6DZncQX5MeUw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CegUneJM+t4arG0P8TQQMiGtzVmTEBO7Tel87krRhv6uxxaGSxiVkANzlfz9ZncDONcdzGvLEBtc4oF3lED/LA9+Egkgfm3RDS9yJhXFszFhR7BEsmEyX4V/26F3z3F0wNe/FTQmXpS9LC1FPmnSK/f4kJfdVW7/WSLqYYnaFuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twYHJtLa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twYHJtLa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 481E5C2BCB3;
	Thu, 14 May 2026 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778779495;
	bh=3PC5Cuco5w85pnBqFY1Ju+w2SKqZmWd6DZncQX5MeUw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=twYHJtLa4DjDkJfyZgd6J1tOScBxAuOWGMoU1lAd905StY/xqk+MdayGhs+iISNgX
	 G1RCn30OjZwGEVJbkQjPTOOycO1HtO6xvsN31JzrigzvsllVJ0ZT1jvQhUMjB1Xmn2
	 BMCEs8hqNUQdvnC03OzF38pSBhbs0A8B67kL7VkpRsCNEglZ8rl03nlop+nJHc2v8B
	 PxAQuFnuVKWc+LYo6eED+Ekok/OyhqdUJsTawjtAxsCWdY40EdRSFwaVUN5v2pycrg
	 OJ+F6gf75781fMFoLuQJkSPxA4zvL3olC2zCZggaZ7evurmagDZYEC8CnAD5cmmTpG
	 tdz8U/uhIsTpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BC3CD4F39;
	Thu, 14 May 2026 17:24:55 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] drm/panel: Add panel driver for Chipone ICNA35XX
 based panels
Date: Thu, 14 May 2026 12:24:48 -0500
Message-Id: <20260514-icna35xx-v2-0-45acd1dfa566@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02PwW7DIBBEf8XiXKpdiDH2qf9R5bDAkiDVdgOu5
 Sjyv4c6h/Y4q52ZNw9ROCcuYmgeIvOaSpqnKtRbI/yVpgvLFKoWCpQBpUAmP5Fut02y7ykSakY
 iUd+/M8e0HVGf55fOfPupicvrKBwVln4ex7QMDfc2KPTYgQMMgaM2JoLSzkUfjdPYQh/JavGfp
 IIdHNhJuk/y5ottW5BoPHTO6MDKDKsVv/XXVJY5349hKx79h7fG/m1YUYI01gYdTowQ+4/LSOn
 rvUKK877vT0WbP6kfAQAA
X-Change-ID: 20260220-icna35xx-ec9afa13e1aa
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778779494; l=1862;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=3PC5Cuco5w85pnBqFY1Ju+w2SKqZmWd6DZncQX5MeUw=;
 b=Wh1N5cpYCZdga0nk4wOwnV9ABC9/lY5pPUnc2HrUszpEudGn4yPoOv3IIUW0tPlU6/ZaiVvfm
 iVO9k/+gM0kBNR++MRDKXEvdjND/zRrMYVSYXGDKl1fFwsIXCb9YS7v
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This driver is based on the one by Teguh Sobirin [0].
    
Due to [1], the AYN vendor description patch has been folded into the
AYN QCS8550 dt series. Which means this series depends on said series
and it must be picked up before this.

[0] https://github.com/AYNTechnologies/linux/commit/4c5e76e974db7cca853619ca138eecd8f004622f
[1] https://lore.kernel.org/linux-arm-msm/c7fb3f89-6574-4761-9ef2-2fdf6d4801b5@kernel.org

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v2:
- Fix lint warning in patch 1
- Add ayaneo,pocketds-panel-top compatible to patches 1 and 2, it uses the
  same init sequence as the odin 2 portal panel.
- Link to v1: https://lore.kernel.org/r/20260509-icna35xx-v1-0-688d3d4e10f9@gmail.com

---
Aaron Kling (1):
      dt-bindings: display: panel: Add Chipone ICNA 35xx OLED driver bindings

Teguh Sobirin (1):
      drm/panel: Add panel driver for Chipone ICNA35XX based panels

 .../bindings/display/panel/chipone,icna35xx.yaml   |  79 +++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-chipone-icna35xx.c     | 619 +++++++++++++++++++++
 4 files changed, 710 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260220-icna35xx-ec9afa13e1aa
prerequisite-change-id: 20260217-ayn-qcs8550-16c07b63de26:v8
prerequisite-patch-id: 2b010637c46f5ea0e19a2fa87cc5ccb19bfd9204
prerequisite-patch-id: d0c633dc17f0aba726a8e8d21fee52b944bf67ff
prerequisite-patch-id: 11f4208bd788df984cec7404088c7d071ec49dfc
prerequisite-patch-id: 76b61799dba520fc7fa3ff39b044e24103337af3
prerequisite-patch-id: 3844bef2eda3cf59031b1d131eb6ba9295629bb4
prerequisite-patch-id: 3331648bc6f4ac3bb156f0525aa1ede92bfc57f1

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


