Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792877124;
	b=CsFzgmAyXz5ew0HpFVmn8dISDnXma0IS5rcNumI0hX/V9m7UogHhO6A6gqQ7vP2CIQKw
	 2EEnMZ3r2F1t/YEZOioV3RUuUc7YDYIEY8J4XdPNAOS4EMM2/JXuFb4fRN48Hci8t3MDt
	 EwzAXbqRqzg2xBT6xNd0Bi7Ag51n9V2RpGW1qob1ybe8i2VPLQe456ug1OZO5sDRBo2bQ
	 nt7X6/yEeNZKA1u2xxD/5d5+H1vBHdfbxQ4kKXZ/AW5V6fxTeUKRTLsJ1KrNwy4GB0Vkn
	 biAmnzSIey+07Kmw7Uk7sJbRHNN2n8XpsPBjQAUjTY0G1/dLZPox4QV+JbsZZTnXFuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792877124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nGZIgux4dcF0wxVmKrgwbkWNzR5F3QBaO3xEg5nVzkA=;
	b=mYrGuQjETAJvUhaeL5SGqmpubsmciZtyobYXe2aFPV46JI1SS4zO8f1MVPLSxoQM/Avw
	 82HB7ybUvFH1HxY6NhaCTLJEIwFrmsMvmDT6GS/odr88xxx0gh0oG0wCH7mnWDxuak4K9
	 N71kEcQBpTtU3Xzq9WeAdE/n5BYn5fMEbmc1Dgh7DwfwVtr5JUgvqmBEiOOlsEHgdYZur
	 Cz9cYeMyKjNuUxw5QHOkw+yMFNZFBcuyCvbrjUAbCZFS6OO5BPBRPlrOcIdBw7BNVTwJI
	 rla1SkNklU8sjp/asBLt86guYr68TOye1Sbfe1l3yRe7chTFyLtvBMhPphGR9ll+soA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Ywz6jNWt;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC3B606A320
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 21:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC3B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Ywz6jNWt
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a215e64962so11976345e9.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792877123; x=1793481923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGZIgux4dcF0wxVmKrgwbkWNzR5F3QBaO3xEg5nVzkA=;
        b=Ywz6jNWtzsxRtkyFVBhZshPwrQunRMgUPILFsH9evTboAM4skABoL/yKaEo5E0o+tb
         xAOll3XcJQ0vKhHihRUGQ9EE+WJRcspfcTS16eR2rf9W2Xq7bRyS8PGHjbDfaeNwfgH4
         j+GS4ApmTH2N3Y5F7Z8RtqhXrJ6aQMOj6fMBu2PZXsetcmZTcl49d3WO1AuJcxueokHr
         AdCWEGD22+1xV1Q2b44q5EYWs91G/CnZVa+ZKJukfEt/Jw8bIdQtl4VjT1XGuH5oPa4c
         FI8JypqIIwpUQ1LORLO3eE8dMNrthJdc5qJjS8sffwuMx0YrrTGDPF3ZfWfEkz8gVL8r
         dmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877123; x=1793481923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGZIgux4dcF0wxVmKrgwbkWNzR5F3QBaO3xEg5nVzkA=;
        b=AED/ynbDyuJTBe5ZHUiurL4rkmOAvnf6FHniIXQx4M6A0jhgZ5aAzDt4o0CqShKYbB
         Y2a02f5WvlW3brKkIahozACKRLkIya0COMGKL47Y6eJblceT7tzqt//w+JrMdxvoJQzd
         FkCvzaHDF/X8i0D+sfsOFvA8+dlb6AiAHndJjloJYmp6kwGkllO6BFZDKBNWohR//yCy
         N5nd7bv/EzXY7WnNuMdYMqvsxz94a+7dX5NtRYPW6SlRshkP2ogKxnJe3klNIl8eNKZy
         dnKOhf3uOF/Mk8Bw3otz3gk3ZGPPP5p5dDS1vst7tBRrgh0JxGhUO517r/dxkWwpt2if
         FdaA==
X-Forwarded-Encrypted: i=1; AKwUvBxAPbm1jc93J/CEboxm5fxr8OaRFnBbdpUtelvPAziHbF2OGSF2+4eDDByHL7FrMPqWf6JhUnezCl2r@vger.kernel.org
X-Gm-Message-State: AFq9FYL0w3YEb4uKhO5C1H5utXzu8FCyVbB22F2b6JNlEQvGzpr7ny6p
	kcC0rJh5lxCjCKcsZfWzm4VQ1jNBLOn/DEbhKW4PazaLzmsWDrj8M6Tezh09USzYTe4=
