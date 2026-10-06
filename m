Received: from mail-ej2-f9.google.com (mail-ej2-f9.google.com [74.125.228.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AFE37DEBC
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 07:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272924; cv=pass; b=WHpfKMD7SZjC90wMRoN6O2zFlYQg5kdlUp2s+7Qhq936cKFVbLT4VxjXZBCf87w0FYDwZ0uLtYlOthJzyHmhfRDwKn2UymzVw3oCHyB9OjbUSCfjB9IRO6pHGolkCmcGUIJtliTKd8JnGvxtT53PLtkOhkFv0W321KOrxsdj4OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272924; c=relaxed/simple;
	bh=ZrF6e9Xl85C0uPBnJ0UyoaM1ga2dKcFe32QjUJGwcAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPzsHNuqWuH0Y/kG0DhFbd6zPn/X1MmFTZbu7XRkhS+9bAqH9WCJW5OW2gGdgAK/o6gzDivrYkkMfH93LKkRudf5kekJYOv8qaYoHex2xHNxN3Z2nINZ7hq+lsNd1Y4XAXqqvi8/db0vpcPe8ZLh+2N36NmA3tvwaRBswd64WTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWrpOpsP; arc=pass smtp.client-ip=74.125.228.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWrpOpsP"
Received: by mail-ej2-f9.google.com with SMTP id a640c23a62f3a-c2e31c05606so76880666b.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 00:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791272922; cv=none;
        d=google.com; s=arc-20260327;
        b=qxw+NZhTeYZI5hO8PqfFcPC4Pvy7ssdPDExrN64z11nB5lKxU84J+KfqMwHwTWWIef
         VfO3G9+G+FS1udz+9Zo36xFfClfYLZaIeG+9jiQNlq9sH4x5rYwqgrpP16psw2FB4MEF
         RtDVi13Il9EP/1PY/xlN9P+qWOw5Yc3jfpWSeoAIjpoMvxZa/kNYtnUo5JrSbnYnsUEp
         TWcPf3X5a1tXnmK5ytVRrmAnmKzSwRsGV7UsEWgYKsca1qgyWeiR1AT5b8DOMRzk8hB0
         Stg/St4oCknn7x8PZqyL+WI0ejHFpnDnLXiTyPgNwUHsUJRtiL1xDDu80XEWEY9F6VOd
         cqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LIS7LQGXFKGRWwjzJfFhANm/+ELSmq9NRDYM4Ibfol0=;
        fh=jml2hlj+I5BOjPJdnt1ulefBovqj0mvivOl3h3ZyN+Q=;
        b=WWyaAXR/6X0Ob3t8QuRsPoSju6equV7/eJ/kJHOF9D3QnDPuyw057JrKuRgFpiKJji
         MMlWb8fZ8rSc+r/s2wfmM00NMJneMPCJp0aBPjXiTD/TN2oz1hPkvJJAYakuu3sMPRBn
         EVLDWaMRnzk76hFaocnQhKO37UH6WdkQ4GeztP7EsyzR8vES62hNq8uaDj5ex2waE+3f
         S0um3589ZRnWjxIohhCYPxugpBY0JhTFjooE0uuMC/t47YYMAGcIalo+sBTV/+qmNQ1R
         k/2QYOoKxU8B7qNibze5A6joobx4V/Yp8YK9FtjAn3xv/9oFU1278JlvNmrQgbUWv0H/
         YC0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272922; x=1791877722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LIS7LQGXFKGRWwjzJfFhANm/+ELSmq9NRDYM4Ibfol0=;
        b=rWrpOpsPEDFP7vvWlfOKx1M3EJJGUTHlDGxZJbg5FxKaIn0ldScJaBMNHv6NXC26Ls
         rlrx4UYaI5zPK9Hq3zPoTvbQStnOVjjsMFGfAbbOYJxdDeDlLGmad+SQHGBRcKhWvpJA
         WdUnEAfDEdY+LnCbtYg1HMsXt77Lz7YX2Si444YtVyQNAzlbsCoUx1wps5REbYqPwvmX
         lptiqL/heWUpuPbImvkQxNLqzZf/3+/2d7C3oykyeXQ2qbLWkk7Qtc7//yS6a8FPrDMq
         VUMzOlmNLGWeUPPY7f/j+QH/oUOERVkDx3JzM7ZBkOm4+Fp5lCiJwzvA4Q/wcMcXkTTk
         pZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272922; x=1791877722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIS7LQGXFKGRWwjzJfFhANm/+ELSmq9NRDYM4Ibfol0=;
        b=Kyf4QIwGzqqH/hEvw5FiIVEjSIsTUoGGFg8cLZAnCVF3lbrmajvMSSjWhhB4mmiZFL
         cdjNEKDKwdPX2wHKJAzRPJ+nbk3GDrPVEmR4PkTeF35SaVBhDRWq9JK4al06n42vlgz5
         EYxRFoqnBYvr/bzsLho6csq0tdcAUVgHHCAz/ksOvK/Vs7YWhcAJ3TybkKVapNnoOHFv
         dbUKwoKhggcnEsddp8b5DX74a2yxYcdcbpMJYWuSzcF/tTCcyMq+HW/vL/QYLCRuF5b+
         wgcKyy+2UpmQZeVBryIJOGTExC5sXVdLLKVtwCv+wb42ilheJFLmdEeKhD5LwiVGE7lh
         9Dtg==
X-Forwarded-Encrypted: i=1; AKwUvBws8zmoYYuwWhqXQnn9PVSheZIM6BsvPHWqPX3XFK8FNPYAH0/Nyjvl534LnWjGTi0etnrR9w3VHyBf@vger.kernel.org
X-Gm-Message-State: AFuF++meBRNXnvwc6KteRoVsGt5knKyILjT60n9UUO7KqgBwBcMl6mUj
	GpeOqJSenSP8SXPXN5kWBI/G349+WTslRk81CPnrFOFxsE1k/KUa8YF11esLVrt/F7Vooeu48sp
	z6X/g0Wipoof7SWRDHNhkURcSSPCbiFc=
X-Gm-Gg: AYBFou1e3yVY48mGNDLYplRSSqeNJcg7K41onBHVyjzbhDiay1PTCrg8cr7SczVKGG1
	M96XMQvhhm3W0Vov4iKzJR3xzOXMk1SWJSPgL6cQqrh7nVcZ8YnJ8QB/m1kIlDRAoKeZfL9HysP
	5wcl9tjmX4zcLSJuVW0/GD3JU7sRkL6NB/bbt7gkZa9kTaghCVEPe1pb2LpuYcbLu0CuLQzkPZg
	WtcpUre8le0Q682Qq3VrYkeMEH1FuQSPi47DolQGQaH5hF9+0/11iHgX/RM1JdjJK8Bz2UmSj8r
	uauUGF2uxfW+8N6Vw5aj6TtzpA+v7/X1KX0KhHtzBNweUwR9WHS3Jzm7bg==
X-Received: by 2002:a17:907:9405:b0:c2a:f360:1c67 with SMTP id
 a640c23a62f3a-c316a07eb4cmr65136466b.35.1791272920911; Tue, 06 Oct 2026
 00:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005225944.1171574-1-coiaprant@gmail.com> <20261006032710.GA3539706-robh@kernel.org>
In-Reply-To: <20261006032710.GA3539706-robh@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 6 Oct 2026 15:48:27 +0800
X-Gm-Features: AclHuK-_H5DMjjR501xY25PLqDQ4wPnk0DiXBT1PdwIvhQ2wQ01nPR-CgEl7PoQ
Message-ID: <CALj3r0hwkXBowh=vUbC9yPimkraMH1NJ3OmgBb0zp-z22ZFXvg@mail.gmail.com>
Subject: Re: [PATCH v11 0/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rob Herring <robh@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=BA=8C 11:27=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Oct 06, 2026 at 06:59:42AM +0800, Coia Prant wrote:
> > Changes since v10:
> >
> > - Drop the top-level "default: 1" for "rockchip,sgmii-mac-sel".
> >   dtschema injects top-level defaults into every matching node, and the
> >   injected value conflicts with the "else" branch that forbids the
> >   property on non-RK3568 variants, breaking dtbs_check on those
> >   platforms. The driver already treats an absent property as 1 (GMAC1),
> >   so behavior is unchanged.
>
> What? That's not right. 'default' has no effect on the validation.
> Please add it back. If the property doesn't apply to some variant, then
> default doesn't matter.
>
> Rob

Hi Rob,

Thanks for the correction. You're right, 'default' has no effect on
validation. I'll add it back and send a v12 right away.

Sorry for the noise.

Coia
