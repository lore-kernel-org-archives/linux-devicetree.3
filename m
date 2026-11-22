Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360316;
	b=c/WE9QLlvpoiFyCceahggAsDe2OYvvyQ3LqTC98UO1GhOUPYuHl/OjnFaM3qYMBmnir3
	 /lcuuHs3PINcW8rD6td5BMHgkQJ0woXyzkAZft8fIfPTxgLalKi3A1DXwXgSM6tQqA1qa
	 aiblM4PVkX+QPEWrcKz/M9fEnA7tsBHthev192m6jxYnmHsuiSAxRE0lH2A71rTDGoml8
	 gVAEqJWMA5ASivtrGrQyPMELoRT7P50/IMLZLTRdHF5EV+RhK22M3MZD+BswiZUqUt6Vm
	 L38LdPKSA6ZlT7DfcHvUjHiROIZXcOsqV2dl84OhWmEzeIcPharpRVeiehBEVbWmnMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
	b=CcwtSr/Mm1kLEAE5RvG+5oNVqck7/2/sCEzu805MveD5nEsmuviH4pWXI4zgqnCkD4rb
	 RM4YQE7EGuddrYzKx0J+bvpRMP4nnvNMlqnk6uNdbYMNh5n0gkHG0cJtkmu6ihcoP/JI1
	 Drz6eklGVXnRU8zID+91KHWWNkcCtD1IDnkmdSaP1fLGCWiqk+kfp+BJox8RHGMBEqnNA
	 DbT9M5iKr1YNEei5d2jjewAS98kF2rYXrjJeWiNqgEy3knHlnop0dfkg+bIkTzvaAIl8t
	 F/eRoA6vy0ZJGhavsLt3EA2+drRYbDkwljMGtJfII6s5Ld0ILPtf5ArbVVg0PSWmllQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dtXtggfE;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854D4606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 15:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 854D4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dtXtggfE
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so23467575e9.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 07:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795360314; x=1795965114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
        b=dtXtggfElS/AHPYflC+EBM6ex68Vz4KSSe/5VUUMaopzAXpDT5crcrLRZxByLTfcXm
         Pfu4oVG1dioy8Qzk2Ph4pceT+Uz3/GMd5oH+7hGGubpk0AIn3iv99XAP3zimU1m/cZ2d
         /GQrGkAPq2deJbVwUAe8LHZttix9sp9PZ9BDFAw7TMEqxkGBFNG/oUbcmCw7W8Nq0Ntu
         6fFZahSCUc3oYOov8DzGTvQzXAADUBNpVj17BaBbmcmCbh8VPHfsvnDOuAc2f8oiN/jd
         olSdDnux5EQFbpLwefOeoqiFs3R9SLkzCQTvLy2sb0RSNdBE+FU6Q9rs9NET3MCa86O1
         L4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360314; x=1795965114;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
        b=Pb3S49IdyXjz2aas9S1N98Ec7jBpTnzIqgk4TTSYec5oXRSG8BIKkIMMvRGCxm5RUZ
         h6UnXHamnZa8yaFQ/VgBI6EpFBu3xIfd2hyEtGkW+9WBdhStQCPaoOnmFolt6Ttwf90w
         knXJQxPMIaaxWEZkjF7LFHnzS3D13m8QM/iCieKCS9jX9NTP19w2U7gJW7mFbiTk5JkY
         bQtkiK9GbOt1GRbTXD72UENdl//HA3NbYumwMOYC58lRmraQT3MYGwHZCIfvs1FhWA2q
         8mxQgqbyxtsmLgLynXUbAtthRWc5VrhB+C+Te9BIyogCExSXKCs0hdtS7mpI52FMisEE
         uYXg==
X-Forwarded-Encrypted: i=1; AL+hErEBkkG2fj9GBzh36obThTf0D1OzM/+A4QDr1+53FmKXXljr6iS/I4EIT1wSGZCqDOOJveWlrxy7iBG3@vger.kernel.org
X-Gm-Message-State: APuU4Z8NSLwStvuSWqHuUDwIyOSh324PpsGdgcZE3caAotx/K5FfxjTn
	JSwyPicVxaDbdwBM+ozzQXMazv9ikMFp12uVUAx5znszn40ILgbrltvnj7xOTbHToVQ=
X-Gm-Gg: AZFdTZdQER4rX9CLqqzanKA2+a6wyUyfpPmgb2p2I3mEsMKKOzgN7FsGJE/E7QTMnkN
	ewK+xIQJDqR7lHk0jOidkkMmlnvCNqjCtUE0RaoMczjHrACqBYmAC5vZPryrm8HtktKaTahBwMS
	FBDE4pNOegu1ilzn6V2Oxiqk9lGAbyFlMpehBznZAPtcmRcglGt4+R1hfezPuQy/34D79WQP+ip
	XgjwuXrC7QsXAYu4KjuYc3TJY/+LjLCOEKQFZJfPE8Nmow7SaIVpkCjqIWBHpiXt51saHySE5pz
	vlc4J01rIY/VmrqO4W2+eofA4ddcrTKlZmMA1wkHnR2pCmfhQbxUP6i6xCoGgDIBkI87WBxBKyx
	gTI52X164kaSqGyediBUs7Nyj+1TCwOwCNv8S5L/jD2Xo7XkoKwWCq8ZUdxJo1jBwMj+xcEzZhM
	yjQbJ4/QRCJT/eEwAb7lHDAlLInW8DEjcucVxOZ1jWH1Fu1EXrdiytmjJwWPfP9ZZijpv90K4r9
	2uhY0WCdaNoLL5z4aFkB7MEd5k+fAPxFGtwe7rFzCt3i98DQE3ckciiCQZR0ltgxPWEt1angNwp
	RXbv0m+uN5qg0cjMh6zDHG5ltKEQGDYKTO6P8WrFcn+xYw2oUbi9VFTsUeK4x/m/RWi/TQ==
X-Received: by 2002:a05:600c:3484:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb88812f16mr189053065e9.24.1795360313921;
        Sun, 22 Nov 2026 07:11:53 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm16789049f8f.38.2026.11.22.07.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:11:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
Subject: Re: [PATCH v2 0/6] Add Amlogic S7 clock controllers
Message-Id: <179536031124.2724645.9771781564056139591.b4-ty@b4>
Date: Sun, 22 Nov 2026 16:11:51 +0100
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
X-Mailer: b4 0.17-dev

Applied to clk/linux.git (clk-amlogic), thanks!

[1/6] clk: meson: pll: Support PLLs without a pre-divider
      https://git.kernel.org/clk/linux/c/0068f78e25a4
[2/6] clk: meson: pll: Support active-low resets
      https://git.kernel.org/clk/linux/c/288015e923df
[3/6] dt-bindings: clock: Add Amlogic S7 PLL clock controller
      https://git.kernel.org/clk/linux/c/7230757fd4d1
[4/6] clk: amlogic: Add S7 PLL clock controller driver
      https://git.kernel.org/clk/linux/c/19206e1b1299
[5/6] dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      https://git.kernel.org/clk/linux/c/ed4da9fe19c7
[6/6] clk: amlogic: Add S7 peripherals clock controller driver
      https://git.kernel.org/clk/linux/c/20c6003759a5

Best regards,
--
Jerome

