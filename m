Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0267B86331
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 02:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779503441; cv=none; b=OocyRtCceM27VfzmVTk6aGE2CUgJhiv2MEj8BhqF1rvrl75vhHoQPv2dwZAY/atcITCjCkqa8/I19lB80aQOxtrg/B4rzfiNOxgUxB1KolOTz+J1IdzpDyyw692OyKvGeRpVHV8ag1QQYtpkhdCCDvAAv5c95F79mA/0slceasY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779503441; c=relaxed/simple;
	bh=DXGVy7z68ffl9XuZXM958QsYAFSYqNBt3EmenGJ/gA0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RnarfQVyumcFU0YbDpR4hRYTcVR6ZlKxr17Hwx6o0kR9VR4P0nZ2vzI7nloM96tkr/iuKgFFL0PvmELrXWIfD7q+M2sQtzEqGUsc51fu+YpLeNuatzGIUsbS6dtR4qWG/xVW6zQs02luosIyFcfxRmwdjdOakmEOzCznskmXG6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOHinnGC; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOHinnGC"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36a15ed5119so4166707a91.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779503439; x=1780108239; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rH1cdqbeUyBX+hi3A/hkyAkrMLwhGxYZ5fPk7KzkHV4=;
        b=QOHinnGC3+TSgA0/YyMMFC7Ft2Ofhw/Zfy2hQgxADGwhS0VxzlXaTaJG+3o/bBsITi
         K91dLIzCYF5dSxxd+4M8tk8odrcg6Ojo2aXgei8XZoACUApB3wqZ1KpzmlP5SZkATGUN
         puQI+G59gq4sqSM38JtVn2tC+GzjLYlzwucxCJskXjMt/xq+XGZ89U/n/tDR40UkXkPa
         UC6C5lUwRPDi3n+YBW6tkwlrpTXjwxYqZkNxYrodou6AWTqe+dFMuQ2OcHNWoW1ZK0IC
         duIum9soQCtlxWuVyP6Es/zWFRbrTqI0iF/wyQE/EVcwAkZALleO1Wa/N1JZaFGInjrr
         xpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779503439; x=1780108239;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rH1cdqbeUyBX+hi3A/hkyAkrMLwhGxYZ5fPk7KzkHV4=;
        b=o4hyREK0KCZiVxj4GLaj1Bp1HhnEAUY3wlPq0QWr+0bR94P+SRGwjLTkae8hzNq9mD
         DUGLwSHEFL6ZzdhQ4AqhBhR/e6lruQHeqSjZvgJDAvYcu6FO2YNA4bQx5TtwIqZZtZK5
         s9RLuYFgaMGPmnCYrCQ8Xb6MuRyaHLEcS/xCguPTeIuSPNWeqk9TP3guuPKMV6wpJG5n
         5ikObgmDkEYoj3ude4Mp6W6iOFVEgGY1icTj3RDhX2ADmLlqDpm220EVTWsO6GJq/cV0
         b8IKKvdrrVDRZGs7wd1uRmKN/4w5VgIbOMnMjnqZyKw0YPKyDNjJOrzPCwUzGwe/Lsno
         SvPw==
X-Gm-Message-State: AOJu0YzVhR34eXpTCok7dQPLMbXf/w5JAfIup/aqKxY+APh0v1TGM+KS
	KkMJeeVWepjai2uxoX2sBnoxTP6WRB5LAPIRe4mXbzKgIuc2qCZVQb/1
X-Gm-Gg: Acq92OGHR5+mVcjq1aAATRyaNdbOQPSFEcHLHox3JIUqzCHIOPUcKa7oJr4tpOUs5BF
	62UqJijgaC+IjeftTEQEb89aT8+XCnphEETSAvQfjPJFYNbfKBno5uXdV1Vy+5HoNwd1aFUk3D1
	d2+osNoCtVsDA3yOoRbuuP9p/y5KGe0BkhOxS7TnuSIbkj3m1ek6+AW1dg1k8w6bICOFHmGoy/Z
	/SMHs9uT+S2k4DhQ+YBB8ItwicTHDbZDRXFPPW/JQXC+qh/hQTG5FK6y+fOSIrgg8Y49RbZRA8/
	CxwSKlcSDkQeLYxvO+pmgidTIwQ8cOCXyBZ0erJPIApIJzrkvrvyfJHVGbQ8yhVjhLfrqYVJMyv
	yRUSeUpZq6IvPQOw1D2MIWwqkW0xTMfjuUAx/HzKC7Ewg0pu/9fSUhenW0JfATBEte4r67km76Q
	mKGzwjF6YBqcWBKGyaetXXJKOSc9Pt1kJqhmiSePgyb3GYIeG0sHlN4DfJ9TrAFNRSsQ==
X-Received: by 2002:a17:90b:3c0d:b0:36a:95c:7603 with SMTP id 98e67ed59e1d1-36a674517bfmr6928855a91.10.1779503439092;
        Fri, 22 May 2026 19:30:39 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d944c4sm3010287a91.1.2026.05.22.19.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 19:30:38 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: sanmiguel: Update DTS file
Date: Sat, 23 May 2026 10:28:06 +0800
Message-Id: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALYQEWoC/z2NQQqDMBAAvyJ7diGu1IpfEQ+pWe1CjSGbSEH8u
 6GHHgeGmROUo7DCUJ0Q+RCV3Rdo6grmt/Uro7jCQIY68yDCsCfxmIOziVGt32TN/EGXFP/O89U
 66g137dJDKYXIi3x/l3G6rhtsXjgddQAAAA==
X-Change-ID: 20260522-potin-update-sanmiguel-dts-20260522-7b3d280e63f8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>, Potin Lai <potin.lai@quantatw.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779503436; l=646;
 i=potin.lai@quantatw.com; s=20260522; h=from:subject:message-id;
 bh=DXGVy7z68ffl9XuZXM958QsYAFSYqNBt3EmenGJ/gA0=;
 b=R+4jpOTTnCHIjRDFt3jsWNz4H5AaeSg3D5NxXi1qN65cyRkf2x83zzgNwaOrj9YaIr+0DG4bb
 77hLMe0bxoeAXbacXRdXx9Um7a7ZwiTemNSr3NR7zLVBPjuPalLHF7v
X-Developer-Key: i=potin.lai@quantatw.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Update the SanMiguel DTS configuration to fix incorrect GPIO
linenames and resolve the IOEXP interrupt handling issue.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
Potin Lai (2):
      ARM: dts: aspeed: sanmiguel: Add IOEXP interrupt pin settings
      ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
---
base-commit: 6e22b9e818d68d7b8ce6680aede0c80a9355929a
change-id: 20260522-potin-update-sanmiguel-dts-20260522-7b3d280e63f8

Best regards,
--  
Potin Lai <potin.lai@quantatw.com>

