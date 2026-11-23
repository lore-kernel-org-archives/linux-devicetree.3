Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443752;
	b=LiI/l3ir3rvgEblejbXl6aO5cXL+ogutestCCZu7o76bDu87xEKkei/2UnyoncboSRWO
	 pe68WlRc265qh9IULKvo45QgqK7A0lmG65O4RILPAPoIMGqH0II19CKm1/g/EMJcqKY/F
	 UPm40X49k/fG/E1y5CWyt1B1UMrUrCvuoi8tQUtZHMhx818mNkEdh2ItihLjbzb3Rj3cn
	 AN082ihzskDrw9hXruCTv4Ha/MfABJumttW3tM1IQrFyBrLKhRMPqlPSYucrnmWTjU8GZ
	 AlyxH+xZKEQT8d5Luyby4PSr8kDpoGg1UhONjCjsEsjSwgupKiyvXIAwMBnePWuqnWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UpOmPB0SAKmtOrTDDvYOJ9QlsXaXjLyVnjun1DyFN3I=;
	b=APrAByd22HQit/E0LHV6NBPNi9HDfRjBK1xesCQ8uVGVjjfh7mtryS3nQz1YU0UczHsy
	 0ZqbrjA0aZ4LCeIoonGjI2DIoBCG5V75dMajuYHWedc6ELxyWZwOSUXgRhO5UfnxfnADV
	 m8d5RvSx0K5FMXVmv8lhVUvoWZ5wAsWVLPnNrIJgBEquumOLQBT+l4BdKNndAdCDBluBW
	 sd5yx7VNqla4dGvOnnItlQ+IwiyqiogvKSYCFdYzS0PgCR9eARNIJCAn+jGpa7XL1nZsY
	 W0QnemhsEMnITIQUvaM3rYasPExjHGIejMq9KiemkLMHEj+2Go6TKO6TBgwjnE5qK+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Enz4mbBL;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C01C606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C01C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Enz4mbBL
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386ab9ab619so2353912eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443751; x=1796048551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpOmPB0SAKmtOrTDDvYOJ9QlsXaXjLyVnjun1DyFN3I=;
        b=Enz4mbBLoyOM1qE72OcdkCkHcT/AQJTULlVtwmDt6CcHGM5lWtc/7kVlyzh/u5Af49
         Z/bRO9Wj1HOb0oTOwNwjiDfR+Y1ENhxEyq8ZGJD4qx0VFdBHrMa/laFFP25cNR6LNFld
         xK6IT8sDZUWXw+Rd16EwNprx28Qs8UDAyAvFtTpvvVV1AU3NXz3wksY18w2MEztxq7UY
         WNGUV6fySXnE33qbPhgit9/laJQA21B0YmE94PctgL2a0pgUFHSEbnLtC86V7p6BjkqK
         B+NApBeeF945Z14ek1svgqWy4AJ1U3xinesrzRkxk5xWNj3DnKUrzKAdU1dbc00w4Rkh
         6U+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443751; x=1796048551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UpOmPB0SAKmtOrTDDvYOJ9QlsXaXjLyVnjun1DyFN3I=;
        b=ejhdbhtvNb7+e1CE/KIwWvVNItfU2udbhCpQXg2d65Ux6v5mzGLq35qlrUDIrIc463
         MUSTuSRiSTsobuXMnP9JikpbAg7ig24Cs4j7a0Wrra/PP4fk5f6bhpNFVU3Ee26DEmeX
         CQ/+jjKmRfYij0PLKaedWjb4JOa2nfxkwlSn7DHdhhBcSZSUk5qrPRiKS796hs9yuQch
         MVDfFiB81ckIwjcanJBocBqlNfgPaJCZlPimwEkQPVpOZ7LihqgTyt+aGEIFTS0MxjhO
         Si7F6e0sh9c8/x4sNMiAQ5DRgeNOCwEofFlVWw3DHITtpHDbSknjF6lkddQyJQGBo9nh
         BUIQ==
X-Gm-Message-State: APuU4Z+59Pjd8Mb0DSFw3INDuyLW6WyqdBxGNxgSa6qk+Ixu/On2yXf6
	UhXxMseysZSBtl7z7UXn5FCnkmJr3jJhQ3vpPUxAqrOKteJjKvPHPEWI
X-Gm-Gg: AZFdTZfQ6rQhZiKjrQX4/tXHYtJid2lDMZQNMrQEV3MOtT1ogS8gjekCiAjKHtBFhgd
	BbdlcBrceLX1GMUT0j4RIfbKONhF0N/IypF6CbLMYyWCk9lf/YPPJUucJ5qAYAoBdxEC+SrZsLm
	3Qm24yHRhqg3AWEAHutt7EKfXTAsncdYQxzEROi999MKEljXSE6uQFL7LXkVyLZcxaY5A86gP8z
	BOtCi21aO1uptdt24V50prnwGQ+Nz0qBWFbq9GHOuFfz8QVIeknIn1xEmbuSQGlSSnlj5BPUUz9
	QsMyRQf2O6gU+rMo8Av7DJQwSPt8BEY1kJd+FChsIhtdkIHqc0mU3G7i0TDEzEKjOL3NIprQwPK
	FlCktOjKkMjoN4aGsHLMwGWaEhwrY3c/IPjTn0gew72Tpbwj6d9kp85qSPuJtx5AXJ22W58d/VI
	mLRupiXwFbKfSH8+CEtn6hPOOXmCCRxmmCmjsO6KGHEugnLdlBIAafW+US5O4Zle+hzYp153j8O
	+dEDVElEt66TwCyVQ77pJOHvQ+d4aLyd9WXj/WGoF8g34AAisltlPSUoFLr8NkmwE8NH9ED1JtY
	JpxqOQ8Urpqgs5n0q+tmu6F1bisKIsztIfoxnFfgIrqXWnIDaSha3E+nOoNN345Hh6QpaHV3h74
	k614z5MvRybFn+2Bqnf4tiQ==
X-Received: by 2002:a05:7300:c011:20b0:386:b100:467f with SMTP id 5a478bee46e88-386b1004ac7mr3404737eec.11.1795443751145;
        Mon, 23 Nov 2026 06:22:31 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:a7dc:f03c:3f60:caaf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm38385854eec.28.2026.11.23.06.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:22:30 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: cpus: Require cpu-release-addr on bca-smp secondaries
Date: Mon, 23 Nov 2026 22:21:59 +0800
Message-ID: <20261123142203.3860616-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123142203.3860616-1-hjf3108@gmail.com>
References: <20261123142203.3860616-1-hjf3108@gmail.com>
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

On BCMBCA SoCs with more than two cores, CFE parks all secondary CPUs
on the same mailbox. Extend the brcm,bca-smp schema requirement so
cpu-release-addr is required on all secondary CPUs, not just CPU1.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index b83c7785f6..0b7dbc75ae 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -492,15 +492,15 @@ allOf:
           $ref: /schemas/types.yaml#/definitions/uint32
           description:
             Physical address of the 32-bit MMIO mailbox read by CFE after
-            a wakeup interrupt. Required on CPU1, which CFE leaves in
-            a holding pen. The kernel writes the ARM-state entry address
+            a wakeup interrupt. Required on secondary CPUs, which CFE leaves
+            in a holding pen. The kernel writes the ARM-state entry address
             before sending the interrupt. CPU0 is already running.
       if:
         properties:
           reg:
             items:
               - items:
-                  - const: 1
+                  - minimum: 1
       then:
         required:
           - cpu-release-addr
-- 
2.53.0

