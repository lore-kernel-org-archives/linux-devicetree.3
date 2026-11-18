Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009591;
	b=1GnGqik++C2nna/8fADebHHhoUjZX1BGjBexJr/K6Y11x6cHvNOAHliQsYsSFNtPYGjV
	 LlOtEOtv0Xz5BRSEbLHYqQ5J3QqR6DmNEZx8rWjDdFobKtOSettddvYi2KOYoDGUTqehE
	 OyQlzqEGN0zLz2fJxwfm92yWMlnwOfFt39L9IQQQuwvIC+bYB9UnlFdXIC/i+R+CWBhBu
	 KBbo3dq0Js7wXs8EBJAIIMowfS8jfPmx8gSLoZIeyOq2BjTrmH+tC0uSG+YT9P9zMtq6h
	 0nQImWH4DQQM9w5qcPTeJQYLkEHWwWXzEeYmEJSdajH4edgB8ft4kw7ooSFmB2wfTIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=r5rkylK0kmxNPJjElKiNQWgQc8hm3aYSqsTEmAj7cWY=;
	b=vuHlH0xERvMD0346OiTUdnj+QTWuxaEUZ90KzGOPgc9dAQMgp0K5sR3PdfOAo4+WQxxr
	 lVXIkVZnpCv8YxtvhGT6TxfMrFvBaZ7AwUczqIXtF9VC2JU7RpHToXdr61pNfFH8JNDOS
	 fL0vzSeSesDvrnIoTv8TOwxlmD2ofFuhTGUC2jeZK7RtefdIQyi+4QfN2GVTRkpwsJK0w
	 cienqX38s7rXpUY09pIwgjr9wR/h3eJaQszeNLrPEVf5A6CmET0IuCppZOiahS3QgpkHb
	 boMRGcLts+Uq3zZcBDdW3bMJUw30BJ168VJz8xr6HImuhoH47V+Q9wp0/Fe8GV4Ih+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MXZF5KO;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09095606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09095606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MXZF5KO
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so421411566b.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009589; x=1795614389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5rkylK0kmxNPJjElKiNQWgQc8hm3aYSqsTEmAj7cWY=;
        b=0MXZF5KOwiqwOAzMhO7D4kY65eEcZmRgLYINH0+Lr2BNsVJSqQWl2rMOvgIJ8QC1vR
         sIDh2/aNdFWd43gznbGMcDtBaqKgndsJyYBp+bGq/RRh4yQlvO5+tE7CC4P/bHaxNJya
         VgPBv2HrHksg1mxF02hSenGYzVqRQHOqiqkuaOuI332dGM7Fk5qz/LKcVexiKyH/cXQ3
         5OinlWnek5KA0+87MSZ7+YSPJ++Oz623wWPen2LpLSInUtQEmW9IUU/uLRZyqZThNA4o
         b9EGShylrHVpMe8TZ9gZWEVCUzR8CLeybdFDIIEGfzQY8G2sXtbd5Wp0+aw9Ez+GTYwk
         1OoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009589; x=1795614389;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r5rkylK0kmxNPJjElKiNQWgQc8hm3aYSqsTEmAj7cWY=;
        b=NzDdeF3k3v5e5W//D8+kYCrW128IvchvRm9szsRLTCIUIpXPzrSWKhxgb90GsRK4w2
         dCinQiOch1knNo+H/icnTmBD9H5dZFdj8pjhFfjK1/7kXTjtpaia6gSVGT0RHLHK7Ayr
         P2LslPEI+DgUXxI0FZaH/Jwis/AQbti1IZxGuYeBPW5uUD7/qSscGvVJIYcZ0wu3BUEk
         aO6tkcXvYi+xQxBe2uw1ktNrjhjmxNV4jFum5pnez8w8lENg0oxcVDtaC26dLPMWI8mr
         4rBOPVyohfSvoCbJQgMVkcZi+WmeABuPIjOabq/Xvto/XRn1ELMFspd5BVUwDylBsxn7
         nzwg==
