Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA2B3A9DA5
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485908; cv=pass; b=ojl7T2o5CeNXtSap6EaUwmNzuR5w79TSzPJ/yyD+KyofVacTycaYV1HyFz8wHlwddFkHKPSkKspY+DlbUqfQDqFC3IZvfgf6rW207U3/w8JWYUQ95WrTt5XBDYzRq72SK0EY1x70teRakxW5V08CboIdyezjE8e1Mn0DM0iowoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485908; c=relaxed/simple;
	bh=3TxyJdBjozXoaX7elIQwRGx5YoxS42z/4Qxel+LDXyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CO8/FnPZaZkv96V+P0oVCbMsIHeQJQGMEcBVbtfn/xSzrnEGgtQxFU342XTC2qvJyTIyeneW6frN7UTtu+3zsVarO6t8mJ6/2sbum2qe4FZw8CId/ZRYHftNP0j48YW/Gl+kq33NS9clcs3L2w/G3IfKvlNXFy1YXUk1/DfQoRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwCD8H7b; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwCD8H7b"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2f33ae12f97so4506870eec.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778485886; cv=none;
        d=google.com; s=arc-20240605;
        b=HtvNfVoOe1SGQ7zrzDleWtyK/ESp7lVSgKuzZeWh+pFQuWj2qEom+JFNBSyok+nSLk
         9dgPw5R9pM9hYdwMXs30hsRUq3rhbimAt91BquB6N5B4KqVy+uRGwa8tk9gAOvI2/Pm3
         e9++4UIGrFQj5o34/FUgKM4ucFpnYEdbJxqpwNYkdREt9lDOn0eel6EiRzIuaOBIkxxe
         hqCoKqCP9ceyvTlR8je6vSBwadE9AP5wtkrG6MJJvG9FGPIh5uc7Iz//D3j5FFQNU1A+
         CyiLx3jv9JlMwK+I8Z8thRpqg+ZB0UG53uCHDVILDnv3EKht5v42MGEHcTslNkNldlM/
         nJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nf61Qz0iyi0SuEAAbjE6Oy+qfNzqjz5sFnpbSlRp9BM=;
        fh=MIIjKpfBEZwWPv16oI7u0/9951h5hOfDd2WN5Rc6we4=;
        b=NzhW/3y0u/3IEu0oXaoc48CzPv0bE2hogCVvOk5qjMPMWHkd6/eBfKAXIhkzycDP1X
         XAWugCGZKx7tq8b2Yk7zln3iu8s3rEG2PpUyChZe6Me5nFx1ETuBTvHbTLFvGfig2Vs3
         hSq2TQrnf3R/8eG5o9xmDbIGzp9sAOR4S190YHDAf0C/BDQbp2AjndZ1HsJlgGwTVODR
         hHqX94yKUbYes1z6MPIjB+nUkuhJImToQ4cFUtBK42uZ/ybZr7LRLmg515YgyVgBhNnh
         av3mqpreHQSRA+7C8g/NFXg340Q0bRSwqt1CKw8ktSEwyev/UgWOOlHZfUFYJtvQnQO2
         cRDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485886; x=1779090686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nf61Qz0iyi0SuEAAbjE6Oy+qfNzqjz5sFnpbSlRp9BM=;
        b=RwCD8H7beZi7Lo3TplVvH8Lbt+8O2S5FWUeY+RgnLvLDailmdBjsUA/sZA7M7VRoom
         tcU20WKSH7f5ajMVjZmMzga5qJ7qHcscRvOtvw6MaFAAGJyZhdNFrKaGWMYXneM4hs4y
         Dm+r59bJmyD0oNVXVm7PW6+MclW20l8Seou2Q3nEFFEe6bCHv8Je4O5NEFP+E0nVgqfI
         QNH+hRaJKVXH8lFAdfsfSvnjTQi/Rx3aFFPt26yEtUbAzQA46fnzVVo/y0S1m126oZZT
         ttQRndcE+QH5QxiSBD+sbfx7lU3OTCp2/xuykApZ4SDb11poVhPJsyQsA13vy5NpNY13
         JyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485886; x=1779090686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nf61Qz0iyi0SuEAAbjE6Oy+qfNzqjz5sFnpbSlRp9BM=;
        b=b7IoUYT93PMfeYpa4E8+6TuPgSEGpzfbQCAmxb3bFsK7ezat947+aj4uV7pfc6eewv
         12LKuDwCgStQG4mjLVHLJP7xwHf4b5CHn3uJK+axdPylUoAzITIwu0ByiBPCYu3kMzA4
         a9BCfrPo4O6K+EY1gZGocuEffQRNFaS9xSnkxoLfi1xTiEdKN49R+dKLy94W7H88H91W
         VDHb78eX3bQF2GUM4fETB1inKfEJFptpFB7jv1dDPk/LB+Se7PRSf7A6mQG5IwgHUJ+p
         UU5QZAv9WgVvJqQVzxhlAXZlmSPruhjDE8yti9EpzwkPOkUlPEaoVpsoidRWCJuDs3X1
         wwdA==
X-Gm-Message-State: AOJu0Yxj3rp93O+MavSHRh85hdTeDIqrxjF1WMCy4VQydkGuoBY6N78c
	4xd2KXRvQqaYjVQZt1IEdB2jWf3xPZlppxiy4mxISeXkQFMmQRowhe3EUx8jq8OeKTbAW1y9Yrf
	zaMNBX3PJe3bRmYrvhfLP4smFn4qK3gY=
X-Gm-Gg: Acq92OF5A6ETALECHBNE/j474DLzIcArQWsjb70sGRbY+h8ixnrnRmlL4i0frWHzCzU
	/Ny7yCjStwlF8ssQTZteor0H5yO05PfuMUx3uwoIQjeY/FPicMDPT1qLk31/O5wyzpucL0K2a9u
	RXp59Vb9zMaLg9jxTkUIvSMkUekzfl6aFvhWqLG/x1uQlTFqqnZVauUuzZmNAdcW0oXgVU9I9M4
	xgPWje0SvwujTJD4C/AbQWx1YBNE7kmuVp8GxUdnSIO2DI3HR3AnBY4MyySk0979amfgb0m14jp
	u58EChWZ
X-Received: by 2002:a05:7301:4088:b0:2ed:6f94:9d9f with SMTP id
 5a478bee46e88-2f85c07ca45mr6503387eec.11.1778485886472; Mon, 11 May 2026
 00:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511074752.24745-1-clamor95@gmail.com> <20260511074752.24745-3-clamor95@gmail.com>
In-Reply-To: <20260511074752.24745-3-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 11 May 2026 10:51:13 +0300
X-Gm-Features: AVHnY4INV_9vitfbHSb-jPAooAdF11oStearVfjdQL7UhZxfWb2kxHd0zccUaqs
Message-ID: <CAPVz0n2LhZM7ODtSEVAG80jOjzO+RGvQ6WKTRKR-7H=E6d-kdw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] clk: tegra20: reparent dsi clock to pll_d_out0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:4=
8 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>

Please ignore this. This patch was send by mistake. Sorry for inconvenience=
.
