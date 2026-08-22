Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8AB30649C
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 02:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787364920; cv=none; b=BVH7ozDfHJSn8GiT/5iyEx4XRD4ngzjVSXsQnkkf7IsTbPxo7Io8zCPCVZ+VZEcpo90vhWVZTsmP1oZPOW+nhlqLSu2FhzZHCvztXlqAceEhHtIc5CB+/eolEBL1vPC7s10wIAD6hwMxSQ9oU5FvkcHbfyTgjn4zzTIh7mZbLXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787364920; c=relaxed/simple;
	bh=mD5xjXCGIl4YFPLhqSxXfqSUdA/Yx43BvWrOBmOpsuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzdWlReXaNiJBA8S7nSz8cR23yB5hChIMXavdd6zjJIjZ3TOos7FwoYwM2jJi/6rAUf1zzxsfZu7DzW4M8fXxO+STNzXCutv4yjSGQQJstS/sHn6NmpdDNwZrlbFkJC1la4i8z+ywE6Yr5KznGve0qUGjBSzJheeAQa14Jk2CxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kfxv7vi7; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kfxv7vi7"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbedf6a6fe8so1249210a12.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 19:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787364915; x=1787969715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9puE3+zCLEaWdw8EId49ZyEBO5d5Da/X77xZvHMcX4=;
        b=Kfxv7vi7yWnxpbBTApAbkFpc6t4qeGe6/1C9ZkNGgQ+VWyArDGVrouh0Ke5lB67a7y
         Dwz2caYhf/2y6VsAFO2dZ39PTDzy3snep8JkXFCLYY7Ygu/17ydWkm6mwKaxPKhhOZqz
         YM1+BSyPsoauK9gymmt7lYSKFO5ZExE3TbzoWDhN2iBxGiTTTR+PMJ1JHmfutshZVXTq
         QPHNTbY/jWPu/FKWJp7m4GNK6HIgfsLqanMdej0rOT5UFOPEi1JYk2eTxSsUZ7O0sCsa
         vjVYRKNettgM20uSIkUu0QcBLFwUAix2pj8Llnrfx0avKtIlOdhotttJRJUmdatnaAOS
         Gr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787364915; x=1787969715;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9puE3+zCLEaWdw8EId49ZyEBO5d5Da/X77xZvHMcX4=;
        b=Y5vHaQ2ddTeH7Kwrwj+RywfrMJ4bipMzvHZJZRRo7G1u/1gNhQAeAQcGI/HXVN8+Yc
         qodOmL7O+7Hl6P1aPwDOnN9mLo/D8KiYiBLbyxB61zbTNiASMXm3N5SXeBxkuNjEkvyi
         3DvRaJIIttuQ5fNqq+mOqf+aSnT2C/G5LRab6K1vIU/R5Li+ISb+e9F+iaPhAY+sZlGD
         EO2YZ+P9rQ8ZVoiD6gOQs5glwvK9uJWOlIjcnCOyoICffGH2gKmECU96wvXaQtkpN1Oh
         6RT1bHSoLBPhpL3YV33bhXqgfRoklPlj2eC6I/htnamxHibhu0oocNNHTEE0jksVzBIV
         Qhfg==
X-Forwarded-Encrypted: i=1; AHgh+RqKtgAS9AddKWY69gmGE1bRs7+7l8Glpwggh/cVX+Hq26HsSgwgWMxBHFcrpmToeSKB1pbtu6QRRVD9@vger.kernel.org
X-Gm-Message-State: AFuF++nQa8BywAgOLKaKd6Cw/TT3UtT1Oq3PKmfBDy38hY187Vjd1oHv
	6s35uzGItLxRfggNap3dFmh/1ZToIIohpfmFwvWbsEu4rrVwh//ZNCcf
X-Gm-Gg: AR+sD12uxpFFOIpEpo78oyC6jO33nSN1fcl754oRUIfYq+Y6EhI6rTtkBJ7GH8cKmLe
	aPQMvTqeQQB5J1fI82wiA2qxsbgSVkvDYBuhyZa6k/ZLvOskG3E+40Y3LspenwxV3geINcHQJID
	6BCZxjAp0vgzr2Jd9vb9jr0yCn4ttvLhOurPl4T975sQO5AmI7GFF16txrPIz1QLOjBiboZ2v88
	Iq6VnbgFa59hLwRkSc43q5GR2+mJ3f8gD19ditX5NpZzxufdRfoA6rYYoNTbiXjSGM55jh87F0m
	gd4dPxSu6/Pk8ANsynnlaSLvCoRBuLgIzxorxUVEAtsKmzHTQsmeYh4HhOK2LYuJ9rS0VH1FWYv
	OBsa/mJpH08js3rHh1vyP7B1hRBNTBmssn0chcDSdLYPGu4JiuUHWPe6otOseVIBvFIWN0J8yBC
	CM94XOhyJ0E7jKXsou9Rw74CXl9BbVYiMFOlSYTLZbNrslZnjKY6Aed6Ig5gk=
X-Received: by 2002:a17:90b:4b89:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-395deeae6e3mr4932581a91.6.1787364915420;
        Fri, 21 Aug 2026 19:15:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49d8b1csm1062983a91.11.2026.08.21.19.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:15:15 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:15:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, chen.wang@linux.dev, 
	inochiama@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node
 name
Message-ID: <aokF9v3orE3nBz4D@inochi.infowork>
References: <20260803163427.74445-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803163427.74445-1-chenyou910331@gmail.com>

On Tue, Aug 04, 2026 at 12:34:24AM +0800, Chen-Yu Yeh wrote:
> The internal EPHY node is named "phy@0" while its reg property is <1>.
> The unit-address should match the first entry of the reg property, but
> this is not checked by dtc for MDIO buses. The kernel confirms the PHY
> is indeed at address 1:
> 
>   eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]
> 
> Rename the node to ethernet-phy@1, which also follows the common naming
> convention for ethernet PHY nodes.
> 
> Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index ec3bf305274a..cf672cc6b935 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
>  				#size-cells = <0>;
>  				reg = <0>;
>  
> -				internal_ephy: phy@0 {
> +				internal_ephy: phy@1 {
>  					compatible = "ethernet-phy-ieee802.3-c22";
>  					reg = <1>;
>  				};
> -- 
> 2.43.0
> 

Please send this with the same thread of PATCH 1. Otherwise, LGTM

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Regards,
Inochi
