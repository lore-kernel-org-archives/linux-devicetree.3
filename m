Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A85434A797
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 08:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388119; cv=none; b=mwhQ+UPl4gOaeQWcwUdBVZlOnzIVF5d+FlGwUrLZcZ3fvTy1zuiQjlGjcZJrDNcuRNbUGzF41vpaR3+5mDQ5HtPQi8nnXRmq7yX1mxPyRdHaML9ZiMQBFZslyUycySzOHcPO0OAv3HL6sC4HxX1vSNYZEIemB0TDqYXAj87X3gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388119; c=relaxed/simple;
	bh=vaGwUG7gr9h2YOrM5Mtbn+7T9ugZo8gjzRulD7csVD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n10szS20PwOrTcJAY2NU8CwUmg/OzY2OwFZSkvAJAxvanTsrc9gF1dlbquq9WBGb3i2OPq6Sa/DFLeg77RFc6U69OT5r01G/lanaYuIvIQqM0EiTv2VUcqQoDcCq+ID5esTtAQYuMdRI0lBHV0QBQxeEjFWBRpfF5mDYCz2suWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Np6pJObp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Np6pJObp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45eeea039ebso2176388f8f.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 01:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388116; x=1780992916; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R0tri8tCsiy74EQNFulBrakDi/+0isJeRmm5jzNUg/I=;
        b=Np6pJObpgw0TvYkM021FfL2AoONCArGEOV0EDGhzV/M8QqwSmUOwB6T4IlBiHq6Ot9
         BlzIDQ7nmzPXVgPSqtzUnL8OG0VTbV4VKDXsWu7XEva4ghsccQKnpD2CFParE0zftSQW
         GS8U9oRv3gEMlqVygGV+Ruwr+M+q7+ku5OPDu+pqh7WDXb++WJWvlp/80A3WHhSjIbfX
         5yQSgKrDF5wwsGsCAtsvphv60LXMmzkTDYgmbrbJOSbO5RvEyjNUKZJTG0q1saKy/KON
         shA//FceVKhF7kHyJnkaibcQ1J68xE80JtFtdGErWRdj2vfT6gkUZrGIiFt1K6hiSqCC
         Fslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388116; x=1780992916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0tri8tCsiy74EQNFulBrakDi/+0isJeRmm5jzNUg/I=;
        b=tRMY9sGgLv1KmSEaV2pqR3fKk8SHcHPjt1pBUOnoipTZNiGg99hA3Vo5r1d2c97CVp
         pEVk3D9TiwZnJFMoRnEy9fnBjdIqjENmwSXnJc/RHGJk7aO4lfnQwHyoxXh/1yw2tJ8/
         MtN0QWaOON0QUePOs4I+QEPdOaAg5IMDyIqEIs+lcWE54aU8Rs73pkDWhpfEVSmZx8Xs
         qOMMwosCZH/EQmCmt700psJoERW0mHmV8tTas9Yph3O/v4jE3Cs6oTzXPns3ZptETEN2
         8yDDWELKsnToiaaSpHVPZybu3CcEm1iqjuc9574XnvS4Mxeo7v8Nsj0UgVHETbFqmzHB
         h68Q==
X-Forwarded-Encrypted: i=1; AFNElJ8CVPyzlIOpkdSrJ/dqt03UfitwyG2xAVe//LXSHLqhgudQ2Sbp67W/GF7TzsGT33Six3KzbyE1wVt3@vger.kernel.org
X-Gm-Message-State: AOJu0YxIBJHBDXLK1yX72a3aUdoyeUtixDAmDW1oZP/+Da+k1MAZjL8e
	x72sWPy/oI2T1Q5RybNX4IMRDEhKVzW38Q3EGb3c6N8AQMqKhgDPtP9E
X-Gm-Gg: Acq92OErM0rN2eM3W7gqS7pLtbWVVC4UwzEJH+D4Y7z4WCRd1l5JXo5Pui1XMb31Kbg
	hjr22lgBmFdmILKmbydsimU8y9e/n3Pj/xPcmL4U++2SnsxyM7kZ5xBsfA6Z1VoKGCoOAisuR0F
	gJwQHq3eEksv4JKIm0fyqSFKYEttACHTP90toCXVsc5z+BbCTvz1b16T4RcwZL9YuPZ43Ahq16f
	l3Lb51ZAYw7gLt75q/tHXLzDuHsEYvjCVjwstJP3/JerUPEArDNSL7Ks12zVoqdb7mEEAIoIb29
	iANkPTlLp9C98OwiDlsUr0bVCTw8MOHzlag+qxCZUfjzB5G8BPuHahJBgT3UexAR6MRTrVQyD+J
	ON88KSTf7F9nFPIQ7KqR8Dwlekwf3ToGGoBY80Fv+G0WaCWh2VnDaPd6ClG5mrQaqfW3d1K/WIh
	Tqv5v4bubc7CrnjjHD0m2qyTdEqClL+xA=
