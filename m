Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877124;
	b=DpvpzV1Oe/cun2gvQuvYu2Qs94GyWK5Kt14xlW7gQU8gazi3riU251IJvaewfPsY6z6a
	 mbRmGI+1d7rQhEL2hXxJnMDfJ48LcT7r8HZYmln5AQeVpdx94KjpAp8CDADKAqCzCKcCx
	 bFNSauGwCbaK9O4MKLZP5CBURMEgepoG8AOY2MuUg/Cwu9Fl8WF1mdpDosEgBw7JtQD6C
	 ScpezYzVb4ZmoAzsWyuStCnFaWrIUAfPvgnLnzO0jTv8WYgCARig6okQNcEDE0MKOKC7O
	 t11RdzuTvtEbR6oAlLp6y1+GtoHVdD3AA8TyLCHjzOvLsLrohCff8AM/b7hjcCXApVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RB/QFiAwZFPgogQWGkL0l25DXALwqoy/QmskzaMu3fY=;
	b=Hex6HEX9RbID+0nyBc1NhsP82M9u0CBFTJ3llAg+hT3XvWVeM9SgilDyj8yVT/GB0KrI
	 GIJU8CooURJrv6Pt84lNgknhjkr5vmQ4JQc3u1T8PP9OnkYhmdyPIi/oVEnnrN1OYX/Xi
	 KU/zlzAKr1t5WzRBowVObZcNmL37EIB5ti/rNsDcrTgkWuMVubId1kEeWQ51wjzBkJAEg
	 3YtE9tfEgLvmyVTXM7OzpqLy1c5kcb5CQeg8xfh+uTn0fdaF4a3wuEv23rQ6zsZ8mpKC8
	 jkqvN9KMNCg2krLg4e9Gf3AmyvVXNh/cQjsL/aYP+F9IsuAunaaKc2/F3haMjwzi8Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Zvgo6i15;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B43606A31E
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 21:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B43606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Zvgo6i15
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so14594425e9.3
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 14:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792877122; x=1793481922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RB/QFiAwZFPgogQWGkL0l25DXALwqoy/QmskzaMu3fY=;
        b=Zvgo6i1589cIQqIk1mSPjEk9cn89c4NbZ3U8EmUe7UMtPnDkn/IB4x3IlE//XsR47q
         A4Hp6Q9geaXji2lWuUS9eTVjtUaIk3AhPl3Glx0wam7vcVdRlXHKtxXN0XBbN9n626ei
         4BMSKivumEOIVuu6PP/FPuIiRnIdNkTICg/UUDy/VfBbO3PcBoU9EYnl0SstdOvb7G+a
         2HXT/DHEIdOXMBS2IGxrXwDEQSUFnyu01doDpIiKZprnEr/DlR38bfGr7s/ymjXs8oo0
         L4ofMdhONoeyLzNJps+vsNDHggxQp7T1TGQdgB3TdfHgMNe8g0okSwHbjlehL4KmGEpz
         RhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877122; x=1793481922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RB/QFiAwZFPgogQWGkL0l25DXALwqoy/QmskzaMu3fY=;
        b=WBqY2dD0EQ7RWgF0gXc0zsFepRSRPwkYy3qi//Ga2zrFgrWh2cAtofGI3Ab5lj2gxl
         JoH0tL3Tari2L1Xap77TtHY2/RzIGYGWhLxnrT43dpS+0jk5VzibuJ+mvBGZbQ6VycWl
         YanTRDOJ5b0TrDiIEWe9JN94SRsoJyJywzIKLpCk4IUtRdZ0FBCXwfMdF1iprWQx7/fV
         BZFkRT0278WlvXWD+uzaShLGFkBu3JP5bhQoRj/5pWRocfzfL7qyu7n1QTdfktgsA8z5
         IEOunldjN9PwyoeOaevHl46Hnz92D8JFGNkzyP7p9qcnbrNm/fWqstv9gY/jHorwK5ES
         fUPg==
