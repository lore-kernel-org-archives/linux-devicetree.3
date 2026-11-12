Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509669;
	b=v5DZSIKixu+1+kUfkWQAmcdNqnYaFY1m9uvEIC4zdH0LH02JaAe/xM2eJmAzHqvPoUax
	 GsSohBaolp3Sxr/x1fUFq/W+MCtupfXC9bxvn5osy9L+BB3am04bUDJUTaFHGPYGr4dHN
	 vn74wKZ8M6/I2eT9eftOUKKBgw32UCCU30GVB5JjU0z8AcxwKyneMMmepakE/8J36X1s2
	 QiJClLB+l8wjRW0hO+CoXHmq6OfLy6wal1vOese7xwJv0ngLsL4cXf17Vl14Co03zkpwR
	 wk9yfjq8OPyQFJxWobm8HrX/vMmFQl7+U6KiQVM8FpeN+jTrUfA8RsIEBqHJw3StSHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
	b=bZgDT7RnTGctBE2GvmNAIqSc7HBz+R4zNLAJ0iKUQFWMImOoINDoFRngXB2yF+0qEnfS
	 F7IskLVb9sU/tw4eFpr1/VLzic/bwUmP8p25jASDMNFH80J0mrAL86PWu+mPpQzgB3C+v
	 nsxJSMGK/t9Syr2iX+rZYuRRDOGhDs5HEQxvDokFQoA2ZF75st06NgDOYLV7BuIfqCXv8
	 sV4HP+VVog9ApEoN8+0AjlefqhSmbpkZ8IyhjwlfieBR4T01f49P4Mm7yw0DHW+oE5uMP
	 pAWOjTAGWDzrsHhshsQI0F1po9GqLc2GbvVKr3Xeo9IDoEvPfcaf0dAeoXgEfcjx73g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ika8RJU1;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4BA6070F4D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF4BA6070F4D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ika8RJU1
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36d1b3b9974so17131eec.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509668; x=1795114468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
        b=ika8RJU180o7R0uM/ThueU1zLpH83uj4J9/WII8cpnYHL7Pnh5XD13+K/eoscIleR5
         gQMtaESU43b1KiF3Jvu/VcMf21hQ6vFfMldzrEUFEV49bmYLXbdNIX6CrrQ24Fp4w342
         tfbl8ymt7yHWyUu34ERw8PLR89M3l0hRjHRd1e5wnptYykXoLaywqeqaaa7D9wifhO0B
         s4s+0pw5vSi/nGJ0mHveKevjIrEiO0w87gbGsIhzeFykTs8gBI1es4JwhxOMFvSVVe6T
         Y5TOowq1AywZ21LAz+nI3gXHPjIwYrdN2Dn97di7zGJNFbZPq6birXMp+rzKIue8BSFS
         nSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509668; x=1795114468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G84wSK0nUUfLUVTY4c0GD6hajZc/iWKJjasXJCCFPjQ=;
        b=DtFlz/9O3SxsZT81HW3OFF7b1Bh6TQ3ZPZ2IPYXoYETuqh/c/H5pdqpPimEB1oigKD
         y/rZ2w+QCnhzfKyuQeoeyqNcmYMmpewFCxgzjwSDuqcG1Z/ZPG8XloA996hnEsWOhjcd
         NrEMn2geQI3ZINh2qTl0Q88gVlodeeywVLM7zyIBjeM5nGbw0vAn1uJn48yoVVQj7aJ3
         IrMRpX97d+Is4TjuBQb7g9KhzkHRblQ48Mp1nkRjGxgsnJKQ8Lv3GAIZv8DXgK7WQmcC
         LueCJlz8jw2RhWXPeMuEea9Tj/x2+HfwbMbMMBfqZNHYRbIQhzQxK1NtYx7XOgfNrT1/
         r5mw==
X-Gm-Message-State: APuU4Z8w8dW5JFPP3yfDXhIqkWbdkxeik1ZZx36d5HpG0VdTM0+wmTCe
	OBrI8hE0csTt8Q4GvWGVgyOPlnYr5unmYoeO4Mk4GZgsHeTYxwPrTGi8
X-Gm-Gg: AYBFou3TJYPvImRjfvo7+E8VPqlSWjMf/rJ4OEVc2AaLR8xrIl+lkRGAgz87r+qs7Y3
	b7+fUAsU8zyhzCgVW13f2tyUnN43SL14ftDaTySvGG2qMuAocWs0BeIGy1Urf7cXcw/jIwg+0zo
	IcaqUR/iJZoCFWrX0AEDs2DldBLNrtEEwOBhvLPVklX2WCWK5/QPRQImhMD4VsAVu/nfJzO8jhI
	NCn9a7wDbg5GIIQm95e5ODuOR7qvGjeEFBFlgzO5UqU2ce7Z8dYzoq0e4lOSsK1Syu3/NEtRGjH
	Uq1Wk6L9NoRKtE3KiRkQI9c14nGyZ2YIH1yGnmE+V9JT9vf4fnNyO+ddL6WrRQiYZIqm7yVnd/C
	GWbUHPJv6eXKMo1qdVS3n2clhgQ1vXsIv0gvKn3+6L5BXDa1hgGdJ7BrLa/s3S7/gm/7U54FnrW
	iN7U9EtBI1Ffxisu6/UjBxYtCfaABhpI+e7YWsZ1+ZZV7czNPbBsN52WvKHRnNDsWRMxx7MfEXh
	p6zECy1W5YpPebRupmvwvFbyR71185Sp/OxDmpmACNmInq922RpGOpK0d464JRZh0fj3KzsrjcU
	mi+viohsHQirFfUV4Q27RXdE50X8uKt7QR0+5Dslm0fjz7GFTTE74LKckyo=
X-Received: by 2002:a05:7301:a0a:b0:375:f846:5b3f with SMTP id 5a478bee46e88-3796057e734mr124077eec.0.1794509667847;
        Thu, 12 Nov 2026 10:54:27 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm339008eec.22.2026.11.12.10.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:54:27 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 13 Nov 2026 00:24:02 +0530
Subject: [PATCH v4 1/3] ARM: dts: omap36xx: Add unit address to ABB
 regulator node
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
Message-Id: <20261113-ti-l3-noc-v4-1-5084dcf4ffb4@gmail.com>
References: <20261113-ti-l3-noc-v4-0-5084dcf4ffb4@gmail.com>
In-Reply-To: <20261113-ti-l3-noc-v4-0-5084dcf4ffb4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509656; l=884;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=mRJd2FscObSZq+5xKtM7LxfhPVQc620l8Gz6i2pWC0w=;
 b=pexz5pY2dcZ6Hx+y6xEeA6ThGdmSU7B3tZuKGyzj8Z85JLBcsN+Djlp1EMwATCKVc8aLWOC2l
 C5Kq5VQzmfxDXCz609R7FvC00IS+VDvOdRXURFrGLIYF1CkcmU3GynC
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The ti,abb-v1 node abb_mpu_iva has a reg property but no unit address,
which violates the devicetree rule that the unit address must match
the first reg entry.

Add unit address to the ABB node in omap3.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
index c217094b50abc..6df66eb7e7eeb 100644
--- a/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap36xx.dtsi
@@ -92,7 +92,7 @@ uart4: serial@49042000 {
 			clock-frequency = <48000000>;
 		};
 
-		abb_mpu_iva: regulator-abb-mpu {
+		abb_mpu_iva: regulator-abb-mpu@483072f0 {
 			compatible = "ti,abb-v1";
 			regulator-name = "abb_mpu_iva";
 			#address-cells = <0>;

-- 
2.56.0

