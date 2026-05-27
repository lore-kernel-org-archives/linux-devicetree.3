Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ED31A5B9E
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 06:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779862986; cv=none; b=KA6m972YCFsaafjieLP0wTaaIeDehWmZrx89JbRp+Jlcpl7Ag8dOjY3s0IyGgt3bE7j4N3EEd+x/5EBDhVvtgRXVCmUd/f33j6m9Uf4kMVrCILkhOx/k46FuthUhrp+ticPUj7FFJwpPnP3GqbpRFzrLaG7afnRmSms2F/k/b/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779862986; c=relaxed/simple;
	bh=KsTFn82NGC05P3l09xWAqcBlBeJv1lXfsHgPi87PIaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DXANOn400xGbWFVripVvoe7G7kRj6hOG/+p0/sENeVc3uwPB9pni/UeFg+a0xzjHCXhqQvOmOVwiJPHn/UrMv04SgumGTFE7QNqF+fUBjhLYaUBRhty6Q3p+KNdleKP4BnFLLTl+e8diWwIxklxTtWA7k3bAyTgQxWsJyECvxT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=Q5Tq8HOn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="Q5Tq8HOn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2be1dd4af34so101500635ad.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 23:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1779862984; x=1780467784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wp7cVAEXMj+4Rtt/nZVyY7sv93Gg+UwhM0RH5MslZVE=;
        b=Q5Tq8HOnzBJZADD4AlEVdChNF4ZRznntvB6AZtF+v0heaiQF4k1aGjTHIuDP7ig2uD
         UbH4MnnPhqrJJukOllrp6PdwMhQulraHqYEo7Qp/u1wqItE+vJ6lEs3S6CerFs7Wcg6y
         tLFfJupMwJOPSeQV+5Qmr0aJf9BoIsixFwHpE0eBwNx8Wbavil7Yrj79ECNnjErEVWV2
         WXDwz6KSPYkfDpytHQb0xIxQg5/CR5xp/MtWeaZEKnSaRY2Oi9/x/r0D6ywF/9zVvhM7
         XhFekJJVEJ8hNlo+0k8G5+4e7eIdu4eD2aJNW+/Jf4BkaSdVfNHjbgxSuDZ9YpIKPvT/
         R8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779862984; x=1780467784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wp7cVAEXMj+4Rtt/nZVyY7sv93Gg+UwhM0RH5MslZVE=;
        b=siBjc0+kyEydOHigzydMOEtsk0EiuBgZKWZ9Djj+DXfIWTpFVowOkouKmItEK5mnPK
         rTuzXsoAm8onv+X1vlTQbadmCeqs3oDqs9+TPjaTbL46DxPGALzwMDyayvprMgpmm025
         f1iBdIfmdAiwi6nZsPQ7JpcUpUvmE0LM15qLJ6+wF19HVTNicbcLKdaxWNuRZ/7HANOd
         +sT4oSUqOKxnaSTCGERfKL6F70OK5fNngVVAvviSAyDsweTu8nOOcnaZXcuslLHnNy+o
         1He+v3rzKPpP/JoVSqhZKOximmk1rWzwgbSIyDgdcs7m8GYa7816INpSJ6VKxukcxNLq
         9EWA==
X-Forwarded-Encrypted: i=1; AFNElJ8nbiUoBX8sRxnDLNAFjNz/cTA9izw60y//1ruVP8Ha/by+6g8hqbFm7qrjbNkq0yniMdlSaDAx7roP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjw81SGl2RbDngE3zYuXtHfft6nw7yd/dw5jxsnJp9viSqeexm
	VIDXNYqW3CVkcRXHDOhi9qt82tKcBmmsDn9Lkv88SLh7d8upyjm/vM/+DXQspz4g8dE=
X-Gm-Gg: Acq92OGePVaIRFpLlLU+9bAHuk3vhkfXZpnpydK+5C9SZKK9rWJUML2hFbnDINasMg+
	waWvw+ux/2EUtIvCj95AWrs9DgdBQ51VCddkhwtOHxowfHMQObdIzG5Q0YcnfQmVItpOWhHWVEw
	OXXs3YaU7o7TJnaD6gK01+t2oV2LcB4hXWz4VsOAQMleOMLchFya/EPBmEJXGYR3XOlgTzJrmQf
	PXvkyoSJROV2OxRtUDz1I4Rj8WkXliNUsjUaFKVMZ3Xa6mnuVAGIjEk5ay4vhDz7lGv5NtPeKos
	yJfyvNgBYU2Z5iPRuC8g+fiEjJH3C7G55uzylTTm/MdB8i9YI/VXdTAgHZCb3cdM0keNzL0jchF
	m+WLaYGREs6jp7KifF9nj7NsxWX0UBYwNIblFjpBuaFbu612s6ah43xZA71RyNEG6ILR6TqYAuK
	G0a4XiqRoY8rEJDCS7CRSVKVO9bA==
X-Received: by 2002:a17:903:2f4f:b0:2b4:5f69:715d with SMTP id d9443c01a7336-2beb05d9d8emr247054355ad.25.1779862983821;
        Tue, 26 May 2026 23:23:03 -0700 (PDT)
Received: from z440.. ([24.21.231.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm182387205ad.6.2026.05.26.23.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 23:23:03 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Kever Yang <kever.yang@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] drm/panel: Add support for the FocusLCDs E35GH-I-MW800CB
Date: Tue, 26 May 2026 23:22:58 -0700
Message-ID: <20260527062300.88928-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for E35GH-I-MW800CB 320x480 MIPI DSI panel by FocusLCDs.
The panel uses Ilitek ILI9488 driver IC in DSI mode specifically.
ILI9488 also appears in DBI/SPI panels, but those require different bus drivers.

This is a resend of v3. Since v3, this panel driver has been tested on 
STM32MP157D-DK1 in addition to TI AM62P EVK. The panel works in video mode on 
both platforms. Additional panels using ILI9488 DSI can be added later 
with their own timings.

v4: Rebased
	Tested 7.1-rc5 on STM32MP157D-DK1
	Adjusted E35GH-I-MW800CB mode timing to a 14.4 MHz pixel clock with
	slightly increased blanking to make it more synthesizable across DSI hosts 
	
v3: Fixed missing Reviewed-by tag
    https://lore.kernel.org/all/20260204060114.345219-1-igor@reznichenko.net/
    
v2: Added comment explaining the "focuslcds" vendor prefix
	https://lore.kernel.org/all/20260203054121.335441-1-igor@reznichenko.net/
	
v1:
	https://lore.kernel.org/all/20260131034101.307486-1-igor@reznichenko.net/

Igor Reznichenko (2):
  dt-bindings: display: panel: Add Ilitek ILI9488 panel controller
  drm/panel: Add Ilitek ILI9488 controller driver

 .../display/panel/ilitek,ili9488.yaml         |  63 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c  | 299 ++++++++++++++++++
 6 files changed, 380 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9488.c

-- 
2.43.0

