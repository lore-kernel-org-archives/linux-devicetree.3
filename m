Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F5B371880
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539263; cv=none; b=foCt6YIcK2dVImhXeJjkSirF7E/NXzHgjjpQuX+56HE7Dzvl6i0CFYh41ET98cLCUiUgDn5rNud3RpIXiGwWzaT/1IPrJMQpfSbFR9hj15F35W95Kfdmcx0dx5RLI1UMbQsukcEIF5WfM60jxIxZ5oUms28F7i9Ndt/JuMLtlAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539263; c=relaxed/simple;
	bh=b3E2k84QQEGwtviD/HyyfH8SNZuxyZTPnb62hGODMfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k40rGiIj8atnep/nVyU+U4LSXm8GO9MvSxbd69qHxI5cSmxb7PnWZt8RSQPsIwhnb6hxrDB8j/c+A7wYhgZ6l9T/0xYOM0ewdLtTBQMTsv0f0pjSSIR9GVF1y+gowW1EBHroW38aSQ+9TVnOT2I4AjFdy2mi/OpmDQOnAGwzgWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LifvRJ/T; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LifvRJ/T"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2db710396ffso9468355ad.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539261; x=1792144061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ux6hJESR9kZkvYlx2D/IGwLIHS0t2PsKL+AJPtGbIUU=;
        b=LifvRJ/Te8TXZyVZlXveRGo0NndHSIBR0tX+qIUxA64VtXjley/ekSKBaNZyMezZZl
         b3gvPb7ywGnXz3wRcpdiPplazJlDQ8nRRE7hoBef9NAP0+0vrICcKZjUi+qfQ1vhWKeO
         ZshevIoyPDKQz+mh4PFcWuvnn/OnWycBOaMTlxwi/sCts2nm79nQMlE3ujeJGwb5hkpW
         SCOMtkg4z4wY76vR1//y078Vng8yPBrsqNP1FICqpnFvUagHgTLFTE7iQyG7shND/s48
         wTFEzxQBZtZYW0IDImv+cpD6+b+HDvVctSbN4DvB+niPXWiS7NQE/bYec9TtnAsTg2ns
         5KQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539261; x=1792144061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux6hJESR9kZkvYlx2D/IGwLIHS0t2PsKL+AJPtGbIUU=;
        b=Mq2hI1aeqctM+skR4uFanVy8eDUw+KCZLHdV42E0mxNkWI+HQZzODC6x8IkzbPrFeN
         +07VgGa22lw/ac7O0xiriAW6QUvFLi7laikLCPIdP3hANZi5+ptoPA0lsqBsbG3V8m1c
         Ors1u7WufbT7JIQeCwDQIOSVj0Jjkd4nBvGnjprY9g278X2364bgmL6tSZUjATBCTSh4
         g4DfWS5P2sibN0N2xBdv59Ndkhjj+4Cleybt/psssNfuqWBS93gBT3Z3ImDEF73rQSRT
         jM5yLJspnZVds78DSRsG2ERIcCLo/ISpPH/oPZo9zJDiWBKX/1/bhQBUc81X0Ft1H+ky
         yPkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO+zQJXjttlMcWe3FTsMpXBMgRk13OB55oo0ahrscOD7/rVEdMfT63zLO148/WU+7N0YjAOmUBZd56@vger.kernel.org
X-Gm-Message-State: AFq9FYK0fwnQ0tXSWrhIwbvtwBM1hf83b74tDpdcS5XAMwRmFllTPiZZ
	bJuCvP+KhT7H5WC/+fyGswSpz2jZFkLwXXf3kbISxhIFB3+yyCTwFTtS
X-Gm-Gg: AYBFou0c+32V1TErcnkTx7cSZtQbDQQRpvF1O3J+qguOPcwKUlu+knPQWk7yq8I2JSP
	xxi543F4VTe1ttSa7SiRWgtMns5SYKPwpX/kRGC2L3E4JoPRfFkhW5f60/ZqlIEIHVF2QENCkDj
	djigE1hwRZM7ZX56RmITdu9fe1m8V7s9v9oZxb91NhOj9hl6BQwFIWhhjy3nSruGgANWnnjjf4j
	/EC9fcKmXcAAICwaUTwwdIpw+45X7wdt1uKv3umjKXvGwQqW/yqavl6wv/yI4m+ofJfRmcJPr/8
	LsCcInQnpimTAvJXb7PLRtlLPIDjY3bFok3A74aR0QNYQJH/8S7GTYChr+Z88HS/cEmWZsdTy3t
	Y6uO2uwM6PHtLGHZlkmVuUhsBnAhRe/HJ5C8rGzwhV9O4QFJMYC6YERgVtrTSkuL66NmKkQ949l
	z1B1Xp2zMEk/M0D9buKR/98hVADYdwW9qaSaAwqugB59uXO9/HKmegOrhDP19emrczKHsL
X-Received: by 2002:a17:903:1b70:b0:2e6:e9a:eb48 with SMTP id d9443c01a7336-2e842f2d257mr7768075ad.41.1791539260811;
        Fri, 09 Oct 2026 02:47:40 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b17basm5833635ad.42.2026.10.09.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:47:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet support
Date: Fri,  9 Oct 2026 17:47:07 +0800
Message-ID: <179153921381.259252.9054877756385260471.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
References: <20261005093749.645014-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 05 Oct 2026 17:37:47 +0800, Chen-Yu Yeh wrote:
> The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
> internal PHY is only usable through the optional USB & Ethernet IO
> board. This series adds an overlay for that board and fixes the name of
> the internal PHY node it exposes.
> 
> Changes in v3:
>  - Rename the PHY node to ethernet-phy@1, as the commit message already
>    said; v2 only changed the unit address (sashiko-bot). dtbs_check now
>    validates the node against ethernet-phy.yaml, with no new warnings.
>  - Drop the blank line in the trailer block of 2/2 (Hiago)
>  - Collect Hiago's Reviewed-by
>  - Keep Inochi's Reviewed-by on 2/2, since the only change is the node
>    name
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
      https://github.com/sophgo/linux/commit/627e4e43e555ba252f93784eafff74ed82234c63
[2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
      https://github.com/sophgo/linux/commit/673f8e66d5edf424eaf599c8051e0f6962605861

Thanks,
Inochi

