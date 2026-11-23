Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424335;
	b=mAAiVTuCgFl0rIThQbsT4ga5RQkPnJKP6OlS+50a23hfGmItPgLt+NUQSEYCzl4Q0NLA
	 eKGbLV/8Bmy2KyFwZNFDDHawmUeyc+SCbCV4PmUqLANsGBVvwbXU3uo9ytyHnS7oE5Cbn
	 Aj+kQlGcTa1wOivOQWWq/NkRgYUgXT4x2Zo34qo9DxNF/+hqUZcxvgM0v0OyUicR7yKxi
	 3GNF2Q013+iHHrMckY6e3+I/rygQMpEg+4VY0Tc2/NwB/o4pjlYB7l2tWtJveQlAcJt5J
	 gYCh4OevLuX4v+rZ6OF1FzV+3cFrXaBmjPd+f9QB58w4//GA8efoCgvySEfwIDNr3zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fw/YKdGx/bEJxv6m8dJuQDKu0hTKbF1u6pYTLgihK3c=;
	b=UT1r6glBvXToBWjt1Cepvavv3C5nq5fnQ8EDxcfL2o8dDzP+zWpKBt74J70VkyV1Oxkh
	 J7rZmMYXsgjycyJR1J/coEpk2eSGZhPkRUl0j85voMlkTa3ML8bReEXiLOWDoF5sEdTZN
	 nR8FjZbvqJXz+RLMm9a9x1WVuavBf1T2LkKHfvQ2GM9gKr3juerTlIwvkD7JX7oskfnBB
	 y2nzVtX5Ll44zkB6Bf93i/f8PFbkkrcxHeELaATmJpQSuBR3IOcU5X8x98OkraCPuVOOG
	 0Qy+W5zmKhO30daZ7FW/RttodTntnsctLU6sShMmEqeq3kfrT/XdIxHZXMYCTizzA+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG3Ypb0E;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36DB606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG3Ypb0E
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so27519025e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 00:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424333; x=1796029133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fw/YKdGx/bEJxv6m8dJuQDKu0hTKbF1u6pYTLgihK3c=;
        b=BG3Ypb0EPki8K0XfjcKNMNuWucIAzL1bgG6ic8Fl526qhYmAzeJDj04amPik0ZIyEv
         krByJmeBrF2EX27hvuynzUkunMkRLag4getHQ7U61x3hmWpf0mbHApq2FDGN4WcadM1b
         hKrWEIaFZuIiUEsHWT+L3n6n2vGpXrBHUzRMjkjxIt3zt9VGNIj9wvkm3TxCwsJKULRv
         0lOp3y3mHl2HWuQZOnT+senHO7IIyQCtRhkt5vPFG+unrx0G8z6mp5tUFrDw0bWj5e3E
         ypKaAoimHoA3QkKyr3CjJU6ZOz4Q00PfVy/Hy5U9Tim91UYEs4FWfISIww6Sjsx3yXGx
         Z/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424333; x=1796029133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fw/YKdGx/bEJxv6m8dJuQDKu0hTKbF1u6pYTLgihK3c=;
        b=rN99ISDkAv0nMgQUJugmH4y/4l/Wxp86rB+XOfLRa2thmjUb9yFat7H1cuY35nAl0U
         hT92FxhkVa7k6yAKhOp/O1qCjMvKIysyz6R0DLBdAF4qhb4IuyVGSIfpDv75JabHJ2nN
         b6YSUN5ZyK6W3R8y9nWyqKNz/30+94h8BBivG4OaPTcdpAjvGgjhs1ZU9KHc9kvuLRLs
         Tz/E3xPKmCwJWFpp1CvGs03RJdGgmb7ZsGp1WNgulqFK6B6uDKMecn3zvL8gz/96WNhc
         SxeranYpXaSiNlzjgW/30tX3IN2Q30HJn+wPlcWdMsbH/6rrSC8uYcoPJ4Q0qeYWppPc
         ja2A==
