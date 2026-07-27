Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF632E72F
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136764; cv=pass; b=RWSXC7DJDLX+N6Y+ivcW1a569Z6WYx9SoYa2wIGMChEzdBp8rfUQMt56iGZGo/z+LmC5P6h5VqxdNiAVY/sJniji+s1+hjPMlu7pjwSd/exeT7mvZXuxEpa7A8D/2iRakxVtEH9GsFKdPc93KnBi8dfAxoNi5LjjWnU9JnSuwcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136764; c=relaxed/simple;
	bh=3s0ZWapk6CSKQG7LinS/fqM/+LO7TASDUFIgGuAFciw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzgmMUbdtV/7Iow8FjxrlxHXSSS99Oj2WpBhFNwzo7vp88+TNL2VQIOteClUtRPyZ4XPDEPL10OZED5Lilgje3G/8Dm2zTpzhYFLTT2Mtf967VTL3ejDAuJ3cnFqS2UWQ6byTyCJZ/Dz80dzx+pUx9H5wva9r7a3nHuYZlAjWxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/kFbSE8; arc=pass smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/kFbSE8"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e5cb052edso174090185a.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785136762; cv=none;
        d=google.com; s=arc-20260327;
        b=HsShRWp5GY1TJNXG4T3U0kK+lo2IPABtCr1527hEYVDrzp9PbHve/wdILycCqnDW9a
         ILyQ6xHi5LgY8o5Ep+rbVUpMo28TmVQxbSYd4hds2szy+9ZeUKYMfKK5e3m9NJvLzjt6
         r10PGhlDI1Wl1LhwxxWCe/SKt1s0Pcm0De6whiwIRe8qYp+Q+jpST04C7Nm/pumbN5k8
         SHu8a4WEK3mdGjkLw/kStmn8W7YdmqaWFW47jF1OniKospS60b9j2R9iFobp0un0A5rY
         m0Vk4PGfGqkIoqiBGNBERW5DaDibyZI73hpkjbD0rK1lTb5LooEbUcbHzORa6tGMuLn9
         2VrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3s0ZWapk6CSKQG7LinS/fqM/+LO7TASDUFIgGuAFciw=;
        fh=YJNhTsiZ6BmOXRVOKl6uHcr9t3KTlEd50UR/PMEeGAU=;
        b=OFdMJwRrRcZ6EYNOHDbZbZdqt2UmJ/qeIEFoS7Z75dlO1jv8rNA/+zJpk5XoBbpBzH
         LnvMTjAzQgyaqJgTzZThKHqim9XMup8elrL3Ya42uOvWAd/6HNSWPrq5vQXvwrbaK+n9
         NZYZOsZ6v2cuhmkqq9lbZvqoa+Vhb40mZ7uIKmlFGauaFmUp8LzTxhglkduDhjkm6mUv
         pXxJLhntYapBQ+bhpHjbQqUbSddgpJP39Dig7C4Kg6ka6XTnAjiN6VuNpH/f0r1RIWgl
         MemBbMymeFDIWXXHta7JDsJSApg4K2oLtmvgprjRd4aCQog15+c7JX6JPYkqJJD8u7Tz
         ij4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785136762; x=1785741562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3s0ZWapk6CSKQG7LinS/fqM/+LO7TASDUFIgGuAFciw=;
        b=A/kFbSE8v6s5tI3pBO/5rLUHnTdZN0KAFptsSL68fmIbF5MAlrgGEETmBmeywd2Yvk
         jRqqaKd/ZgSUyhZ7y1fNfETnWf1xFcjmRTp0unhu+H7BCPWdHYZKSQ1Y8y3jUmD4Fwp4
         53V+YhSlzpJm1SYcF7itobWri2piT9C8uYtO+3hfMwDj4UF/yqdq9WP2BFwHIakk6ba3
         vv5R4qOOZnVaYr8iMqNKng1J5BITNt7Vh2OiL894myajocI4/N1bZ9i38yoiLpVakkS9
         WbKxbPiF1rrE6FuUWcjl6dRJnPeqrHOs2FsTeX3K79qeEQuKeOudZs6KTQJMyI4ZMhn4
         ZZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785136762; x=1785741562;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3s0ZWapk6CSKQG7LinS/fqM/+LO7TASDUFIgGuAFciw=;
        b=W37SLWANTtsOu7uwfhCKLYBc7mk7lIuERZAZT1JQNcqChe2JhhyHcSFx5oOn4Psv43
         bQ1Enrtfc+PPIMVcGNaz3rXAZWteykcmeM9HTrkpTuciHMwaoOapxzns2EYMA8Si+Thl
         6wIvUnhqm8b/EHIBBm+ClqZbgMIFpjKVwu7goJpOr+mxV5xfnKfaJO5eFkpcyhngx1LK
         vQrmvnezzOrjiJGOHsU6N+RDFvBFCdvuXzt2uSn4ZkxHmHzUNsOMC5BcBLi4quehc2gW
         wUJfq31hUD2csae2WQDj8VQmwU8kpmfs3LullSCJ4ezjlkXagfdC2YzMJFRC2kVeWpcM
         +KUg==
