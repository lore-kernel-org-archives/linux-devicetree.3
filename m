Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094EA35675C
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139287; cv=none; b=mYVl3oGpaVFQYFtcRdcsNVES5a/q6GNwm6YSdKJD+v1MtinDmb2mKDwxeMsBHiu6zeJPe83dhR+lh5F3LfhcPTyNBzl56OU8adLb/rg+eNr1wienaSAEs8E/S/mL+Q0yZu9gS/wVwIkHWTeEL7tr1bqt0ODiddieoOIT93TuoQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139287; c=relaxed/simple;
	bh=N3frbq4Brgq8hgGZUJXVgs2Tedjbb/R+MDXnGu9l10c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SjrlQdG76fNbU2jw7av06alq804eoOtY9Swr6/yhzf8CQhi2JmCDMqHOjcRTFkp+6UQNpcJ22pS3s6yI24+WbC9ldTnZbP2nZUd9YIOUdV4wgamGbysX17ZPW3IRY1k05+wWyxAToyd6KpAfxyX5ZtpTMMRERCH0Ki8kPUPhiaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=PkieVPPu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="PkieVPPu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so6245795e9.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789139284; x=1789744084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+9EKefJ9I3t5TWISEhfwAczcNql/LEBcHoCAJliQOk=;
        b=PkieVPPuORXbFOCU0dD1etnvibwVAuVwocDSuWDQNWFMgvFpUaDP0uCXjmhptPRoCE
         veCrZp6EOjij2D8DZkqVgiAdJ7HV4skmGAWt63AN7lNBGMI1oClt0YbFU1DAIXFXvuTk
         6EAd/Cba0Mqs3rshRnThXnAd9KZ7BpnOCG8qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139284; x=1789744084;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+9EKefJ9I3t5TWISEhfwAczcNql/LEBcHoCAJliQOk=;
        b=LfJXLQ8cK71SPLfwD/o7hSlVV2oSm/rK+XLC9RXXeR0ImENmpEtFQgtQuS4vrGtzlW
         wQ+O1e2HkrUv/pKDmUXj9VGGkUXqJRtasAE4ezi4i9+VKFT6lb1oiCxYd9FycxGV2LiV
         Q3UwzLJpuc8byCtbq68p5MWwzEMeL68s8k6lNJ6Zvf/OtCKM9Bv+BkWux5hZ9ctWfF+i
         XwNq5m6H28dSDYyhLclCpttWITrwks9IlJv8ZiYShLX8SkE3szCeRe0mLcHcoAtgaOQG
         k7eE4p/CtHGObWIkH2xNoSh9w8zB5tDRhQnHFkMI/eCUUsE8vUsEvfnRhfsjHqkEVSMH
         6oSw==
X-Gm-Message-State: AFuF++ktufM+Jrd68MdBao0hsXlyJhPUorT3O2q5hyhd3mQj7DqAcugY
	iNbU3mxFw02PrF3MW0PylCMYpzyoQbH95e7mLXSn2brU3dqffUOXmWe7Mm5zbHAy3yQ=
X-Gm-Gg: AYBFou3uZk/q+SFbFK36bArnB2XyldM/VPzH4DCkF2Lcu2mOO47sQFaTFlECovag4fC
	GuYx9Ju4+h/o+IoRjnntQWcvv8eyzFieHy6pRKSxvaPdllqunktSZ5zD3P3UtfQpqBE30S8glYD
	C7bxD1dVw2MNk3Yb7VUWEu/FdvUzHp1Ty9wRL31N759fM2EHv02jHPqPep04LtX5NePFJqdt8J5
	qPLGaRT4rgHckFUYz1r8Pe4+DOMk4ajm9W+6KkosSn0sAyAEhl+85vPjbiNMOXxBziWAQeLqhU6
	URRdFenNrimF1Ye2VZ1LhJ3fgePggecvbY2iP9yLUI5x1UpzEsKCeROv9zAOEyhUQlAvRdXkMIH
	kPUZv8lULn82omX38GV0COUXLAm5fwTdCqHF2ngMe/C2Jw5FtyDEeUkfMwMRB5C2VQrU8Pekrqd
	W38B8EkCLlvb2Aawqp1ZJ+dNT2I5DkvuZI0aNRsYNI0W0ua9MwccJSQpUUsNloAGWGyo+w7nKBW
	ZeWIBirMKht2VIC
X-Received: by 2002:a05:600c:1385:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49e61878ab9mr83494395e9.3.1789139284113;
        Fri, 11 Sep 2026 08:08:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm108933095e9.4.2026.09.11.08.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:08:03 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 0/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Fri, 11 Sep 2026 18:07:51 +0300
Message-ID: <20260911150755.2803736-1-petko.manolov@konsulko.com>
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
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
carrier and they are cross-monitoring each other.

This is the SoCFPGA devicetree part.

Changes in v4:

  - fix commit messages formatting;
  - remove stray comment from the .dts;
  - remove undocumented "bank-name" property;

Changes in v3:

  - add Draeger AG in devicetree/bindings/vendor-prefixes.yaml
  - separate binding changes from the actual devicetree patch
  - remove "earlyprintk" from the boot arguments

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 Module
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 123 ++++++++++++++++++
 4 files changed, 127 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

