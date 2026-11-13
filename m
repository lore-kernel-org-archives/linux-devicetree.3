Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530144;
	b=YFWrQSKZ1z0jFGPGEtDbvTHxTAyKTKwoK0s40gXeVnvEfJ5qZuloFbyJInFNC/rnrVDy
	 MrCeZbQ7+Vf3keJZIrx/aNrBdOjzr+eescGK5MxdA+uLZjwd+DpPM3gIsq1Fx73OPBMKn
	 +qLU5fJN7OZrvxmTs7nhyBm5ImiBtZXoBPqNea3kWwoHsAEBQ/3zfKXFqv8y7WZ5j9d6B
	 Y6jdq2HZg0/Gy/pDJo2OCK7olV/EBMlTSm4YsYpoyW6dnWQaPt4EaM/3hScmdSQJOGirD
	 en7qK+Zn5IxBeOX0GnAsJZy4KyJaUA1j3Eyauuy7peXDCpa79YTi7K45IcJXYRlQnPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3/VnFgYINlRlhY1yu2VcR+eAdnoCreCST0T9Cq05K6U=;
	b=byQ2k/Qja5PJ8qVQzf5whdJm0oJItqWZ9+uHM4dNDoVconZGBwkk0AJPrUt1dUMb1N3l
	 qbwBG1g2ip/ZnIWuXZZGlcmBa99MGQL4WJbsqdrDMV8XBGaHxbQlb/RUSt2E/syvc3oRJ
	 gOvO3WiCqj9XMLmexhx0qmlN8q+0qh5dd6JMM8FN3pq0qNIqYFBQ5bNVk0B/H+noUXm2a
	 BBDX4oeKkKyIjDHnS2lmVsUtAcPjMQ2YWzTek3gCtgDr2KBuomn/fvtMMBcEIasOllnPh
	 zn1TyLs1I0LlIpetF9nHF68j+hqteUaT6tLnzFQPXIYNC447EMRe8mVEncQHNr/IlBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9kFqplF;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CA5606B7C2
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7CA5606B7C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9kFqplF
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49412eb1474so151632f8f.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530142; x=1795134942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3/VnFgYINlRlhY1yu2VcR+eAdnoCreCST0T9Cq05K6U=;
        b=b9kFqplFB4ksjcPB11g7wrzFIgvzhQf4VQ4LwRLiHJrvjQT+Z84PDUc7IV2LD5JEPl
         ZmMlqSn9Zfs6NtZ5wlylT9/0/DhKh8W90+YzWktylsMglqS0lxW/g71dgzPKRJ8jt9IY
         JLK24g9M5vDKhDWDxa1bRSz4655xxriCK1KUYGW1mNMUcX6vzl47Gp8Mlw5DtFUJ/RsJ
         wO5PfU4yhMpc3rzSJg2zZFSD5xQTCBEGbrzXzByK8OhXHaWtE/RXDBYwZNv77HkmOBcv
         l+X3FQNWyF7m1Vg8n7ekhqOs8ngNSPfEAOWc8Dwzx2HOPa01dBCIlB9bWvkjlDMsCdRs
         OrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530142; x=1795134942;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/VnFgYINlRlhY1yu2VcR+eAdnoCreCST0T9Cq05K6U=;
        b=ADGbTUqMn7WBShYFSwyJh2waBnzcOmQqwOs7vjznAQ1KLTWVj/+Fchzdkkd5DEpZ0b
         fNni04Dqox0BThE5Yzc3ie5M7ceW6pLKGli1R1NrC2Q7Zevcu4SaTkjmSJI9IzomUML2
         AaNRb7oYgQ6hwROng6qpUIbiOWUZ4DFBm3o77P32tnhkAprs/W0y/BENhF+Nx/hA6Biq
         15CqAmnVoxUAkO6STBZGeAnSbxREK4Dk5Z5mlzfzdK4vZFuv/OMuJ+oS20vQJs8b5UO1
         +jv2ly0TIUR9W5t5zoEzyNe3AkhZDmOA6duZbP7uNFN7mo0i099VbWNFTbkc2LHbOHGl
         95kw==
