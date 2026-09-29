Received: from mail-dy2-f39.google.com (mail-dy2-f39.google.com [74.125.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603E35208C0
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699301; cv=none; b=Q2QTij6Tum0MFp3BIT77kap12y1akhX5Dr334Eh2k8SuyJdU3o8H6JhGwCMNj8H+ijGGQyKGDxC+oP15Cfu5G04m3QY+YPlHEdiJ5/8UJpxQHsC75QsGlyJO71op6Cdi9HWebTYFV+EMrFDxPzHphQBrF+r75yg4XvDijDAdQX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699301; c=relaxed/simple;
	bh=SzIosLDQg7snE9UfrT+BODzU4lO9sxWMvYyaifhgwXQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n1UwxmWEADtybc054Wv+X0el1uEZUuSjKXKtUPxrARLILb486VsM5Y57Trbz6CchCdljtPQfXg/jeoGC/pSm9ht69R43JoH1QnVIVe/D7CqQ2Y/OhzET1q83oLt+5xOyFbWgUESNKFhZf/drFnqGn9RsZN7Ol++oLzxHdS6NBqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=NfBiNLfv; arc=none smtp.client-ip=74.125.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="NfBiNLfv"
Received: by mail-dy2-f39.google.com with SMTP id 5a478bee46e88-34b3a9cd8edso440166eec.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790699299; x=1791304099; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EIUT7gLZI+rQeOH5s3bmQw/tw87mS5D6Yw6a8lMvT+Y=;
        b=NfBiNLfvFezRNZyPbzatwBdqeAYME0qXx4ugFjGTaq5+ZERa6AbWw6XqEWMVmm9nYO
         lNzPCoR7AKbuxrCsXI7lMqdPaZZP2pttwLveriOINRCKVtdQM/sq7bVZCUGzVRx5pXkV
         1fyGQ1w9AHHEXpLYWtZdonKFxPGXuOqjFnWbTPWlAj3Kv5vjicMma1DEYITp9mTuKWsC
         La31l6pTrK67od91fExtRE0hE+8rsCvdhcEYPh7QR5L1AltSfMEtIKQMglIo9gsywGx8
         ZfW827mPjTYbskyxXWso/wPod9scVVS/lGacIMhnhvvg0hov31oPky263Uocnru62n/Z
         KvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699299; x=1791304099;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EIUT7gLZI+rQeOH5s3bmQw/tw87mS5D6Yw6a8lMvT+Y=;
        b=U2/vivoQrC2zQ9jyyq2ADVPTnvU1BqXGwKvfBF2SaSpJ5FHlMeLQWL34mCpp8CtsWA
         uFeVM/UHTgHxpF29wBjWu4vjOJlOdBREVZVej3nEXiF1BAvfuDyw9Xgp5VP2uv/9b0/i
         8bGVp/qpC877rCL2holFgJob7vCxcn5+/Qc3GeFxyhOC4QBzfstlPWBa4gWNVbcVHtfm
         WNO8PtC1K+jvURDw5Yc/jLLbKcZ41iMbiZDIIePXqpr1NZGUOluQ7gJEdqakUg0rj78N
         povEtSzDwQIEZnqbz1i81v+tIA00Du+voFXlk54NuamCq6GjRuvklo1vSEHo4k8JlKIl
         usDg==
X-Gm-Message-State: AFq9FYJxPAUSfwJi81jp0hp0pVIpMTVR/EVWMdj2iVjJ7z0dJKFmGHEY
	G3y3ydRvh+5YXgQ3L3wWRzz6/3LKTzUWBoSlvwXfv0EpGBjviF5FUTG4SHEIXJ8E8tMGXYfrHn0
	U4uYQMME=
X-Gm-Gg: AYBFou1LrtJnoUWc6+evC0vyacH4ZtnBiu5s62TU1xuCc1ONDvuhpaUCpvYNowysANK
	HykDjWDRijw11pY0xZSVa9l7YYUycCUEpbdtUt9bMoKv95d/a2iUMPYyIqMipn+LJS+l+6Ktkya
	/YZlv0iW9FallokfKchvoFwWbYDTYIDoFuuOWZfzMbcEpJT5T4EDgwgQDqgkXqPbie95nFjvyFT
	u+cFuavXp8c4o10S0MAL1ab7z2CwpVPCyqT9Vum/LxNVuxWyb3mR/RVVo2WLO8hcRpNzHvrvuuR
	j2irSgqRcM1mMa77XmnpT4eOOQb8+h1Qd8vtcY4Jbz0ROG5jPRU1F50j35wj0rn/31Xuk94B0wu
	hhm+unI27JPBY0twxVa32FDi8wyQpU2FAPoEpcovJviU7uFoAcBgO4a+f4uCPDNBCy+NBVPQxFD
	iHMPd4SrmWzUZjCYIytk3nHE09bZemB248GKyFSMIDbaAvv+EBPpJS7H0RXRbzdHuhGjHINUXWF
	wLYTo/aX5Mc
X-Received: by 2002:a05:7301:201c:b0:340:f5ba:9670 with SMTP id 5a478bee46e88-34af4723c4fmr3538573eec.1.1790699299076;
        Tue, 29 Sep 2026 09:28:19 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c378c9a7fsm425590eec.10.2026.09.29.09.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:28:18 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 0/2] misc: eeprom_93xx46: add Microchip 93LC86C
Date: Tue, 29 Sep 2026 09:28:15 -0700
Message-Id: <20260929-eeprom-93xx46-93lc86c-v1-0-272791aac875@nexthop.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6DIBCF4Vcxsy4JIiLTV2lctDjqGG+BakiM7
 16qq5Nvcf4DAnmmAM/sAE87B17mhPyRgevfc0eCm2RQUhmJCgXR6pdJYBGjNmlGZ40TSpcSK91
 Yizmk7+qp5Xh1X/XtsH0Gct9/DM7zB3FciFp5AAAA
X-Change-ID: 20260929-eeprom-93xx46-93lc86c-2450974d8891
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cory Tusar <cory.tusar@pid1solutions.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699298; l=759;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=SzIosLDQg7snE9UfrT+BODzU4lO9sxWMvYyaifhgwXQ=;
 b=QH6GMoz2gvT8CuoOPTd/O5Ygd0WGNmy3k6SjZEqGtLZFlHWFV1LNXms5PFaGasY1VMiZJ9+/u
 OAEtqr+9EE6Ca/WtsNOBP03TfNgABXFtfCNoBMYHc+ulQ4FHO8ZZ1ws
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The 93LC86C is the 16 Kbit member of the family, 2048 bytes. Like the
93LC46B it clocks an extra cycle out after the address during a read, so it
takes the same quirk.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Abdurrahman Hussain (2):
      dt-bindings: eeprom: microchip,93lc46b: add Microchip 93LC86C
      misc: eeprom_93xx46: add Microchip 93LC86C

 .../devicetree/bindings/eeprom/microchip,93lc46b.yaml         |  1 +
 drivers/misc/eeprom/eeprom_93xx46.c                           | 11 +++++++++++
 2 files changed, 12 insertions(+)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260929-eeprom-93xx46-93lc86c-2450974d8891

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

