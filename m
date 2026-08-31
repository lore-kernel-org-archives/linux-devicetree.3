Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D9E3E025C
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169528; cv=none; b=RizWM6R2FEwzNypip0hT9SbsU049NvS/9Q+jqKiM6YjwQcwSXiyS4SVujYnf35P6An9jlNUnuJbbSN3vfWPTLcKt6o76SV+DSHDYJ0u4wUgePc87Ow3BqC8KsBcH7fmpmUsiMaPID0qucG+vig9RF2yJb7zwQ2GTBXIajjArjXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169528; c=relaxed/simple;
	bh=rhIMHMOLnpQiyCwraNUoq9MA7SOjQO0C20Cw0tZcSBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F+v6UhtqwPVCxIKGAL3WgJS+h3550uEFqwkERHhq5io7r3wcl35u9TlycRCDAq2Bpy6/47xcL0bAylVOiPlbNPPUYhwSFOaONjR8eCHxMqUBhLAMO8w/bjo7zVNVPyxBng64Hs9KyEuv2ngmoksafnPbYl3qZB2qKG7xN9mIS0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IaE/THbf; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IaE/THbf"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f96c5b722so2000246f8f.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 02:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788169523; x=1788774323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1adx4Gc+EAGVyQph6bJvgo9B2nQWzOo5SA1jOlLp1vM=;
        b=IaE/THbfisO/0wZAGnXPQTQw3oYSHoGoDfeuRxTsAPwft6lZ6qgLIaZ+vqrbN+6rZF
         Gs34u8GJKhf58OIHci+oxDsHZGwyR+kpu2xnu1s8GOLa3nqIsAiZOl7Sw38i105jvroq
         oPBzC5i46xt4X+3zRp1C7L7lB7WV/nv4z/myaJ/Sn4FBK7ughgsz2yntkXJhmnDEZIJC
         y8fvo+/sLM0+XGdoiW2LVaEBL6x8W02rAVm7POxtp3k7ZEbR3vY+wubuaWv2htzdVOe6
         t2+otemKpOmucJ9zJntDhbXYAkiNbemWVUOKDUmg5zol0pIpjaCieum0au+j19uwXIQs
         Q1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169523; x=1788774323;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1adx4Gc+EAGVyQph6bJvgo9B2nQWzOo5SA1jOlLp1vM=;
        b=F4oE0D0XJQ8DZjvmihGeTb6yu6kTaoKSTM8eBQpEMpxB9rCNnhudXBilxW8fv8u+C1
         BQx7U2gIAQRfOPN+GLCzlqVpz5B3B8VaqCz2uddLT4EW1XqtMho+H6akWTsIgwBy0Yjo
         ymwkNG4LppUoHy+vVqw9Tj049+V7xsjSMoBpJwkARw/V30Oz6D2MY6cVjS1VpUQfxlSq
         /KOZ53i5FC8/q1nR53tIFGKtnWts6edds9iucFv3cR2xBvkRBbfI6isJwiZDhvs15Gks
         4CPHuvI05lcyfbMVX2uxgJ1uIwaHPf/+pbbSN4o0eoWpbVQx357h6jDjfU5vHSCTWOZ9
         MsoA==
X-Forwarded-Encrypted: i=1; AHgh+Rpitusif3PJmi7ZJYiFQfanrCwrdj1TxvRX2XKnY1WZmFC2fzBDzqPkURwSZLC0YZPDWZaTrJMpTOkd@vger.kernel.org
X-Gm-Message-State: AFuF++k5a7K5UZuvE4LHdYzisCI9SHDRjx7sE6EUp30yqrniF4kJH1cq
	+CunV8MaD1sBlXvsm7EneUKguBcnNEDVzBwkEGZRhWYk6U59mBVF0jzfFtR74qYPX7U=
X-Gm-Gg: AR+sD10chfegl7DGrInvZLvmvLmG4F34FPwq7tvxcJuTDLskri+yQrYea8fqcGOcgi/
	ZIF7lD64ijn87LNv2mOrPTsNckR1TfNMyAfFbO7hWhES/W4z+/h/3zIMccIspLYuFCMXIiLY83E
	QrgzBjn7XwYQtTVqHKScCupPDkYMvFjD5IRyQcwAvCNT026JYZ0LVdlAjWRNm5onzphSWMRxPLI
	E+lB1LXGGnew2jtgpQY4g/AfuyipxtBfKT0KR0Oun6gdNrZH4jEJrhlYWmVBt8aWDrYTkGUTvK1
	d6VkuTTwUN3uLGGzQD2s6rq4QW0ucV3jhXT2oprRsMgGrSZLOi9d1URWxSRUnMVcvyBwuMnK0mb
	urq2X1tVbLT0y7FYg+SMSrkI8UkTweIqOYcwSkIvSEv5+xDzzNiGyC53cVktUYfGZZaO8YHB6xp
	RslBDWVdiwPjcrBUnkYtcF9Yyg73HZSrGZE4HRGIqrM+1R/nro5sDic+63YA==
X-Received: by 2002:a05:600c:1d08:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49b91c2e145mr374445115e9.1.1788169523048;
        Mon, 31 Aug 2026 02:45:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a65d:30ba:195:2a4c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af45sm12860834f8f.9.2026.08.31.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:45:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Lucas Tanure <tanure@linux.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4 supplies and keep the fabric clocks running
Date: Mon, 31 Aug 2026 11:45:15 +0200
Message-ID: <178816849353.1471657.3294500872963560105.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[1/4] clk: meson: t7: keep the memory fabric clocks running
      https://github.com/BayLibre/clk-meson/commit/43e1705ecab9

Best regards,
--
Jerome
