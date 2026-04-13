Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC64438237E
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074840; cv=none; b=bmkcRuYOY4iNHHee6qf6gckhNMps7UVrryuc1ogL0X8rJS97rlf3OqSARcdbhIerpvHYkEeamyM27eIYDIVRJxoV+HoqDEq4cUhWzek3rwDLwwgjzGCUbz1Ntj0ITdILgzjK+u+EiD+qwe0eFOl7FZ1mdfkqAnWFE0MuRO4ldOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074840; c=relaxed/simple;
	bh=UxDiNz5aVAd8jaiS8WbKwd6IwvkgGniodqaG9fbAjlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ztzu5b2nyjCsBx8+RtKW9XZ1AYSbW3/6nUiW7QkXDsRvfj4KhWJR9J4kK0rlaTJzikMJa1SgrCECndXcBjTq61EPUkFOeTAAnqQ3F98xJwfQyQcmmt7ji0eMPnFpR+DV3coJopQGcG5fmZvbXo+B09d9F4dnGIqcumUKmQsob2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Puu4Oz87; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Puu4Oz87"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-823c56765fdso2343848b3a.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 03:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074839; x=1776679639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qz15EdajgaOwwJlVpi9rRF2MEm37YEfE9zUFEPe5XVQ=;
        b=Puu4Oz87KxIsta5K9aTtHoBxLJqMIHgxrKMkNcJfIFa1QeLxPIkM3xIf6Co+94yJnR
         B2SA0FVv1tHVujw9PCbOHKa7Si7dJDhX37oTVqy8/hERVJL6CO9YoxYilbtWh9X7PoDN
         Vi/jTwa7Wwk3Cuk7ZllmWJC3/ttettDJPwotnis5LYNrMlHYSvjWhXHqsYuWal+Xys/N
         5SSM7jHqHJc4yDTlIOJj4NUhRKdQ6vqVu702C1mY9WESenHvaN/Lpt2eO0hZ7tXIPLXL
         IRb0f5f5YG7Xicvnw0de54USHo3fw6BHdpJFneiP56IFc/2NTvpmm7mHFtzWGSESag3u
         SC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074839; x=1776679639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz15EdajgaOwwJlVpi9rRF2MEm37YEfE9zUFEPe5XVQ=;
        b=XDBTB5V7TZnD314wtra95CLXAoFn7RbxN0gXhqvdiCjJSvNEgxMSePQXwE6e6l4ptm
         lVWq5ylvQ6PIjqeSK4/S/sOkebb/5DsVyEuTN4/5rxg42CdX7iObGsk+vSWZHJ71X4WR
         Sf6u3cnmNpDdLexSSyTdTMdI1QtX+eXzSTrzamkRjyKVV5O23UOdhzQxM2ITq668M9hY
         nEGiDWD/9GuAThgMoYV0I1ZiMjBZMp55iOE0Ux26FH1GU11PLv31iFeF4TDuS/+Ps40V
         Ca8NEUCyiJuGQojPlyHJsjXnfMBTrSUmyiN8LFia+fA4b2fkUnGEq02qpss8NN9MpAin
         48iA==
X-Forwarded-Encrypted: i=1; AFNElJ9qTvU63A8MJ4x7xsqnptvnNowPP/hO0/bkrFoCEczLgfZVnUA4+EGquWUVc/X5wouoW4dP5sNGrv7G@vger.kernel.org
X-Gm-Message-State: AOJu0YzVo7u4EcRe90V67AxPVMye9xHG93+WP3MuT1Kl+kbD01yFbxfR
	9thxsJWIz59brDOpiQgJr14YNvOqU/P/7XVHLj0/X6ZS02Z2Rlkqo6FN
X-Gm-Gg: AeBDietwzuH05/TBTqafQWfZycHq7GqLwqL2+0sdueHc3kajnpOYSUWD6wGlGrPFH01
	1J7lset0iAAj5glHQ6BqMm/UoUmXa3m4S3fotY2oZt/Xe5kMh0YxZKcX4j5/ZaoN5efxv5fNby+
	msHopfP0uCZOHVF3sldPl4/TvHGHiISYWAYRk88SGZwnlbDeHCTlfgE+rnZOkrQmH+vjpOm5o4t
	yW0RvQvwvax3kmYx/g5xCAhXVvYblvFDhWAFA27rX1KD+0PBCY52My5Te2vhO0/Bzl4LSDdfsBU
	PzwcHjTaNQhdhb6dqGSsxdsdbQMe2p0Q06IVskreMy8PlcofLN+uJUv/4+pzWY4f1EFlb/HXsRr
	L/FxOhKlw7SQCCpgUP2K1aCuBF3tEkATjnnu4HbVEGIST7YBG7C5vRD9E1q/4LweGnD86+aXG89
	K2IK0UywC10fnQTDzeJJ+5CTZhe8C6aJ7S0eL/E+FTHuJvZZXZxYwd9de8PQ==
X-Received: by 2002:a05:6a00:aa85:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-82f0c1cc16emr11475540b3a.9.1776074838631;
        Mon, 13 Apr 2026 03:07:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/6] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Mon, 13 Apr 2026 17:06:54 +0700
Message-ID: <20260413100700.30995-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

The FSI on r8a7740 requires the SPU clock to be enabled before accessing
its internal registers. Without this clock, register access can lead to a
system hang, even when the FSI functional clock is properly enabled.
This series adds the missing clocks and aligns their names with those
used in the driver.
Following feedback from Morimoto-san, the driver is refactored to improve
stability. Clock initialization is moved from the runtime path to the probe
function to simplify the flow and avoid redundant setups. Additionally, the
shutdown sequence is reordered to ensure the stream is properly stopped 
before the hardware is shut down.

Changes in v2:
 - DT Bindings:
   Define "own" clock and add "spu", "icka/b", "diva/b", "xcka/b" to the 
   clock tree.
   Use YAML anchors and "if" rules to enforce clock-names and r8a7740 
   requirements.
   Relocate allOf block and update example with full 8-clock configuration.

 - DTS:
   Rename "fsi" clock to "own" to match driver implementation.
   Add missing clock names: "icka", "ickb", "xcka", "xckb".
 
 - In the driver:
   Refactor clock initialization.
   Reorder shutdown: stop stream before hardware shutdown.
   Move SPU clock enable/disable handling to fsi_hw_startup/shutdown.
v1 links : 
   https://lore.kernel.org/all/20260403112655.167593-1-phucduc.bui@gmail.com/
Testing:
  - Verified on r8a7740 (Armadillo-800EVA): FSI slave / Codec master mode.
  - FSI master mode is currently compile-tested only. Full verification
    requires a dedicated HDMI driver (FSIB) or hardware modifications 
    (resoldering board resistors) (FSIA).Full support for fsidiv requires 
    additional DT bindings and a corresponding driver.


bui duc phuc (6):
  ASoC: renesas: fsi: Add shared SPU clock support
  ASoC: renesas: fsi: Fix hang by enabling SPU clock
  ASoC: renesas: fsi: Fix trigger stop ordering
  ASoC: renesas: fsi: refactor clock initialization
  arm: dts: renesas: r8a7740: Add clocks for FSI
  ASoC: dt-bindings: renesas,fsi: add support for multiple clocks

 .../bindings/sound/renesas,fsi.yaml           |  61 +++++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        |  12 +-
 sound/soc/renesas/fsi.c                       | 181 ++++++++++--------
 3 files changed, 171 insertions(+), 83 deletions(-)

-- 
2.43.0