X-Forwarded-Encrypted: i=1; AKwUvBz/soJR5LzBAZcjghCIuhbsBKDhF21NReHtHoSavw207bcycRRj4NcAW4soeJft87yxUYWyTjYTf0yI@vger.kernel.org
X-Gm-Message-State: AFq9FYKZsUzKTEBCrG1PfIgY4/sUeMNmmCYDVCsKY43OWA5PWVcKRCBs
	WVNTappMm1B920tQ0u5PfbCBEhyi3HUy1DiyRb3sJS5CNzEjY/PBLch17fQQkrJGQ0k=
X-Gm-Gg: AYBFou10h30Xlqr4DiA3D4qSxxkwcf8zVkG4LPBLOz3CkdGh9nw89fiLePmMZhlWosj
	i8u8J1NlBulfDZRhSKxZMQ83Go+Bvp9yIMifPjGJv7dU53HW2X4G+huufarM1RjYY9tP0nQ5uQE
	O/Xros5Iyyrfqqzw3qGN5RVPhtOoollhHGjdIT5ryXXFjCNOT/iuciwxCnWSKHRa2B+2DgwPwQM
	klrg+aZZRqMpu7qgc37i9yB10HQ8pRve2f+zvhyOFENKJRI8pRGc3p28JrVD+a/D367a6t6bRMn
	TXdIO/TtM2qttXuoyZ+QdvJEmDw9RrptYND0ATt7gFdxXNb7y8bt+nFUeRNjTXrSX+1atOELAHh
	2Fn/66D9TdmqTkP0pZLC3THMNnzCh2JU+td56+5xtSykJuPY3ho3RgaprOJFTM2+oNOEuIk26Qy
	LtZC41fPSLb3eKUX7zeQGhGTvT0Bc+PlKYWtZOAlXpP5MzKyQPie7uBBN2+7ByCgYO+N3dyiWCe
	90H0URdyTeYPFiwNmZlC5Q7tHtk8dDWEbnVwrph+4NKlcTvx681tn0HRp3XsCC7IMtNTX0hcGyt
	Z4MpsukzC6Bi1DRRptZjl7EYQu1oy+Zxli7+CgFgo2WlkkrKc2yRHv43LlfUoag8g+CF2F8tMA=
	=
X-Received: by 2002:a05:600c:6289:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a35ac9f52cmr43172355e9.22.1792877122133;
        Sat, 24 Oct 2026 14:25:22 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm79597135e9.15.2026.10.24.14.25.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:25:21 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 0/2] i2c: jz4780: Program the spike filter, add the X1600
Date: Sat, 24 Oct 2026 23:25:18 +0200
Message-ID: <20261024212520.91401-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 said the X1600 moved the SDA set-up register from 0x94 to 0xa0. It
didn't: as Nikolaus pointed out from the programming manuals, SDASU is
at 0x94 on the X1000, X1830 and X1600 alike, and 0xa0 is the spike
suppression length. v1 worked by accident, by writing the set-up value
into the spike filter.

What was wrong on the HiBy R1: started from the vendor kernel, the
filter held 116 APB cycles, longer than SCL's high period at 400 kHz
(102 cycles at 140 MHz), and every transfer lost arbitration. Setting
the filter by hand before single reads, transfers work from 1 to 100
cycles and fail from 110 up, whatever SDASU holds (1 to 100 tried). A
cold boot leaves it at its reset value of 1 and works.

So patch 1 programs the filter for every X1000-class SoC, to the 50 ns
of the I2C specification, and the X1600 needs no driver change: patch 2
adds its compatible with a fallback to ingenic,x1000-i2c.

Changes since v1:
- Replace "Add support for the X1600" (wrong register) with a fix to
  the spike filter for all X1000-class SoCs.
- The binding now falls back to ingenic,x1000-i2c.
- Rebased on i2c/i2c-next.

v1: https://lore.kernel.org/all/20261023081452.44118-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  i2c: jz4780: Program the spike suppression length
  dt-bindings: i2c: ingenic,i2c: Add the X1600

 .../devicetree/bindings/i2c/ingenic,i2c.yaml         |  3 +++
 drivers/i2c/busses/i2c-jz4780.c                      | 12 ++++++++++++
 2 files changed, 15 insertions(+)


base-commit: 03a5cffc818695157414456dec695f7c30b9ffff
--
2.39.5

