Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465583;
	b=g2y4m4bpw/iImhiJOGSyi+CLNF+xf3WLCHw9xKdaM3p7FAdCObiKEmklTEQj0CGqTmL8
	 rQnC4su+TACQpUHbSOyFKkP5KGExYzCFPqQSNKlHXqRE4IkYmoBb0QHOZ+0D6UBrbgHeg
	 qnJq+a1K4KQDDt9gDrwF0k1kqG8dfCqTBwoQ0wH5oHrGcl1+qCAQ+XUCIoYZDHtA+j3t8
	 KW14T2ZTYLdKCmbbFGfLAON/tuaSxO1BZfjBoYfXXOGkMHtiU0bF/ei24oFDafu/JuwSc
	 eTkyKgvxXHBxT8Uk2vwMwV5RYBO5j77oVYEZhvXIb+3lJZ0b/tAXeEpMKK4WdIMhEFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Upecx+X/9IYkl/xM9lhnS9+bzajsmI969q78+kC9B7A=;
	b=VnZBkDGhsovUXGE/6qBuRcVaKAGEGN/O999gSlkykQkX6mQEEmOs8Cg4tE2M4mgEUiBy
	 p+8doOc1VppBz1GhOo47KutFXZFEewUYB9I06nifbW/N/gFTopmvpCeAJVs3qA7ItETJ4
	 rP3JZRGyW5/uDc+z2imZOBCoIO/caeB+DJcpF+xbKvknu9O/Nb7ok+eva/MJ2OZcGrpjd
	 5S2icxc7e5vsJePFy8cWyhZ4QdkYpXjcXDMjPpIlB2l8bUxj7Mw9w+20DwRVato3g6qCD
	 kJpVe/RuwRWWJLMRUzz9il6JJRxRj0PvlvCkPUfZ5ef0F8/p7dHwtMxSwLBOdkSs0zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b6V7vY+6;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5185606A330
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5185606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b6V7vY+6
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490f38e9688so2641811f8f.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795465581; x=1796070381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Upecx+X/9IYkl/xM9lhnS9+bzajsmI969q78+kC9B7A=;
        b=b6V7vY+6rwZ+oeHCGn712eE0DPm7e9WdpitttblvNBO+zocl0I7NsaNXqMP7lRxAtC
         oyi2aHqXACp0d4X+FSwZhi/nQutuP63pZYuA5DMkytQjGRxJnj8eQKV+253Mgnpr4JXD
         GVJQ0gWwLpbp0qkHWAVGHvM9eLwx/1PQr49XyvFZeoI+iHMTvO39HdFnDj/E2ighaqf3
         QXd7Q94BKD969uHAxueDHk7T9ItmGHlx8cZ1KAE9YrSsxZa50Ue6ZZQsb+Bh2+8dzM4v
         EL8KyGJsh8kGKK8HbaoB4jWQVvyxliOtKvcR0GoeCLiKV+cy1iU+4Ml3BOkIFgz8+AI7
         KynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465581; x=1796070381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Upecx+X/9IYkl/xM9lhnS9+bzajsmI969q78+kC9B7A=;
        b=HndbQ5zo6mmoSL+nhClpvoNQJVLd3kKkOTUWZj8cCWvdqa+/LVhMkgMF1SLEHNfv5J
         jKeF5o8VLDgjbKHZmWsow9ll4x+TJja+I4mtMLKwhkuCg5iaKHqD0ARupETOnPRsQx7T
         Myi398hJDI/Bpu61teXp4QgWHCBjMhd+Wtcx77REd5OJpvXuqcEOmgwmVo1J4qF0uFIO
         z83qhpjZZdhDefgGtC+Q4j5hnM4+t1+7DBsZGzgJv/oUd+Mrb6AxRoFr8GthHm/558PR
         vz5nYvyTxCqHSMtxjU5EKA6H2wnhKBlNXNbwZmxiU90Rlrss7PV8667UWZiXa+ewtWkL
         tlrg==
