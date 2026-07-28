Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4D54749E7
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 22:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785279496; cv=none; b=g6gE+JJDVNCgor65coY1A4flDVJ+28nHArW3r0ZE4K1PIZegaK4k0KlApjYunnsDDkWoX0eQ+L5DstE3LQspk9PIvtYcnhIUeLVobABI6ODhJwRQyosAmGLp1MY/htp3RBx3sp5ejTmKGGaLf2tTT25MuGiuDNLpOiNpIOMtohQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785279496; c=relaxed/simple;
	bh=gZAVNAenNNe8ShNpW+y1uL8RlMk/a2pYRFQS9VthVm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ft81adjnGCTKrOE1gj8f93IcSQNzTUrfcLXgHOsWPWlAdMMfUMhSO09dUb9gw4kJ5xW1kyVKN7uJaQpis2YxtbrJGck8H5uxaI5Otk5GHnlslGwxGorUx13hKSdlnTeYWmCfT6WMO3l8uOUPOPxgyFYfRxk60vhnwYkxrwBiUao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxZ5D+xR; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxZ5D+xR"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43b7e186a0cso100227fac.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785279494; x=1785884294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=NxZ5D+xR9vFeQeN7GGppFvCkY5CyIJ2DFLe7Aql5KixIayPMpEJQOtwDs4O3OMPThz
         NefCRduJGkGeHNHiC0eEKZ8LTY6ctzJhyhsVHjwfU+fTAiF9XpOObKi5thdl+Xwa5XT2
         PLqVHuIe63KF9Fcb+Uywvu5z/lIz6keSl0dikIsdYsx4QIg21J/l5Ee1rztx4AfQ6r+o
         EYrkwOZVc09ATuqrYPbBjge55ut+BcKg9GB/RuakLyLvvY5ABI+MZ9Fk46cRf7PswrCa
         HjW48L9jaT67TuY8nmCK3fCiMT+d/jALLtOjdZkNZZ5OX6UmFIFU8ev8SHA6pBZnIKUj
         YlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785279494; x=1785884294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0mdfiM3qjdIeg57ItkPiqiLUsLGffK5s/s59dcT3jw=;
        b=MU9WTrGUavvvn1Rc9EgE+uM8Z3FVpRwQDxVns8qWktb//gkqbCza5Ql5wZuGFnvrP1
         7vNQBq2v4749q1yWM+HaQ/d0K4AizBCpvCxab4Jmw1+T8sYXMEdZaTgWNj0IXRUJiTII
         B254JoDFFqNb7z86z2JGkP8HGVfBkFJsS3GQeJ1EsuG5uYye9zj/U0w7Uy9sNck8p/gy
         7vl64/rz8sSc55JaJNVFenE24KC8VNhPeMiwy2nFOqfaG88E+QjfsC30X3CQ1sGvVeLp
         svwsaxFjqb8XOfiyZtaZ+mZpHRTPzNO7zloUk2zypHgMyNBIp9CEQ5U9aaZBoKYaJrpW
         rpOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEqBoflLSNF6wZYjwdDNy7P+NntF5jp23Y5gj8ULd3S+1HP+aqzIGX5v6wqXp3qV13nk2LoupUj+iX@vger.kernel.org
X-Gm-Message-State: AOJu0YzaltTfWbK+tv/bcoeQ77sPw4Y3q5jCAXxgmZ6BL/gggl0iRZxa
	SHyh6YWUwH4smHo8vt4gOhBEPZptZn7ivjS4WRvZbM5M3/gbPSR2e9oQ
X-Gm-Gg: AR+sD13tMk3kkA9Umkh+YfmPS90DF6UephS8hz99c6eC5TLLqQQY7o/gRydnnCUbLlX
	imNTARef5tXnq/wgPFl9wh55cMx7YRXoDFnja3fByrk6FAnh0QN9hwJmNb3lk3MVu18+nfcl38O
	MnOOv0DHbqTlA5vKXPCnMp1gxxERwlmut5AlnqsZPfLdj884tyU4SF7tsm973Zzidhj9oTQhXKm
	FedpD2MUjKYgqYnL8Jm4OC/IccuuO/RljVnxebypmBXZtD33N/DQ35XqxpbLLa3LkNm2BAu/kVC
	V+C9WU1B0s7GJKMazTOaRDythzuE5dHBCn6L5bOjhYBw6E45I3Cx8GLN50OjBWOEOUaj4HLv+21
	LaoG7VncyrZo19Xu/3YdtrVzFZogCfYwUD/V2jpPkGr878m1ivyNy9/I/6ld72HYL5gcdIHd1ba
	CdQo7x6x0WINFnJgacIoEEcUjUn2nOflx6MXoLh0rbp3Y4ng+2k+nr1ogegntWCE76Dfpbs4uva
	i8YLZZnAeSFH240TW4=
X-Received: by 2002:a05:6870:5b95:b0:447:9dcd:ad3 with SMTP id 586e51a60fabf-4586cb510a9mr2652330fac.18.1785279493899;
        Tue, 28 Jul 2026 15:58:13 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:9162:e42b:cb94:2d55])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4588646ade0sm990277fac.5.2026.07.28.15.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:58:13 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V21 9/9] arm64: dts: rockchip: Add icm42607p IMU for RG-DS
Date: Tue, 28 Jul 2026 17:55:40 -0500
Message-ID: <20260728225542.174825-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728225542.174825-1-macroalpha82@gmail.com>
References: <20260728225542.174825-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the Invensense ICM42607P IMU for the Anbernic RG-DS. Mount-matrix
was tested with iio-sensor-proxy and reports correct orientation.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
index 8d906ab02c5f..b770bfd5268d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
@@ -871,7 +871,13 @@ aw87391_pa_r: audio-codec@5b {
 		sound-name-prefix = "Right Amp";
 	};
 
-	/* invensense,icm42607p at 0x68 */
+	icm42607p: imu@68 {
+		compatible = "invensense,icm42607p";
+		reg = <0x68>;
+		mount-matrix = "-1", "0", "0",
+			       "0", "1", "0",
+			       "0", "0", "-1";
+	};
 };
 
 &i2c3 {
-- 
2.43.0

