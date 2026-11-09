Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233563;
	b=lnnm4PwfbmL9uKFT4RbqeqczkkyXHr14m7LACPGTHdkeEZzLAks2w+443pBpKfkznWov
	 O6En18MVT8K74fka+wUIglTloeP9gqypcvRaY35UC2XOgAzR1vXgugc5920vyQbWMJB7g
	 +t3A5IQScmP/mU5CQ0sarFT1WLG5o2IC2CetLxv6YBbB8jvD+J+ppDuW177u2BCu1zfHZ
	 WCQsRACcZDgc8ZTeMBr2z1M7FfIQ5YLt+OGpFRb4H/wMyucq0502FgEo8yqKi0h22o3Oh
	 3g8GSNaOkY3bTHZkvcQPr7FAKvYG90uQwivBQJbvAbThqhFZLVgyeVxDAaJ22lFTYZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gMBZC7vvaeuxFMqkjuXQps6Bm8Qlu7Ip2L2DaZOXdOM=;
	b=s+GtUZEi6KQOsf5A1XwroTRXNZBI0s7+2gTJr1LfrEbCgtlRsV4P7g1AvxDnvlcTOSm4
	 De75PNNPjgWqtY6YG5umtVKT0TCqtJPAyzIc9j7CkFjjr4h5DsP57MfL2JeCSswlwWgKc
	 hygFNwBrVrpANWK3ZeYr8Syh9KIibdqP40ohlagX2R+vOaoYOG7RtW5dDwOrdbrp/xWnH
	 7m0XYoZbdOwijEHm+w0JYRApa8Ahh54n0eGycv/JTYKR3htFaO6UG6uxPMClbOK6Deg0i
	 v3uxDTl1ninE4wWMwnSYDy5k2HeveIzt/We86I/dP5WjB2Txq6lfbAgaxK3tj4pS9Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bj3WdwtO;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01132606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01132606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Bj3WdwtO
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a8cc11ac42so703434c88.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233562; x=1794838362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMBZC7vvaeuxFMqkjuXQps6Bm8Qlu7Ip2L2DaZOXdOM=;
        b=Bj3WdwtOan8niHabwGBoQQToB/pC+hGkfHm7c+FGDAMzWlUZcUFaxbpnyJjEp7ZLMZ
         x9r6+3qfVmoJb9egzMDGll2B8DkXFl17cTE6V16zlwu8fb70TS5ehwhi/ZRoBRbcvBBC
         koUL7aERcMwWR1KXAcULsMPxiLus4Tr69h9o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233562; x=1794838362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMBZC7vvaeuxFMqkjuXQps6Bm8Qlu7Ip2L2DaZOXdOM=;
        b=oqUhBMBCzXrACZcreKxvNrJ3FfQAjltd8nQizqYGKOfMy5XF5AgqdZ0fIFuAcwBPmP
         is9RAc0hjI/5WiWQH1PL7s4QElkovyxW2Hvj8cq8sJh9iSyU8wgTuJtKP/LovWq/BPx7
         U1G6n2113De+98hLKvZaZjQpXHM2UslETdyVsmU9K1T1VTbh7gcAGBB122pptqyMDh4O
         qZyKT5zhU5ElHpeuFO4VhT1m/E9jarr1xJ8JE+hYTgxQr2Wdcvi2kmzkC5s+PhWF/mhW
         pQFHHwK5M8jitXIR7jSVPrLp0qe1X1dPFvEhYDZ2+JTecAWTID8KVn0c8NOjSccq170D
         IGYg==
X-Forwarded-Encrypted: i=1; AL+hErHqXhGCPbLhO4CeeOoFBPhkbmw5uKdF8F+wd6/0vlqwg4OIuEZ01a8MHJbTOuVjxShwU0PDlu9fA6jy@vger.kernel.org
X-Gm-Message-State: APuU4Z+nUtZ4baLuuqZ8yhZFI9KNNoQyruiZQMU6TDjyYFNKK1x4M1hl
	nD/9bQ98VaCEXiNZ9ATECMTnUcd2stksJQU6Kk75i1rMeFG8nxkr3anaRnVHDxGbwMOMW5viKmv
	cJTtTv8VC
