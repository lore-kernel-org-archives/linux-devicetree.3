Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945194;
	b=Vr77Tb/E4JhMnIKANBFogrne86kPywtVwKtUWDonr0Kt+vGA9OKmh/lLAiO0Dv3qhwxK
	 auIfSPuVPwwJv7bj0NekV605mrsqftdckEZ6u72gbCbqYAAfxnYWUlK2No5LzmO3750st
	 1QdvM+2Qp+iKIZ86hKJO7JG4GUj/jmD5Y+GGJdObS7V0lqKQYaWMwhNb9ngb7aRfULr9s
	 hJW32+Y/eMxpBbULtuLXj9cwyqIGKC+nvmR47CF7BKUNC1JqkI7UIvBQJ0lyRS0YbQrIl
	 EPYXWxIkdnRGBp6wJacFQFxtjo+kMVcgsASQ8F8bsvNgkBYW7h43RRxVhhqq441eB4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oA9OvOIfFIXhU1CLKiK77BzQLTal7gVWqxQ2qyRWaBc=;
	b=EHvoF7yUutOmbR9dOOUCH/+3hoOOSnT8gqxgbTzVNVNoF47dNE/VTqhDYlyxbJzjQDIx
	 fmzTfHQ1KBn+u+ymBjfCYFtQysw+EQhMBFIkdjr5egvq3MJzwC2plQ4Jg1W2f9a5znad1
	 czWXy1dJt/yXMvKTmg4OzPRQSH1Jdf9I365fBIEC6wdz1gn+aaokLxzVQIQl3Zol37YC3
	 bVsZils/yGPUyldElrzESvj1M/Vgd4YxUknBfCP5wkGfQxFkNRYrPlPpYA16I5bVKyb+b
	 3XhPLMgb0c00Tcc9Tyj11P1aAvFj/h6Kyn9sXHbVoGyOhXKmLjKCB1MYHammDLLhRzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Y3K1D/kI";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0398A606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0398A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y3K1D/kI
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1adbf62dd31so487538c88.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 22:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793945193; x=1794549993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oA9OvOIfFIXhU1CLKiK77BzQLTal7gVWqxQ2qyRWaBc=;
        b=Y3K1D/kIPHJUqT+r8dyR+eXVkZR8B34LsKSqKLelS4brSA8kLAyvDbqMu/J6Xekl7G
         dSyXhJE3CIY4ieVMnxQ6yNKOY5gsgXVWpn8cEuL7Yrovur2Tn0O5UshwNDJmS5Wza2Rp
         U7YMGAnF+PebqW45a7EC1N+LsutaC+Cfwv5mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945193; x=1794549993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oA9OvOIfFIXhU1CLKiK77BzQLTal7gVWqxQ2qyRWaBc=;
        b=FGlMDi3XhaHpb0HJT3FslY6kQ/9uzxJE5npxDxZJnlHLaLrq61NMQ3jZM2nv1iTmJg
         Sp7iHzIAQ/Ncp3+gNJ76rT5l2u4nhTd0CcMiAj+hLhEOQrQgB/A8YFadrb5Wu15oq9Vo
         IQrwdb2SK6WWtjNeLq6YdggUv4FhiM+DT4wJT5HWDMpVV8dU8vtz5CrMlUqu4emEqOtt
         FSuEjT4yc6M8ArtIuLbjOF18BI9aNdMQ9BT0YspZtET8uRBiSVJemW5ZtGTyOFohAM3/
         QFIAmDSn7axY5LHs6kLh2VpJyRf/lliibVtJH5Bly6C3YB1pVb6yjWODpKl99pch6xcM
         f7+w==
X-Forwarded-Encrypted: i=1; AL+hErHcB13zeO9wISl0P1FNyuFt+OAJJr42fAKGA0gtPAR03YrO9nw/9OTa/Sy2pqJQ4R0mslBAqmFH4mjO@vger.kernel.org
X-Gm-Message-State: APuU4Z/ePq2jVcRKxqmmtGmHSeb0JgQCGklAmmgrizbxuRQoVQKtrCNi
	a/say3g5vbUbV4/JAKLvKE+p7X8ic559lCxtVTNPwi/ZxZAxus08I7ZxyUMOkzCbig==
