Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB2942376F
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548595; cv=none; b=c6FMPcytyh4ykZH9BxMw5an8gFU1Gh42DydMnG6ym9JG5JzziOwMXsFqidmON1cDxV+zIv1srt2MmTKvIRNO2u0SP4edv07EO2hbA4aYALM5xw5pNRfrOtPF3gAmrw2Rx3G6zGkajMDQwrwMwQ/rd3YjxqyonbAkcpwx2P8+DLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548595; c=relaxed/simple;
	bh=UNJv9lvrdAaMKo4znGMIdBsuP3iVdeueDxYAlJd0x+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTZanVojjlZo56Pv3rWtbjj9e95k+ZZBb9q77oe/cTDMYmkA9gtjW95lXXZBBhrmqFzuW7/viuOvFDqI45t2a41OC8cl0ARXqXK1yS/wwpszN3jNYIX3dz6wdH4AgUwCzo82wE/VKGzM1UZO10GtMtm51nY/qS5zKpaNuK/DnNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=I1/+rlfY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="I1/+rlfY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso10700055e9.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 12:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788548589; x=1789153389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tu1Vd9Fy3KvBC8Ugis84GLswT2AxZGxIE45TX7gUkfY=;
        b=I1/+rlfYqhrOBqqk+5AUuj4SRBYZ8fZTB9H/xYRafSXUTtlOcA2pF0CU1oUsscUZ3q
         kLMO2op20yg+jNd2Ak4R7fA06woK3Fnkjv7AWYIdBJZiN7vNbOzlgK8qEffbixiuPuKd
         pxxN/2D2ZsNiziPlgy2MzfojhcFX+P/dEcTje556APW9swPeMOaGKKSeKLSSi3fYzWID
         91Y0IPBwI1t1FaO5RPrKFEb24qX7wQk9qMpuryrkSyLZ3HtNTVMzIl64hKDOb5T1KMGK
         veTexRm4EkTSPoFD4jkwOojjT88zcepaBE63QfShn6PszNKhWUaCBx6AuNSgh9UTYf6c
         Nk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788548589; x=1789153389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tu1Vd9Fy3KvBC8Ugis84GLswT2AxZGxIE45TX7gUkfY=;
        b=onSb1weZ9eO41YCVieOrSoeSoV993ccS88cO/Q9RJiPP6c/3zCeMXhrKZAS8SSGKfZ
         ctfeK+slP7WRm4yKg0jK8vAHjiMw1FMH0KmCWhfup1SZvV5f4qpbp3TspFnYYeaf/e9F
         qdemSh3Ek/xeKJ7tq4I33Y5Lr8qhILIGjmSJkbphy72HHxzB6PQEf6A/zB9L5VeeYOKv
         uVjCJfEr8rqAhhw511X5jSCE17x+a0H7o7U2bU0uECwUwcDs9YXNLMbRYx6TuQOyclpU
         E+fy9VIsmfcCESLH6yrkukxKC85QZ5ZWXx6JQEnLmvHV2Xffj7m5eVgVnLskGB3AvcG2
         Itag==
X-Forwarded-Encrypted: i=1; AKwUvByd1F8j4TYT6Gpv0oBJpWVNXDvzf5mSAHYYHyjI0tRpfW7X5U2/ggORxt1sPD4JkpRFfLTNU811oyPG@vger.kernel.org
X-Gm-Message-State: AFuF++m/1MHKX5H0w2IJbpGZn5xiG+jQ8M+AOXCOpEUMIAD/FMZImWR9
	JIfqEfp8yyT8KEn0bHMbQ5tHIgdfR98Cpsgt5gbxQK3zsamoQY9c4YDNS9VrT/fdOTU=
X-Gm-Gg: AYBFou1oVm95DIWTXwQ2x4T06m/LhofPg30gV4r/GoA6sSo1tMV2x3WPRaVVzJpmqvg
	aY8yLXi2fg/2Zbt73INJ0u1EsaxK6+UpG8hNNrUacBkV2+yDlf4WCoBUiLibFG21pj0QF1qk9g+
	VuRU2zNPu8kKsZYxmzRDUyu/8uUVSGON/f2E5vR6Djpdo7gKZ+HSC1NP01yZPJ1FAXPJAEf3N26
	NoC3ZVGM+6L6CqwdSaKF4/NoUfet2WfesQRnA8cAZgllWZGQiKM1rcdV1i+QX068THci2vdeXPP
	FtnmD70Xcvjn0gVOCapk8AplS2LKouiilLfl4UdKEe9oDkDcEhEP0hdh1cAmKOhs3lKIR22v1by
	NBAJNd2iS0FgAVcY78YgYuCzSbzYMEDGfR85Q1iJHuhfXGv+Pu+dSb49lGfoQND10CjoOLr8kIi
	a2wrjAhmZd1u2IRU3HFu7ao/bwSV2YdHsz5fuEZdU=
X-Received: by 2002:a7b:cc91:0:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49cffa00196mr22006655e9.6.1788548589176;
        Fri, 04 Sep 2026 12:03:09 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm172195485e9.10.2026.09.04.12.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:03:08 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next v2 02/10] dt-bindings: net: ethernet-controller: add phy-needs-host-firmware
Date: Fri,  4 Sep 2026 19:02:56 +0000
Message-ID: <3d0ecd9c0bcc28fbbce6f7df2b6995f2e8c78431.1788548229.git.f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788548229.git.f@lex.la>
References: <cover.1788548229.git.f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A port can reference a PHY that cannot be identified or driven when
the controller connects to it, because the firmware the chip needs is
not in hand yet. Such a port is dropped at setup and stays unusable for
the whole uptime, even though the PHY works seconds later.

The flag declares that the PHY behind phy-handle is expected to become
usable only after this controller has probed. A consumer that sees it
keeps the port and connects the PHY once its driver binds, instead of
failing the connect. The prefix names the entity, like the other
properties here that name what they describe rather than the
controller; a PCS needing firmware would get pcs-needs-host-firmware
by the same rule.

It sits on the controller here because that is where the waiting
happens.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 .../devicetree/bindings/net/ethernet-controller.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 1bafd687dcb1..ce4a7a6f605f 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -108,6 +108,13 @@ properties:
     $ref: "#/properties/phy-handle"
     deprecated: true
 
+  phy-needs-host-firmware:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The PHY referenced by phy-handle runs firmware that the host must
+      load before the PHY can be driven, and so is not usable for as
+      long as that has not happened.
+
   ptp-timer:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
2.53.0

