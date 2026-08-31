Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5D540587A
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180267; cv=none; b=i64rOjWbT4A0Oaj2K8ldtkMzfqcuNSUG2ug20P38u3WAhWHsV4tjix6or5bYAfMw/2Y0Rm8mdgzi8D5ylz32ESSAA1KoitXEPxvLzo2O8bCPxeNuu3vGrqHMBTV0k2k0LYZoVGVbqzXKruFC8PodyrmUXHEmlgFrVb+vuC1VNv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180267; c=relaxed/simple;
	bh=twM5iKsuAc3xLVX46SHQS26qsWYtE0sdxed6QRzWLKY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HEgq8o30D1gorFeLXKYU2UOcSEireM6qeXwBl2AxT2nEnK5bIM++a5ZtTGUgRqlqsxhM+3b+yCe5uSpWXY96tFo4rFXGFPzS6WP2PhV6BGVzRJaioa7uUvZi9osTYhDmSUe19Z3oTRO8JQwSZlcXEIRvGCkYHWRNa4qMrSftPbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aYiXlcf4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aYiXlcf4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso50125e9.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 05:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788180261; x=1788785061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EvpzgjhvcxWJzAemqIAhsf9SNmX9ng1FkRl8Qno2LU=;
        b=aYiXlcf4+Aw/sZASsjGs/TEEDpkWS0eJ1bGfOW4zdltuWk+WCF3C+orXwC7g7pWPTy
         WCQpDeIW8o0wHj0C86YafOEuClR4sKKjGF0DRe8MKZaWb/x2W7Y3sDNGALd7NBvUofGR
         zRet1HokS42pdljhxECFMaZqfsrLnBSyBQyhspKhk2P6s7iZDQqprxox6b4VGlTpGR2o
         ElcKyR6tY6ZI3XleN2bRQaixpvMrMAWZuBmopASZdKL0T3AB+ueNYbCwUYZije2MEZSa
         faedO0qPxYRp/AH0Hm7iPj8Ov58VIDh9Kla2gPau2eGGbXO8nS4rqoxSml2Dgez9HwtQ
         dVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180261; x=1788785061;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EvpzgjhvcxWJzAemqIAhsf9SNmX9ng1FkRl8Qno2LU=;
        b=WMtwf5OYZl9uG5CuQE+BJK9DrJ3PI4eOp3Vrt2n9BMb3zNqnSO7XyYS3KwCiIlj0Qp
         POsczydE8yQ6Qu6vqnWkn6EmqVTKL3ll/wdc9kLl+a4aMMRgwNFTyySMoT39OjsUxK0T
         uaC4m+tV5jcNUsq1FyWLnfh/0BclsG2TsPiJrIiyoC6t4YXSK91n76AhRKbFVMryU9aQ
         0Xw5y6pmwwhu4hoWdNIS2FSkQ6waG9yI4KSGHefXntlR8AvcOrQkDkN3Xxl8KWT/56jO
         MhAqsOjd4T47oYX/hrBKNDLF92IJMV+jsWWfvd/B9H1LxbLgwZyP4jbsaeN9A09WTkeX
         yhUQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6NEIPbbz8Hcyp5oA9k1px/cymgw9qq857QKBDX0UtIkMdDGLgTMS9SfmrWbAXvaYBH2l+P7YCcyRQ@vger.kernel.org
X-Gm-Message-State: AFuF++lKUg2pNCsueoJK1hhfe0TtSSZy6Oy37tyu7aLcOednmhAafDez
	EC+7yvGWR0Cb3xNBSMD7R4uqPA7h5AoGampd8af9BJ6o/bBZTGOSyDlOU82oeVDbPBk=
X-Gm-Gg: AR+sD100De9Z5OmHJ9yPeZ2Lrv0jYXkOqpqTKyhmc9gLmQ6bJnFdC1tg8jrxz2xjxui
	M1e2NLffCO0vzN1iI9YWVjRsWmejh6785hsLHS2xTVO0woLe9xsRz2UN0grxI9ERLLV2G3SWSTE
	G/RLagEQXynW9GzZKdo1aDNLzq0yJSNWtdfveeBBqnmjnQh3ugko2K+oSBCnyDeouuN4JiumHRQ
	eEm2zwUa3eKFScTlXUZ/Hk+k1KeaKkw6RHm9otXs755+++2G+UotSPEWbNLtdpZ6hscyOtdNGoQ
	nvGA5nG0t+NAZlNBncZ1F3cjwfHxKxsPUgE8qIKlXw38LlPAUItUDv2FCe1/y/DGiNVCohMRD1S
	wDTZPX2xcg9u7OILGdJVzRI2t8XfPTZ9+g09kxUyfm0qIqHzRAYsGipdPvXdPAUi4W/DlKSl0li
	nzjfjlPnNqVasF88RDiRtXAJcXPiukXZgeusRRcBjeUR4uvc7sFOfF4p7ikxJpQ57kKeUi2g+1L
	dbgT5nYRQ==
X-Received: by 2002:a05:600c:1f8b:b0:499:ae94:be05 with SMTP id 5b1f17b1804b1-49cdc3df92amr7182765e9.0.1788180260838;
        Mon, 31 Aug 2026 05:44:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm390196485e9.12.2026.08.31.05.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:44:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260823115335.102219-1-tanure@linux.com>
References: <20260823115335.102219-1-tanure@linux.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: amlogic: t7: fix UART clock and SD
 card recovery
Message-Id: <178818025763.2318126.6483446574954996795.b4-ty@b4>
Date: Mon, 31 Aug 2026 14:44:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Sun, 23 Aug 2026 12:53:33 +0100, Lucas Tanure wrote:
> Two fixes found while booting mainline on a Khadas VIM4.
> 
> The first one wires uart_a to the real UART bus clock. It was pointed at
> the 24MHz crystal as a placeholder, because the T7 clock controller
> driver did not exist when these boards were added. That leaves the real
> clock without a user, so the kernel turns it off when it disables unused
> clocks at the end of boot, and the board hangs with the console gone.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/fixes)

[1/2] arm64: dts: amlogic: t7: use the real UART pclk
      https://git.kernel.org/amlogic/c/882de800bf583dd15969836088789edbf035a944
[2/2] arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
      https://git.kernel.org/amlogic/c/c793a084ab3088744516aef437b4239d0d98623f

These changes has been applied on the intermediate git tree [1].

The v7.3/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

