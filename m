Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7B525A66
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 17:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914275; cv=none; b=PpKAljYfHRcxmvf9Meeciu84TVsgoliSQw9j3YYvc57lgjDrpbmqzNbMIw8TdMHvHOQhszYcGNwNz7tmK8L/+Le//edSB7xtf3MNv0teZOF2e8olj+hGYh3SqsIcmMN6xQaxYKeiuhxBgNxOEN1hKD/DmI2inUa9/Lw+nWZ7Ayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914275; c=relaxed/simple;
	bh=GugSwvMULIKBhmXbHEwlcQ42TI86YVxrh5vB+fzkqc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UEmcp5jOpGWY3uvFwwtZ4HSEYmbzTXHbuM/CStkZTtM2LtLiVgBRG/rpNwe/BwBtEHBeYuMUi4bduX4Hz8FGa0w6gYcyN9eJ6Ha5XIz4dEF2NR8xNfcc8K/vRBLkA6lboXfdJfLDBbzdDEp1wkfrMmrdl+K4wX9gy3uMOKKKzw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKOOWfUm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKOOWfUm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso18109125e9.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914273; x=1792519073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6ZTA5XoiG06DywZLo1HdZL0nmmg1bBIa4aTddTkmMk=;
        b=MKOOWfUmQEIt5C8mAFKmz6/x3xJrZ4SbFYAuyJb3z6diSUHP8rN10ysxSd6nWErz9c
         rYfBnZlEdzQ8jCid7o6v5JzzQuuHccw3s93E2FwJOnAcGrfZnZHmZP1gstWtP27yWdWi
         mzVTT6NHUua0wdkDPwRCkfUFsRdoAlgo95dYrdCDfm5W2ecuGYTvazqJy7sYQX9lMq48
         XDusO6PUDZzv/VUN3bZjH8vXFbGgbIMsj8V+YK4nnsD2qMofLDtlJqUaaUwnup9+J3D/
         /dGAZrV/hCDNsb1Q69g6FDWNXTQPZToHGdZDzzlIK9DHixhDxaN4BlVCb/s5IwSiigNV
         z9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914273; x=1792519073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6ZTA5XoiG06DywZLo1HdZL0nmmg1bBIa4aTddTkmMk=;
        b=vHEco5EtS2hV2MN8L4D0RLcNlnSzRRCQ3sg+jYqVVLARf7XKAfSCQh38cWGsknyn/E
         EjEGgoshGvBFJE/Yb09dUZm6HYCMJgpuOHwBQ0+UYmPV/8D8ITF0TbCUiEqsH++N/9qv
         wlLzaY05wuZDuRfb01ViKHCZCVDt9uOD+5C9jNnT1KmSbf7FA6WZD7QY9r5fbRJwM3Gm
         N3SuuFeK1fbFRKDVwx+V+LShy6wia74Q8YQ9VNKrTD6NwxxbYeTFLwGr9yM/75ZFB6Wq
         EWkAhMuuhP+NDgDnAVs8+qYESsyVvH6+2RmLC2iChSNQSC3pbJ7qNHfJ7PuivfGUq1Av
         JnGw==
X-Forwarded-Encrypted: i=1; AKwUvBw9BIt8i9TnZ4xx4AUXJSwSZiBGEdaCjpsG5tvReNYyeCfBx9CZUxKqSAtbAi17ixs0SOJtPbRVRnw+@vger.kernel.org
X-Gm-Message-State: AFq9FYII7FlCD9uMdTRkz6ORrCzn/vNNO1+54og58NM+Pz66R9nq0xxr
	kM/TU91UtV4Zj+j2PrLYAM5l3xEFbfslo3EOJBWB/6Y7/ZwxOrQTguB6
X-Gm-Gg: AYBFou3vYctbx+qJm2zL7GtYL8mvfgJakBXxzqLjM8p5aL3seQnr6CpCnMOtMct/8QA
	YHbKrEzn/tiCwZMG+m2dB3gHrSdy/6YiW3RQEJi/C/oQ2A+8pc7+5Zl7phuizFqCikr/7vcxfVG
	bM7VT5Cq+K03aAZGQNAWRQnOUENqSg52X0ZQPf9ikaYoxXILpZXQGW/dPin1FzrnfKGIJJyAm3l
	T/6KWvVERcpV0a0dq6cMZqaUcHx1fO4ZvHYiE9rkdbO5kl3NpbswjIi5FKSQH+sraZm1e6sPCij
	9h8wrqO2/hBuqLaTTtJtI9kxw1te03S/Yl2YjrOnsJvvIkZRgb4vYjYx47CwCtF6srSN4POuc/q
	Hp4vHs6B4kfiEssypF/XyFkP9FbqbiOv2SoLKoBaew5WNxwScPjeoxDk6k7Zcv4PzIJ/L1vE9X/
	6Tmq22OTh2P+Y3VQEbVUSyOqy4KL3MV1Bk16crr+jiJyo0fBYuam8TOc8OtbWOjsUs2Jjru8jj2
	Qxsj80k50nuKzxJBaIf
X-Received: by 2002:a05:600c:8706:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4a18e4b0f6amr249667145e9.20.1791914272805;
        Tue, 13 Oct 2026 10:57:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm447804745e9.1.2026.10.13.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:57:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Tue, 13 Oct 2026 20:57:30 +0300
Message-ID: <20261013175735.473704-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fortemedia FM34NE is digital sound processing chip used for
active noise suppression mainly on ASUS Transformers.

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/sound/asus,tf201-dsp.yaml        |   80 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  388 +++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

