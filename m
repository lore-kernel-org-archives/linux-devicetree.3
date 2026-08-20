Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135623CA487
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217436; cv=none; b=A/cny9lJvBe1MlFmUp9QfqbSfyx1M9J+PDfIGzXij8aRpIVpM8JG5E791Vf4MYUgtdDJnt26AsMCXDTwvo3VBH2EXTPZxO24wUv28hMELBgy8Yf9BGq1ZfDNn4E2KKCp7F/9Gdfc02vJiSSdqtlwetKe0L3aqKDf8WFIMVBiJmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217436; c=relaxed/simple;
	bh=SRq4aV3Vv1KtanwaZu/HUbm5QTW8rISjxiq71Wm2JKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RenjA60gJV+VU02ytBAipk0fJ8Ub6mJ4pWOKlczWhyvUDNtlGKFn1PIn6cUkRP0YnPPsWvFFNAb4sxnvl+aVM6JMAJtTHo6ufz9YeVHKhrNvms0NjdzjWPtdn4J6/7RXHSiSM3YgfrhGzycfvVRnNXAYl6jP6Viv1e8LOH4n7Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=hNLv2i+H; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hNLv2i+H"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47362928f65so1912305f8f.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217433; x=1787822233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=hNLv2i+HLH7fNN+PX+TuPAsqrvdW3a3JIPDr2ReTOmaGdnOmOaQfIzvA7nXEQeiTQm
         8UvbuxBDaCL+YSR4m/sQ2tEeMJ6sg46D3REwtyaI6vU0lJK83Vu4LqAFRvYfjNKac/dz
         QtmgpY1So80ToeVvT4JF+DKZl3oNfWQ0l0H0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217433; x=1787822233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=R2mEM6qN3TRPRqFATO5czcq+J2PtFvphTow9fVLuklupWSv0Hivy9+ESuemup0kFiW
         bsHYucBrsQN2F4EEXZnDloYZYWuyLdMQ2eBoRCVYHpGSKU+le4ALtW8rw7GHFaDRDlVW
         8tg+c8CRz86rgwqhYihtDf70VpBZ0rCws5cqd2caIiN4TIQVErfjsdId4MGyhrCiJduD
         omCSU8LfXCZ4VdsJvIGieaP31Zi3A3rahk5CZBiwC8d5nXN1d2eI6IHVB7Zj4Y+8O3gU
         GJnkPvU+rDm/5xHgHmcdu3QPfdBNxy1JHa7RNnzzbpyjL/Nh0XsEkP7L2+RmdVgDtojP
         RQEg==
X-Forwarded-Encrypted: i=1; AHgh+RrC16BCxjnSXVkKHdspPDz3U5Qe5G2reqNTEd/fg0jRjRPTjWVw1ybqvypdybh40LI5/I15/BjyL4PI@vger.kernel.org
X-Gm-Message-State: AFuF++klMjMQMP6z+J7VRENVgUM+sOXnZivmyBb85Xj87Yu7c5Md4gxR
	FtiokqaMqeKFZfUsY4B7ShLdFSgYuiYnA98oRC4xDGY35czcXUC11NpUhCcKuFnTZEc=
X-Gm-Gg: AR+sD13aWzHbNBIPjr5Wnj65FYcCfoFCZLhQ6iN+hIPzN9PUPFMqLnoiTMcEtPwKdsu
	ylDi3iq7KKofsrUXJ3Xrq1pmPfX99kCelcYmo1fwrE99XTORxs6WGbaG9AjKO8i7jU/rUjrgXN2
	d+QZN+qnUF84Y0pl/FEyUZqlqBNxHi1dFR4JXTZt6yWlrgezlMSC60nTrkVHOiVUc8jfr9grN8K
	WsIVeyWkOGvgJ32fkCTTkrVxXlTtoZrn6IFws59FqzxwnVw+KOmyKnT3k1lVbkecJKkxTsHalAa
	h+jaG0F/77VV6pqhYU5fRLuXHQ+swsDPIVFfH15F+Jp8hELL/G/7yyOD46MEdi0iO8jtOeqPls/
	oY9UZuikg/yQ0Xtt4e4lnJRNyFYgSVNxIQkGYCGcVSRCBUb7bGNQ/MJa6GEyQljaHzch0Wy5kpf
	FMZ4g6uohywr9wv5VdTEJ0sUds6geVMJ6gkW5l/cD800yuv6yyGLBmcdYZcE9lY+DqNkW4zQBo2
	9qYhmqok4aH/4YW2+mjHc8jPeDMBdpW+4A4jwFTiG+A91hvPulKikQ4HS9W8rdOmcmsswx0w0P0
	j9SWXYh3oSOp/jI0OoPxJQZqJv0YrRxNT9sbMbDCmACKOtvwrSjY/KpMv0ksEe326OSX5qDurw=
	=
X-Received: by 2002:a05:6000:2881:b0:47f:97e9:fe60 with SMTP id ffacd0b85a97d-482b1fd9579mr19387927f8f.15.1787217433214;
        Thu, 20 Aug 2026 02:17:13 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:12 -0700 (PDT)
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
Subject: [PATCH v8 03/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Thu, 20 Aug 2026 11:12:11 +0200
Message-ID: <20260820091652.43541-4-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..ae36d703532c 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0