X-Gm-Gg: AYBFou1ig+3qstUQ7t8deviBRG9nJeZ4Q203CPcXyThS+RDfDFYwA37Cj9pwVM9Q/3S
	oOEXrEe3nD8v1aIUntrbnhCs/khF/nYOIIuG/W3XuMQBrdKOl/4SayBtL7kzrpyivXaDu5C7p49
	EoiIzfm9HpzXFc4/MmyexH/PbhsA5nmCvABLl4OsiHl8ZnV913hzx0sgTcjAeIiO7ZsvM9VFF6J
	Ylqk3s0ttdgMVwZSykVpOHT7ECUq/s4SUH9SaxY0XUM24yA6rjMdJa3yJ6zgWVRTIBkp5ei8ECU
	04bQrgwpMa49sLTB410GAiQS0vtGN+YhEzHyU5ou47KsZdjwp79uAAvgJ/h7vxVwlAtV1JMnfJL
	PSw4mATKNLbZt/nJubP6oxg5KKBnX3vLAZfn+9lZ1nMmCipItTShF16LICW5yZtGhH4CgIVTJJT
	OsPd+jY4xorcewWo+CZiCCMujyv88xuHuJuQK8SXaxI+vxw44BAGYSymO4k1jsadiZTrkN7YjK0
	IJaUIpCi2xuNj4L1QsG08zYX7UeBiCdy2NKBTfTuPRap7l7s78QrUiIZC/Xo/vJ7+mM9EnRBGvv
	fE+3QvRpQf7RqjdTmwT4N+5rwf2a3lf1W4OB/1eBQzKkFsvou1SSQ+RguD6BfATImIdtCnNUm7f
	kwaJPrKkcvYxfDA==
X-Received: by 2002:a05:7300:f586:b0:36e:2b8b:a09e with SMTP id 5a478bee46e88-36f76c1875amr1931679eec.34.1793945192713;
        Thu, 05 Nov 2026 22:06:32 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:f73e:d73b:c0da:5b05])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3821809eec.6.2026.11.05.22.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:32 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: mediatek: mt8390-genio-common: USB fixes
Date: Fri,  6 Nov 2026 14:06:17 +0800
Message-ID: <20261106060621.2706658-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
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

Hi,

This is v2 of the Genio 510 / 700 EVK USB fixes that came out of the
MTK XHCI binding fix [1].

Changes since v1:
- Patch 1 now also switches the type C port to a source-only port, and
  limits the source PDO to 5V 1A, matching the hardware (Sashiko)
- Patch 1 now connects the SuperSpeed and HighSpeed lines to the
  correct USB hubs
- New patch 3 fixing swapped USB hub labels
- Link to v1: https://lore.kernel.org/all/20261103083335.2944847-1-wenst@chromium.org/

Patch 1 corrects the USB type C port: the controller operates in host
mode only, the data lines go through the onboard USB hub, and the port
can only source power (5V 1A). The block diagrams for both the Genio
700 EVK and Genio 510 EVK were used as reference.

Patch 1 depends on "dt-bindings: usb: ti,usb8041: Fold in TI USB8020B" [2]
to allow graph ports under the TI USB8020B hub nodes. Without it,
dtbs_check will complain about the new "ports" nodes.

Patch 2 moves the pin mux for the USB hub supply enable pin to the
regulator.

Patch 3 fixes the swapped labels for the USB 2.0 and USB 3.0 hub nodes.

I don't have the actual board to test this on. The changes were only
compile tested.

This v2 patch series was partially put together using LLM. v1 was done
by hand. Sashiko review comments were fed to the LLM, as well as the
datasheet for TI USB8020B. I manually checked the PIDs in the datasheet
before giving the datasheet to the LLM. Same goes for the board block
diagrams. The changelogs in each patch and in the cover letter were
also put together using LLM.

Also, the LLM seems to do a decent job at mimicking my writing style,
even though it's a bit more verbose than what I'd go for.


ChenYu

[1] https://lore.kernel.org/all/20260916075745.3549953-11-wenst@chromium.org/
[2] https://lore.kernel.org/all/20261103095425.3097720-1-wenst@chromium.org/

Chen-Yu Tsai (3):
  arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and
    connection
  arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable
    pin mux
  arm64: dts: mediatek: mt8390-genio-common: Fix swapped USB hub labels

 .../dts/mediatek/mt8390-genio-common.dtsi     | 76 +++++++++++--------
 1 file changed, 43 insertions(+), 33 deletions(-)

-- 
2.56.0.455.g6c5a503b38-goog

