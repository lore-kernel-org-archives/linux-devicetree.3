Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D63218B3;
	Thu, 26 Mar 2026 09:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517159; cv=none; b=YZoIMIzFaUT8/CctYiow6RPkqFLTfMcBNqO7MUiztW88Ztgy0AA0bvT3h6dXsCp4Okg3U/P/9T1GjipqEx5kXhqh7GEbCkG0WMzQgGSo0Ctaeffcablqtfi3ZrEhaMyBTmYym30s7410FaXZkP0qfZV0aLMHLWoo81HhVezz3Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517159; c=relaxed/simple;
	bh=bBViXac1s1HzjQE4ZEPCOzLXVvupztlcldihSdx6tMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAJeHdPkrz0dIIJs9UAHtO9HYuIb3pVuhpBEbSWsCAgYWcJ2WrBygKYCSJ7P9J8NzWfRTHhWXwGZb2MSqiAyEkd9L2k5noMWfNHrQloy+j2V5tQnCvIonqQOBsvBVp/D7R1CE1hIDmNXKp49c0UK/KqZBOrFfCfp++OZCU1cK0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5RrIUBC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5RrIUBC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C4DC116C6;
	Thu, 26 Mar 2026 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774517158;
	bh=bBViXac1s1HzjQE4ZEPCOzLXVvupztlcldihSdx6tMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5RrIUBC2At8KnYfWNO1JFi8v8xn8sSkf44BAPRC6ojGSx2VyKZwlkKfKm1JQBAvb
	 k2r3zEXC0EfN9gkUEpv5ibD50ts/pp9iC4LI5PuKrgc8R0aql5Uiu4h/BFH1EPxMnD
	 9ATo05H2ez3Hr74IbrQF5Jdi0QpIhbwNKzbxdCzk3ilzc0Oaj8MA/JPotqB2QNaBjR
	 TOzu72w+r0f8JZneXamUKOUYMXPdgh6sI3D+HzFILnNBT9AH1Sc9AOGG3WmOh8SIiU
	 a/B0qjMq19NwUUAJfRFTHZNdcprtseulF9a/6OB3TRT6UJZmNX/Xdev53dT0V9+fGS
	 qr8G+/M4q8xQA==
Date: Thu, 26 Mar 2026 09:25:52 +0000
From: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v11 0/9] Add support MT6316/6363/MT6373 PMICs regulators
 and MFD
Message-ID: <20260326092552.GG1141718@google.com>
References: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
 <20251106161149.GU8064@google.com>
 <701b6abc-71e8-43fc-adfd-211a62dbec64@collabora.com>
 <20260326053449.GA910813@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326053449.GA910813@google.com>

On Thu, 26 Mar 2026, Chen-Yu Tsai wrote:

> On Fri, Nov 07, 2025 at 10:01:56AM +0100, AngeloGioacchino Del Regno wrote:
> > Il 06/11/25 17:11, Lee Jones ha scritto:
> > > On Mon, 27 Oct 2025, AngeloGioacchino Del Regno wrote:
> > > 
> > > > Changes in v11:
> > > >   - Removed unnecessary #address-cells in all mt6316 bindings
> > > > 
> > > > Changes in v10:
> > > >   - Added "struct" prefix to structs kerneldoc
> > > >   - Renamed struct mtk_spmi_pmic_pdata to mtk_spmi_pmic_variant
> > > >   - Added "REG_" to MT6363/73 mfd register definitions to disambiguate
> > > >   - Expanded MTK_SPMI_PMIC_IRQ_GROUP macro parameter names as suggested
> > > >   - Some rewording of comments as suggested, addition of more comments
> > > >   - Refactored IRQ domain handling due to deprecation of function
> > > >     irq_domain_add_tree() to use the new irq_domain_create_tree()
> > > >   - Fixed to use generic_handle_domain_irq_safe() to avoid races
> > > >   - Added support for two interrupt cells in translation
> > > >   - Removed .irq_lock() and .irq_unlock() in favor of lockdep classes
> > > >   - Added support for handling PMICs without IRQ Group register for
> > > >     upcoming MT6685 implementation
> > > 
> > > The MFD part looks okay.
> > > 
> > > Let me know when you have all the Acks and the set is ready to be merged.
> > > 
> > 
> > 
> > Lee, the regulators part was picked by Mark, so I guess you can take the MFD part
> > through your tree.
> > 
> > I'm not sure if you can also take patch [7/9] (auxadc binding), but it would be
> > great if you could, because there is an auxadc example in the mfd binding that
> > needs that commit in order to succeed the binding check.
> 
> Friendly ping. You might want to resend the remaining patches. Looks
> like they are all ready to be merged?

This is an _old_ set.

Please rebase it onto today's -next branch and provide a [RESEND].

-- 
Lee Jones [李琼斯]
