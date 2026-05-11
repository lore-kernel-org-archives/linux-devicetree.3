Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC2E3C65FE
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496164; cv=none; b=t6rv89cwLAWReaJs0wkqD2YksdQLmVqXVyVMp2VY2pjzVrr3C4J9ZDZmF7Te7IQI6nYDeEKsr69EYTUlZfbEDcEbklru9bUw4gqLI7m6q6cQJjxQZpsOmV5/IErHWS0+vSvRMjiFH4kuDb38yjI8ry3ASuptDgkSezghjBEK2NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496164; c=relaxed/simple;
	bh=b8V2d8vMGlSXXImGlEiiDODYal1zQ7OVkhB6nLGI39U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KRUVJ5eC3AwIoT2l38bAi01NDXObFd174fdIF3+B/JPxPRHL2vRaekH5atb2lsiCUM+4BUlfd1/mbxuxqvrC49OQqyFmwdXZ5KDAPLIHOpe0Tn6giBsq3LO3WJkuHsnubrF0QlScfKujIesmlzUETgo2Rr+pQzP6IfjiSUzyUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeaCyZLv; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeaCyZLv"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so1627024a91.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496163; x=1779100963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8pJwksc69T29ge6PeayWoiQnaXWns9TCiOF+acY213w=;
        b=QeaCyZLvMpPpxqrGR6/2KPk8wLgdcxsO0flwHjXxUeaqpT6fnrvD3tIXm9JEnuEIh3
         1gk6vkuXV36jqED/0tnY7ik4BCui6U7eZLCtrO7ZufmFIkPCp31YGzK99I9agQsi2lke
         cJ8hjXd7p8mGcd3Es/vLHh12tSBRbh7fRyA+uF1/CQzmOPWf/soJroGRHVvbaLus9hbZ
         DJv9xghmufMnT3Fnym6rIZEBinWXiUf4V43VViTkuOg8D4Lzuan2PgpBZsuKzaCzipDk
         IpFAIJSlpNqGrP8ZAh6XNZqERU0Sr71Q3+bb5KzjTr5sWp6X5AeicxQlD21PjSV+9TPx
         wfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496163; x=1779100963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pJwksc69T29ge6PeayWoiQnaXWns9TCiOF+acY213w=;
        b=HaHcct36ymJZTHDmc8rT6aWuB+SPMM+oZ6y6B3xxt9OgBpCQ//AoPfToTraTIY33br
         qDXQOyFqJri3pkvKFQHxxecHjQREL8jDXn7dQLAGwRNbFQwrbg49IWWX32+9UZ6y9Lyf
         ePim66yKJnr4NJVCFNyFWeZ2886ecTpFhzWVVjZLGvB7Qw7MjZxxJ/B/1+B8h+n6wHbO
         xQX50nqc2sSy6RcGaxyCd+Jke7Qzw4m1AsymNHQXZpfGav2/yzFUTI9XLsfM4QkGly+1
         +cG3NNIH8EjsfKjPJcipluHCVPMfd0DV+haly/dYC1RsHv9d2EmpTHUcT/sN8xJjcIQI
         g6YQ==
X-Gm-Message-State: AOJu0YzamXoyvcokVBOXRVewHynS8M+4mAxK50elAqFPN9duO4MC5sqw
	Y0vTCtIegHpOpedD3QN5TrGlY0kA56Amdw9DyV6qkrhgglbBTE4RFOUS
X-Gm-Gg: Acq92OEFeguA6Bjpi8O0DOvREqfK1POMgmkp4m/3nlRFRWmB5YcXJoihOpPJhoHHJ2h
	y+J150NF9m1PUdJcbJ55KkywMLPMMGbgGYnJfz6g2FDJndXiuh+uMofueVsJQe/hJHlDiAe0XV7
	ycoIuUCkDRcxZoCCajGKIoHoUVe/JY5oF0iYqT5bC3MRKTw/+riKCx63BSyTmDtOZvB+b1CDMVt
	wP1JqbiPqtqLrLPPxjI0sxVF/dmv0fZNt4QkAwiaMhRGwys++QAyFPSPzD1RABZyGEFQFi/AVY0
	tZ2VqT3keTAMl0aXaFsDgsn9SA0GI8byyOgZ+wY8XCMYK8Z9tbMQxclKo8+kktXKO7WAAGBz+l4
	MfEYNy4nOP+3Vm4kwVh3EziD0Dxd7MxFXRwYJegpkKwO7BQC0eeD+R0DES/MCMrp/Q9zKQ5t5+R
	1vjEfPurNdcfNvgwzHGg==
X-Received: by 2002:a17:90b:1b12:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-367d3c75385mr8912429a91.0.1778496162532;
        Mon, 11 May 2026 03:42:42 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:42:42 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 0/5] fix and improve for Hi846
Date: Mon, 11 May 2026 18:39:22 +0800
Message-ID: <20260511103927.279550-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v4:
- correct default lane cfg in commit for 'fix link frequency handling'
- fix messed header (the Media CI robot)
- move constant to the right side when comparsion (the Media CI robot)
- Link to v3: https://lore.kernel.org/linux-media/20260511090924.269106-1-mitltlatltl@gmail.com

Changes in v3:
- fix modes handling for different lane cases (Sebastian)
- fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- remove uncessary `else` (Sakari)
- fix link frequency (Sakari)
- correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com


Pengyu Luo (5):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: fix link frequency handling
  media: hi846: fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 251 +++++++++++++++---
 2 files changed, 210 insertions(+), 43 deletions(-)

-- 
2.54.0

