Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72A3407CD0
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783723910; cv=none; b=aMbPeCQvyzNsRRke9AT4kBwgs3gS7PKm8rEx77QY7ixSGaLlE94VgDqW1WbH8KMF8xUZF1eD1uGlBrkI3PkQLci+YGK0dhvpIHa6RlGnsWLLj0Hzae5hyTYQrn8s4b7ntYWx+f9DzBFUs956sIRxGF8vtB2p9mfksGy3wRPnRkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783723910; c=relaxed/simple;
	bh=RnEeNLsDjzbIUPZgBVMLV9uT02qwSArfn96hepB2oIU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bJSPzZZNwHBwke7iGaTk2ifQHiiwYrjqxj5CVnAoq+/BulYvwt7lC9p2+R+Z3Y1ZdPSouuXr1itilhoTHyzYr5zL/cUxeNZvSUwb6snBw5QnFjRM6Fe/w5Z3jQcNWSiU89kBvz/2ZQW3MB7rtXYMLOxuWqY4K8ERTil5/hrcMXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Pkq8ea4e; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Pkq8ea4e"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso1247270a34.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783723907; x=1784328707; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yXdpdsUvKArizv655xhgVkdyjwHO++6Kx2TieGSX5WU=;
        b=Pkq8ea4e0o04NVjukEhK/15l79oAuZsnXu43nBqdZ7HKYY/GUL/OW8ZBuqBRseUTml
         LDeGZ6czP97kn7XOTK9RsANSlNOCmGg5OFGeNGoLCFD+SRenz6tNeLo9nTk6uxsi6Q3p
         3qnelV1BzF7YWNnbL3n2EjRyciWAUnmLNOex3TB7E3QMcYc/qVoCy57hrxO5yBdCkVZb
         fO+RTnj2n8ek+9y4mDdOMuEk3m94uI3jNLXZhXX/ZimgwLFTUA10JkdQlHACo1+UGu7X
         QM80gZi36bf3u7GtIh49g83VVo2jOmPEILb5uywlV8rISr0OBIyGBmEJv7cFVqMPREZH
         lvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783723907; x=1784328707;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yXdpdsUvKArizv655xhgVkdyjwHO++6Kx2TieGSX5WU=;
        b=Iz2T/qQ2oF9DU1ocFiccgwRBX2HPSezJ3kab66zr7sjW5mMbT+VuOtxbIhKFqrCYR7
         0k8dSq4sWwzxFamyE9uJa/4Ef3A4y1QaawX7VOT3gVpt3jDROfvHnCJ8w/zjRdW7UYCC
         JMG3VBfG8RsHVlYJicoup85z/jd8v84fGXk98z1wMA38QNbod4Zez59CMvgyMnPBPupD
         crKZ3asAc84OzM/NpgfuxzKV+kga3Ah2sFdSfJwLWyQWsO0yC0PPS7V2tKmzFM4OMuaT
         qpjMQbBb7oWz79E9BjSiatGuHgRofwAJGh99podjgn+oUrxHwXMPv76T8R7DYSoNfyfy
         quQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/t7StGvC6Yg7Q1CGya81dNxtZ6KsKGC2AagnKqcT15E3ANDlVgVDCStJEdcCqUVzyI7HwUFsDPlT4k@vger.kernel.org
X-Gm-Message-State: AOJu0YyKcSO2B/xvf4lXTNsXtoDeGT6YtwEA5fLPT1nwa5ukwtl6rI0Y
	Mt2HYL852O35Fp5k2CXys9oCvVgRJWoZsXXQqGNESr3LIT+dD21w6+IjmdfgrWCGM08=
