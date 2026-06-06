Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8704204E
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 09:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780737806; cv=none; b=Iqf2vkioxCZSVrXlkzF0xCmMelpNP4e+Fzs3IlKwpkcYEFy09AjUdXfTF2qHnTJx+y0Ny5G0bhQikf5GpNcbDrJ/8Kp5+NvNruQHOZJIG2lPK07JyxDpRaGUBjJllfLCNTsfzMag5ukSxmw3ThMqyGNdVBNZDpCjMyII6RwmztE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780737806; c=relaxed/simple;
	bh=mDkPGwiVHQoklipRC1lQByxUrrOmsEjd/nyIvxoNglU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=uT5Jb5TkFFMp8lD8eOp3ybQVt5EHYKNIvWqXTAk4yJq42HX+vX5hOZjkLa6DxAeeWqc4ez0/HlvN1HSuj9BgrLWXSFWYGlZBZACDwW3aK/oxZOwiY+hkPP/E+p+HL0hNq08c2MpnjPgwsb6ww3+G5XTz6NYZ54tLE4e1wKFJ47Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xwu79pNv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xwu79pNv"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-842848fd613so2226501b3a.3
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 02:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780737805; x=1781342605; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i90N6kve85T3Z6vhC3b/4AAHhPovipRsLvYZQX6Fo9M=;
        b=Xwu79pNvNAJyAcpUIp+V5v7QdyVZQJzxE6qCUCNzeSpks1kkEBD50Crxr/4ETF2sCs
         zB8O9HgMf6s5oMqBzAtFd110xvib8O9wyJU3FqfMqaDHOywAxaXTVsrmPjMxufNTgwDb
         EHHcSesYcM8l46MYcrLwwIniZ/C8d+cl21sDgg954Nv2iDpKAXqi7ZFYFAUIXP53LHBF
         PYiFOOGnI8iAdNQTeoICT6bSJkdY37/EwF+QJTI+a1hmdjURCDwqobIARgQo0NPhiR7W
         HrppKk/ZZ2MzTTCVk9sG45j0rWxY4/C7vgzXrLa0l6bq5Jnwa2kFeyzaISOn1cL4JN34
         Zn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780737805; x=1781342605;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i90N6kve85T3Z6vhC3b/4AAHhPovipRsLvYZQX6Fo9M=;
        b=hKTafUqQY4aozlFNlDUV50zb71UpUh8+pODwyi6TsK8WxDuDAaB3DSWtCRJcwy772K
         r2ZH6hwrKVq8osbWXBozsd3+yZVSIjXlhjygsllaTG1vQ+MqNivRmF88vIsWPxBkhINj
         u4t8/d3lff0HTBhanBZG34ubSrxupC3Kyg90ix7YDAQWEUHbo1wXgkth7vk7xehVcV7q
         pmCfBJZYN13p42G9Gxr5Q6963NpogaX7Hibizoy7dcChTFV/cSr1LeeNIAwEAU0I1LnS
         ivEPuPvl9E+xEdAZYoNh/D1qlCeRyg5oNU4nUbOhKu4oymgeGDcxGxli+IVQPyBr8r/y
         PnEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XIRbqfhHSllXL16edPpkvUM7PnPAPyR7vcrthXVChgZa8oFz47cr6hs8Z7A4cAQ1J5UhK4XUAFtQ0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0mYOxBkCwtdTL6+JuHDWhyKxzQfptEbClWqPibI9bmK9fkhu8
	lFU1oqRTxswUTq1pAzUYj/FN26Q6Pkh4M4Lt01QaeX4wxlgoJkdwnG5g
X-Gm-Gg: Acq92OHg0+nrC7i8ssnJ1WldB8AeCWwWrlFkc2hz9S7cyKsuVDVk0Qf5N9h06OvnyUR
	F39cGsRKx2Ts3pkOghyySFJm6QShi/XK/rr003y46ojqQ9Q+RNoAnpEqmxrV+s/9pZ9ctw+dc4i
	chxNnt7Sd9mk62MT8XzNbY+34U0n/mU7Z4RQXFqv7Cb115xk7cvfLwEenY0CfZR+3pDqe8cEcSD
	KYvyloXo8B0m8JHXqotjDEc9e6n2LNuLuF+eSezc9MVxlyxnqDg6aJbhlmV9JGFog9zz+2Tnith
	eVDulBNWNX20227OEEPHlfrf9yqyS9GORhSRFlFWlSXiWAWbeUza6xqaPhc2xAVMMgMYOF4mSqR
	CX6jhTXOkdO54vZCvA1AWsSKVi2JTddQe/jDDm5bE9+EWLC3VVufbMgbxbEz0zUDi35WdQuEQ8R
	RViNyiScPYN6/xBQ1hUF/67PXUNYtudj0wirFdDCzBSH3L7S73Oc+iwA==
X-Received: by 2002:a05:6a00:1304:b0:842:3801:47f with SMTP id d2e1a72fcca58-842b0efa50dmr7854414b3a.17.1780737804994;
        Sat, 06 Jun 2026 02:23:24 -0700 (PDT)
Received: from [10.46.148.203] ([2001:19f0:8001:53c:5400:4ff:fe86:d241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428235006dsm12236720b3a.13.2026.06.06.02.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 02:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4>
 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
Date: Sat, 06 Jun 2026 17:22:10 +0800
Message-Id: <178073773007.397244.9871455646149843167.b4-reply@b4>
X-Mailer: b4 0.15.2

On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
> 在 2026-06-02二的 20:53 +0800，Pengyu Luo写道：
> 
> > On Tue, 02 Jun 2026 16:14:45 +0800, Icenowy Zheng
> > <zhengxingda@iscas.ac.cn> wrote:
> > 
> > I don't focus on the upstream for a while, was this problem still
> > here
> > recently? Could you attach the base commit, so I can reproduce it.
> 
> I tested on v7.0.10 (with some extra patches, but not related to
> sc8280xp).
> 
> It seems that raid456 module will lead to the hang because improper
> usage of GPI DMA, and without it loaded it seems to be working fine.
> 
> Could you check whether you have any problems with CONFIG_MD_RAID456=y
> set?
> 

The magnetic keyboard (USB HID) can't be connected somehow, others are
fine, such as the spi touchscreen (not upstream yet), which utilizes
DMA definitely. My config is here https://pastebin.com/SdjuyJYk

Which device are you testing? Please attach more information if
possible.

> Thanks,
> Icenowy


