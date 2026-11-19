Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096492;
	b=avWiGK/WSQ+Dc2eZA+UmeKFB4fop2ID9cn8ADD9FXpMjQfGC/SSPcNzZtgnlz3SQptQc
	 NkfaDW0jktIZnhhUb+5Nbrp79SiIsO6PGxTMFaUR+4oIoOSg0pgUYMizaFioOGZt9G14G
	 FUoDgNeaQG1qykd4l2jVOV+bgP7ciGau/eZJ8PPNc11ctZkLHqT32X79d5T1wbsQigXrf
	 q/XR0XOPrgfYVi/n28t8D2OIPzUzhf36R3UgSz9puSt7ZR4etzoMXVpuErij7bvWogVzt
	 vmjp87GTbYqia4796S0XYZzybyyiug+XUf5FbHAsB4gEsOO0xRScu8HOKjKVkxPm2+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fppy/ckcexGy49EMxxyWk/oBKj2HMd7yOzhiBjOklOQ=;
	b=kCSwNpz1YlZTQ9g8lzBLsTO6oA02U99Gi6R2n4yCy/bT5bVibiqTBSwLf3SQoSldlhSs
	 9IijE6W/m3/4NDn8xG7MgInNNUEdjslTMfMyukU3JY1ZVm28T0B3ROTXPEWOK30OQIbMh
	 TEHpgFtS14f/sUZgYQNmrZka9peFSSUQPlBcKJQ/ixGUCA6IsKuO+ThgBUMqwhj6/3USN
	 wRto0RosZzYxV7ehZoHQ3v4YzFj4HJIAxU8JxkxnCiTcafag56uME1YulCnAEZbf3wxdw
	 fGZ24nwJs8MR7BZ+1Kc+1KDZHnB3jDv4eFpiSdjJojWVveA1Rhr23jaO8+TKlI4Spqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=w3utJXtL;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3422160A2615
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3422160A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=w3utJXtL
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c511c0e2826so210885166b.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795096490; x=1795701290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fppy/ckcexGy49EMxxyWk/oBKj2HMd7yOzhiBjOklOQ=;
        b=w3utJXtLjz8WlviGNw3pKMT/CGBNJtTtd3syRAvsHEgRWi+Ay4c1Ka+9b6f+wbiEJx
         7IpjqMsocZCGnSjjoqSBYrwD9Yffb9b55gQQDz0ihTZxWkwIwJfZjEDWOzkuaDjHdT4S
         Jco1rvwu9lQHIC+W2qA84dhIdpKsMJ44GhKrMAzlY3ztooZndFXS3SaPE/w3kXMA0kID
         RR7xHoJWUQmpqX89CMDEoH2k6f+kmA0h2XC1G1vNuPxcjd9aV6swEG1BgvDyqOax+gsH
         9RbQRwM5ccTGbAGBNAMq3FC4bTa74zbqy022X0IW5gKuJUGr1hL58PJlRJgXWQh6+PYF
         RU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096490; x=1795701290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fppy/ckcexGy49EMxxyWk/oBKj2HMd7yOzhiBjOklOQ=;
        b=pymSquZGsaUsJLstDK/BQeVckWKi+RN7dJc7FK1QNK2GPHz265V9fBzpVmA02rjVZZ
         LWrNswjDzRsO32Z4b/cj/nnCN4l0XeIfGScyAuTRkVG/Pi/w6p7wjlqiwcKdksl+VQeU
         PaOFvMptHtpYXblav7prb22Ml87yAB5Kx5aHzfvUpZp0x1RI4C3pksQtq+11HaPW5ni4
         YxltWzJvV3Thysm0faZD56hpdjCsTaD28ZCApZZSXhlH+dwHhmz2AArDNObCm3k1l4Ha
         l+SK8Pu0RSMqkfRIEx3bztiqh3bpO8GtwX9vnzqlOtn81rnUDuIg+LHYP25m3gmiDOsd
         vvjA==
