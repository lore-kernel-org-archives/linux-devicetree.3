Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174866;
	b=5OUdsN2EbDKvi8iZfeiQ4F9Tzh+7h8SZsq2hMXm7w6B0np90X/p2cnT/utbd7oYC2QgS
	 Q2VKD8Y1w/O7qk4JNcfjxe1fvalO5LsjMvV4El0S6veF8s81m/EJgbnRVV+2fAs4fyRkR
	 HnV95NSkceMq9qw0ee4KkU/D1AeOmUS6cVAifdZhRxn2JTL7xeSHFQJgsaqotqWhx7xQB
	 NPMzv6+P6Hd08VK0OH44ZT9pEv4FjUwZIgOArVO5o2a11VBQoIPr/Wilba8NzdQ3BEZ2/
	 vEBwtQkm+BZyqrn3raPSmi2EjymOykuQRYU1u1eHoQxZMeS87JURUIRDtsb0c7QidpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=D3sYdKhtwMz2Ymepp70k+wJP1lW04BDHKmEdKLXQ/0g=;
	b=39NCCNzSiTSCZpgfZvNUD+Fr2G+xJm2EYa64TymZS9gd0mbvRXz0HI9gSx+DJHapDSub
	 7Z0JEPkDB3+EN4eSe6XKIV7yWkuDCD9/2oJJ2HlEa8k+158N7Yy11eCk+bBOZleK8JZfC
	 1vdXpLbWs/hZxsvpEmXYPD9d4bfKa8WaQlYUE9I+goJJ5nHrJtgXOqsv4zpTzvtSpuLAh
	 yJ+ATfSYumeBra964HX5TPSec7/LE3d+q74Joh68JToKtBm7pJ9O37AbeNA7S2ICZZDr6
	 /mZ3l4kunsgqzQ4yts11azOIldsqO8rxHBGYxueOjkXpZTtN6HeuMNeKw40p4A9stww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwxCqj8X;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008B5606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 008B5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwxCqj8X
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so4977545e9.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174864; x=1795779664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3sYdKhtwMz2Ymepp70k+wJP1lW04BDHKmEdKLXQ/0g=;
        b=JwxCqj8XfU2+uyArh4tcmWO78sFv//GqEEKKhzO9qtOqV0begI692f9O6HjkRUv1Pr
         ++YhlN6hGEd5mN0uCb6XrUh7w/zsvvo4Ts8ohVlqy021lIu6Nlrlw47/j+TBfhs6afo/
         DReqrDYS3SK/Gd03o0MrNrPczZggH8meSTE71V+SMBcEiM4oanTiF/tNQyBFx9volFm6
         e2GMi1rzuBgUaYJbRDWkPxAG2UlSO/PEXnHpaZuA4JrM1RPrDbqZm+J3AiK8w0unh5HN
         /u8FDg7eQ+ffKRXdhle5BBFv1eMbTO5x29pPribFZzqdkh+K7PrZyCP4H92mhSO9UcJr
         lUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174864; x=1795779664;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3sYdKhtwMz2Ymepp70k+wJP1lW04BDHKmEdKLXQ/0g=;
        b=U1PB2E0ReYr22jyirlhpE1lRiUZly2k9JjPF+WVHI5ioDJw6z+9587tlKo//Y+Mz0C
         utWGIORxbwRpU/bpyv42oDArwMTUhyv1hqNQ+KDUEQGP/sRbUin5Kr7UJLDEJTn4cKmr
         Gd6YUbREk8Mur28JtdFdPAMFcBNc4lCvu3eJDJV65SqjPuLzSrNFpFd5N3XiwGegVs6h
         y0ReFkdMA+oIA0YSSMg2RFlHG38UXRn6o6yS74+NFS4dwD8C1WOp19VRhxJCcb29vjjs
         h33D+P5VncsIfw8axYhA0xFq87NylUMruF1Ke5APdYak2iPsZa6q0Zkc2/4ww8b/lHZe
         QW7w==
X-Forwarded-Encrypted: i=1; AL+hErEjHToEomlhxwJ6tem4BCOTtAbLq5/OYFWEkVy5RsGrGUV+Imvl1BhZfv93uYfwx7uqMqeX2BhhFDmu@vger.kernel.org
X-Gm-Message-State: APuU4Z+R/IRrI0E5nKtqkDiNb4YICfVsxOTq815tZghVw205BxeGrP4V
	ouKfir9F7FD6zxgmp5HVKmM9CTNVuKl+cpYIC6VzD6biEztnvYgBIR8B
