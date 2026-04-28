Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54B7154425
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343653; cv=none; b=D8PtfQVRZEfFQpC3xwxj8HsqCXa3zD7eLd24G5dHJ8NaAYt6xFPYH7OcX0n5xJDd/+cfEZJbz6Vg/nL4jbpaupvvLey4DRK8xdIDEgM5xFz3rlVKfSCyo1WIG3uT/B/tZWu8vQyj8guBqxbxrMosRCa567ke2ujEL7GV4p2hpSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343653; c=relaxed/simple;
	bh=B2NJzaNjCJ0DyQe5Mzm2TtPc+J/lHI3Q0EjfI8MXkQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AtQLdIkhkT8xAdj5ZhVXe+ezScVv6OBsy8eQGfbEGA2m3hJpJeIbqUlu+rrnkPcKbsWD2VMXKzrm9V7OZBwh8P8NMMxaLvQ0F5I9Vtb88DZ3FgHERAxyQ5RPj2qRnkXk7mje29f4V35hujSgKYRGAuI1LpcUGl51TxBEFq+RNqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgOuSeMN; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgOuSeMN"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2d891442388so917212eec.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 19:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777343651; x=1777948451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xT34PXRwCoPIF5vxgIxThc3YCrZamZtv7P8orH77yuA=;
        b=GgOuSeMNmtJwMwbMhexmiPSPtEI0WhyahRbDVtKtkUWbJrBYm+zQY1H3+tKQYr/tF4
         ts332KbCgwU1zu2nCdul0j8DdeRfVXPKOS9kOh3XEtA+7c5CHE41EO8Gt7vhGcue7014
         SiW2dLNcwJI0363nXdOfzHAnw77V8Uy7yXsqf2CsCRaa5qwe9hKAVJ3ZqYx3N9Mrf0lx
         sB2gP4mQRllqL2S1Wv+vUaFXOm+dGHCDtrhA3qZRwrPQtmIFx1Eg8oaSbseOVVRWZXpQ
         5vInhNsrnJ7VND9gnkbiZcQPz6zT7+ao51jc2/Vwer7+gj74ezJWHK1elJfqTeZFixRe
         aqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343651; x=1777948451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xT34PXRwCoPIF5vxgIxThc3YCrZamZtv7P8orH77yuA=;
        b=S6xCSYPDciCaj1LmrpgjoQjK6CQHoXCzWxoA1d4N1DE9Q0MUWgvdCxhohbv6yREobo
         /X3opEhHIVUxS7iAtEAjcoHer61X2lQYkWpMl1tan7UN6mSrkIOK6B48DdU1gcxG2oxq
         zVyPUHnNt1G7qRchMQ/zICPVSng+lncImQVUpU+fYaC4Y08CKpLpf+8ztidLI8GLxbGM
         oYMCd5QlxAr2PQgk2uwbYsxDZHNqGMe5xt+sGk+Uz9aOJfj9p1ORKLr4h7Yy0RURsGob
         F4VeVnF/V9WPpaZTYb1TAqDa7aZj1M/RHVr15ACKjZeC/UrJ4p9kxUWTy/0gdoUabL1T
         GgmA==
X-Forwarded-Encrypted: i=1; AFNElJ9LqZ05xd0hcg6K8sUfy52lzrPJ7Ql5r3zkBSlVkNsBobEWMlKKcuv086npy94n9y6XyHrlUaNbvKQ+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqmu9dWDJgocEasoaP96INQzG4Q35MglOkPyylYn575SlgOB1K
	XwMBQCoQjindsB5l4SUYpszMDycI/kBl7DXZlssRri/d+KYLtCmFfdaf
X-Gm-Gg: AeBDiet9C7k9q0T0AvtfJbjavtXvW996Z4pIZN6mhDlUdx5Njm0M51bDStomGpIaetl
	qxwMYZGgK0JqqfuLtCLIH8Uh5SSZ9rwc7nv83+4nCm1Mz9eoxHiyfHwr7NhUxPm+0gvwbk1T/Xd
	1wCnniRhJ8kz9HYHSwKFZw+aLSC5iDnAybu6nA5X9kPnKby0S+tvMgWQNcuuiHE4a/9SPe8oyCj
	GtSL9LXh5x29+50hIN7yvP3VSbOqSMj5Sgo6BgUi4oNwY4TCUOCzYhZQ5GBilFYNPNK1eaPBGpt
	/P+fOFLou/KQl8TxGEmLDtOGzkf7RERMrWxdnINZYd6nK9N8CVEpStrPi0OlPoAD57WojkYaJEz
	Wf8d9UsYmtnctozkB9Q7B8WeYjWcvL5tMuBYH4SUqAkvw7eE4Jqb+pJqbq4WQmwh06IW/ilw9VZ
	8jgPQTpB47EmgE+MC/6jIZ7Bv+DeAy+yE=
X-Received: by 2002:a05:7300:a148:b0:2ea:ed3e:d0b7 with SMTP id 5a478bee46e88-2ed0a09937emr738460eec.18.1777343650867;
        Mon, 27 Apr 2026 19:34:10 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13ebe6sm1088066eec.30.2026.04.27.19.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:34:10 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v2 0/5] leds: Add shutdown gpio for is31fl32xx
Date: Tue, 28 Apr 2026 10:33:56 +0800
Message-ID: <20260428023401.330308-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch series primarily adds the shutdown-gpios support                =
                                                                           =
                                                                           =
                                            for the IS31FL32xx controller.I=
t also includes a fix and                                                  =
                                                                           =
                                                                           =
             dt-bindings updates derived from previous attempts [1].       =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                          Patch 1 and patch 2 are based on a previous attem=
pt [1].                                                                    =
                                                                           =
                                                                      The d=
river-related updates in patch 2 have already been merged.                 =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
        Patch 3 and Patch 4 add support for the shutdown-gpios property,   =
                                                                           =
                                                                           =
                                                    which corresponds to th=
e SDB pin of the IS31FL32xx series chips.                                  =
                                                                           =
                                                                           =
                     This pin is used to enter and exit the hardware shutdo=
wn mode.                                                                   =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                  Patch 5 fixes errors introduced by previo=
us changes. It impacts                                                     =
                                                                           =
                                                                           =
   the brightness control function of the IS31FL3236.                      =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                [1] https://lore.kernel.org/linux-leds/20250723-leds-is31fl=
3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Changes in v2:
- Fix $id mismatch with file name in dt-binding.
- Link to v1: https://lore.kernel.org/linux-leds/20260428003412.322032-1-je=
rrysteve1101@gmail.com/

Jun Yan (5):
  dt-bindings: leds: is31fl32xx: convert the binding to yaml
  dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: leds-is31fl32xx: Add shutdown-gpios property
  leds: is31fl32xx: Add shutdown pin to exit hardware shutdown mode
  leds: is31f132xx: Fix missing brightness_steps for is31f13236

 .../bindings/leds/issl,is31fl32xx.yaml        | 200 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |   7 +
 3 files changed, 207 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.=
yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.=
txt

--=20
2.53.0

