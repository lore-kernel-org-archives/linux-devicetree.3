Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795299673;
	b=0jurS02kW1w94uZH4fVg2kkU8iiPh3Ak/OyuZTGyORD73T/n9Yohh1lbkWvsITLnOEwx
	 /N9T5sWl2T8AFBTmSfVyCJI3q6hcHc1IjhHzkMeFmBUPezkTldoPuvk3H08fwIgYaH7FG
	 E73KKr0N38DNmQEuxFNN0zmnDW9vTxnJoYGzsWCzUa7HU4xD/JgPCJHXKosBjM6tlVnby
	 S/WIOZZKV6mZTuaA5XarL/FuIMXkBDZuxoooLYOU+JVbFAXkb9TE7vyWXMaRDlaK88D9r
	 1YUl4/payXK/B79L2BAvO4AC8+KgAbZCHCiBMwYNbAQ+duJdisf6eVTiKpV3AqA1Pyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795299673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=5eUjyD6lMD32t5ZqTm+/uDRHmI2UXnPx7e+71IoFIgc=;
	b=vnZJTkcAgnL4P/a+l2XJqzeuiP0FW2z1eEt0VSaKQUOkrb4TSxluJiOV97ncBxs6lm1u
	 klGqJ9d4SoWTGQ95jkR27Lt75kCemXgwgYc+Ib8KWYk1z1nYyVNWAFQCM/zPy7tQEESGA
	 adHdhqjuh9oP0HuGjvMt1YQCKiGba9f5u02riNJY7ZyFLhLLbxtNY24l8uQWTwKb6fRQR
	 qukTafVs11GAJ/BnaWuHJmg49mXoGvLXV2VHumg+vbNPIzHDWPudl3uevLwuyWIxrE76+
	 LsEhOR2aey0amQyBatsllVYYFUIlWX1ymUr7SQ/VttGIK3KgIbWeBcC2eaRc5001r2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eNxPlR/g";
	arc=fail smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28E1606A32C
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 22:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B28E1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNxPlR/g
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so799196a91.3
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 14:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795299672; cv=none;
        d=google.com; s=arc-20260327;
        b=er2dGNzbhucICdscmTMcLyLZC4nskiY4tK+9Zwd8ZW+gU7zDL8bQNLgnuFSR8uM7Dc
         z6IMe0/eBautqInAWCvyRD91iLJD9pxpfV09n0pXnTnjidZ8CKJuo0E56tpdS1hYcMDh
         pmm7LHAW3/briekGDcHcx1Dohp4Wu9rJkt3Ylxc+LLrPTppt5VW8iMOYW6KQnAd/yrUX
         AKvspAV/57vD4TaTrX9h1wTGsWD36CWcELkhLjxX34dQib69/EC4C46VVTbFASPx95rd
         iMTAAQoAPwhlwK/5I8NbfJ1YaVYDB0z9H73h0yuEpSlr2iEevmGXBeXtFMli1SHWUZC3
         un/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5eUjyD6lMD32t5ZqTm+/uDRHmI2UXnPx7e+71IoFIgc=;
        fh=B/b/v2EBiz+D1VNBnb5mj3j9mmaURuFHdyMOpy3NeA4=;
        b=T4ajLNNOHM6r9yuZUHxHwM1e+DmdtaZHy9MKWxEd0i7CNnHLIMlB/Grfnx4DZE/3i2
         qtL+T8oIKYnHreyNTWByUg4XxghzgSQt5YETXHKO/o0MFGvZuk9KOgRLUkCr919is33R
         8Wy9gWb+uQwaBe78DfY3lE3PdQAF2zgIhejTCyFPxpkgvBHsfpfsSlkyl4zz+LGYfiqX
         +FhurCb6k/n/ePWcdSYfSsOf6x6tlq0lYZyFvjyqHnyHgI45MdGv/TNviAgcay1vvtPR
         5rEJvAlbyHA6MWLXs4ua+aHGkjnNwIym95gi5b60b0Tq5vY0QbHUmX3bXUs6z6dUd/aZ
         zWhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795299672; x=1795904472; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5eUjyD6lMD32t5ZqTm+/uDRHmI2UXnPx7e+71IoFIgc=;
        b=eNxPlR/gmFsp9E5slMfUGlzAXHTjBEwdCsPq3joo6TCrIWWLOOBFMhMqnqyshtkoBO
         cLglt3f3s2gHHs3x2Y+HesRznH5u/M0gi4q7hbVgCx/kSvYE690L6ZKSL/Omj7gHGvtO
         58BtaJ2/DjDcMpnM7Rjb7AmMzF0uxqlG9CzQIjDODJbEUOuyBRb8FBeWtIKQ10SmsmCz
         zXSJIt6gWTQYXnXWMOOMC7iwN1y+Tg+HbY1Syig/gldz8p+pukJOhx4jLlHQyng7q8Hg
         O4YdLSiOJl9x+xsSDN2J730Ti9Xg8L1YrjxehYTBmf8YHiNJQahpsabsHtIZLCiPV0e3
         DENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795299672; x=1795904472;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eUjyD6lMD32t5ZqTm+/uDRHmI2UXnPx7e+71IoFIgc=;
        b=ezmO3AjJ5RW+wBJ4RK1cJgqKYP8KuBDFTKAdTD4iuxIJAIZ2+g2NccEtGUj0ZTyzM4
         uGRbpw0COsMrVhLmJq7EpyKiOwE6D3bDfoS0+4GDWpTZKXurBemycQoLUsFKfXATi1WG
         STYcehqrUkwEjeKdOimEYg1RTD6Zh0tmWRP7FthYATzSqwSYhx5H59biIf0ePzOVZgty
         uEC530pTWISFV344z/mG117mFM2Q8GqYqwaJoMd+ypKZDAZXVIuiD2GMG2T3moLl01Fp
         gTZMd0lTFTvO3SUEweCpoDaZQXde97FhD3LhBoT2CD8QZabYU5ETWfZEOKKjZb/g9xTj
         LR0w==