X-Forwarded-Encrypted: i=1; AL+hErFup5BxcaTTO2YTsaCHAxFLlcdNBv1LcnzSrNL9BxfJFqRej7AwY7hWtec7fABURSruINtnV6awIp7l@vger.kernel.org
X-Gm-Message-State: APuU4Z85e3TxGm0wy3KSqLnkC0nK7ZwCEFkgqREx8oMfqXH+Ph0Gt+U/
	F5yHFBXk+4K9H4JHVAlDBvSgAhckn2x/9NRJxSj/9KX6fhM/9eICEQDLFGx2XYdRqxc=
X-Gm-Gg: AYBFou37Gx4phi4zVoLOziEBlhjXk/j1y6/Tx4nFsHCliV5oKuNCyQO306n3FnFpPHL
	sI5Y/xJuvW6m851Fw974exTg0DFOxh1ePDWp3reY8vKygkb8cWHyfQoKUV0swJUX0AIJ6FqEFp0
	hvPnHPfQWRHSfjwhS6fpyr4htbVTCrnc+WI2HKLUdtJ6KQtJtPqPXODhu3pap6VZLAwQuVfqIcb
	we/L8DofloDhcYLhK2cgFUTgeCZu3Wuz7GT13AfMdW9dGmJRmi7DC5ln7sxE073RUOpaJl2COKH
	nVZwQx0F2dxKq4RRuSNU0ybpWtLGRPEy3iKfQ8TUHPNVrmyZXZ4U/J3bPjsmwEbnuQv36KRIuQ/
	qzQvjgl3Z80538gvE2puzO2Ck2hG7+g981tcoBZCET9K5DcZ5mQceQxkeTZ2Mf//QW793O9TQ5d
	MeAzFxO6h2xFyXBDJQcVn/RiEqJNqgHIaibh82l+GFbEQW5RwbTIRfK+Ol9crYPqIIaqM1WAFf9
	lNzD/IuZIEGhwpFtIhVTQIeSc2EsakKF07INg1KjAPQozreClnA3m/zduYiPB0A2s6MyV6SnDeu
	QXBbwDrgOn65ksiy+sdbAJSvwWbsX3XhVZ0vb4TpfVin1T+HpNlExxN3wiVOoIAk+FpmDEbb9K1
	dfmk4TQVrEhZuYe8FQDJ63NHLdLaCvRj7hg==
X-Received: by 2002:a17:907:3d8b:b0:c50:5005:8ecf with SMTP id a640c23a62f3a-c510e0e8be4mr548781466b.8.1795096490646;
        Thu, 19 Nov 2026 05:54:50 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d02sm106820266b.21.2026.11.19.05.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:54:50 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 14:54:48 +0100
Subject: [PATCH v4 4/4] MAINTAINERS: add entry for AWINIC haptic driver
 family
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
Message-Id: <20261119-aw8695_haptic_fp4_driver-v4-4-9d107334bdb2@fairphone.com>
References: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
In-Reply-To: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795096488; l=946;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=vimJ88gDAgrMbKiMPhlbLbM+XfYfImQrayboZz/gmXs=;
 b=4iAQ8jRN9EaanqlLNr+Mw6FTdAkGkFADKZfYNJu5jVU+OembBmy98dT8T5qtsaAlN2MVt79oH
 Bp09DN3IME5BvmwdcoH622KkaqIrLWbMaEzyCRu7Tl61FprnnvWFwBt
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

There was never an entry added for the AW86927 driver, I will take
responsibility for my creation and maintain it alongside the other
drivers in its family.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ca1c59e1fc5928b361a63e0b7fca6e95308ab8b4..f138ef76fc5cb611fd56bf1d2bd808985a4567e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4541,6 +4541,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
 F:	drivers/video/backlight/aw99706.c
 
+AWINIC HAPTIC DRIVERS
+M:	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+F:	drivers/input/misc/aw869*.c
+
 AXENTIA ARM DEVICES
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Orphan

-- 
2.43.0

