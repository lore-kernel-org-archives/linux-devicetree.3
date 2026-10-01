Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E74CEE4D
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 09:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848403; cv=none; b=INhmeIHjKvVh/X5MGs6ejBFJOXqH5O4tGfvPLLiCdie/9LiGPx8OC/xzPxRPWT89MUDGf457BA/jJMXHXdkOvozx1lvmNWPiclj0ZvTUAU9paPwcVTRG4mku5VSCg0rV3iqyfRCAKGBScIPGh+B529As9sUjnUBrcFWmn5HnzDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848403; c=relaxed/simple;
	bh=+WLvS2bPVxxTaSPdd4uobOzINSNDbtxNDh9qJn2EUjc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iwUddKxbdIspCsLYRUEpevcWwoC/bf3Io9hhXtmT2IvnVgJlG+W6qtb7F1SOidjlsURhok4NsOD12+1Dslxq7EaLVUy68wyf50y4raZWUKsCa9qKhMD0zsXbZg1Fc///1LDpc1/mnplpt1NveqGbbuCIgsugku7WX84baWj9qOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HTAB18qk; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HTAB18qk"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso984475f8f.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790848399; x=1791453199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QJ0zqYRdaf6SZM0JGYgcXH7jaR1ePmTYCcjY9AU/WA=;
        b=HTAB18qkRcBdR/GH1mUdj0K2S3B3o7qfm8lPJJgcMOlEHG2qiNhKkyALlwGKE+eZT1
         fSaottdDNIKXCax1WvAtIocfvyZVbSYuL0ZYiRwCq1BAUjJGUcfel+dVc4Rwa1L+Hcla
         wL8jBqMX7lqmc5LBAcEibPRTR7APVGKnMOwt+p147AYTZ6n5IqKCLCNtCMVTasN8vhvz
         nfJkPdSTb1NQytPztiMDmMTupihg1Lp1zhHtzFoPkGy89AyuEjMaOAgxzWAnXg2rwe4T
         ZdcM3RSEiIlyqPgrym7bYrwdKu3hWnuVKHsAm5GQxUGBA7uAsBUTFEmfW2ew15IAGIup
         tWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848399; x=1791453199;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QJ0zqYRdaf6SZM0JGYgcXH7jaR1ePmTYCcjY9AU/WA=;
        b=PcLuuVzaGFA9KQ4Ircn1VV2vaCWm7Xshqmb2oGJg7cO9L/2bq3zIJS9KdU59RZyRn1
         oLyr2DIuj8MMrE7kNjCjKEo0OwWPibQE9q1qhFkDDT8+k7muleb4WKIw7l5P1fTMp9m7
         6VucqdofDGpzt+O78fPFATrcuMO5Qy3X4pfL5VVzQ8h2VkFr+1UsAD/0YVdPssRPD1jF
         OAfVPuPoqw+tR4nfYsNCChj427cFdXAmzYfGioku09CJlv4fJWMu3Gh7A9rnOsJA6Cwt
         YOq75ia0NgabNW5qN7S7ZDEw5t3sI5xaxr8cW40c8CbZIT2wZFIASIAlD6bwGZ91T1ux
         PGmA==
X-Forwarded-Encrypted: i=1; AKwUvBwd5uZEg8QSgUvOnAv1LDssrjVhYwpu/OveCDBx5tkWvQRmgFeCOLbXWuN7V/qEBKgaSFpiM0IUV0CF@vger.kernel.org
X-Gm-Message-State: AFuF++nESxFJ1aMRvB6RrNHRXZMeHkYs3w7G+MFO0KKQJ7K/vqWEwL5B
	7rUmwFDNllkPfB74nppc4n4IwK8oLtnzlG03DpwV/33XeoDP21Zd+j5YYjxl7/RdB6w=
X-Gm-Gg: AYBFou1KqWaKY2BrGzXrfn224MMc6GndfjISEybn0UuSLIP+f3gc2VvzAsGBeWK7yl+
	8rv/Gai1Ka6JixCU3D1EqcVvkY6XqtgSAXrWfjAS/ruov/NasfMyCJvBoF5cxoEzUYDAV6MgKTO
	r44rPWHyDJmu/5eqophdGRhPUEeYxSoWBHQLawHO+FLqTrF1Kr06DYDt5/v6ZmqH6upCI5Mf33h
	MdUkLKjZPrFKKSwaofoXPYyRweNQgTCr8Lw13AzxIEHKTVIaKQ9LY5kl2QLzWjeaY7cgLXbapTO
	ijdWMQu0RIAZK5483o8xuivypu1lS54IDvHYgqBtnV8AfvZ5nYt+eFZ/ZBcQ1ZFys/rWahFkf2P
	1ZfYg4l19iQfrMokX8ZVnISY2aVbEFaONp4/kv+2JFJRk8m37fhG5V7rwxPHWn3Na5WN05Le0xK
	HzIAy+5r8El8c9TdsR6UI/605PAH1b6N9/Q3znwldhNbDELQEhodUSiJ8u6XgS8GF26C5cI9jde
	ywjGUHG40U5GXT1ZoTxLfj/rHZf
X-Received: by 2002:a05:600c:3b23:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a01b119661mr72177145e9.19.1790848399085;
        Thu, 01 Oct 2026 02:53:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9248ccsm41237625e9.3.2026.10.01.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:53:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
Subject: Re: (subset) [PATCH v6 00/12] clk: nuvoton: ma35d1: Fix mux
 parenting and peripheral clock rates
Message-Id: <179084839794.49633.10441853107934842069.b4-ty@b4>
Date: Thu, 01 Oct 2026 11:53:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

Applied to clk/linux.git (clk-pile), thanks!

[01/12] clk: nuvoton: ma35d1: Keep the clock count in the driver
        commit: 6c8177988fcc07bcdf2991102638b7db80e92bb7
[02/12] dt-bindings: clock: ma35d1: Document the missing crystal inputs
        commit: 2d9a942a7562e3cde3c9de0335147c5faa8d1eaa
[03/12] dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define
        commit: c8a24538bd57ae545e7b8f9c8eb1c2f19a65a085
[04/12] dt-bindings: clock: ma35d1: Add missing WDT/WWDT parent clocks
        commit: a05842820a01081012c3df0db3fabe07e36b163e
[05/12] clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clocks
        commit: e9b3fde31626b9c5725856417308598ce1cc8541

Best regards,
--
Jerome

