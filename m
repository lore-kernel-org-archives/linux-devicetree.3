Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EF33A48D9
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790219740; cv=none; b=UOpzVr6787cKTQ0r2TrwafAlNKl1hxr6taXkALUUpD6WXCKArMtHa+gkWKlY1GxxlHP2I1P2qt7Bc09BJoyp0SbVO84vWWWFYxD+7fqFwL1bQrVSWvw9pEmGPqfueRTTr7YI3ExFr30QxwJFy17ZdpAGfGkkmYnGwU/9/ktGf4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790219740; c=relaxed/simple;
	bh=SFCDsL+KLosjLiTfRG/h9sWFqTjT5EdHrRCiuR0pch8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jAvxe7sh2bC2E3X2OUtig28XGu+VpEZoIAldaTd6RAgAaFDOYs39W954Wlf07klsWOSlgI45Oku6etzQXeQjA2rp7IQAyWVhPKDTIxH9iKZ2fg5120okxi0Xf3ks8S8ry8NgRy5v5GmLmAmFhnZzkpXiJePWBNicqqKtuLbJkV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUkoZbLz; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUkoZbLz"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4c3bb46aaf0so601972b6e.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790219738; x=1790824538; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v6SgjFofGfUKX1jxaWBbw3Uq6YYLhDmkU5+NgvCiQuE=;
        b=OUkoZbLzguI+ibZYbGRe+gQvQGRs6ace60kOaJ+bJXVsl4zhlOQ1SalqTRHGKd+r/W
         wCvbjKgrtnogwY9JHrbhM1QBkaBmLa1z3ojHYuLfX/MyCLRZVZdtL3OQIrXnBqwq+vmO
         zjsW/hhy8ZmSjbF8Jk240g1DOce7k/vRuTGFrziP6gEDBpccBFez9P7yth6+BWwiBgMb
         HXWzMXUyEEKQ0dTGXM00VQQ8fS9hHO1X4NAKb88+vzpXAx1hDTiaUhtY7J4u5pcJtnKF
         JstYNTM0mME9GNiXMspYEamae2UTVLpAmC+tDTOORCe009WRTNORm6I3babW1LqgBKyi
         /MBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790219738; x=1790824538;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v6SgjFofGfUKX1jxaWBbw3Uq6YYLhDmkU5+NgvCiQuE=;
        b=Wz9E8/HZhuNyk2kHslVWQSrflQfMkcV+um0KhBljDeDnOs4cLKpB29iG9SrTCBGDuc
         WI6vBr9qzeap+KWifhC8qxooGMeW1+Q8Gmviny2V/mPRCYCL0Kv1Ia5NrtiF2HXFIotI
         IdkeJ2a18CI3EkdLZiWiyXNuGtlkuK/3vV3S36GPxXl/6fw4Kw4ca3iXwJtdmUB3+rGx
         na2QKRmlxUNRKiUMECLBtiox7KrOannvL4vq0qpFwxnwG4oTw6IJea5PeMint2huAZhi
         LjhloK2PGkWkEWgtDl5bzgmcPgAqPM+bYhi+kcfx4R83ewt0VHnadSIqsqteMbi1jwoS
         iIsA==
X-Forwarded-Encrypted: i=1; AKwUvBz5KcP0Q+fFColD28iczVZq4O6Jz/jyh3AIY6is12LqmieUBn5aeLSoEk1hZabf5mDb78U6rpGQ3/tK@vger.kernel.org
X-Gm-Message-State: AFuF++nZhhI6+NVwWe1f+bd0CsWNdCmHnEFSWSP8reVeoTjrr9d/QDcU
	AXhNsDWhEVINYdA0dadiOOEcVpCfidqnsCM4dzq+CLbs36e40qY1lw5s
