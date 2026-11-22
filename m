Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368923;
	b=PexTFrGNF+auTkEzB5clY6WWcuY+yptmnQ1yMNm3IFLNovbvPChZQelYjR74E7OSUrCQ
	 zF5UZAaD2XjpEKAotCtQdafAyZ8fu3WOTYJPyVBx9qxALYr7P4z/nBD+OyY4u6ayTOPFd
	 avxb4DwLCmzr31xf1GbfycXFgqToUT5ZNBOvTsbCP8/fFN/BKhP/kwC9yVRKrK3Ax4SN0
	 EiIdy76n1z4jW98ZU4HEvVHiRfdSHYSu26X+2LBKTk4mJ+bZDZhVFbm+f0PTxNmroJaVg
	 Posfxy1n10vXSZW0cj+VIPZCuyd+xl/vc1T8oH59s4gldj+7NXwM4ipogWV16QRxpSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NR3IF3W9rPY84O5okCDlPMWK4xLZD4rHGc1s940WQoY=;
	b=G72gTWYYp+JlNHt6ycRRimIrsf+joE4DnRW6GzHBFYHyvh2Xy3RM4/Mm4Qgz6M9ZmH5u
	 /5UZAxukMrzyeNHfWLptVyQ0arHbUwwzMEOxOt7fXZkcXUOB2ODD9+VQlNBKUvjHi1a4V
	 X0u4vWluQ5jr7rkbTvPjIvuG+4THcW+dLjY7MmlsMPmfFd+B9yfYIflhlwf9I40AFbbaJ
	 Z4MpcA0Ro8krJ7ggal9ZEfsAllsonSQMHJNCGd2ZiNeXXbRvGcFBwlut9FPEvIM0zUmH8
	 gayyccFpesRYUumJ3Igk+zWy2GAWr3bWXAnFsRsHWgS5AlVsW4dmhH/SKH+/Bak+yXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4qC68+X;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8782F606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8782F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4qC68+X
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2982904c88.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368922; x=1795973722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR3IF3W9rPY84O5okCDlPMWK4xLZD4rHGc1s940WQoY=;
        b=W4qC68+XpfqvfpwyUVqGzy3qdQukJLa8vbARoxPiUyULgvpMdOLwWZ9mdNp7Y+q1S/
         a2fmnkWbUQ4g3PDmBD2Xi+MVOCf2H3+KwoihsgGiI7itQbQQB35TEA47qniEOyOA9qZU
         fW3nC8iru80q1ix8yEct1+VqIWJEeD94z6WUOs27OvHaulTz3Kv+7Jn6/lNkTOkLGDde
         /5NAWSb/AoExQZo3VKznyWbOCIHfqdIC/+3Z7mPBw3mqJoMXBOOLa7D4Ud9zUSgp3jnF
         29MLaCjxJOAS/3R/0vMjJWRGqddVakOkvd0y8p2F58PDKuc9jgJYBZzwQjZUcaWQUHDi
         QNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368923; x=1795973723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR3IF3W9rPY84O5okCDlPMWK4xLZD4rHGc1s940WQoY=;
        b=nsnHMbNATbqdZzucUltJgkcFsVzz3O9POAh7qHNYo7OoREoUdzh9T6TAEG4XReGdzQ
         fJB20OY4TPvcBwMDykRJyK0MufDvseLMVYiYXe8WiUr5W6B+UlG5KJi3YMTY+CCcPHmg
         41oan8j1YQSHtVqKi+V9m89hP79x/8P7yn4MuSjvtVZniuGzCHxkqVIg5fqgNW12y5wk
         sFaUAwiqyXaSGfZuOvnrbYQDO7ueKgcrVKL21oaHTj1pIOS+lAB+SVrEkaSvztPfPQBF
         jmbNESQUkSP4MHM1y/s9awpw7+ezVUTr0uyoXGn/XQpkUNSyNJdMLXdKG/NYlzH/2tk9
         W7/g==
X-Forwarded-Encrypted: i=1; AL+hErF/Gcl/KflzCKPnid7u6qTuUm6YtBsywpL4vTRqab7XVWUTTnlTs5f41tMgeaSfbN8OHnHcxsRrMDrk@vger.kernel.org
X-Gm-Message-State: APuU4Z8E5gKTq5Yw5TxF2BkTFdTrMaqXl1V37mrzn/a+5cE4flKXt4/0
	LBk1jbXx8oqFE8U+43JSIEM6SqGkrJhkdyrMhq+u+ONwWjP8tQEbKjdq
X-Gm-Gg: AZFdTZfnd4JwMGKprhQ97UEyBtkAc4pWro0WsKFhLDIjX6iVp7fZ1qOJx8iPXt/jQO9
	zRz3AaAyCjwZf1IswsUfDkxpH7V61FE8r52HowTdPJuJgYb+4b+k1ED/qPO95TFQ2YdvcadzikM
	T4c8WCz4wrRBi4bUA7rQ/MwJ5O14dcYHYVVpuOK21fuuRgHP5EoilJhSLjDbJ7GaJiArVR65g46
	kHkwZafg2pyPAid4WsuvBGgvzCMAOrkMSgwogrOsygVl9TBPQOoDJPk6wcb5ypcAAmPDzdjAjeq
	E00h6g5xbTprVDeLUbi1d02goa6xodHbkErwebfJbmJZSqs2tNQnw9Q9LTnbs4pyyOkTpE6bGoz
	QGQjljtn3gluQ6ow/BZAidF0TuMSGuW4gf35fAkK0M8su9Lc7yR7bgRH4mWdvUoLDsNpWS5KVNJ
	dLfOdiHzieOPYsAquQ5u0n7nt79Cn06+nzukmv0fUWyk6+gQ9xeS2EtDgQ6jmsknaZevzF9//7x
	0Tqm78ecUOrt1F+u/QIFFKF/AiwhafZVabykjuGl/80s6waWeS9sP0Ij8HASWRH/XipAXVw/pn6
	0FVluMfRDqoonlH937xRakMZB1WzX6TwCzg/EfjxjjO7OsKJYsxEk6fNIzZVU7aHyi7Pm0hSV/Z
	5F7lZFKGbwQ/8NQJjRDZUmIbcnfnCM31uTKWDdjEG38foVJwLsV7XzyV+wO79q0Mj2HzC7cda+4
	Iqaab+hzJZeoYIxVAhPtmWHAwLnA==
X-Received: by 2002:a05:693c:37c8:b0:386:a0d1:1b41 with SMTP id 5a478bee46e88-386a0d136aemr7108384eec.34.1795368922569;
        Sun, 22 Nov 2026 09:35:22 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm6419485c88.4.2026.11.22.09.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:35:22 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 22 Nov 2026 23:04:47 +0530
Message-Id: <20261122173449.21009-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
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

SC7280 LPASS LPI gpio5 can mux EXT_MCLK1_C, but the function slot was
unnamed and the binding did not allow it. Name the slot and allow
ext_mclk1_c in the DT schema.

Changes in v3:
- Fix commit message: do not claim existing SC7280 driver ABI.
  The driver patch adds ext_mclk1_c; the binding allows it.
- No change to the code diffs.

Changes in v2:
- Add the DT binding as patch 1, as requested by Linus Walleij and
  Konrad Dybcio.

Suraj Sonawane (2):
  dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
  pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function

 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml      | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c              | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1

