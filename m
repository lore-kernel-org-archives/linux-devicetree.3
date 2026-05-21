Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2203D280331
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376073; cv=none; b=CL9m2vNo8YBqRmP7FMgY932DWi76affnb6/laVAOjQvOXr8KNK2lkpWkaxzfp9h4s4xGLKh4HocqN2/MSQ/lTTBkTvfjAnrKPgonmB6kog4/TsKGavbxZZCQ7DPC/DPtrKN9x4XdyGw6V9tU52iHUXh+DiXoidXe+yNh81d7Qbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376073; c=relaxed/simple;
	bh=cd3dKYTuIZtproMToprtB8KNI0LgkvRevMgBh5hgm6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XjeFYhdu+Tdfru0hWXzN1c5LMMps4tAeIAMVuTDVuKrtXBxZ0LCOiHitAYHMKWgpeB2p9yu/R/ggIO8hIOcexH3ku73UjxkhZb7iOSUkPy+n8I/dfE1t7yKZUG69WViZCEiOv8caNS0gWxlVs3Rrn+CZr1RyHQxLjQ3oIFvunmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHpnXSAh; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHpnXSAh"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-65db820588aso5293110d50.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779376070; x=1779980870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WjKxID8eOM6JKjQ4xHwsGmipvQwbvP3kOWH+IvP0XSY=;
        b=JHpnXSAh/+6w6M6AVP782QAHcW/uoyrcqXk7QyULxV3SAHJbsQ5vHvV4v9fTJKzyKj
         7jLl4RQQiH5k6EETcar8UFyMAslcLbwO7gpQkZ3vkIZUDDCQhXilDSH0pXsWOVxR0GA4
         xvYGK8inLNPmoxFiSAHlJrT5C8/dUpf866WplMIcDoY4avttoDLqVM+u46AQM75aHOE7
         /uJ8yZzkZugndhm0QP/LEJl82r2C8xH1FtzZ+ySseTRyTaRmjBE+oCU2zL7I5gh+Zuuo
         ZNRNRR+9eGdEKp0FU2z5x+xrOEGV7z3duna8f9Uco1zgaXPAMnZchBkypQ44CVHSHBci
         2K9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779376070; x=1779980870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjKxID8eOM6JKjQ4xHwsGmipvQwbvP3kOWH+IvP0XSY=;
        b=ezSiUQAyAmzydD8KDQXmJEc6w8UW49bOp98Ldl+GIoc8CHUuEQs5UXqwxomQXqWapS
         v+GPHnNqAKJw2PrY6ADg3sijBBGALcUon4YnRMTiQVQMpK1IEdq8zr4z9UNvoqOjdvuw
         u5XMyZpydwWK68KT2Ab7bEbKODHbvuQvRjo6W1C3KlUMXJ2bdLBbccgWNDq3jE1fO81O
         5sF4UQ/s6jHW7YTiit/sBVxwzJEw2dm5+iTvR5V7VBqLjnTAfHrj97anwGIs+qqyxPDB
         XJ1aZw8A3gkFMSBMZe7TVLVbOnIoCH4DiloPC/okoRYAFhpjaAR0zmHROBcNKbSOH52u
         2sOg==
X-Forwarded-Encrypted: i=1; AFNElJ+OsKVmofv0od1fHwD6jVP74xVLU9bYG9mlICDE1Cm2wNaL81wP2ScEu0v7SVXBApDur8dnebCL0JCV@vger.kernel.org
X-Gm-Message-State: AOJu0YwDkReTcVvqJMpBvXDVKcnW41HR3ENnGbK9Rdk87BIYxI1mmr5m
	x9QX+YCeKB7013A8Nx7Oemlf9wjcc4Ct6uvR3+DRzMb3yNaBut2uTyfZ
X-Gm-Gg: Acq92OHt1FTPhVbzT3ylr61FSPhFxlg9kXScAcQCwMQ98ZCF9M6nrsO74yM6Xsz0jiZ
	1jq9QQmnrgSs+LEJsI5bymEpVyAmXPZ6mmZCB5YH/1V8MKD/8m11wHpTiGrIYqDSE8NFWFWe72a
	JxbZEhqmjo7CJXTZ+iF54OXbdRt4zlk1jBOKyaX7sBCV6xpLD02zgK192WZc5lEtcH6tLAqSLXw
	z53w+4MkOxqgUTOqN2Lk7fydCtkdeIjwklI4xdWrgV81JZwEul/KXGva769MWAUt6argC2ojh56
	rdvIoghZdifV5MNmxgPmubzaujlLaknBAC2RqsNIm4dWcPfKGc3BFj+sPc3ERJ/LQSb8NyG+Kxq
	mtU+arIzKlBLU300EEOdCvQ8O1D32aN0R+O1oJJp5yJxc84tMvJ4F/bqVU8o28WN3OppxeA4vd9
	paIVXtGuucfk4jwl/JWpdRzEXWnYMR42B9KYlcJ2CGIoGQZnHD7Uax
X-Received: by 2002:a05:690e:4812:b0:64c:f7d0:5c07 with SMTP id 956f58d0204a3-65eae047184mr1880107d50.10.1779376069874;
        Thu, 21 May 2026 08:07:49 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65ec1eeadd3sm288264d50.10.2026.05.21.08.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:07:49 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: serial: rs485: remove deprecated .txt binding stub
Date: Thu, 21 May 2026 10:07:47 -0500
Message-ID: <20260521150748.4816-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The plain-text binding file was superseded by the YAML schema in
commit d50f974c4f7f ("dt-bindings: serial: Convert rs485 bindings
to json-schema"). The file now contains only a redirect notice.
Remove it.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 Documentation/devicetree/bindings/serial/rs485.txt | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/rs485.txt

diff --git a/Documentation/devicetree/bindings/serial/rs485.txt b/Documentation/devicetree/bindings/serial/rs485.txt
deleted file mode 100644
index a7fe93efc..000000000
--- a/Documentation/devicetree/bindings/serial/rs485.txt
+++ /dev/null
@@ -1 +0,0 @@
-See rs485.yaml
-- 
2.54.0

