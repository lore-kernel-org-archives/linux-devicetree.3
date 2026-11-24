Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479911;
	b=AeOunWR4Gv3FoPqKvWuwmGHnEgjwaMOnrWN0PuVf7RI7JDiupOKHMzOC8hbjr6oPOW4Q
	 bAgpAfAA1q7mnm3HNa9NSIg0keAhCYpLQ3/u4RGtDUN6ZskEU0/HudZWZxo30RYXEBXz/
	 2z4bY0AYsWh7kiabGF1czERZi+pT25DMS5YuzquSj39Y2PU09Js+qIHyPtbLJrokssBYr
	 xZ1P1wbqYpvQ9HcRXW7kjI2tobVb1Kwyl3fvKbRX+PUGTvbX/IeftuSR7ppOUqKzIvvGL
	 xzWuolmyKNNRKh8PvS0/8g/xEvjQ1z3SN76YyW7oS90D81CnNUbXwHlcSqyX9pCEW/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sYVtY/mNfrBHVTrZb6p0/dzINpFnfub9SfAPa9n7RIk=;
	b=G8OXoE/t2bDnssUfNrKK+s6n2kKUe/eULqiJgatigXrg2CJNdVCwnirBNmrIr16PZPqI
	 LLHrWjps26TELKykOXXZ2yNKM9HQLS9PR6bJxbokpj8f13tvCeJNPqvp1cMIv8j7PV8A9
	 +2x0Ur9DQ4n2699B8O5r9ghQskBc2JAgjdTH53EqM71iS/qStK0ui8NMWqU+ZZ+lcfvqL
	 GvhbC9TPGbxflnOuqLQtIgaAkJj41/lECm6GyvkZzvIndT6/dgnEf2FYgc0ToHd6t9VpA
	 ln1eA5upipqKPVD7BQQvAd4gHnL1neq/icT7Ubuvo5ChmFwqgAqGK5OerE9Rsc96UXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LxhE1PHD;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA80606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA80606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LxhE1PHD
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so2082502a91.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479910; x=1796084710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYVtY/mNfrBHVTrZb6p0/dzINpFnfub9SfAPa9n7RIk=;
        b=LxhE1PHDFlPoJZhxx6mwPz0TasRmOeFKh1w1j05Qp6u+iF9ZNey8Lyg6PmFG0RQq2a
         SxgznmYMgm1r18vmCLJRFRs7VpZUi1Nr+QePv0wdV+y0pSx1SDxBnyC/X44NoKHl6qEO
         miI0ZRnGnf0aw6OajznSaEdb83Llg3WbRFjUTRHD5fZsc/TCPM83lxyVGagRAc+kffrq
         ydXgTBqVyvmz9cZwo1wxYOAIvNsCi7mX8XYqi93+snhYitRhVqZl+Xly1PoX5nmntxZ6
         b9W8YVjhL34Il0nItfMi5CXM+vGFoMytNUoaZWyvr7nxpQn6+5I1BfeLBD577IBmD9UE
         OCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479910; x=1796084710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYVtY/mNfrBHVTrZb6p0/dzINpFnfub9SfAPa9n7RIk=;
        b=mPJzVfzeTtxEM124z+Qdvkz/++O/LgR17cNzgjsdSJTp4kXE8eitdwtdMm9d9H+FBF
         KPyQRojoGbLlEkzYNXky1iVUBb/hwlgATMZzTHlZhek3W66oMiLA+qC2eZlbUm0/rxpm
         MOAYwVnkedRYalPR1MGrQ9g4jJlLRxuUTy6bmRXu5jttaDMwINTe911XyXNoPXcT9wUK
         WuOaEa3m4//Vfqst7UnbTHtW7ZtB89BkCzlQtyeGowNWLpCQs2E+D6KXCoPRpe+JowD3
         5ZfzVb9xlNcNGxgkHcMMnn5LJtGT3Y+XnK2KaiYEKooFH1Gh7PkfENqrRvvaHmQyj1+t
         Jycg==
X-Forwarded-Encrypted: i=1; AL+hErGxXnorX7tlJTkvLxVcxHREpcNxt+icpCHSKkh7FBXzfQOynkX+i1kkzu/LWwNdBEq23ORJzj/Sdx/+@vger.kernel.org
X-Gm-Message-State: APuU4Z+jTfcSpfTKYO9bGh0NmbXQByckXr7MTo+9tTdTWTHIwfgJGiTp
	jj3b6LKGZ1bBDtAKAKxdIRb67G4eodjxmc825mkSp0hVbZoUcmP/r5uY
X-Gm-Gg: AZFdTZfOUHgbAoPYTdcv0mRosPQUxigiN3IHB/u7KE80fsa+30uBGfUfGWEkYd1SQ+m
	ZzG2MD4acpxBNFExB7crU+jnUVsPG2IeT4qry3HbrWwkEhkuEMMjmQNKif5uQ8iEzRSNs4KHb2n
	2BKYIwr9kYmGftCutDQVRMwHWPq1BB5Ld25GzCGBuNS3z9ymjkQPrplM8q8lPzhabf1lAWfd9p0
	bhXBHCjLHzyDFYxrm5XYbTwZgYl3XwDw/n6x3l1gsDa1SjGRD8wU7vRBfBiK9+pNFjFqbVG8cxI
	/5SRyCPRw7pLXEhFgzAz54qhB7Hx5o6ePeA0V91CHgRQrQ4mPcJq+dSsFC3I07gVZZ9WDoT/pjT
	zaFQKck0egExR7WartxUG9reooMTWhko815FFlfxDmt7CEQyLDy6hCNS1RUqX9rNcGqn7bquDDS
	W+fnQcZNjjaEZ64rlzY2dMlUrUxcOhR0ttPfUuTGDmR4C6+Hx+lOCsy9HgcFALkARSzL4S4Qlo4
	1tCP0v1E9A4NeUhoTrsLpkmPVZkdpispDhLv3TpXkJjkvi/w6Fje1L1ArkOTbYXRGZ0z31kX/an
	moOItFVE2hcTxmWEWo8uleAe6jRXQMFosr9kn7jwRaIpRMAzt9SRkOgEwotNC9ZvW2E=
X-Received: by 2002:a17:90b:4ec4:b0:3b1:7329:a127 with SMTP id 98e67ed59e1d1-3b41c8fe148mr10203122a91.20.1795479909995;
        Mon, 23 Nov 2026 16:25:09 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm7302480a91.0.2026.11.23.16.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:25:09 -0800 (PST)
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
Subject: [PATCH net-next v3 0/5] net: hix5hd2_gmac: Support fixed-link
Date: Tue, 24 Nov 2026 08:24:34 +0800
Message-ID: <20261124002442.19414-1-mmyangfl@gmail.com>
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

v3:
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

 .../bindings/net/hisilicon,hisi-gmac-v1.yaml  | 16 +++-
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 83 +++++++++++--------
 2 files changed, 63 insertions(+), 36 deletions(-)

-- 
2.53.0

