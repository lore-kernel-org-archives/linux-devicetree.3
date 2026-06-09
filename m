Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C0B3B6C12
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022108; cv=none; b=kF0zGxyLySHDOQAfGa4hram9cS+9GIa8Cxwjn6X11ZZxV2AFFUnCdBY7FhWpD2hCXdoJet3PzRrBtlBOsxisCeU/7ciLDgIc/MJWuzUq410Mzl3oRpxcXW9ihdse0K4iqQzJYhPF88uLDagQ1aKaUIHUmt785qZjKJSUhx1MWs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022108; c=relaxed/simple;
	bh=RnYQKTgC5c+dI+AGzkNnXBzaTBP8CgdPH0WnnTKMiA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNBGay4BKYzlhruyeKMCAHHjx+TH+8LTm48H9aZ/1pgSDImwk+IbqdJy4q4sXwWFngy5wv+8pONV6XUMHPpB0tt6oiNFnth9wy8g4bk5DbYhlORQ2oYrFMIrVOm+VEDhitEm3h0fltXjvMvaQkKcrcaKnfS2DA69WTz5fyXGA/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Icy5pZrd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="Icy5pZrd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b9318997so42184145e9.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781022105; x=1781626905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vaGdByy1y9YOgpYVm9cgbblxYGkAi93ghJNskc40SB4=;
        b=Icy5pZrdXPsbjeHSfsECszAJA32UjM4dgISKqf1hbvskOHszMtAIThKpYVc5mZgbI8
         lvRiUr1AP/2IvQw0Axqg+d9bhvg5GDrCqfKgjzHcJrnxa2r92hg32sslGnRrIDD2RvtI
         xfEg4H9pWIts/ETfLBMk+esQKzREMJLlCdmYugKlyZyMlh3OpwJcutxlzra1lNP0opQ+
         GchOcpMp08rz0+yGmNcaTYN8ZAVNg7q8cOA3jFNkYsaDg32H8rtMJ+pmvb1gb3wI4X8i
         +sOQYwLc4mcvICk3W7CgW/vuze9LjzpnvBMFAuDu9Djaa2QCYifrltJpei6Fms95aTFw
         42eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022105; x=1781626905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaGdByy1y9YOgpYVm9cgbblxYGkAi93ghJNskc40SB4=;
        b=WETczJ3/DzA3kqZRWi58hh7LLpZ7U7x8dWPTGIbq34fZ+cH8GcyDs6x+4fZQIWxXp6
         SjlIJ3Rzm43xymSIBO92Vbumn8itjCN6isfGphGz7PGz/EcrGY14CJZPD7TVIuHv9xzM
         1U0Nwi2yZ3xMGq/QiyHZwxKIRpDsU7kbP/vfomSV5ilIUhol11vkhwiISUoVU3iLVVSo
         SGlLpvmBY6wBd4istzUWL4kEu5XeJ4zk4SKYmZY3uPzdQr2TTpks7VNBEDYF1KDGtAL6
         0VD7M6gEpkkdBgV4SKkbUqGpQVQgGsCC45Bh9JyperJ2uEeDCCIE2SoqeH+IY0ZfdXzM
         HzgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OL+/6NK0B876pLa/2dsUACRpRvPsee79ZatxXVAg2DO6usQp39pLAMsK8Nu1l6U1mEq1uPb6n0/HI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5u6NZS1N4lvhX4TbYGbiYKXchWaQeeZ41DyusfLD4oIenG9Vs
	w1J/Wq9p/Ak8m593Cll6+nWdY3DFpa1SNWyDF0BjKwvS9PJrM04V1LwcYzrp+HQXTPY=
X-Gm-Gg: Acq92OERJLxB5w2pX00NQNOYmi/rE6bSxw9ZizmBQ48TAs5UhK0idI3ObvUTqyXnh5R
	FpALJGeyjy1k3YB/4Kv3tEnyMxkf12OoGjvt3dw0NA7eLDNU8BFRHriUXlKqXKn31zyNdZ/S2tj
	kuP68IZ3SIJ3xkkc7mKFxE+1AaT8snhFqT5DuoWMA0FrzU+pw4u+J/tag+X4KLHfsDTudw8fTbQ
	/rWsv4bIx66gi2rJntpBfhF7FHtGemPbksMaoWstJAkOXp0g/YGwOk9FPGeAKZ2GDu4+rlFBInT
	6wEB8wot6/1ExmZyLYRTPTyOJ5C+hglmOPErEBfYBxiRe+sfOfm01GZMgFl9eOdCuEKd8oFDCkV
	wVESbgdV7rkKnRClSIsWxXgwq1CXaiZE9Tw8LjL/xZbqW1yqMlObbGz5HwmpjAqwLsZQ2kXJHvh
	+p0d/UyTAoDVoLjJMcBUClk/5FXvI2KkpHLkuDZhqnT3zHFyQURNRQ19TfE7DLpvpVGcQIpA6SM
	b53uVg+BNgJ4h7lo0UyaTXwWwBavWVTdKSHDXRi/Kh7wAFcn0ydhcmvqfqjSAy/
X-Received: by 2002:a05:600c:314b:b0:490:bfae:55cb with SMTP id 5b1f17b1804b1-490c25f5df4mr318368755e9.21.1781022104869;
        Tue, 09 Jun 2026 09:21:44 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:2736:8e01:f35a:3fa0:85d5:c620])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcde3sm65162418f8f.1.2026.06.09.09.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:21:44 -0700 (PDT)
Date: Tue, 9 Jun 2026 17:21:42 +0100
From: William Bright <william.bright@imd-tec.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ram Boukobza <ram@imd-tec.com>,
	Tendai Makumire <tendai.makumire@imd-tec.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
Message-ID: <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>

On Thu, Jun 04, 2026 at 07:01:22PM +0300, Vladimir Zapolskiy wrote:
> 
> How do you know that these modes are broken in hardware and not
> caused by something else?
> 
> It was stated before, but it was proven to be invalid as the statement.
> 
Thanks Vladimir for your feedback.

I copied this statement from when these modes were also masked out on
sdhc_2. I see that there was progress since then and the caps mask has
been dropped so I agree that I shouldn't have this comment that these
modes are broken due to hardware.

I have tested this patch after rebasing onto the latest tree with the
recent changes that allowed for the caps mask to be dropped for sdhc_2
and I still see dll tuning failing. To progress, I need some guidance
from qcom as to what dll-config value should be used as I am uncertain
about this. I noticed that ftbl_gcc_sdcc4_apps_clk_src only goes up to
75MHz so perhaps this needs modifying for DLL-tuning to pass and maybe
there needs to be schematic/routing guidance that needs to be strictly
followed as-well besides the usual 50 ohm impedance rules?
> > - Forbid SDR104/SDR50 via sdhci-caps-mask, matching the previously
> >    existing sdhc_2 workaround in the same file.
> >    The SDHCI capabilities register on this SoC advertises SDR50/SDR104
> >    modes that are broken on sdhc_4; without masking them the MMC
> >    core selects SDR50 and fails DLL tuning with
> >    -ETIMEDOUT during SDIO card initialisation.
> 
> Which one SDIO card do you test?
> 
My apologies, I made a mistake in the cover letter, I wasn't testing with
an SDIO card, I was testing with an NXP IW416 which is hard-wired to
sdhc_4. 

Best regards,

Will
