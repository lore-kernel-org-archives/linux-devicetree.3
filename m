Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F7A32BF5D
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149431; cv=none; b=PB/Ln5EcNYXt4nz1TCtsoTGQftGdsOYSTIRGbL+fSXeh8+1NOw+/iLYloJq8I40plSOczeiTRTaZxSQCpg5TJAGV6keHFs2Oy1v2v8lapsr/fdX7wDDnrKXgm3uWyw0eiILOeSyX2mK9XxJqq0lpgkrdzDCukIj7IFSZNsj46b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149431; c=relaxed/simple;
	bh=L4c/C8EEc+3+vGDbYZZHMX80lN7I/6dwMAOSQV1yRqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bb79onK1sKhGowNTPhQtiysAWF+5bfGM9WmwDKkL5b20xDB7R3/RXsWGk0RZeznVX41ZwaQmo3BZus38JzRHDP9CTLZ+T/+4QA/P2m9zCk+E3H+gnfEpuWQjqZzNwaAKj7FJNKsEvnRoigrUVlX+aSW8q4BSN9zj/RmdHCBJ4dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iedrb3o+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iedrb3o+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so9871f8f.0
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 06:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780149429; x=1780754229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0IlYPZDTmu58pp41/fakyyKvhFw5X89LEw/REFRZ2s=;
        b=iedrb3o+9pi6Sdg58ODeVewLmZB3dcN9kiHJA8amVy054vixYR4s+CQroMp8MqQKvP
         doRFHQYTXljwVJK2wdu58oAQC1941HOKnMbz7A4dWn6cfEjFSKvr9B/HSuwSFKzWD2Ec
         DJOpfeSgREW0nfoRXmwYuXQUmLLPLHMkw9JN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780149429; x=1780754229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B0IlYPZDTmu58pp41/fakyyKvhFw5X89LEw/REFRZ2s=;
        b=Rya+4Hc02xunQvoja2GbpTzhld1Kr4R4cn1OVxH9TZ3gyxYlUyJAAR4e49tD1GGmuB
         3bvAQBnBoYB+/YmhJ3Uw8Q3s/7hyTzdujh9AFvK6Q/ZOV4UZwCY1836soGZzrZoJJYtQ
         pEZ/mnDUToVvm2skAvdbyblpK/UusN/3V73UW4frZwrJPkclRGcGxSPKJ6a4BTCFzY1n
         udFSmFLlWG/+y1yRVvLB7XdhGkiwgTmkNTrNkEe+iBAtvVo+eil9MSb1PpP94TcQbutd
         IAq9apLJP6RL3hPR6i8qCYgLUndU+EkHJsFI+wDia2/IFfdOT1A/6dRWR7mQ6vlaTd5a
         /GOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9cDt5LvAcGKMvedYeuCfL48zbzePCbVQtz0ryMv7akyO5vGR73k7iKogouA5tZenIfDItV42o9Cixw@vger.kernel.org
X-Gm-Message-State: AOJu0YyNrih9ffqud7DIjbBqw+ADh8SXyZjJRAqkZdtFo2P4SCavIAw9
	SfxNLIvQIIH34coJRL381t8DH97QcPZR/041iqnq6qqBmpu2YSsnf3gY+hJ2req5gqA=
X-Gm-Gg: Acq92OE5tTmwPxKwHbo4Y8ltPhQqYME3BHJ5FUubXnN19R5uQPzfo0pivW/IvmZ6V/b
	ltXkGI/5KZnqv+jNSsWKdf8uFCOUZs67fu3LVl3SYxdR9T9G2b4a6ei7ADR8/2vpQY9VJ6P2eHu
	pLTCWdH7Bp7T1IHdjzamZnNFB1Mk7n4c/dKYssXTppYVxP3XPbd29xND4pOEawe14vWlAl60z6Q
	UFWib3F/381xRAZOSBd1L9nRU4LoXEtpJG83HnEc3kPANl7lZiL0NNd+UrbDR/V8Fsuxu2TiDv5
	KEex0NuBo63HWy/8IX9Xfvbul3OANDojCpjFmQI4dwO/l1Sby/zlZkwk/rRE50U3mvLBMsASJ2H
	rpuyxG/MDGpCLeChogPcyfM1oG4U8RsI4UY4e8wDjhR+2xPLXd0IKX870HqizDl1/nXF3Jk4Zln
	nkQ90WC8GCqtPFkB/eCJNx288DQfZ222YFqhM1pxOy6myxSnaMCIGmdu5YJt//ek1qft3UDWl8q
	+VCQt7YQOI41WtqqrYu6q/OhClq4fNDyWoJEVkorH32kauopObg6EfiYt5F83fW2kt8n8XB5ZLE
	SsgbhvUndjONevoVlDF/SyuKwkrYSWE0
X-Received: by 2002:a05:6000:60a:b0:45e:7997:8b82 with SMTP id ffacd0b85a97d-45ef6b397b5mr6861406f8f.16.1780149428765;
        Sat, 30 May 2026 06:57:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-0-96-182.retail.telecomitalia.it. [87.0.96.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b47eesm12101711f8f.9.2026.05.30.06.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 06:57:08 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 2/2] arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
Date: Sat, 30 May 2026 15:56:55 +0200
Message-ID: <20260530135701.3961023-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530135701.3961023-1-dario.binacchi@amarulasolutions.com>
References: <20260530135701.3961023-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Add patch. Suggested by Sashiko

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..0feb8943efae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
-- 
2.43.0

base-commit: f5e5d3509bffb95c6648eb9795f7f236852ae62d
branch: stm32mp251-sdmmc1-power-domains
