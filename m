Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184126;
	b=Mbu1xKbIGAHaySQdZw8KMvkrT8gcVYNs3M4b6rFQ4BuG5lAfU8zfRFqnFAsX6eoDbwxG
	 tPW0CmppLZT6TzIyZdxQ2KAZJtbxAmF5el5wjdP4EzzfVQrJZhkA8rmGvOnscaMoyxZEe
	 t3nnkyac9knjoKWIyO/2HdSGybsT1qqflZtZnksRbelsETx3e8MqufV4nYVPI/rDxvbLY
	 HnpSqvKUyn235DSeQ+01FMLsotBJ+2t4PpAGnLRLG1WeVrB1+tHGjcVI79zhx1CW6KRQM
	 0kBNYamhsnC0vG34ggpkJ85dRPrw0aMgWZJXPK1i+J70HmtApoeMrKQ0KDf6qyrSowQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QW2ef/pirA2PTk8MffTe4SexcZzxaH9iewQRAz0ZFis=;
	b=vXCJDMS6Fv2drBMw24WwfCWVB31jgVI0CTrfEYFFqmtGHD5RfnDVGG+tpIZkqsKcpNPK
	 0/8RJvNKguvZaHLK/bMzq89WNuBrGd9uxxzSLxpYxaeTzJVmkeCjn5D/TIzbWFCY7/fyg
	 j51RLMzh0/x1KoXK0k2gmrKfpmHPzbK+3nC4xq0tm2zzz+HHhIMYTU2vhJhZw8oPFv3q3
	 TbAKpEZrVHQPHnECiaV4FOwHovWuMJoTSzBi9zQvCIsQzbn8KCX15w15FcW9UYL13kHaC
	 iwIYma1vflEBjphb4bNG27SwbqZd+gB5uedOfNcU35LfJHSQWgPGHbGUvZYFfuDkamQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hl9YKQ3L;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F85D606A333
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F85D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hl9YKQ3L
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49318428d98so145281f8f.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184124; x=1794788924; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QW2ef/pirA2PTk8MffTe4SexcZzxaH9iewQRAz0ZFis=;
        b=Hl9YKQ3LPiAC1ak3hn+x4wYzGK7CwQBDypqxM0waL3/tJ/CPZdBZMZ/dNnSpy4WV8O
         HwxFkxDdSfjNtTEn94py7bp0bjENVagTy/CNktLzJUV3VO4/OPdT9IVuX7cxL2ZkiT0r
         xZE+FUalw7uaXwXwQSPXf5MdzMB8wU8lSEa7hP5SCUF/B7+mZ/DE1XXs4eSXQG+wbXaM
         p8Oxx3gp3UCpY9o5A1muMPhR08MBwbPnAc2XsmjrrafUr8GtYNvWz0uAecM41tBVlYDb
         EY5m6RWqkH1NarycP0gRkVZ+z0cSbYw2XWg+H5oIiJH4q3JOnmM7aa5sHDikgms+Arm7
         OJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184124; x=1794788924;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QW2ef/pirA2PTk8MffTe4SexcZzxaH9iewQRAz0ZFis=;
        b=IUy5NZ9FfWZ9lJLKr/jD2nws80gdMiV7WBojH6Oqe8pwhkjsLVNmxqd7uKOz7G00JQ
         nQoGaW5jV4MKqGatOevVRU0MGHuYfp0viW5hfqPHR0cj5jOLY41AZ3NBxcPNZu0i+RRt
         Pf4Imm+Vcs3Vhpt3nTQpQMwSZPeRIDvXWWwc3ioWqqx8GKissRY46afCmltGoHhpG/ud
         j+2H2eycMexSR9cbusl5vRmLD775T/rO9vbYG1cIaiK3NnXtT2A7lBAazQyJfuhfzcWU
         KKnR/xNeLkwN3a4gNXnQLjIZnSKPAA2m+O+5fqyFjnTdxU1OPM8LXx4aG4Afj1c6hcEQ
         YoQQ==
