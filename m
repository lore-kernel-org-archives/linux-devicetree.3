Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803114;
	b=SMd6UDJSON1f14cBvZ3id9mkNvCRzC/23yuabGoZXvpPuLjc+zcDWkzi1o/NOPUjVxme
	 IX8sLqh5gLsU3/or3h9dE6sfnUvWc9Pcrov47vyi8MvLqXXkOb21hly4gtb4rIRdusqTS
	 fJhLTiVfIvwsJhqrG5ymYljPLLzZpbucA7FEEY2SEU+kU93llpQd3bfkf/pEhOHdAQkG0
	 GRMYygpV5a3BRCCFC32o4wYmNt/W2biJh8wM1PunBmW4mkTI5sLnB2IW3gRrNEZzfNDW2
	 kMQW/gFRzG+c6UQ2sn748gtdBVsSFxJLMJT0kXaOE2F0nz5I+YtyWh8ya+fkhes1Bng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GjJvgQskeA2INOh9xphriRJk4nj64aXRXGnAbm8qNwo=;
	b=uQbTjJj16HsJwqnBVU4StpWEhopTQOqviCelkxAe9LrDQGpTT/o80cObFPxqIliv46wV
	 B+wx/YJ26TfdT/K28zekMzyeTuf/L6re71JXiyWgNr2L29PoTo5DCcqqMe0l7rtHkQb76
	 MRCsi2RFvpkFrQ+c/eNxF+5qsOciEtds23SNkdokNIpY6gmJXXKV8KOIl3k+KPQqcEcHR
	 vVQGWr9AfGMo+FCgNf0GPVqc18PvQEeD0kQbEVd+ctCr18kVbpZti32jPlGY2XFRbI1Vu
	 b2pEtSusVTTXiMGrGLymOjdSLOH2cKyGaqAfElIYlgUVPIkNvjlGEu1n2KKTsBCDk0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F71mQzNN;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7326606A326
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 00:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7326606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F71mQzNN
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9f6a16aedso8887465ad.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792803113; x=1793407913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjJvgQskeA2INOh9xphriRJk4nj64aXRXGnAbm8qNwo=;
        b=F71mQzNN9Df6I/It3i/2orNrHXqbcP1PQC4xWxfUZUv03/GeKMX0+yP6pW/QSoi4Ii
         ptvSZ1Z31lTqIvQT+c2UUZ4XLuqeRYPIgHONPoesz2XCjoScHRojFWbuVAMtryozroII
         lptbybUDhb+BfNrIIQ8CLpLhFa5OgZPmiEOrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803113; x=1793407913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjJvgQskeA2INOh9xphriRJk4nj64aXRXGnAbm8qNwo=;
        b=B+8DSS4PrZiBDzhkf+VVx08FyNsI8ghXpNdY3AZ8qPO+/AzIL5PZH+l7YeMKYkF3wh
         47+g3Jw9iNISs7WsSrW3oJKonA0AXYFx0TADxWoHH0P64vGwA2hCKGJfOYlufMwY0faY
         KiCKDZyfBeaSjDDDhNERyI7aTBLr6yO/lLQWCpga2IFGddoF+O8quSlv736EGAtXDQhl
         6UPtx6J3PLURH/cM/DWZG62PAnMGKVHk53Kn1aCtgecpMe2pMMBe+luaIEK5pd0/7n/t
         UhhFR8byMHQxUc2vmgUfIJo/szUtPlroJezLEGRetl3OUT/XlvYuOMvlsR2prgRTbgJX
         c2fA==
X-Forwarded-Encrypted: i=1; AKwUvBweaZdaK5GTkEfu/n32GFY35BNCA35Hj8tcEHZlNHWCBfFgkkYfiBiCAzYnKW2YtcfjlrGdMeHgN6is@vger.kernel.org
X-Gm-Message-State: AFq9FYK/DPEJqdrk3UDSv7Squ8Ncdi+qE6Do2NQD05c4VfO1tcu+Jb7W
	topeua0HD1XOd3NveE+4J7TpFbzElIqCmFpYr/RTPZke0XKXjQBTnudZjftiV/c7pw==
