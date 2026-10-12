Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647874B049F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 16:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823439; cv=none; b=DRDLBxAnku8TucIjMFHZYCxBtILrNqXKc99A1SrRNqiE1Ge1J3XsTr59G06PKP1WXBhjtQG6yOeVYjGjQrwxs67w14V5dmD3iVBqBVFs5LVwZmU5RTEhNKPRVN5yHzK9gpLuNd2DckizXIvbmUeTYXJc0NVV0WTmDZC5+QG5IlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823439; c=relaxed/simple;
	bh=vUcOr0k/Biif+yJwcSpaOnOoZzKY8hxNFDDipC/t+ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JYPAY461oA/LtMDkyB/ciaYsQsllIEl9QU5RThMub+M2Dik3L1cH763+Nw8S6L6//XeFJqxeySFJWGxnzMfUlT9Bs2EttG2NAbGReirPWVQaGQ03jb0oy/pD5M4ppRZKYCqoYw3GE8R6PZub1ZCgCWX3EEVBDlrGI4EBU07W050=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=GB5zPK9U; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="GB5zPK9U"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93cbee4b010so124837085a.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791823437; x=1792428237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=clFQh2LTi4YoRHqOFH1o1TqPcyiqW9KA/u/YoNL08DQ=;
        b=GB5zPK9U/QAVyibiaaBYW5OaZUITyhx7NmzpHnWs6VtFIJ/JYwJ9yqD/W0FWTOv5Mw
         lRZiBfAbJyKSahde/XJaCbcGInWgvKol1cFNbE8Zga6SNHYqKn8HDUVk79vZ8v9tfsg3
         5bEA1G4Y3b6cPaDcycI4yeSzc6009yJ6mD19ZTzwnIgFRAvtZz3YsF5sGkg2N5r35lCV
         H7m1oLjS4Hvw45cZaXdi5hADHmUIFWa6qsGiaVO0Hl5LSVLzOoeSdWzVj9GB11lSnpzB
         N0iQmimrTkdmTgLvYT5n7HT9MRf5/ZMWlYJeJnfBI/Kt7YACK5VAEQhyycpCS4DRNaul
         inBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823437; x=1792428237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clFQh2LTi4YoRHqOFH1o1TqPcyiqW9KA/u/YoNL08DQ=;
        b=sXWXnZSyqJzS8Crq8VqyISF77Z50fe2ioCxv1MdHKtNX/0necxdlIV7fWyb2VyDQB5
         qdjJk4dliXL3nLrETKseiZU8NNT2AazJbpZuHhhuRaVtzt2gAoUQmDtGtUm17WgTBQjl
         /S/1wU4ymCCMeDnrMJ0IVc6TZn8GO+pLD93/LjDeSy98UmGVPLai65juega1nTx9lI6Z
         IYYyioE8h45fjjN3IopH03TlEMvSrHGjvKzMy2ZsSyM7jmZl34O66GM/8mlEpHhNIbCA
         RUBa1MTUHRL3lwJl4EWtcYyDUOK5Zh5lOqpg44nLTN5p3Qju3KGxxbSPJMveGGgDv5+Z
         qDhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkiWCbo1gwACVxTed9aif0qjaJ8ZpJi8VEbuDz+hjbiqmwtRe8FSeR9oz7lDp0yJU9vX8qea5cN9yB@vger.kernel.org
X-Gm-Message-State: AFq9FYKOLJbNa9ElKbHiU9gT2vb/f24TxKb1E4iPtunByyeL24qkVAKp
	vBNR8rkex4y0v80nxkbyHueUqWQEfWWYwCIPeEb3IOEKc/5U9azDQL/PNfzmht0jpQA=
X-Gm-Gg: AYBFou09hsg1vcPHPg0fK7uuOQ1GHTrDylJDKD4MwUeg1v0bBoswVzbnPULREyNA6CT
	2tWyJvwCKFyBccMicRrwR4OR2ndYTI1LTAPPm4043gjlOLjX17iG5UygnQ1GKIOZi+gamIIdge3
	+IcNw0EcGEKmskHU2ifCIC50Kp0k68uzwbMxslUDLRW1xmD4l7vwRQu8Fjzjl2caP2vFeI6vF3X
	JZ0c3XGZUtD9qT+hJ5JQn0F4VUfY20fcPW9eabGxNP488XaUqQhWt+KAGkc9IY7iY8vGkAo16xr
	AqMso3oBUZANGJgYNy+qy1RRqEPbibiCI4LjIOfQSB7h5bzqPA1PQ6ZhyiGT62LT1pg2EVYLNfz
	u11BtfV/+7udQi7DWs6XRCZZ+EWzbOHo8vWhVGPy1j5LHUECbzKln55y7lE97qV9YHwCw1BOQQt
	4eoyMljIbKtCVD0x6AzeKJ5bdq5uKZZbKtz/QIOuuZH8LtBGYuSgc8a2F9GXDBDjr6wGa/YT2KS
	Zc=
X-Received: by 2002:a05:620a:44c4:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-93ebd282089mr1696774585a.59.1791823437228;
        Mon, 12 Oct 2026 09:43:57 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5090050sm24998885a.40.2026.10.12.09.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:43:56 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] reset: introduce TC9564 reset support
Date: Mon, 12 Oct 2026 11:43:51 -0500
Message-ID: <20261012164354.3872326-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the reset controller present within
the Toshiba TC9564 SoC.  It is being considered the first version
of the series despite being previously posted as part of a combined
clock/reset driver:
  https://lore.kernel.org/lkml/20260918165234.687224-1-elder@riscstar.com/

This SoC attaches to a host system via PCIe.  It includes a PCIe
switch with three downstream ports.  To one of these ports an
embedded PCIe endpoint is attached, and it implements two PCI
functions.  BAR 4 for both PCI functions provides access to the
registers that enable or disable a set of resets.

Both TC9564 PCI functions can provide PCI endpoint buses via
devicetree.  Each PCI endpoint bus provides access to one of the
function's BARs.  Subordinate devices (like the reset controller)
can then be defined as nodes accessible on the endpoint bus.

Only one of the two PCI functions is permitted to define the reset
device node.

Note:
  Other TC9564 drivers have been posted together with DTS file
  updates for the Qualcomm RB3gen2.  To allow this (and a few
  other) drivers to be considered in isolation, I'm omiting
  that here.  (I can add it to future versions if requested.)
      

					-Alex

Alex Elder (2):
  dt-bindings: reset: introduce toshiba,tc9564-reset.yaml
  reset: toshiba: introduce a TC9564 SoC reset driver

 .../bindings/reset/toshiba,tc9564-reset.yaml  |  56 +++++
 MAINTAINERS                                   |   8 +
 drivers/reset/Kconfig                         |  12 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-tc9564.c                  | 192 ++++++++++++++++++
 include/dt-bindings/reset/toshiba,tc9564.h    |  26 +++
 6 files changed, 295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
 create mode 100644 drivers/reset/reset-tc9564.c
 create mode 100644 include/dt-bindings/reset/toshiba,tc9564.h


base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
-- 
2.53.0

