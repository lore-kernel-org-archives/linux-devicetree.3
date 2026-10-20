Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460908;
	b=jyATKChKrWriYdn3H+QcydX8naOVl6VP8Tq4AZq0SOCiTkidrNrGQ+QKrdjlt6BJThbI
	 Xp7n2NeuQfcxEye1tdP7vpeXGVGGaxKiJGlBZX/9S+iE2pDA3kkSOmiQgzxz1lMM3e0ee
	 zKGc53MCt2gqX0myAg6oK/TgywQrK6+1F7LARsT4dLVKjNEbJXOi3f1C8bj0ywz5+9sa6
	 +t526O6iA0ApOIZlRdD8KRrVJ6+cvbREuctWMA/FlnEdiUw/T2sBFGIxLT0P8i4WDNhNx
	 KhmcvlvYPbzM0lT/KQwANxPWKn3xPLmyRPLRwvjLWUJrlFuPmBNo7Msx/Epvics+QnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ezGP1Yonno3ZtROnLi8FLhe0PdCDx+ACf/Q9hTx5uuM=;
	b=xbC2aHu8lZKffXsISAipxbHrw34TDPyqetGKb+9AlAsWWK1dWHxgPkuu+q48fQ6VwBGG
	 J1hE8EGIFqnNYB2EhlwF+NFlxUGgVzH2RYrlkuDsP3NDSFc1Hteo+Lzrq+oAtjgzbXopT
	 rN0pl7K2sWg3VSygMS3wFBheljO91ll1V4SGMHd/4LhQ+0s2iTyRAEsi7VqXMCawXjCDQ
	 wgzX3DxI7b0lNoPHk88x1RMFPXDhZPxImXBz4tl04tOolhduyK+Bn3GtVMWDNhUt7sVMg
	 RboQKfWL0N19zocH710DE325pGBwE11Vmsd7SeIkTEgTyUB0yw1ROjOgnzcp3t3U9jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FZkWFoVY;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B85606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15B85606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FZkWFoVY
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-353804b591eso5202651eec.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460907; x=1793065707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ezGP1Yonno3ZtROnLi8FLhe0PdCDx+ACf/Q9hTx5uuM=;
        b=FZkWFoVYsMtjoo4moW2w7KngMWoj4ckM6+YHFDl/bGjZ/ieFwRpf8QXxMADqaL6jCf
         oZ2vFEJ6GWTQ0h0587RDMCGKndR1Sv5wCTQAsh+TEFJUHA+uQ9nhoN+n65iGv2wXnpVm
         zGpR1cJ1E6C1gtBxo0zeZHgULiQ0Jy2kmGA9zYIAe81Jp+aYLLToZQ8iLbGkziFwAM5K
         sMYXKWct0/DIwBcna//boojaxbfdQiBnDmiXu711WywsAgWJuup9m11wjE2izpvRxbC/
         ZgP6PtE6mixlMmzm/BClDggHYm4pxnNogIdIQoTrzwoqpXn7rKS6opG0v1Rimc8cEaDN
         6NEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460907; x=1793065707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezGP1Yonno3ZtROnLi8FLhe0PdCDx+ACf/Q9hTx5uuM=;
        b=jzkzExxHVS6k01pO9uiFgizHrn5JoHwzLOLgujU2px/gL0k4veKFx+5eUVtBsyluTL
         o7OGFE44oowRE5Yiwn3Ov19dyxPeiPxS7OSLyPm7xu3Wvv6eOIkhUPdMmCWo4ACzkSzi
         0gvsCN3np5I1rZaAeZiNg7HDmSvQnzxHWjckqFP9R3A4tZi3kR9wbAhi2PN+FkEx4WNQ
         jhldce18l2wmU990SoBEnpj/PHTD90lk/9kSHEcJWeg9bdGdAd/PmGpJJA3YZf+aZ6mF
         b1cBlTYAj0BfgrDxiHdE7dAj+V3ZxfI1xmYoUyCVZ0RvOnyx6SlWheQ+gyjQDNIO6ogq
         2s/A==
X-Forwarded-Encrypted: i=1; AKwUvBz9y+Vkng/MlyC+LcZEnr6zPrvtmPzt/I9+TcG6DqbrmibX1hdItaMO3+3p9yNYERCjoziuh1Mxn87p@vger.kernel.org
X-Gm-Message-State: AFq9FYLlX2OpyTzdYQYWu3vWFR7xjpBp8fuEPlmXYRlJ+xSfu7gtL/kI
	zso+ixO7qGUBksSmHC6KEEuV7D+Mr8lY0cZS0GFCOfUA36lWFcwDKxRk
X-Gm-Gg: AYBFou2297mtEfr/dkmbIUbmydjtuHn7XekB1VpYnKOxzaaQ2pI0LTnpik/aN+Cfp7N
	8fqHdrpP6C/nddCYpudhxXlzRbP/T1dh1RRtu3qS/QgPs+6+rhOGurNhN49O2qVY/Zp6SRXYKa8
	NVjqJacpwwEWDk5QkkWakIw0yCb3FCUsh0bQKxiGOh1BR8njRgN5iVlMN6u3mojGPSfNL9FOreP
	FLtH5JALC0kzeu6rffskrPhgtlZ0KX5egDUCYEN1TDxSHk1z7YDgyYO0MaN2HxU3rO3jHUJLC1N
	U5ps/Q+QPqbF7WSFvxhTvBCver6xbsX12vyFJUNV2iKnJfWEQ6SmTo31Ipn8P++qPcEVXlMxVOH
	TeUk9xOyE6MR4kOqspG30XLxFgp8C+LW3btuymOn/+6SBdtuIYlbesebxpvd87CVboIEaWsAP/J
	eU2Pvu/lEzdL8Ss4Uz7GdDG2hM/da9ILBex+pKUl5xdGBQmS/0TBA5+i5gZrfe2L7KDrCp53dcK
	prLNebKlnGD
X-Received: by 2002:a05:7023:c087:b0:156:3684:96d4 with SMTP id a92af1059eb24-1851238b5e7mr13733617c88.25.1792460907214;
        Mon, 19 Oct 2026 18:48:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm28699903c88.14.2026.10.19.18.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:48:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:48:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: mediatek: add MT7629 reset controller
 support
Message-ID: <4606c758-16ca-4fca-9a0c-babf15643b49@roeck-us.net>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
 <20260926-b4-mt7629-toprgu-v1-2-c124bf9ac273@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-2-c124bf9ac273@gmail.com>

On Sat, Sep 26, 2026 at 07:14:00PM +0800, Chuanhong Guo wrote:
> MT7629 currently matches the MT6589 fallback, which exposes reset IDs
> 0 through 11. The MT7629 CONN_MCU reset is at bit 12 of the SWSYSRST
> register and cannot be requested through this fallback.
> 
> Add MT7629 match data with 13 reset IDs to cover the CONN_MCU reset.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied.

Thanks,
Guenter