X-Gm-Gg: AfdE7cl4N7lYJIH6RObbFZqIPg+OEeY0U40rg5Ykhv5/YwyHF3cSMQR3REiw3cWhhq1
	+BpsISM8AAgL3Eyjapi9g9Dwe0A/pb3F5UYqBE6mcNrBaSdBD5qBUPH5DeKJoaSWrTOBEN4rDWs
	URjD5u2CiY9+RLW1O5/uVUNyUrH8tk9E3ehTctqxrDx4nBFiUZsjRoFn+/IhoUAe12UjbrYblRU
	nuXEv6JT0mtgpxjGuhSRTYAIulhY2BHXoWqH9ZD6jxAyj4mXVoGHkJriNxsrsp57FEPGR4GVpVu
	he/zxO+DB4VKzRI6TRZG2ZnOiQ4jp9PRP8t4tJ6hOqJqNHMBSWVPfVLwJ8TKO7nSnapcBUpvhfd
	VgdANSs7Zl67OdEiKmxYuc4boZxeaRgbpIbBTTr7K59l/zyICZspco8nFc49BgBDS9GTfMb3p0a
	rMDqNkX93FNiUk4AFp80rB8y4evsQ=
X-Received: by 2002:a05:6830:378a:b0:7e9:cf6f:aef8 with SMTP id 46e09a7af769-7ec096241b1mr600426a34.11.1783723906879;
        Fri, 10 Jul 2026 15:51:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1b03:95c:fbd4:4d00])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcae177c5sm7613512a34.5.2026.07.10.15.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:51:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v3 0/8] iio: adc: new ti-ads112c14 driver
Date: Fri, 10 Jul 2026 17:50:33 -0500
Message-Id: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4V0bU07vIIr/8O4YNpBxig1LRIJ4
 d8tsDFGV5M7ufecSQTyTEEckkl4Gjiw62JId4kwbd1dSLKNWYCCQuU6k8xO1tbInuMJGsDEp1V
 YQVZWaZqRiNOHp4ZfK/Z03nJ44pVMv7CWRsuhd35cvYNeepui0PlvxaClklSgrW1TGgQ8Yj3eG
 D3tjbuLxTLABwf+cSByDGGFCvNCm2/OPM9vZfyvmhUBAAA=
X-Change-ID: 20260514-iio-adc-ti-ads122c14-d0b92479334e
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, Nguyen Minh Tien <zizuzacker@gmail.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6234; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=RnEeNLsDjzbIUPZgBVMLV9uT02qwSArfn96hepB2oIU=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqUXdDhLmLQPHSn9FksZkouFlAk48lqYUTuHopQ
 aEUlBTcljqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCalF3QwAKCRDCzCAB/wGP
 wIwhCACXJ/oDn982bPo8L/fU2t4G+yspBCJjRHBhG7GBpiUW7ua+vPjzUioPscTYsnBZW6XuliL
 pH/L6YU17kx29RDCG+YcoKY3t8t25SlHDHylprreLORqBHSa80zzzXkNdY+9YrKIpv2GkFyjMiq
 F8C5frFWk7uyDd9p0P6COCHIVg/GLn3gfbncnHY+7LqmTal1zWd6Yi0A1H0koKL9HtkNfdYwC8m
 RNylGslDdxr70ruZBxOtfLx0R/OS1pwnaO1fTT9ZwkFx8okt374arpQL88otfKMtYkIUAbgwSKs
 ySQ89F5XMCEULjYaLWko10nMD6KCNfhaAssPjAD1OmPaMpBY
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

This adds support for TI ADS112C14 and ADS122C14 ADC chips.

The closest thing we've seen to this in the kernel already is ads124s08.
However, that has a completely different register map and the DT
bindings are incomplete and the driver is extremely basic. So I've just
started from scratch here.

We've also had a similar submission recently for ADS1220 [1]. That chip
is in a similar situation to ads124s08 in that it has a different
register map (but the submitted DT bindings are better than the ones for
ads124s08, even if still a bit incomplete). And literally as I was
writing the previous sentence, another series [2]  was sent for yet
another similar family of chips (ADS1262). That one is even more complex
in the feature set than the ones I am working on.

[1]: https://lore.kernel.org/linux-iio/20260610151342.44274-1-zizuzacker@gmail.com/
[2]: https://lore.kernel.org/linux-iio/20260612-ads126x-v1-0-894c788d03ed@gmail.com/

