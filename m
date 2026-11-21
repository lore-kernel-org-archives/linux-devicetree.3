Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795232502;
	b=Gelj8fXjsFzPC216gQAJAPaDUHRkJ+zK/39lCBDr6c9OWA71b1hglVoyQ0JNxn2imWMj
	 ZBmYAV8Z67EMrnS4jetiPRGgDTk49OBgmUIKzC1i+FV8VTUK2L8gz5dAj2a3md9+dHmT+
	 jDkbomOxOkxx0ZNccoLOy59mdDbj7hD57vLUn4OsCRq6CQKvb6o49MzyWR6iDcZooBhOQ
	 V38LiNamBVitHAYjc4uDvw3e/E/WSQ5tyZmnjCj6oRbRNEU1UAkkRO86R0w2e8ipClSma
	 hGJOZc6NennqEC0RV45SLxofHk+XL/ZIbkKsEmYyDR7L0NHxjFrdkL1SCIIMdxL52lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=asqkoYbz82hEaVuDlqAKtg9A95Bx0CAB6i8FMp3RVm4=;
	b=jrSFeY6mHU8r30/IBqCNjwtlik6YaNHlAYSvhQ12zX0xgrFRsVgIu48YFUAP8xCRcP1c
	 xQJyftO7diBNtk1+ezY0rio66hQGq3qqra4P5QSXFwbv7eVVF8JCZfD3rQdorXzQZ+6PE
	 xISJYLJwLSBiTAFjKUZcQYO3fG1B7HRT5dnAZSpL4pFoaweaGKF8uQhl3kPzbQNAU3Hpz
	 +JbnPgKcDagNb/Oja0mx1N6x/OHO0CD0Cd1cpCh2Vli3m56B2BEbJOygwsSyAhzRWdiNL
	 7W5Z5iL1RbIAcxGsM87qq7IrPsG9KVEkreZH+RBbsz448AvN+MZZEaRr5le6coR2CZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vUWXUzwG;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0287760A2610
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 03:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0287760A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vUWXUzwG
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38431138772so1982733eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 19:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795232491; x=1795837291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=asqkoYbz82hEaVuDlqAKtg9A95Bx0CAB6i8FMp3RVm4=;
        b=vUWXUzwGC52jJGg50afKqM2zklel6YGjDNeOwdOmqx9TmRTcl3qsu/SHQ8T8At7QPa
         mHVretCZV3hvh/HNzuEcDdqKIRyJXF0ZqxcqxI1X93Cd8t01NSgH2OrOaYFNckKXj9Ov
         ENJ/loseKJherYBIMmSK9mQphCJmU07AcE0VnvLH+VH3TzDPInb+ANCPnMr1bL93gBUn
         vdOL2oVPNyaWt9SAB240t70ooMfHHu8gUX7+HlsaFAUBkB5vmBUUTqpboeZHzXZz/PY5
         WLizE9CLF19BDYYuQvtOJ7lPssboOHGQu/9rWS9qt11UH84DNNKwNAWMRUX2uObft9P3
         XKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795232491; x=1795837291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asqkoYbz82hEaVuDlqAKtg9A95Bx0CAB6i8FMp3RVm4=;
        b=o0CxvvSMugdWdaTYk7DQDO4qpQeu5/kChKFjnrP17nyErUDxy9J/QbDh1vbuIZHK1D
         9OH1U+fgooVtTRsCA54EAGD30AucBF9CAUVqWQwawIsxpCf8l7IPi6RzskxlRfJo7Nwr
         VF79gq9qK0MO7PdZGjhXnn2lqhwm7pfcUO2JygMo7LTxC/zA19emYaTbR2LUAZe9murH
         qvYqf1XncEnDJoT8o8ha+kBtjb8im4xaT2fsH5EnGBjgqfqSWsrE4AusQ1ISdIQHoXMe
         0wJB5pqTY67IRCeMCQaIwCNf9EPyyhdLfWu5SHoPsJuQx2L3rzEXDOn5nIYtvw9m8uhr
         JknA==
X-Forwarded-Encrypted: i=1; AL+hErFX7KjKeQpHTPOx8F4x3y/kxdvHIB2UvXWZLzUVKXEqIy3pf4qrqlT8tVTgdR6qSFzRbz30eNW9rpNq@vger.kernel.org
X-Gm-Message-State: APuU4Z+H+QHc3KmzWiEuM2eTq2xlhfBXE0hRSrhEEe0OGcUQlZphObU3
	HKQc17iqsJ5fOvSB0z8K/JG3F9N2EXvV7cF1SIjEbv65+87XzUTcHAOS
