Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395816;
	b=1M+JHvRNVSudjtY8zWZ3sMYpyQ7igPxMLiVSNEqgLsWzqu4DsWlej0j/AAJBDkQVweGD
	 Lm7r9qqN+FMM4cO2VDaWDiu1zp5322G51rbpPmY0FBuTrzibgYjnLxHPDNKw6U2VumBJi
	 C+RGDa5Chi8ZKYPaxInhGpZ/j/0YILsrrZ3umPwqROHUMwhuoxH4iEIA3iWuGiAo6JtJB
	 OTeZK4R9CuifLk7IDoFup/gbU3x822G0E4jucOgpsytR6+rMnM2d9WPllKqKX5E55rRsC
	 dpzGtdOBuCE1/+SSJ160zpiV4ZILvdnUeGW1M1A83Px8KC+djR7lt6l4jx/0s4JNaVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395816;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vewfa4e2I0aobL3WDU7H9NeMGakdHt+iIIc9ifO0nVc=;
	b=ZQCHDsrnrD5JYcT/s33Du/gz8l7ocqa+yHf6tiTrNzLi89C42amsVZ+4PSyhA4h622G0
	 KAY6ab9UraHX5fjiFNUO9fXjpdgp7Zzgy46I5r7Nvmn6Z95tpJUctyP4Yq5y3j/W/E7mx
	 vLyqRbrG6VgSBAwoXElIQh/x3Bzo3hwa5XPITgesyftow9obQioCre8Z8x2uhasGBpKlF
	 9B1Q5gbB6YYQSBgxLRMH6ktIROUbuch5192ltOWmpemGW7Xb1p0b0R9E6arOqgl7lORrN
	 GBeEwAiYBDzY090mvVNlPS8DhyH7Xn8fTRE1WV0LNjxSPZEhpiHIzXCdoVLgUBF5hJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDYJnLDS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B622606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dDYJnLDS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195EE1F00A05;
	Wed, 11 Nov 2026 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395816;
	bh=vewfa4e2I0aobL3WDU7H9NeMGakdHt+iIIc9ifO0nVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dDYJnLDSCDAN6OmtCeQriuUg1rtkoGN+AAAKEo2iPlMZ23kTyopDsWA7VhxbudFYa
	 Nkv8/Oi7b3lpLzL3BwjtTavYN/TtN9FLcrayBj8+FEWESmvmGYlx4LoCqAs3rIEFBo
	 NgD8Yq/hs0r3vqLO76rhu8xA23suPqJ+E20VtyVUvKYEYfJc+4l3mGpApr9+8XvEHH
	 44B5WZFJETrOXatoyrOirm6f+rUwkzHloU3bZib2iz695siHmimZgCNu3I5UIcXk+3
	 w53nVdESs/SnF7hJC0BXz1fcXRORmyc+0N2jkmP435Z0+21WZ8VpWniXCpl4x72i5r
	 eOtiRecZlMgVA==
Date: Wed, 11 Nov 2026 12:16:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artem Novak <artem122novak@gmail.com>
Cc: andrew@lunn.ch, robh@kernel.org, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	klightspeed@killerwolves.net, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: kirkwood: Remove duplicate DS212
 compatible
Message-ID: <20261111-versed-uppish-butterfly-fe4c3d@quoll>
References: <20261110093120.179318-1-artem122novak@gmail.com>
 <20261110093120.179318-3-artem122novak@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110093120.179318-3-artem122novak@gmail.com>

On Tue, Nov 10, 2026 at 03:31:20AM -0600, Artem Novak wrote:
> The Synology DS212 Device Tree lists "synology,ds212pv10"
> twice in its compatible property.
> 
> Remove the duplicate so that the compatible sequence
> contains only unique identifiers.
> 
> The compatible ordering is otherwise unchanged.
> 
> Fixes: 2d0a7addbd10 ("ARM: Kirkwood: Add support for many Synology NAS devices")
> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
>  arch/arm/boot/dts/marvell/kirkwood-ds212.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

