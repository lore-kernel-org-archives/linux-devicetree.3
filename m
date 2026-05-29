Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB801684BE
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060029; cv=none; b=kLFPnbXN7l77fDid/d9JIU0fcpURG+u1F59Ahso/tFYYSxhCmKGe1bfo4kNA57aD+g4GdCnAbjfl1I+EAj1Ock/m+zYZt9TLwc1OFSmsVQQTc6tJyb8gHvBarxpDCuqHG6N9oFCEj6Le4xrLQ58AVtbekMmCj3wPvHYSY5omrFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060029; c=relaxed/simple;
	bh=oVI6sIQKYjEO+Rc3pR1I1ANyMxO1m2J6rxUYRzjolvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iYMxQtqNko5fSQ8KdhK8eN0IsxWHXfSNUFoitEz/iyayXHgikmVYPkZ/L4oEWgc36ZLHTN8FHNn1oWHDWpoLwQOEBYUpuLbtt/4bOmt/bQAv4mT/t1ycG88bSUWxBptOjXSLy3nXVTnK872ntSKulEARvRiB3+DSPZmGOAK78pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOfoEqcO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOfoEqcO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so60515245e9.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780060027; x=1780664827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=erHZp8fQE5ClrM6SGxP1RSdxu3DDgrul+rrCY76ZQDE=;
        b=UOfoEqcOsVmOFT4QrfAZaRnEG+xdU2mYMZDZv/6H8RnrgLX0Rbt6aHAbVvIphvOglL
         LZTzko4wcuVGtuxK0VPTxnqMSex6ZApQ0VhsmmGs2eEdcMsGRlQvfDj0ZkKzf5vv0twa
         cn3Cu7BZwkfN20mIGtRZ4J/4F5S3cTaNpUcrgzZK+UiMyomthFbRwDez1xscpF5xU8on
         wHniaHBU18ifHl7tCE/+6X0RaiDNAHdVYgqrOnbuVsyn4d0/hSOQ8JD+BykGptERmSX6
         gnY32b50ZIv9TC2qXjnBzk5uLVmOVqogMP625xTl/WdTchSlTDfCHZeUSrl1uMwuRU4n
         xKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780060027; x=1780664827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erHZp8fQE5ClrM6SGxP1RSdxu3DDgrul+rrCY76ZQDE=;
        b=qx+nopsBSgtCGWqCOPiutd/i7k/gD3v66njmmlmCvjOvsjLM8HshVysBZmuDg7T/yP
         A8r2/GOkLy1+s1Rzcz8NsOMiDm0atRqzEhrGx2uWT+YWxDDrhysKqVS+6KgzI9lGYoej
         GUTv8n23umQF5Rkw0lqPRsWIi9DQXa8I/4o3oYs+ufUok3IwCVlraKrzwYF9DcIJRdag
         jycLQBCFmtO0KASMkjNyHQSN23dwrT1ejfog48HOHgfLoWYx2vPKFtGzygupTU12xsFv
         55mPCHwIQwovD6bzyFCwp7oxp1LxEvKilR27H7XHGsuE9+7itmGeRNQRl8Kn5sGSHkOJ
         l8FQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wBkYJG8QVQUb2nvIYsfMWvMG1hf3/ugCKaKa6mKhE+XAkue8Yykjv38TZDJQq5yiMugLVZ3H47uCD@vger.kernel.org
X-Gm-Message-State: AOJu0YypdWXxF6MwGWGcTMG1fHWVgPcBmxXCcS0fUbCIKIQOF6dE8gpc
	ekEubr7C4aCPYmvgHDiKv0eByBp1gS+whAh0x1a+FAAyCcyhFFUcN6dX
X-Gm-Gg: Acq92OH1BxdnCNqubJQegIXcIX56p5104Rn1CYYCJqPytg2U2KxZP84sOUM7Ev4gKH7
	JnixKuX+ue11E7i/V2wFlOS7Rv2KnuMYKu2OAOy5ksMJq4Bqm2DaL9GBz87Rmv/0YMvQx8bnyn4
	ovld+3GHS4SUeukbBkPEZGh1WGJ6wM6r4VIcOCQWdVHaDLmrSqsx5FguarbIhIngijSSzboAXbW
	TS99+0sTWccRcy6reHh5k6oU1SZyCrS3yD3j9TtC1T5NtopdR0QhROPHyTxYOfKIm0S8o+ZXvQD
	TLEvlAz/+HAFT/OyAg3r1W9TsDncC5jnOTSwTtiDGck8i1EYJiAb/abjcJzS2kTheRZqBi5lSsP
	e5u+EkoXIcXtJ8OwR8gXUo7q6k1H62lJwWptmXC97ytC7qvM/n7XkxJ/yZgmS3sTM/6hK0Kqr6h
	KK58wt8p3xgZ4M+8GipHlfOhsP/LH46dTrBUSPL/VtjNm2iWEuO0o7+jxupbU=
X-Received: by 2002:a05:600c:47d3:b0:48f:eb8b:997a with SMTP id 5b1f17b1804b1-4909c0c75e5mr30174545e9.31.1780060027001;
        Fri, 29 May 2026 06:07:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:df4f:8f31:69aa:c094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909dff2a80sm45247225e9.3.2026.05.29.06.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:07:06 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Enable RSPI support on RZ/G3L SMARC EVK
Date: Fri, 29 May 2026 14:06:59 +0100
Message-ID: <20260529130704.327505-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series enables RSPI support to RZ/G3L SMARC EVK.

v1->v2:
 * Updated reg size from 0x400->0x1000.
 * Dropped num-cs as the hardware has 4 CS lines and the driver is
   hard-coded to 4.
 * Collected tag.

Biju Das (2):
  arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 69 +++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 19 +++++
 2 files changed, 88 insertions(+)

-- 
2.43.0

