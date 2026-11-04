Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795586;
	b=xonE8w4ci3KkjbCTkLWfiri5kPDCmLPTnHgQG3VqpVK3q8iFBoVytY22oWMs+G5WuFVU
	 1mXSLSx44HqeIdxekBAXz5GKQe93AhBBiIllQqEGXJS9hXevuZ7EczW8M1p4gKMaGl8FI
	 JcTgbLHpjjXWX+68dDtG68RgBnSh9p447VHRFMWkSA020bWYXMl1J9p45O3kxdTO1mM6N
	 y8tjtNZt8nyyjwH56/G0aXcnxWao8NBUERxWNPOmgLB1/3JQtHwU8jHFurFDEmOidWKwh
	 cwMbjtMt4h1AVSU4vvWqrUcAIxGCub3TNF1aJXlZGcQaVm6OM3sGGRZszjw4I7BkFOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fmtZfLH8E6ofPNEi4R9rGr1nVfuLDaNXdp5QmRMTCjE=;
	b=nVehxuWZwZfOCdcQmbpcHXHEtfehGmXSQ/85EJ5fbNmgSE8UTlBXSeL+OiAvlVwpBUFn
	 w42XG2W+1Ft9ClJruzWz4wJQWdEE8T6Q/itnSqsK+gX7KSpLaXnbFr/g1w7xeFQWfnilo
	 zY16dni19w0ClXx1XQB7eGufNv2Hr8f0jJcLDfYlSoRusvDUs51jIysqnLYsP6e1SxHNz
	 8vFUMHQPCa3px/m5JJ4xa2HlrUd938s6Yku8GCNdrBLbFKrHc13qHwIK6gJSjQIe/dXZD
	 mR00N1C1MFUNfNFo8UqjsL+bukV5w0OsFZEL45rYhWRP3Zu62IFGU1A2flgdujZ1z0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ord7SymA;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A12606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A12606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ord7SymA
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso6496795e9.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795584; x=1794400384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmtZfLH8E6ofPNEi4R9rGr1nVfuLDaNXdp5QmRMTCjE=;
        b=ord7SymANmYwvG85xkqojZpBx4zQekmKlhxmqa037yOFtNP1AH+jeKnSngoH5fyUih
         bBBXNgTkRre2Dbqc1tWkowbQjkABtv0PcQM5gcZfYNA7uRgE0+E9N/ZCU5vUmtRfYw6D
         stgfjZNFHJK/rzoEsdTc4DsS9KtT/ztygYlPyiDoDsNJSFLxI6XTgoshejuydrHCjpEz
         YU666/gp3RRySEBLtJc3lPHVKJM3DmUQ4tOBnGMEUNn+jlGsXHidsBQgZz403M0JnQUh
         uDEEawih0jU1Xl4Lm1nsmyNhKjsi3uW3iPXJLVU5j3UlLxkfHoQN2YPVgoJPm9nK/wvT
         NdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795584; x=1794400384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmtZfLH8E6ofPNEi4R9rGr1nVfuLDaNXdp5QmRMTCjE=;
        b=xXi+jY8KxmvoPSI5RGPK5GfiNEWlUimOqFnxlHL8Ti/4M8QMChS97uuG9BNzXaehMz
         b/JiMZJW5yWN2pKiv+7kZijI7g0lxEvFBQZGQ07NVQAnSa/eDh4aLPULrmOo69pfWyJE
         0hZqvWFaNDdJfsoD6kF6gPp9By5av1wiJdFqAPeXgU+nQVx/BfnXmI13Qo4ZeSsNGv2G
         rGpMBq8v0oY/SCOjNpp0gbBW3WdSGrN/sraNMoGsykMvoDIHUxC0WClrB0TeGyZYhjFE
         zAIOjvUzNtTbLuNNAtFsIj+m18/88EvM19LgrsTgorc+i4DeBNdcq09yXAjfmVpL8ZTG
         SCDA==
X-Forwarded-Encrypted: i=1; AKwUvByMGz4vmFmZaU0IW9AhJDU+DjGIrjPuYrcUwQWC4B7G91OKELiBCrZ8h/+tbvnvfLNAt5t7l+ZxaHAq@vger.kernel.org
X-Gm-Message-State: APuU4Z8fPii7dS11vwQeI706LhYz3+BpMXofzYQvBs0JBuf71fqSdlbX
	sOEphRsEADLbJKy/Eg8jRf8y5iCGTrAQDcBbt4ey3stkN0ABxCMUgYEU
X-Gm-Gg: AYBFou1y8UKbc4IJA2Dc+ATStoYQDiPxepg6tNqIHiXOoOxXF3OtHPeC4Pj1XoEEj7a
	9Nm1HP9HlZ+6FmFJc2PtfoiJmHARgA7UZwr2QcE69r3c9/DX3fQfGC7LQRj470Q85cX0x6XdT3V
	m1bpXdH8eLvxhS5X1o501STdcdoD9m4AwbrPY2hP7dCyK+U4X7MQiLtmZMWonSyRZ6LFsMRYwin
	T3S9KBj/n1MGDgfU4SGcY0WtKrFBYAoSHolHrIdN4DZee6Bkgc0BuzEyFuKiF1xZ/Tw2NPzayDN
	EmvYTJvAVIctHoq6bLm1qHH42m3WeDJB5r+Gfuod8ifgV9ns8it7Ls5A/LHBUkxWw2XPhlTDXYp
	1fMxiQOKMwup0uH8NJu0UpCaHThrMbLQqeATC/2I8ifMDqIbtVTqPUEcZXAIJqvtn7MxUNaFd2C
	FlgKR2zQMkX4tsSQJQFvqsZD+AcXOL0uxC1hYDtOL020My37oSCD5sRbD1EKxpdPj3L9/3Q0zuh
	zMD+PXY6kpHdTD64XH7+8bFT+tS93VfxSBzJrxBMbOMNj0/sfbBL35lsOeBb3Vg0p3GJXOQeIYQ
	3I0hdQ2zN449On+6ZK+Tny73nzSurcNup1LBW17C0Iq3HmHUbQ==
X-Received: by 2002:a05:600c:3d8d:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4ac18a89393mr344169195e9.23.1793795584006;
        Wed, 04 Nov 2026 04:33:04 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1caesm3509380f8f.17.2026.11.04.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:33:02 -0800 (PST)
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
Subject: [PATCH v4 0/2] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Wed,  4 Nov 2026 14:32:45 +0200
Message-ID: <20261104123249.227920-1-clamor95@gmail.com>
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

The Fortemedia FM34NE is digital sound processing chip used for
active noise suppression mainly on ASUS Transformers.

---
Changes in v2:
- remove ports from schema
- schema moved to dsp
- add return value check in fm34ne_dsp_set_config()
- dropped unused headers

Changes in v3:
- fix port reference
- request reset gpio asserted
- incorporate fm34ne_dsp_reset() into fm34ne_dsp_enable_hw()
- add reset asserting to fm34ne_dsp_disable_hw()
- moved bypass gpio deassertion before return in fm34ne_dsp_set_config()

Changes in v4:
- dropped guarded mutex lock in favour of traditional lock since function
  has to use goto regardless.
---

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/dsp/asus,tf201-dsp.yaml          |   74 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  388 +++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1506 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