X-Gm-Gg: AYBFou3Sfnp+O2kdTqMRlJMEIVDHdV1T/Q1SIzrl2OKWWI0bQsKyAW62kae9C2JBSGK
	5JIBKpqMUn5vbWhScclDKES4yiga1g09Aoq4JJ5N/j4cjfbWdPIQUC/YblVK87mPRL0ouBj493x
	iHPBcQ7B5hClxsz9ArAD8MGr8ltBc0uYAVCFyYYY/I8DmTX0cVcVGMkRBS9P586H6AQdqGAn2n2
	U/6yxg/M+6yDsyMgpC5kJ+/fHKNe4E9khV+QFProMu+I0MCe80PTgx5VisvsQj5LhUQrDB9CDyM
	+ux3OOd8ZEyqJcqmJ5yZ9PUw+q+JqEEeGRDDXZig8DuvdB6gQWaX/qS7bwHAHbjoJedgdr0ERRH
	YKXdQp7fBJSJWJ16U3/114Ta8v6J+QYrApbF0kO88kuyJM/FU0XCX0HrQCqEgtgSc9YtwfhJxl7
	I+ApU++j9W5jrP7kMxNi9ScvlfNQwOi4lGxVnelh83dhq2eQ3b1Vd3nBZhPTMPTC7GWwxwvfnZG
	alnhPVMzhplyjoQYlfMHOs6R29nHamD16kRN/qnaqN/b3SZAjJkvAIK4atIdaK4eTlpxed1FNss
	uq74uOAkViJ+fUK5NMUOYdoCgA/YB3S4aMRPkDrXpNi35gC3SkE69Qf7Vc7T0sXTC3uvJpoIfyY
	51i3inTE8ZZRt4v1BzRQ=
X-Received: by 2002:a05:600c:a00c:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4a35aca4b9emr44250765e9.20.1792877122809;
        Sat, 24 Oct 2026 14:25:22 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm79597135e9.15.2026.10.24.14.25.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:25:22 -0700 (PDT)
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
Subject: [PATCH v2 1/2] i2c: jz4780: Program the spike suppression length
Date: Sat, 24 Oct 2026 23:25:19 +0200
Message-ID: <20261024212520.91401-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024212520.91401-1-olivier@mgcrea.io>
References: <20261024212520.91401-1-olivier@mgcrea.io>
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

The X1000 and the SoCs after it (X1830, X1600) have a spike suppression
register at 0xa0: I2C_FLT in the X1000 programming manual, SMB_FLT in
the X1830's, FS_SPKLEN in the X1600's. It holds the longest pulse on SCL
or SDA, in APB clock cycles, that the controller filters out. It resets
to 1, and the driver never writes it, so it keeps whatever ran before.

On a HiBy R1 (X1600) started from the vendor kernel, the register held
116. At 400 kHz with a 140 MHz APB clock, SCL is high for 102 cycles,
so the filter hides the controller's own clock and every transfer ends
in a lost arbitration (TXABRT 0x1000). Driving reads by hand on the R1
with the filter set to each value: they work from 1 to 100 cycles and
fail at 110 and above.

Program the 50 ns the I2C specification sets as the longest spike to
suppress in Fast-mode, rounded up to whole APB cycles (7 at 140 MHz).
With it, the R1 reads back 7 on both controllers; after setting the
filter to 116 by hand, the next transfer puts 7 back and 50 reads out of
50 succeed.

Suggested-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/i2c/busses/i2c-jz4780.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 695be3b21460..d1bb75d9a102 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -58,6 +58,7 @@
 #define JZ4780_I2C_ENSTA	0x9C
 #define JZ4780_I2C_SDAHD	0xD0
 #define X1000_I2C_SDAHD		0x7C
+#define X1000_I2C_FLT		0xA0
 
 #define JZ4780_I2C_CTRL_STPHLD		BIT(7)
 #define JZ4780_I2C_CTRL_SLVDIS		BIT(6)
@@ -253,6 +254,7 @@ static int jz4780_i2c_set_speed(struct jz4780_i2c *i2c)
 	int cnt_period = 0;	/* period count of the SCL clock */
 	int setup_time = 0;
 	int hold_time = 0;
+	int spike_len;
 	unsigned short tmp = 0;
 	int i2c_clk = i2c->speed;
 
@@ -356,6 +358,16 @@ static int jz4780_i2c_set_speed(struct jz4780_i2c *i2c)
 			jz4780_i2c_writew(i2c, JZ4780_I2C_SDAHD, 0);
 	}
 
+	/*
+	 * The spike filter keeps whatever ran before left in it, and one longer
+	 * than the SCL high period makes every transfer lose arbitration. Use
+	 * the 50 ns the I2C specification sets for Fast-mode spikes.
+	 */
+	if (i2c->cdata->version >= ID_X1000) {
+		spike_len = DIV_ROUND_UP(50 * dev_clk_khz, 1000000);
+		jz4780_i2c_writew(i2c, X1000_I2C_FLT, clamp(spike_len, 1, 255));
+	}
+
 	return 0;
 }
 

base-commit: 03a5cffc818695157414456dec695f7c30b9ffff
-- 
2.39.5

