Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E545D917
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363322; cv=none; b=ryTtj0Q8j5YarWae53IkfTrVqFa2EgYkYScjeEeUARJZ8xJFUhM/7TzlDOJ+S8iyYFPwALD+J94IBfIJCzYjsx91uVpqy1vlwMjO1Bd9UgbxUFgd/KhND9+FbOkpsiqAaxX3MFe5beOGMYUbIyv3mgv/8YdTHKXS4sU/vzryZQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363322; c=relaxed/simple;
	bh=jb6jpreGOIyr48SUDqS0HCjGWA7C8ZqXlCRzJV5SGPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpO8D4inxI9uPSzRaCa+o1fva8azc5zT/VBq+7O0u3HYxSL/y6Ixo/7kmtAW8PIsmG9+Yx2/fTVH8TPza5nCE4tPgYKeYmaKDKdAFqSidNo/7rcMpa4Ti/ExCJh/vvpFM54aC9N6JGeYd4wRfQUlu3FO+NKWUOMNSAk1Jdm3D0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBqI5zjK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBqI5zjK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so25928345e9.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791363319; x=1791968119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mn1vqowBmODcdaMp0k8GlavW0JEdOf9GypT2LbsFIP4=;
        b=WBqI5zjKu667jrw6A9OSVNj1UlSPIyh5nD6Mnkqc/h4h/FbIRvLfy5MltFLY2cT5/h
         s7BCcqD4eb1RuEqdkbr/9K4zx2pvAI7ZOM7Pc9YLWDspfH30soUfJQOY6pBr7Ps9mdmu
         C/d+HIM/DIsMfnUt62/p7Wp6UW8e8GKutoG87np1OW464+dYSt9CZXljjqRAzWqp+yz1
         dMp1QfritKI4oEP1XB2b+53mjkffcv4AcrdUQ7EmUUNsH15w+aoKqCVXQhq1I4Zi2ycu
         PIUW7Z2fPlr72BHh5JnjQrKmn5i0JEsW5J/pSnkGgjiUob3vPLIauuyACRkOVN2LQXCS
         Ra0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363319; x=1791968119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mn1vqowBmODcdaMp0k8GlavW0JEdOf9GypT2LbsFIP4=;
        b=DQtIfOlKaajx1djaAKLnXa1rqOn29tD9shqugphWX+LwlrB0WQlPHLBqhoKFIOEwDU
         YiU4yDPB3muZFZPtKlL4cA6SgnI1WFB2cZbERV8lbkeiKJtBCkz53Gvdm9MN1HW/zBnI
         ipfX0ZTKH5hpVMbcSu/6M3QrYT6GSU40ROqw4LQqUmmQO0DAcNJibBdubb2obbMtU5gT
         MTx9VXYaqXB8TrLfX7Wmo7d7tq6FnrHieTRkoyruSSmnVp/GOI+aaXQzwGA5b4R/Klre
         yfqXCSHdq8YeuaAF68/2jy7FGTRooAQFZV927OUuojp2dOpSrWfVmlJrkssDlBh0NB5R
         HNcQ==
X-Forwarded-Encrypted: i=1; AKwUvByL5ktuEdY8L08zgVyJmtG1w5uKnBNH98qTo7AOwUZh14qrVI1iv0esyzZtE/AwnKSl04j7EqTxjjEy@vger.kernel.org
X-Gm-Message-State: AFuF++n6ByPN4cFHAghPZx7JgiNsAuZuz21Lx4P783XT/E5we3XVy/CZ
	X7HFMRQUqEa96pPdZ6oZVsX+EgMaNDs9mE0gd6a8lWcIA/I3tu36jRRd
X-Gm-Gg: AYBFou0jWo2l4+n822mVE2yYgwopOdE+NFrjg+G/725Ya0FNUxgWVZqQue2tnmiqMvA
	SdLuFTqjv7DKxS60bmyrrirhbSm9UPBbgB1kVik8mDnergFFea3dgV9FEyYG5DnHosjZr5hAKc4
	oIU+2cthEXMlwl4/Z+4LClF3/MHDzTcdncGGXFsozIo9pT4O3y6P65W72T5HEZMzjrK4DrcqFCT
	oDiKX6p7d05TwS3zasCfzA1IwjJVtB0Pbx6ea5vYNaGHPwegwZfmP1607F8l97zKefGv/8SxbuK
	vu+w14vmUTFiwdP9nwoosFv/3w9PgN+M8STh1wIZjIgrb8qT0neqTYoZsYSnliVxn4WaA4YtwUM
	1mSnJDh/j8WP8+dD7G/+2gr12odnt8xetLoLY71y5FDb+wj42+Sf/koVzq1MWe/Tt9JqWu4Mjp6
	Xrgs83ok+e3NLgrWCnAwUjSWq78zJaC62ufjZy1/iRpr2CWnm86BKg8azM24d/V/XvecNlDquU6
	AONMn3jNVqTzUn275WtvIDSTVQsIQ==
X-Received: by 2002:a05:600c:1e17:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-4a180310dc1mr23212095e9.14.1791363318985;
        Wed, 07 Oct 2026 01:55:18 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm81709225e9.2.2026.10.07.01.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:55:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document FLINH pin
Date: Wed,  7 Oct 2026 11:54:56 +0300
Message-ID: <20261007085457.98762-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007085457.98762-1-clamor95@gmail.com>
References: <20261007085457.98762-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
inhibition.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
index a65d92522c9cf..596b5e284f44a 100644
--- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
@@ -31,6 +31,10 @@ properties:
     maxItems: 1
     description: FL_EN pin
 
+  flinh-gpios:
+    maxItems: 1
+    description: FLINH pin
+
   led:
     $ref: common.yaml#
     unevaluatedProperties: false
-- 
2.53.0

