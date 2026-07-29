Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B512D978A
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289716; cv=none; b=eSXIzzxExT81wTX5M+ogGjcZpEirB+nrvl139fS6Nor1PZRHn35sdO9KoSQPTM8K/xsAw1zvGbWfuvxu1bNQ88lYFr2422vpWqCOs7CAhFubLRTK5sQvpPI28Ms5p3+ozTaAtbldZH7xBFUmcuI68okzgGy/newBfDqBe+lLGew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289716; c=relaxed/simple;
	bh=hkS3fpJJGFq5pnP1DWaVGxQA4OwEvU2qy5Rss0XWaCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MrZAsBwZFagFB+uSCnpWWP1SI62H6RTWDMT/r6yy0/zqtrE83ZTwUDDw5Y6H8FHdzLyxI+LTC8ZAGR5fGMXgU9W3DIvvlqvrC7QVt4wO0apX01+SK2408zUtG06HKtY+0ZdvD57Aw7/6HoKymtq5mSTriKB6awMYDC2T0dkVkKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jniDHArz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jniDHArz"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84864086bfeso433697b3a.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785289715; x=1785894515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J8VS8ZB1guuCz2FDTf2FUiR3jOA+ZzoXLBMbwtZp+5A=;
        b=jniDHArzMLqMRGTZJRsFwyrai603vNdzSZ7feiaz8NeACz+l7sddQ86wKO1rqCRRzd
         9s8hT+rlGy1M774lsTNzUPQsuQtFTzgv2yuRXQRIP/03JhIoGhaDpUnNNdlsty9uOCcq
         GUNkAC8ru+JfKvEiUH3Jg7wTMCAxTG3FY4b6MmtsbIZdujLOykMI37de4mOyBNo6jyOC
         fgw51r9rzIE73CMOTv/2O1LXqT5vqXdI337aEsyWcMsYeBR2wyk4IBdvYzPOk6s2whJR
         /hbf+7D2eqrPmdnVV9Dxw2Yy2FaYQyQTg4WcAAwQzfjp9Jx27X0Fi648IRWyCKC5nMH1
         /How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785289715; x=1785894515;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8VS8ZB1guuCz2FDTf2FUiR3jOA+ZzoXLBMbwtZp+5A=;
        b=LRa6PP1cSevbNlcdF4XLGwiaWBXtvR0Ub66wCUDkSg67Xjs/rfBYdKBCk7766vS9yG
         L0TOOteM0iDnqTU//9r2XQJEob+d6hXgSp9DLMk00nzAnJzRreZFfcd6jR5h+o1aK0KY
         V6FuaAy4Z/b9i0CCrC8RE9ZQKH5PcQFE0i+vhJ7rt71AOc8RxCuWEWChB4tW10p6QEvL
         ocIAz1pmU3xotqCI/DiE3PuaX91by+wv/IPNSOqP4FHl9GH0Zs6dW6/8JTB22FO7H7gz
         4FW2G++QTxF3oj+EHi3dA89KBfKF49MEgDIarEEldGGXI3t0wCXKsf5bFPOFqgtiKsoU
         vwYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsK5OgSP+GLhcGhkXgIzYT7tJZzsLhqUGKRvQoQRn6cmn8x0bCfVZ0Oycot5S7BlbtEPfs5j3RB9qa@vger.kernel.org
X-Gm-Message-State: AOJu0YzsN2uQbK0OwTpENkKRNNkJqrHW2cHBucx5zcPdOBr0nlO0a14L
	a4BdRuHb/O6X7T/kDUl4OiNz+3kvWfp1YilvgUBIRLaBBn6hzSXveC80
X-Gm-Gg: AR+sD12KiWVu3mKj7yz/qS7qqhGV1Z3KnYFMPd6WrnkB8sGR3R8KbjTxJieQEHGvsHj
	OVNrYhKlS6P/DULPnGzt5v/Q/P9621Kwc8bVgBNmX4JCQURRikG8dXe12nVYyrK9vz92NEwJ45c
	2/MzI8N60U2x+bLnOLG4cDl2y0cf/RHSpmoRl1zP936q8wykbfKUFfsFZSxnL9WtYDvkTRUIRhJ
	O57DoQPnqG1kwQ/0udonyCVwqjvLSLEaVF9GAeQ2CfGNsv2VO+fwvGW9D5mox+iunnMIf+W7buj
	cW0H/LI/nbf0GTq6x8zWZrWjlVA40MvEMKRzTOrmizD1V8WNsnhJd+2aJSgwDyDT/Pm4/UaduWK
	t/X02dGXlu9UKQfKzGUdFA0vJMVCd/xjoq9kf75AtttvBWdnr6Ot1OK7INuspq8yBsoRsSCEFQ3
	k4PxywwpvVUqsi7tPLus7jMZQYUdt0mjtHTunGwFKsGS5QSGYdJd67i9ZsNo4=
X-Received: by 2002:a05:6a00:4fc2:b0:846:8b21:6304 with SMTP id d2e1a72fcca58-84e9311de36mr5193587b3a.14.1785289714696;
        Tue, 28 Jul 2026 18:48:34 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03d3c5dsm590510b3a.57.2026.07.28.18.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:48:34 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com,
	Alexander Sverdlin <alex@sverdlin.org>,
	Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v6 0/3] Add initial Milk-V Duo S board support
Date: Wed, 29 Jul 2026 09:48:20 +0800
Message-ID: <178528968141.162041.7895894684986779851.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260615120324.1527881-1-josh.milas@gmail.com>
References: <20260615120324.1527881-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 15 Jun 2026 08:03:21 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking
> from ethernet, enumerate the wifi chip, have bluetooth, and can
> read a I2C slave device over i2c4.
> 
> [...]

Applied to dt/arm, thanks!

[1/3] arm64: dts: sophgo: add initial Milk-V Duo S board support
      https://github.com/sophgo/linux/commit/fd2544c8cffa6a53ef8faeedbf9a66a171de0fcc

Thanks,
Inochi

