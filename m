Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236DF30BF69
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775463221; cv=none; b=byznawqWaqiI5w5qDson6H0RHf7Mu76ioGoUHWRTxQR9Z+nTL8iQjrAXUgz7rWli6X/5JaCoNQmx8emJPMPrjQBY9nnjQtcQ/SNQmjJdglUmhwTDiIR840AmS77+xuqasFudLIddam8Jeol6Q5XWD8d03/gMkvPXjNq2gWRydZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775463221; c=relaxed/simple;
	bh=NSsCLxA9XIus0FBPdWSRkAf9rfESaDpSLkuqckRIxMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qayl0u2Sv2PYV/noZCl4+5yd/8eiUhCqtW2JpTDZY1Z/R4x75vbdxmyzKsVzo3A2Hglr4U3E3S6Bes/YyseGkqlTbdSUojFlXpRSmsaf2r4aBQ+BiV5RC6QrdPItnytohtJzGLY2kZCPYUaSUCrcbSkVYAWVHQSltwaOjuwwO4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcCtqbyh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcCtqbyh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b8efed61so340795e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 01:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775463218; x=1776068018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Grrz7Uwuag8ALYv5V52HPJq45H3NjslcBVbddawkh3Y=;
        b=TcCtqbyh8woLMpMALzi3wOxRC+6CVrWrbeQtDhP3ALIaEZ8JzvSuCJ0HEOtf8ELh02
         xNr2Jzs9QeH/JaEqLsSdHxQPmSBLzGOo+Y5T+tuC0tYVGhcLjY/fI63W7u+yQn4M3E0D
         lWysGeo5I0odyMp/a7xhgMp88Hy+eWa8SYXa60zEvYTCuZoGrz9ElNnAyzU78SBfSU82
         yyNkwj7fo5qf6L+k+VNbmkF2jn+T3s6mMhGOTIsBLEYWoY3TiaiW2QJEj/c/zwxuzpeN
         rzYed7UUCMWArOpVWOX6M016OCg4C+cVSBNBMbaUcFEtXjAgSbxpfO30J86hHc/s35wn
         XrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775463218; x=1776068018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Grrz7Uwuag8ALYv5V52HPJq45H3NjslcBVbddawkh3Y=;
        b=caFflk3JAPmficP9qQBw1aa6y3A5ChssI5FnPDPulB3pDqiZMBH0PUjrfF1VENyjmf
         elS/FghlMy+OtNZ0ewEUDTOlNpMRiqPux2L2wyPMuQEKYQTghAK/ANdDI+FTELnitG4f
         TMt+OD7vQPdjM10kvlq3+QsZi0sEGTVx/J3ate35IiTIg6Hk0VbskUi2ePLS4TWe2Tb3
         rgOW1Ky3NPEASwgTQIXuBNnmaKfweSRvKGU8NpF9IYnKDa+TBUQ+YG6JPr6pMGar6m5+
         tJ7bEgXh+7lK8YfnJVqctBVu0+hKNA3ylMBrOk3/B61Nzozlgu+vsgakV/LNq1gdSMXw
         S2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCW0L0Q3Q4qO4fvqVbdCt18KAGbJ4v6C3tm2Chyt+MdI5bUjT7CxaMvnv3SoHyDfAsyotRhKsH5vEzRD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3W1RiJzHZp+Q9rZCj5i9nv+9XhE0J6Cl6jUZmTTz8OH9IoJa5
	QiB0Smt3yNE4GpaFQkrJii9UTq68ohHjV8yHAZku5stngj0NPWFF5+oJ
X-Gm-Gg: AeBDiesfeml3WkD1v+xJWSURQ21mce7524aYRn5V+4uGVJW3aKd7/xWfG3i39wXHP6p
	bm06yfCHNZ08Wc0b3syqUj+RP1KkeWw8oFBYf/ixUh5Pmcq8tTUseeKL+S9Jpy3uB8evt2AsXCm
	yKuenXU+uo/QbyDlBoGhT7JMzW6e74Xa+vl3hi6pKL2vLG1QJlRZlTe8XLQFOL3N4/+AH0H7FZn
	anIa/cbG3nrsd5PAe+JaRH0CMwi/8vSKTuOQd7QtFCDD749vOSysAcXNPeUYurc5lDGHzeexnJf
	1wjW38vRU8A2WQlAXr4eJb8hnsnC4COiSLIOV1aC5EQl8uj57IRGTXD0iBy7FKlK9/E2adpEdTn
	E6yytTu9YksStW2vxvkp48ASV516UJi34wMoRHOWizEdISbzB5EmRGwgpS1qIp2rP4bqb6YFO9O
	XgnQtApzCBdBLz
X-Received: by 2002:a05:600c:4590:b0:488:a502:8955 with SMTP id 5b1f17b1804b1-488a5028b2emr110656135e9.4.1775463218516;
        Mon, 06 Apr 2026 01:13:38 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm39408519f8f.4.2026.04.06.01.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:13:38 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] dt-bindings: media: mt9m114: document common video device properties
Date: Mon,  6 Apr 2026 11:13:29 +0300
Message-ID: <20260406081330.30362-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document common video interface device properties, such as rotation and
orientation.

Svyatoslav Ryhel (1):
  dt-bindings: media: mt9m114: document common video device properties

 .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.51.0

