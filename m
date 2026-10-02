Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00671489FB2
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942586; cv=none; b=Kp7fwyIQJV+tNlxFTfemRtqK7kUevNtjagGM33ogALrQlqOJLYuqoHtms6RUb+qErzRqcoeGbbcekSYkfbZaA7ge/VhruTsVSCbDj/RYqDFDm7bdyulRBP3Uu48zMsbnAaHNa4qPSaqUol2EaCfDIJLGZqGRBIxyy1bUxva0xZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942586; c=relaxed/simple;
	bh=E3bFiL7YI5UMcoOM0utDxMNg5sAh4VkSM2tXjlG6tK0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DddbFjo/kzooPBHHg+tBgjuuE3ytQDwEr9PQ+WyJ4bvumLk+GFfoOvhebsvSwrSn5OoaHXPrLefF9fYbaO1W/hxW0sVncfpHW5VN/BYBVNVoCxi3IqW1Io6SDGvVtdel/n2r3/1Da+aKy8qfhp49oxebr2Rmg+uZBqT6Tews56Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=QsGbilie; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="QsGbilie"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so7438385e9.2
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 05:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790942582; x=1791547382; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IYtYYZuAQMFfttbDXhmpcbK3WXYMY+yBwZAMhK11zKA=;
        b=QsGbilieinsXZfyBUxi5BdqBz7EmekQaLI3KaCJb7FSjxl1YTq8hdVc10by+i+NTaX
         cuYiryx2lFOXUhClKtVZdEfRg4WHknzXNlzNvdg7BlLjCzkuDqiiTr5jD1wbD23q9IPB
         q4oD8rtpODewsM2Wm5GQ6xp5Q/99ZbUJyz/NvBazOBGkXP3U6pbq5AL3Ylq4xeXIbceq
         OM0bS3F/Pv0J2OoNFhXGFoaUaV64VO/bnsNnBg8Bo3db6KhpAM59KQYvGQ4+L7qf+TeA
         tq2of+NGYuOcM47sBB6FZIv2rJPeCe53LI9Ld6NSKPX+JTyP75VaTqqmJ799P4wNVuQn
         v5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942582; x=1791547382;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IYtYYZuAQMFfttbDXhmpcbK3WXYMY+yBwZAMhK11zKA=;
        b=krTSulOQImh8dH14z4YNcbawltYqzqaf826VAVAHyjq098Bo+3mcmaxswLZhnQFlzl
         kP/qqp5fmqCRsKMNghr4h22OiEyYY9cC2DMtnusnIpYfc6m5xFRnCZ8Drr1iKOcoFPXq
         LAvMRhVAzhexGOJFvUkzp/x7rZO60U29s7yBJp/0xg6u1B8VLAYKkdp1N4l5HPKQ08Zj
         Anp8PNF+5Ulz69ps1Or6phg5E4WHa6wgGs4iI3dKWyJat6DpGLCxhZcIMMk6sfjwW4Aa
         a700mAPMIrIxzBExqZ0FSdgqoOpLbXyekNNbz4pnmqBfe3ke1nwhNQpO/Rj5J2b1kMr4
         ao+g==
X-Forwarded-Encrypted: i=1; AKwUvByvPnNesuwMRhCKQKwPqmRFMtb9dy76OrDtpFvQ8bok2t95AKh5C7hXNo9bE0W8GwbQl169ERI+J5LV@vger.kernel.org
X-Gm-Message-State: AFq9FYI6B/V8IcerYqvHqwCFinoOidk7+5z2hCJQI9uHoKpCFFh09vl/
	2HQdiYT5toW/B+dMgDd0HwRLcCGHad7BtX9Eai4+4Vo3V/IaOePRoauJ2GfD3NY5kVjkYsXFgqY
	anwpIdoA=
X-Gm-Gg: AYBFou37OZ50i0mLX/+ab90tZqz34rO3pz0e1RGBQnJdTYf/sehKPOPGCFc7x3jQAPb
	lAhzgtYTocQk74rp/omNtS3tr3Dw+D1+H+FvFLV4Zy9SoshgAtca9Mlm35UInUzLTHJ7jVBzkTs
	cVRMfV2DulcXrM/MTbIdguCtAQrmegrmlOq3wfjj7nmLCb5bLBqZVDegrBpivT4XauMLQh5HnJe
	3+1NjKUcomIonTPtnJzppCaLtpRktcYqP4wjEYwOC7WCDuM7y4odbe5UJoNSotiW20gMa08q/bo
	rAu57pFxoe5SH1BFjtXO0gh22VrQ1TzrrUwSj4yfA2zjOn0A0ENOD41Yly7I9K/Wh2oxHFq7A0S
	ewkcLeAcg6KRM3a0rRTa9Y1EUsaZdJ4ZYZNviqNA6TqXuNZc7wzEzKW1R4mtzxlnENfj6eichb3
	TmU2ewkoqIlh7c5t4zVVg6SnzVd+zGmkJy1kcLnsTCtyGjOiFS34G+ZzUcSBL6tDTp1ONYw+x1M
	nFDTaFHcyTD6qW9
X-Received: by 2002:a05:6000:25c3:b0:48b:722:1c6d with SMTP id ffacd0b85a97d-48c440e1b11mr1660612f8f.38.1790942582097;
        Fri, 02 Oct 2026 05:03:02 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm5845213f8f.13.2026.10.02.05.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:03:01 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/2] power: supply: bq27xxx: Add TI BQ28Z620 battery gauge
Date: Fri, 02 Oct 2026 16:02:53 +0400
Message-Id: <20261002-bq28z620-v1-0-bdcc10d42519@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMj3aRCI4sqMyMDXVNjEzOLJHMzc4MkMyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQArnrFLbAAAAA==
X-Change-ID: 20261002-bq28z620-53468b7670b6
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 "Andrew F. Davis" <afd@ti.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=alchark@flipper.net;
 h=from:subject:message-id; bh=E3bFiL7YI5UMcoOM0utDxMNg5sAh4VkSM2tXjlG6tK0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtn1uUbfn02o70kxbxwtE/jkxZfDObs71avHxG37dPz
 NfurPm9rmMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpnmrD8Iv5316HNxV+C2z/texTtNGfy8+7bN/s7eyfrmdKasrFh9kzMmzd9Xi
 qxpnN29bru5975fivac7tG3dW6G4IE9tz4sq2x8YsAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add BQ28Z620, which is very similar to the already supported BQ28Z610 but
drops some registers and shifts the data flash layout as a result. This
means they are not strictly compatible, even though the existing Linux
driver for BQ28Z610 can drive the BQ28Z620 with no changes, due to it only
implementing the (unchanged) standard command set.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (2):
      dt-bindings: power: supply: bq27xxx: add BQ28Z620
      power: supply: bq27xxx: add support for BQ28Z620

 Documentation/devicetree/bindings/power/supply/bq27xxx.yaml | 2 ++
 drivers/power/supply/bq27xxx_battery.c                      | 6 ++++++
 drivers/power/supply/bq27xxx_battery_i2c.c                  | 2 ++
 include/linux/power/bq27xxx_battery.h                       | 1 +
 4 files changed, 11 insertions(+)
---
base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
change-id: 20261002-bq28z620-53468b7670b6

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

