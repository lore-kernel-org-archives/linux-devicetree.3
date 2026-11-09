Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217315;
	b=3OXaRKhDAuC8kqURBr1o2LN4h+7EoEFcu/rSHbI2jYcCiARY/jKHbb75Ftrf9GUV46J7
	 UasRr2gZP8FlkAhO5q4MekO2XYq4xJbvOSt+pU+SNyxe3zGr6I6ToQICuUi/cNEq+xUyU
	 EQmHvFG5p1aFTR/tUQk371Qy8jVQd8G58qMZp8P299Z22lYU++7Ngr0euAYlnLLTpHnRM
	 am/UQr9xb29WmE8E32pTgCOQw2EYUK9uHNVFkRJ5GTU+/MBWkRh2RB1LZld8FmgdhVr/3
	 6LUDz+IBpyiZi37iltKr9ORPkexkGhVfkNdBuP+euORu/VZ4iyM9yQiQifYw5Me1RyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OxNDojNk4xU4HyXcTA0bs35MHLi3QbYkHxDUvC4/Ink=;
	b=XvZO0ICpr2rFYIQCKPiGz4j5od6NC/9EaqsqgPeegDR/y0WlZGLJE4rtbyPGO4D65P+3
	 DTixtzKOXzNgU1NGW+pRBOaI4IEpLWtfRQc9mPBUV5iuKgXvtmjwlqDgcGy4dqCZX5SeZ
	 /XvQGASYxKeVTMuLZjrSi27cOY1oOXp7HA55wWLdtz3x0JANJfThuRQrqb83qo/+jxlAT
	 hMTBHWM8nk23fSZR5HQU00WrdhsAm9R9uluy2DJ+84ObZKWb285N3RbV5TN6zqGwvo0hv
	 X3MlMgrsOlM4bt/GX/hgMxxeK3rgowOdzr1BTdk2pZAhiiLeqVAyyNZxdAEZ3R8qhmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=23oAPPjV;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6413A606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 09:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6413A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=23oAPPjV
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490f38e9688so502066f8f.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 01:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794217314; x=1794822114; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OxNDojNk4xU4HyXcTA0bs35MHLi3QbYkHxDUvC4/Ink=;
        b=23oAPPjVuoyJSsO6zIw9EtgP7YPqi78BBG2FKZBW5WVw95R8MCQ7Vo9HrJkkKGz91+
         4ZpDawTEpE8LE8RhIffrlBr3LRTai/ndQ3YU489ImxInXWjIaitfD60i+qb2iT6fFwt5
         egEi6IemEF8Gr2WxG5z499SZ1s3dkeDWYtU+/qW6FibUwYZc+dRDRH1v1FU5Q5e03LgB
         rm/ycVY+em2qzVbRZB8fk1QkcBOBCbzoxif0PS/uh1BnrEQFZg5izhTgAlVulpSrfhol
         n0qpy6YNCPbHZYmAU29OUWLup1cwBCnZHXjEqUNeToQbY1azt2883uopiTv/qMX1OaTQ
         hxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217314; x=1794822114;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OxNDojNk4xU4HyXcTA0bs35MHLi3QbYkHxDUvC4/Ink=;
        b=QK/szxuEXO+a4a7z+Y7ub7XA4EHuj8C3hGUZQurDJLO5v5L/ZPmnN6e1KnrJzr6er4
         V7RjKGUqw35AzZKiqCWOm3tof/7sYiD4VeVgGP6kW6Tc3YgVQUGOi2+o1Dr9d2//26ib
         vRS8YOIBH4MtY3ScY7lHwsLvy1LjO5w3E+jXBU2Ryk8ZoDj8YlT/PlL22yGEjPkGs2EX
         Fal/EPDz62w2yvL1YqP0UhuVbmA7WrUgJvUz8sA4EkNxAMycQjy8XtbkK8i6rnFT3vXb
         /SbwjlONRdV2jzMBajD8kiFsHMlYTL+3BisGhRzmTiCZkJDogSkfETs28LB/2n1L1quz
         GRfQ==
X-Forwarded-Encrypted: i=1; AL+hErGG0C9q5l0hkqOA+i5iqNGxJMG5LQwvLyj4ARBRUr+4HgEhzadCkX6VPdWkWrbYYHZ6bvuF8Me5yOA4@vger.kernel.org
X-Gm-Message-State: APuU4Z8IHYhCQb+DqSMrAvyonKTgB0iSV99t44fNKWxwKUg5ywJMV+rD
	prMKkSr18vl29KhI/8ozooS7kiXMs3gVkTK42ShA6wnUOO6Pd7FBL5+PvPC8kE8MKEU=
