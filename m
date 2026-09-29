Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CB551DAE0
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686137; cv=none; b=NkBh7foVlhrYvZ9NJd83sTXPa0byBBIjrV0LHuYBodK+So0N+KVgRSTKgQ2o3QHTscMQ/YY/xvyl5OpAarTuIMtirhVqkosPRVwY2Y2XlnS0Jo7NErhNY4B5Mo4yoel0CgGwJxC3O5N6CDtHPR38T3ekYAb/l4jB2QOCyN19OJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686137; c=relaxed/simple;
	bh=3wEoFwaO0iFWgcSRe1rBVJm/B3HLnQlNmpfCo2dBkHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxdl8xOeoXdj1l1ig98ivBtGRJB/J0Zg6Cng4baBfXl1QSpyhRdOW8FRwK89zMCC9FXJGmk+K4a6wOVEQSlHkWq5xfvadm1bfa4OZ+n42r0BS/cJydWAzR6zWnw8NlEPboqkYmwOUNe5wYAB6PNZjq2KmF9t1ab6IWqH9lUqhXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9CHs4Xu; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9CHs4Xu"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so2473695f8f.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686133; x=1791290933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wGmpRNkgFTWQDnXT7MrfhvAHxqpIIx/rDduJ3KFylU=;
        b=R9CHs4Xuryuj1LFejH3ldj7l2/tBZl9TZJIT5uWwtRSy/SoPpKeekG4zrmDd4hTNqC
         HZu+kd3lD0Mj99MSY2TlEWvMhvfcDhrl7r0gkWXidQdWQHl8V8Q+uPcuQEHMFDp0PdOi
         9Qzr61dHBBHxAbNHmVdNbEnY9xqV4/3QnzCNSRXNNFCjllZKkPIQaiiFoLdhhrsFYIDr
         EwB5yi5xpWC4G2Ur2A80AYNtJBWHt62Lc954U/m2bgCDoafs7wZoJo2ufD4OWEktkhpO
         Rfz0AiPLDFSB9T20IcIRbhmS5mixIXIkdoLU1ixtEi4ycYIXj3qgjOIn+Jja5dFFORQe
         m26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686133; x=1791290933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wGmpRNkgFTWQDnXT7MrfhvAHxqpIIx/rDduJ3KFylU=;
        b=Yo6qVMk3PLf+mIJNpdYh8J3iWA8N8An13wjx85sheZRoesBzdqJ6vh1TmSLU5U3Md2
         zCo6tGvTypVQC803xgCO04cWkgl9gYqPXxIFIRq+R/g+pwl/VEilGSZwFrrHX/BaZqI+
         dAkrmd8QqLgTbWWTz5GjP+1ZgmDkgI3NUe2XtPxKh/ge4rL9foHgSQz+SmYaXYW+yBCm
         qUAWkxmR6TzlWB67C4cDHqLGHdG0W47SpE4jyU3aVRHftvq6X+UBjxdb+zSbgYAtgdbz
         7ZL9tbCsHte3UZYQcwd4FOtL6OmCkCovqBi5QW24g5FZYUcHTIxRhj9k1q8NxxpHRhMX
         AL4w==
X-Forwarded-Encrypted: i=1; AKwUvBx1hppuS4ZJ20J3KXNz2jqdsX/Ybxk+QqAko7pJDTonLf6I6wiVPq7Mdj2dj8Or1SJofLhJuZgW84Dj@vger.kernel.org
X-Gm-Message-State: AFq9FYJFRJrGGsjMpRxle7C9YBpz9/oL/M8S4218SlqvTVTauUEDb7Tw
	nLvG6dePpAPmVz8V0kTtYS281Hx1rKzTVBrl8CjWlEzyshzt9+K7rHJgpTur4kxi
X-Gm-Gg: AYBFou0ZCWTGeOrMucbr3j168wYAlmcBeU5ReWAFmdGwZgm8J8kMhGiu9eh2C9pXLMy
	75lv979cqUP1hdWSFJcPrTQYWJteDZ/DcBdyeHHbHTxrv2XG6OAJoI89dA/E8hJIsLUIsW+HIqf
	jBsGNojR4ZWsUpVagbhNYtLabHbHgqnJ5PDjDoSUN7Tk5oGh8O+mXZP2Ta8dM+3V0NElSFvQtuw
	jukd4Ka2DoBDb5Gq1tafMWrndMmiVFn/0pmJxArA+lLIOxMKLSUXTJ79jc4mLL4G2uyoIbkJLCw
	1g1Uzxo96cI5REIjK4ChGuYDXR+e2ciC0e1IaX6yb/qX2Gif6lv1qFmxPQmGtdp1lqhogIg9NRp
	sjIS1mRZaWZJwFvKXrvH/NdVWLzki2jiNRcUeYnhMXZWw6i1eoQzjr+GnIImXExdd0zXI28hMpy
	dMqUC6d+9b30UvdW2XeZKfEnIrVGgapDVYOzedgE5AfzLk4xkKH212d/FM1n9NLcfJjcEy7d9rn
	4oS4BxtCniAdODYdJCrVqFzEmutznmo3O/70/vToorX4Hu1DKKsXhm9SHDvlDIKAFe770P89fge
	Uo3kgIwtqC9spiczDw==
X-Received: by 2002:a05:6000:40e1:b0:487:62d:37d9 with SMTP id ffacd0b85a97d-488716a5e3amr29250652f8f.27.1790686133236;
        Tue, 29 Sep 2026 05:48:53 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:52 -0700 (PDT)
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
Subject: [PATCH 4/4] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable ADC
Date: Tue, 29 Sep 2026 13:48:29 +0100
Message-ID: <20260929124829.237997-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Enable the ADCs on the RZ/V2N EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index c43325dd1c55..5daad7f37e3d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -122,6 +122,18 @@ y1: y1-clock {
 	};
 };
 
+&adc0 {
+	status = "okay";
+};
+
+&adc1 {
+	status = "okay";
+};
+
+&adc2 {
+	status = "okay";
+};
+
 &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
-- 
2.55.0

