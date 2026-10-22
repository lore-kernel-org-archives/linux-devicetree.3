Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661787;
	b=FC2UeBHMCi9bRCbNBY2d/wReMgWL60IvfOPjX0MVt9XapSfD5jrF0RFuiq/iY+JI5pOk
	 f6DZLDTypTOddJQe7rnMb6xwbHYzrGCVkW/krOYU0FQQgtqmtTJUpGvspFT4z40KvyXx1
	 /dObaMrvxb4B7jcd3WCWwArnV0A8pQMIvD3U31Pyhk6wpUVn8NXhkkXfQULfw8ph1kBwq
	 r8ai35rMIiWr5phE7iMCWrObf7cc9oXrTVYVYsLVyJkhzXCrjAXjrUDBqtwPvLJLHVgLR
	 LWOcuE0cTjkl0u3+9y8sVBksC0jJZaUWmPnjgXAMuccdim52Bzo0T39ih3XKdsZiiuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7q9b5W9djXzZL0EMGmOjkz9fTUnN8mWGHmYaMiFb5A0=;
	b=bhhwXuBCH3TazFDkCvJfDPVhNxEIxT6VTclqnRZ3LF5Y4/HCK4gU4aFHd+nOM+0YJMV/
	 PKbHNCavw14Z9nvHShbhxLajvxI/2Xp4FTCf7BSOj8jeuveSA0TNVo9Qsbz6sZO8wserD
	 CzkWRrL+vwmzpXvuTmC+UnvW1+9nUD2cfubeAtIG7qQBEcBOwCrIG6/AwYgKBR5JdavF1
	 WV1bRKKF2FSu7/rpGTg8N1y190+i33+Ycv5gNploqMq3SjbugI1iSqIILvRv3ocBuj7zI
	 iH2y/0dsB5Ci4GgFXlFfdOS64W2sPqBhM4XQJgzgAHgEHSWNrz0VeFjAIp3shzuTzVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rziXJ9qi;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257F0606A327
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 257F0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rziXJ9qi
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so8235845e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661785; x=1793266585; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7q9b5W9djXzZL0EMGmOjkz9fTUnN8mWGHmYaMiFb5A0=;
        b=rziXJ9qij4OFJAmAFJ1BxqIN6YtdjyDlhmFtcq/QtfnV73Ld97qwC3N25XJD0qIktJ
         CkWUPBm3hxSp0GWMHm7REXa3Cl/0RafAkOE4nZtt1cLIr1AaTf0Tw16aVNbquLwqtGHE
         Y/J6pmsfvbIznOgNAE3zPax9iwZ26dsABvE4BvIGxht/tkD60KqK3CLakPK2605WnIYs
         pUaAMIyyvDwMG0reQWBDIqSv3s6P0XFMAn0q16a/UNhexiQzt7oHOdZXC4mZIjZ81d2K
         hon5apkGQ/4spv1+YofFLt8MrmjYV8XQT3jYR86SopPUIsX072M9WKF0xofnfzrWBA3w
         Ki2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661785; x=1793266585;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7q9b5W9djXzZL0EMGmOjkz9fTUnN8mWGHmYaMiFb5A0=;
        b=zwxonF43r4tX1yuHl3JMQcqYZGzrGCezK00MUSpkVqaDG0etRKlt16dGPNLQF94PqG
         tmdUm3dr9LGRPccNA16rpbV90RkBhlcG005pepm20hRtF9eAmwtbxZL598DWdUKVkPwK
         LmPjnBWTUUhtGoXlfJl0YXFSMxD+xSCvSvE2JHMS27X9O0/hm8TAJrIuV+/Hs6G9zObc
         jTFrp1LLVQrDm0Lu0OTDM+CbwuTfIYBOQWBXU8tyFFqEhHcYgoyUDaasq7ez3N6BO+/R
         zu7GRE0lyc3RKSp5qPYc1+cijhRzEENcbJqajqSZEZgKUKTXd3nZOntCm5t55hTV5BKF
         9yIw==
X-Forwarded-Encrypted: i=1; AKwUvBzVDZa+wczM7bQ8AXCCgRWABgFW02PzXN2Obt0WVysiLEbOdUECCdFltZuPIseU5vSHTl3bOjPBhstG@vger.kernel.org
X-Gm-Message-State: AFq9FYJdNmpXGf5xvazpqSVa/9M0anmw9FklfIHAJKxZRa1YXVtXjGMB
	kDw8MASSa8LWCfkl5zSBDMGlqUNbAJ7ltK1co4eFHNYNpIcbKAoiwqY1zdfedPZ6JTg=
