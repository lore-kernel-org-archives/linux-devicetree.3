Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F114A3412
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948434; cv=none; b=QAW5Nz/DZDJZx35B/46Pa5ErXxiV4pMdjni0QTN+7QMwljG58AtnQnavy7dHnczXb5XsfsTAD1F/3JGnvZae+uY68WquSDbkhCBZeerutrXwAj2tJfvwzMKBo2D3f3DgPAf13P3MQNhOB84T1bY+uZhku7DVardTUSQfo7aWRrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948434; c=relaxed/simple;
	bh=ihZ1MFd5oR2jYnPMXliHs9oCseeCex80gley3PuV2sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i47pK+PhnecZNToFv+XUVMNlkboYCsWS1vTRa6paS5K2ozbsZrDyAVmk5PiubGOzOsloabuq11MPfrczgnxQCq2xmaDvjYn5szb1IOGW/JmfoWcc1P7YfERIQAq2UBp8uPdjgkL2QQT++cL4PecMSuBc+++uxYSw1t7K5qQ1daY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=YntXkAa8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="YntXkAa8"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so582252666b.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 03:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788948431; x=1789553231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MpSV5WFYmvBknbjwvmDSkjCZ5uC0FxZSSeTd39Acy0=;
        b=YntXkAa8vR5gmN9KHEtkbjnB/AtkluYUf/wIxRobvv5hvmAqQTvJkysWxdfsxSeQvw
         0uQI40LgbpPFHV1w9H2I1RT9b0PxXMFeoE+rCBb7EpjsvBF6EglS0xMB5bdah5w4LCeU
         jv6dCObP2bxGqKs2NLKXS6MjBsuyAPRJ5ZpuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948431; x=1789553231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MpSV5WFYmvBknbjwvmDSkjCZ5uC0FxZSSeTd39Acy0=;
        b=RWRVTDjncMtNi0yZ81VS8Syd6wbImsDGE4gsbHwAsUncIGz2EOApA3wiT5qculyh8t
         ySAD4WCbb89U+c4Fjrc+rApZx6FscxGq5UcetPKd9ear9LhUIyEhck63Xd4BY+wnsc3W
         rveJNMVLMmZgZ7O+VJkx7WlKvc4IjDaKmeg0s/8B+prh7jmBxJQgRUwF5l8m2+ng9QIS
         g66BRKva4daajaOjh0jxEGhXGEo5+rMssYvEIAu0yg1h3ynjAOXfuYvaSdYT5huCvbnW
         7xwXn+dSCI0njcuqCq6tyln2sgP7xiK4bs7tjRLk3vYNWAuTwvhtrViQdcWoyEb7V1KZ
         T5sw==
X-Forwarded-Encrypted: i=1; AKwUvBzRXt9e4fv2hUHim2GEy5c5jse7k67qbNloIh2qgr1GD2HekltIFaxzMej8Pzd8uPFp7/Cbgi3DNhyw@vger.kernel.org
X-Gm-Message-State: AFuF++ldI2PB9eL6koXuaRdJ1wjGZUHrWRhpf+0sqVLiCQdhb9nyJLUc
	B/8WlFa+RSJzOePSeUCD8e8cD4chiDNqx0waqR/vLtskDNYtliDT8fLDgLZR5zWUg6c=
X-Gm-Gg: AYBFou2kspK4wpOh1NLcORxcvmPa3pYTsxSRhahCcHwC7C0GNyY+xDotAs0TIpHSOJL
	1ppuUPssqo4gqAAqvFsEueZNTUky10Vlc3YzIGOG3nY4o5o+tsDegKjLCu2pScxaEMXF25P56/C
	+UZAL8Zmfl5E3s0YdWmdWVRivHE5k1/PZneQnopzjjgJ1/x6X6tCPgv5E7q6ewX1Mvz6kcI8Svy
	RTuUHCkOBQZLpTOLSa/sO/M4U6Jm2r2tnUiDgCJjuv6doKgw0mb/Onfr2gE8cCdhHSc3ZL6kyD0
	2IrhElGE/35MGRSW6icLhgSW0BzG+EwzMsI+AsTgPeRtsFtAlyLBzEunnGmY+C3+iTd4tCZWSEL
	8aFOziDuppGNi5SZC5Kleg0BYRf3NDZ2RYLYuXIfz3s5Frwx/zU3xVVtmx+HS9z8ZwtOGvS0N7R
	hsIYaeR6tBI52naNygXsPo5jsDLIOgAwmNAiOZuxItRG2+Vx9CSKNWkt2euh7og3zD8pDsbt9Zf
	ENSMlGtw34ScypW7IZwZO7fScDxyVxqtJg=
X-Received: by 2002:a17:907:7204:b0:c26:19e3:e98b with SMTP id a640c23a62f3a-c2619e3f02cmr1125576066b.43.1788948431181;
        Wed, 09 Sep 2026 03:07:11 -0700 (PDT)
Received: from carbon.k.g (79-100-31-116.ip.btc-net.bg. [79.100.31.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm745699166b.34.2026.09.09.03.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:07:10 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:07:09 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v2 1/1] ARM: dts: draeger: Add socfpga devicetree for
 Draeger's M48 board.
Message-ID: <20260909100709.GA20988@carbon.k.g>
References: <20260908111011.960876-1-petko.manolov@konsulko.com>
 <20260908111011.960876-2-petko.manolov@konsulko.com>
 <3dbe92ee-805f-496d-9a7d-94c837e674b5@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dbe92ee-805f-496d-9a7d-94c837e674b5@kernel.org>

On 26-09-09 08:36:23, Krzysztof Kozlowski wrote:
> On 08/09/2026 13:10, Petko Manolov wrote:
> > +
> > +	chosen {
> > +		bootargs = "earlyprintk";
> 
> That's not a mainline suitable argument, drop.

Well, i'm a bit confused.  These files in arch/arm/boot/dts/intel/socfpga/

socfpga_arria5_socdk.dts
socfpga_cyclone5_de0_nano_soc.dts
socfpga_cyclone5_vining_fpga.dts
socfpga_arria10_socdk.dtsi
socfpga_cyclone5_socdk.dts
socfpga_cyclone5_chameleon96.dts
socfpga_cyclone5_socrates.dts
socfpga_cyclone5_sodia.dts
socfpga_cyclone5_sockit.dts

all have:

        chosen {
                bootargs = "earlyprintk";
                stdout-path = "serial0:115200n8";
        };

Is this some sort of legacy that isn't accepted in modern days or is it
something else?


		Petko
