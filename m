Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C53212CD8B
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286509; cv=none; b=iuSzBiucYG0fbCgqyMnbBv6dn7Q6rWXCVtUKEpfAW4wVjsIoV6DpjBIqAt90RGsRrGQbD7oxt0PSgCVefGCEMxkRXKnZVrqN5SJBqtiGybJTGivlM5hNpK8vN4/gsZuCxHOELfrbFtJUXFPTVV5H3kFnMMm2NPm7P8hvnxkTLT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286509; c=relaxed/simple;
	bh=7/DkAt3WkgM94rIW8zYQ6Op0WHWHc7sHiBEw2cmj5t8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R9g8QERBspYLuQGI0FJpraoC7kNZC/uZ2X1ubbjy7IAqy+QdmbQNLRnC+r1tuupc+o1HnOOjlorPFgihukUyEmz2nGNoKf0QAJNd6nI+V9H+1GGCmMrjqWdpyL4Xlk6Sdaw+oIY1ninXva0Jd9cpeZryl/ZgxfsO+Yqw/mCyTAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0ElGgQZ; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0ElGgQZ"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-130b2295ed0so7489976c88.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 17:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778286507; x=1778891307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iejIHb6pGlbBShgUTjZwHPgEaz3LQOLC3BiQeEmGwrI=;
        b=r0ElGgQZSs4zNbzQ1v80MFUtHsGgKdDT2PntbwxWBsWJdGxoMYAa7qamH34FGvGuuY
         bxJobHSF1fYFOrhOONWnhqbAnWfVZZ/2cZaXWF+LfkM2raH9vISzKinPO+6SUH2LLDI+
         1y8G78wQrr56QPnFOZpyY5/9AP4mT+yF1d0jKDoTxZE8GrGfYNTShjG51mmHLnaSl80f
         nQUDqaVz+JnOZN8bEfTkPMAb5Xk3UQ/iF4uiKGVRrQnLZpsDxVI3cARCmlZlWtJOoI8P
         RSYcgKtkWYIZFABBPetvPR/Rz9dlAPuLgHdYXUfgGK+ZngeIAa1Jjs4yCk3gtXqGfiNJ
         oAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778286507; x=1778891307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iejIHb6pGlbBShgUTjZwHPgEaz3LQOLC3BiQeEmGwrI=;
        b=MWkq91+2uh7KbHgH0PM1GQ12FuIgtl26LPcroNM5LqhGggHCBenfyZbL1SsRdD7ZXY
         EsLvLNBjvp04+kZhFV2qMd0/M/DHbaLeSJb/636/IAJwfy66bKDaRzODeKIkrfI5fMI6
         vChbkY3jGjNNlR3drof/Ch9RU9cIS080fp8i8nRGx38YhPeFMCAz6s0BsaftsjXJrg5R
         U3Y4q14qn4QOQa/BqEXlrjqQqrc4PKZHmE6m+rZgGel/7lCc//s6s3Cnv2uMBYaTQ6rQ
         d8zbyePbMpSjVwXua6R1wFokaZqRmhq4+j2aBzqWOJ6vZmPqmagMmD9olBCiJki65kMM
         QcYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fhGsHEI/JxO7r1Rzyfo0aTgw2+b2XmuJNux9n69/+xzoNAg0JvDJ2fvXObV6proLSUatRC443xMXQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0yG/2NY6YhcfzJbIGSwlhSPbKekd1GjkqiZSypJA/Q+imfy//
	H42q2YL9caBp06ORGMUJ+aeB4Wucwo5dg0kZjbh2wb9Oak5ycw9vC1SF
X-Gm-Gg: AeBDieuCDZcXlPc0VhRCaW+x0MQEX3ZmRaSzUZFItDHvl+uL6t0BDXZbSqW7ImFCGf2
	LN/Iu4GhE0YwAxuomx1fMagx9zrdL6qq4DH2o01sWoKS0588pgBSjZpl0rMU9wCSOi/iU9TFOFk
	jzlxSDE6wPg6LinRFjuQ6h2+6PA+rRDbIwwZla5h1o65jpDGRlv2X6Za5AsM/PctbP9aUqi29Wg
	HBOcV0TgVtu0rQA0uWdt9hFxtF87t3Q/oUlKt0f7ac6opyZ+ua/VCbdkmBUFky0zixPUpUFqlJh
	HRTnRcI3nRafYRSPIBlB8fgAZ+wzKpakwLFKf17uh3x1/EK48ESXlcTvIG2cDlFYt/2RLaU8Dgy
	Sin1NK+O6qnkjVMUM7Ve9Zlx+KQHfZuqZHGyFhQgYPRvFthYT2hJK2QVx90z935R+UD5e8G/caK
	XUGEMiSBVjbKP9RJeJGmfhIVaqFyCLcGTF0mjdTct3CYll7j6/BhVFLjk=
X-Received: by 2002:a05:7023:b07:b0:12c:8f92:c6ba with SMTP id a92af1059eb24-1318eb3f318mr8576106c88.34.1778286507125;
        Fri, 08 May 2026 17:28:27 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327810ffb9sm5979234c88.2.2026.05.08.17.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:28:26 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 0/1] dt-bindings: iio: dds: Add AD9832/AD9835 binding
Date: Sat,  9 May 2026 00:28:09 +0000
Message-Id: <20260509002810.78372-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
- Add SPI peripheral schema reference
- Fix example by adding clock and regulator providers
- Fix SPDX license format

Hungyu Lin (1):
  dt-bindings: iio: dds: Add AD9832/AD9835 binding

 .../bindings/iio/dds/adi,ad9832.yaml          | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dds/adi,ad9832.yaml

-- 
2.34.1

