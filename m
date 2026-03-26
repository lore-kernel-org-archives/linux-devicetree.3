Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388CB29E0F7
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774505112; cv=none; b=BxttPJ9hsa1zwQb3c0V73AmfL+lY8H31FNs9nCMTImD31L2HN2mMrsJk7/bgJ0SFNPCKUagAd2vXOefYg8WDHoslHArFqQdSvSKugs2x8PLAG30cG7BzMvZ25ktbqG8NG2fnpo0wvkcvC/fhtkAaSSJOsANTIG6IEhLrtVilCF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774505112; c=relaxed/simple;
	bh=qNFpsTzbZWFFsE9iGPhAqreCH10Wgsp1S3A+JKsN4UE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHiJyuCqUUbNg63b3GQVT4AxXzw3qH7z5dNqhM3P+jCstir5Wb86v3SQSmLptwYkYZVjHRe5GNdzXJxoi0Es1ag2NoZnfwdZNlq/vl+EPa24APX1F4cIqS820/E8SKpoLtG23fAgBaC3hGEtuBFUy/+v3dWMHqUCQNy2nX2M/Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBvfFiws; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBvfFiws"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c70c112cb61so444554a12.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 23:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774505111; x=1775109911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slX6PVa4cy3hgS68Dza9/DJkjU5Sh4E3O/3Ms43H/6g=;
        b=gBvfFiws1D7nrr0969LU2ttOkRDtgN0BXXAg7NjMb1jnWTiv7SwpdNrVptgI4QHkeh
         fgXQGXYgQVfLMCCRhsLdAiuvxtTmShQcFv4+owmBUkMnsEGItbmc/mkaquLahDJRLVxr
         dtoMNXsr2B0gDHbUDBbfUDN0mpW1+EbSMOwz0IPY4uxEoOT6VfbhS2r2Q2oP5QuTjy/d
         mwCqrhgFCg/bEpBlYpQqBqIQodsTnZk26HO+gvj4rpKqSanmg8wWJI0Dm9xL0I+hnkEd
         VL2NVdMiPuNiK87ljI1RcbEaJLQP9eBZf8G1Ly5ndrbLtjw0cEY8D9fwsXlwrGHEF861
         atnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774505111; x=1775109911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slX6PVa4cy3hgS68Dza9/DJkjU5Sh4E3O/3Ms43H/6g=;
        b=EvRhnYOreyW3zwi9vibiFnO2gpdoQ0msqkTCea5FEGNo+0vr1IPlARDicMLo5UUwKl
         KjOH+1HIw0PTtNZqpQEcbtjzJQ6HjY8JFzvAMWYd1F8jzn1I4S03CVLvjL2FyFrXy1t8
         VFhsEjW7l/gL0FQJbUWlWWPRJbctLXdjHi5Jb8cN9vAu916rJXgToliqsa3zgDPz1DYB
         yRAPLkqLw6fdSHBEjABq+ZQgLZhQ5bWji7vw1l1CpTHghF1oqjcqbOb3lCR03OXTBGs8
         VDvzhS1icmsO9ocaHPw/U+/OiFfZQd+NA3LnO/e2R4PVTUFKbIcqQBUb97IFLa/NTgA7
         N71A==
X-Forwarded-Encrypted: i=1; AJvYcCUYMGGqO7qbJSU7d8T4k9xIoycdkzllzrIv2HUf+AVlcrsaNU+y/vczJAxGDYq4z0j2pvIeGLmZdWRv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0frG8Z4mME+vMYNyZc/L2SdUgbBrwqMpB1+viRQV88d0I3yLa
	OW/yCM+4hWdiUS4aKH94KTSmdX3R9no8E/egtorBfz1Sq0NOQ/h51chc
X-Gm-Gg: ATEYQzzkc6ymfj5n5/EoUy/UOPiZUgaLrXrJjimrhqX2Iw+TcobZE/cpSvgEwp0nuKO
	noDqN3x0QdqOrEsCKybcyD6lZrZoNGT1ZtBO7LhlrWVEBQKwodmHtHdLk6u9CrCZ7rVsGvYGb/y
	gP+Lchwi6Fd4hDRXQWGgv8b9PRgMrrHYY3UFVvjmoeMqSP5mJRx4G0k0PJfmFnvQTyGv5D8uCvj
	/PUXDULS94au6NP57/CoKwvhCd6weXq7s0KlDcibcsEkxN4edvMelvpsnclkyGnrpN7VR35R0M7
	D5LRW3GmUNNxMYYrTIVoei6lvieZzfLM0MCUEBWhlM5Oduzi+8pdu0uOvaSVQA98XkVe49Kt3WC
	/LbqgLzviQg6AFtWX3moxr6/MI4hmvljb/RY6T+ZCiV0JcObpbXkvCSo/GunowwIoeUHLDWsnDJ
	9KCeBjU9sqTfIDEAf3oM+b
X-Received: by 2002:a17:903:2f4f:b0:2b0:41eb:165e with SMTP id d9443c01a7336-2b0b0ac5e1cmr75649075ad.38.1774505110564;
        Wed, 25 Mar 2026 23:05:10 -0700 (PDT)
Received: from ArchLinux ([43.226.30.138])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc7afad1sm21051385ad.31.2026.03.25.23.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 23:05:10 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in xiaomi-ginkgo
Date: Thu, 26 Mar 2026 06:03:58 +0000
Message-ID: <20260326060402.16021-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <acRdOmHKQmBp-RSd@gofer.mess.org>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 25 Mar 2026 22:10:02 +0000 Sean Young <sean@mess.org> wrote:

> On Wed, Mar 25, 2026 at 06:07:23PM +0000, Biswapriyo Nath wrote:
> > This patch series add support for various components in Xiaomi Redmi
> > Note 8.
> > 
> > Most notably:
> > - IR transmitter
> 
> For the IR stuff:
> 
> Signed-off-by: Sean Young <sean@mess.org>

Hi, thank you for the review. Could you please add the trailer to the
specific patch. Otherwise, b4 adds the trailer to all patches. Also,
do you mean Reviewed-by or Acked-by tag instead of SoB?

Thanks.