X-Forwarded-Encrypted: i=1; AL+hErGIaf8TKIwcuW7a5Bg3SOq3ccTy6UXbHNroWOVd1jyI5zpW3yJPk32VKBXHYhxO/NnqhsdWgpoSErki@vger.kernel.org
X-Gm-Message-State: APuU4Z/dR/cUQfDPsaqVoQNgo/E1psSkriD3GM2tDIU2EZy+pluWfWiZ
	gRcpYf8CsIH0ZSNmntBJsQsbcNvJyUALdzM5++Tu+a9LxGxRRCGx7Yz/2WGk4mFzvIk=
X-Gm-Gg: AZFdTZfK4dPLGDKMC3vOocqtCdKlaRalLfdDnEHkUpdi8NXVSXLD5aL34OYDpRejFcY
	HszH6IBhFH2U+pjWX/uIQ5IizLPTQPrT3XU5cACj3T5P3jAatyNTbjOD9vK9SYSsTKtHloCyx7E
	kmkXEo1PfhtixFm5I6iv5+Ghf5/uhquj6r+xAsHE74cL+JjJPZcvddU94NK8heLw+hxed/VtxRq
	8wjxAbehEHWRqFJbBPVyUNMGm6LheRoq8RHCDlihc7npGDNf9LF6F302SNGiW6qz2VoxwtaoBd7
	ODLDeJvnosS6WtoqZlxXqtoXUwAS7hCUBERtvAiYIlq2D46AloSoXS9GIU7uNFBKOAP3pk3YN7u
	r20Thn2p/1jPVhNiIRryx3FkRtfxPtGL0QLmsykSGy3X36ibjSBAPwkBi7vs8RG7pB9xAGSDvAn
	/Rea7xUUDTl+cdvBpJ3admipDZFhcK8olR+T24+LsEcNHiZFE1LT/giy/fblj4dKEVOmSuuxNHl
	TWhahNAV4H7epyufVb3FQpbBd/ZhAzuYdSwPM0vXT5JyQwGr7SiMR3AHG/r+3CUYnx4AOQUyzDA
	zm1HvulcSRd4f+KVGonzbMnw7vTVZ1oYQiCKWPLNhpZZInnXtw377EHUPQvKtys8Lk/ai4ekF7R
	lIAmP/iQ/uqw=
X-Received: by 2002:a5d:5d87:0:b0:4a3:2ac:26a4 with SMTP id ffacd0b85a97d-4aa58527c76mr34549229f8f.23.1795465581118;
        Mon, 23 Nov 2026 12:26:21 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm20108713f8f.46.2026.11.23.12.26.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 12:26:20 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] iio: magnetometer: mmc5633: Reference the datasheet for the SET/RESET wait
Date: Mon, 23 Nov 2026 21:26:13 +0100
Message-ID: <20261123202616.17334-3-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123202616.17334-1-gerard@teslabs.com>
References: <20261123202616.17334-1-gerard@teslabs.com>
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

The 1 ms wait after a SET or RESET is tSR in the Operating Timing Diagram
section of both datasheets. Describe it where it is defined, with the
revision and page of each datasheet, in place of the comment at its use
that pointed at the datasheet without either.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index b651f01e1b5d..92a09316ccdc 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -63,6 +63,11 @@
 
 #define MMC5633_CTRL1_BW_MASK		GENMASK(1, 0)
 
+/*
+ * tSR, minimum time between SET or RESET and other operations, per MMC5603NJ
+ * datasheet (Rev. B, page 15) and MMC5633NJL datasheet (Rev. A, page 23),
+ * Operating Timing Diagram section.
+ */
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
@@ -144,10 +149,6 @@ static int mmc5633_init(struct mmc5633_data *data)
 	if (ret)
 		return ret;
 
-	/*
-	 * Minimum time interval between SET or RESET to other operations is
-	 * 1ms according to Operating Timing Diagram in datasheet.
-	 */
 	fsleep(MMC5633_WAIT_SET_RESET_US);
 
 	ret = regmap_write(data->regmap, MMC5633_REG_CTRL0, MMC5633_CTRL0_RESET);
-- 
2.45.2

