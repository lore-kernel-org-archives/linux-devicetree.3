Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575C54A2063
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049822; cv=none; b=r7RMcPqIXXXYo0FZFJWhdNyQfwNpSfsYSpDPPAtAaEC7RVyO6l9pj1tNEuU9Z1qJKpSEfuIq2KgCmP/ohTzftT09Vw0ogKi354yzGIIJ4nCwhm0lcy5KbAMIiHWsBKwM4bj4zy2AHmCdRb/S0zWIJgUQmmFf80p49c+oPg7Jc08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049822; c=relaxed/simple;
	bh=6RiQejsHuDMk8GZEMjpK5CDA0mBU2MCT5jsdy/qodsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lxXCeepUcuLJUboBIZ9l/fZlIFcjQhm1UCSJ8dtRNvx7vFWXXBad3iTnWyzDxDCDNH1UbdWeuhnI66KwEGtXkkHSeWmHSK+yq5FDeHjXcoYfEkHaZfnplQY4qtNLEx+UIwROo3FkSTc5XA5UnI05ccXU8NUXkotUwjowVuulF9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dY3VQiTw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dY3VQiTw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso103365155e9.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049817; x=1789654617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8QyDvfOaUygnD0ia8lPvpuZz5j554Ru/BlYaTHRuAo4=;
        b=dY3VQiTwDzR80KncepmjIcdBdEC+4r17wa+X4T5xC7PtE0Igomt86n3ONHLv4wISGR
         mhv4CRhgHvKxm6lMKHIv6uJq+48RE1k6OQ1hMGir6tSBjEW9yM1jxLqKg1YDn/eiwKqM
         M8w8s0bXM5CWYgaSaus7hUvAhzh4Y1UeMT47NbLQYRu7uBH1tx6fN7u7bwtpvdmvxeuR
         sPpF6sXYaxFv8ndv7O2ayuwwTdzQIIomt7IS+h4nmaVqnxwkJ6oD4dpnjPOEGbpzSSio
         TXf7316YJFm9w0i23MGQYGGiH9hp9BB4l6jhDsTz1DJOByvLGD4tHJFKA2Xg48BLq4ZR
         ZZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049817; x=1789654617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QyDvfOaUygnD0ia8lPvpuZz5j554Ru/BlYaTHRuAo4=;
        b=HVv7KnE+Gi9jMcbyRLTeU7wYdKdrsQjZeCjkorQatRckdwghzQ/E4S7Y/ox01AwgxJ
         qAgPWNe+flhPM0vqrXp/lHWONnT3x+56Utguu9EnndVvQI61LalHubMOxb01WgpXORiq
         S3PbtMB9YWF3erKuPaW91tPa3ERz5dd+zitWXxhfSDa1510uqOXUtMwry1W164EZRq4b
         CLHAne2DlY20vNi6xe3iO0GfC6a/6YYlfpswDTSpWO2a8HeKrNIBh7Pdai6QzHlmiPK/
         vSxP5b2cexViA25uOOuazXDJ/8MiM5gXtc7Nr6+EpscSeQSL6gOhrrNwHCAh7KTOdOQB
         HF1A==
X-Forwarded-Encrypted: i=1; AKwUvByuipsUB3rKVVgsr38R6eP4dHkhw0WNQj51JvCVGrqpyOP+JmviWAzutIXDIMZYZZ+ZpTC8EJzgq4DT@vger.kernel.org
X-Gm-Message-State: AFuF++liTlV4w27cDQLxcAUES+9lylIfbi0DVVTDIsdzL1NKMNKQaL21
	m/fw+SHqwwUuG7FQlY2fqPlhrBOVWkltw0tmLv/0nzByYAW1SRR7kbcI
X-Gm-Gg: AYBFou0lXEbpcWc3I2nTm9RppTXQ+wYzEFfmtqs/rnTKZ74duTxTRI0MHTnJR439xYw
	UkeK/cH+DGTvpwvjMqiEzDwWF9Nlswt+8gW/HivkZrulRdDU2S4rHwFIu1cc1PPCgB6IZNWBXxf
	UaKy/clDd9Uy1AiQ74TOZfgI4/CnNpw59tzkrp3rvce40YlYbv88Bk9ZcLCDT4LOVFc9rA0GqCP
	AjG41OC7PqLgqty38OeHzfcmBQEEiEGRIsU2PtBM9SV+efkFj9viKhP+s8SqhsuGKM46slEkVlM
	ZzjTFq0Tl0AVTMx+7m8a8dh/A9kK4zQWD0yQs5iVyoi0afmMK6vuS/E9D32e93+nLJegAfuVSjp
	ehIMTQMfKhMF2nzxd3IIQQFxL+i0QLayXwwMCvLW+hRt/Lgfu1w5CjmoW6ibd4SK1N7+7U/VAtk
	i9HQq9DwBlARuS9ggLyVGsNfdfvTEwlvgoIY+s6s8p6oDrWDCdXZsc0yPFYgU9wVracm7o0C6+y
	Ww0FxaprX02OJc6gC09X5ks5Ykh4zSsDM/6iA8UmnmZ489OXKN9wSE3gMX8hdKUFzsXmnDi1Q==
X-Received: by 2002:a05:600c:3511:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49cfa211cd7mr402624805e9.27.1789049817024;
        Thu, 10 Sep 2026 07:16:57 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm293895575e9.4.2026.09.10.07.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:16:56 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 16:16:47 +0200
Subject: [PATCH v2 6/7] of: property: fw_devlink: Follow clock nexus maps
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fw-devlink-nexus-ready-v2-6-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
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
 Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Clock consumers use of_parse_phandle_with_args_map() to resolve
specifiers through clock-map properties. fw_devlink instead parses the
clocks property as a direct phandle reference, so it records the nexus
node as the supplier rather than the mapped clock provider.

A nexus is a translation node, not the clock provider, and need not be
populated as a device. The resulting fwnode link can therefore remain
unresolved and indefinitely defer the consumer while
device_links_check_suppliers() waits for the nexus.

Use the map-aware parser for clocks so fw_devlink resolves the same
provider as the clock consumer API. Direct clock references continue to
work because the map-aware parser returns the original provider when no
clock-map property is present.

Fixes: aacc54c67869 ("clk: Add support for clock nexus dt bindings")
Link: https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index a9c51d639a2b..48e05f7bae2f 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1422,7 +1422,7 @@ struct supplier_bindings {
 	u8 fwlink_flags;
 };
 
-DEFINE_SIMPLE_PROP(clocks, "clocks", "#clock-cells")
+DEFINE_SIMPLE_NEXUS_PROP(clocks, "clocks", "clock")
 DEFINE_SIMPLE_PROP(interconnects, "interconnects", "#interconnect-cells")
 DEFINE_SIMPLE_PROP(iommus, "iommus", "#iommu-cells")
 DEFINE_SIMPLE_PROP(mboxes, "mboxes", "#mbox-cells")

-- 
2.43.0

