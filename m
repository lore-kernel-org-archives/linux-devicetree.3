Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3D635C6A1
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787673022; cv=none; b=Y2VVw0wV2uF5xVzH3OSiCiFGPD0c4LAUFXbKGUhA7Y1wl+OVaDrG5CDpZUolYCXGKOhC+PQx+8Yzvpg68VUn5neIBn9dSg9+so6LyeC+F177qUslozX2Ulr59Gioq9s6KKWr5L2uWHyDte/TcH40YI6VM3FgHas2b6IyREcF8jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787673022; c=relaxed/simple;
	bh=lbsG+1QcQGpn/6wkJpy4eTwTvVz7cjdJk+5+NrHiCj0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=EMN4VzR4jRQN3p8BFgr896ht0Msc0Dep0g79pPr57CE5qcROyu+csmShhwHyYQvjhounTZ1y0zEul0gRiKiy6g9CPxD3r/ACjOV97ra3xWW7WwBxz4OmzPFhehefU9srrXHuHxANyBp8IICYKWLnoSQYcP/GdPCPzEJEi+Gf+jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jeOC5J0R; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jeOC5J0R"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47de0093c42so3857612f8f.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787673019; x=1788277819; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lbsG+1QcQGpn/6wkJpy4eTwTvVz7cjdJk+5+NrHiCj0=;
        b=jeOC5J0R+g0lrkmwDDOthA9FQZWAuirheoT9F7y1ysDoMShK7961wh9KNOo4WzkPtt
         CtYedIc7lYnN62lGiCFLjvq3AUApShzQV+Vve1iqo8gS13n1u0zL9XjB4rlOOZiHsx2g
         ix0Aso7uu0GE+bTPIKFilJmd6tdjFD2Hqt3DTnWTpZ1h/ua6aMg5MSieJRvEb48idOJG
         tbqxBQrQg9kVhEi6Ra/4M74GGvGB3hbB7mQ8b2XuCquSnGM6p9l35IWzmyjTBn7+ANdO
         0IRmrPB4fWncDN4Lm31J4c6QyL+V4y5YGK2tFUmaXvyQuOicyTBosBhRdbWUHFle/IYx
         aOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787673019; x=1788277819;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbsG+1QcQGpn/6wkJpy4eTwTvVz7cjdJk+5+NrHiCj0=;
        b=sfbgAiF6hWZaNBZCoNWa11bKUqvvM8ROKpcjXbl79E+56j1z+WlBlAPVmbowfY30Tg
         BVpdVo5TcqKtDxKUDVqySokVLpCY9EF2103NV9UbFFO3M2bmOynTG/gZ2fARmwRJbLvN
         GHqGfQHb5BGhnpY9tZJrLRGhEHNVde9fAuxLiJl9tf2YS+KACpIgsYqQ333zqcCWLhJK
         wXk9piOT4IF+/06sDuQdmEulVGNQ+ysW2RLNIbWhbPxwuEE+Q/g0q4BzWQWPaI63ssbS
         K475HxDYHL354/eB65Uh7dCGdHE1ZmBVrZLfACNPdAEEJ8/BK8Xxlp2oB8negUOzB5TB
         9cOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpl3klnmGb0bZc90bHoiEQeKu/E6MIaGfEaGKj1l65leN2HFqbzEVXfzbN9IVCaQULmYg/G0Kdk/yCV@vger.kernel.org
X-Gm-Message-State: AFuF++l44/JIT/3O+JVYh8ubhFx3SuOSw3pjY7rDiN2EGTNrqLOZe8Wy
	D3KWlXQsmoi5YTwpbahdRP8yQE4Ly84PIGDjYuYMRCx6XOzQkKxfIKDe8b0bVl6fUNL/kb4k3Ng
	1xOp2
X-Gm-Gg: AR+sD106OQ9RHUvceBOHexHSeMTM2aR6MroSSFSg/laBC3KHw2mokX7LkeVEXOoHV5b
	SvQVFPx36JK1Sg7owWcpl1SScQ9nMYiy8w/h3GwJM3JvRz0Lthm1sZJVWjuiHCRYNd6wq6gAfTk
	zclsSoL0bBGUZdg2GgnVnkjO7cQ7XOQsbKOGom8z2hQ4L0EtJHaxVAoYWGBSEp+xJjx5ondKnaX
	gVARIngoSUV5LgRtNDb64T54Zj8TxCcjVNaUuaZ2EOdQHfP/uhQpZkzbRn4PakNoyDxOCx/cSug
	iwaSHOh2xWQR3tsjvc9q+sEsenMcvhiVdlIignJlNb8FKrvRiazmyoKUa0nFlviViXAtepafxwL
	LyXL01iZSPyEbe/ieR5Qs7JnlOpAbE3fo5/psFpwTjmfPxbdMklRP8jWObiMG4M0FtuRr62nNno
	2GuKBCwBoT0RZaHCIR+VTh/5lp4pnJjYHhJomUl2b2gbx4TglK1fdvr+4ORE1Fm1RiwTcWNSs/H
	ahMCigcM2+k2yBNH+wtkyhjJpv4ZvTJWC9Cq+BFdeub063WnVJBXTX9PXdw
X-Received: by 2002:a05:6000:4685:b0:47f:8ac0:ccb4 with SMTP id ffacd0b85a97d-482e26d9adbmr43120f8f.10.1787673019285;
        Tue, 25 Aug 2026 08:50:19 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482dd853b9asm1999374f8f.1.2026.08.25.08.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 08:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 16:50:17 +0100
Message-Id: <DKY572QGTWSQ.3GW5FQV7JF485@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Thomas Turner" <tturner@lineageos.org>
Cc: <krzysztof.kozlowski@oss.qualcomm.com>, <semen.protsenko@linaro.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <peter.griffin@linaro.org>, <alim.akhtar@samsung.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
X-Mailer: aerc 0.21.0
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM> <20260820142330.84514-1-tturner@lineageos.org>
In-Reply-To: <20260820142330.84514-1-tturner@lineageos.org>

On Thu Aug 20, 2026 at 3:23 PM BST, Thomas Turner wrote:
> Hi all,

Hi Thomas,

On the next submission, could you please also add my email
alexey.klimov@linaro.org to c/c list?
It is interesting topic.

Offtopic: I have working patches that enable cpu idle states on Exynos850
but they are not upstreameable due to PSCI (needs some argument
shift in one of the PSCI calls due to messed up MPIDRs).
If you will be interested to test/use that, please let me know.

> This is my first time sending patches to linux so apologies for
> mistakes. This series provides basic GPU support to the Exynos850
> platform, making use of the Mali G52 GPU through the panfrost driver.

Best regards,
Alexey
