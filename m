Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581850;
	b=QpAR+UIUhngLKmYM1xav+uAYUikdmgvyF9kR4ym6JbVLXrp4bYMHWYCiZ/N92+OuRpLS
	 UX4UUx8DQI59osBDrdyMA6B+rzes4ezzRYUaMQGtSW8+Obk38a+SCQywKqIzlQL1znMqv
	 g1uoo1f5yhoIwjcJHLsnvB7mZAaxuUk/EQFPpAIYoVnTFfhA5S9wgLl5v92LUSkmoozus
	 C8Ryb87sV/dgkzFjXUtCOWWDbX/q2cFqXg0KGgHf3v+i2NCDYIxU6Qyox8utp6Svtk9I6
	 j5S0bJChrWY9GpRwepa5/IQ8nOCVlnkMndL/mZPmRICBFtxDQRj2/MkQ3xEVYEtFEhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lZnQS5vzjGFgkIk1Rz40qxA1rsbMTGKx4DvpvdhHSZU=;
	b=gJgQ5jy2Uo4/0zE3wLRJqQuOe48PIuorm/QVR/5CXdV7sUOT3KZRGxywlCRrgljz5KG9
	 X9YjeW+nZE3Wf14Y41E67NG4+0JKBpNX7U/hlT3Bzb3XR5ctA13IuzYELefyMiFnJoF+c
	 MXbCHcf+qCYM+iQf1R2Ua3xnSF+iHADD1EIAlciOceryduU9FkNlIduEwp8gNGQPUAJuA
	 yJfdStKCw63O7qnBOiNjt/KTdJg74g2FcpRXrqmbVKWSejWszeF5sCSNHpDrPua3pUl9v
	 rcmFFgHL+6lHW7Dr+zMGwje41fwRnskQiWUnPfaQvqqglV9sI5pgWhdGLjJjQ+VnfjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K9CSmkJY;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98F606A334
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB98F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K9CSmkJY
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so242594266b.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581848; x=1795186648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZnQS5vzjGFgkIk1Rz40qxA1rsbMTGKx4DvpvdhHSZU=;
        b=K9CSmkJYNmtAbvWCYPrP+SDpZMQQ0xdsPYXo8PsLi7q0i7Is28YK2oObjdZIdIT9Hy
         oUZeGt2AyBbZItYfe9wK+vYDeM1J8WQInwUA6ANAfPmVZ6W3eHYOh2uFtetiapb8VA7z
         2hJQEzbUki2GkUe54rvHxcY47jRM7YZ9kawcYDZpTB1ajp4LEuTAmkgk6NQg2C0JRwhT
         FJuYRGnfvm0iGRi94tXz55orMhZs2oscRwq261Ud/F+R9cedJFud5B4MJ3u8ZUVekYRC
         XXw54HRwFyv2zeglylezSoT/W0SPhglx0UvxuGoBYFkIqAwretjToNI1b3jjRZTQzKP5
         Wdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581848; x=1795186648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZnQS5vzjGFgkIk1Rz40qxA1rsbMTGKx4DvpvdhHSZU=;
        b=VQxYpW3/bU/QAHga1Eq1NrijBL0uS0OJUSV173VEwcV9upa2I77JX8ViVH3XdtEd4n
         Kb1l5AuOQ+V1lCZcDIKz1VoyVBDKKjv5mZ4Ys8NdsZ6M9rkHYHuTCvVi3K04jnjFLyvY
         dqwm6mPINoyJUwyEMulpcLzq9vSdpNQwr5+KUi8WJCwYIsn6Gp4dmgPPCf6aL8SqJfiS
         dfOfC52gShSTk+xwRw5ijCQUxjjNhDJ6us5yK/MC3807vftcY/WsDtltOH49TfgBAw/d
         N2PSL58SYYBEW4bI5k2nvV0HFBwZtE0PzFjgkRR9ZG/tYI+2VEYVTSuowrd7z1uqonSi
         Uzzg==
X-Forwarded-Encrypted: i=1; AL+hErH+/uCor2Boxy1IzQtkkGQGEiWgx332iXwo6AgI8j5AOeyJf/POQRgCC8NAOgQfy46X2OCildTivuGF@vger.kernel.org
X-Gm-Message-State: APuU4Z90TA+q9U3TRF9eOGzJTFWRPbdNaI+WM7mQrLSwE8B0GzEJDLaS
	tdX8KLLdwV1tdvuiTwzEcY//TlZ5tj/yRuH1+FDWLtWFhOprY7qsiHEe0YBfDA==
X-Gm-Gg: AYBFou1xNGZVOW0ZuqI9KXjzcmUT3JtexLKyTgUWC4SAAuJfD31GoyaRbdu02mCakPR
	nhUjQPr3HXSW+2cpH/eg0O0l/0S+Q+Qpf50ChjfyuzUot1C8yVQnROg2bowL4Eds97xI5tBjZRg
	+cfUPLUd+wVvvjFkHDCu8+Zgv0cmslMgMcOt/Fn/9ikJdIS7LkQjZkPHhZiHGoNoBJSyk23e3zI
	SkrRjpYXHajpoT9c95G+zDbIMQcupvvzO/tot2lO9cE7amvxO56ItuxbzjRb2iKPB7CAgEJYOt2
	WJlk83qxOVCTp6zesLV6sI1dzX7nT9DxW4mF6dlaLgGWLOqFUHQoRabTZEcVmgj1eP8dFH+XfDD
	LYsyysg8adK4vBfz2drfpJgFKhNGCwx/uIWVuH5SuOjizhLqgl8NExk/tDB+WBqPe2p95d5to4I
	9uVd+Z1MwC3SJp5HZsFeR7bj9n1ffd9IuogMpawaL07BQ+AF3Q60ZlOn/0ZKnqOphgH8vf+46sb
	JBZv8TguMOfwUu2bt4kp16VbN7HXuWQwZDSjh3c91irdTikRDsyLrO4glH7PL4Gw+e3UIgaKecT
	Zfiq8hsTPnBTe/nPYO5V8ngj9dRk6ga+pB+Qy8TsXZGakRwIfl1qVqubIThfu3Sd/5ta6JDJIrj
	reRwJ5zjra64sBDboMulunE8+0LiXpo5R
X-Received: by 2002:a17:907:3d51:b0:c34:c5e8:1dc5 with SMTP id a640c23a62f3a-c5096312247mr256633166b.20.1794581848001;
        Fri, 13 Nov 2026 06:57:28 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm109937066b.25.2026.11.13.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:57:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/2] clk: tegra114: Add CSI pad clock gates
Date: Fri, 13 Nov 2026 16:57:06 +0200
Message-ID: <20261113145708.261530-1-clamor95@gmail.com>
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

Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively.

This change is similar to Tegra30 pad clocks and is required for CSI block.

Svyatoslav Ryhel (2):
  dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
  clk: tegra114: Add CSI pad clock gates

 drivers/clk/tegra/clk-tegra114.c         | 11 +++++++++++
 include/dt-bindings/clock/tegra114-car.h |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.53.0