X-Forwarded-Encrypted: i=1; AL+hErGO7SIyoNNz+zUToyeXX9XWTLX4Y6Ico1zZkiWXuCtrS24xcm1ljx5ZCgccBPW3/Tv3KxfxSYVxiYeP@vger.kernel.org
X-Gm-Message-State: APuU4Z96eHt3ASGgLubn79b1x6NIaY4A/vqjZneKu4OW/ww6Hz67Tbp/
	OQOIfq68uYcM759BgKav261/JOBSaSrYgEJs15eTslN94+x+aRvgknN3
X-Gm-Gg: AZFdTZcm48KqUjS5JODnvOyCKABFPJGGvGWyhRvB4QWVN+3G4fTm2v6JzaOIuWvzvEb
	pkVO4skxOoe4U4Dvbn2IepcssSLo3bFgd4ZahmX/61gVtSCfs6wrjxjWT+ScuSmgT0dZvtELE3o
	WoIZ7D8toryE7YLgqJf3PSgMRQS4zD9tzgJHknh4RBXVOMB3anFT9vnuq4B/mNmAPX+mNTWJVSB
	3s8Od0Ql7N3nEK3rE/NLfmvn2CFYK6aOnUlBhAtQUYT/JGMS9p7Equ+JsdyPgFdVPU3Rj2O/fpd
	5VbSYupOXhkzedOiWVNHIf5J2UZprfDogHPBJVAQ+GNqGFqu0dzcva0SOU18X4N+GVTNCoOh6cf
	AhV0NZQOQPIARjq5KIpU1NgpAh8QDefRocntGsIzKa+gqpucOyjidehdooI65hwqW4UlREYC+ez
	AIdR8wlX5FDNikNHAMaEyHr81O+q6f9ixAf8APfJLlD51A5qljSTWS6wnIk6vSPhZsrlNJf1m6t
	E5mX2kt+de/Fecw0IZTv2ge+LR9O/3f8hDXPIedalIpHvXtfkppQ6grOTrnuPDRj+HfaIML6NpJ
	0dizSDoTayBpLum+RHLnpKbsLg==
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr217464265e9.10.1795424332866;
        Mon, 23 Nov 2026 00:58:52 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm375960755e9.12.2026.11.23.00.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:58:52 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] arm64: dts: mediatek: mt8167: Add DRM nodes
Date: Mon, 23 Nov 2026 09:57:53 +0100
Message-ID: <20261123085840.8687-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series adds support for the main display pipeline on the MediaTek
mt8167 SoC.

The driver bits have already been applied in CK Hu drm-next branch,
together with the first patch of this series regarding the DPI block DT
binding. I am including the latter again in this series because it was
un-acked by DT maintainers last week due to the addition of un-documented
alias section [1]. Those aliases are currently required by the driver to
drive the secondary (external) display pipeline, but the main display
pipeline does not require them and they can be safely omitted.

In version v2 I removed the nodes related to the secondary display pipeline
to add display support for 90% of the devices that only use the main
display pipeline while an acceptable alternative to aliases is devised.

The series has been tested on Xiaomi Mi Smart Clock (X04G), Lenovo Smart
Clock 2 (CD-24502F), Lenovo Tab Essential 7 (TB-7104F).

Changes in v2:
- Removed the secondary pipeline nodes (rdma1, dpi1);
- Removed the aliases block;
- Implemented the complete OF graph for the main pipeline, using the same
  path that is currently hardcoded fallback in DRM driver code (output to
  DSI display). This improves backward compatibility for the upstream
  mt8167 Pumpkin board.

v1: [2]

[1] https://lore.kernel.org/linux-mediatek/bbefcf0b-b31e-4f74-bf79-b0ccc983f62b@kernel.org/
[2] https://lore.kernel.org/linux-mediatek/20261117122802.728987-1-l.scorcia@gmail.com/

Luca Leonardo Scorcia (2):
  dt-bindings: display: mediatek: dpi: Add compatible for mt8167
  arm64: dts: mediatek: mt8167: Add DRM nodes for primary display path

 .../display/mediatek/mediatek,dpi.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 297 ++++++++++++++++++
 2 files changed, 298 insertions(+)

-- 
2.43.0

