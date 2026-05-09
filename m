Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A0D264FBD
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 01:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778290682; cv=none; b=YxAnHyhqLx6rjRNfdR7X17ASMfXvmRZ1ilolOOM3O0kl8m9BLxdTY/iOCGg33xzhZFjKJuZuxVa70Lq2CejxeeAOUdaYJGS/6ONVTf7TmxXRejrVWVMSk2IV0AkUaU4GtlRywrRr18HCvTI7l9cugkqpvoIWQ9tNF6gd2qCt+os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778290682; c=relaxed/simple;
	bh=ZafSK/ffN4O0S95cmgYFO4DqFob5YI2zLrZF+3z1VYI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f6rf2ahPtY3egfplPKSbqjDOb2bzUsnhOjNtnwLPmzNfR05tLDlMyBiDbGDR8HsAvWwxQ/4thlqfnnYTAIqwpauoAbDv/Pcw5Z2tvHQzuMOgQjoEZNM68GNOn5VJoNHPFKAnk4CQ5bCfmW5J87j5L0VIEB+wNlIL7x4YTYW6WTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSQOygyO; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSQOygyO"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso1960361eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 18:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778290680; x=1778895480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0amy2Ap/oF/82M4xJn8jCwNeFxH+1UppM6CazgFzx0=;
        b=aSQOygyOt/HIE2DKVbwnreNiRxB3AYNQUDL7s1TuzIucK1r+Mv7Yqoih9K52Hlpyfp
         6VTRueINgtAgOvXhSKKpWG1rh6dR08BkbvAFskiA3kvZGMV+ACtHj7oDnFKgfbSBYwkj
         +v4Qn2AGY5sPO3Lpar2cRLonGzlzQBiPtjmXPIMJrtw2FTBUWogm0vG4ujiZbr+Kdgwu
         DCWmnE5DOrLTCoGM1KXq18KGF+FEliVUvCJ4hhnE0qI+sz4yqPqQeMnZgVw/kB9zpVbD
         KX0XEluAtzc3K+45K9bsiMPqOz+Z0QdpX29inQk1vwtRXjK6oxLNTmIYXDVa4QnAXu0K
         AdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778290680; x=1778895480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0amy2Ap/oF/82M4xJn8jCwNeFxH+1UppM6CazgFzx0=;
        b=jvnpMoydWWdek59Vin4N8cXyWHs2lhjq7Ml6VOc26uFMvnwe2zp7D3sL5K+VngmDXc
         uHq/q+S3fTHouunWEaVR4MSBunbK+81R6yzam11PQSV714ccxjboq97a9G+EEK+wMpET
         lqX+xveq7nBlirN42aD+HoZzybHekrIcbHMqnNkiUzWAPqoFlU3xApJNrDxjinaz4aHw
         1KdUpHuPt2MSzifjos1VzWQBpa4J1HGMJ6UpK3xO6X9mdIhFOh0qw6yjQlszUG5hf5Ia
         G7s0Km3ep3cLD4EZ8SBppQ2sJuNPizIeZsUaehHLrfFtMy3fHwM+KeOkVloe9eIrGEMk
         Q/HQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kn3yBTrZAEHYxEGU9O0FDAWroSYPKJYYJc5IocGsUrztUcnjd3h0O1P7zX+9vKaE5O/OMPc8fIvgB@vger.kernel.org
X-Gm-Message-State: AOJu0YwR9f2E+bt625zMMrlXvabpOGq4vHJNNyX02oDziIsUUP2oQTqD
	DqOAVO54fQ8VmnxOByX8hYiTBWT5Xbc2wF9Ioa8wHySgsLDwhSWgJlvs
X-Gm-Gg: Acq92OGnf9NKqJ3T3tI9BWiuQD/kJfMTk2b+XlfRIewcGHjjo5W/jS9bNyrHZJllI//
	NMtVBY0pIYNY8MBD4NbBbw1T7q8GN4oi/j2B3bguPoq9BGSV0/ICX2Se78xYi/t4DDAaUiilp4E
	EuQlvcNTalzMoeejYobyqLEL48bE0eMKbbQjP7MgQZcUmQFew/rcpHMMehSXgK7vCD80NVE58Og
	52Q6ieoPrhxWXhFu5lWilTqZ6/r969VKOt4W1hqvrxKwWpsHLT4nKE41dRHPKBW1pojxCKO0EQQ
	4ZusKL0eBesc5CvPkI/klOUWHQwiua7nDmgyD88zqrWM9C6TK+3OPnEV7iJd4GWtDchP1i2mwOv
	GW9TMGcvHxF0aF+fs4YIo+xukw6FnJ853I6haEEpMI87MUzg7eLPWwCMn/iKohojlsOacR3Fetq
	G1+KR8k0PXRJUsGLiL4BrW4ZVOW8+1THEhDmQMB1Jm3XgOLk2xqM75rb4UfaPEepWISg==
X-Received: by 2002:a05:7300:148c:b0:2c1:67e1:61a9 with SMTP id 5a478bee46e88-2f6e4374892mr3977101eec.13.1778290679860;
        Fri, 08 May 2026 18:37:59 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm4503230eec.11.2026.05.08.18.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 18:37:59 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 0/1] dt-bindings: iio: dds: Add AD9832/AD9835 binding
Date: Sat,  9 May 2026 01:37:44 +0000
Message-Id: <20260509013745.80478-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds devicetree binding documentation for the
Analog Devices AD9832 and AD9835 DDS devices.

v3:
  - Require spi-cpol in binding and example
  - Use generic node name (dds@0) in example

v2:
  - Add SPI peripheral schema reference
  - Fix example by adding clock and regulator providers
  - Fix SPDX license format

Hungyu Lin (1):
  dt-bindings: iio: dds: Add AD9832/AD9835 binding

 .../bindings/iio/dds/adi,ad9832.yaml          | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dds/adi,ad9832.yaml

-- 
2.34.1

