Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174548;
	b=1nitZQ5CTeLIxbrVlDkwJkz3LOK8D7D8mBburfjkpOImsTUCr9VOumXKeYCna0KGvGv5
	 winc4JXxRcTku/81UaDJ0n5sE4Gw8sm0cm/eWFOTJB7U89oLev7cUel1KFd/ih2wDchoK
	 wV/S3pOiQLja/2o4K+BvgJudpU30S/FWpuTOBT4HYu5SvEa08BPKUa4nohG3j7G+PDXUv
	 MdWGlilxCXhBwY+Jmj9oPQGJ/zHX6RraQ6XO1Q/SpQim6e94Y0BbUdnetXSZ+llqJzA1P
	 9d/V5crBrLSCaGz8Wr4qzDUz36Oo7eFuGx1Lpo4YzAewBvwbDIGjoGiFUFCz/3nzP6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HvhrYvkQJ5ZpS127ix42A5EcPEqRi5eUCbysMzVh1pA=;
	b=Kphvg3gur8kJeKQtFdT9yl055xrFZnR9YPUZC4knTQb8dDaBihz79w7yXZf2WJxhZ08d
	 KbS9AvFFagMI/At1ZS8rFlh0wy+9zCygOv8bYG+U7NVUPjtcBdQLHY07cBxFxyFABez1Y
	 EXNsAA12WDt/tx3snX3A05Cv6sejz9GhT7ixE99ekxLukX3LF41IDQzmlREAxiok8Oaml
	 T/btbeSKDecpJd5XcMe2Lvf9rapcX9zY8mPVZftIplJkIh++TXcOQnp3Zy2dbGNNKV/tl
	 g9Qh7ULrAco+vMf2JVViQiN2NxcYBAiOFH+Q33cqQWdULTU6CuTK/P54tbPTlInU5vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8804Fsh;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D2E606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D2E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8804Fsh
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-383a4073e59so261596eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174547; x=1795779347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HvhrYvkQJ5ZpS127ix42A5EcPEqRi5eUCbysMzVh1pA=;
        b=F8804FshacBXUMg/wH4Wtr/0VP2vIO3Dm4XpXThTdTquux0tCMMcJdodOwqqYYLeut
         S+MXrTtXtCRvItpFAva9SlwOYDjY74QZ8AhJIv/9LZEOPqXRSvxNprxxPo4cnQdxxwuS
         ytmVyXPxChg1iabq3Iwd1F1vHJvuNgfYp473HvgpMKlzbvZDVuRqZaSP+n1r/kAHUh63
         3f7E4sH6Cyfh4VDqd7+k9spmogKiOLKHTrcZ5jxA8lGylgvNNr9zRYFOQ0o1ejpA361z
         d2wACCl1tPsoQ9IBb+DX23jOmvaIQShaxhykkpCutMA3INrku01gF2BLqjrdXH0wNZ+1
         NdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174547; x=1795779347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvhrYvkQJ5ZpS127ix42A5EcPEqRi5eUCbysMzVh1pA=;
        b=hQh0Oa/8XYdCP6M2ZhcmL7MkrmNv912GYM+peR/er2YUisgkGCreynArXouoJ6ENyK
         JQDc6t1ut7mQ/+hYNUwjC4funk05J+ZUdxn7MOvnxQlsS8IYbyAWzil1jVl1ptyX1O/f
         5kuIVpgG/uolc6+BZHzZnDjOIFvRz6SDpgwaybh8VHxQVpzp6lYIKfD5UEuNvql/SQmy
         5HQiraLncLFjF66mQfEyoGlCGyFK3d65L1W+GarV6KlPjHQpM/DBE1CnEDxRg8aviken
         nGICnWm6LKK524tLAAPFS57b3ViuqUT2sYqRnArG9IKH8eyaig20ksiI55KXsFEoxIaa
         LCUQ==
X-Forwarded-Encrypted: i=1; AL+hErFJHTT1a5sXKpyoqXOlSjJNUOi0d7v9Srn3A6gPR+M1HArEbVqwLQTnocW/KoWUZI2xsVQqrR3nYAcc@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cg6tixGDIsU6wZGU2++OcTZAqH8idCb4+AenIdgt54tvg2Vcd
	pEjAdMrtQfz7F1OIu79RErkLMTduczlunSJjtsPN2SZF3cf2Vo9di/rdXs6IJNIp5vbya+1Xyvo
	=
