Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736125;
	b=LefxAVIj/Meqhv2EVby4kxu7Ldf/NQuB+r7HUSQjiPC7bZJn5ZSV45nNVpT+YK49MOpL
	 kvrqA0rnTjITOYsEhLl7A/2pZaOIjMECAD6doBr27aoAZzQZStghovXvER2dM4wAgvAHh
	 MXAMi2CAEFQz3COECZ/v5KSwCiaBMgCHzh61TgaVrd03fps2h52urF9VzJIfsu/iPtNIL
	 +u3zaMWIxyXM+oOUeZ6hqYLIN3nKeVLGBvhlNcYux9eMXSS5/yj3YVwUSeqrbR13q0xGa
	 f280Ic5PTLG1i6QF3YBfEIc0Exq+G9QFHoMXqOJLXAsQUpJf0UYY+rDWfuNwj7h5Kjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E2l2TOZJTANmK27Z5fkp2kfkOwSwxws+BNcI1S5L/F4=;
	b=RDpr4HCwEQePjhqO+6cIkF1bGmD6xineT43XPZFGSd8zy3Q06DWzBbmPUsnOK/VYXGe+
	 12EFefbu3yH0NAnupT6yo4EVhVB5ekHiG751pOAl1vRd8Sburl3xrXtP1GZ5Vhl5ZMdZ1
	 7CEi7/K8vhamxb8RYSLxlj8BFm8fSO66NcwT/CPGQvVxdQAygSn3mcJRdbat+3//+3wlA
	 dTNWUz5GPYu1lBu+o6wgtD3p4qbpz1CfYlNLwKCH6ZMtD4bhAk9AWWZwJdeW4aoE4zJOd
	 MkR8hcHZw+afkIujzj2YL5rbcg73hyRBbv+Tg31/NKdYWRlfuRZq53FUxpeNnfg2+hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXFt6lcX;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBF8606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BBF8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXFt6lcX
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b0d91601bdso9656657b3.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736124; x=1794340924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2l2TOZJTANmK27Z5fkp2kfkOwSwxws+BNcI1S5L/F4=;
        b=eXFt6lcXyY3xz3GUePc/hTpzjE21KaHxC9VhQ4OjdgZ7mu6xqRudA6K0t6Kan9O05l
         Uh5wT4aIBZubCXlCChyNxfv9Pdmx/AHENFxOoXsPtGyRNFxdHLsVyA4SsI++ytX5uH1W
         L2Sr/4gU5IzOAOuScDzrw1AGuwADoaGly6TQFASZJF6R5hC43vh6WyJlhD3gm9YWZzMo
         7dC5X52Hn/hBKMm0+fbSvmZMMapPJbUCVhu4+gKoP7Jc1aulmoXw84Tc4hPdkOyCNTOK
         WTmfR0m/wgCVKW7hPxnzqT/1qneSgNTgr6s9oFm9pCYJDo7zBJgInnXpY0dUCvs69jrV
         m/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736124; x=1794340924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2l2TOZJTANmK27Z5fkp2kfkOwSwxws+BNcI1S5L/F4=;
        b=zQ2LAIPkGyUoUjJcGsp+AtoK4xw0Hhn8nroHsxKhBz7SD+duLYXpshYvQRnDym/+jX
         JwNnEjqe8lfdVxselOkAo0MAIaQPUiaWc0HSWZ9rxmpkN/W0D2YXtnpEgkx0J849HFlD
         PY/oW8FbdxXpTPauX8XQKAoSsSRaffP/CyWIMdBuLubyVJq0nfZ+LGqRf0+d3wA0uXVx
         Nuce8+2+eeD2rkLyP8DURiYUAnZpNWzPJ2oJzFP8PBukMmmAEY78gGbAV+IwKAVhmBBI
         wzv/iL20qbvJNjKdozDuBx8y7Kn4y/axGJC6A/8ThuJx4CsFKen+kP1c10ET5zySkVWR
         S9tw==
X-Forwarded-Encrypted: i=1; AKwUvByHVxRP2GbIejabyF48vReaLPCcauP0JlXGvEJ6VUfbj2O8OKmU+e0NHijvWFmBGzJXW728IUWlX1EZ@vger.kernel.org
X-Gm-Message-State: APuU4Z93AIIHAbGhH8wURl6mqT2C3/vN55lR1JbAUWOXq0kC5hoJ3MLk
	3kgYm7468P94Lvak0o0QHCNugAIUXhGER99JHVtjofrW5+aN1k+AbxWD
X-Gm-Gg: AYBFou0YgrzpLgABXGFzvOYF0BdLIi7VOxTRolHrXQWrl5/V2Mvl0ym7O9nBBMsD/Ja
	vOiiU08lwlrhyHGSWhuNGQDyVE0384PVGAVMmap8jeDL65+B/o2AZTL6TZ7xBJycMgfOypib3eP
	mS2EF9cGWcJ0CS8HlOHGnecPitTrp1pjsyI60+/KPn0TO8wRves2F+NlVwYVwDWeUu2XutUw1s5
	Wa+rfRhwObCK/Avom9pc7Zxp09hW69wHMIb1CQE1C7hIaDA1hfeTx8HYDQV9l8kqOCoE5XxRxiP
	ERvQ7NGvMjjXM0jHamC0xAu7/493+UiSEPmwmA0CdY4cmRgVFuxxGMvBw5gjkrQRm2b2fI7FZLZ
	SZM+a99txx/SwrVAAgqpc/tqF7zOyRN1Dpi6/tcWWKsvF3OI6sX3FogNxy36+6QYVb8pwM2avp3
	xxvmozcVkyeAklYZcVXCiiITztcHWpssD7Vxk8N/Q/ddh3ZFzcX2Y1aZPkdQfmPhsyziFKZjHD+
	Ung2SPFf7dP19rquHlo5OyJLNUXq616J0HurQ81zFj7zXVFSUd3CF9NIyqA/9F3WYuFHkShb9vq
	ERnUhO1ohZEBpqmkrSktokE38ikW/GC/fDt0eHVXPwmzHEyISy9PYZec1CAfUm+YUAt95sUi
X-Received: by 2002:a53:d585:0:b0:677:d023:49c5 with SMTP id 956f58d0204a3-67ba4f07d96mr7810553d50.13.1793736124116;
        Tue, 03 Nov 2026 12:02:04 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee245f70sm92764d50.11.2026.11.03.12.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:02:02 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH v2 0/2] usb: misc: usb251xb: add DT battery charging configuration
Date: Tue,  3 Nov 2026 17:01:52 -0300
Message-ID: <20261103200154.125681-1-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103185514.72144-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
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

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Add a Device Tree property to configure battery charging on selected downstream
ports of Microchip USB251x hubs.

The first patch documents the battery-charging-enable property and adds an
example enabling charging on ports 1 and 2. The second parses the port list and
sets the corresponding hub configuration bits. Charging remains disabled on
all ports when the property is omitted.

Changes in v2:
- Only parse battery-charging-enable when the chip variant supports battery charging.

Jhon Wilker Rodrigues Aquino (2):
  dt-bindings: usb: microchip,usb251xb: add battery-charging-enable
    property
  usb: misc: usb251xb: configure battery charging from DT

 Documentation/devicetree/bindings/usb/usb251xb.yaml | 7 +++++++
 drivers/usb/misc/usb251xb.c                         | 6 +++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

--
2.43.0