X-Gm-Gg: AYBFou09OV+mVHjEXkoKUxE7S3DKorLRz6SXxwE/6393yXFQynyVHk1vbM7Ke7O5BSP
	hbgF8K/U9ChME99TzTuLgMgejQixxJvj4O2ZA/ziN0A2R7RkjyHLT2rywrTA/ooLLrMDP6jN1uY
	VUF4qhTStxLjj8cOWZh4xorP2fvaT9Uz5XffAWngdAOwu4xeWcYNQspcfr2JHVfAltITom1O8Iq
	ZNoBwER7T6ESLhimtTIHBgGxsFGKYpqQZ14RQ5hUAwwQlAplXGLjL5fwkTtZVWR2w6XrI7spQSK
	MZ8w9rFjFcXOCybsge8GeGXt0U45rPvM5mBWFXU96sRDDzOvOVj5RCvVxHgBA8KJp9PloW9w7cz
	Zlfhg1WHWU0SA3JAowyV9tCDTM5Kb3CUA4bEb6YQJhwKccilo8Ucgps36XLOMoq00qF5MdjszdY
	ioT4b5G6nzuw2LtEIZycLuyQoFkpHh797S1uitNylU1O94ZUVC656NwPD3QBL/5hWBpRW2cTYPi
	6WW0Locs2r6wd4tV8/mMflPRg1jk1mKOP6Ezm16hlDQSE2Gp+kWDZTY0ikb9exgtt8DtHz4A9Er
	hdUXgStU4oD+5VOoQg7Gpn0Kq+RJLnCxJekTUcqR2WJmq29irmr6k5hTK7kco1qVkcpaCC7feOB
	xoypPYw==
X-Received: by 2002:a05:701b:2505:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b39febb929mr6132872c88.33.1794233561859;
        Mon, 09 Nov 2026 06:12:41 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3771ea85bsm14374676c88.18.2026.11.09.06.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:40 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: mediatek: mt8173-elm: regulator cleanup
Date: Mon,  9 Nov 2026 22:12:27 +0800
Message-ID: <20261109141233.983830-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
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

This series aligns the regulators in the MT8173 Elm / Hana device trees
with the schematics and datasheets.

The comparison and digging through datasheets was mostly done by an
agent. This was an experiment on my end to see if it could understand
schematics and datasheets and help with the tedious process of comparing
all the documents and device tree files. I think the overall results
were pretty good.

With that aside, this is just cleanup. It doesn't affect normal
operation.

Patch 1 removes properties and labels from unused regulators. The nodes
are kept around to fit Linux's behavior: if a node is found, Linux will
consider it well defined (constrained) and turn off unused ones, which
is what we want.

Patch 2 fixes the part name of the secondary regulator IC.

Patch 3 fixes the regulator output names of the secondary regulator IC.

Patch 4 fixes the voltage ranges of the connected outputs on the primary
PMIC.

Patch 5 fixes the voltage ranges of the outputs on the secondary
regulator IC.


Please have a look and merge.


Thanks
ChenYu


Chen-Yu Tsai (5):
  arm64: dts: mediatek: mt8173-elm: Clean up unused MT6397 regulators
  arm64: dts: mediatek: mt8173-elm: Fix DA9212 compatible, node names
    and labels
  arm64: dts: mediatek: mt8173-elm: Fix DA9212 regulator names
  arm64: dts: mediatek: mt8173-elm: Tighten MT6397 regulator voltage
    ranges
  arm64: dts: mediatek: mt8173-elm: Tighten DA9212 regulator voltage
    ranges

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 78 +++++++++-----------
 1 file changed, 34 insertions(+), 44 deletions(-)

-- 
2.56.0.455.g6c5a503b38-goog

