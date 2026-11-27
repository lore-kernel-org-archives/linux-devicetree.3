Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802850;
	b=xbiY+7J24pRGre8oc6u5rVmBD732kTZBFX74gab0+wFo6F2CR7aHJp2eFHG0zdqX9H7g
	 nGMRYuYMEGnhBiTiMZWuGkz9GofPasLR4DAlwul+FnK3mSyfbfhO7z/vDkHjrGjXiRPx1
	 MiUoGd0tJfUyqdY5EzzMVaXmsdwr+zpjOKREoAg16YCBVnYOzC8qS6LZaxUKX8LkWADbg
	 +2J/zWPHJDMCSmMVlsYgevN4PyyPJoGg5rLDbnlOOtX4Bx8GF/jmlxRYe7lwZSJforzO9
	 MO5t+pySKW6/Mrmugvh23Nlb2jCq3Y3LE5PhDRd68VGvwaQjWqsk6ICaS8IIcnY4acg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=o6iub5dfPtfYhqcnzYk69opOns13WbIa7n9pOYTKOVw=;
	b=hfXKfjLsR576NAn+qLWlRVyw/UCbJ1vKUunPmYjEaW/iojGAFM+4W43RB5Lgos9iqNrc
	 icqI95kAm8Ur6/xNB4frKiK7LnjmOBLlap1inWJ1OFA1pYGi+yELZGlzbLr6HbpsgepWD
	 NAeHaN0m/bVIWsnmeOHXWGaDl7m1Y9mgbBOZzah31sBcaZkiPERcCK3Ca+nELT65BpfbF
	 W6UYy3wmtIAslOD91lgtVJoHdmjmyIbbimTi+yLbTLBU6n8TZfNYZdlaFESylckgzYWKd
	 D3kf4ha5ZW90wAckm94UMTqZCU2Wzh+UIfybxNmF2XhfIXtBWXFsApPhclsod69HojA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YH//X/sD";
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB80606A33A
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 18:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB80606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YH//X/sD
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8629c7cc36eso4688952a34.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802849; x=1796407649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6iub5dfPtfYhqcnzYk69opOns13WbIa7n9pOYTKOVw=;
        b=YH//X/sDyNYNOHBaAeUfrxq4zbv0Gjdk/VHJMlUGlQmnWnDhW0f+L6o6yvirI71bGE
         tstTUlVXfnpQiZ78zUctggTBCfPlTNfexNqEenJDtB3uFeyLfuBSKWel1gqnpzN/dssH
         yjzqoZjTeJcGUju+55yLJ+B4Vg6KtX4068vYwoxsdZfLYlAWuL9qF8pSBo6qe+IOEddM
         +B9u1Ts7LX6QDbcBPZigRxujBezTRqbcU0JnQOwJduvDYjCrug198y8kI3WW0ZLPg5SO
         d6viRsM8Q0y84M55dQK1296sLNDtZp+HdHz/ACoA/MGGkyulIONAbzsGh9s3TyznnBTR
         vCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802849; x=1796407649;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6iub5dfPtfYhqcnzYk69opOns13WbIa7n9pOYTKOVw=;
        b=qa+mJjl4mJrUzdHW6k3wu9gxHtFYWUZJwk0Z34Y1c88xJAKPgsrQsO2Kk3mVLi0vYL
         HkZgvQMVXBvnJcayWh4gDAAzpjHkIifaPme+CAWRomYtfwmXS64sYFWDVbewlsQdy3VP
         beBatCrDGtLbZqbZLo/wypBoPrrn9ZmLOqvrGErukCpB/8SirlOfvDPVE4PeypPU4799
         t+4IltuNklXioJkNjAuly0T8N1lyskN6kgCD6jRX9EOfPgnZlBOaRlclxDAPJOSPv8qf
         eKj4ySaAVTjMz6Zj9CsVRC9dUubvAYytyY9VzRbgA0NmwxoK06/ur0h2i5e6N1n9z4X4
         eeFw==
X-Forwarded-Encrypted: i=1; AL+hErHPdWFu9UtAxrABUuYmcTFSsh0APZDeJ8yS23THcPurnHivD+i3Bw/2Cj74I/2yFKZOQPnbQWUUCF5D@vger.kernel.org
X-Gm-Message-State: APuU4Z/DFoRH15zg48KnBhzPb8fUgMF62JdCstjag3rqJoXaOwRtij52
	ru6EWW91ZdhoYl4j7nLuTWTFI9cyKGgDsH+q/7PrJBPdnZuvmeG4Cvsl
X-Gm-Gg: AZFdTZeVrrjUF9u7bakiIWM4hV2N0ZDHjPhXomYBmEKZpV5zAp13RBl4zvD4cRA+rv/
	ht2Ip5zAyLWCpR2S3vD7bX+/lCwjhvQTA3NGV7uV+kyINzW3vS4KIIFExYl8iLRL3szNCf7RFj2
	SSCkYm4E3kEQ1CQTiq5oDfGb552j4LB6+PjKLtphaWkqDSDGGN4p/svO6uXouGUKtBcf3iK3rzs
	v8AfbMlMemUMbydKhPlC9I3jLlad2st/KWAn+to+cEKXeChhGF52NHavLIiSVcdmdb0xEgY6Qav
	zwQDw+riBU7aIF21fjrATJSmhNTynYBN/c0CZURkTcXcrGAdqZg31yf74jBgYHLqI8j+a92Ww39
	FpTl/WvcYuW/mYDbDux5PWzEGipHWk68ElaDrngyHa7EhxBbJb1VzZ0zhNhZKJRnmywf+ZLS6cz
	jPSrguZ3HMUGxqBn8aI0AqaQPz0ETD6SJdKdU0zI8+J1JYp9BTBpo+kUWubvwYZdgmH/mRCBMpm
	FwuOvxkk9bHg3gZP/33dKh0nOUUuJVAIllEOQUdnYjgxwJrbVr/mwA9OtKHQ57hOv6u+QR/J7ql
	zXihhZ+8NX9n/EWhGXIX4Ru413LgrCX0l1yJnO6vMBNkVY80e0GA7qupJGy6iljASGd2rs6rQsA
	QUlfbgw==
X-Received: by 2002:a05:6830:230d:b0:862:9fb5:82a7 with SMTP id 46e09a7af769-86315979712mr26463348a34.21.1795802848575;
        Fri, 27 Nov 2026 10:07:28 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168bdc75sm19369574a34.8.2026.11.27.10.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:28 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
Date: Fri, 27 Nov 2026 13:07:26 -0500
Message-ID: <20261127-a733-dt-v6-04-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-5@gmail.com> <1jik1ild9n.fsf@starbuckisacylon.baylibre.com> <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
Content-Type: text/plain; charset="us-ascii"
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

> Ah, indeed, good catch.

Thanks. v7 uses <&reg_bldo1> for vcc-pk-supply, with a note in the
patch.

On a different point: shall v7 rename osc32k-clk to clock-osc32k, as on
the A7S and A7Z? The schema still accepts the old name (deprecated), and
CHECK_DTBS is clean.

Also, is no-1-8-v on &mmc0 fine with you? It ties to Jernej's question
on 2/5 [1] and your reply [2].

[1] https://lore.kernel.org/r/p3YaXlLJTguQBGnWyMpb1w@gmail.com
[2]
https://lore.kernel.org/r/9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com

Enzo
