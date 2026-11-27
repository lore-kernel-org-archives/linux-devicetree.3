Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784875;
	b=SV0sK3Y1IVdECuIX0OfUf7uPzG8SBl3Z3N/woQfyA/gg/68hDsPuPxYoP5gS1qnkzn5r
	 pMhiLcstI50l/NyokZZYrDhL1TgVntW6pNB5xKQqA0Ug2sk5eWc+XP2NN/zsWczISlcBD
	 CuKrRpnN5crP2doNLR6U7sh8tkrY7gHYoew/TsqGeiZmr+2FCnv01S+c/FfhPLMhk/DBb
	 zJvvqIe+hwcQDOdC46lU/1OvUY/25Yj8QuNsCWTxkcV9rUUz8IZmvilQW6Wnzhl0b+e+i
	 +C0MtqD6So5K19EaKhKEhdhDFDkfuEgydTJRGbEjyD660fxG7P1CVbLkImCNd6vV2Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ijCcEu/XLQwc3B0jG3H2IvbuucYEaV6jcq96t9cxNCA=;
	b=pQ8qanMGOcX67iuaPCRO8uYNYXvrhknsYZx5WXaNZe06Diso2sN5V+Jw5/0Z/qNyktEt
	 hz0mM/W2gs41/dvtQzEf54a59f9Uj1sr1WeHJrGF9khh5u17psI2QosAcq5b6Lc9CFdbu
	 +tnazYInkpWgmccpc95psyQjTBuXYrw+QlXNZszJOYYqsv8HOvVAi/idVi4txEmkGAeW1
	 2lC0ei+LTjmtgOJuTwfLgMFomaLpII6SrkZSM4/n/ztt4GGyMUQ3BXtyBmrP3w5Mz98PR
	 EHd0keqgB46zwpoI+EYtn666Ic/a5UUDcSc9yqDC458RBPaSzVl5b5QBpBSJ+Mel49g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u6LMD18h;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBFA606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCBFA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u6LMD18h
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so3913031b3a.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784874; x=1796389674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ijCcEu/XLQwc3B0jG3H2IvbuucYEaV6jcq96t9cxNCA=;
        b=u6LMD18hkaK2iyL2rTA6qLbRHePQJddzH/CZyyL1iav+dwgXyYHl5Q40TP8PGJrDY2
         rc+iG3rrb7xTF00GIJiXl+yziXMUQBcg0FEvEU65xl/3rlLYXX+vx5k1Q81N7JMzlAZA
         lgjEJ4XeZMwHc88684p6VXhh0IRQIu2IC5i7WraahyJNdRKZztAD6AfDUzrJrHz2mtpW
         e2bZYX2FAtuZ86NOUUWX24sl1hfiQTqYJ9TPpyv4Ro8Nh+kUzRuQAWIvSYbqcdM7eYVM
         bLPfxiJ5I3VCnZp+ztPaF27OXIGD4bT+wOmIDqV0YfWU+EKcmrU81ysQqg/NALoJeA45
         B+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784874; x=1796389674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijCcEu/XLQwc3B0jG3H2IvbuucYEaV6jcq96t9cxNCA=;
        b=XZPkP16ENBsfhUu7lc/KJWJF2PtCuEoOAqFaxpS9cxd7uWDo4L+CbfMzIHp0NS2b0Y
         /xjalySUyMptBInpPBFxm5HFGe4hmo8xyTq3YGQxB+gndB4LpLcGxuNE+/5vhbxJjD9B
         MwNbCrIOl4jROitfmCu026+QxaUTbN1Kewg8tySTzGE0UMHz5gJwz4Ml7Vk4yyb95bQs
         dWQZGQT2NfFbRROCjPI3k64DMsQ1vjc22RjnRrjIDTDomuyVzGrBKH2ocuQWY/1kXsPn
         oPIO9mgFJTbiDJlb3QGJYSDLyOqJb2H7yM8P7GloxZ6yP4wc7dcG4L1Z9j/dteRfEFNi
         Qk5Q==
X-Forwarded-Encrypted: i=1; AL+hErEbQAStfnYS27v6+pf5KfciQQOQM0lieksc2zNds6BOdlEEHmxhdAO70cnEFkFwQURB8WTwoJEmS8oR@vger.kernel.org
X-Gm-Message-State: APuU4Z+1hE6joF2NDgsCOaevHwyroOSeVs4oXM6O3z8vRMiCN28A58Cy
	gJsvfHJWfW8aF7x65ARevqNYQaj0xzvJtT4T4YJQmt/p6kKkWqvi6+Ar
X-Gm-Gg: AZFdTZcwy27Gp01O8VkS4Fh4jLa8ym7ndZbztR+f9JDjwR1Ist6qV+eA+X0ccCDXnpr
	cKR9Wwb1DH32jvVUejumZw07Nix6dtnrNepICjMTDBS7OKo+HDH/0QXWRfQIEXH+uf9Qyo+B4ni
	Q9axVFAckqhW93Jf0ElEKaVzrOZHJ5miBIPfxgO3sGcUvYVYDWGNENk58yL/VsExF94WbtA4FZg
	PBhI5wz5g5QdhP9JBRwS1rCfSqVNThw/XhQxQ0DATUlQHqpnuagrH5aaf99IO1/m/RP1AoFCxzm
	2dR1QHebv8WW+k2UJ11LyMuHJDEdk5cRc05qwNqoVI3fH5jzwTYmiOUmSjqN/+YNNqoDtV03PBC
	YJZbFkeCUTsz5gwxmBM9IujUZARdo9m1QxLs5ORLDxlS7O9elolT57RiWBFP5AzEreVj24jhnPn
	q7xF1dKVaShY6oq+YJcU7ibnD6b3nlbfaZFjN/jEafHcYAf0ErKshy5JC8hG3kvlTJn5IyW6Y6W
	miVbZeu0xaZiQSy3tZJEvrTKorc8d038yeZzlRU41qw67J0lSEu1as/v5xrjtlqq02GBwc0GC4/
	YSq2U9MADj/PHDO/WDiOwPlTXsetL6XhgTdUZ81urkRjZGvzIAMzD+Q=
X-Received: by 2002:a05:6300:8a0c:b0:40a:4b4e:e078 with SMTP id adf61e73a8af0-40a4b4efb1bmr3555693637.23.1795784873791;
        Fri, 27 Nov 2026 05:07:53 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11860795a12.18.2026.11.27.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:07:53 -0800 (PST)
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
Subject: [PATCH net-next v5 0/5] net: hix5hd2_gmac: Support fixed-link
Date: Fri, 27 Nov 2026 21:07:23 +0800
Message-ID: <20261127130729.1263920-1-mmyangfl@gmail.com>
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

v5:
 - fix bus registration for in-band links
 - check NULL for priv->bus on remove
v4: https://lore.kernel.org/r/20261126005524.4156940-1-mmyangfl@gmail.com
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
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 89 +++++++++++--------
 2 files changed, 78 insertions(+), 36 deletions(-)

-- 
2.53.0

