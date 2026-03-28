Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5303115B5
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774687399; cv=none; b=ezsHv+8dfuURfroIiAQy51cpM0OqJoLsX9inamH/NOm1EzVbBviXjUdpBfcgs1nj4Aks78k5UKPpdT8KW3MRMOY9MaZdS3hI85rq+semFP+lLg4gr4kl4oDP/PYkUdM3Mh1gk4sme+UKOln+/e95A6MMBHSqYfL4RDceOdNToGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774687399; c=relaxed/simple;
	bh=w3AmyIUYIWubreSGC4d76/RS+21mmbid9WFgbPya1QY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qHA+Rfg5CoCKVWHnuXO20SXfGGpqhJrq73OhNBzQt5h3yBa1sGvMDQ0Kh+p1MQYN95auXcfkF2NmhQ9XPOxSrysQVtvvgNhvz4u0PvecW35tppb8aCZLcXsNyeJf25JqEqIsOoBt7iHX2OIf3lvLx+WE/trZV6Fbds0xTlGNSts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQpgEKBr; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQpgEKBr"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c7412b07f22so1668318a12.0
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774687397; x=1775292197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc2pVrsVxaLi+fKCDtrvRJf02hSQTkGZjWDQWqQxax0=;
        b=HQpgEKBrQyd/okfaqzKh3+giShN0FpOtgmV68Z3JdNjQ/n+srGizRkdPwbrprQHizZ
         CZlPAsTCn2O4HMpQ4HlDYmoRR0tOaSFhrjaK9zC25QX+gIc+xvfKrE76k/otW9WR1sU1
         IafjB25yN9U+BnGl1TlAHyMCOJQCEb+BgvgHBU+YxZRKEZqfH5hf8y+I+Uze31ZnjYyv
         k0ClBWBIPoczvai8LEBLGlPOTfZbq5jNOICUXOWCw1A2T72+Cnc5qbNGlxySS8xha6dl
         7lGc/83lrKPlhcAtuoc1ETE5Mc1g4sgTiEXyiuu0urlMOYUDNB7nd1Ta8C0+gDAuRF6L
         tsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774687397; x=1775292197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zc2pVrsVxaLi+fKCDtrvRJf02hSQTkGZjWDQWqQxax0=;
        b=TAd36Q0pDYfZnYA2gmUgpx7zW5unk+bZW2Y/dUCyzaaqHsmgUb1IDIZmp3OCt7ckLm
         lx45o3m/q0vgk6TfWowiIDfz9JMmsDCWYcdm8L4xupFps1wgA5xBNf+aZGBgKsU3NB0K
         OlAeLZt8gMsDtKdeKNU627KJva8FWjW/UNVpRMlCxBv3oGIwDL775WcGsRvy7QwyQTwa
         I+EqOpWJ7igIq5E01yJS1VXzM+aFTB1AdNWQa4mgtmdLn2ZoG2OAXqh9YhpT2CcfFhkJ
         oLh//qt1ktoMDAD7K/Sj/fqaUJey1G4Nb131Q/KxKClZ5Cte+/+Fw+8hFHW8LUVr2gDU
         kLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnPbZbM0WYaXFpOFfGLbG06fdt624VJafI8E4rEz/QKtMwIVhtCCV2/6iYr8q8jrI6CZ44uUZgAhC2@vger.kernel.org
X-Gm-Message-State: AOJu0YxlmTtsl9/B3Yn1B0ihHOPDoCPX646UDT10KDeqUaoECX3cvpMF
	MretKFmx1EsMHlv2i9KR0jC4WQMgW+1MzsYtmcj77GZ2PmV3AYORXz7G
X-Gm-Gg: ATEYQzw1XaLwMHewLpMhLaY0wJOSI1pi7FaPtbrcnqk0Qpc2amNNEJEjSFbhl2kjJ5s
	xgAXeQkfrEONMdR78rC3++iH29flef7MSmnKGBa8JEmok4GJROHo8f0ZjhOzV9RxeBRRPkjNKF4
	wB1SuCy2zkyH617WIoVv3IM8mXofs5IohQlxWYzKWoSiA031TI8KEP7ANf70/1gMyMjsyswvJbP
	aSthOekweiZ1nmSvJWnTXYl5LIgI7TysTLyNkgmgBQjngKczSBcTIs8xIr4ZRurOFAWclNk5EwI
	zSLEJdFzsQ6z6N7vNWmOgqlV1mL548A9xC1WLcYR5u9VX52TKhbDdqvV1L8yEVuch6Rnv4IyiHN
	uffPd+D6zPzpZ1P+pagXHS4DsLDhi+21fQJAlr5IqfPISHphJFk+frxSYoJhTihb29cEM7LYktl
	G0w+G9G6BjmPNw7KFu55skKlFtD2nZID/iv1gctOwL01lHHKkOMRf1/W1Tf5v0qlxOhoXcB3cez
	7UQw5c+1zqYMUdD
X-Received: by 2002:a05:6a20:72a4:b0:398:7667:b2fb with SMTP id adf61e73a8af0-39c8a9ed52dmr5379451637.19.1774687396754;
        Sat, 28 Mar 2026 01:43:16 -0700 (PDT)
Received: from pranav.. ([2401:4900:c0bc:73e0:ffb5:d097:4f0:3e88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843b20csm1795725b3a.8.2026.03.28.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 01:43:16 -0700 (PDT)
From: Pranav Kharche <pranavkharche7@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pranav Kharche <pranavkharche7@gmail.com>
Subject: [PATCH 0/1] dt-bindings: media: convert hix5hd2-ir to DT schema
Date: Sat, 28 Mar 2026 14:12:37 +0530
Message-Id: <20260328084238.201452-1-pranavkharche7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch converts the HiSilicon hix5hd2 IR remote controller binding from
legacy plaintext format to JSON Schema (DT schema) YAML format. This is part
of the GSoC 2026 Device Tree Bindings conversion project.

The conversion includes:
- Standardized property definitions with proper types and constraints
- Reference to rc.yaml for common IR remote controller properties
- Proper example device tree node with GIC interrupt specifiers
- Support for schema-based validation of device tree sources

Validation Results:
1. Binding schema check passed:
   $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/hix5hd2-ir.yaml
   ✓ PASSED

2. DTB validation with actual IR node passed:
   $ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CHECK_DTBS=y DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/hix5hd2-ir.yaml hisilicon/hi3798cv200-poplar.dtb
   ✓ PASSED

The binding correctly validates the IR controller found in hix5hd2 and
hi3796cv300 HiSilicon SoCs.

---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

Pranav Kharche (1):
  dt-bindings: media: convert hix5hd2-ir to DT schema

 .../devicetree/bindings/media/hix5hd2-ir.txt  | 26 ---------
 .../devicetree/bindings/media/hix5hd2-ir.yaml | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.txt
 create mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.yaml

-- 
2.34.1