X-Forwarded-Encrypted: i=1; AL+hErEvpYcGKq996XJRYLL2x/XydPxYvp0XuMX9AA1+kDWHUZgal+RUEVTPeaeys9Fpbf2KbQj4X8v0iAfM@vger.kernel.org
X-Gm-Message-State: APuU4Z8fDNquxPAQqusufckB732xoBgF8MM4PKhoFo1f35SzD3vRE3qO
	SQnTk3sbnmR1M2LxAILpDBTS6kF/V95EVzWTJeXvSYQceEYVlK0zsDspOoCMdv/FpvQEZlvC3tE
	ZKWE8YoYyQs17LAd0EDsdQxoMMZhSXia2nk0y
X-Gm-Gg: AZFdTZf0Kal5LvirLVLmnr6hz9ZSEZ7/XIBBp66MsPNbUQQ2H/oZGeiKroromek7L1s
	Hf/F8R2fXk4Ti8DjAFTcYymdRw3YNrbE2Nn8XTKp52gm0orrughybkhPGypYLfG5HErikD5MEyD
	jUiDK+XsTOhyaJetE8mBbDUNZGURWMMFRnw9cVeIEEYHMhz/dkFa1baoM0viN7JxFhJTBFH2juM
	b1VMVdSoW2NnWm5kiXHagFuUj3YoYo7wCMH58v16EOlZqQNPjvyGlWUYuUECbGSSTt8D96RAmuF
	ii1FIOc+FOFyzmKtehbAipphPYu/JhXrvjH6BgTIprjRQcx3mja25f8nKvw8s+SFre2f7WAUJgv
	F9YOg1/O3GVNWq8MKIpcxFXMoSz1J9vu2MqmM
X-Received: by 2002:a17:90b:2c84:b0:3ac:a203:e092 with SMTP id
 98e67ed59e1d1-3b41c7b6864mr6590328a91.1.1795299671894; Sat, 21 Nov 2026
 14:21:11 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 21 Nov 2026 14:21:11 -0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: geoca <geocausa@gmail.com>
Date: Sat, 21 Nov 2026 14:21:11 -0800
X-Gm-Features: Aa3M54oWaGiFdEs4GnyFcYKj9Je7NUEFv5NSE69434b6Hqj7oww9wqh-UlyJq4A
Message-ID: <CA+7HbhKKt9thtbS0AR2Gi_Asm5X3pT51xEknuHreyHO2RuWuwQ@mail.gmail.com>
Subject: Surface Pro 11 OLED: tested optional vddio for DW9800K (re: [PATCH v4 0/3])
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Griffin, Sakari and all,

Resending this note in plain text because the earlier HTML-containing
copy was rejected by both mailing lists. The individual recipients
were already addressed separately.

I have hardware results relevant to the November 19 DW9800K v4 patch
series on the Surface Pro 11 OLED (X1E80100).

The actuator uses independent PM8550 L16B (2.912 V VDD) and PM8010 L6M
(1.8 V I/O) supplies. L6M is shared with the rear OV13858 sensor's
DOVDD.

I added optional vddio handling to dw9719, enabling I/O before VDD and
disabling it after VDD. This allows the actuator to probe and power
down independently while preserving the shared sensor supply.

Measured L6M enable counts during sensor/VCM use were 0 -> 1 -> 2 -> 1
-> 0. L16B powered down when the actuator closed, even while sensor
capture continued.

I combined your posted v4 driver changes with optional vddio handling
and compiled it as an isolated module. On the physical SP11, the
actuator bound, accepted focus positions 128/512/896/0 with matching
readback, and autosuspended with L6M/L16B at zero enable counts. I
restored the prior tested module afterward.

I also added optional vddio-supply to the separate
dongwoon,dw9800k.yaml introduced by v4, and binding and DT validation
passed. A pre-v4 RFC and a post-v4 integration preview are prepared,
but the latter is not suitable for submission until the ongoing v4 DT
backwards-compatibility discussion is resolved.

I have since also validated optional vddio directly on Oaklee v15's
real kernel/userspace, with uninterrupted 240-frame capture through
VCM open/close and successful subsequent camera/PM testing. The
Oaklee-specific source and hardware evidence are here:
https://github.com/geocausa/SP11X1ECamera/tree/wip/oaklee-v15-vddio-hardware-verified-20261121/experiments/E003-oaklee-v15-rear-vcm-vddio

Upstream preview patches:
https://github.com/geocausa/SP11X1ECamera/tree/wip/ov13858-dw9800k-l6m-vddio-untested-20261121/patches/ov13858-dw9800k-l6m-vddio/mail-ready

Would you prefer optional-vddio support as a follow-up series after v4
settles, or rolled into an updated v4 revision?

These tests prove driver communication and regulator consumer
lifetimes, not optical lens sharpness or full deep-standby power
behaviour.

Thanks,
George