X-Gm-Gg: AYBFou0V6VYQPBtgs6cndhkbO3knGA8AIUARBjhql90wmGItguhirdJiqzvzY7oXnPB
	RQqPIRMUQRARsCeP0unlrnN5RuQXNvh1K7vH3b78QKN9zHdmu2sVrQq03JcIBdJwsSPDrJ1vcDs
	LkckzzlEE3SRhGdvJdNsbRiX3xdfrMT9lpcvMvwjTy2Kjw1rB2M+n/Sl+iGuDlMTC5KAtepZKZY
	lsVH+Gycpn1eiNPIyhZUlhWbgOe0CmmsRWsNmFqvikM+o/f4jfLYY8MQfeTGPvPv7MzjPD5KSz9
	kpqeg7oC/c0SLCdd933OzRLtVQAgCmR7I3WE1LZinMNqnpQjfbYg8X4Tx9IpDuzKtX1dnRvF3z4
	HRhUN1xCumpLgHkYNsV6NWXa3aGml/YaCdO6/LChRak5/Y9zrZDZ4TP0BT9EGIpwSerH0Q2D6fL
	WD6QJOyfb8++ZE9cE65aDNPMz802Uiu3zaFm9F3B9hYzl5rHxhERS2J4NfQtEzjnOPwxjUm7Iyj
	mcbZs2RsR2icS4qiWjsIvn2a2dOkkLeIto0Hj5OMqoiFQF33YhC+t8YFD6Q7C9nkYDatnjDs/NM
	fC82+yO5PdEnT5UFyeUkE4/VloqcKUE66SE=
X-Received: by 2002:a05:701a:cc88:10b0:151:6e80:ba7e with SMTP id a92af1059eb24-1b5567dcec1mr2519969c88.4.1795174547112;
        Fri, 20 Nov 2026 03:35:47 -0800 (PST)
Received: from pjhArchLinux ([199.102.217.182])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6274610c88.10.2026.11.20.03.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:35:46 -0800 (PST)
From: pjh456 <pengjunhao409@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] dt-bindings: rtc: haoyu,hym8563: document vdd-supply
Date: Fri, 20 Nov 2026 19:35:01 +0800
Message-ID: <20261120113502.563894-1-pengjunhao409@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The HYM8563 is supplied through its VDD pin.  Add an optional
vdd-supply property so a board can describe the regulator connected
to it.

The property is optional because some boards connect VDD to an
always-on rail.  Describing the supply also lets fw_devlink order the
RTC probe after its regulator.

Signed-off-by: pjh456 <pengjunhao409@gmail.com>
---
v4: rewrite the commit message, move the AI disclosure below --- and
    drop the version links.  No code changes.
v3: use the generic "vdd-supply: true" form and show the supply in the
    example; reword the rationale around the hardware instead of the
    fw_devlink ordering; replace the non-standard "Assisted-by:"
    trailers with a disclosure paragraph in the commit message.
v2: rename vcc-supply to vdd-supply, matching the datasheet pin name.

The patch was tested on the Purple Pi OH: cold boot, same kernel Image,
only the DTB changed.  With vdd-supply, 3/3 boots registered hym8563
as rtc0 at ~0.6 s.  Without it, 2/2 boots failed with -110 at ~1.37 s
because the RTC probed before the i2c3 pull-up rail (vccio_acodec)
reached 3.3 V at ~1.60 s.

AI assistance: I used the HYM8563 datasheet and the board schematic as
inputs, and drafted this change with help from Qwen3.8 Flash Next and
DeepSeek V4.1 Flash through the OpenCode coding agent; Gemini 4
Hydrogen was used to cross-check the schematic in Google AI Studio.
I reviewed the result, ran dt_binding_check, and tested it on the board.

 Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
index 0b9f39ef0edc..ce9712e2c406 100644
--- a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
+++ b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
@@ -29,6 +29,8 @@ properties:
   wakeup-source:
     description: Enables wake up of host system on alarm.
 
+  vdd-supply: true
+
 allOf:
   - $ref: rtc.yaml
 
@@ -52,5 +54,6 @@ examples:
             reg = <0x51>;
             interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
             #clock-cells = <0>;
+            vdd-supply = <&rtc_vdd>;
         };
     };

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1