X-Gm-Gg: AYBFou1u7FFMhSt6+IHdhXCuJXobUIl3QSbaRa1UwvsTLp43ZmxxevsTL3OUoodLRA6
	hvigpjUSWhCXTTLJJ8ATnRqBTkR6z3TJ/EhMMRdG5dcuZoQb9g8LZ0boxKTGca5bko6UWCL8HnI
	dt2Vx0beRELOpKwq7VOJl6Qiutmm0obMeWvKz9Um44//8zQC5JIQbXxkyUT/oeGHvKTg9X/YGH0
	bnphle1nO7YTqznGRhPr/YF8TAVcurbv2zKKC8v3pYEyRcETIA8m+pXp0rc3iFcovOCVtfwC0Ol
	BAH2p3IwlqkAo/QWBrbXy7Tm8XlLBw9Q2CYCDHqA9vxyLYViB4VwNtAywn9U5+QK4PNPptcDn8x
	5cpqZuhJNXaS3UVSCXFXVb3jg7v0kX/6OdkiP2DiSGj+4aYQOFDUoKR34iziCvvDSk5jNR1p6zK
	Wicf1SfamYOl0UiMx9Na8kpv+UZ8R9h0kxBfQI9lPjf7Nao/3bfiR9Wlne2acAu5Wybw==
X-Received: by 2002:a05:6808:4f60:b0:4d6:9222:9a1c with SMTP id 5614622812f47-4d730d691bdmr1241821b6e.55.1790219737822;
        Wed, 23 Sep 2026 20:15:37 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c1b305b8sm3946699b6e.1.2026.09.23.20.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:15:36 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 23 Sep 2026 22:15:35 -0500
Subject: [PATCH v2] dt-bindings: power: supply: battery: allow 101
 ocv-capacity points
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-rbrue-suez-upstreaming-battery-ocv-table-128-v2-1-b827406d768d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNQQ6CMBCF4auYrh1DWyPUlfcwLFqYQhOgZFoak
 XB3K4kHcPm/xfs2FpAcBnY/bYwwueD8lEOcT6zp9dQhuDY3E4W4FYqXQIYWhLDgG5Y5REI9uqk
 Do2NEWsE3CaI2AwIXFSijK2mV5NIYli9nQuteB/esc/cuRE/roSf+XX9Q9R+UOHCw17JEKxXao
 n10o3bDpfEjq/d9/wCjfcFK6AAAAA==
X-Change-ID: 20260917-rbrue-suez-upstreaming-battery-ocv-table-128-9ba83f9313bb
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Henrik Grimler <henrik.grimler@axis.com>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790219736; l=2094;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=SFCDsL+KLosjLiTfRG/h9sWFqTjT5EdHrRCiuR0pch8=;
 b=qyZ09NfBzrkLduWXKawj7lI0MD0dd8kSQgR5MeZrQxDQrJIqkbmKcf/HJ6ymP/WdEtA9hQeTF
 eR30FVrIn2QDPzZNIt17mC+HJeNZPp0j2CnchW+loJkUh92R1xFpTLv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

ocv-capacity-table-N is capped at 100 points, while the capacity percent
in each point may be anything from 0 to 100. A table with a point for
every percent, both ends included, needs 101 and does not fit. Raise the
cap to 101.

power_supply_get_battery_info() sizes each table from the property, so
no kernel change is needed.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
As discussed with Henrik on v1: rather than a larger cap for one vendor's
tables, which fit in 100 points once resampled, allow the one extra point
that a table at every percent from 0 to 100 needs, and say so in the
binding.
---
Changes in v2:
- Raise the cap to 101 instead of 128, with a comment saying why (Henrik)
- Drop the justification from the vendor's tables; the figures in v1
  were for a different cell, and resampled tables fit in 100 points
- Rebase on v7.3-rc4
- Link to v1: https://patch.msgid.link/20260918-rbrue-suez-upstreaming-battery-ocv-table-128-v1-1-f477ef39ef0d@gmail.com
---
 Documentation/devicetree/bindings/power/supply/battery.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/supply/battery.yaml b/Documentation/devicetree/bindings/power/supply/battery.yaml
index 8ebf05d9497c..9575ee1491bb 100644
--- a/Documentation/devicetree/bindings/power/supply/battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/battery.yaml
@@ -154,7 +154,8 @@ patternProperties:
       of the battery and corresponding battery capacity percent, which is used
       to look up battery capacity according to current OCV value. And the open
       circuit voltage unit is microvolt.
-    maxItems: 100
+    # One point for each capacity percent from 0 to 100
+    maxItems: 101
     items:
       items:
         - description: open circuit voltage (OCV) in microvolts

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260917-rbrue-suez-upstreaming-battery-ocv-table-128-9ba83f9313bb

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

