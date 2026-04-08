Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0F13BB4A;
	Wed,  8 Apr 2026 05:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775626366; cv=none; b=UX5iDyxh1IFiYw0pu2ysZXN77NRQV0mujlrgZh3WtyjiDbhkihEw8iHvzNQVcJZgFQ9KUuPCyxEbM4gPKoNSMdTtB9M23HF74ufXBRTaq8WY58V/kMjRLjEq5cChQxMNX5y+kfvGfUQ05aHssFzW0+TbTOn3RMDFX5u9oVdVUxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775626366; c=relaxed/simple;
	bh=4uTI8UOVIZulietJSjNMsqfC3JUpA5rfcPQ0Qg4tPps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QxOPpiOZOgPcyIVV4WdRdtsH03rLu9jtgpMExGviiddJfiQ3kv2XJ9OGfNWcoxm4/syb2+WxTJhekggI8lm/lSDwsfe1KprmNYbdTSOXTtcBYuSaLFxRfQYNYrMtloPxCDuUZfBRVnAMk6r3vXTqtehyaXhAERQRheENs9tzcKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEzML/5c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEzML/5c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC057C19424;
	Wed,  8 Apr 2026 05:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775626365;
	bh=4uTI8UOVIZulietJSjNMsqfC3JUpA5rfcPQ0Qg4tPps=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=NEzML/5chum846fuX+qntTd9jwvTsgHPI7f16MRfmcszdYoudWA6U7disgOLtsULw
	 FaLHyZSZBZyVTbSFJyjp+Weq7tzAeR7Gt2RbMUl/aYJQSgnAE79mxflZCWi5Yp6via
	 dOaQDyL/5Nlot4r0nEqzvqoKG8UPP33o+ZLGl20Gxq88x82K0IiF0jRMTemUgjvert
	 0fm+id2Q4Bq7R2qqQVIDB+O7a5fcJUvq3muq5EXbR/2lamEp7HrmM+HDVs8EnV8tO5
	 FflKBXmgUjkEv8pNHEEREggTnEK0DPkr+CMDecE42pRG67uh1bLu/iRlHx28UZK2bo
	 CkfCLjYR7Wpkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B28FD5F6C;
	Wed,  8 Apr 2026 05:32:45 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] drm/panel: Add panel driver for ChipWealth CH13726A
 based panels
Date: Wed, 08 Apr 2026 00:32:38 -0500
Message-Id: <20260408-ch13726a-v4-0-9bb1a9b8f329@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12PSW6EMBBFr4K8jiO7jAdY5R5RFh7KjaUA3Zigt
 FrcPW6IBMnyl+r94UEyTgkzaasHmXBJOY1DEfVLRXxnhwvSFIomwEAxAEZ9x4UGZalsvFLaBCm
 CIeX9OmFM35vV+8euJ7x9Fcd5PxJnM1I/9n2a20obGRk6iEYG9A615xgbiw1AI3hkvKlj9IDk3
 KSt9h5cU3sf6M1nIyWjXHmmnRIBQbVLTZ7xXcrzON23YQvf8n83wLFh4ZRRlIwHbZAzad8uvU2
 fr6XkZrLAAYoSeoBQQDDW1sr5oAL7D4oTCOIEimciGKdioyOaP+C6rj9lFhIKkQEAAA==
X-Change-ID: 20260220-ch13726a-59c6678d53d8
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775626365; l=2276;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=4uTI8UOVIZulietJSjNMsqfC3JUpA5rfcPQ0Qg4tPps=;
 b=fypg7sL9xsw9TCAotM+pnsUwQi2ksnpfSOlqOOQnKCYWQURQvG54FKk1DsVo4BFMn/mWZcTkY
 AwOyQYYdgmwChfKQn1Nsm+1sT9GktG3XijGddUhDq5EFd5+/W85wQ56
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This driver is based on the one by Teguh Sobirin [0], cut down to only
support the AYN Thor bottom panel.

Due to [1], the AYN vendor description patch has been folded into the
AYN QCS8550 dt series. Which means this series now depends on said
series and it must be picked up before this.

[0] https://github.com/AYNTechnologies/linux/commit/d0ff75b09e66023c5f88992706dee4601aa7a437
[1] https://lore.kernel.org/linux-arm-msm/c7fb3f89-6574-4761-9ef2-2fdf6d4801b5@kernel.org

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v4:
- Add fallback compatible to bindings doc in patch 1
- Link to v3: https://lore.kernel.org/r/20260323-ch13726a-v3-0-e28b6f97fe80@gmail.com

Changes in v3:
- Reword patch 1 commit message for clarity
- Order properties properly in patch 1
- Track vendor description dependency series change
- Link to v2: https://lore.kernel.org/r/20260317-ch13726a-v2-0-28aa46bcd6d0@gmail.com

Changes in v2:
- Add Neil Armstrong to binding maintainer list
- Add 120hz mode, which required a minor restructure of the driver
- Link to v1: https://lore.kernel.org/r/20260222-ch13726a-v1-0-e501d78e105a@gmail.com

---
Aaron Kling (1):
      dt-bindings: display: panel: Add ChipWealth CH13726A AMOLED driver

Teguh Sobirin (1):
      drm/panel: Add panel driver for ChipWealth CH13726A based panels

 .../display/panel/chipwealth,ch13726a.yaml         |  67 ++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c  | 339 +++++++++++++++++++++
 4 files changed, 418 insertions(+)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260220-ch13726a-59c6678d53d8
prerequisite-change-id: 20260217-ayn-qcs8550-16c07b63de26:v4
prerequisite-patch-id: 042cab8f04748207ba5395dd0f23c445955aaa2b
prerequisite-patch-id: 4e13275bfaa4f838a627fe8dfa3d4cb8972fc5b4
prerequisite-patch-id: 16c130bcfd7c787b91e828b8e600bd0d740f937e
prerequisite-patch-id: 4b7e6b017349c386f54e221790da4392fe066ff3
prerequisite-patch-id: 3844bef2eda3cf59031b1d131eb6ba9295629bb4
prerequisite-patch-id: bcb261e40f0386b91a09eb4080cbdf74d21f3df2

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


