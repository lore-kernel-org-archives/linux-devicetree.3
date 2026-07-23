Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF7C46D2DF;
	Thu, 23 Jul 2026 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805989; cv=none; b=qJL1WYNzdlbOz8wCTHNfvYmHOkUwTREYYosKtLsuAbHAaMBT7uHbFgxRwvxRjNKMU3+KOyGEZM57HKqD3w9q39WlYm+ezZPCl5/ydItPO3m9qj8C85dz1V1faMaOnnbBEsqJobfm2+qAjVLHKqULIwMS/kIeuDdWZ0nf2MPPzE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805989; c=relaxed/simple;
	bh=0YihQE3yREOQU/G6DN7iPIXNkMJ2/jzY9GD/PjwLqj4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e859mQciq8/J+2/27yuKUTwcmHsOr4tYdbXkW18RkxZtOaDjwUG73K+6xIDWBxrVXYEsxtNWRBJ4eJEK5RLO9FZZ7j/VHE8h/TrEIoUZqcd4ouzPqHfSnRTuWry0NyyD2CijRJMbDdOMc4vMuiJyFjOjW58xLVfSmIpOPedmN5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUCKY8M9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUCKY8M9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24753C2BCB8;
	Thu, 23 Jul 2026 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784805989;
	bh=0YihQE3yREOQU/G6DN7iPIXNkMJ2/jzY9GD/PjwLqj4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QUCKY8M97EhnXz+xaVSo0VGjX8BgE3NZJ9JRmIx7sjAhTSHeRCSsXme8Sh13fHGG6
	 KOgPPUQ65fkDE3zm2uFMjt+g1V8ToRuwG52SHkSvcenDWVBPI8nlfeBZVimRYFXO4B
	 RnIiQZf/leMGeaXvHs0M8pwx9bhwBCFf/nU+eWdYrnJ5Kk3pQiD6LQCZBYpVmN8eYF
	 gao6NIM7/8Y8Isqp56eSSnWfI1K6aQM6p3+haiJvUIUpK0qq2Sqw8VAc4MM1nmCgoF
	 ebfShUaIKzqqLQHGVvsPunhJgEVN2ZM/PcsnAKHhv8C9aGvCwrkYFGCSgvPJ7TXAUm
	 /y3v7++6HV74Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEC4C531D0;
	Thu, 23 Jul 2026 11:26:28 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Subject: [PATCH 0/2] drm/panel: st7703: add AYANEO Pocket DS lower panel
Date: Thu, 23 Jul 2026 18:26:27 +0700
Message-Id: <20260723-b4-st7703-pocketds-lower-v1-0-e3db246589f4@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw7CIBBG4VdpZu0kSFFSX8W4EPjVUVMaBi9J0
 3cXdfktzplJUQRKu26mgqeo5LFhveooXo7jGSypmayxW+Ntz8GxVu9Nz1OON9SkfM8vFLYpOPi
 NG2IYqOVTwUnev/X+8Lc+whWxfn+0LB+oEoAzfAAAAA==
X-Change-ID: 20260723-b4-st7703-pocketds-lower-2db4e7549cb9
To: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784805987; l=1180;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=0YihQE3yREOQU/G6DN7iPIXNkMJ2/jzY9GD/PjwLqj4=;
 b=cQWbm4igXYqt20625hB3hQDnDAefEE+ACUtQUF4iJQQd2chCAI9Nmlg1a/CsVD0Irx5Y6rTFy
 DvL11Q8ZdZwCQGuQaTejd91EdssAya14OiqrZ4ga49iMhkkEGOGNIJp
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com

The AYANEO Pocket DS is a dual-screen Qualcomm QCS8550 handheld. Its
lower (secondary) 5.0" 1024x768 4:3 IPS panel is driven by a Sitronix
ST7703 DDIC: every opcode in the vendor init sequence maps 1:1 to the
ST7703_CMD_* command set (SETEXTC 0xB9 with the canonical F1 12 key,
and SETMIPI/SETRGBIF/SETPOWER/SETGIP payloads near-identical to the
already-supported Powkiddy RGB10MAX3), so add it to the existing
sitronix-st7703 driver and its binding rather than a standalone driver.

Tested on a Pocket DS: the panel initialises at 768x1024@60 and both
screens are active.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
Alexandre Hamamdjian (2):
      dt-bindings: display: Add AYANEO Pocket DS lower panel
      drm/panel: st7703: Add AYANEO Pocket DS Lower Panel Support

 .../display/panel/rocktech,jh057n00900.yaml        |  2 +
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      | 96 ++++++++++++++++++++++
 2 files changed, 98 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260723-b4-st7703-pocketds-lower-2db4e7549cb9

Best regards,
--  
Alexandre Hamamdjian <azkali.limited@gmail.com>


