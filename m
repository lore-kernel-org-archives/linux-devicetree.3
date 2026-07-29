Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05528407569
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325401; cv=none; b=cIo2jPKThHXn2bnt5WxsLIzUEnyyGKScqd1rJQkmeC7a5PKGQQm39lmX/x3VXkdf853r7pqvOrO9Tl3bZ2vX9RvD3Cj0X0PTBdajeM46w1oYseslWuv+xlhc9ac7fWrBixUgnPuoyK8CuJqhWuetPdrYkxDNsHDUmzzoronMGwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325401; c=relaxed/simple;
	bh=iHFddn1NgUUqhSC51J/bjqOXWMO30/0lFQI97yEWeag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bM9QZoBFGHs5sh9K9p20srkpF6+cVYT5Xt/4HZsLi1SRqYGqP+YvGlY4E+GjQ9u27kflIs/6BfGLOvCoCFUaLq/Bu7Z42lMWaj/wvi4MhnyoKytXimOadcla4dSdtqHvrZ6aWsT+z7QqZyAJQXYdlQ3SmjU8WcUenP3ddhbM68g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSbDspuQ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSbDspuQ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so866979b3a.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325398; x=1785930198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUdqR2Hxxm0m0RqPyLuS7KiUs0HH+0wvNQWmKBLU3XU=;
        b=iSbDspuQ3bqe5+dd9R9l57y3xsrCVpbCFziSR8r+xznh2QVgcE5DxKyMIL+mArBaKp
         SVWhr4UWTT+COE1CE8nUGIa6wosNtWU/TWErLXTMgUWjEDOcKo9e0dVXHHGljfj5aoVm
         4S01G1doNv4KFiNY+lr2UwlR1rrfz/iIyGrDMw8Y2VOvNuenbYGbWk+Kt2BrjcysIxBW
         W7ovjPzZWcrFCUb2M2KZj+WU7ht7nhbnMFczGGBj7MKJLkL7LqQlKkFvYwlILBn2KSfn
         TxCZ+lFi67pPX6SODECChKskavSql8m+FToj4mKoBtbV6UxOmncUhpETzifeAiA6UMJY
         MbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325398; x=1785930198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUdqR2Hxxm0m0RqPyLuS7KiUs0HH+0wvNQWmKBLU3XU=;
        b=ZsoZ98WFw+jNBPf5aH38v3M9rvry3szV53Au4GRUaXeVeLZdJ0OtIg2AsGQ9YV09Kr
         TCxTnMjYAVT7i24KfgXVwKjfZaewXTtpL08DDrxav4coxzQfMyzLqDfj1sBkM9YTb8wG
         EvukfFv+f0IWDp/ZbzNhCew1Nrl4Pn13Swsps02HLMJmmUOWMGgLhSnOMnZpzcZ6ZDsr
         SyuVay3q3bKHNm7JfUSalak3wsnsgeRnNFaaEZN/oWcSz71+1CfN+I6Ibw3ppMKWrbQc
         XouAmyJsmOU5j8hyrseF0nNq0aqZf9dOp/U/EevwVZMcohYGwjgdxxF6gVniF8JlCEpY
         m49g==
X-Gm-Message-State: AOJu0Yxiy4OTbWnMHo+7l2ke/xO5jwtipLgETqvxS8yTpWB3mYl1nSN3
	VAoRHMLpcB3Evupzo6ubgrfdwZIQtuY7SHuXMaO2wyB0N6N93/xVvztT
X-Gm-Gg: AR+sD12jML66fuk0AK4vUUF9jG4j7YTgGnKh72i8a6MRkqQZKdungIjg0TknjTaL3xs
	P4jW1oQMV5jFJrBsNJRFlKkxNEQCIOqC6klAxgyaIHX1GZ3E7lEDD5vnpLv4mfBlC3mCUSD7sgs
	dXvpNbwfAmQDNxdy1xfm37+ypJuhJNnJrs1bLps/JXz2BWnAhvmdSN9LmmOqd69Q5wsQQU7lnhp
	cJDOMWS7AFWiqEQ1xtPVuFevgA61fJ7UHVvphURiJ2YtpcNwQGN2c2HIUjcCYJJ32h1BFGeJqt6
	jrCxBR5ypWtVkOZMUDWvCbr1U9h+OkbBzr3E8BsImitOFd8Fkqhq4SJ+XIKC9218pq4uH3/JTrz
	E1apQurvUGgcqNk8UzTLvy2X9eQyNwH6SvNfu4VgUj9BX54i4LMWhZXeh70gbA0G7CKB6NfZ0bV
	i3d71vfngMR+fiiCks89zLqThYdVa1DBW06wut/MiGVPIZG9s1/CBQEbKUasn4Sc9TNnnw1oAPj
	y6rDYucUOpDpShUvLUqHSViG/5orpcYWkY=
X-Received: by 2002:a05:6a00:2e84:b0:84e:1a9d:d879 with SMTP id d2e1a72fcca58-84e93246ae3mr6928584b3a.28.1785325398098;
        Wed, 29 Jul 2026 04:43:18 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03cbd1csm1263532b3a.53.2026.07.29.04.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:43:17 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v2 4/4] ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
Date: Wed, 29 Jul 2026 19:43:12 +0800
Message-ID: <20260729114312.3947300-5-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729114312.3947300-1-chou.cosmo@gmail.com>
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative ISL1208 RTC at address 0x6f to support boards populated
with the ISL1208 instead of the primary PCF85263 at 0x51.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 3da1cf9bbb99..01dbbda3e4b6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -1269,6 +1269,11 @@ eeprom@56 {
 		compatible = "atmel,24c64";
 		reg = <0x56>;
 	};
+
+	rtc@6f {
+		compatible = "isil,isl1208";
+		reg = <0x6f>;
+	};
 };
 
 &i2c7 {
-- 
2.43.0

