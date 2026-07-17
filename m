Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B1A3F6C26
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288734; cv=none; b=DQmS/foA6RkGMYPn6pMxfgXa9N3j1i8Nfpc4aQ/qL4e/gpec/BN5f4kqe7qzzvFh93iA1hb4i+C+Hvy5jzz2RNgCbMcWlpzeXZMxXHdBW0KICd4deNnPwu38ZFCrzlrDQ33Tyh08dF1OAJ/MB8wP+s40+FkpijG0Pazu9xJQQ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288734; c=relaxed/simple;
	bh=9LbC1FHVDDMZdYZI0WqN7RgRzl9vDprPfnVnjf9MUaI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UqjrnDOnYy3BKumBh7J21gg+kZfJhDdCdSfY7/6XQOBydECfEM4hWCHOUiJKXAsamb3z9/8n7zLAyU+GcUn+hKQHcClInA+Ao3x0dm4Qn7Ozt63ZFMN59yIxq08Bjrqwr9ZLOoH+xrVk+BEZZtw2D4ZQM763CThH+8UuSlrH65w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3ryjejuU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3ryjejuU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so2334725e9.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784288728; x=1784893528; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EpUodwbhkAxMkmXtH6zvZRrKPhM41ygJzANZM/9HTt0=;
        b=3ryjejuUxYTfUqthX+6JVN6mV4yYEwMcwwceDmQrFthpdosF7FuHqRBin/WkCEZnfc
         bVroc8hCNxndz7pvXLUvmwl6p7CCRJNsPbGMba9+tUWK55Wcj+Tk1RVGU8ugzl5QddW2
         q8Iufr+sGixnWj8+4asi8Im4TMPkuzSvcO5lnxNomVM7MGWX+lrcSJkZziP0Xo3ksALM
         rsrDM1NcP0yxr+dGz6BE6jP1NmUrmCclnYszoHLLq8F3LQZniEoZR1rJmj4miHCWWSkA
         6Jr023hi1rYPAIR6gqEQbwektat4iwt4gHgQhkBgEKNdGr4MBQr9wzigV1U7jcf46svq
         t5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784288728; x=1784893528;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EpUodwbhkAxMkmXtH6zvZRrKPhM41ygJzANZM/9HTt0=;
        b=JBZYm+FWWrgr4qnIFW367RFwkAqII7Q0hG2VTks2BBahq+htTUj+ApLVTIo8jJAEOw
         A/SSWiGoB+U8MorwAQ8gQtROLpfBlmcJ1nV97VWpSpEvqmXMEJh2Z09fcCC5WfEYCMQK
         h0pgWAbNO2eqyfwA81ScPMc3LSYVlEDWYjaWeYjW/KVxfM5xi/LIZaZSdJKUawUhYs6N
         NVo72DeGLmOsqg50rsYILu350Fwxk0igFKhuD4qw6C8Q889+bt0PYJUrF8HX+ED2O5mu
         pWyTaLqjPPQEakOtt9DT9axlbcsOVo4L4DrRwIoxZSIA7Qm+h/iNGUu8g11vsS8QsWJy
         zpXA==
X-Forwarded-Encrypted: i=1; AHgh+RqH7rhIz5OCtf/nOcLWvnRCDVxYQ+0SAOr6e/uq5Zk4INGWecYMwgl3Y2r5szzggPPQh/9/tIaRZ5D1@vger.kernel.org
X-Gm-Message-State: AOJu0YxcMgpk+BEMPxXGx1s3ZyCGKPolhyuDFHjp45ri+6mEzKPE4jV+
	UI5b7NoaK9k5nfjJ4Fwee3K3xh7LzMddW+B7jmr7v0siLDoOVt8tp2SrKtIOC8u5VIU=
X-Gm-Gg: AfdE7cnkTTYvBPVS7XocxjKMSLWgTGLoFGGfrwlut352bAFemVAQLP3YTlZphzE21o5
	1Ff10ysdUEhDUz8O0cjmc4LMd0f8kIjt8Y4OUHrUkuhYDiBUXoE5Wkxc4pJEFwfYPvxSB3XrNxB
	OgIjNZGJErmAmo3Wf32dtUAdkBVsQOcSU693qTnOzIOtHE2E4US8pusl5gWOt54hZDVjS+oyG+S
	aCa70eIdeNr12piCFMO6CTjbJQH7yDjMHGWS/wAIACcqjaXirtqoUME79ouV2PM4zYBthQD7hrX
	GdRWlUVBMODXQEQYuh7Zi+qcmS207TFA/gAAahbNEEt16biLL1c0OyL3IjGabrZJo/7WQhUn72K
	Ydee9vfpqcPrmsSZGyvEIy4mV2VW7sbtocvFE1dm9f/xR7XxIUMQ6DMDbVfOepfytA3mtp/RG4/
	OJvjeEWv0OW/a73+0=
X-Received: by 2002:a05:600c:1396:b0:493:b150:c607 with SMTP id 5b1f17b1804b1-4954a3f36a9mr25499865e9.12.1784288727673;
        Fri, 17 Jul 2026 04:45:27 -0700 (PDT)
Received: from [172.18.170.139] ([185.104.138.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm41353855e9.0.2026.07.17.04.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:45:27 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add Milos CPU-to-DDR BWMON support
Date: Fri, 17 Jul 2026 13:45:01 +0200
Message-Id: <20260717-milos-cpu-bwmon-v1-0-dfe0bac9898c@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2Nyw6CMBBFf4XM2klofTTyK4YFrVMdY1vsQ0kI/
 24Vlic599wZEkWmBF0zQ6Q3Jw6+gtg1YO6DvxHytTLIVp5aJRQ6foaEZiyoPy54tIb28qwOZLW
 AuhojWZ7+xUu/cir6QSb/MpsR6VXqVV410EMiNME5zl3jacq43R2hX5YvqiRshKQAAAA=
X-Change-ID: 20260717-milos-cpu-bwmon-fce32974efb1
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784288726; l=983;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=9LbC1FHVDDMZdYZI0WqN7RgRzl9vDprPfnVnjf9MUaI=;
 b=vrKpPTrZL0S2ljLXdwMb0KdZ1gBG0K3Q0BF4hIQXj4WiGn98nVZ7Q45EATOPjPOb57d+Gw0ZR
 mTE7gVnOQtHB+UYaxZoWMscEQIhJFqmq0SKKNOpYD723i7Eq4WoxpWu
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the bandwidth monitoring block on Milos which lets the
driver vote on interconnect bandwidth based on monitored throughput.

Similar to the CPU OPP table series[0], this would benefit from driver
support that can differentiate between DDR4 and DDR5 RAM since different
votes would be correct.

[0] https://lore.kernel.org/linux-arm-msm/20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: interconnect: qcom-bwmon: Add Milos cpu-bwmon compatible
      arm64: dts: qcom: milos: Add CPU-to-DDR BWMON support

 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |  1 +
 arch/arm64/boot/dts/qcom/milos.dtsi                | 49 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
---
base-commit: 19827e7930a5511c68e12aac6e4522f3661a1709
change-id: 20260717-milos-cpu-bwmon-fce32974efb1

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

