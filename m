Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8001538F250
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091516; cv=none; b=eJ/4ArUkWBo3a0e5C/SoLk1Ayvr35sJ80bTLkA0PPejL70C2j7hrJyEbQuIkXI1IxO14qXlGKUktNh0/4iJF1TESXSy7CYVv1uoDSdR4RFTs6sp6Yw4EPahst7HHl/qtqqXfCbP0yF17Xi/R325a5BPdgY5uCt73YXZ6haU5F3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091516; c=relaxed/simple;
	bh=emHl6Yo4yDqUFHIen2Wa/TcxuTIvij+dU96PeCDqG9o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uXBWaeKan29PgYjFQdj440UgF49CgSCqGKyIis1m9HZgqH8k77h8QYoFPYzkSMFf7kcllWfUnH00/cDE3bHUhubUdwN500Xn+dEKC9vtO4aGVV/QGzLpFkFLupt0iq7JL7Ml/inBO4drIpigzG8+FCo3TOQZvjwGroPf45iu2Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bb4+G3za; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bb4+G3za"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8485ef63b68so4618828b3a.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091510; x=1786696310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kCBAfJcqbgF3AmCRrsKCNXyT2G3N/ne3bssrcVUdDDM=;
        b=Bb4+G3zaXqyebyURKPpQEdNcSOXxoqyQ6uJdhiff/wkTkven/COmX6XDvnuWXjfEVL
         DREFnbxd4iN8J7ZS4NK88ItGC2caRSroOizfpwe/muocC5+kyYaLVOZltsvPHMsEoC1I
         mDWCVT+MX1+fI45gKTE2bbJWsycvwJhi9mdr4PPM7KCjU3tkUi3MuZF0EjogfGy1YiET
         uua0TIAU8LrgNoD7Eqo/onl/O+ls3h3bWpxoWvJvr8VQB/icO/jMuUwnoHl+/i2jkZib
         oVx90n0a+//Io0j2PkulPxJHVa37Wjk+iJsy7OZAqr0zHDp9vIh5Qfwcdq5w/1Fi5Sp2
         lAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091510; x=1786696310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kCBAfJcqbgF3AmCRrsKCNXyT2G3N/ne3bssrcVUdDDM=;
        b=jHUSNqjamLTnrrZxKMouhmmxu/Bm5rBC6zFKwEdpI9YxhyubT1QxnH5ymCM+W8iUxC
         1etrtSCKRG4QOrqsNQy/U5fhrV+3x66DEi1tg8tzdL8zd9BNsJ8O6dMyin3G13bPny26
         vrFsu420+IXFY91Y/CV2zC+TZz8MzaBMWSMpLRiIwaJXG3Co1STfpG6uO/sCbQuVfhqF
         Y24ygGsuHes4PrL2vTmdRT/OaEKVoesZ4/ho4urXwfRs2+7RB6gw1snAoAaC6OUqeE5v
         OD7UE5Nhs/U4gSXeoaSbSLLtqp7XHMlYSB60AEiRf6n/YTnFe9HfXa2O03+sK7hR6bed
         lSAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMTltOOOA2G3/gkpIxiYGPOMzovHiKJFBORr4F/q13fdiLKpJi9Ll8nbdFxVutA+ZMzYJk8QuyVmZ+@vger.kernel.org
X-Gm-Message-State: AOJu0YwX5NsK8EgXhChvSRgHa0ggRZCu6NV6sIic3RkbZceieDyH4W9S
	AAvcaTWiuyFEIiR1NJ9dzsGeUeztPiMZe5w+lN+r+YT9f6cu2NpikHOh
X-Gm-Gg: AR+sD11Vt8xdKrviDVayzMS2WGv0krBtRFYAcn7dSWnkFtbP4mjk8d4B97L0z3z0jZi
	Tf/94uUxwhfHS7O8Q/Emr+rCfDw7NK4K49pRZdg5HSZt6WNjHL5aPTUOxBiP2hEpx4e7Hkf9oYm
	SarE7nHFBWF4Ug7MorGaRHlHNfOc89R/tjCLUXggpMLGLPv8Pt0LEIfhhdun+cA1KRzZlvwgRHX
	ZwYsWg454NZ+ixBVVGVmDM3S19K0M+UTbEQ7SUQxBo/EXb3l0nXiJ5vvCzeY88RFu5yymj3oGkc
	0/CxoGMk9xUf7+pJDu0PM7MDSwl/yEdcyBCfqeScwyak+aLgbr2keeN1CzKq0ujTmlt7cmlNHYe
	yMWrVhA2UCU3HD5jO0eR6FompWn91MeIgzPATkU1IOAdjNgYzQZyhEVf9iClms3HWxkG8aJQIJW
	yXPvTs0mRF/roCsqPsPZpAUuN58ERkjseLMT2k9kIGT4fx0y7B5OwJUcBIaDgUXpp+PM3Ki1dWU
	iz3wcDnErV9fW2O1of2J3V+5CkFZCQjz+CoRw+Ac45eGsbZcQ==
X-Received: by 2002:a05:6a00:3d4c:b0:848:417a:d1a6 with SMTP id d2e1a72fcca58-84f2dff0031mr23770572b3a.15.1786091510336;
        Fri, 07 Aug 2026 01:31:50 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a553071sm627409b3a.43.2026.08.07.01.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:31:49 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs
Date: Fri,  7 Aug 2026 16:34:03 +0800
Message-ID: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update Santabarbara Device Tree to include several GPIO expanders for
NIC, Switch, and system monitoring.

v2 -> v3:
- Reword the system monitoring GPIOs commit message
- Disable power monitor nodes for ICs that now have multiple vendor sources
- Add GPIO line names for the JTAG CPU debug interface
- Add SGPIO line names for MCIO thermal trip monitoring and UFM read-complete
- Add a leak-cable-presence IO expander on the module boards
- Link to v2: https://lore.kernel.org/all/20260421130344.2751662-1-fredchen.openbmc@gmail.com/


v1 -> v2:
- Add system power fault alert and E1S GPIO expander interrupt
- Add switch board SKU IDs and power good monitoring
- Add NIC1-4 power good monitoring, reset control, and fault detection
- Update the commit message
- Link to v1: https://lore.kernel.org/all/20260129073749.3155383-1-fredchen.openbmc@gmail.com/

Fred Chen (5):
  ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs
  ARM: dts: aspeed: santabarbara: Disable power monitor nodes
  ARM: dts: aspeed: santabarbara: Add JTAG GPIO line names
  ARM: dts: aspeed: santabarbara: Add SGPIO line names
  ARM: dts: aspeed: santabarbara: Add leak cable present IO expander

 .../aspeed-bmc-facebook-santabarbara.dts      | 200 +++++++++++++++++-
 1 file changed, 192 insertions(+), 8 deletions(-)

-- 
2.52.0

