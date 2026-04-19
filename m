Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99A83002BB
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776591278; cv=none; b=t75eX2Izc6O1L6JMKH4U8WB9LKC582CS2w8I2MZNXPve3pHEATRnEl5iTP0FRu9tsyiZ/JMv6IYS36rPPjwfU3Yrk9CvyJq/aho2TiCyeTK8UXeNWAmnb6XPfXL3pXrE5Ga68cQem5U3xsniKbh3MVXHGc+ASP5dlTw+UCrgCDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776591278; c=relaxed/simple;
	bh=norNfde2cZxGgr7iCJx3n/UVpBzudP2qM89x8qgS1b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h+ekCeBr9KyNEp/4ZKcAIDVrQTqrF0ws+BtXgoGeYRxoO5nWlWKC0+5A9LOyQAFZw0ItDtk56B5h+Ian+SaCNBR3EH4sFOk3NswXWy548Bo0kAsePZSvF+OMhUN+7RpppHIqRhMZMDzwRwJibp/2eTM9Z5YxjwS0c+dkDUysjLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zl6oi0IA; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zl6oi0IA"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38dd575bca3so30129141fa.1
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 02:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776591274; x=1777196074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0/2aUHxdqDtp+3Z99o+AnFQJqjm5BGPJpL3yuh69NhM=;
        b=Zl6oi0IA7lpu+i7E/xp0y4TRY7uzWJvQ1zo6BAS5oOpAZ1obZLp11Ytn3wfkNmyVUJ
         r7hU6v60uN60FioQOlb8dFp9k706X2Jd82uXif2EVDV7jdamqMkXJlwAAsRtXLHW8O0/
         LBvFVoO8+UQUAFB1yZWwZtsncuuVejN2Xv2XlYRNoiZ8b1/Nwl828Arr5Cd1OkxVo8LF
         6fpSC+oovOdpKIXp9GeN+YIe17ZUs/QD1Tw4juIDxroK+q1I23Tz96ihoJv41OrI+lXg
         ZZDojhWK+pus3WGM25zeLdEC8hS+WfqDJ4X7yEb2FuL437OMarCwoiSYNy82zgr1k+eV
         gWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776591274; x=1777196074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/2aUHxdqDtp+3Z99o+AnFQJqjm5BGPJpL3yuh69NhM=;
        b=g12JT2iq3hawt9zI0CLrO0nbrOPpDW9w80gCdQNyOZotQCsnoNy/jJwTHw0RjMlo0P
         4VTYoWANaj1LqMHCtsfbc+J8y8whZioF37GM3yqMofHYSrNcET7ggkR5/VETRbPsfQD8
         nX0Ohm+nSEkBm4w5ul/6iv3vk928c2HYwG0fGU1zpP77QCE73YrKg6gJxdQ2zjT6zP74
         9Ga3bi3XH3Hr6EfGqT6pV5RgKOfptzqLVljbrfqZdUglsgRWao8I0kX2UHkO9xtnrgf5
         YRm+9t5N1yTv+dVQHg5jFG75p9R7RXq23pmS4ZuTkcSz+zTKSoarBE5zDGBg4/ddl1Tf
         Mmng==
X-Forwarded-Encrypted: i=1; AFNElJ+UhZx1N46gYScGQ65EN8VGjjI9sI3Lfi5s9GJnrRzfy4EHis1Hn32nB4VnRfDmO9JqWFaTYWjO99Sb@vger.kernel.org
X-Gm-Message-State: AOJu0YxhSV6yvXje6PX66mVnFhboFRuHN0+VW2HkL/21ABl9FjM1H8+p
	NqSCBEq8YMAIUdbHqNGHwsP/DNoUsR7dhgNnzRgYzNbADVlTwGaCz0mK
X-Gm-Gg: AeBDiev0Lcaf3/B0Gmvy3RLC3PKEQVaAhG22skspSKkAQUWtn5hNNraYobdlg+axG8m
	D9K6GuEiEo+xzELQMhw7Cy3me3sMroPsYmrEtuaeZJRERK4NBImbKFatbFsYnIudl4VO8mw8F2K
	TqLyErEJG7vNkMVBPcdoQ+O983wBcZLJaLiOdpU3+VFirnPq2Y6X0xw375PH7DlsfI6Jvkm15lY
	LBbPD5wGzUmB0wUloGvLKSLGlLL2WAxH9MUrEz08k46yUzbI/LI/DtUQFwx7vpQwMydXXafnwoh
	vLHrIqgwSyaTl9eiNomLSvPVkv/UwpVW7P8BYQG9xCZ9RK+G8VybWJ6uXaacnn40sVdyTaRnLL6
	aITuxcLzecjAReVNf5XDzcEg/Qlu5ZUUyFOH/IEHi1165lgO1Io/twOSk07JxWUrI/H5GMp2rbd
	mrGqRFj6sFEcgZgPVamJpwcCvDFDtAvYhS9Q==
X-Received: by 2002:a2e:3302:0:b0:38e:9415:eb2b with SMTP id 38308e7fff4ca-38ec8fb23d5mr17461481fa.3.1776591273968;
        Sun, 19 Apr 2026 02:34:33 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm18221671fa.41.2026.04.19.02.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 02:34:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/5] media: lm3560: convert to use OF bindings
Date: Sun, 19 Apr 2026 12:34:07 +0300
Message-ID: <20260419093412.40796-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

---
Changes in v2:
- vendor properties swapped with generic LED properties
- added mutex lock usage optimization
- power supply and enable gpio commits squashed into PM
  configuration since they are both required in making
  proper on/off sequence.
---

Svyatoslav Ryhel (5):
  dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
  media: i2c: lm3560: Fix v4l2 subdev registration
  media: i2c: lm3560: Optimize mutex lock usage
  media: i2c: lm3560: Convert to use OF bindings
  media: i2c: lm3560: Add support for PM features

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 +++++++++
 drivers/media/i2c/lm3560.c                    | 262 ++++++++++++++----
 include/media/i2c/lm3560.h                    |  15 -
 3 files changed, 340 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

-- 
2.51.0