X-Forwarded-Encrypted: i=1; AL+hErE25n1F6m+V8Qg6PPGQDwS9tGga0+bJ0P+d+EyUlVNT910eagF2Q5LAS4CHCWotYk/QXKOSMimmBBVX@vger.kernel.org
X-Gm-Message-State: APuU4Z+OclmDXLjyapadHeonnZ5c32GA4RbQtxV14kO3m08j27OS1y1u
	iICqAYJFaQwOxaM7U1nHPiNREfwVOKymqOOZ3OvJbrtjXHFLL6Kaf88y
X-Gm-Gg: AYBFou0W0gOZpmt0CsrfxC/BHvQ3a5JmtxOw8/JEwQ827SILsVJg1Hqi8SWSjG3Dlvv
	SKwh2O7L3f95JB75CP33r6BDZRIfXJrBlHTxDyrY2HLDS4edvL3YrUio3vQkND80cLqTQHsf4tY
	6b+yoq8C2qft1Nq5JK1OmB3Uksr2/D19rnEe7Evvy7KHkBswbWMnh8knqhvkRdrZ19hhwP5hl7i
	FX68buQ2XZtkBuXdv+BrdrQtvT2YzVWTkiSOfMkSGF5uu3itTPoSNGT3tUpL0uk6nh+Ew2d2lCW
	IRmw5TUjAY0chWD1ugouX47wuyhPXeaEUdfrv1VKTjBUCxxLQ1kJ3gEH9AWA5Fulk798GRLkWCn
	qZLfYp2brbUS1link+NfVFu8GQ3PF9VFtgt2tBIOsg9JkuJI3JZbQY6cqZSWB1qgpS/yQuL8RsM
	c6tduefU/kwMD9COOPBpGoqGID7MaPls28EVGT2hq1KQ8UagyVd88HjrH6YpVWW2ijNYqqQOYie
	0uuMzpiNGruKEuBubGVL+PEEx0L27Fljduul5Am4JW22LPZ5H5CSDtB0XWgD8OPRYiploeRuObB
	0FxzblruUfiZ3PtEVp7ZudOYrfEZVLN4qnVrFXaobSYS9UiAvG18ZdSZf1wByB2MQaY5OWqcSs+
	jmVl/1Q7/wHGaEza9Duldlmmaz+/99f04K7p5e0k+l5Wle/gJIvOlwSGDXnaemoldRwNDFh2o0W
	+nafhQcADzFHDgmKKu
X-Received: by 2002:a5d:6f05:0:b0:48e:d27:bef2 with SMTP id ffacd0b85a97d-49c723fc07dmr1853264f8f.21.1794530142217;
        Thu, 12 Nov 2026 16:35:42 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm2251812f8f.45.2026.11.12.16.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:35:41 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
Date: Fri, 13 Nov 2026 00:35:40 +0000
Message-ID: <20261113003540.3660753-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <P2sItgLkRqGZa4OOeZAnJw@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-5-ghahramani.navid@gmail.com> <P2sItgLkRqGZa4OOeZAnJw@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Stefan,

Stefan Dösinger wrote:
> This would be easier to review if it were split in 3 patches, one yaml per
> patch.

The next version will have one binding per patch.

> Afaiu this makes "syscon" optional. Why do you need syscon? Why might you not
> need syscon?

It turned out I don't need it, so I dropped syscon from crm2 in my
tree. All I have found in crm2 so far are the PCIe clock gates and
resets.

> I think you should be the maintainer alone here, I don't have the hardware to
> do proper testing of patches.

OK, I will be the only maintainer there.

> I think splitting those into different bindings is still a viable choice.

The next version will have separate bindings for lsp0crpm and
lsp1crpm.

> You can drop the phy child node and just add "#phy-cells=1".

Will do. topcrm gets #phy-cells = <1> and no PHY child nodes, and once
topcrm is an MFD the PHY driver will use device_set_of_node_from_dev()
like you described.

> I'd suggest to rename clock/zte,zx279128s-crm.h to clock/zte,zx279128s-clk.h.

Will do.

> Do they all need to be exported? You only need those that will be used for a
> clock = <&topcrm ZX279128S_TOP_SOMETHING> handle.

No. The next version will only export the clocks that device tree nodes
use, mostly gates, and the PLLs stay inside the driver.

You also asked on the RFC whether lsp0crpm really has no resets. I have
not tested that yet. I will try your method on the router, clearing the
bits, seeing what breaks and then checking whether the device kept its
state, and I will reply with what I find.

Best regards,
Navid
