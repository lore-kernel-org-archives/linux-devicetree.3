Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9417B314B72
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 06:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408440; cv=none; b=Zw7euVW14wHJdw20BKDb7OlDTOm8a0j92DnerbgDfahgVypec3F8Kz5lEKV7f5QjGo+a7XMS7NuGBZzjlRUOVBrnTW3SJJz8t+g0EqYHVu8L1IxRMPKd/dXPl+ZRcSCD/nntdeBAm/lbdK+v7PCwYYjPelrAV5mZyZMiRexz9zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408440; c=relaxed/simple;
	bh=plPpV1uGTBQloKjGz4ypjEFtN0+e6x//cAp3qsw0NIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CL0TXHIPWemwP4sGo1/vnb1jpZpE0BkbAWjMm6asjPw6b6Ss3Kgaw8z7RwrIytCIu6U8e7TMzyn9JNw1vf1Ju0dxAAuPMrgA52fKCcn41xQrO9VrHcS2Up68s6NTxF2wvbX9YJSw904qy0Y+RJ+WWiurSlSJPatiNQqc9p0ZmMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuBlXVmK; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuBlXVmK"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a4053964e3so365482e87.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 23:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776408438; x=1777013238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cla95yKUKTBsgVaDvfogIRMWaCGGOWq4z1TFG4Fvu4Q=;
        b=DuBlXVmKUGLpsvqdmHNfeo0fGsZ0st/dCMLr4ClRJXlWlNqHGqAOcC1gvkipsXi7Xo
         7fWsPzZV/rzE5gWEQPfWusEF/MzJ/neBaA9XooCNvPBdk2zBDPbdXw9mMsdYcHb5LQoO
         XpsL2i4EBKSydZYHLPp9uz8Y+MQpdhsDTvcyTKuM09BJShgx6ZODs4neSeAMVH1sGQyq
         e/PSUdOUbswDjhGOFRKfiFELhVguEPtSjFPMzkkkxVpQH8/z13ee5n9jRPxvOcfzHexl
         iya+YpdnoGBZiyFH8ksvEUjwf5pf8RhpTiE2nDwDfB1V8Gx2h6f9/ECfrorcGROHTKhe
         VCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776408438; x=1777013238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cla95yKUKTBsgVaDvfogIRMWaCGGOWq4z1TFG4Fvu4Q=;
        b=MNP5y4vdL/oyQrkj8/jwgwUfIrNrt15CwzcshGicrw5c3MZ7HR6vy4wYrbn/1R7Wk6
         xyyUuGUpyB1wKTRz+YW0AS1CYo2BXsC9Dz7vsbtPnja/U52/1IO5YL1iX334hQjXEYit
         4Oo/uU4EXbe75XuFigc8goXJlucaBgIRbVA7MWkmqtzjXVuxxYGb3Bqti9I1NAKQ+VGI
         /U6zCS8+Qovuka81GnHd81ZG7i7mnCAbeFjQhgVZ9LonCdAFvPq3FSIDPHUvLq2wX/Vt
         q88dkSuPgkjnTdXUg3WpNgDNyY1+e9cdrpEc4Q28zl5Zeq7c/onPzpfuZprsIsQTeFuJ
         utXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GrXKfGgyCK23s9oZ0kxot3z9iZAsWK8aPPDc1ciyTn3JImImRCuksKs2uK0QngzOlWI3HdEs/wa6C@vger.kernel.org
X-Gm-Message-State: AOJu0YxKfRcdu3WbUgvCctGfUrKl6Fr4arwCNcVaUSxM4Eia/ML+a+hn
	Us+bYQFDqkOLoiVEd2bHC6mtU/8X9zE0b5tSPOewl9JFGvUi8dH9eOl/
X-Gm-Gg: AeBDieveMvgG3no+QtuaJF+q9pqSbF3RcG5rQAF60CiT4jlBrax5PcteWtqULp22QM/
	gfbLn3jTkFgalUsjjzF1R8z5AAzg/MfBq9+WldSxs9xn7CogUMbyXtvBL8xPatXmKph01l/BPUK
	5OKS+gM/7pPO4EDtuR5bxFFDrlhilhHXRwyLfy4xrtlnvLrgf/JsnThrGCUXH2C3VezuJV7lYGc
	2w9zt1CibOD47eTE0BfXmKRntgxA7Zyy3jkFTCx8YziXDbQ2aRwjEtZU1ulGPsK11DAPqpLGB6d
	jLrfRLPh+jFlX4eHDQIT5X4y88wD3g57HcePUclrn4P0wQ8b3psbZzT+8FjflrnTdkeSqrZEngU
	EwUel/EA0j0v4a/My4EvR56WKw8Sc6Td5nK8ktiUjKoP5LYA7X6iHiViQS2oaight1zwrNBuSXv
	WEvQwBnx4xbv7MX/Hx0CekBHk=
X-Received: by 2002:a05:6512:138e:b0:5a2:b8cf:39ce with SMTP id 2adb3069b0e04-5a4172bd2c3mr417584e87.10.1776408437508;
        Thu, 16 Apr 2026 23:47:17 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec365sm141768e87.83.2026.04.16.23.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:47:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1 RESEND] dt-bindings: display: bridge: ssd2825: inherit dsi-controller properties
Date: Fri, 17 Apr 2026 09:46:56 +0300
Message-ID: <20260417064657.20293-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SSD2825 being RGB-DSI bridge should inherit dsi-controller properties same
way other DSI controllers and DSI bridges do.

Svyatoslav Ryhel (1):
  dt-bindings: display: bridge: ssd2825: inherit dsi-controller
    properties

 .../devicetree/bindings/display/bridge/solomon,ssd2825.yaml    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.51.0

