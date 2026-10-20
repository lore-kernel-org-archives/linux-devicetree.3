Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501220;
	b=WTOm7EdPDeAPThZx2/F40DnSGu5on4XeowSUHZF81+IrrMfSU/Knv2tSZElPnbfen1V1
	 yKfmUdwYNbsJlRmDGKNuKBbMz2tSWh4CJEOMp8pzA3bhz5M8CnQnVR+73uUNKQg3rPh20
	 S9TCIT6vV3DT0ZDrNJZQXlDLhWqjH/0sbaGlv86e9N4gQVMff0/7QXGweUyH32gpdoKu2
	 i3RvexLn8Q3+pJW8PHvKQAH6cZMm+jmI4JZ/MuQixv9AoYRMphwrQlIL+/p0oytAxEa/c
	 Kd2UbCyPaDFmi923/vKeg2pCLWwGAMqayeSVB/oZSr4WwqooB1qLS4DIdYpXwRRqAPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rW8APe3WvjmaSlpRO1MnJJ5xQdZ7K0W4HoHT++1heEM=;
	b=0T3XGhRww+YOOTduAfvHiKscsp+fBEBm6p+ufBebGnqnbssxOyqI10k9qXo0KzaPIzyQ
	 AwgCgWpisEitG5Pg/clTeGAVUMzSVaB07kQRMwRVnLmkGWBvGkPTacsZKoOT4K2X5N8sE
	 4VfPu2+L2V50TlRl3hP7KJRdtM8QeaZWSDYpxQJwhS5bKOYYq1PQxQTFgoFgRcaOpkE6P
	 MxVx6i3zzRgejq/tu0KHHyImIc58lWxzESALymSrdUiXyAKzPdn+zDkKFUYIY8ryT8MIR
	 We1dTtvzRh877tLBCVhoqP8K7yXI/KbN48TfvJookSwKa1d1WQNHM6uVweOVEXsuNnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K59STcWF;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6A360A2620
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C6A360A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K59STcWF
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so32734525e9.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501218; x=1793106018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW8APe3WvjmaSlpRO1MnJJ5xQdZ7K0W4HoHT++1heEM=;
        b=K59STcWF/hql2f7NPHfwC602UYqn9bX++bWCBUJYEEDRIvD4MeshjckkJdr4QD0qD2
         3nS80R4GxGkav+NYb6BNr51Sez0+W2EXV4p5uxt0xRkc5amZXUlt8+m5BmP/Dsbzs64N
         sD0GcfyAnzK0o+ROkYg5IyhczqM6r1J07g7BuvLcmaBYkXzNYrT7R69IN4zbbNNTeuHu
         eXVWkir5zKeuua61pQxQY7MYI1xGVcq81zfd5xhu8H9HwSbOuAx9A3MaymTKhU60im3h
         GQD1/saxj/QwD2lflI3F7BXGBDltRhgEHd4GKUZubZjn9BZVS4YseS4BwFjAbvJUqv/C
         2xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501219; x=1793106019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rW8APe3WvjmaSlpRO1MnJJ5xQdZ7K0W4HoHT++1heEM=;
        b=0y1nAml25zYgqG5KTA/QpSwRqs3o72o3lbXWVBIXOBpUpV/wXrAZ5nO2Rx6dRFCERI
         8nsSAaGcDfhx9hl890h3uzSs8BXAs+4VtcT8FOVyD4e/YVHw5xBRSf9tChq6jk/6unLd
         a91bFaeeoFCfhNWvOqKRhG9tHF7JN7Cwv2Q1ZZOu0diG9bsi3v6GHvQ+7Clf4WPs+xij
         2Jzxaeo06GkakkgNuRDvgGPPZiA5k5iJ+tVvv+a0kqwA2pqYQtcgnc/AvprdqshdR/oR
         8t1U1B1Q1dqRUk1J4o11TyBaDRmatarZe4kxBDCTEIq7PQc46k+TLHVfms9nkB2VLTko
         silg==
