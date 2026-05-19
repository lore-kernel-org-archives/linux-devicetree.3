Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB16439D6C8
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184829; cv=none; b=ngMNsFDkwl6FSGUySsjc7/Vvx1WVtYnUNav0b7ana6tKmk1WW+euSXo8TVz8IcxgKnXzDM7bOPOCeIcWJuuTdbhgf9lS1HP5/LaqjDH5T1ljyfqdRQIc+ruvKQjSrsENGh/Z2a5T95NjSRADZ4DEBTyS00fAQH3cNnAeJjO1Zbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184829; c=relaxed/simple;
	bh=Z2cv8nB9Bo7eZRD2JKwwYfhOOJYfZGL2ji6ed9VXFpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/1ZTsTSQedMDuWIgu6LnyPx2imiFko/gX10Mi0M1qqM5x/6RZ2+rvWHw/LXUXCk+v7/7YWf5PJIrU5ypsgd5Bvh02mV32JOri2GgH9H/SM/n6gwU6W6XsoGGRt5uILU9+/DOqhtv8Mqx0b9kKyC/EGRJnGxugNLF9rpGibLpyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPHgXDBY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPHgXDBY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so24624475e9.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779184826; x=1779789626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gPMXDUV8ksnki0TYxYEX3U0Fj0wzSQ7y1+fTHl/YrAI=;
        b=ZPHgXDBY7XjeK57L8im+ZR98TvpUzebjFaPDMrH6vkI+6UeGOFDai8BlQVa6y8Fkg3
         eH6oPY5p0cmNwZa7Yq3uKM4DB/f6qt+xcvzGsJWyWX4SzrkQ7lFW2aKZVG6aOv508EaM
         eouf+4KsagbRrz6OcZOHvgevCI7OECQykOr3nkjY6u6fMfyRytHFWOc3ZxzvyrpQ0aKQ
         VUSIQ8N5VkISTNqaMsW29FMQgC/54RH+BqDlWTlKNRzlJXt9rd7tKzxiWuKX8ZDcC6/W
         UUt3qU999jNegD9XLIM9H9iHovCcLakDo1xZDhO+NoovEHoX+trTt1l4m0lgpRsFQfDw
         MAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184826; x=1779789626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPMXDUV8ksnki0TYxYEX3U0Fj0wzSQ7y1+fTHl/YrAI=;
        b=Tfd5f/G8XfJoOlMry1JtwtSJjTiDebp87JdxjPi2bvZRBTu+b7OTco1wM/1QxGH6Sd
         XKI3FaJ9+KYp+Uk7g6lYaWW0psRrO8nq3atdML5tWhg47becnd2FXBKc3enuph1ljsJC
         jcRqVbh82cK8uTyxWEEaNnHNvDTgxhfJQGeN45vqNgl5wy/4fmAYO3S5BO9BKbkyHu7a
         lmlq2p/5vrZnkpRkIMFu7KyLB4He3urllHkRJMiZ8ewe4BMtDCGFg2ywzMxL/flERl8s
         FADfdrhqT7r5ePFaSsoeDpfRj1CcqUdVCLCY7OyjDDIuNlnklF5ZZqZVNcyUApfGQ5Wk
         APZw==
X-Forwarded-Encrypted: i=1; AFNElJ+KQHowRr4xbfcXULl3a0k2Hd91HZ27XTHv1iYvTWc87kPja0QUkiTTAP+QibUgHzQz4/lc4RXikbxE@vger.kernel.org
X-Gm-Message-State: AOJu0YywE8EmHuobJEUZA2R7peoclk55EdPRgKwVnjexZI7HLr6d3956
	q3GkAyDM2jgjAsfJW853HMR3HN+3YJkxoXUScnIHYCEaWRIDbXlzZD2x
X-Gm-Gg: Acq92OGHrr8BQxAc7Dj+Y/tn2HuH2Xd6rVuUD1N5WGAwEWB2gHnU1FOFhhZIqAnBbpf
	5KoTENQOICHFKv/mqt2z1HhmV13+pIZBD/akBlIWpD1TCD3s+K1nrhNeBysgsk5nDm/7D3Qks+i
	ciOd7+/gbauIfhPgBjCqOmnN8sY3k3/17lUBcaAYhFRQiOj5HGdz18r9HdWorJIe93pxRA8w+7W
	5biw6rUHxtYSrW4/tu4P6EF28/x8jMd2KSDudt8RFfx2jkHa1xWgb68wnew5sn4klHxnkVQ+pEv
	LCANG+b8R7qS61dtrVm/7xAMnzhU68hAL5JxChS9N189h1TwYREI2qXgy75O/qWNnNDCvWG1t+r
	RhxNxTTpJrnJwz5//lOxb+DnIKv8B9MGKgxqA8jmosDOVxl4MqF9NNRyAFqCpYkvQoGMXvglDO7
	FAg5rQEc2YyhoRltcIeDYQFJqY/4if5KLMgJ8NxxaisH+h2yXs
X-Received: by 2002:a05:600c:34d4:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-48fe6626a58mr296997035e9.32.1779184826098;
        Tue, 19 May 2026 03:00:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febc56f89sm131791455e9.3.2026.05.19.03.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:00:25 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/2] Enable RSCI interfaces on RZ/G3L SMARC EVK
Date: Tue, 19 May 2026 11:00:16 +0100
Message-ID: <20260519100022.116318-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable device rsci{1,2,3} nodes for the RZ/G3L SMARC EVK.

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20260505123708.134069-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  arm64: dts: renesas: r9a08g046: Add rsci{0..3} device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Enable rsci{1,2,3} nodes

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 84 +++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 59 +++++++++++++
 2 files changed, 143 insertions(+)

-- 
2.43.0

