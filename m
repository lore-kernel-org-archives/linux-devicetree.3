Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340389;
	b=jgMwi8y/Ie3tcRLdqV0xepxe9c3lXeWq9VaERRCGGKsL3zANBlnCvOaRxCD4aHiN9ph7
	 +PrNRfSFu37MsCnZL5IybpRjciu11L5lAgjMzUBd8XNIAzHsnw5S8vVarkQMX4ZR05elm
	 q2bwEplKPR6TCWKM+ncT9ABMbGtRlLvO+GVgh28wI/vKf5Uu/FaQ8f3elGPAZvWF93jB2
	 FQR3OI1C2zIMn4IhrR1XLAm/j7hN7DZBj5ccRmlNo55q5DfbkJfMc7jFnVE1ELFTJIhyA
	 o9ot44WRIcfWP0gHnJPiNrC74bo296iKfO8TkhToaV7JxFwqVCPBE6QKwgusjEEcsuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=gQt7z0kPgD+299qyKsfe02moLDWp4KMca7T3a3EzzP0=;
	b=uHVXOAZPT5kaiNQcUGBo1qXNhI7NbtwKhDe6kBJsGSZkhyoGnX4q4r9KiZRFWjSxzEAi
	 HbIukPAqoNX2l1Jb6Q+1DsUrSaIbR3gWhdQ/EOTOU8qMkEdAuRYoi98MHhDSJBSTtr1/i
	 C3NdQY2B8b79Gt+YEE5Ydq92d3TyklHP7CL0ZSDxwvacAx49GKch/VKLZz64fE7Om58O4
	 kSJ/Lq2W7UxpKxXcQ+JkVfDJmlox1oiRcZ6E99q0X1MleNE0tunYmdottlncOF285kfmg
	 719anluSkAeIAUfR+Ty1sRyPQwYVsIC6F4UVx8AGTM1ZmOTbShVtZYNL2YD8czQbVAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J5l/iCaV";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7389E606A333
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7389E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5l/iCaV
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dc4797082so346274eec.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340388; x=1794945188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQt7z0kPgD+299qyKsfe02moLDWp4KMca7T3a3EzzP0=;
        b=J5l/iCaVj/L6+H5ov0FJz0p5e7rr/0JFjFNg7uedGUKahcImhk04lcJf3uhwT0M0Wx
         Vdol1OBCMzAk29mjfTm2OsVU+4DTDUFwFn+Mvrgeltauje0W9PLJGF4ekFehP4dnkzYD
         IVOj7AymgQYccUhEnl30tCvV4bNcnRJutdtvWpkt0Pngwv1UYqdyRA38OZ+cvKMs/pTn
         aAASDx8K1kuzF9HiC2SoTBBH6b0T7m3Uhmv9i/80vu+sPXSgH8Wr5ka/RUwgudqE2jQk
         nOWOT7jHUS3tYWwMpMH1ADpcH4eKjRHfKvfgInH9/eXZs9Tu9n/hV2SEXKfNlwQLB4o6
         4n4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340388; x=1794945188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQt7z0kPgD+299qyKsfe02moLDWp4KMca7T3a3EzzP0=;
        b=bajnJT8b6zNy+O3vbs37EM84kSG0y1PF2WY8NpydcypMl+NU3DRVmXU9pEYy74+kf7
         /V/wGvp2oSjhf/AI+RR0xY3QylzmuAx5dWjhOzIfN8T7XupAxH+lIyni8rrvrM97E8fF
         NhtXiyM9i4FgkUI8yPJc1qRFqSvNe09k851q+vgcIoYhmkSwv7MN+8d4nk1GgcU6XQpA
         reJBp2y6caGxUn0ww1LJBXASfcJ8eXhKvnoSz9s3RTE7/G/0B9aoMUCPazvrucddMceE
         TRtZuuiRCp8kxI78X+8V8tXfbYq/6os7zBWqshnR+xwUjNw21MhVXnPpiisx7z6MU2Rm
         e0IQ==
