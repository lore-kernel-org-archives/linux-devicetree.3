Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299657;
	b=lTvjuqBRiuHCHLp2r0qWAcIjrI1r9S6TNwGxfxaNBubiy+9UqY5S9SbzvX1M16AdqClF
	 2mOTk/bc2XKVc502LZmJOhCtRvSrNObMwmqmeLG14cyhMg/w4hbbTA3xC773Gh19wVD5S
	 y2UmJrkZjcDCyUBuavW3cVVvVz92URx4DgNeA4pOATNZhT6xn0PDTi1sbwTrPV8FKnRht
	 nPX0fIoCk0MmA4O5ScP0q9/VkDeA/hj5HWrQ1229fZZv9IdvPlQae5hs+zBdsaW14DY+w
	 JHRL3LssgeDhj5oCnNRoeQkbH3YciH5xj5/d5vf9s05AzLpj72iCQMBYAGyJv9tvebA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=Qd0T2BAn3buQpYmTHkuKgEsWKVSJcY1ffBuJFHbwcN9zaPCCc8aGFnF+DaCqXxbH5Qu2
	 NaDPPl0F238pVF13bwzPFBXQFPDOXeg0eNsepSNUcRGBNbiYB0puSB3Q2DKPq79yzsfgH
	 2wBVBfzA3SqmQZVFgp5cHLOssHOvdkm+lDvDlF8LTTHeVoDIr8QNM3h69vMdCISGIjp94
	 Qame5pBWub+rndSS2uQsLRqwAqn9jUoqyqvRy5sqFAp1g1fX8g+tIqAehNoF1auem/Y+u
	 KGB4iSAihMYzXbvEdlHOsi3kt0wpPE8PI7C/QofpDKgjctAL1rn5VTy1FgwpyYx37wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urFX1dBt;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE7460A2617
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE7460A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urFX1dBt
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6f5a0893610so1994725eaf.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299656; x=1793904456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=urFX1dBtAkSRh7CaH7uplo2mLheuBgHF8ZvinGqgnFBzci/WpFCZ9ZYTt6/TJeSyVu
         mgKRy3jk/MADUQg/ZGVbD+1TSSkvgfbAA+qQBDQn29skTwK/7k4aWiaoYukBC+6Q04Wq
         FLNl7OZUotk/GIqVoTTKVTCpDEfiehKeHSwTASTVd1auo5eFyeN+04mpV4OE49HsuAUM
         lh6ZedEmWOHNG92CjahHYITeNSozDN7o9KbvPDyx4WzCIi9pz2cD495A10L7RUaPN3/S
         Loj6/aXPj+CvFH7lJcbJwYsLWKXlpUAMYRmCgRaBgprES1G924LHW3E1EAn1ZU/WjBTF
         J4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299656; x=1793904456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=ssgMmwxk28jsdsYU8KNc++WnkrbvbSTjdKIPILPMpy3wr+e1sV5fG/iAMgJFUkfRWs
         lsQEUjF+vWJhLVFHbLWyhNkHPzTXtbx0qmbZBYhfwryVMNdJp0qnTQ+67m8xyWRYnnCu
         KRo4jypHYswLy/sU1azW9Ie0EPP21X3uVYC0OcDpbRd6HBJ5XaTc7zSFpEYTv6x51jzd
         2nlfTE8mMlxNZyq1oFhek43A4OcAF6CN2aag879H/UPldkIyh9O0q3KmatadR2EVl+ws
         4U+1Yt9XfoSVj0yl5cue6Oknmjyjh3Zh1HBktuX7UyoP37OxP0y5mHoDP0uSSCKUcdfd
         q2oA==
X-Forwarded-Encrypted: i=1; AKwUvBx86KV/HXOQe5NQmHOIK65ftsiuxZ0SuYUkaPVJMJqzo7mDGQGN3Ykh4DaZTSoX1NYnk/x4DpE8D/Vo@vger.kernel.org
X-Gm-Message-State: AFq9FYLU95xosTg73U/d1W3A0WFwx+UkHOXOLuMzraI1vMFhWkObN04B
	4xngax1/zPQKcM62WftKYhoauIUljR5HOzpgdKWBuFPDsRHhGap81R7d
X-Gm-Gg: AYBFou0HRd4gHvpPf1NNAKG9K83LYlDoGb5DtNs4eLPHlxDI9ILTOuvXp8UHLEO9oAJ
	9wmwOHXYlKU2X+sKkPXyjLuiOf83Uj8yn/9h8M0jHzXIn4F3BAVjl1JzOoQA7oiL52rlDamT8jr
	COll7YpR4P2FRdWAA2QBfGkFZ7mgrdRLqPPoC8yfEPuPQl0oUa5yIlDC/R3UY3IptasjTKCuCHp
	l1D/6FkL8DdpO1Yq9Xqv47UH3d8abqIPK5uebLWu29//htb2gqazbBdpcLrGnVPAISz0SBzFg/+
	tZXXzNj7TxhLv2Tm3qAxsmymjJ0GZpiZhDTorGimMuA+Gidwf39jj+UspieLm4TerbSSrod3DRH
	C2tiJWxulf8i/y9o58zNIgERkYxSJGMqTbKgRO+1skU/K+s3fNcBXFtr3UN7SFwVKeTVHaEMDyp
	b6+OLPUScMh+YCpojhQz04lcjqsCtO3yQyapqWzv7CbRTADnn3ODB0Y3mBGJkiHNyKWKYe5SA2Z
	EMcQUSCcXtIZlfUMIIfjFGhm/jV2n+VBXXHdFT7z3hgqcfAvw6TyzR+giZjgtSrbfWpVh7qwl/r
	0mWH0q0TTLmpzqfqK0ycUqXqzjzhxE8ZyT4THydsuO756ueYGmvrruJBfQe9GfeXIOcl9SD2nHl
	DEfhZ011t6aL/a3EpNxaMITHe8JqeB8/WRivQe+O3KHCG2KbOTGAFaP6pfoKt4zMj1TxHBFeTCP
	x3jY0L/ZVXsbHAmL5YBZ4D17SUZU+/NpmkNW006FgIL/paxRAH9D0=
X-Received: by 2002:a05:6820:1518:b0:70d:9be9:5351 with SMTP id 006d021491bc7-714f29c23camr97099eaf.36.1793299655746;
        Thu, 29 Oct 2026 11:47:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:24 -0600
Subject: [PATCH v5 3/8] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-3-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

