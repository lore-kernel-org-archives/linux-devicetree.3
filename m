Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4308C4D2EC5
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329015; cv=none; b=h3umUYLt9M+iXobey9q7OuKyh5casxAsfDlwg/WNWwqR1Udd5RyCs0DCszL8Dx5ypg8/0J/LoihPOPdFqwEafXl+5NfBZVEjopfSBZhissNadr9nglMF4bDwcsEA9B6FRZZiZi6tk1abqB3TBMu1vRuD62i9vpOVlPIGiTEkVaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329015; c=relaxed/simple;
	bh=afuFWuEcuVVgf1+eYfaIdaB2T6Kws92Mx6NIQID7+78=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZEKlVMOxXvOAhzaAUfNa4LUfiXXzNG2CfeR4RgF8qam1RG4Lx3cYkw3/9LeWLbx3bMNcztP5pBrzW9Axv23uQKgA4pkXj+Nbt+D+5yCfIP3tMwqgHzTZx/MRX20ofZQDYY49xXK8e+bxMjH4lgrfs/PsSiQFWd4hjX9gjdgvahs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=kDyt22RJ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="kDyt22RJ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so621867f8f.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1787329011; x=1787933811; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rLPkB8azVhIW0KCjbvwUW+Yy9rTxtQlA3RfVUmAFG7w=;
        b=kDyt22RJ8IohhDReNcENvwvusejHQW4MVzNNzm8sgRRnCtNspG9jzSS6s03aQCfRQX
         leO9gVmL0bSZyKPGz7KDBuBy2js/ylu+NtXtYfE3A+yvizYAAy3oBn8/3z8Ckl1gQ/fz
         9PEMpm2mtiBqdIAp6/gtgWt5wasX+MFrFlBMfGogQ8xY1FBvBbzfFty714J7JwV3yAY8
         qNC1ohEf1mTByuG9XcTnTaJQ0VcRUsBenkQMGg86fv+d2HSZQ4ezRfOgEowQU2nLK7aN
         +iNkynL7rBZMAe4EuQI4kV4mCE1FM4rF0h5d+8FzgCAIEXRAUp4kQoZnoc5snjAyR+oa
         rgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329011; x=1787933811;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rLPkB8azVhIW0KCjbvwUW+Yy9rTxtQlA3RfVUmAFG7w=;
        b=pfg7jgQe1zS4L1jbd8zVkZbQ1J9A+cND0EqxCIehMXnoYskG5KUY32W+gHKUFBz4lW
         38DEu44wn9ouw1FpiEZm53EPJ5jtS2TCqT5WnJKFI+mlw1/JTSKEtbrOsfQyRDZclbxY
         x8dkhj/FEi6fQYmUw7pDKbUeTAfBgvQ9MjkkC5w9W9z6W7gFlOpUXZcx1CHgfblmdILt
         wLS10iNPalQAJfq3J9GlqWzb6DPnb93fS4NXREM4VRnxGFi94ZpsMMhQsf5+wBJ9yegf
         +RUhONPgAKKoaVJeyNxitB/i9z8L3hUEu12UyJQqkEC8NBnBcTeJIQVWhDdRQ5P4r8+S
         qiGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqG8TbEccyRo0x75B3mbFTF7dqNWm0nCa5ixnUhSuevGzu7R2xD2cHkvtI3pV4f8n2SHtpGglIMj2lx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7E5Y+gdo2Ny/gYOWND+vLXaESxwU1ZWEw6/7MsB2ndE4IqJNL
	ONEh4YniJQTb9onV/6j2JxGTzBPChRUgKHqatwPHZWsttYYs0Yf7sXgIzmwu5InclJMzt+RWkrd
	j9mP0g4M=
X-Gm-Gg: AR+sD13zt2sG97TDAvzlh9eCdelx0jusuNb55I7wnQ4P1tZiQfOvwttuxhtsE+eM1ik
	47+FWMgzfUk03jyY559Tal+B0QvZ8qkllDPav/2ED3aN29sqXm76Is92PwhjLWRXR2wNbC8tFhR
	dgiK88CRuJ/T4B2za6fJR5T5XeNEKCVGzUbS34r/qgnFhP6ajikDsVW9NENqm3F5JaRUX5LcuYD
	c1bgvMFnz3y37pBAA/JMGrdJeB+5VhE8b1nKH5mhxTuDdZqW5FeVDK/M9F6D2GzK2GpEaAp7Ucl
	ItsR0zqRxkevUG+gE17MWaIEnaGQK2q/gyS7u0KQ2X2RwG0gB3W96t+ET1/cjyHpfhWdVT4FUoR
	746LV9c57Hi8Ca6qGHmqcNeicwVSezSuDBt3q+WGjGz+EtSJfscm6306XxB7XUaVSj3IQn16fVl
	8bhzAHpHis704YQaaMK4ZkUnGIwiQdR3J2DfOI5XDxAjdmidYJl/OF97chvqGQk49Jgt/hwxfii
	WFSZfTPtQbCWxW76OyjVpxxF3wUkqXCD9CdTBkL4+/MBJo+JF+b
X-Received: by 2002:a05:600c:530f:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499b82f3d1dmr123488085e9.1.1787329011489;
        Fri, 21 Aug 2026 09:16:51 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-94.alshamil.net.ae. [86.98.192.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bd581a49sm10245235e9.1.2026.08.21.09.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:16:51 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/2] usb: typec: hd3ss3220: Add support for supply
 regulators
Date: Fri, 21 Aug 2026 20:16:33 +0400
Message-Id: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrA3ECVrpVYoLk4w6RbTMGCmId
 2+qb/ct3n+AkjApPIsDhHZWXpeMqiwgTP0ykuGYDWixsS1WZopO1SFaIzSmud9WUfPIC9HXdvA
 O8vUjNPD3yr6625r8m8L2b8F5/gDqFW8yeAAAAA==
X-Change-ID: 20260821-hd3ss3220-regulators-7777cdb50fb3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; i=alchark@flipper.net;
 h=from:subject:message-id; bh=afuFWuEcuVVgf1+eYfaIdaB2T6Kws92Mx6NIQID7+78=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR1VL7eGqsdmV79ckL47NV35uRaygYm8Xv+/h21/MTnK
 0WNHhd8OyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqGRGMDN/Snasm7ex8L+fkNzmnJWQayzMu/13mzetncz/mvndlUgnDL6Y7/Ed
 8cxc0S+lW5l3YMrHm29tTC1jZtX8fnf5gz2T//9wA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The TI HD3SS3220 Type-C muxer has two power supply pins, VCC33 and VDD5.
Add support for both in the DT binding and the driver to enable their
correct power-up sequencing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (2):
      dt-bindings: usb: ti,hd3ss3220: Add support for supply regulators
      usb: typec: hd3ss3220: Add support for supply regulators

 .../devicetree/bindings/usb/ti,hd3ss3220.yaml      | 11 ++++++++
 drivers/usb/typec/hd3ss3220.c                      | 32 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260821-hd3ss3220-regulators-7777cdb50fb3

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