X-Forwarded-Encrypted: i=1; AHgh+RrgQ7bPkIE+8Yc4gNFRoHABDH7dV4n2ZocQ/E3fo/YHpwbGUQ2/4Z7XN4CN2zxYCoU8YbxvWles7phr@vger.kernel.org
X-Gm-Message-State: AOJu0YydjOfGLTF/SzS4+OIysJCU6ArbkCdcUBekHBhJFueDMEMHZCFE
	OtXXQCLtLrPtGyhL/iPkzgra7EF651/kfWqP5mCIcFO/Tkk5zX/Mu9nkFBCxwrDP+dmrSCL/9sk
	B34vaf3mWJOZmW1rnLWGv6LU9Op0LZ4E=
X-Gm-Gg: AR+sD12i13IKNDU61jyRqUMeRmh/RkvxI0znFhqBQNyssUQjyoj5jd/0/6dUii8r0wQ
	N2FLvBixrv5uoLqTyZAzuvvsGaFQuwC45XnCTh/a3TzI/VA/cRmZleXarLfjUSzNVNhpciIhxs4
	OK6nw4+uh0mpGDwRlc/fg1+7y3azpJb7TrwvfQUBzyuSLwBUMF+14uLpH5TR5HZfLqzsxi25xGp
	fMKBlod+ZaDIoZ04zntKFeiXU995iGiM79yd5CMhtJA5R9uJKFnGZeoro/k9WlfzjDI1ggD9gZl
	fAxqZydXCjx2XyDWFA==
X-Received: by 2002:a05:620a:a41c:10b0:92e:4e88:f453 with SMTP id
 af79cd13be357-932df72fa5emr557474685a.52.1785136762304; Mon, 27 Jul 2026
 00:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727021048.3375444-1-attinagaoxu@gmail.com> <dae67c46-62b6-4233-92fc-69a09944baa5@bootlin.com>
In-Reply-To: <dae67c46-62b6-4233-92fc-69a09944baa5@bootlin.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 27 Jul 2026 11:19:09 +0400
X-Gm-Features: AUfX_mzMsY03HyPmF8nz7hhTY-FL_h-TDf2dzG1Lg1NUJL_NPUJrMPEieD7G1Rs
Message-ID: <CABjd4YwyBmTvw6cVQxLEzZEXSRb4QFEuQmrYY56WdmSfs-z8Kw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/3] net: stmmac: dwmac-rk: add RK3576 GMAC 25M
 refout support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Gavin Gao <attinagaoxu@gmail.com>, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, heiko@sntech.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	richardcochran@gmail.com, nicolas.frattaroli@collabora.com, 
	sebastian.reichel@collabora.com, sashal@kernel.org, 
	chaoyi.chen@rock-chips.com, amadeus@jmu.edu.cn, rmk+kernel@armlinux.org.uk, 
	horms@kernel.org, alok.a.tiwari@oracle.com, david.wu@rock-chips.com, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Mon, Jul 27, 2026 at 11:11=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 7/27/26 04:10, Gavin Gao wrote:
> > Hi,
> >
> > Some Rockchip GMAC instances can provide a 25 MHz reference clock outpu=
t
> > for an external RGMII PHY. Boards already describe the MAC clock direct=
ion
> > with clock_in_out =3D "output", but the dwmac-rk driver does not curren=
tly
> > request or enable the corresponding 25 MHz reference output clock.
> >
> > On RK3576, this means the REFCLKO25M_GMACx_OUT clock may be disabled by
> > the common clock framework as unused, even though the board expects the
> > GMAC block to provide the PHY reference clock.
> >
> > This series adds an optional "clk_mac_25m_refout" clock name to the
> > Rockchip DWMAC binding, wires it up for RK3576 GMAC0/GMAC1, and enables
> > it from the dwmac-rk driver when the MAC is configured for RGMII output
> > clock mode.
> >
> > The clock remains optional, so existing device trees and SoCs are not
> > affected.
> >
> > Tested on a PicoCOM RK3576 ACP board with a Motorcomm YT8521 PHY.
> > The GMAC 25 MHz reference clock output remains active and Ethernet work=
s.
>
> I have a feeling this is using the common clock framework backwards. The
> MAC in this case is a clock provider yet it uses the consumer API.
>
> Shouldn't the MAC instead register a new clock, as a provider, for the re=
f
> out ? The PHY device would then need to get/prepare/enable that clock.

The clock name is a misnomer frankly. It's configured in the CRU and
muxed to the output pin via IO registers, so it has little to do with
the GMAC itself - rather it's SoC wide. It's already exposed by the
SoC clock drivers, so nothing to be done in drivers/net/ethernet.

Looks like Motorcomm PHY drivers don't request the clock though, thus
we're seeing a second nearly identical attempt within the same
development cycle to shoehorn clock enablement into the GMAC driver
and binding, where it doesn't belong.

Best regards,
Alexey
