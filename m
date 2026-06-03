Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33A33FE355
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472589; cv=none; b=eZQH6ol4C5AnPvlkOol6yQ2qZ8YYehQmOCwk/sdbNJINkyGWWSeUuvKSnFy+UKVzpEE9+ZZgu0fFJkQ9GLHE0/1BZUe7IsJag72rvYn18TRxVgOWlgpgcZU7jzadrapPODVONmD6u0yiyjI7Vs6d3x+8NAWP9NwJmku3qRojhxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472589; c=relaxed/simple;
	bh=ECER6yND+rXJcVNHchf7OIZbPJfolmTGy5rnY0JixrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MP+X/r58F9wdSN9opamfZ+79xiLZq/xB9QyGO6l2jlky2Nmsuh+I1Z4yXtbtR2466Gsch8ZGP3LIJN2cbSFQ+2ed6vauoUWkt59g0cbsNfvAXgJ5EO5l+5A3atWO+l1Vg3JVrvNVPS/nRn/eSjSiXnfumyqyMcHSEyuGfRygNAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDF3MBWf; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDF3MBWf"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c858d69bde9so1752724a12.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472588; x=1781077388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5uEvdBhcYIB/N6I7KQE0k+DcpCP+2VfxIHfSY5Ub2U=;
        b=EDF3MBWf/ph2l8NhEldy7W4VVqOnFqEfEaS/oyV2qtuMxyFv7q6/7bddug1tyIz23y
         wVNA7ABCsBSBjRmED6v7SW5UBs+pM8YdyoLz1AEcbrRHdY+/HVmew4AX4iHDGqXWGtg4
         iBgqbGlPfHNWMnp0KUPWlUlD8uewj8H7Ms9ymTAHsSVu6byGI+lbyDjUeFnvnbXbc6u7
         ZQWSgiWCJyLxc7FnAk/xSlKegXJJ7vyj/v/kj6ezjUjEHNiZhehG9yUdhYond24cLjts
         LP244Yx3b+dbEaTmnZim2eMHOh4gHS5xWwjCcVaYnynzaM+7eei+WW1TU5gt0EPG/bja
         y3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472588; x=1781077388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5uEvdBhcYIB/N6I7KQE0k+DcpCP+2VfxIHfSY5Ub2U=;
        b=nNg94chxpq0o0M6TCgHkZHRzMrvjk1qQautkSsHiOlteeX0YNg0yLWe5rhxibG9egS
         iNbzngP4CEck6E6cpr2ySktlw74NjZKC+wg1hpWSbF8IYlF7TOU+BXz5D1+YIuY3cL60
         dRNsnqZ65VQq1f2ZJEBVnXnWKHW6sCIBi1Ic9EiciYB2wXhuZeokA8rFQR7sn2KrmPxr
         y3u7o6npqUGOPX6S/8mqiexGokvGLSoHppogjQXgh0ZyQ3cEmzeZvjTSQNX2zGBN0uPg
         aytjo7B9FGQV3rTwQiGplZ92E2++7ok7ueQIfgO3hJVQumCdNPpgWpxV7ariaOzdnNZR
         HY2Q==
X-Forwarded-Encrypted: i=1; AFNElJ92srgsn/2P7qFVI+EItzEIn5e7bjQmI6LKcmHkn8OKDxmMQ6hg9pG2dVrtv5v36UYb/yWyHpFu3wGs@vger.kernel.org
X-Gm-Message-State: AOJu0YwXn+Oe45V13V/RnZjTu7DEEQyg/2d55fBhw5EL6hmRPtgg/c2A
	BdQ7373KERBrwjRHHdL7O5g87kEIjnxiPafTQ9F/eNahjK3gXpzn9JASF6xqsb6DqNWuLw==
X-Gm-Gg: Acq92OEAtdRlv88vMRzOiT5qlRo5xWUgDTwqXJGWKdme0cvfbl2wj9zzAzAUrRNmJkk
	fTRAjC1mvZAGzClFtwGp3+0kKjh0cFzg3OU+MJl3lBriCFZYK5zjmFb48wIQwYSj7NrFTJUpF1+
	nNjkH47TM1XLviDEUi9IDOfFy8EWwXmk8mmmDbK+EEzok1joB4oJDDlnfI9UEb8fV0Co7LAAw+Z
	APEEsAAZ8S8/nagKhIMR7jJNv6WNueZKQTh6JA+OKlk+1u2KCjOrCkt9jaxDRtzWOzQ5rAnBuzp
	6R8LDQA6q8fuGDTqS2HHfiiKSFH/iG6zvKcew8QvjYqjCY6Sugi5/FQH+uDqGRV1mpSFtiaEG/g
	XA/w9pK7CdGjdbY+mnThADhLRwnPafIsWSOkNAK2AG6oNvym4dtR+EJdjBngQoZdWuYsS4ip3/x
	1uEHJ8pJVXEZry8cRfG3pf5W9HWlcDYJmHJJYVJRfOuhuPhwiIuJb325LGR3BkK7k4+wgW/l9jD
	7Tmc7IxWKDBu/Rn1gTIYlfMjn0psSCqVLvx4WdjKPWWbAxhuNqUAv5ORTk63CDW4M0H2osWDyc=
X-Received: by 2002:a05:6a21:a98:b0:3b3:10e1:a870 with SMTP id adf61e73a8af0-3b497646923mr2670209637.32.1780472587959;
        Wed, 03 Jun 2026 00:43:07 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:43:07 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/7] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Date: Wed,  3 Jun 2026 17:12:15 +0930
Message-ID: <20260603074222.593243-4-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Tenstorrent Ascalon microarchitecture and the Tenstorrent Ascalon-XG
core.

Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..2a57bd14569e 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -75,6 +75,11 @@ properties:
               - sifive,x280
           - const: sifive,rocket0
           - const: riscv
+      - items:
+          - enum:
+              - tenstorrent,ascalon-xg
+          - const: tenstorrent,ascalon
+          - const: riscv
       - const: riscv    # Simulator only
     description:
       Identifies that the hart uses the RISC-V instruction set
-- 
2.47.3

