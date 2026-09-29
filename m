Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FB952E065
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689268; cv=none; b=eNV07H/rcZLViv1S2v0RBrKATL6kPesjrWZIv+74IU/+yO+nceEu4Ygrut35XTxOXip8F/AYykboEA/SrwvZhFCmhF+D7NT4A15b2avWjpDxaGOd0Qqurtfd7FCf/PQXg/rX63k0qWWSj9gzrTv9XepizzuMo0/OFC9epplLZHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689268; c=relaxed/simple;
	bh=td7HbxRYci/m7KfsXJrG5cihi0Z8xlfeWoVK9ghwzDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HZEmp8xedogbde5wlwqaiOj8hQ522NDGGImQUNROodZ3gmZVRfP/Ww7iMXh+rytLvIfSnFFHcRd6kxA3z1tZOrrXBWUVQI9/SgurG+qukjfBdbk92aoGZnBvEeu2nUsdl3ikAxKx+A2N5GmtoPdUCc+Z7ONhypjIwF09/CfTgyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=nhWsCgF0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="nhWsCgF0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so3181349f8f.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790689265; x=1791294065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKfS1SJFoYbz/LMv6O/HQU2dqXdfzkg1p64FHWJTY5g=;
        b=nhWsCgF0dLexbe3flVLP2LHiQeVplkBaOMQqUujT5XdoIn1I8EZl/cA47rsf8iXFjP
         J04NpUJFUXzeHTxyN2Z9EtO/eZvQTfUCiW58fxfsGOyX0wK++YkymDh1hyIMoxisAXAI
         N+p53uKBHAAY+r8WPsH3wpQJ0AuglD2vCzCf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689265; x=1791294065;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKfS1SJFoYbz/LMv6O/HQU2dqXdfzkg1p64FHWJTY5g=;
        b=pR0BSkVmnADXWGHnFMCqLUWtoNqypNpcDTo1Z6Unu8MYlLpjsUhx8ao1XYeRqUv+U+
         CNrhVNejSN1MBMcLjEY1V39EKho/67Fvgs+s/S/OWk9JNwhbZmzGt+1EM1tZdozap4Rz
         Rl90xiBS4qJFgUuUkSaQQDZahUVY25lyuZ0bu/GTEXndT3tF6YltZ7gyotnIsZfsn1H5
         m0qZbOWTs+7+qnLdPCYbP0dCcFgaiOm84gwMnS+SRKb4S7F3r2GlaCnVtWJWgtBViTRU
         E+v+K5gE4WCf+uTHkbAeNbsksxV7kIkc9on3jL8lQOrL+tH/yhE9u6ObBPZ/Tyo6U5kz
         bzYA==
X-Gm-Message-State: AFuF++m8242KtitVTs05/JN0LBq8uQu/qDOB813go5MpNQCgNkUwhdYc
	DUP7b4iZW0yyTQH7UZ6DYoz35BVjoh8pUhOP3p2bHvyyEtXJrlS5P7gho/iPF13HQis=
X-Gm-Gg: AYBFou1dmSTbHo1PZuY/R3NZsiHo8tVox3jhAZdEAJyAPovTmub5mEPXJfbK8hPR9DB
	fxWl8ps4YVrQbEoepDoFLOpcdg/JtYKFeQhAGEONgFE9r/4gT5hs7ewohY2aivH2jCmoL6ibASK
	6IFJ81wg+lRCQY01dVQ5sOk4kt3MhJvXQiVgzHxL1+vz1hA3zcRPFusQ7DS43rPsbnSn8ymrZ6T
	i/2vNGFh2NaZyLv6P7tCwKLDncCCtB4EKBUVRlIFICqatVTaXcy6TKIeDOZvggYdUzZB4Wu9w36
	2nczwTbsLuO/gdcERUduzvwQvyTnxdAeqC4wMvZgqp5metq/XBb2xlLbfarX+qi2vla8VBiEnCB
	zq+d8I37BAtGapIZ59jzZp6x59quMpGVWdfV4nbyxqvAonzJoj0Dija7+TmIKhymsJkLd38JHGx
	9+C/CvBh9iJuqKYOpfyDETpc+r2a0g3eNmInmk2JoRz6v1fuh+RgfMnGL5x5aYahExnzk+ko9W6
	c6kZVzLe3/cvdM=
X-Received: by 2002:a05:600c:34c3:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49fe66abcebmr281223965e9.3.1790689264853;
        Tue, 29 Sep 2026 06:41:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d1011d9sm91835165e9.15.2026.09.29.06.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:41:04 -0700 (PDT)
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
Subject: [PATCH v8 0/3] arm: dts: altera: add Draeger M48 CPU board
Date: Tue, 29 Sep 2026 16:40:54 +0300
Message-ID: <20260929134058.819371-1-petko.manolov@konsulko.com>
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

now in v8:

  - modified draeger,m48 to draeger,socfpga-48 because it is more consistent
    with its other imx counterparts imx6q-m48 and imx6dl-m48
  - dropped gpio3 and gpio4 bindings;

new in v7:

  - replaced module with board as this seems to be confusing to some;
  - add Acked-by: Conor Dooley <conor.dooley@microchip.com> tag;

*** BLURB HERE ***

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 dual-cpu board
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |  1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 91 +++++++++++++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

