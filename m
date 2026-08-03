Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DCB3ACF1C
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742957; cv=none; b=cVSA5f2B9+vZSXJgRl7uDpypbsBgFffdaW3WeKE7A2j2T0u0cIYsRp3RJfH/q+pe666EilWz9ZEGLWfx2QU7v4R8MqP4fUSmpOB2PLi4vNQQaxa/5N8wZspSmOGYDkVd69d19B9PpqRVaN9mzbVWVAIpUjZn82iw/jX3QYCf9ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742957; c=relaxed/simple;
	bh=r4oEtWAGk+0lG2cjCCS/On9c5o0ItK6TwayM08X4LmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOddDjrpyelaY3SQmqpJ2iv2EZIIRlHQNdyG0wn+NaXGmSvthrC1Ad6vOZWndp9Q2TL4wKq8DP8E/BsFCumJP2jpi2kTdc174fnIl/n/LCVv5lUMfGXjN9IezhMsYZ0CdRVLzNwrC10CsCi0FzyjqPYgnh9LsFNm8Y4umkoYAqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=oqqiIXVT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="oqqiIXVT"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso2118303f8f.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742954; x=1786347754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=oqqiIXVTHmTOL4WeyL57fuBQP3cEKM5wZnvE8RlP1Xbb+ewPPV8ny2nHTR2ybd/rFs
         VtfDSkttmQJo0kH3L6Un7D9ZVSFzmqvqsfKVLzIiEUpGAeLTUEgjvyOc6nIXGVfYyiJx
         2ROMI8vrhyezhYmnsdbd0luohlXQoND9q1+PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742954; x=1786347754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=TYzxpOgo2f9bCCc9UECWPrJqAc1Jo9ctSkPg+k1ElLEv7AcLs3B4UVapUpIyRK1+uT
         HTSEptNqY1Dc5zMZgfNnLrqqM6bBuetGrpnfRUA2x7VdY/Bw6yolVqBGCDhshg7uuJL1
         1yD5dPs71Cw3bBjgk/Jl/MQxmalpKyy36ZEDO3Lbhi2JC9Ltq5sBAZq0uFLEqRpgB24T
         z2EoRulQuyRY6YZ93R3NWWxeQwuwKyHVk3khHbVjOyBNWTfBjUcMREKJC81h4esY1yrO
         DXCvLAERuRAisj1nMcyBoyTVr+wwqbMlVSk7wk2ECx/6oTMmabx7WdedZ3QjEDihZ8tf
         T08Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr+/ApmHiU8bVNDHS+JIahZihPO8w0/jCfesQZXAwzAADLCIbxXVNO1hpspNvC/fL4ou4OlvPL/hJFF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8vu7STjj+QQ1ybBSNY0CrKDybL1njESg7yCPmrMPhXpjP4mYh
	iG3dseq+5k054aaOom1uB81TnMLWPdub5BI+NKwggpiZmaNMN55dqqsQIisOtkQrv28=
X-Gm-Gg: AR+sD10HNZou0qj+WCxq8N01XLQ74qTyAuwZ2rH9ZT76VLFDCQkoIHAzq0PQPx4Shts
	NLsWXs8KM51mJwXpPul5VemT8n1nhJhnZrGtyCE5nltKXIde0Wyn01/5fgZvL9GfDxbOLpVhWLy
	Wzi4aFTTHYv6DIcfGnq4cLgiPgvRKP4yWYgs0lNE1LEBXnqSgjVNbTWGtRTcCiZcSN6tGakOU20
	BRzderuoSKj1U9NkvuVqseuiOtgmWdK10s++z4jkLidEnwPv0QE3Lm4ZhuvLh1+z1eF7ATiomCU
	FTegVVYPRnqRb+gVvzjur3pqRQoNANjttxdR6qS6ma8CDtZkpdq2ijai6EIY/bJUks+grshmY0J
	4mzPZa3MYFDlcq+i/qZ3trDRjXOzJGdGmFQUu4/azHjrzAmNy1Pn8ry9/lFmxJlWR0cza3EX/s3
	dF/MfbDJKr5Tt8HPII3ILDOSKxPHc5uGVnxWYmXiy4etK4lsdWpEi/zNz0Ea9C6SH9WLXIq96/d
	DvUCsJPTrTCWVmrFFTnW6x0XZRqGhD8F6NeviCxeQC7NQgzEYMlvEXNNWoLIAlTHYpgVkCH5pEG
	pHH4OncPxRCfjwlMlaxhungugko7B4R+5zCfltI4o9DSGXn5po9kugbrUcJ5Cz5iv/lb9C3sOrD
	M
X-Received: by 2002:a05:6000:41c4:b0:47f:838c:4256 with SMTP id ffacd0b85a97d-47fda48c067mr21058883f8f.16.1785742954329;
        Mon, 03 Aug 2026 00:42:34 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 02/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
Date: Mon,  3 Aug 2026 09:25:57 +0200
Message-ID: <20260803074224.3821911-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

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