X-Gm-Gg: AZFdTZcFmtRzsbZDjhAwayM5RbbggD31Soio8Osyqi8g6VYOaWkqG8tYqmys3Z+FT9S
	OVOfAU5oYsldyjys/uwhvG1w/ZGGT5tjkdVejCFYlTPTU+4OsueLpq61IKnAiONbXs51hgWDlBZ
	WW2pjTu6PgdDZXCPkhPKWw/d+rbDRrLQ3gIDaJo2r704mBfTn2DwPxwwfCCShpTYkK5EEKzcaf1
	WTFj6IWI93nFEU0jAUkuq3XwLULPP8NFPkWA7mfMfFTCE0xWHwibBLEpMrZXGSme3dSyT5Jzg7L
	gm3kT5wPgDV6SvWkCGesRLwNtedCXVOnxQCIW3uD70ZcM5+fFpaBYrcdOZW7WS/eoFlt7klqyqe
	HZh8j9AmXJn/N8RE4K5T64tBf3vPz4wrjJMCW4ZQUdidHooj1LQ6J9Fic0EhzVUoppkdul50Rh0
	7Rzu0ymHB3uHeFcU38f/MY0edcIMRCQvop7u+9AelHdeIbrdC+q76aAuc4WrBSrfQLdxlwTdWRe
	NSDggGciDM7gCKIYSdkXJlWxVVDrQVqpkvl6BoUt9OKeP1wuGf2d6r04NdHs1pPU+7aBg06fY8t
	Y463KeJeeHJyAZGIB5QnV9zsUem/kkkkirFOGtbVRqITfA==
X-Received: by 2002:a05:7300:ce8f:b0:375:7be3:1bbd with SMTP id 5a478bee46e88-38570b336f4mr4071171eec.23.1795232491106;
        Fri, 20 Nov 2026 19:41:31 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm20891464eec.3.2026.11.20.19.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:41:30 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3 0/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Sat, 21 Nov 2026 09:10:51 +0530
Message-ID: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Hi,

Add an NVMEM binding and read-only access to permitted AST2600 OTP words
for userspace BMC bring-up diagnostics.

AST2600 accesses OTP through shared command and result registers, so reads
must be serialized. Earlier firmware may leave the macro in programming
mode, requiring read-mode initialization. The protected prefix can grow
during operation, requiring live protection checks. A timeout leaves
command completion uncertain, so further commands are blocked because no
safe retry sequence is documented.

Supplementary design notes:
https://github.com/prasanthp20/asrock-b650d4u-bmc-support/blob/main/docs/security/ast2600-otp-nvmem-design.md

Changes since v2:
- Explain hardware constraints; put test results below the commit separator.
- Use generic ASPEED naming and named mode-register addresses.
- Share unlock/relock helpers without mixing scoped locking and goto.
- Return EIO for unlock failure; simplify pair copying and registration.
- Drop redundant MAINTAINERS matching, zero assignments and probe readback.

Changes since v1 (introduced in v2):
- Add the separate SBC/NVMEM binding patch; rename the source and module.
- Replace double polling with one bounded poll after an initial 1-us delay.
- Initialize read mode and read CONF0 once at probe; use a fixed keepout.
- Check the live SEC54 range on each hardware read in confirmed 128-byte units.
- Simplify word copying with unaligned-safe LE stores; accept empty reads.
- Adopt scoped mutex locking and managed initialization; simplify Kconfig.

Tested on B650D4U (AST2600 A3) with upstream-based Linux 7.4-rc1:
repeated reads, cross-pair/final-pair comparisons, 40 concurrent reads and
a 12-byte ASPEED-derived reference comparison passed. The RAM boot used
the working OpenBMC DTB and initramfs. The ARM kernel build used W=1.

The selected dt_binding_check target passed using dtschema 2026.4 with a
local diagnostic-crash fix; no checks were disabled. Two unrelated TI
type diagnostics remain, with no SBC errors. Host-model range, copying
and timeout checks also passed.

AI assistance was used for driver revisions, validation tooling and patch
text, based on the downstream driver, review comments and Neal's guidance.
Hardware tests were run by the submitter.

Previous revision (v2 cover letter):
https://lore.kernel.org/all/20261120174440.123487-1-prasanth.padarthi10@gmail.com/

Patch and review history:
v1 1/1 - original OTP driver and review:
https://patchwork.ozlabs.org/project/linux-aspeed/patch/20261113034213.158390-2-prasanth.padarthi10@gmail.com/
v2 1/2 - SBC/NVMEM binding:
https://patchwork.ozlabs.org/project/linux-aspeed/patch/20261120174440.123487-2-prasanth.padarthi10@gmail.com/
v2 2/2 - revised OTP driver and review:
https://patchwork.ozlabs.org/project/linux-aspeed/patch/20261120174440.123487-3-prasanth.padarthi10@gmail.com/

ASPEED hardware clarification - Neal Liu:
https://lore.kernel.org/linux-aspeed/KL1PR0601MB3986A356BD06F98D0FF9AD5E80792@KL1PR0601MB3986.apcprd06.prod.outlook.com/

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
  nvmem: aspeed: Add read-only AST2600 OTP support

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