X-Gm-Gg: AYBFou1/pQKOJUCcSXTNXFRXzmsSys21/Ivu0YVXyX3cP1W8J5EcGkZLny06ps21x7E
	IwQ5m8Rz1jGOla7sY2tY+5wLgWLPd6mkych2Sa1DwOPg/VHWyLPbRO5ww4OYGrihFrtPSAm1Dl3
	1JC6/QyO7MQ9oFXfAeHaDwwHQRVa+RGjP1E99cLCdaWeJsBalCt+d9+yjPURdVprsU+xvk4++tm
	+JOaewXVuYdcckVmPZKV96MxlCkqRjblBaKl3C63xzIW78Ubz9V3mXkm1J+RHmz3V19b3Kph6zt
	DVEZod62wGjUlzsgeN0yvIN70xbUA9+u5Ss8RAIggbnhCkMwFdx+ntk3Wz2knPFs5mHYqEgGFbF
	lKV/rpgjG39n/ENOJvEezIdsewux5Q+GY4p6Pm81xYBttnrP5UEhFx3RU3PMdxV7uEJ8sUznZQW
	F5+Ll1xTa73/0LcZqpwPerVYvtBWf5WsVtSnVFNNChO5oxAcqMtK8J6Z0CprEAWrk04X+4TCbOD
	+Y5bp7+pxoO09LcXewc3fPwS0RvcURC5R5pCXjaNboCDMK+pgr/17VyY8LePxc6mLu4zF8=
X-Received: by 2002:a05:600c:1394:b0:4a1:f714:3f3 with SMTP id 5b1f17b1804b1-4a1fdd41954mr97614395e9.30.1792661785212;
        Thu, 22 Oct 2026 02:36:25 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/5] arm64: dts: qcom: allow SM[456]50 HDK/QRD boards to
 play audio via DisplayPort
Date: Thu, 22 Oct 2026 11:36:20 +0200
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIABTZ2WoC/yXNTQ7CIBBA4as0s3YSIBWrVzEu+Bl1tBQC1NQ0v
 buoy2/z3gqFMlOBU7dCphcXjlOD3HXg7ma6EbJvBiWUlkIprDGxwxKGZS9wTqVmMgF9QjPWED1
 hGs3bGvdE2ctBHw+9t9pC66VMV15+r/Pl7zLbB7n6HcC2fQBi7tCNjQAAAA==
X-Change-ID: 20261022-topic-sm8x50-upstream-dp-altmode-playback-14186974db6b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qKv53hUCdB5HADSZusj8p39GNxevUv3qIqlUKSPJa3I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkVhsuZdM4BaihAYctDIMply7ywt8lea57J3qVq
 tY3Hvz2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFQAKCRB33NvayMhJ0dywEA
 CbVpybwZzi2MlMF4IgUep6Wjr0GOM20uL5jax/ZKCXVifV+OwYJz0ad+kxhitWOp0hNn/zUG6Vu/jP
 sm813xJ2moEo1gGo94FCfJY9r6dPd0ml5XsPuby2V4LyrmM7UgmAcVTb1n0uM4Qo6/g9D+YonjEfJQ
 hA3xZxgEBmIfNgyfJIH3f84Rz2y1JJ3YztW19BMJpPkG8OZ9KZUQFctozxAbVqxM7FHRPHClvvd9Ho
 E2hrRt6FghBvOQ5SRY7PcgPAmRSo9spaFjobMcyYDCjyxE9C8V6hgWAxXqwAYNwYCYBnhbjqpltG6n
 QgKCBBxY+3AfX3hAb46i4G7czZd3rhzpgb+TSaRiziR2ow5lcP/f1og4gZ/A0OumVemsKKLbB5j9aR
 gH8siSt3SA1KSARP51Li6JBqM47/RcU7sb7pjDMM4D0/l0feyy7+gpWM+ZaA4l1uPx2NqFSGGKWM5Q
 cNTGukeVp26q8lEGZmyCyb02tBb9tc5y7fHKpHnp7yLYsRQckWz3d5FnCoG97kso0Lsws/e3F6nukv
 YRo/9bqvKdaCW/K45hrGRJy+VgZM5EvaDgPXGNC305rVNIQ7ZfbGB7D2yRMlI/m8+QXfZHIQilf01A
 2YoNeqbDZk/kkY280LoLKEcm2P2/eHPXI5JBewhvL1eawd3QVJfSB/nhuJuA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the DisplayPort altmode
outputs for the SM8450/SM8550/SM8650 HDK & QRD boards. 

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (5):
      arm64: dts: qcom: sm8450-hdk: add DisplayPort audio playback support
      arm64: dts: qcom: sm8550-hdk: add DisplayPort audio playback support
      arm64: dts: qcom: sm8550-qrd: add DisplayPort audio playback support
      arm64: dts: qcom: sm8650-hdk: add DisplayPort audio playback support
      arm64: dts: qcom: sm8650-qrd: add DisplayPort audio playback support

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 16 ++++++++++++++++
 5 files changed, 80 insertions(+)
---
base-commit: 5c2379ff1e0d26520b3edbb58fe2338fb17706a1
change-id: 20261022-topic-sm8x50-upstream-dp-altmode-playback-14186974db6b

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