X-Forwarded-Encrypted: i=1; AL+hErFHcMIoLc3KXu5i/gxwMy3zpWcWox4KwAOlbMvnUUJDnwX5i9x/uomQjO4mnvuy9Nn1GEHimSz0kKUb@vger.kernel.org
X-Gm-Message-State: APuU4Z+aAZEUHeBGxhmwGKSeqz7961rgWKI6NflYhAu3z3vuDloD+zmd
	zy74FhYRUrI2rIChpQe8YccdHXeBbCpNbw3Ys6Yd2ASqrtQ3tvwWmneJ
X-Gm-Gg: AYBFou3SXe5BChLSiVoqXPUr0r2dESYJ7I8TE8y38g84SxCjolZarmiNBmO0WLyYd5W
	Yaq4MQNndSW8UZLZqtU1ntsFJ6vPW+6Q9lnuqySuzMkB2cWoZ98heYh9egqtvqlcmyrXOBIh+c6
	tldlweHJSrPTESmMGKYie+/nwuXZkWWvGjP3SNfY/IYiYlWtsp4LhMF532oXlQEWzEqNaZGsNGv
	3ulRd/JhsRz0uvVNmkOtJXvNL953GW8aavnMruRSgK0N3bMknRww4oweGkWpTnF+Ewv6DZmlmBM
	obh1I68jSrsFF0PeeW37ZUZ2qPKd6gvdX1lSxalumm7XLTw7TbiYnXX6lUEL7Cfx8Bbo2o8IPfC
	oLmow5eiLXG60+29AFgMSoQD/byHPG8W5s0S6m10Ri3STyQZCzUFzx/jyrynVP0SeUrlKOE6WWQ
	cGrvcI/Pmvz9HiepTS70U8GCoRWavE9Zxc95QEwSVDXGAJK0I7NPU5D++VyJxmEwDOsY8Tqw4Vp
	2TydK9X1HieUjQOSAWuujCnOd4gQIghzUWUswzNy9uq/3JYsOFG5Vhp1Ef6QujaNWaTAEV5W/z5
	NQA2SSuxFwpVmBfitYkPPFGW1fRt/dRZjn65RAwS4SeE6THq8eOQuCoqvV2m6MzoO6xO6Gf4lkE
	ZEx1gvZDXcA==
X-Received: by 2002:a17:907:72cb:b0:c50:8612:d441 with SMTP id a640c23a62f3a-c510e39c4ecmr254203666b.21.1795009589188;
        Wed, 18 Nov 2026 05:46:29 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cab33aasm95461766b.52.2026.11.18.05.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:46:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] platform/asus: Add driver for ASUS Transformer's Dock
Date: Wed, 18 Nov 2026 15:45:45 +0200
Message-ID: <20261118134555.195479-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ASUS Transformer dock used by Tegra-based devices has an extended I2C
bus where certain devices are hot-pluggable and their presence
is indicated by a GPIO line. The set of hot-pluggable devices must be
predetermined and static.

Tegra20 and Tegra30 Transformers have EC and dockram clients on this line,
while TF600T and Tegra114 Transformers have hid-over-i2c keyboard,
touchpad and EC here.

I have tried to submit this patch in more generic way, but I was rejected.
More details: https://lore.kernel.org/lkml/20251013060018.43851-1-clamor95@gmail.com/

Michał Mirosław (1):
  platform/asus: Add driver for ASUS Transformer's Dock of Tegra based
    devices

Svyatoslav Ryhel (1):
  dt-bindings: i2c: Document ASUS Transformer's Dock

 .../bindings/i2c/asus,transformer-dock.yaml   |  56 ++++
 drivers/platform/asus/Kconfig                 |  11 +
 drivers/platform/asus/Makefile                |   1 +
 drivers/platform/asus/asus-transformer-dock.c | 260 ++++++++++++++++++
 4 files changed, 328 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/asus,transformer-dock.yaml
 create mode 100644 drivers/platform/asus/asus-transformer-dock.c

-- 
2.53.0

