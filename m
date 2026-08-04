Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECA232B9B5
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842349; cv=none; b=mfanx+7qH+qn8vvZipk+zcfXFrK2Pna89NdpKQmelWdhk3R3DjnN6D3+jam3mWotneKuFmSGwn4nXPO6qUbh4h21Vdl24EKKjADXFEzqdnu7X/df6U0BCtmT6Kw6C+M8ckPLoVeYXOVThR+wfT2E5zRCdpUzT+Mtoxc2FIbJS50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842349; c=relaxed/simple;
	bh=GSBFZ71L1ZfswODYgWgJi8YXUm6XWWlzCoLMi6NRN/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mv3+Y1+IF2Y4J37GwBwKJ0cRCaf0oeU1XwnYHYwYF08+FzHObavkZ+7Ka70rlAaOZB6wBGASEK6YezXTTha/EWdBEdo2vZF1hhk0dZ4o4lcLmZ0IPAnwHpKJoa0XtrGH2rlu6dc+36e8q466b2lF13yZvFeBjWjG6oEeQUMFVd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=XNfCy6OM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="XNfCy6OM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso2901863f8f.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 04:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1785842344; x=1786447144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSQmIqo1f9e4+WmZlXMqopAgbBl4GfMqvue73Guwn7U=;
        b=XNfCy6OM7RpN8A+cM/kVcmWkSqHFTVS89XD9RnNoCQPIHnBxAGgBE8y/9y8WTi8QrX
         8/akp7m+AsbwumaZUumVWJkqUZjRsP8aM10iGzNLLcMexXfpUeCa1FDHDWMgwlvrE+JP
         MVj3jBGyy/lNuCr3Qva3PHQcKGRQwKZipYI7yne/eWYo+Br4VHpcLw2NV6YoAArOlgWF
         gzJUTRU4ob4EiMiVQcA6Rmd6dWT5IcaEF/PHYmXkZim8CF157SElfcXH+MdVwJF96fQf
         7D/Z3R/3Le15Ek7QvCIuxMBsinvPvnkV8h/a1LctXYOQvadqVfOUw6jqYgEvDmsK+jxH
         BATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842344; x=1786447144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSQmIqo1f9e4+WmZlXMqopAgbBl4GfMqvue73Guwn7U=;
        b=hUx3Bj71eutN8FwT1qmQIuJvp63cvUD6D14Vccdnq6/zG6bkW7UVjlVW3fh05VSyGW
         gUops41S2hHsrtWyhk2bX8uxG1dsFOPtzxun5O4CNUk4LPH8XDZ45/7Ik9Vh4hyxYdHg
         aa6LyM58jWd/6DIheX4FeMaN7GHkgJ2z0fDbHQejwwrpNXcLVWBs27mnidvL3U4ZX4Vu
         wSUSx1eveby84LVACqgx9Abzh+9p6gDUfhOyYt67bGPZEaQKCJcfnh86Z8q7sG+MYWjE
         21ZcYtxVt71iQpVnOAZiPZxLDQfSL6HdGWRmUOyBJFO6RV801ums53IaQKNo5yk6zTkY
         fVBg==
X-Forwarded-Encrypted: i=1; AHgh+Rqv2QsTiYMy1q7SP8MG/y2yn4Z881NV8v64RR2GudmeSGLifqujaLicOJmhaBtouChRSDHVOmfsBP+P@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5/fPH2DeMNkyIRd4E9Raoi4kde1sPJm9Kutw4c4Ry6WRre3wq
	CuQDhg9SIFA8TFFcTCaiTCYMxFPfub3VZwX9ZrmEhkJAc9tU/2EGkPOsAgymXHNU1k0=
X-Gm-Gg: AR+sD11Rmtwr4JnhHpg+LMIsk/BeVks/xIjcl4rX1ZVpuYq9n7uG+ZZsolUiwvF/j4o
	THib8qFdixvGh/vLpZ/HJSu8YXA+8I65R/ewswBnwMNxcL4nhyAbGSUEj1g1yPIlyAlW9GHdLZF
	Jwy6IhkKN5nhTir9lgrdJUlTU8h+1INSGV+fzPdOu3SdyDrZgBD3IIFWvlAo37GySEC6x10VGsB
	RaHhMTxZU1Le0FD+aq6ElUBrSYzIPDUuyqkrCLdPeaVYmMpL7u3Aowxt+Ou30PUXJbCGziNi8Ln
	ZGfJkTvhXlCYQRG1IF6LMGnc8OvmTrCdZsMa+of9Tup8+NrO3L7CeIWRDDIeHTBAhfNH6TTeSeR
	BJyX1tx/lvEmcfPWl1MCtqBBt1Jsvm3qFmEkJ86RnRaQCZaDgzeR3Z5mDIl32JaX82HVhXbyeCQ
	RR8+TFTo6FWvkVsqw5cxIQfEohAEDEBoTKqU179RBOlicdDHXlCZkQrdm6v7qLWT4KQvTTNtK1o
	71a/TOzcQtaxobL0PIM/w5+CcE3
X-Received: by 2002:adf:fd4d:0:b0:460:70ae:f1af with SMTP id ffacd0b85a97d-47fd72c6ef4mr30489802f8f.27.1785842344582;
        Tue, 04 Aug 2026 04:19:04 -0700 (PDT)
Received: from localtoast.corp.sigma-star.at ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b05fsm44414682f8f.28.2026.08.04.04.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:19:04 -0700 (PDT)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	johan@kernel.org,
	rogerq@ti.com
Cc: Julian.FRIEDRICH@frequentis.com,
	upstream+omap@sigma-star.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 0/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode
Date: Tue,  4 Aug 2026 13:18:47 +0200
Message-ID: <20260804111849.92046-1-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set adds a device tree setting to the PIPE3 PHY for
the reference clock selection of the ACSPCIe clock buffer stage.

The clock buffer can operate in either RX mode (clock pins are input,
recover the clock from the bus) or in TX mode (generate the reference
clock for the bus).

This was tested on a board using a phyCORE-AM57x SoM.

David Oberhollenzer (2):
  phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode
  dt-bindings: phy: ti,phy-usb3: document aspcie reference clock setting

 .../devicetree/bindings/phy/ti,phy-usb3.yaml  |  9 +++++++
 drivers/phy/ti/phy-ti-pipe3.c                 | 27 +++++++++++++++++++
 2 files changed, 36 insertions(+)

-- 
2.55.0

