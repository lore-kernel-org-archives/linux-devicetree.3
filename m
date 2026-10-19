Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAED51C357
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419468; cv=none; b=S/soWS4VR+LY1loMKFoQbC5kC0/nk7psInyCwtPOCnhnhE2NWBvJQqKAWQsNg76TuTavbA4eNB3IKB3mFbm8yTQkEqmXspCj6HNo4c3nI1NVpEyKD/bZe6jkKmcCOiS9xxOcIW0a8jyDdh0w7wPe+JDXMT+spzJuPUrKNN7fgfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419468; c=relaxed/simple;
	bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8Lgy1wZA9fuggwTjYmcyTtf2wsuRCWo0c5L1ij8UZdaIZkqs4YOC91tMwcIF/6J+6QIxDU1V/1YJa2wryerlFhQr51FcJZ3Cu4Hd0sg+JWB6d5Yvk53WB+tM66Yq1aQ/K28Gr6PGUn+i1X72Y+nkCefhxqeuBL+fSTpue9bMvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/VnZ6TQ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/VnZ6TQ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2dd76b1361dso11027965ad.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419467; x=1793024267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=K/VnZ6TQhGV1S/Cr3yChf3UqaHTZH79/pnidNGz5C+Y+OL17/CDMALm708UH9kahtm
         qCJcPdOvJt9PzLTP2xjcqZShKQps6cS+lZPMczxIzwQhMQwWAFw4gIbifiEy6Z+y+mjX
         tRsuwjzy1Wa2cyQDAe4Drx6jOcJIuLLbQjYAlCLcEfFxYjWRrju9gDFb9LmzvoFUd8jR
         KmIr7yg92rZ7hXwGl9UzcHeKb111C3ps844unsueJ4r0GY/BDhp4UkY1NqMXFe5Cu6aA
         kIL7snopLCuopIctLLOiZGcL/MEEKebPXp7aR0k2KK/GcqI+MzOJCqKsUdI9MAV9CtqK
         FkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419467; x=1793024267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=pgwOgLgWKz933em2KZ4t9YYbufkc1M7l+g1NKO7+1DnsCf2ruI9oJgAyrC9fRMy4bH
         4dVvEfxW4Vxn6590B4JhY0upjR1VPuWNTNltxv21Z0no4OXLDnVwVF+Jh5Q6RchF6KKP
         fVlCMEC0D5Ev90EPMZSkbwfDYnK8QOJr/jpGkUOxuu44n2x2tVLX6HOwfgizF9W6Kr3U
         1oWfrnnDdyhJn4bMf2togRKaV5x+YwtkL2M+u7F/f1GhqIn6+SV0CHqTH3vqszRQ2T6B
         3Ux2L/K9Udq5cIm0FJhis34KisHqoauAO7AcAKjix79TDvV4bOdffgVMBtrGpy6SjM2b
         xvXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAEHCqPWflUUs4bX7pOZdzgEutWj21Zfx+ach/V0lAjB7IO6ql4hmExq+sasBt7u293GwTZPFPf7bx@vger.kernel.org
X-Gm-Message-State: AFq9FYKVGFeBZwhZoBYadhzrP6WNtQ1BM+xyciRrugPq+CDe6r0h64m3
	UNQMX+KYxDwMIuWZXkqzV0rZQfUF+8aZvdo/DEdPdkclTe6NKCOvay49
X-Gm-Gg: AYBFou1WxuBF1uaFV2ZfasIN1LRcOGQWq7jwOkI4oNqH86SOH/KHy/cEnHojz8hsf6R
	Wv1uk0Yk2hD270eW3RbISW2BT5KNha9pahMOzefOIqxP/msgtJzvewxTZguhL3K6Gk4Ueyhido7
	+LFJRHgLqOgGgBiRo1C18nZr4VONSDniBTV3UH15uuCRE3YatM0uz6D4dgOFRwgRX60pJP9dNsf
	1vRBZh694t9P42eJJry5IJkzYn+wKKEU/Kxqi8BF+f2V0sffLTcpi0hrSAZQHA6FWCexAzTQKh/
	g43DmHC/zz67KkJWxAvVPWS9bBnsJh5p7/jsE0+asDlg7SVy7nJEoAONn7VITMQDjPFgZ7nJCmI
	S5pQtFIQh6lnn1FdVhM+bd0ujQY2k7+IiRxPWRG+AZaYKdlmVYCccmxpGKLGeF0N8nqZfBYlxFO
	kI1yJFId8B1Adum9Aw6SJX+90u6imeHrXUzuRHSw4K/l4Q6hibpxG+ysihQV+7+FCMGcqYfjqI0
	1cCa2tRPSNnH7c6s2uDQkjqTvJqI02c4D2zity1q4/DkG70OiC0/39KzZxJXY92mnJnvPWt9DGe
	7wuWuwHn9JFU7IMaiTIKtDVxCbNn2pX4FKqDIO29Kif/wqD8BmSZew==
X-Received: by 2002:a17:902:e943:b0:2e9:79db:449c with SMTP id d9443c01a7336-2e9a6f55653mr62822605ad.47.1792419466462;
        Mon, 19 Oct 2026 07:17:46 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501f933sm1697925ad.50.2026.10.19.07.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:17:46 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Mon, 19 Oct 2026 22:17:38 +0800
Message-ID: <20261019141740.2077086-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
References: <20261017180141.3477743-2-alan.tseng.cs@gmail.com> <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi E,

E Shattow wrote:
> Drop this last paragraph/sentence or place after scissors line, not for
> the commit message itself.

Thanks, I will drop it in v3.

> Presumably the BootROM does configure all of the above?

Mostly. The boot straps select SD, eMMC, SPI NOR or NAND, and the
BootROM loads the SPL from there, so the SPL needs the same
controllers and the clock and reset controllers behind them. The
BootROM also prints to the console UART.

i2c8 is different. The BootROM does not touch the PMIC, but the SPL
has to set the PMIC regulators over i2c8 before it can bring up DRAM.
I will give that as the reason in v3 instead of the U-Boot sentence.

The BootROM can also load the SPL over USB fastboot. I left USB out
of this series and can add it in a follow-up.

Thanks for the review.

Hung-Chun
