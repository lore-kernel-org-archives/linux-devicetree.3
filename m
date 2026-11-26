Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654540;
	b=3q4R1wgxuqO2qPssZ1aoogMIvRHQbAwSVgVlcVSUyEQzCtRwWjtgvbMXkdZExcBsmpxX
	 1wHS7/rzYdgj8I8xC02l14n3dIIzNFFchck+RIeQ6/nMC5Qs/Wf8Fc/xe/X/zocDxec4A
	 ET7eEidiSvsyiAmtrHq/U5XE6a4Th3CIzqVQHki3bkn8hOnm8wHG6/bgJdXElrXfFXRr+
	 BN84L4iw11M0sTGAjBy/dEN1EILOHhua8QJhxtAHNJOYZvvoX7orN8gwIgnwcyCdbwDIk
	 kThR0zJewFTyeMlH3k0PKLXgP7kBIGIOjrznfmsj9pbYUZwgFPqhBkg/J/XlqHn7iDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KZdqz/5aN0a+Mnl2BFDx98pc2JPnx0esugp5NJKn2WQ=;
	b=LhxJ1R3mug2wB5ygoFsJe6BAfqqnU9yyzGQtDekMt+uA01m0daGDRpcqgeY9nKhwNH2l
	 QGHRe+qc0aNhG+7IUto+rfxUXkICfK1GmYxOnHqGoMUvb2Nm0YeCtrAN5pn328FeZe9Va
	 jt1BPTIzWIlDMiqlPtnn6Rlse6l5DBD7MMUYC1HJV6MRdBHjYd+j2cXAbF1JYAYNVOpm+
	 vb/guSihbdMRjEAnQ+E0itMvKDuvBlZuMd43RP14r49vq38c7PhYpu5bTadBmd9c1Ys7G
	 VX1M6nNfDK/GM3qAf1aDyIC7Ul3Gyi/FGYPGxIdj3+J1pgEXhXjA/o8tLZb5ws4iZGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiSEPO56;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C71C606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C71C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiSEPO56
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so3415309b3a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 16:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795654540; x=1796259340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZdqz/5aN0a+Mnl2BFDx98pc2JPnx0esugp5NJKn2WQ=;
        b=DiSEPO56EYuafe0mJhdwC8cA0rzeVwaayI7NlmGRQ22CUF9yk/aWsrwHlM6mnNAEX2
         KpWJa1Ko9XupkNaKOHqPPkpZdjTOyzhLi4audBkISqnA61rfuj8Mn05L3IvQkAU7MIRo
         mCh6Jw3hCGFTfyoG+2OeNDow7LlgD5EWA8ZqY3yUAdlFIYLBmwuNmy0W8spzp/yR3hyj
         wtrUc+dffyqxapQ7bKGBWEv/BVPVetc8KuQ3Mzb0JBzAK9X38oMiBtxRtWAMlLm1Dasr
         YZ9oLXptcGhaPhOyhPUYJnNSwRtnj3xPxCMyliBNCviJ0p56eh60Lag3USrbweKjlasd
         dHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654540; x=1796259340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZdqz/5aN0a+Mnl2BFDx98pc2JPnx0esugp5NJKn2WQ=;
        b=ZlzKT/tdw7FVjGr2RQxzWNZdIMtOndiA9XGes+jVwnRQX41bRA2WcVW/PqnzzS9qPY
         +o9Wk+9/q96QqlgpJm0ZuPx/y+v55pg1se/vcfvk3j/OgNDF0JFGGf6rmkMxoSYgfS8R
         1wXtHGvhHSUef0xFPQO5mVffwadsJrlfWhQB+TKlHjPjtzUHOu1VrIZ945shtt+GezWI
         50ccB7t/EFHtKo67OZflWi/U1cEuY/U+PBnFmu0ehXfBkY/2iTrEWZ9b9tShqcffz9fb
         jNSMrfpIZI2Ljnc6pwMXi8+5ji2OcQe77dWsGWmZY7KEAj5QxYmTURndZN5WQs19g0uC
         31cA==
