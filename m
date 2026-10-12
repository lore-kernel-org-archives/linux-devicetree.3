Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206E446C83C
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806406; cv=none; b=u+gZ9KN4dJENzu7lS2mwjWIuOez24p5873dUj/uAlCHVCz36CvJDsC0Ks0IhBrOC3p1DOGGJuYELAUZjeamHZBlq++Ub9bsKnl+My8oDMPT2eEHn0s596+PkMq2Hqusrx+ZlV6aSIf7Q744Lr8xpfMdGuTjsc6SqGilxhZpdIJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806406; c=relaxed/simple;
	bh=VEJhzSBCAvjIGbrluYdUMnZeAPSBNrY0yfuKHbyU4m8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2F5TO4iDPUFCT/dwpqO7AnfNHFBTFhLFQP7ZzmWAH9n23qlVz0eX1n5+vt5c8Wo6mWCLTTNznIDcU8gMF/MStpU1FQQhkFxEJGOROWVtejin0u28ycmVl2Rvu8f8baHJzcJUixPYgV9omRue0bMM3SdzTk+k/iLk0lEXnjOzb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbMrh+uB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbMrh+uB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1736570f8f.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806401; x=1792411201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUQ8j7L5J+v1f6vBy5IfPfHKgrGQLUIGvQhzU5qDhl8=;
        b=jbMrh+uBgA+AJOQG7krjucr81r8mlyalzL+mkBBxRkSNF3mhbfGVj6JpZGwmvEPwVc
         MAPwE+idIZbDGj2oyg+Shkl7Y8V4u3A/lPqdFduNaPi3nTpL0lasoyXLcu9Z0HNBYDT0
         nmzNMnSq1zG/shvwpHy/19/3j9/hEX7FybtqU3xftkPFskuDk1ee/dy8CNtENU05UTJS
         LGxWkTh2uzS3sxSfKpVXDDf+3LNlbNhiLImHEOVNAGkjyJJwEdDFH6dXb3zXSeFNw48f
         nMCT4Yyl/xAuczwvgC3ySP/uMqZJPjIh8u3xeHFI3N7ogIG7CZfn+nC4llY5bfP26WoL
         2bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806401; x=1792411201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUQ8j7L5J+v1f6vBy5IfPfHKgrGQLUIGvQhzU5qDhl8=;
        b=bQr40clNorGCtdNIfdNc5twu+AIx7N98ASCInP8C6kEexCQ9w2ULvFG2ZSvdMXAzf2
         M6Q767nvTwHmngi5Z+MdKTppE6GY3j45cqcqwiwmCQHLgfuSJsBmXUby6Jng2Tx3DDr3
         qYJJol9eF+DjnW4ScaF0dNF7B+/spib1nehS9lfI16DX9Ou3+pAPMwdlNZmbcFZ4EcDr
         n88SDXmhY6k0ZOKpEIfiRYOUuiSAFo25JUBLoZZ/Do6Ihg3+9/DZ0ahmGsDc3G+j6Hxm
         RXXzpfO1iYx9dzlFg65h5iql7sFS9AsseDUqSVwT/va7JYRS75a7CyFaUrObMA/T+ocU
         V5fA==
X-Forwarded-Encrypted: i=1; AKwUvByVHMzfZBNr+k+e8pclYPu4qyok4yTL5JZnBQaesj+992RGbON41+pch8RA5O8WifOMFz0c2QfneNr7@vger.kernel.org
X-Gm-Message-State: AFq9FYJh1Me3lfXKf/8HbAx+Rl54m6/p+OJjY4/nBlb7nTkBm33uEPYU
	K9/xMAfDILpF15f4C/8cngt9de5OotQkpZw6u9JA0+k/1FiADhuSHCkb
X-Gm-Gg: AYBFou2IouqwyYglCsrWH69pWv8HrxGjXmvHBCvpKufQ4eWs8W0ePfUHq0utAmbrtOh
	P8nliLxhmf6OKM5BSI5sWNztBEq6TsEyt02lTk4t28xkshIj4eme6xZ17YUlv2cOYvYkohxaKFB
	dCmKTQ+4yhEg2ozoFEdDBvnV9axOxWvqdUwKYt2wOAJnkRBRVa5+VxwKrKz3Wl+6ms1evOLtUK2
	+t4cCT6Ejw8YNcu5ijhabm1brlGRi+TLtHor8/Zu9StI2LUSsSvHHZ0cdyzIpYMbnBoNDw5DSA3
	/qDJo9IG85PYbiWMYkm09y4Lw1uPUWg8Cl2If0DfIoQozS9UUAnfuzkE1oGfZJvCVfCJXBA4Ted
	WYxdqJ7mqrp2NUd/MOhJNMTau1uJKVFIPZciNR85I3CD7X+RwMeXBDN+y90weVksw3QCda58uN+
	qWef6Gsb6kOy3OS1/OlmXclKf+pgVS8P5NX9EqKRLCeEKiHV4qgtWd1LWkMR+LbUEvSo0zvAM8A
	41lHRvvgPdNq2fTpNBKEJiNLCzA1n2D4qJgBZC0qo/vtsDNNPZZDML8OlA6Jj0t1wdWloJdPUPj
	4w9Yur+QACP3xCR+ogpB1gM=
X-Received: by 2002:a05:6000:2907:b0:48d:c18b:d644 with SMTP id ffacd0b85a97d-48dc18bd66dmr13875223f8f.26.1791806400904;
        Mon, 12 Oct 2026 05:00:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20234313f8f.9.2026.10.12.04.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:00:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v9 0/3] clk: add support for Airoha AN7583 clock
Date: Mon, 12 Oct 2026 13:59:50 +0200
Message-ID: <20261012115954.92718-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (3):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  23 ++
 drivers/clk/clk-en7523.c                      | 258 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++++
 4 files changed, 347 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

