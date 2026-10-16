Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA45848165D
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154064; cv=none; b=GmGYUreYw5gW3b2Fy+LWc4c9bJkm9zyIJKyNhoGnEBtsCucjS458tGVOe49Wwo3CjYLaDh9DrSToT8vtsSCbfxmugU9in4n8onwnvO0gKHrITT+OyEfM5BgCs9o26vZ/MOXsYwyQUz62p9l76b2Q03OWHlwWb3sI8a/PhAvx1xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154064; c=relaxed/simple;
	bh=H901y/QkJvYdCGEuP2t3lOhzjYYuytrCEJW3ZcAsWDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JH0QtsmlxFm/+/3eXEq9UtaDrFDrFPUk3fftHIlo8DJIvyYjt8yk+eUuv5eCwErw93xGf96YY/R0G6G58l/a70mIyw3n62fvl8U3XdEnfYAF/Z92TODKF5lcSAN3mPYR7WUNGVYgN2sUA9EyjLeTz/K/EFxGhL9KzTNBXDj91ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=jXGbv4Xw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="jXGbv4Xw"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a061a13884so52091535e9.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792154061; x=1792758861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siwcp2SaQ9PRcVqmu5YFkmoYwBXms/f9IkfMmvb8ktQ=;
        b=jXGbv4Xw4E4sH9+ltGURBBpprBw7pVFnSC+2eZzB+4sQumL9NHxCwWiJ+qZ5bXKy+v
         4YABeYU2Nu5jRDYqgY1eo1rnROVEihbEWQ5jgqhwH1rec5sCTwWa3Pn29twU7r5vYQuc
         WRQAC7HGGkWNUWKX5aOj7+NqpTYYU/mI+vQ9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154061; x=1792758861;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=siwcp2SaQ9PRcVqmu5YFkmoYwBXms/f9IkfMmvb8ktQ=;
        b=1Wz+lOIaDMbLCZD1kpGdrMd2tkehnteD3DN0WDzmPWJEy/kMR2EAValDIx/xYd01jx
         g6gtOl8+i3ml3+JnaZ+qRVA6ccQoC61iBpvAPt5xv6WKLvklCvrVslwU2kWh9xwxKoFt
         m7uw+EB+CDNNJvq2DUR7dz88oCwkMtg7irJff1CW780SRerK8kXrkIXnZNe3zc03D6PG
         dAyVe2+zlhDFMwmNzIADZAuy+hHkgqCj9siYMsi2lFxzepDWiDTraxoNjXOO1fQHUej5
         Gs7U0k+jX44xka3CTwNsWEbd3FoTDax8E/8J2V78GExdV24jgn1QRVuheTB3jJ0FsYW6
         bBzQ==
X-Gm-Message-State: AFq9FYI5xDJI44R8yT21Ge3pqytHesBQdooB5M13kd/6H3jZJxdMU8Vc
	v/C9QdoSkVwvDwQRoafipqwb3sKuOmFlgoMty5WyFXIF1J6jv06tIzfGOZp+lntII4sZgCMMDbS
	t90pe
X-Gm-Gg: AYBFou0jd6ffelqzv57iioXawAWjyj10A3z3jhYz9AadQwy92jDFxW1cSgfV8PPyV6B
	DoOAYsh9eOEaFikaqm9UOtNHKvVKj1MJ4bFJTw8oFo3FOATNe00cX8UyuNF5TQgYhymvEXiYV7P
	HIaGpVr5b2uyUJHIDF72DQyUrER0xWCr+cdiWwCIt/4ffGfPQPVHTwRvjoYlXJVLbIrN4nOcw9N
	KBfgjO2ayN/ItWMTv/riPBWUtbcpTvLrpQalmtaCd3ONGrAP4WeG1q05CL+Je6SvmjmQC33C/Cf
	hIRJU6V0litkw6bRPF1Ss+IhV+hN8qAkq4IjRVN/dRo4zWPfi/cwX9GZsAd/kh3AyxD3rx/OAlY
	rg3GBhY6wHK9yZa0u1AC6BwbD9XLny5Pyvu+E5etOPpUsu3B9jZzaVEKwG8HYnidqQtAsDCrShT
	QnEK76PYXei4HWjDmYxAmth3NOngtQyVScjuIazLLOUu+gxOsg0RVUdziz10j/hX1dTnH0ngR6P
	15qcmrm3Yd2EmA=
X-Received: by 2002:a05:600c:3f06:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a18e4ca2acmr438130335e9.32.1792154060975;
        Fri, 16 Oct 2026 05:34:20 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm110564045e9.1.2026.10.16.05.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:34:20 -0700 (PDT)
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
Subject: [PATCH v12 0/3] arm: dts: altera: add Draeger M48 CPU board
Date: Fri, 16 Oct 2026 15:34:11 +0300
Message-ID: <20261016123415.3272046-1-petko.manolov@konsulko.com>
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

in v12:

  - add proper compatible string to the mdio node;

in v11:

  - replace the ethphy compatible string;

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
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 102 ++++++++++++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

