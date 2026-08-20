Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368A638D401
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217433; cv=none; b=Ujb2em2/wgSwcYeRyV5FtB/LCCbqKNbeeiTO/gla4eogo8FMA3MWTL69WxzWU2UPT6l0o7marctnDg+WVR7pLVARZxqFFPx183N4mnEVBHgz0lJgnKYkFeVIFWNZsdBBeF7z2ZA1ezXHiDfZrE/Mew5loWfvwrNdvsIUS0xwsk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217433; c=relaxed/simple;
	bh=r4oEtWAGk+0lG2cjCCS/On9c5o0ItK6TwayM08X4LmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHK1bPYedzbG3TXEU6xYZ9a74cqAnGrRBa9q10BcOeVOvIy9pNMJ6RminzatvTn33b5Zm65I2i1nDbRVv+mV/3qN7hveIw8CGTR6Iu2V+iAlmjJlTgZzF2ydyd+1GEQpgV+evX2343VOOzI0AZP05Qg3mH/O2TaYzVCgmHKl1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mv5kalxB; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mv5kalxB"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso805934f8f.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217430; x=1787822230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=mv5kalxBvyJvYTuKxVQsqyi3oxltYv+LU3bdseZ5Uci/Q7iC5ddSpi1wlOz3STekft
         gA1C2lLH9jkSrv/VQ5f6vanbK9fLtyuate+HWa321r4REkX9G4VV8WW5vZM3zDo2oAE8
         gwCpjlxCtyOkBZgEjS2zoWW6/SEw/eLnp2OA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217430; x=1787822230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5wRK8UQUntkfKxBkcuhYJT69Pdd0Q05Ua1EKGESaNA=;
        b=aIAyQxl7iY504mDonRYlIBZKySSfhTGSb7cU6w3e1AmZDkB0mVwk7dTkghqxJ4ylZt
         TUdzbKkbf1ESlFbRDkBPP3dkCTHzSTxd7F+HG2LAPLq/SqEhLQ1nJwOIRP9wsv+1tdoX
         GVxwC9VtZvC25bqZmyAYyrca7wY0ndza6a5/CoHr20IiS8+fl70FxeMPfbfFqCsIhLcf
         0b3u3oYEU0QoBc7YgwqBxgbmAgbB4FBVAdM8Hg7big8povtRHIuN/25n1kjHaLqQxWGh
         l9umU+C4XpKEL4a8J5WH7v42M7EF+ZT2VJ+xKYumWT7Rk4SxSQv8o7Xc4r0mrjXlTR3z
         Jc4A==
X-Forwarded-Encrypted: i=1; AHgh+RpGptCfh9Nm51AEEUcmKRQD9zTyILX+7DYMfKY7gMFbAwsVZAg4AqEBzQfcjUuBmxL9p5MipS6wGkEP@vger.kernel.org
X-Gm-Message-State: AFuF++lB2QQDjHg9k+zuhMZlpFI53cEVl25KhC50bg7qkvuVQvzPKgvV
	wCpK5zNA8W3ytVjGU7Go8s7/Tp2knL6EE6y+gSp1dm+nYTFKycvf9HbVvf6QTv9IgNM=
X-Gm-Gg: AR+sD11svJkPo9qBs2x32PmczP15CFSJ4/VJ3WEr+CaNSKE2Baw4OWSQcPEdXIZKFuC
	FON8lRv+n4eHtqr3N2sCaXiG30ayXJHyxGZXcmWl3/z0Qq9xsH4Yobo91/uqNS0u98JfiqiUwKX
	3LWW2CDu5tUM5OKazJe5Lge2cozwmFde9WMxROYqPCElwH9DsZ7vAWSTERkXjoqNcY3c8CDCqot
	WsaJPq2fJ+j5ZUmuPrko7dUaDX70aCyuXMv3fORlpgYJdPCGWaQNKOlIuU3ILQOFqnZVap/7H8Q
	HENK37LbNWD08/KOSwc9HJlVdT4wiFO5QNaBg8o52m062Leggf/ad7obE8UKGg85uIu7LM9LR1N
	Q8SMIrk/+2nnCc/ZQK/RdUWHpXEmksjzFxXeQQH1DldIe0wBuTS7dtPDeG3cnw9D729jLGCggW4
	QgiM/gt7Zf9xiPR7KD/egSypmaRtu4N1Mda1TENVgxBk5GPVDsy5GvkbTXQ849Ni0pjF04b6qcL
	yU7Qu6gT+SimEc9xbhmdM1Jzw0c/qy+D2ASEnnPIpucthESAvs9W7CJ744WX0435jcL9xL2DMB5
	/sTyw21UvhhIJI75CEpGJcYkLk2n9p+ZcDWxUogjeKCbPV5DUxK4ig++N2L2mw==
X-Received: by 2002:a5d:6f10:0:b0:481:5ba5:994c with SMTP id ffacd0b85a97d-482b1ffc276mr22851058f8f.20.1787217430423;
        Thu, 20 Aug 2026 02:17:10 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 02/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
Date: Thu, 20 Aug 2026 11:12:10 +0200
Message-ID: <20260820091652.43541-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
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