X-Gm-Gg: AYBFou2qhsuc3xdT5C5D0PKGgXhMJQ8X28tSlInKJOt5+R515i7KilBbTT7ONzMGAxM
	4rDsOyNPl59My04MuKgOz71btKc9j3LWEbvb5ylFEh+An3BHFuWZxfxzlbc3b8aKOm0UXdC5LHm
	qa5cMjvU1Z02b9QG+V0H7mrCo9wwwLTD7EUe/IyANym+rUZ87HQFw42T/bFrSgZrXw5VxJXk44z
	Ssvig94YAJpHpbgWUv05y1SBEmEfEV+agWSeoLsHY6aT8ppCStvbwbCu9PYeS2HWxTUtcsm23V9
	uw0PBXy5LshHAY+1Vi95UV7GQpiHCqlUVDXYIqNl4GETaOn716/Tg7lIOEdD/yWQG09lzIiATYP
	EquKg06+QFgxCD2N7grxfmxWauCYv6Hd5a9s3blEpJUQpOjSu5aA83hatQixS2K9rnG3+5ihzEd
	eQ4w60c7lwVvfF9HmFUCBDBpnJVDiGaKM7K5Za2TiwOVSi4fuQuRblzoRNST567vYVsmF0Rfw+7
	19spcoGRLyisv97Cj0cge+CJ9R0MzFTbtC+K1n0O83Nyjr1lNmyubQ12Yp2MjmAIsvciqqR/RpO
	ArLPZogO7bzDKMq3f28JrjOoE5PWCuXd5L08enkqd+FVMgpW+auss2eEaqHADRbDioT0r4MmPsO
	KIG9nMurx
X-Received: by 2002:a17:90b:3b45:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3ade9b2cff5mr812341a91.1.1792803113127;
        Fri, 23 Oct 2026 17:51:53 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfeb1sm843763a91.9.2026.10.23.17.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:51:52 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Sat, 24 Oct 2026 00:51:36 +0000
Subject: [PATCH v7 02/11] HID: Add BUS_SPI support and define
 HID_SPI_DEVICE macro
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-send-upstream-v7-2-abad13174b43@chromium.org>
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
In-Reply-To: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792803111; l=1445;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=yw607yxfhlGqzMQvUei0spNkHE3rjdhJJTsFkZ74pk4=;
 b=KYERMVr2ZOi6iWqsiLz616NCWFhyAhngzW+obBzlRREHTXw7r+si9gzT5hauuQa2QoLoisRF4
 r+kaho6ZY6bB466JTmNpULLdgLk/5/3ojuz9VXHF+5kjPJhrFfcp5yo
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

If connecting a hid_device with bus field indicating BUS_SPI print out
"SPI" in the debug print.

Macro sets the bus field to BUS_SPI and uses arguments to set vendor
product fields.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/hid-core.c | 3 +++
 include/linux/hid.h    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a3ff0514f9cd..1b9dbb7515ad 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2373,6 +2373,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	case BUS_I2C:
 		bus = "I2C";
 		break;
+	case BUS_SPI:
+		bus = "SPI";
+		break;
 	case BUS_SDW:
 		bus = "SOUNDWIRE";
 		break;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 8d17b741638c..45f713fe9982 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -821,6 +821,8 @@ struct hid_descriptor {
 	.bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
 #define HID_I2C_DEVICE(ven, prod)				\
 	.bus = BUS_I2C, .vendor = (ven), .product = (prod)
+#define HID_SPI_DEVICE(ven, prod)				\
+	.bus = BUS_SPI, .vendor = (ven), .product = (prod)
 
 #define HID_REPORT_ID(rep) \
 	.report_type = (rep)

-- 
2.56.0.257.gf7497c7d27-goog

