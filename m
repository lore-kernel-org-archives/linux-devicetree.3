Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265E4515894
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070040; cv=none; b=TromSWFNstlbFK+2gJ3QhqLbbjOyF7SGUupHrxWXTU9N8eH83LzRGtp5RLSaSWEIJiaKWHiEJDyzR2MMIR5LpXg4XIMmgX4qHINstSNpJZbjUtECC61BsaTzagcO5oZimCQk0T//y++AS2DYTfFGCQ0+wyvQ8SciEPSSMslEUec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070040; c=relaxed/simple;
	bh=Cy4FqW5s/wsMdOpXtYQKO+J6TB8GbKalMxQwWeOkqh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SbQf3GLJpeb95JhKVJssj0FHnyVNS65kHl7ybi+dvjgnjui3Y8IvPUBXded2PkETKMygw0qjgy7GDm9vwhrWnBOD7+IQLNtSmh4LAfPuOkidd4WG2/nbN7d/3B4vMeLwCw6rUzgkuafnhiI7cOgPb38I9tjHdQf6cd69FBqFqyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Vu7ccA/G; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Vu7ccA/G"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2954011f8f.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792070037; x=1792674837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lg7Afv2MbybCWKsvSIcXXsArqfbkDY1tcbjpvlWAZvo=;
        b=Vu7ccA/GS88VOiTYcXy2lAXsokuu9gNlYqtFJiEfwawZgpsycNWIY1hviRfKDZfcvD
         Yn3oAD2FG9PU4F2q8VYBfFZQVuQsRK3N03IJuUgR38+cMCXf/4naplkTB6e16czKW/bx
         MIHuxNrivkHl2123CoHfA36EEMI1TwsgAjqHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070037; x=1792674837;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lg7Afv2MbybCWKsvSIcXXsArqfbkDY1tcbjpvlWAZvo=;
        b=KgNHn+0/cx34HdWsJmEJeOTGvYslySzq4CBUYcGbBDqHFJGylI5dXuEIkSlkwDYD1n
         EFKpaT7tqIbVEeyhQQeabf4IKn6HOMbTsEmLtEo5zFZcDVmh/5VpVCanp4UbmzX69qMB
         /8WxgU+gdjVkoQJBKKqN7+KF4wNw9r6W2Wpl263ZspZ5AOFCymB3cWVjQmkOKgDT7Stk
         OOmeV5yhT33iXFx/930atQpoXdgKJpQrJtGNit0X2FAnTcBYNqDfhjISj9gP2Vb2x0eF
         4GU/7TudYrcoERDQrGwDjBmwg64GwbYYlN6eAburemnD3gC3sWPqInJAl9z9ciHVO+cm
         /fdQ==
X-Gm-Message-State: AFq9FYIftuEWInvhR3+etQDz6ToLhsLRQmdzcP8gbmEXjWoxN3RWb10W
	9CWtTP4OoUXly8YMzJmNfov1O5tRH8owzCtht1BibOu0gOWosKj1o9JfZ1ZJPqmdnE4=
X-Gm-Gg: AYBFou169UsUCG/ArmK+d92hBIjGL9W1zP2rnfaOa5IDdqsJlaa/QSorEhUb3oL/syS
	zVotDQJqXSOyerWKlNqzRYfQ2bvfK3nZGFq32JSsV39ZtI5XLEFd9PRyJ78HmkbZ994cXTrhDCP
	490IBlvrOMiS1pUcD4mefSd20CIsncWxKrSTPKeQxXYZ4urD3MxzdF2t5I8ZWif4i9H7B4K16gc
	eckyUwWlqBX3I+JKhfEeY7pMwFY2c7Gxkt/5KX0E++XCdWo0SvF9+pmImhTN3MBlfM7uaoWWnfo
	hifR4LkL4PNQI6AfW/ROQzJST/ZbG0bpd8jFrQsHqAGgEvSLSOdaRSzRVXnNGPcqfB/FxaUpI14
	4ba62R8BOzM6XXHKOTvOwfAlqf7tqpLm0/epxOXYyanSm+LxHmJzLo7LM0IQAnJJP/ymCW6YRcZ
	s0gHKy+c/fulZQ9kLqXhCfgW/3DXVwh5A8imbTd8v3BJfpYCpXbZG8tdBMRQIRVYfr8CDIoCFSl
	nJkow2eXZEH5U8=
X-Received: by 2002:adf:e013:0:20b0:487:930:8acc with SMTP id ffacd0b85a97d-48dbaaddbd5mr27462050f8f.16.1792070037349;
        Thu, 15 Oct 2026 06:13:57 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm17807433f8f.36.2026.10.15.06.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:13:56 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v10 0/3] arm: dts: altera: add Draeger M48 CPU board
Date: Thu, 15 Oct 2026 16:13:48 +0300
Message-ID: <20261015131352.3624327-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the SoCFPGA devicetree part.

and in v10:

  - add device_type back to the memory node;
  - move the compatible string under the phy node;

news for v9:

  - remove the name property from the memory node;
  - fix a typo in a comment;
  - attached phy-specific skew properties to dedicated mdio phy sub-node;
  - add Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

now in v8:

  - modified draeger,m48 to draeger,socfpga-48 because it is more consistent;
    with its other imx counterparts imx6q-m48 and imx6dl-m48;
  - dropped gpio3 and gpio4 bindings;

new in v7:

  - replaced module with board as this seems to be confusing to some;
  - add Acked-by: Conor Dooley <conor.dooley@microchip.com> tag;


Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 dual-cpu board
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 101 ++++++++++++++++++
 4 files changed, 105 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

