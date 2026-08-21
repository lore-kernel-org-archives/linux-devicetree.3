Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A847499F0F
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320701; cv=none; b=EaX0VYyF8E3YqpFzTmIubXI8Hif8OQIZdlZfIsevxV6qcehP4MpqJYMrHsZ7jDL+2XFM6bh3mOuQZrbOMgxRnMN5+ZhkaS0DmpNFoTn+vixg2ArTEp5coDKTHAOQxoY8+4CwTAOlPT0tVFKhSc9NR8m2Kk+eNNnycbhrd4tzH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320701; c=relaxed/simple;
	bh=UPDJbJGCBOg6+lUDxPQ/+xKfCV/KTrJ9OCvxOLU+LNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fR0lRQIRDs3RhlkluynHqjQahZCeeQ0dc4eDzbBTdsff8eeoRYxE0rJnh/QBoKcXDD21GTwk43LEB6dLHxwHK1k2+3En+SaUfF9tYP0GnKZVo+4F4VGNgblKvhKQPf08TqRfpywfQ9t5nGiv+blO4Bb0p/CxaZrHfNG85LF4tn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFZRhpen; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFZRhpen"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc891373e0so12180145ad.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320699; x=1787925499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYvzNltPmk0j/AWbkVpb3n9XCUKtHiz/lu4CDiEtMAs=;
        b=SFZRhpenZfTxxR4rr4HJ+DsDcZ/5jxD0MOnVAaH1dQ+UQNxJ/c4ip50ba/TFiGf+uD
         wEKJIcxzmq4XsUOUNxjWBmu9WUKeMcx9K/PEOa8fH12I5cJUXc/8n1gAeqznWUB/69cF
         GcPhnxQjlJ+xyY+JCDd/WB89eOiKkbYe256mPMK23xqnX6EgBe9PBImOMCxmy5HGhIJC
         MGnapZm9cohfSrkVh4/tXN29+E155fi8YmNFFOsKMGu547G2RK/fED3IatVvvATV0u64
         C8NE8oWSN2hPrYcgWRYy8I90CtMCCvj5J/0lFSHHLPGEpgW3mhuhvyIxVDIAhzVWS1DL
         PslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320699; x=1787925499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYvzNltPmk0j/AWbkVpb3n9XCUKtHiz/lu4CDiEtMAs=;
        b=CA3iMLCHnO2VBw92nmDkiuhud2gTPZ6NRSI5aCp+ZFspAOkkzSyMME/nSmFfFUNR/2
         naiXFp0fKEOIwo2/7SR8ZrLugTdN2RgCpsQBJC3VewV2sC0Nfw8EOlqFO8SHid09KgwW
         fKstJtwdDmU0K5ngpqyqWB4W8P07tQF0Dmb4sq02tneURD1gC+VTAOAjohxuM0jNkxIW
         L6WihyS7Ndvm62XF6yuim8sRg6mUMTZhxutAaAVAssaourKNd1TkO5WOQsBfE7dKcA5L
         mjiOlk/ygpoMDvmZ6TXMfjsjahtO25sx9pr8XUkQZT8CnHlM73gCzXWlr+ZVjt4VUnX8
         f0xg==
X-Forwarded-Encrypted: i=1; AHgh+Rql9Xc8N463HYDjRjGu2fETLdJsJtXLgsMx2U5DXQxqMUdQtm6qfUA/0lK9ST73XGfcK9v8czLsLF9z@vger.kernel.org
X-Gm-Message-State: AFuF++l6yQa1F/kj+M/xIHzb01x+I3FHQUMphMwcxJEAi/gUXTktYAUg
	baRc9TZqkOwWyD71wNBJzpaCPaPn0ML6kfKc3ydGjXVSlfFfW/9gDquF
X-Gm-Gg: AR+sD13RI8EFjNxi31DAkfsZ/2tQPvtNcKeLTTK7ssyYTc7lV2ZmGAKhTcJ0hbVaTV5
	lJXI3ZItIFZvHy8C4/fT9bNcbN9egj44jvcWBgwTUCGOJRq/xMLoWHG/7KNDkfCiWrS0MS2lAU8
	u3FgAgxacZ5KzjM5HVwUVEtvHnxvAGO8oBIkseZhxkq9OIgCUOYmL7vPnr/YRdINAsXqN+zCZqG
	JPa9PTkwViO+jhL1PErn69x0Vfw6AaAl/ynPLBxQYmGbxzEOxMgVSPCUem6NTf/PrqFdXy6imqa
	031RQnGS1+EMFbeNnj6KHMVS6eOUo/kddH0Wf/XYoEXHaTP2k4ko6UJzBot1JM5ILb+Z4LFeM0w
	GWl/G0TwkmDG+JPknky57Kwt++gOpv0a9rzRs0TaYM84CZaJvYV5U5XA/xZjuENRM3MIsxZPkfy
	Frdl8uWInG6o8jNvnCMBewq0dq07v0GdjRN90JLmHiCN0jQDHC+u9jcSjRoupKgD5PYlrUR6M4d
	WJ/mHWF/3IKQAdmCnNXjx6TEDY/RhRaPtSmS2NGps5Yh+tnesq9nLsUdLLqVWO0KeVIiZis+Wdz
	3xQUaLKeFA==
X-Received: by 2002:a17:902:c948:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d64af3946emr118545095ad.5.1787320698880;
        Fri, 21 Aug 2026 06:58:18 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:58:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 17/17] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Fri, 21 Aug 2026 14:56:08 +0100
Message-ID: <20260821135608.275233-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the RTC block found on the Renesas RZ/T2H (R9A09G077)
and RZ/N2H (R9A09G087) SoCs.

These SoCs integrate a closely related variant of the RZ/N1 RTC IP, but
do not implement the RTCA0SUBU register. Use variant-specific match data
to disable SUBU support for these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Renamed rzt2h_data to rzn1_rtc_rzt2h_data
- Added Reviewed-by and Tested-by tag from Wolfram.

v3->v4:
- Dropped RB tag from Wolfram.
- Added OF rzt2h_data
- Updated commit message.

v2->v3:
- No changes.

v1->v2:
- Updated commit message to drop reference about RTCA0TCR register.
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 75713e7b045b..fab8213c5244 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -522,11 +522,16 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc->rtcdev);
 }
 
+static const struct rzn1_rtc_data rzn1_rtc_rzt2h_data = {
+	.has_subu = false,
+};
+
 static const struct rzn1_rtc_data rzn1_rtc_rzn1_data = {
 	.has_subu = true,
 };
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc", .data = &rzn1_rtc_rzt2h_data },
 	{ .compatible	= "renesas,rzn1-rtc", .data = &rzn1_rtc_rzn1_data },
 	{}
 };
-- 
2.43.0