X-Gm-Gg: AYBFou135LzUbMmuvKoIsZrk236NMFpto7ZpKHjawea/XgUVX22QfHEUgrb6bvRTZaR
	3H+bmjs2cNhweCMT5dgiXhu8emhAxeibhXYWWc19o6My81Q4useO7WCnksqAvmwRtLu8nDfVwFa
	2kJJRlWKPYhjPmfd8mbAO7LqPypOYia39wbRB/XrjfqjC0JjyyJKM2xyNqa3U2eglk72Ba4FK8Z
	HGWGUge92w1Z6noK5D3pD8ZHMtVNGEPLG1BWVQ2tYOzam0wM9gf7v+/Zvwyx6+nhr1rHvw8yUWd
	SbcFUQd8lnQHsR/EbmAGEyQV0KhDDcFOSTcHAjdRW0ZC8YANGVfdPdMOsXTWJPS3uInuHXSt23a
	dLtlxvEBldmmoFpFWwgnDGCChvE8qr+6g5JlRknKD6gLf9uYr9H7pEPLGkNzihbeyXEzAllyfQT
	k+Uf7C6EQpfkXOJBJHGbw860MdNn+41jr7tlu0bbinAc0FwnBeoxWS3NK7+b2Ftc6dB7LfzpD3J
	SrLS3p+6KI8D5RV6YGCNt0+kdKC3jnUOBFCCEky6n18rqp1JgDqPI2pUl2iFzMeteC0D0uYfakp
	hhKCFSgRclk/h0Od3b3reqqfow==
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr62096785e9.1.1795174864114;
        Fri, 20 Nov 2026 03:41:04 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm27419345e9.4.2026.11.20.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:41:03 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v4 0/2] drm/panel: add Novatek NT36525 (Samsung Galaxy XCover5)
Date: Fri, 20 Nov 2026 14:40:58 +0300
Message-ID: <20261120114100.978148-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116070212.314228-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
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

This series adds a DRM panel driver and its DT binding for MIPI-DSI
video-mode panels based on the Novatek NT36525 controller, as fitted on
the Samsung Galaxy XCover5 (SM-G525F, Exynos850). The panel is 720x1480,
uses an active-low reset (RESX), and a DCS init sequence that mirrors
the stock Samsung bring-up. Backlight goes through drm_panel_of_backlight().

  Patch 1  dt-bindings (no change since v3)
  Patch 2  the panel driver

v4 addresses Uwe Kleine-König's v3 review comment: drop the unneeded
<linux/mod_devicetable.h> include (it is pulled in transitively; this
driver's of_device_id/MODULE_DEVICE_TABLE(of, ...) still build clean
without it).

Adding phone-devel@vger.kernel.org to Cc per Ivon Argel's suggestion
on the v3 thread, so the relevant ecosystem developers see it (not
adding Ivon's own address; he asked not to be personally Cc'd).

On Michael McAllister's offer to add Moto G10 (DJN NT36525B) support
on top of this series: happy to see a follow-up patch once this base
driver lands; I'll reply on-list separately rather than hold this
series on it.

Tested on a Samsung Galaxy XCover5 running 7.4-rc3 plus this series
(re-confirmed 2026-11-20, kernel 7.4.0-rc3-00023-gdcb8b91fb779+ #32,
after rebasing our local tree from 7.4.0-rc1 to the real 7.4-rc3 tag):
the DSI panel connector probes and reports "connected", debugfs
reports the reset gpio as ACTIVE LOW, and /sys/class/backlight/ is
present and readable. checkpatch.pl and dt_binding_check are clean
(bar the usual new-file MAINTAINERS note; the files are covered by
the DRM PANEL DRIVERS wildcards).

Based on v7.4-rc3.

Tool usage
----------
This series was developed during XCover5 mainline bring-up with the help
of an AI coding assistant (Claude Code, Anthropic). The assistant converted
the vendor init stream to mipi_dsi_dcs_write_seq_multi(), drafted the driver
skeleton and the DT binding, and drafted these changelogs. I reviewed every
line, validated the binding (dt_binding_check, yamllint), tested the driver
on hardware, and take full responsibility for the contribution.
Prompt summary: "convert the XCover5 NT36525 vendor panel init into a
mainline drm_panel driver plus DT binding; keep it checkpatch- and
dt_binding_check-clean; test on the device." Review comments are welcome
and I will answer them myself.

Adil Hüsrev Tepe (2):
  dt-bindings: display: panel: add Novatek NT36525
  drm/panel: add Novatek NT36525 panel driver

 .../display/panel/novatek,nt36525.yaml        |  83 +++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36525.c | 490 ++++++++++++++++++
 4 files changed, 587 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36525.c

--
2.53.0