X-Forwarded-Encrypted: i=1; AL+hErGEJiy3QUY0evQHltIC+iYBZr0cfQEURjzI0j0LfBSpC6YMEUnwm+7VOsov2vUIhIVukXAgq5baeRMT@vger.kernel.org
X-Gm-Message-State: APuU4Z8OHqCWzpdOCItHg8ukUzBNAz0QreuGYZK82bVpn+LL8Scnl6Pd
	8lbFJmYFlVNLt6yVStosWK6IwV4ysFtc/Hoeyfbc0xmHEBS2fVasCJmG
X-Gm-Gg: AZFdTZfLenjyoP5bzZJj6iJpb8u1XcMAWfBHk61xQZE3u5V4GjiTqBCdQgQB7yp6AWY
	QN1x2ZkrnzK7T18DfFFXR6iqtIwRDru2fR7OumuRidZFciAYR30Mih4W8nmIwKvems7dCKBPcpO
	DBNnYKpiLGQ84cLC4u2kqa9uAyYjBhpQe7PhkfUgVv4A7ZkQ2GdoMqrxhxkHT5i5lOef6owpDgS
	MXP2ARDBZQFiOSWmbHcnFIxKu1rAn1QIDexMRoqR/A5xXzjn4tZ5iFYsZfhShKXiMZnGRBCZRlY
	ez4SMmn43Y1zAm4+KdIwirgYliHw1AR00BC4iVIXEFjg8MF9Sl8qCYdQZyU4MC4g5Bmf8zFLkBc
	okqBuEaTVTpa5ycb4cRHojV8sl9PG1CU/UXgeQ5nnNP8P4y4GHGDT+xLjmNixuLYPtRhTi+Tj8u
	jtbmBoQBYUofX5wcfpvEMN2EXzN2meOWe5xdyvroqKStIBONZINBpSDY/wpnRhqBkd8xkjgFnZE
	J5gPa3BlX82DRAPMEqW6UZK2Iwv07GvT4IAGWmCjvkj/K/XoahgNJO74gJm/Baon5LbkYnzrBp8
	7Qzj7PQj/1Cws/3eYPYO/kGrdnID4mYQGHzNz0bVvPy3PsDbeRIHTySO
X-Received: by 2002:a05:6372:a705:b0:3e2:7c10:d465 with SMTP id adf61e73a8af0-4014e358b53mr14368648637.83.1795654539819;
        Wed, 25 Nov 2026 16:55:39 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm9472217a12.12.2026.11.25.16.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:55:39 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v4 0/5] net: hix5hd2_gmac: Support fixed-link
Date: Thu, 26 Nov 2026 08:55:12 +0800
Message-ID: <20261126005524.4156940-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Support MAC-to-MAC link on hix5hd2_gmac. Also add and support mdio child
node to suppress warnings when fixed linked, as in macb.

v4:
 - reword in dt bindings
 - register MDIO bus manually
 - skip disabled mdio child
v3: https://lore.kernel.org/r/20261124002442.19414-1-mmyangfl@gmail.com
 - use devm_*
 - split mdio child node and fixed-link
v2: https://lore.kernel.org/r/20261122230134.3366017-1-mmyangfl@gmail.com
 - add mdio bus child node
v1: https://lore.kernel.org/r/20261120031026.1371052-1-mmyangfl@gmail.com

David Yang (5):
  net: hix5hd2_gmac: Use devm_ managed netdev and MDIO bus
  dt-bindings: net: hisilicon,hisi-gmac-v1: Add mdio bus child node
  net: hix5hd2_gmac: Use mdio child node for MDIO bus if it exists
  dt-bindings: net: hisilicon,hisi-gmac-v1: Allow fixed-link
  net: hix5hd2_gmac: Support fixed-link

 .../bindings/net/hisilicon,hisi-gmac-v1.yaml  | 25 +++++-
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 87 +++++++++++--------
 2 files changed, 77 insertions(+), 35 deletions(-)

-- 
2.53.0

