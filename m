Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08133F1ABF
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 22:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584800; cv=none; b=i0VaMCeSXGtzBEpOVnbxaIPG/nhNPcU/feXmQfeGpuEiHaJw9VuoeAayFMtGOTUm+VOuZScAUJ4UVyrrIcpc5kPSSXSxlN/UZYbL3UPOSV3zKhxHHWIGyagpbvpCuKZk43pL7CJ5piOkBYjUUzGHy9+/NFhaqshtVGHSSPlRraw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584800; c=relaxed/simple;
	bh=To/N6sKAD/JUTbP1/yzbIz3c5H7WcyV26UjvmgEl9WI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SSz2YiYwSxiMBuR55VVthTTZo0ilOYQW2LIOlgPPc7DX8CeZFHqXMD3p54A0QG2kqak9PDdihFB0MsRAJFv/a/VHjgSagvpYhxmVxN1f5aWiXtRWmDrCdzvpMwH6YVIljFpWCs4++0zJWAQmlNzUHalyDmihrf5QMLbrMzwRU1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F3FJbA61; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F3FJbA61"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e60f9af6e6so1655245ad.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 15:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791584799; x=1792189599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvdzzoNUmS3cRm++6obW+ZK5PMthoIQu11Q/B6OTMpM=;
        b=F3FJbA611llD7M5Fym+v/csGgtk7YlyMS/perdq81TDF9QXpxd9JiENLHDCgy9rpSK
         wUObdWpray+nzTtfVS3ryzlusHagFRnIQuc7I+KLyLdZMpu3JC1OV9blRo/CSmpyF1di
         gV1d2mhI7rlto7/ZYhCkw+JYU/wQBcBB3hnXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584799; x=1792189599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MvdzzoNUmS3cRm++6obW+ZK5PMthoIQu11Q/B6OTMpM=;
        b=zN4tawCS1mmpUItqFD/t3BbOXURtRfWJIcALFmKrqyfPLYZMyv4bdS0p0PcvB6Dzpo
         llpTxg48oIcloEB+IA6YH2LolMtxNeJxRX/WroOWngOdMC+EYDJwvqFf0WLAhjEEOjGc
         3puHtaz9mmtu8Mtq1fiJuG+rNbJwc81NB8jXY0h1nHg12BejjlUCxT9e65sxH63i7tUp
         GcKcPufY1AjE0F3/ZJGkstRXOKHrmhPVzIwP2agnNMNV3Is9NfSHuxlfiZ8OORyzB172
         wpGbyNQNHAG7++ZXjJziRiav1nR93gpa760I/dTKi2Xgc8eVxfGYHO9tmCkTW1MUXxlf
         1mhw==
X-Forwarded-Encrypted: i=1; AKwUvBynv0d2z983FTKiLy7tiHST1y9Mos6nKSSS/4LVrJ6IZg6YWZXdXzZIJ8IcON3aWihl/fPFL8V5cChA@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8IblIPmgdcaVN9+KOp9XxsGjQOKjNo9+zhN0CiOvciGYZq0PK
	mGvAxg0HlsdcLYVQaJPXlLlm+lE5clUxKaA6rWnwXyet23rKOqDenokCD+8pi/pT7A==
X-Gm-Gg: AYBFou1NFh+dr72ru5TgzUe0Yee4zT4faoRMgFQwAWV5RNkZwn3cnGOnbXxHBIOF+Ev
	29hZJrmGlXKJtDIgjT5N4moJ6zRpm085dNe+BFdXNw7gHHAdLVd8tq6p7sUr4XmWaoxi8DZO3eX
	uSeoGAbctoB/9Q9d3qtr+5fYd3i6Y57F85i6kMdISVpIDvbedK4GJUJueDmO9u0tptMdjIOlhJ2
	je4cdiUjfnCD38eUO4cDThg4zp74wDnrvzrasCbOEGRd8c+MEGqGza0mBQH+PnNo8wc8AqCuE49
	ohNv1YM+exmz8gm6kFmgrmZm7rz8CvQc/iFrq5PNea4HP3+kd2CjOmgiFF2GTDWQYoJTftjAkJL
	HouWKyKpNPVLeKi72+Hgcbjlws9ck8ocLjDbcSTC325GOVL4TUSt02jWTt+53AEz+ha0Ug2WTlv
	DiLZmg56hsH9osyfFmzxKtlLtOMjhkR2hDAq5uBRF2uR6m0MnHbtBr1J8g2yVI8o6t4OI0rsNDC
	/wAMe1eD1mjoUNsrJKyYIQ47q9iza/cYQFzXkt+8ZrAL/grsj0RS7QOUYzeOsRPFj2HyGQVFmB4
X-Received: by 2002:a17:902:c943:b0:2dd:c100:3133 with SMTP id d9443c01a7336-2e842f30fa7mr27271395ad.47.1791584799011;
        Fri, 09 Oct 2026 15:26:39 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (35.152.82.34.bc.googleusercontent.com. [34.82.152.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e503sm16660725ad.17.2026.10.09.15.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:26:38 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 09 Oct 2026 22:25:26 +0000
Subject: [PATCH v5 01/11] Documentation: Correction in HID output_report
 callback description.
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-send-upstream-v5-1-384af01da3ee@chromium.org>
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
In-Reply-To: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791584797; l=1256;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=aFkj0W7tNOjBci2pknGWJKhsT02OsUboxe/LcEHUTNI=;
 b=IbSutf0zd2qYpnyGDgn4KNESCycWkwDCX7TOGkSC6MXTFypJDD9VDtz+YmrNGl729DbFEHvvo
 LcNPMDv4SPaA4aOAuHecBFRmpXSqIJ+au1itt9MXiiW/Nq5XKf3Fj5g
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

Originally output_report callback was described as must-be asynchronous,
but that is not the case in some implementations, namely i2c-hid.
Correct the documentation to say that it may be asynchronous.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 Documentation/hid/hid-transport.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hid/hid-transport.rst b/Documentation/hid/hid-transport.rst
index 6f1692da296c..2008cf432af1 100644
--- a/Documentation/hid/hid-transport.rst
+++ b/Documentation/hid/hid-transport.rst
@@ -327,8 +327,8 @@ The available HID callbacks are:
 
    Send raw output report via intr channel. Used by some HID device drivers
    which require high throughput for outgoing requests on the intr channel. This
-   must not cause SET_REPORT calls! This must be implemented as asynchronous
-   output report on the intr channel!
+   must not cause SET_REPORT calls! This call might be asynchronous, so the
+   caller should not expect an immediate response!
 
    ::
 

-- 
2.56.0.385.gd3acb90ef8-goog