X-Forwarded-Encrypted: i=1; AKwUvBzAn+QIFcLXYESV8QWfc5mElRzs6EQYgHPdytAd67QcwqHkoOWXV/fbVs8m19qo7ppUQ7BlV8wMhGyU@vger.kernel.org
X-Gm-Message-State: AFq9FYJDKSLkhy8zVYJoDkuyonX21V+W5u72aJkMnrMQwKv98nYVh6rH
	YtP0sgYKr0FQW4KXIiawSTas8/L2904xH8kCzz3yWIrli59Bw9Wipqfj
X-Gm-Gg: AYBFou3zvqvEQC7d8Q50P6qQuU3BMcdIVJCJyfCMj8KxNQq8qTfydZmW2Lug3An1eZZ
	Ny8Twvnmhc+cKTZatlEXvS8o6In0KtAMpLIf3nR4+lZwPFbLQZZWH/eb6HlGa2hKfM3Q92VOc6v
	G7H8NFLRfklf+EqH1OxRsOWvFtzcUX18qQ8vQVK//RI4CA4TvWnRGAE0t5UK/h9j0vFnjTy9Cd8
	RmRQUPlx0FuaUqLzki1vczuVMMzJkHtmaD/rlHnFXDwe14dIZbqrYpDPuHTESvGlVmTNAYoCOkw
	klghLWa4mLWYN4zewWw6K6+4aFkZMApJdRr/LFa1bVG9pV6Kuq4pcbdLXicZAq5k9WmpmYxcUiR
	qmXuYMK66jravBiAEZmyFS/g96/FqEKZvHRdKA1yPY8KlzFwrQKo1sCqxQ6QCFUOZQ5pfDBmP/w
	XFLhhHSGLoOKo1L78ACc9mpROfz9UpWXq6+j/BKA6k5tx490cVSovvZXPksB1aYcV7C+T0nXtW7
	Bpe3Wr67aJb7DW6WhP31NxLUNyonN/jtU24pXNmGc0se78PsG4nyNO2o9gasqeSnF8WA73WKw==
X-Received: by 2002:a05:600c:3e05:b0:4a1:71ab:63ba with SMTP id 5b1f17b1804b1-4a1d763625emr222865625e9.29.1792501218007;
        Tue, 20 Oct 2026 06:00:18 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:12 +0200
Subject: [PATCH v3 1/8] of: base: Fix stack overflow in
 of_parse_phandle_with_args_map()
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261020-fw-devlink-nexus-ready-v3-1-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

of_parse_phandle_with_args_map() reads the #<stem>-cells property of the
provider referenced by the consumer into list_size. It then copies that
many cells of the consumer's specifier from out_args->args[] into the
on-stack initial_match_array[]. Both arrays hold MAX_PHANDLE_ARGS cells,
but list_size is never checked against that limit. A malformed
Devicetree with a larger cell count therefore makes the copy read past
out_args->args[] and write past initial_match_array[].

The cell count of each provider selected by a <stem>-map entry is
already rejected when it exceeds MAX_PHANDLE_ARGS. Apply the same limit
to the provider referenced by the consumer.

A plain reference to such a provider, without a map, now also fails.
Previously it succeeded with the specifier truncated to MAX_PHANDLE_ARGS
cells by __of_parse_phandle_with_args().

Fixes: bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Link: https://lore.kernel.org/all/aq1CSswlo57jZpMH@monoceros/
Cc: stable@vger.kernel.org
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: New patch (Uwe)
---
 drivers/of/base.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index f63a9486b130..5abadab22392 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1587,6 +1587,11 @@ int of_parse_phandle_with_args_map(const struct device_node *np,
 	if (ret < 0)
 		goto put;
 
+	if (list_size > MAX_PHANDLE_ARGS) {
+		ret = -EINVAL;
+		goto put;
+	}
+
 	/* Precalculate the match array - this simplifies match loop */
 	for (i = 0; i < list_size; i++)
 		initial_match_array[i] = cpu_to_be32(out_args->args[i]);

-- 
2.43.0