X-Received: by 2002:a5d:5cce:0:b0:441:1cf9:4f06 with SMTP id ffacd0b85a97d-45ef6b8c844mr20729418f8f.31.1780388115957;
        Tue, 02 Jun 2026 01:15:15 -0700 (PDT)
Received: from legfed1 ([2a00:79c0:606:f600:1ebe:eb51:3a97:3b47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a065esm32352694f8f.5.2026.06.02.01.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:15:15 -0700 (PDT)
Date: Tue, 2 Jun 2026 10:15:13 +0200
From: Dimitri Fedrau <dima.fedrau@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Dimitri Fedrau via B4 Relay <devnull+dimitri.fedrau.liebherr.com@kernel.org>,
	olteanv@gmail.com, krzk+dt@kernel.org, vkoul@kernel.org,
	linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, neil.armstrong@linaro.org
Subject: Re: [PATCH v5 2/2] phy: add basic support for NXPs TJA1145 CAN
 transceiver
Message-ID: <20260602081513.GA227859@legfed1>
References: <20260513-tja1145-support-v5-2-38720a7ee63e@liebherr.com>
 <20260514054447.A59AFC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514054447.A59AFC2BCB7@smtp.kernel.org>

Am Thu, May 14, 2026 at 05:44:47AM +0000 schrieb sashiko-bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The driver fails to enable the hardware power supplies (`vcc-supply`, `vio-supply`, `vbat-supply`) before communicating with the device.
> - [High] The driver does not observe the required mode transition delay when powering on the PHY.
> - [Medium] Missing rollback to standby mode in the error path of `tja1145_phy_power_on`.
> --
> 
> commit 288134e179992cb2e690ff7a97502e72f04e9d5a
> Author: Dimitri Fedrau <dimitri.fedrau@liebherr.com>
> 
> phy: add basic support for NXPs TJA1145 CAN transceiver
> 
> This commit adds basic driver support for the NXP TJA1145 CAN transceiver.
> It implements the PHY operations to bring the hardware up and down by
> switching between normal and standby modes using SPI commands.
> 
> > diff --git a/drivers/phy/phy-nxp-tja1145.c b/drivers/phy/phy-nxp-tja1145.c
> > new file mode 100644
> > index 0000000000000..1e8bd169743ab
> > --- /dev/null
> > +++ b/drivers/phy/phy-nxp-tja1145.c
> 
> [ ... ]
> 
> > +static int tja1145_phy_power_on(struct phy *phy)
> > +{
> > +	struct regmap *map = phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	/*
> > +	 * Switch operating mode to normal which is the active operating mode.
> > +	 * In this mode, the device is fully operational.
> > +	 */
> > +	ret = regmap_update_bits(map, TJA1145_MODE_CTRL, TJA1145_MODE_CTRL_MC,
> > +				 TJA1145_MODE_CTRL_NORMAL);
> > +	if (ret)
> > +		return ret;
> 
> According to the hardware datasheet, transitioning the transceiver to normal
> mode can take up to 40 us. Does this sequence need a hardware transition
> delay before sending the active mode command?
>
Cannot find anything related in the datasheet.

> With a fast SPI bus, the next command might arrive before the hardware state
> machine finishes transitioning, which could cause the active mode command to
> be ignored.
> 
> > +
> > +	/*
> > +	 * Switch to CAN operating mode active where the PHY can transmit and
> > +	 * receive data.
> > +	 */
> > +	return regmap_update_bits(map, TJA1145_CAN_CTRL, TJA1145_CAN_CTRL_CMC,
> > +				  TJA1145_CAN_CTRL_ACTIVE);
> 
> If this second regmap_update_bits() fails, the function returns an error
> without reverting the device to standby mode.
> 
Don't see a second regmap_update_bits().

> Since the PHY framework keeps the power_count at 0 on an error return,
> phy_power_off() will not be called during shutdown or suspend. Could this
> leave the hardware permanently stuck in normal mode, drawing power
> unintentionally?
> 
> > +}
> 
> [ ... ]
> 
> > +static int tja1145_probe(struct spi_device *spi)
> > +{
> > +	struct phy_provider *phy_provider;
> > +	struct device *dev = &spi->dev;
> > +	struct regmap *map;
> > +	struct phy *phy;
> > +	int ret;
> > +
> > +	map = devm_regmap_init_spi(spi, &tja1145_regmap_config);
> > +	if (IS_ERR(map))
> > +		return dev_err_probe(dev, PTR_ERR(map), "failed to init regmap\n");
> > +
> > +	ret = tja1145_check_ident(dev, map);
> 
> Will this fail to communicate with the hardware on platforms where power
> supplies are dynamically controlled?
>

Yes, but dyamically controlled power supplies are not implemented yet.
Support has to wait until there is need for it.

> The device tree binding defines vcc-supply, vio-supply, and vbat-supply as
> power sources, but they do not appear to be requested or enabled in this
> function before tja1145_check_ident() is called.
> 
> This might leave the PHY unpowered, causing the SPI read to return garbage
> data and fail the probe with -ENODEV.
> 
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to identify device\n");
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260513-tja1145-support-v5-0-38720a7ee63e@liebherr.com?part=2
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy
