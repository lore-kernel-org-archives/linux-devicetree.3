Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640076;
	b=vx8q6UCrCw7D1Jnjb+fay24wti/e96ts8vowryXLJrtrUyBSgxYkT0leDLP/qwhW2AL+
	 WMsWREjzCnls9GqaHsr+/eq489kQhsvnABNJe/2/fkoghSTqC/IWUq7qsAMSU+VF07aG+
	 2Lu5MYxdYJn+JFi9rUZy5m/K+ewaQRneEaALiFLNGl/pX34YlNVKc1Cy652Zgeuc0LrE2
	 gZxbRSdQy31zJxm8RiAsJvpqdcNRRI+fcAQA5ZNpR4iJHRlcYo0Z85H0GgzTFLCtfZNM6
	 LlwIu75z9rgtXeFUGTGT8fu1qg7vwXsjcZsIch7LDVlZSLK/WmuWxvJStr+81ZAkBCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9cnvF229oCRLM7FklnqYjwW5zZXyLVLkJW2HhsXXmhw=;
	b=DqlIAz057Pc23JTHHiMC4hBCLxw0bRYnwMPPx+gQ4/wFfapO61r4uh7kYNHXZbxVkclB
	 kBKWXR4qn1/mC8kQx7hLFqXWfpCQBeWDaQljYVkMa/IlKM9uMOiLN/67aGKAHPLhRW9Ec
	 znhTOr63UZUwJ3PKKBtK6/ik+GnMYuIsT4EPrItDi16p+P7sN3ZAfplEqDF4zVIkUzPwk
	 MeSjlGc0GRzYo3CHJ6QtZVDSNmnrrKgjMZW8aTy+vKnTFfWL68a7EOgBeI2hVeynR4oKp
	 RvdXFlUZ+5ravwR+p6GXKkJXZr264vP2fxcZRHwEWTjO7Iba3g1BrjkiIkXQgtT669w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="XuE+/R02";
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6D4606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F6D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XuE+/R02
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c00c727a26so512867e87.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640073; x=1796244873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cnvF229oCRLM7FklnqYjwW5zZXyLVLkJW2HhsXXmhw=;
        b=XuE+/R02Z20PbA63OtcZhpCbYLZKc3TnXmHrajI3qhNr79zzfqDZPk5R8HX6fNoV9u
         jKZDFXmZ30Spk6z9NRVdHsWTo3Eh4Bjf13sLaAltm1du7Gsg1I+X94DjwkhG5hjEEd13
         6MM8/X1x4I4wwliWOV4CZyq7GvuKryi3HFNDiK3I//1VeXEI2fIKPJnIocsNDfHZrJ+P
         XFJaaP28+s5ENtYfsbU/FmOadeQfOYJgCWE+Nz4YS7YzN06fOYqMQMOyBJnNbo1H9vEs
         hhwxXjfA/trvWBDbjZLUwhgMwDYTI7zAwJzP3P9u04AMgia1y1JmTdryd3FJ6YXbG+DI
         Y6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640073; x=1796244873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cnvF229oCRLM7FklnqYjwW5zZXyLVLkJW2HhsXXmhw=;
        b=Gd7Ynf1IGI1vdMQBUQ/zIvroplNWGGNhp+JRZmyvKqAnQu7+pQa4gBFphAiHSd2ubm
         TB6Mnp/QecpBy7R3/lqnR5Tms+onregq0K8t5xJ1305ZXqOk0/QHs2u1A80Dk1BJflJw
         TzAS+EHFjVYU+47aWm1XnzQT5/6AovffqwkW0Ph6qlRpE9FFTXhBXk9421x/p33Ao4Sc
         e8KDIS5bbEsq7ez3ODMT+ZlCf9M5iVvzInU18LzIdyj1gIY6dzBIp1VGpo/0KxksNH0t
         TRYPUDCLwWvMteZEcGKkdjHjwxQfLAivpEwSThLRyXiPrPImCwTbkFxZbEVLvro3yCbd
         jhvg==
X-Forwarded-Encrypted: i=1; AL+hErHU7zRmxUt1es9J+tj/VdWpqeABs1nztZ3UZMEfKohFaLF7HDIimnr1pKWXZMRPnlLYQcj5QQmpLYuD@vger.kernel.org
X-Gm-Message-State: APuU4Z8GS14L5PWkeRkzj62mzivcBlMY1jPc1q8yKLlXHNJeKCOL4hqJ
	X6VdZ7OVDykIWtG6umvu7UzsAoAmoCUcMqC/VQ+vVR/5hAQBZCrl8uyLMjpO+aBrK9/QjgqX80y
	mTtduKHc=
X-Gm-Gg: AZFdTZcn15K6FYd9waDC+mWMlRbW4MIoK1cP0H7SRjKmWCooqb+Lf49PpnmelD8QDkY
	f6Enp4hDvpzIIfjzmal5CDkwhx0dovRQrCeSYUH+/rrEbXGKXJmb0OpfSQIPCwehkpag+E51cKG
	GIrLe5i5oDrRfmgZJJOC2PcpxN8i4IQuUfFgCRoc1/cjS0rTGTgzdn9e7U30tjoD5296StAtwJs
	4HiTQd90vKkelNLNimEKlMu83gHMYsJp72oD6BiWlQuP3JyzUbsAPmeis4JsgtREVONGxidN2h5
	AlSJSzcO7dDkdVWc+iSEoJO3G5wrOLbL80qWR8nL8di8PALlZC8F8ZGOH2uVf09NBSSPulnL2yU
	L5eRSyXEocQVLs9QMPd9bWL8PBm6CzMIENQ+i8VwNNCxEqX5PeKAidsbvsYHaJau4RNHhi5CiPt
	4jgw1lYiJbYaQbQ141fcg8vV2S4h523svzzx034DQrgVFsVgjOWjjlJTRziumKXkqz6n6SFAVTF
	mNRohKKPLbtWU5fIUjI+eHoW+9HO28m6yxU6d6V8Br8PKUQQ4+VqZK9V/b8CPMkKvfVY+Btb0sY
	Hq+Nbc4kcqdgGbqowa5pgGOO8edsE43ribAFKJ+4m1+uNZj5eaRSQhmVBAl16b6bcw5Bgg==
X-Received: by 2002:a05:6512:304a:b0:5c1:57b9:90d3 with SMTP id 2adb3069b0e04-5c1bc6d29ffmr6044057e87.1.1795640073506;
        Wed, 25 Nov 2026 12:54:33 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805751f4sm50871441fa.40.2026.11.25.12.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:54:33 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: sm8650: Bump SM8650 CAMCC MXC vote
Date: Wed, 25 Nov 2026 22:54:15 +0200
Message-ID: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
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

SM8650 camera clock controller PLL0 runs at 1200MHz and requires SVS_L1
level of MXC rail, but the CAMCC device tree node has no required-opps,
so the MXC rail is voted at its lowest level only. Add the vote and
make 'required-opps' property required for SM8650 CAMCC.

Vladimir Zapolskiy (2):
  dt-bindings: clock: qcom,sm8450-camcc: Require required-opps on SM8650
  arm64: dts: qcom: sm8650: Add camera clock controller MXC vote

 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
 arch/arm64/boot/dts/qcom/sm8650.dtsi                          | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.53.0