X-Forwarded-Encrypted: i=1; AL+hErFwoR4T06iAuDEwJMu8Gd6tLxUky18UGrpHn4+p+D2h9x9LGduVQ6Kr742ThPO4IzZIvE+kA+p7qDrN@vger.kernel.org
X-Gm-Message-State: APuU4Z8P2RbbbsNcVziERk+PVP5cfVfDypf0u3xtVjhLI3gbp+MsMurp
	hgVID/gQ8sniQlzPxQh9o+9OTyP9jUVnkLyXTbHV9VHLPRh83fq09WQG
X-Gm-Gg: AYBFou1K+u+QV6uv1BH3FSAVtW1hJdHlHs43HLscCSf/43sacJk5JfLkJLvB55acWyY
	Ck+6cPg+UMkKfQNvs1b2E1N0LGck04ElksmmqNVBvhsV7Z22dq2t98J49pZaEyrdem3zBEstmaA
	Dj7A+L7OCvaQvrDc6cfL08xZjDNbOm57xzuYQXjz8/dJ6t9Jx/MYSRYg/hRan5kTK+jYcywAb19
	LZqeco6Rbgr8+cszi97WoQ+3uhfncUvlZ3Pr6XY4R6j50Jrf8q3DuxVKbOJ8L4Iys/7TfmodeWO
	ZwV7m2gyc2eeGRf2SnWRw4yi0vxUIMn9EzODoGHdeRuFTGftIJT4GAfGmEZ/dhYYuMilEtSiHzK
	CAEnVg/Hi2dh9OHwtgctAeLMc9PdXpTpL6ZJw7ISHPl0ILIe+QXDleDqg54NmCr5vfvkE8Q+QOI
	pPpujX16HVcCvbeTSIfYAz8d1G6XfwTNn7ekx3B2ZWl78/X+amBPxAZmjI4J4BA01nQW8JzSYp0
	gTl6v4kkxqkoluo+EXp5XSfkcQmlkkmazrvOVlH18FVZzDuQPbh1Jdj6t343+X6MA8nxKE5fJVu
	qdT/PFRtAc2vJMurSSyfssp7tBBzjAShVU/lJDeW81G++0tI4xlIlHmuYLodEQ==
X-Received: by 2002:a5d:5f51:0:b0:48f:bcdf:6f68 with SMTP id ffacd0b85a97d-49589867ad3mr4694876f8f.37.1794184124022;
        Sun, 08 Nov 2026 16:28:44 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49673b94dc1sm2688388f8f.16.2026.11.08.16.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:28:42 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Mon, 09 Nov 2026 00:28:36 +0000
Message-Id: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALQT8WoC/yXMyw5AMBCF4VeRWWvS1jVeRSyKwUhd0pYQ8e6K5
 ZeT819g0RBaKIILDO5kaZk9RBhAM6i5R0atN0guUyF4zgalNbXqZE5PE+tkwqMs9gty8J/VYEf
 H1yur33arR2zcG4H7fgCD5MbGcQAAAA==
X-Change-ID: 20261108-halliday-tlmm-f250374110e0
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184120; l=1085;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Sh78VNHMNROB3r4emRNABR7lWHBZToMwYlli1bwKY4I=;
 b=/DV44UnGt8sgl2eNOLqbZMptCZUi5sxdpNvdt6ndlPLFxWToXTFFFhDVgnkngnv9IdEOvTtlV
 ERnbOCYssFTBDf/BTxvGxy9MTa5fGhdJG9Uq3vUsddO1tW0ylQq+5WU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

This series adds the devicetree bindings and pinctrl/GPIO driver for the
Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
Snapdragon XR2+ Gen 2) SoC.

This is part of the initial bring-up effort for Qualcomm Halliday
and Samsung Galaxy XR.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      pinctrl: qcom: Add Halliday pinctrl driver

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  146 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 1825 ++++++++++++++++++++
 4 files changed, 1982 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-tlmm-f250374110e0

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

