Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD1F42047E
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199886; cv=none; b=rSR4m7EU8DWlSAMW7c/ZMxLTt0XAI8HK0FAqZkB1rP66tv+jO8TNTsA7Y3HypyQ61XS6cA4H/+J6SIdjhUTP81LLmOubka5EZtxkPmgLs+gp3lIeObP1ZIqFL5qtaRjjzB1x/mcsXcYzrwVR73dk8Je7vdqL7+28m/yJXyGLVxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199886; c=relaxed/simple;
	bh=//yqev/fe+TJRoxB9jobDnK5NwPcao96GrYOBYekoR8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rqkTS7zZVhO1gRbigrH5ly9cerUxDNexsdwuVJHy7imxEZ2/EatIiMGdOG/bbvSkQ3tetn6sbctD9WuNJe6yRjx7F4y0PZYStS/Qmo9WYlIVK0lp0Q+13lv4miqNNZgIkPA8Gy82BTQZZ0cjYIvg6JOAKeXgBuo1KTm8hNUiRGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nvV9o3Rp; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nvV9o3Rp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso1232039a91.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199883; x=1788804683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OemJiih1sslqSbQP4J3cbLzB8Lyd73Gg/1M0pWEdtY=;
        b=nvV9o3Rp9TMITZ2+7P5/845axrYh7W5Yz3UxlNX+0lcxuHdrU/xZllck1FpjLHCwvH
         r/68F45q/Fh1Ya4BbApn9TYQ3E/d4RqGvtTQmV4eU92orZGhtPyU/rDg9c9yE3UtLg/C
         BlhT5BH9UaCWTQ2gb2FzCJo1sPwxBx/K8QpS7LspDjtiwMP/1JC5BQaaEhD3Pl3gzu3N
         xn1SHD578jK7BodfJDBteLY7onvvZIe6zL+sRCI8rLiZqDVLgW97F1ylOr1anAmtE5f5
         aouknvh9ZUHux2Uk9FaAcvC1TsAIJXwRgrZReuBEVOsCQGrzwsCD+iSuVClxESqeXOHs
         7BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199883; x=1788804683;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0OemJiih1sslqSbQP4J3cbLzB8Lyd73Gg/1M0pWEdtY=;
        b=EBIROJKgBu8cuCPT9X6snadCj/oDlBOSHQnpSFBdRGD8u0Ez0jCR879ZRev0NU1rZN
         duBXSgMfUJ7pXT15t9n8cc06rvo7IHvEZcJ/tJIRFgaYbx99mNbKxAcT03p6ZJevv1Bj
         5IVfqLNp0gTtEDmbHG7uJ7K8nWzUvzzjF6wLikBVxcBLgjVNB3GcYWqB5FicYv9JcD1G
         a18HX07TV5e5G7/oglo8iJFIu/nAo/sLddTiCeEBqYfyRM+BOK55RfUprqqk4pgNR/6v
         bslsBOR9oD9kChGNV61w2+/xeqpxIiifGE5ERFzp8RAJ/+s6QRPS+OIQGBgO9n2x1Ee2
         /ypQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlgCguBEkOHIGreF1z7i7nqcKuy6C/vM+4S47IQz35Bvj4HhtysKFsJwbMg2MNIobIqh4gUSFQiHvp@vger.kernel.org
X-Gm-Message-State: AFuF++kh1DLjTkmCLJJDsqhD8IwJTcjzARqvVWdAlCj7GpFGM4j2VTy+
	TibAkqp/M65i4aBsFZRrDc2DHqYXENl3EYE9f3XCGdESnJ775QGICYUSk+jtVy1Mf/8=
X-Gm-Gg: AYBFou29jNf9CZm8v5dI5Nxn2xP4aB/0PUdREcj9JNBRT8E7XTDo+xvQFD2jMlXQVUL
	J7eT8NkyQv+LCKR4OQRsNTP+OLyGOX80pedztCkO03ksZbnTcLfnc69dBlzMyGyYEIgSCQjZ0vL
	QjBCFW1l2jxWdrSiblQOHhwWXqSuOtOF/rHMQ+JI/rm6ZnGV05B6V4s6+i0eC1B/z9oD+jv/y4L
	ZBWyIqLusdh3AK+cd2NdO0y6ltcKc0g1VFbfJo4ylPuORA0Kro7ic42W7eTISA7XSeJq1oq8HfF
	6HEOVsgwjep0WwF0DkmHab717MKEVkcGFTsC2fY+KF9iW9+qASgV26f3lm+ZAJ+QC2UqPcN6WZ4
	9ADivVEyyAhcBy1CK9N6xd8tmLSdrgEUxZYJBjcw9X8dcUJFTq28QHhe7e+Mg7vnbjK0bgX4BXZ
	yyaWpkRrLhz7qtKOVm++hm2L5UiJ8rs2efOzl4w9DiKJBBwCn0wEKwyFkZ3g==
X-Received: by 2002:a17:90b:4a02:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39907ab0960mr2402339a91.2.1788199883302;
        Mon, 31 Aug 2026 11:11:23 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-398a2f5187fsm5504006a91.1.2026.08.31.11.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Javier Martinez Canillas <javier@dowhile0.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194003.107677-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194003.107677-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: ti: omap: Replace spaces indentation with
 tabs
Message-Id: <178819988246.2869653.4070159664676583942.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:22 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Sat, 29 Aug 2026 21:40:04 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied, thanks!

[1/1] ARM: dts: ti: omap: Replace spaces indentation with tabs
      commit: 973ca75604c81c985224624f685f0365e1ba78bb

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