All of these chips have in common that they are designed for use with
RTDs and thermocouples and so they look very similar to each other in
terms of wiring and feature set, even if the register maps are
different. They are in the gray area where we could either keep them
separate because they are just different enough, or we could do like
we've done before with ad_sigma_delta and have a bit of an abstraction
layer for the register differences and otherwise try to share as much
code as possible. Normally, I would lean towards keeping them separate,
but in this case, I'm considering trying to share code because the
devicetree bindings for the inputs is complex and is going to be mostly
the same across all of these chips.

After seeing Kurt's v2 though (that doesn't attempt to share code), it
seems like the chips are different enough that sharing code might be
more complicated/messy than I initially thought. So I'm happy to keep
going that route.

This series includes just basic support for reading single measurements
from the ADC and gain selection via the scale attribute. I plan to
follow this up with additional series to add support for buffered reads,
filtering/oversampling configuration, event support, gpio controller
support and perhaps a few other things that are slipping my mind right
now.

The most interesting part about this (that I alluded to above) is the
way channels are handled. These are multipling ADCs with differential
and single-ended inputs. But what sets them apart from other similar
chips is that since they are designed for use with RTDs, there can also
be a current output required to excite the RTD and this current output
might be different for different channels. So the way I conceptualized
the channels is that the devicetree specifies the conditions needed
to take a particular measurement rather than being purely a physical
channel.

This makes things more flexible, but does make the driver a bit more
complex. For example, knowing when the current output needs to be
enabled or disabled. For now, I have chosen a lazy-enable where they
are not turned on until the first measurement is taken that requires
them, but then they stay on until another measurement is taken that
doesn't require them. This can lead to some oddness with the diagnostic
channels that may be measuring something that indirectly requires the
current output (i.e. the external reference voltage when it is connected
to a resistor rather than a power supply). This means you need to take
a measurement that requires the current output to be enabled before the
diagnostic channels will give accurate readings.

I have also pushed a branch to [3] that contains the start of some
documentation for this driver that can give some more insight into how
the implementation works. It still needs some work and also documents
some things that haven't been implemented yet, so I haven't included it
in this series yet.

[3]: https://github.com/dlech/linux/blob/b4/iio-adc-ti-ads122c14/Documentation/iio/ads112c14.rst

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
Changes in v3:
- Mostly cosmetic changes and a few bug fixes to address review feedback.
- See individual patches for details of changes.
- Link to v2: https://patch.msgid.link/20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com

Changes in v2:
- Added patches for adding properties to adc.yaml.
- Some of these are coming from: https://lore.kernel.org/linux-iio/20260622-new-channel-props-v2-0-aafd5369f253@gmail.com/
- For now, I have stuck with one channel per single-channel pin or
  diff-channels pin pair rather than some of the other ideas that were
  discussed. Handling burn out current enable will be handled in a later
  series. I'm leaning towards something like the _burnoutraw attribute
  that Jonathan suggested.
- See individual patches for details of changes (mostly renaming DT
  properties, fixing some driver bugs and style issues).
- Link to v1: https://patch.msgid.link/20260615-iio-adc-ti-ads122c14-v1-0-e6bdadf7cb2b@baylibre.com

---
David Lechner (TI) (5):
      dt-bindings: iio: adc: add input-chopping property
      dt-bindings: iio: adc: add ti,ads122c14
      iio: adc: add ti-ads112c14 driver
      iio: adc: ti-ads112c14: implement gain on internal short SYS_MON channel
      iio: adc: ti-ads112c14: add measurement channel support

Kurt Borja (3):
      dt-bindings: iio: adc: Add reference-sources property
      dt-bindings: iio: adc: Add excitation current sources properties
      dt-bindings: iio: adc: Add burn-out current properties

 Documentation/devicetree/bindings/iio/adc/adc.yaml |   40 +
 .../devicetree/bindings/iio/adc/ti,ads112c14.yaml  |  207 ++++
 MAINTAINERS                                        |    7 +
 drivers/iio/adc/Kconfig                            |   12 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/ti-ads112c14.c                     | 1203 ++++++++++++++++++++
 6 files changed, 1470 insertions(+)
---
base-commit: 093239070573637ad2b4cb56abc9c4c7ee109294
change-id: 20260514-iio-adc-ti-ads122c14-d0b92479334e

Best regards,
--  
David Lechner (TI) <dlechner@baylibre.com>