X-Gm-Message-State: APuU4Z/Age2qDRpkbt2d5zyq5Gq06GMhuVsY2P+ySTka1H9WKdk7IVzv
	03Dn4mZKOlKOVVi7fw3rpqJr0aiSYdB4D5z3VshpAlYz7/5gbvucKdjc
X-Gm-Gg: AYBFou36OihcwNLl7vUvmPECeyHydQRAstFaCQhRYg5juBCtjkoS6VuWJ1KvaLRd6A8
	+WY5DM6KlsOvIExJ5VfF5AEBypcrQ+SN8xXUDOQIPcdTS24QNiQxzOpR1rA7jxbVMCBLIneWE8m
	1UVMdpVVKlcIMGTaYREGBqFOrTtZu4Ji0LMhyCOUZ549c6uyh6ZNJX27yxemVa75N0fBJdUeRRx
	LiPa2aSEs+F03ZivejkTjlXHsWd7eCRyNBEP1v8+qHBxV5lYFMFxtTOPlyw05Ltsp9unPtUGlWU
	edVoL5+Z89l+WsqA2KhClLNsivX988zgFJoGwHDB1NyBxQLqa6lP1DlfYP4a4jhUMJBHJmk0Po/
	ijFdVDUEWQKl867ru0/npfMZVEuIce/5cobfldbz15z3oT3Z93AfMRvzE7N/TEcUS4ebz0Lb8c/
	SAidow6zkZdTpt/kiU8wws9BL1Vkdmk8dWvDZjAX9zXafO5ZRKBiS1m+mmn3V1UgqiVqUgIOXM/
	US8PiQgXSYZEvka2q5YqwNhFWKoCY1QVMrlHsdPb1h23QlCmuxxKtqZczoRM5tXhTu8OTHyWsLV
	9D8mdRk5sPPNOthJ2Dr/NVCEG9Fzpr90aHH7R84R
X-Received: by 2002:a05:7300:e9d9:10b0:36a:143d:98db with SMTP id 5a478bee46e88-376854ba2demr670711eec.1.1794340388437;
        Tue, 10 Nov 2026 11:53:08 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:53:07 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:35 +0530
Subject: [PATCH 5/7] ARM: dts: ti: omap: am335x: add board compatibles for
 nano and pdu001
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
Message-Id: <20261111-ti-omap-dts-fix-v1-5-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=1304;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=iiiNe2YmgDYbJuXDc3R3d+03XUkBIvy8dBS58FXrgXs=;
 b=3u7NS6WDKuDRZlRdtola0QbBGcSKerNcA9rN/jByJq2Q0w1OdePF/XoqfXao4Mamf79AFSdGW
 5uP5Q5J6ezrA2Hjww7BldT8zzJ+v6WtM/bFkXGXzO0NbIN7HGejeqPy
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

am335x-nano.dts and am335x-pdu001.dts only specify the SoC compatible
"ti,am33xx", causing dtbs_check warnings. Add board specific
"newflow,am335x-nanobone" for the Newflow NanoBone and "eets,pdu001" for
the EETS PDU001.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-nano.dts   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-nano.dts b/arch/arm/boot/dts/ti/omap/am335x-nano.dts
index d51cdd6e1ab40..40e60e0abaa87 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-nano.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-nano.dts
@@ -8,7 +8,7 @@
 
 / {
 	model = "Newflow AM335x NanoBone";
-	compatible = "ti,am33xx";
+	compatible = "newflow,am335x-nanobone", "ti,am33xx";
 
 	cpus {
 		cpu@0 {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
index 9f611debc2090..c36e1b7922c9c 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
@@ -18,7 +18,7 @@
 
 / {
 	model = "EETS,PDU001";
-	compatible = "ti,am33xx";
+	compatible = "eets,pdu001", "ti,am33xx";
 
 	chosen {
 		stdout-path = "serial3:115200n8";

-- 
2.56.0