X-Gm-Gg: AYBFou0iZhOrjivZIdcDPpcP0UFOhB2u2s4O67y41bo0J7eIuEVbBZfPqoWY3PTjR7e
	8uExgyfkUdTs6A7cTG8YKricf8AqLSJh7G0pKKrdVPZZ71A74KBys0wbN4r0Y+ovyk7ZqT7onoS
	4TgZp0Lk32bCrRYaqfhmKvLvqgC8FRK2XTbVR7Q9PHwAChvjjXj5JByqEustRBL1CfI33lueD0U
	JrCPNW3Rax1csS9PsFctCcxiQ+joVLFeKI8E/ieChi2WP7FQ7L4EK3jihzHit4LlTGnSBqrLS+c
	rnwnYDC6vcMMxlw4fpJ+yAOz+E6ZTBvDiMEWD36+k7wM3plgxedcpyvD2GWtzTnMYskEFsC6zMY
	GtZ4Kv8Sfgu8oFF9zB5r1HlEYqGKY4DFFnIUbIjC6Z2bvxUnXxQ/9vzHavYb2MVVOBjOyxjVZ+W
	zTRakXCEeXqeasrkFto+6tSAMWYL3AjvdzsevsIikYvyWfMCIkKCF5xYzDk/v+7KSfwty3owixK
	06DP9RZLSf42gyebYjpVFViYdd7gD4egnwmL2LEAEiWd8bm2Hthp3zmJxzmzeIBvKzUi96/2bE8
	RFSIXDiMKWzbwc6DRuEPFzVlJa0sRL6Dn7WrTtMBrz468+WX2bKaDElqTIhkSjok48T+Hxj8rGU
	WVzOjyR04
X-Received: by 2002:a05:6000:26c8:b0:48f:bbb5:61c2 with SMTP id ffacd0b85a97d-4958852d3b8mr7998933f8f.4.1794217313738;
        Mon, 09 Nov 2026 01:41:53 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496150c6e90sm7278409f8f.2.2026.11.09.01.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:41:53 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/3] power: supply: battery: Allow separate charging limits
 vs. discharging
Date: Mon, 09 Nov 2026 13:41:47 +0400
Message-Id: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0Q6CMBAEf4XcM00oRYn+CvGhlEWPRCTXSiCEf
 +fEx8nszkYRwoh0zzYSzBz5MyrYPKPw8uMThjtlKovyam1xM61PCbIataI24T0ZOYeu7sOl6io
 470j/k6Dn5Ww3jz/HbzsgpF+Q9v0AQllllH0AAAA=
X-Change-ID: 20261109-battery-charge-temp-range-37fc54d4e3a3
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=alchark@flipper.net;
 h=from:subject:message-id; bh=+odnf1TlzZclfLwdtnwN+ooYti1FGicx+mmm5eDR3iI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9nBrfpsZzxLjaVyC47kzHj5OLZBo+2d8zemZWUB3zb
 PkB24nbOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqdTNGhusuU2+Zfn3Z/YS3ZtH139My3ltUZgZfv7fmxO+8Hclt9QaMDBM+TWn
 P3Vl4xv5whvveTU+yfH4GTlHLeFH+caH8/+f9b3kA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Some batteries specify different operating temperature ranges when
charging vs. when discharging, e.g. charge at 0C to 45C, but discharge
at up to -20C to 60C. Current DT bindings and power supply core don't
allow that, so extend them with additional properties so that a separate
limit could be programmed for when a charger should cut voltage going into
the battery vs. when the system itself should shut down.

Additionally, allow the DT to specify voltage/current limits to be applied
when the battery is being charged in the "alert" band (either high or low
temperature, which often requires derating especially at the low end).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (3):
      dt-bindings: power: supply: battery: Add a charging temperature range
      power: supply: core: Read the charging temperature range and alert settings
      power: supply: samsung-sdi-battery: Set the charging temperature range

 .../devicetree/bindings/power/supply/battery.yaml  | 45 +++++++++++++++++++++-
 drivers/power/supply/power_supply_core.c           | 16 ++++++++
 drivers/power/supply/samsung-sdi-battery.c         | 12 ++++++
 include/linux/power_supply.h                       | 16 ++++++--
 4 files changed, 83 insertions(+), 6 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-battery-charge-temp-range-37fc54d4e3a3

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

