Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3641D8E01
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779854244; cv=none; b=lFpNp81sbZovdqfxVPKcRyS84TosioCcPHxiemeYhBsZgqcLWcL7Ut/AH0rJWQIuCuNJSNnyrkocJQMWzzFiz3xI+nRmdXi/BXAbkDp35ZPV5XoquQHbsOSa0A8fzJwZgJdxtGbWVfnL6/6peSKC+7YPrDTB54PBQh7POjazQsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779854244; c=relaxed/simple;
	bh=MBum6xrKvNWqY2WWGbqb1aPnDE7UzrpYnOEdZycNgxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bb5Y+AsmhLnx3h1WE6wNcALeGS9guflMZE4bRHRPSFjJegt4LuZR8MJwj2uxb8ZPcTJ7Cxk8xadUntnBZPPrBtUyPZ28ZDPN5gKEi/PlMSgtwY10sk9vy0LgK+O34ITF7gBrqQ7kMkuxbkycGEXdrX/Vm4u9FcD9ebbRKzSawq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eu+djr6z; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eu+djr6z"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-83ef1d17904so11108982b3a.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779854242; x=1780459042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBum6xrKvNWqY2WWGbqb1aPnDE7UzrpYnOEdZycNgxs=;
        b=eu+djr6zKmXu7lxsZJnMPKelB3ZXlcubr2CIvhSVqtUyfmTI10MitgddN1RAU4/uGv
         SfGPbEjwfswFjWfHoMzM1qjNorguA7FMhbMshGTyOX4f20OO/MmIZ0u7M1xlxW+nsKV3
         Iu0ZgMPNSkzBkmNtzdg+KMxBLn1ZlUIgqYrRHSBr1ap6285UhpPH0lmGwKa+8ySYEGdz
         CLijREEnKghLp+OYQAwkSDo7i0nf7YXrYM8WCCTtTJCrAoe5Ov0P0iAHWW9e8rKIAwUq
         n2/koCFKpfHN47svRGByk2PfmUIw0bgXKxpvW5T0ZiDs1946EAKtE2sOfdNGZEApWE+O
         4pxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779854242; x=1780459042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MBum6xrKvNWqY2WWGbqb1aPnDE7UzrpYnOEdZycNgxs=;
        b=morsOrMvHL2DSx3jzW9bWYyzmgZMM/qbtJcFa9iqcUAwUm2tz0WA6OF9+DsZUeHJa2
         JVE26JhSILNzMCv8rLJ+0DWBevqvDMp9QjYoupt5fzxfanUN5ms3BtzTHk203GjPtSkg
         OQdWzzoD5fKvnXItPqo9LbjOgugUHlG4JaByFvLhRuZpkIBGeRuA9pe+VddHCMzyVeeW
         /NaIeriUwBjSXNlyZAf8BxOen7ZpWdDRifgRSlUgV30b+sn8z6eBqQspjpM+GQpjuV8j
         7YM2X8i5Aa/eLVvFtTvWsi7xXXZ3EDiHGSas6y1UMX6B7JhN52q1FjocZUEngQ8MBUe6
         QqsA==
X-Forwarded-Encrypted: i=1; AFNElJ8IxLaP3qhbAp7jcHBLE7kWZM+z+r5GuRWnJGGR/opRfuJbfDjQBYUs9QkTfGakRiII60UP6Z183gEs@vger.kernel.org
X-Gm-Message-State: AOJu0YwNHRIM1Nr/oAVA3kdbXfsYVhzInSPLfQ4mxpY46dcPj5sMv1Le
	2zB9ucGLgWFJZMi43skoqN4+2T7NxYWVB22AKNLLtFolRizk8+Qe6bVG
X-Gm-Gg: Acq92OE2dO1H2wKHlvukvxt9WnyyEWShlpSQiyAbGEU/YTvwGzMtjAIzFa+TTjSqipR
	Yzm+Z2pMmbGqX/mM1JechJDLiTsqHSTjKM7S+/JTC3utiDwgkJJui4iDheb+255atUQlTLEPwuD
	cWOksxpkvx3ZBFVIoznnFv9/r8NdmGEF6XMVDBYKcA3sYzRUfkChWsPgxcH4T6+n5Xu8NR3bSsp
	LHwPijWqV4RMN3a/ecJpHJlB4k23+4SO5mOtT9amkBipcvbDjBYV71fBS640FN053FEqE4Jfbdf
	BqhH0YBVbFcBrIrJeSjkey8NSUjkWRRdm8rHOCAvPbP62+LWB99wCoCHh+FINTUDB4S45pceItG
	9D/YKlM0AZETAexGPsMOJDSPk0D1Cqg9RksK1WbpmbWov7CLvTZmUfnjBs/6V+MlNq+4iziWLOq
	BkkiJOlcerTIofxxVZ0FwW2ot530gpTtOfEVX1lBBs2Ro+WMc5noFhG+Y4PEqEVvXDdGBK
X-Received: by 2002:a05:6a21:3283:b0:398:4a1f:8a54 with SMTP id adf61e73a8af0-3b328c4d724mr23258698637.2.1779854241666;
        Tue, 26 May 2026 20:57:21 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:305:1d13:54a:bb3e:c4d7:dba0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8520560ff8sm11572280a12.24.2026.05.26.20.57.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 May 2026 20:57:20 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Wed, 27 May 2026 09:27:12 +0530
Message-ID: <20260527035712.3157-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260519125655.23796-1-blfizzyy@gmail.com>
References: <20260519125655.23796-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping for this v3 series posted on 2026-05-19:

https://lore.kernel.org/all/20260519125655.23796-1-blfizzyy@gmail.com/

Thanks,
Ajit
