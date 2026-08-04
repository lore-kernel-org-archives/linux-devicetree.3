Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04562443E2F
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 20:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875931; cv=none; b=AGEmswxJhHj6l85Ysg03FegS/SbEi4H4L0qLTLwxGqttZJAAegcELVpQ9O/H3SdTNHFyAdg9ujO5RDn028wfhS5jBIl9fypMuydypT9/PRJQqQP9tqqL2jWKmKCc5wHfD8861LJQ4OlXS7hPy5E+XL/0FXHCKNiHSc/1VgBrpY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875931; c=relaxed/simple;
	bh=8l1zVfOtDz6Fv6M98AqmBmVQ6PLl6VxKZNWk3zHg7ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l9CDA87OE6DfZ8bRKblBpFyLuq5v5CUYf49Bc8uQyESoxkv9MtUl+Pt3v0kCMwg9J74yHudk2gnkpSN3kJf5YgVRcpxyKons8KYd4KlyWucr4j0AC3fLfq6J1X4b2I+5hT2UzPAtxWn+UBlscoZloRxokwtKiq477e9hoV0Kogo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aNjiHHV4; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aNjiHHV4"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so213203a12.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785875929; x=1786480729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Cm0o5pSKvIq9BkZzksNpB6hP3AfoN9U7j0B/vXrrZw=;
        b=aNjiHHV4jjRaOvj5je2PCjk7Sng48RkvayU07To+drfD3gqYMFjMxaH0YB0+TRjAYq
         3XEYTkOYdpBVlzZyQXFCYmwTCdm0ExZtgtOhQBSRUbN6o4QbKA0YD5GizbuBiytY5z+7
         9BtlaX63wCtJMx+PhM3tGLXBfy87V/AxI6qVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785875929; x=1786480729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Cm0o5pSKvIq9BkZzksNpB6hP3AfoN9U7j0B/vXrrZw=;
        b=aA7Jk9+ND83jCQAdlwgWYVPNtgPkqnf7qLJ68yfzsYG9lvI/4GEAn0CsPauofT6Aj/
         i6XIuXdV15avSEbFySw+TNis4LuidRR0EW7/RyygDktw9C7stTTjtX9Z9i1hqjahH0KY
         s1Vw66zrIyJQXiGWwjKH3fBSOjgyEbM6xyIKuQoH/1NMYNqK83KJJL+4U/iGhwPjfsSD
         eTkyGsd/X2N/fjWVWEg+icjSMMt4wa1eq8T11Ziff/gWosTbaDJUO9aC62t7+FAow8mv
         0jX4WF8jOBNrRM1HYEDiRv5tiovQ3ytQBuqHArAYirqqWljThMTXBLK7uvqky6ArY+3Y
         n5FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpdv8GFaYUhTL1+xn9eFTLNrWQQhzIgbNGL1zUZR/8mZrHE8J0X+XVZQokSYxV2UrkTIbCl4wpPxFyI@vger.kernel.org
X-Gm-Message-State: AOJu0YzYea/Zcyb8VofoFVZzds8W4KaKyIL7FOJ+pyC/bPXupOOPBYRC
	NzcAF7I+Uypm2SJag4T3UYNz9Fjc5KyCM1RoLpricberucf8/ZSl32gWrj2ctPyEiZoCbjQd5nY
	Drr0=
