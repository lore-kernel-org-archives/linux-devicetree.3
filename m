Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4476051AFD1
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686135; cv=none; b=m5OcWGRvGrC3IrqO/SgRT3wBdXC+oUBLdPXYbFrfX/kgGjFD+FUPvw1g1UBY9AO0Oz9Z63qIEnhwaxdgCjgt+mnqD/vSG+4juREmPNkVsuq9fXkH6Rr6/Byu9temJe6NhUO3W6//3bzdUUdDmpVBB8CcXHKjmUXGEo5Koq8yIe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686135; c=relaxed/simple;
	bh=lSvtUglAx1rTAxF63r2sQiaH4fhCBzuyiTNiuauSmaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ycqbfy24/FkbXECyYvBLAXh4AivzlYsdAyR/wqEm33KMj7nqkmpMnYt7S/TwNp6HzuN5YJD+/YTGXxUO5TpThLAvnTXcoY/frL0M5JyCghoFChlXbcNRYsl0uRiZr9eIR0ORFZrlUfRa0atqdMgSe1WkOC2HeHujU8ZB77nWB7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFZHQPpZ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFZHQPpZ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso3257096f8f.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686132; x=1791290932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epA+CdgHUmlYYpLGEczrqq9cajap1pyqUy7Xk8YH2fo=;
        b=ZFZHQPpZUvy9TEu20hbFjtKkm/TrurU4SmIUOVJStUxCpr3vmyiuT1nN/EmxyAxKv1
         sFAG6pLa8PCJHWlpUTojcjR07vn1lqKjmJhXcyAgJWsHLqmD9b4tQlX0Vv3ix6tjMii+
         +KPogZ7ASDKiQg6hEjVxKCq6JcY0T7V7MIJh7rtpjMtSDcpmPKEQuU6LqGvuk51fXgKN
         CQq1+JklMehnSpraYkmUyJOjOtR9BIs/nJjXAV9dpOKrkI7Be4ftHaZqF3KZkbp+R4Ri
         eg+re1OnWUckdSXz2/8U8Pvqt4W+ySGhbTJ0374Vpqk1xR3xWaV4i6Ou/mYJN+iwaubK
         Pv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686132; x=1791290932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=epA+CdgHUmlYYpLGEczrqq9cajap1pyqUy7Xk8YH2fo=;
        b=0Tul5By0OAGr36PmAdNe6LhPRIvav/Shbi1CT7E5G/GAxhBcrE/15ULLtIUsBjwEhc
         GbioZsGw9ShD/GiGIesoYztVPOUfwz2yDFoq0kXHtuaUOAOKFuUodJrkRzf2OR29OS2z
         c6Qu0UnuRhMfRbZkxaTt93UnMRez5YDvvp0BoVx9s3bHlJho8hx+yw1AaDbqfzaX/96A
         VjaLxcvFlaeGNkPBg5JidzdT3iZBRUqmQZTUJQa7fY7Mu5a7vJp9oKas636MQXs88CRw
         VbOM69bb7it7ms+GdXaURAab6oVaH7Pop/Db4HAHPSJ/gZ0SREznk6hg5l4SMWzRO7eL
         MgPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxT/FAuJg0wNhub4ORHzGniMpb3NqTgdyCVDKOvcXA6aYpcDnZhjIkncTbvvzlNgG9dxJnmu3hwCQm3@vger.kernel.org
X-Gm-Message-State: AFq9FYK0Wcpq6cRcqa1FgITU8yj1hz1CiBEW5sscpr21QE32oZfO49uF
	voqbjh+Km+VR3xHQ2MY/+qhi1afT/HqWuh6TyC1cakG0UJmc9Zc7xEi4
X-Gm-Gg: AYBFou3f+4aSi0p7q4m7qUoDmmzaPwR9grCdfcaLI0UufFrxmufzJG+XhBJmg3Zw1Bu
	qqF1IMYaJ3cSEhL5gUmRnIozQR5obhdoFlJM9zzvZtcl4+GbUe/vG+1odVAaHSXzsoW3gh43LLY
	PVBunUX8gBRvi958OXr/tRvKewOREqeBS3xerEc9QV2X9HnsU/uAbaBlhV7bdN7pktQuumXuoK8
	KIkvRSJcS3AVeMLlDDKBhrDzhzW2/IbkzYQ/ixdfa2k3ZnBcQZqusrjVfa6nn/fb6OvBjRp0Z1e
	oYzXBC881FGwTmqMqz5f+BDB/RcB5XMDxiNnJ1Cz13qAwZfZzY8hD0c3lB/XBkt3t3qMGJLZw2R
	NYy27Oe7rw+CZ04hnt5U19QjXfpwk3qkHs+53XtlS6OeJtlr3KszNomR4gVf10x2XgTmSc5oHks
	F2S0BRym1gNPQ+AaRzEx5WvOlLUKV9hlYghVGbwfrDsnkGwTj9DtYxeXYLeUzmXhlqlKEYeZWgT
	3X+az7deGG754Cw66/o/kugi3VKTe6DswxB1W8+8MgDV1dABjrLjhMP4s39voQ8hYU4L42RCDhI
	WcLobmQnJ9+QQhXlHA==
X-Received: by 2002:a5d:588f:0:b0:488:ba61:e3be with SMTP id ffacd0b85a97d-488ba61e623mr13300292f8f.46.1790686132400;
        Tue, 29 Sep 2026 05:48:52 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable ADC
Date: Tue, 29 Sep 2026 13:48:28 +0100
Message-ID: <20260929124829.237997-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the ADC on the RZ/V2H EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 0926ab891fa5..8939e35639a5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -130,6 +130,10 @@ y1: y1-clock {
 	};
 };
 
+&adc {
+	status = "okay";
+};
+
 &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
-- 
2.55.0

