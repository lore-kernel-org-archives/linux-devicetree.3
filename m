Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530205;
	b=JA7MPDF2fm5GjP4RL2Dy+XZ7uAMrqqPA0477+cdmfDUwW7vONgLefeoWkSalT97JzHCW
	 MU2DN37ein34XanOqUkHfBG8m68o9vt4fUx58ZQgf1LKSAuqwAIVv2YWoxc/ZcFMIhJR5
	 acLPHS8B+/LjCeGQvA8nNEnaqowSqlCr3V8a1H08HxwDabLrEcQZg0LccV+CXd7PlSMay
	 nQF0ss+9EaTu0k7AXrVFtOyL2Qg6xB5x4zmRWwK2hfPUGlcg336NoYMPSVN3sNLAnbgsq
	 ksSbCKppj7zDf4eVV2WIRS/EwyTR/Jv9DZqV6Lo9rPjWUb1iNpfeElMakmkQtGsEwfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RGmNdmvX7GyDyj3rjdj61uFnaluwz5zplmLJm2EDWYg=;
	b=DVUq7we+im/IqpC7hPnJ84BqiQKv93tk/pZI3mdjOodkSvrUMoqiEpIdCOap2BKE6ErH
	 SI/9iSN0d/YiPNzOt8CdKbUyRkYcBeNcsozo+dwhJ/hhE/R/QEqOVQVW8RUXD7mgsFB+u
	 bOzLB6GwDuFPjIAv0RzUS2Rz34+ffOqTgMg0PL+EeZBXc9aIDl+jjm5YboTmNGUdSTqw4
	 mVJu7frdDAKY3IKFd2IKzQuqWlQ1pG7UU2+W/AHfrWd/aPffeg56bo7+g8Q5DmUg3/s5E
	 rWDzu74JfAZAUux3T9TbsRcuFcVU16S6GsnZHzCEPHLvkJEMGJv8vu9UzTBYkydlQnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WWf/6nlP";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BADA606A8B2
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BADA606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WWf/6nlP
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so8655805e9.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530204; x=1795135004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGmNdmvX7GyDyj3rjdj61uFnaluwz5zplmLJm2EDWYg=;
        b=WWf/6nlP0UfxD9vc8OJ9Z6fdrrsrhpUaHSohcrqqbtodLwuON6B84uadHnw0yh4QAa
         6SbvRbxibFnRfRVxb5gU4Dkf/eSNX0HuI3Th0VEQCqo7j7OmCl029F4km4y+eM2u6M15
         opihwMscPccw5DKudOQR8+OXADxW5RGchhEVhPmFkNGtsP5Wa8jKFwh3uUaRma3FU7eI
         00Uqqtb9Oa9BxFPaWKWUIU6D6v9Vro9GK/yFfyuFGr0vOnvfBRY+YzCaOKmieq3sHtxb
         aU/K1zSPQ54sq3KRmMKTgm3qoT1F6Jzq9hq/UBrOAKUS16RN3qAt0fMfqqpndbCJN4ND
         m3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530204; x=1795135004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RGmNdmvX7GyDyj3rjdj61uFnaluwz5zplmLJm2EDWYg=;
        b=gOOaJR/pKTrPGEGWyWLLkMspd0TOG283YeJPQ9x+0BZ9lyTVIVTEhBF4gZYK/pYwIG
         hWoAQWOE3iEtoLZPsRRFQm7v60fn1X4EaF8d54HtSq5SoecWgJVpoeuBi5YulIqfu31p
         riU/c+U7OrAdQqI6wkLPQkipEVUPDMrkFpqnZ7kibywD9hH+89CCUSrOVNbMDKNOQKU/
         piysuEO6TxmrpEgszfMjhWnj7WT4ggjpSHiKwtwP45b64ztkZxo32MH9NqB5xEHyv943
         T+3te10zqDrmmvuV+CH7LKl0WZSZSrdEg86PdAsYTi11UZsmYsiK1JikN+D7Ds2X7UlA
         Bwdg==
X-Forwarded-Encrypted: i=1; AL+hErEbah1sFhcPPepQoEBvj8guAcfTtxztx0BaMhwOz9sFLm0y83KTmmnBY+hEYYNnP/IOq75WrWiFLFWg@vger.kernel.org
X-Gm-Message-State: APuU4Z87Anb0nD6SQs7EfgjjlhlJg06t1t4IM9mHLBQHV0V88KYUMIe4
	52n4MDd4jLzLDYQanHwzfgchKCeFlwZ2fVdQE9Ljped/10zOXEmmp209
X-Gm-Gg: AYBFou2wcaZHyGypWKKSLZZx2avGzn1bXDKo0UUZERdsSPJMRTE/IYVU+ul3+X3OwU2
	Y9MmUOjJjWgejmGnbmarBdTWJ961oC/V/DjQBCR4/4ej93OMOjRidgwzOyRElo0jYtTNUnoh2CC
	tCnLJ5v7FAbCgHOHjlQu/ElBtoIKJkFOUltDvI1wWqJnWiJeIeSo95SvKyyKgY2q4A0AHhyGP/9
	a64ApVFa5hhno6adNM3SkhErdWLyha0DDvlAqKHs4Y+KVXxA3TU8V53MFSu18GEvq6glOTfb7+R
	zmjBjMKlJxunSWDbpWn5CLAvXdJTM/cZxTa2dS1EmSthZmykaF4IG5bF2iER2IqiV9JmzrMY4//
	AkGYZfMZ/sPIb8b3a84DMwyuFOp4D6dPdj2lHUODM3ZfwRiPlMLr3b/WsQIk5Tnf9WHsg/wwCys
	rncbfupMwOYLIanmlN9skp7InWavknNkmEmvAjRtKTfw+IZ95i+0gcl2/3Bg5qRfvMwWgxhYvSP
	6Twizow59/X0Sy+cG163MY6OKdR/98xf2cbmXmgdOwpk/4aMAWgPpDmLii0vu05aOvGtd1plZyh
	fpM3fi70yKYv3xUEmvH1pHo1RoceXdMmCx0Zvf2iwmND3ay1FGYi7IoL2bu7XeCBx90mnhBCOvt
	cggIX83t0NmC7AfGA0PsmtDbEOfGuSL2D/qxMiniM8jyYEPVEEPT9gGDic5a4w+6w3IeujRyD4g
	XJ0osxGIniV+2TC/TzwBLy/J1D+gdLjOtE0cM0DA==
X-Received: by 2002:a05:600c:1906:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb55ac2a34mr19676755e9.17.1794530203716;
        Thu, 12 Nov 2026 16:36:43 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm3282945e9.3.2026.11.12.16.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:43 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Fri, 13 Nov 2026 00:36:41 +0000
Message-ID: <20261113003641.3664652-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112072953.989664-1-isasmendi.agus@gmail.com>
References: <20261112072953.989664-1-isasmendi.agus@gmail.com>
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

Hi Agustin,

I tested v2 as posted on my ZTE ZXHN H3600 with 512 MiB and an L2C-310
r3p3, running 6.18.60 with the OpenWrt patches for this board and
booted with kexec.

With the cache node enabled the cache comes up as before. With the node
disabled the kernel reports that the L2C is disabled by the device tree
and leaves the cache off, and the board ran 10 minutes of Wi-Fi
receive, Ethernet send and PCIe config reads on both CPUs together
without a hang. Like in my earlier test, the previous kernel had already
turned the cache off before the kexec, so this does not show what the
boot loader leaves, but you checked that part on your unit.

Tested-by: Navid Ghahremani <ghahramani.navid@gmail.com>

Best regards,
Navid
