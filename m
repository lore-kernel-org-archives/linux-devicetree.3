Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245F24CA796
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828676; cv=none; b=Q2534R6tuBuBdyU9a0Zd1qXvA/Z1m99aCjGIJv+m2cZp6+9kTJjsZjovroRDzSYZtI12/FT0LPyxAWfAaRraH44btWbJTwf+ioBcJb09gw12LCeXzXKE79whuDlFStW3ebcY8fzgH6sdi8j0IFYm/oVas3CuZLQpiI/uESFBgvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828676; c=relaxed/simple;
	bh=2LAXvFWjSHWpY8mhkHXQzcq9Ba7ggDc8u4QUBCqYd6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omhxli1B8RxE+TiVBDeazKx10CSaFtyDVRQv9xLemW0SSHh2EWB98kvcipIvH/uKnsZFQWh8ybCHQdx/2rlEr3a06ZzwGC5CX0xlNzqtIUfle8sGfe/bwun3a1nq0KkZW9iLCFeLYf6AMi5z6XI97Z4NYMCwr6BWOUNi6cXhy4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=APTor5fj; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="APTor5fj"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so2851654a12.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791828673; x=1792433473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxZgZ36Wo50LsnIKnkOJrinMNq3Hzc2rg+tfq9dowts=;
        b=APTor5fjY85R5pPId1ei9EZBx9dI69hfSWNT8Plq+QjIMaQLvo0dlvbV58IBOw8A/+
         WGPzHQYBn1ouBnuzgcRLvzf9633tokVpvZDwSKlsJ0p+qpW2C9E6M0IVplKpTsTfNM2u
         WEhwHz3D++F6HLTL0S2lYdwBjuoy8HIxk0nX6P3tZ9pr+6gMYG6EmUbKpD2TgqqmGnBa
         n6okTapoZFaU1833oNV1mjrfqIuvyt3eCdOAqAH3ORjJyQX6Qr1+2dM7/DGuuzr/iZwC
         q54MwXzKEF7JjwMH7F8OfNzaG3S4o9uonMtKME1N0kZXzgaf4xv0n51kPFXMx/8foQbh
         P1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828673; x=1792433473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxZgZ36Wo50LsnIKnkOJrinMNq3Hzc2rg+tfq9dowts=;
        b=ZgP7+WbkJ6CHfhLu0y8hAp857Gc0CR/V5bsbQzMjM/dXh7LcIWu4X434hNPnnPFsZw
         cSygvVMW1zrhKhyLwZvnDrHGzEDmTvzvXz6+Jr8QFvjWJR9eJ2ICPEfF0CrxFR61RtKI
         6FMc0eF5wYGJQ5d3SVNEwpePEO2dTpzkHI8Nt3rUMi4UPRINhPrvFa0IumGQicX5vhGo
         aiNO89wqv8c2xgUwKK2wqf/IC8ySxyfhPQLwim/nDyxYVO/fpGLvMemWNDozECD0UyFY
         uRqsrgerB6PO79iEKpDEseFNRCuUB+EVg30BvilJ8kGX6Ikf572RkOlWvFlHnE/t3w04
         amtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPgpuiQQ3MnuCxnePGvnlQBBSt9Ia7l1qmBIAnUaxrsStR7Xsnr4ldg31y1cJQQXGitSBrpH6h8sAz@vger.kernel.org
X-Gm-Message-State: AFq9FYJhVrNe4NVN8keUBpNSHzI5j1gh4f4h96Oss6K3YEsMepfpdEws
	PZbBCBd7XHyK7OiCuL5RcPJMl3+7CUe3YqU8Z1kaRerO4583caCV9+dJnOqjWIy2WxY=
X-Gm-Gg: AYBFou3EZhllehpA0qC2dtRDZE+WAX8fKk+iQbItwH13sG7LcOVK34+yUnBWwDJJgSQ
	VVHsG1jFpgYX2X/CC7TkYi+SQ6Bm8pXsvjT6Feha2QU8xvAfl6W/mtU3X46uXNKfK7iPQL4GY52
	4B1hYCrgRC7BJ3PT9hTiL2LPdSBytwRdBGDbVu3pNY2FDzDQFbVt1poyaIkUk5U3ME4mIgTt/+8
	/zY23tFgcbqylWaNOtGgL/KHZoPA+VZiwQlYJq69Co13E6x8Ku9hS4qxBncv+nljnJPN6sbC1UH
	Mu5k37kFZxBzWWeK1HM+KQLlgMEvpESuA9yZXFxamUzRrddqPcZNKtUxPgTtomDhbaA68R3Pcpp
	dfdU6ai1qh5AY2z36FZaoE8dwdhqBmpb5reKsHnrHxqNqw4D1bCoYL2JzVA/1BrtENjAKDv7ua4
	YPGRALXVzJKho1PA1DtUq4hNUFMqbUaSlAplZbwHHNrsAx3sAGKs9kE8mQIQxsiPz7h5ip+Bw9B
	fuC1MHwM/fZ8cm+xu/zT1BbHuGJGuhUf0telqojNIhXP009k45He/+VnUMz4KithFyZNqXHtzKl
	1tePANs5xhtAmoIqR5Y=
X-Received: by 2002:a17:907:1997:b0:c29:f5d8:9c6c with SMTP id a640c23a62f3a-c31aa056fedmr1008415266b.27.1791828673444;
        Mon, 12 Oct 2026 11:11:13 -0700 (PDT)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac924dsm498415466b.70.2026.10.12.11.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:11:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 12 Oct 2026 20:11:03 +0200
Subject: [PATCH 1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
In-Reply-To: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, Jasper Korten <jja2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791828669; l=1566;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=sMlOHXWIQUaAlGkuR7ZEpwEAbe+Afp5+xO5cvE91lII=;
 b=5ESqndbcoHCWmYQ1IFMtTt9lOImdBH4J2Ge/7LsrgcAiob3q5Ug0lELJHEh6SUsH8K5XyfvN3
 QeGNqjyQhkcBP7aV6EPAieM/u/rshdDDc0LzpFqGrvF47BlU1FtdRDB
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Jasper Korten <jja2000@gmail.com>

Add an entry for the B140HAN04.0 eDP panel. It is found on the Samsung
Galaxy Book2 Go.

$ edid-decode /sys/class/drm/card0-eDP-1/edid

00 ff ff ff ff ff ff 00 06 af a9 65 00 00 00 00
28 20 01 04 a5 1f 11 78 02 9b 85 92 56 59 90 29
20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
3e 00 35 ae 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 34 30 48 41 4e 30 34 2e 30 20 0a 00 ed

Signed-off-by: Jasper Korten <jja2000@gmail.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 2b455369ed70..73cdc2d37ab7 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1986,6 +1986,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B140HAN06.4"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x65a9, &delay_200_500_e50, "B140HAN04.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x67a8, &delay_200_500_e200, "B140XTK02.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116XTN02.3"),

-- 
2.56.0

