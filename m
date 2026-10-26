Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000821;
	b=4DzGYGl9fnWRwSKeJ/Q661oHTaqIXpzI6Og7RYRheLPfuYav+7uvXvl4TD5978cEEmYL
	 58uFEEHLgSD1QXZxZCHWyoxCamy4orf/3abk8+PX/Lcag1g0bSRzOt2HaOn0cK+2j2HEd
	 59o5S9epResIdPoxbXo08OxJUcViTO5P/qolSwdMR8pmL91mDp4Zmll/t2j9i0MgkYq7w
	 FdBPnTU2K2u5cojRXeYb0J8llMysZemM3N5rKdxdo3Jk5JfYUFj8GAm0jbVNuwVuMtJWQ
	 6lJHZ2WyNhhKNTk2uSMhpxdDkCApZzhbAOurakz53Dq+UnOljQybsLqALQJN2z7+VHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c5dii+p2+tXugsvLbD0LiEn9CLz6QjSaElSANvZFz5A=;
	b=zBlGr7cr2xRwrfh3w7zsjUqZnB0blrIgjsW6lqu45GvJqZNuch8zgYhxttLSQPOD7Cof
	 2imj6IdmKSK32avL/2vv90rV+lQh/AexZKblTc+epeJ0Ec77/8mCfsfvBnRk7LZfAnSfO
	 R+wMT684rdC20qLKnj5p75a56JEgk1v4cKRF0N/I/QPvbBZ1jD0Tsonl12/lpuSR70uAl
	 e+0zcqRWVVJ7pAAn+12jh83yyFKezWAoi+xMwZxtgs6SfPa8OA6bfPNJOPZRRVs2PuV3B
	 WUTdiTI2VHXHNJLRmSF2pUUxLqXxnSJt6guJpmnZvrB6PuMisKPIZJqoQYezoEAEQAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=NCzrwkS7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59642606A333
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59642606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=NCzrwkS7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so10454515e9.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793000820; x=1793605620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5dii+p2+tXugsvLbD0LiEn9CLz6QjSaElSANvZFz5A=;
        b=NCzrwkS7ftLddMPUiiC0UEPgiUmuUYezwx2j9vcNMKeg7NnJRX4sLEAL56vufEIlDd
         Ngvfv7abkzA3fFBpQA4wpjEiNDBjsLalUBTWvlcTMlZXfM6nCt6fUvAmh8M2/ttu4YJO
         Zpuu3rwMZrOq0zCrdz61m64foLZQm/O1Js7Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000820; x=1793605620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5dii+p2+tXugsvLbD0LiEn9CLz6QjSaElSANvZFz5A=;
        b=G+vrB2tVqckYcladitndhcwvm1QuD28TvVPKMKmJ7SRErgG5H/98iUUemtCsz/5sxm
         DdA/W6JGiu/HWHi/64XcWWAC+bjw1+2vdwNToXSXGhJej6q6TDFHt/Xg/LcU+yN3V2jh
         qR99YgisYmOvjP6AaOkRPm2+mgYfsh6oJenW9GgVy3uOhleixILb8fJKqLJYjBviQ45w
         uC3LW9X92g6txKBeONLnyZQuo2qUsGJV/Xa7M4a5kO3XhzgsJNnLM/DzirwIKVvKEXub
         sqH4N/bEM3Lx4bwsLLAmSzIyaW11My6+iwm5jh7MzpjWFegNfyzWPtQay5OZD+G6jQ8q
         SU7A==
X-Forwarded-Encrypted: i=1; AKwUvByW9Gev8W/79Fdy/Gnig3jYv/kBxAX89XbuPP5Qd56zkhDXSoQNEE1ODLsSAT4hdCd64RdwG6ag9SIq@vger.kernel.org
X-Gm-Message-State: AFq9FYI0qCH4A3ByT0gWQKVP4/buUUa/2cfMsPeTUVOLOajTI1ymaKV0
	zlSHJ1t2HuSrIybsoQO0lc83QX4KoU3ex9Z1E8OwtyKl+3D9YqZc9sNDTnNtVB206NM=
X-Gm-Gg: AYBFou34K7Mk18b1G7KrtjQW5uPvvXxQGrEOSZQH1svBbXJmVIGL/YMTFphhq6Oz99q
	wB9A1FLIe9ckw8fxABmgGyFimlfXTgKHAf16lf0r1/XlKNCDTzRAseR0bu9pRJOPEkk6W5K+Mxt
	tuQQIRUnqXCOhKKbXNaakSyCcVChGd0AmyHtbBe3thsRcKctpV3F2GvUZa46WdbrcDkAApzJxXJ
	+xX38UMzM/d/9VfCWmw1vTwL21aZLo+TF8JSNAMTG4FfaEh4jfrHtNC1nQZnEhcfWvSe9IW/u82
	dZLCaQyF9uJshCVGNjhaQ8BjwAbLoY09bYCMo1fKt4mj8HHqPzg+XzI3XTzDSfGj/z1W3Nh6U81
	We0EqE6Iqo8/qa+2pzFWBptJ2KkKnsichEPOlDAzU9gQzl4KM4reTZRh/4H0q7WdkBBQQinaS7x
	vbymFqzNsoOkT3rZR+zXnhjudDjEP+BqnkzfaRu2B2Jauvd3ZsgQnL0lPbo7MAMcKZ0DXBpZ7Y6
	m9Rz7uhwUKeqjG+nF3Bzs2KdxCd6OBhScu36mRO0VQLvqPzQ1ZClXFvVd52X61RqWVPsnJPF6xL
	z4u1ldP4vvxmtKLsoHbrM1ThVadirzUd1slVDTaljOKUxHBimZEDXadZAMoR/dWtE6lr6DoSPfA
	PS0WiLaOonLaoU4ptLO+Qheu7eBoZZiDQwdruawdDnad4uzIjnDiQdw==
X-Received: by 2002:a05:600c:3541:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4a35acc6a2emr107275155e9.33.1793000819693;
        Mon, 26 Oct 2026 00:46:59 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm13731353f8f.7.2026.10.26.00.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:46:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: clock: ti: dpll: drop the ti,ssc-* properties
Date: Mon, 26 Oct 2026 08:46:27 +0100
Message-ID: <20261026074654.3997494-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
References: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The common clock binding provides assigned-clock-sscs to configure
spread spectrum clocking (SSC), supported by the clock core since commit
a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Keeping the
vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
properties would leave two ways to describe the same thing.

The properties have no in-tree users, so they can be dropped.

Existing DTS files using them continue to work, with SSC disabled,
until they switch to assigned-clock-sscs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---
If keeping the properties as deprecated is preferred, I can add a
fallback to the driver in v2.

(no changes since v1)

 Documentation/devicetree/bindings/clock/ti/dpll.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index 14a1b72c2e71..ffbe50f46e68 100644
--- a/Documentation/devicetree/bindings/clock/ti/dpll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dpll.txt
@@ -56,12 +56,6 @@ Optional properties:
 	- ti,lock : DPLL locks in programmed rate
 	- ti,min-div : the minimum divisor to start from to round the DPLL
 		       target rate
-	- ti,ssc-deltam : DPLL supports spread spectrum clocking, frequency
-			  spreading in permille (10th of a percent)
-	- ti,ssc-modfreq-hz : DPLL supports spread spectrum clocking, spread
-			      spectrum modulation frequency
-	- ti,ssc-downspread : DPLL supports spread spectrum clocking, boolean
-			      to enable the downspread feature
 
 Examples:
 	dpll_core_ck: dpll_core_ck@44e00490 {
-- 
2.43.0