X-Gm-Gg: AR+sD11ZKZp8pH4xkBD5UdpgXlL4ielrrlF9K0gfOk9GRgXiHFK0UvEQUSo/IrmZeJk
	RE/oFLjyvHLuLb75lTSN9tnT+2fTt7OuKoFuDK1yENMmAxVdnYyT0LWFvFx1vU1doYycGkfmuaW
	RnE/xWUXC81N0gDCi4fvk6PmjxijrkCS82f5kX8zbYowsoSmVe96Oh+9EekyHKoiKawe3Q36gjB
	C8Od63Kq09NfvN1XgpAf3B51++qD5Q/teLtq+p2TRKC3eR1EOEWTWneU0fp/oomPu7D+B2/I9r0
	CG7PcO1AGA34460wbLjwT8WxUr4tyYdIPCdIBNtDG7N1jjgbTTMR3f1KIyzEw2WGTZRS97YU5C+
	18L4K+ItEsif4VA+Fu12cFrczoMRMFjsk+GHCDaHfLaKqbFBjbs+O8JoWYaQxQ1F+MipdI0xLc1
	1+EI4GW1Xl0O55MC6FkKuJgAuFdUjshX5lfKGbftSSk9aginhGG2Mhteq9ENi9XeLDaDGe8gyvO
	ZYdu7VzefT7CsjvA4EZpkgeTGIWQ5h07uVNJI1P8vy9P+rCIuQltGlaag==
X-Received: by 2002:a05:6a20:4305:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3cb85bc7b77mr1499766637.0.1785875929395;
        Tue, 04 Aug 2026 13:38:49 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:4222:542e:5738:c23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586162e80sm8528202eec.0.2026.08.04.13.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:38:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: Delete old 'mailbox.txt' bindings file
Date: Tue,  4 Aug 2026 13:38:05 -0700
Message-ID: <20260804133801.1.I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per mailing-list discussions [1] [2] [3], we want to delete the
following old file from the device-tree bindings that live in the
Linux kernel git tree:
* Documentation/devicetree/bindings/mailbox/mailbox.txt

The old .txt file did have some descriptive text about what some of
the properties meant. Those have been added to the dt-schema
repository in a pull request [4].

Link: https://lore.kernel.org/r/20260722140214.GA548057-robh@kernel.org [1]
Link: https://lore.kernel.org/r/dc7a2041-50a4-482e-9930-566bb3fd1e72@kernel.org [2]
Link: https://lore.kernel.org/r/CAL_JsqKVjQ2m-dzMUENQry-f_YE9QrYSOKoH9CPj1gjj8XkPRA@mail.gmail.com [3]
Link: https://github.com/devicetree-org/dt-schema/pull/202 [4]
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Lee Jones <lee@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/mailbox/mailbox.txt   | 60 -------------------
 1 file changed, 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
deleted file mode 100644
index af8ecee2ac68..000000000000
--- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-* Generic Mailbox Controller and client driver bindings
-
-Generic binding to provide a way for Mailbox controller drivers to
-assign appropriate mailbox channel to client drivers.
-
-* Mailbox Controller
-
-Required property:
-- #mbox-cells: Must be at least 1. Number of cells in a mailbox
-		specifier.
-
-Example:
-	mailbox: mailbox {
-		...
-		#mbox-cells = <1>;
-	};
-
-
-* Mailbox Client
-
-Required property:
-- mboxes: List of phandle and mailbox channel specifiers.
-
-Optional property:
-- mbox-names: List of identifier strings for each mailbox channel.
-- shmem : List of phandle pointing to the shared memory(SHM) area between the
-	  users of these mailboxes for IPC, one for each mailbox. This shared
-	  memory can be part of any memory reserved for the purpose of this
-	  communication between the mailbox client and the remote.
-
-
-Example:
-	pwr_cntrl: power {
-		...
-		mbox-names = "pwr-ctrl", "rpc";
-		mboxes = <&mailbox 0 &mailbox 1>;
-	};
-
-Example with shared memory(shmem):
-
-	sram: sram@50000000 {
-		compatible = "mmio-sram";
-		reg = <0x50000000 0x10000>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x50000000 0x10000>;
-
-		cl_shmem: shmem@0 {
-			compatible = "client-shmem";
-			reg = <0x0 0x200>;
-		};
-	};
-
-	client@2e000000 {
-		...
-		mboxes = <&mailbox 0>;
-		shmem = <&cl_shmem>;
-		..
-	};
-- 
2.55.0.571.g244d577d93-goog

