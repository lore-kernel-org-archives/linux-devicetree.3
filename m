Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53E53438B2
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787694762; cv=pass; b=KgYTStGbIBa+8qWdkYhI7sJ38+FPXxuixbeJyP11lKof7CvXsAuxqir2emzyuqn7EvONyCA79+Z+3p/mtJQfz9lbusBcrmHq/O4ui/4SaWnEORJv030xkCFr7i/NIVqBWtZ61EmdAa4QyFjzAOTvROQsbp0MHCFNcvhELjRS63U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787694762; c=relaxed/simple;
	bh=cPWc7FkLme0xcnC1K2Lqk1CfpMV/JmaYPU5OWvErWdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSHHK2d375NsEHDNPjN5/+3j0xELSK6uK700TU+nEc/ipAfqgQcNvkcIvfEHDwdbHNlID6VrpLMpp+sHRyS8JNVKgD6T/DlJYwEd8xF1Had8p9jaqenB4XvXsVb71pvQAb+p6P+goJ9ngPSIMNMayWjMwUTZGjwElF9PkZKLEvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smG6iQ9i; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smG6iQ9i"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b29599b81cso245944e87.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787694759; cv=none;
        d=google.com; s=arc-20260327;
        b=PNovqAqTnT4UB+pIXboKf7jOOhoTSpA4SGoC7vmilWmFNKzJ87esFtlcXNIJOHoRak
         fXvzkAbIS21NrN/PTdezsXH8BIXyPevdplA8vB3dqPwWQDf57KsKws0kkFimcb7yQ5ly
         jQhCffBK0GuWgM83tjk6+TX2ip3801r6JD+xhe+dCAP0IJLDhfHEV3JXeD55c8597Y1V
         /5WSVtNPHbyWwHO0Z45LL1VhcPyC9/tWKUZoU18LmXPMJximeHkBNwZ5tCmUWYL/JSpu
         6FP1xTpstUe5Das6n53Wzo0pGdtoE5Zob172eHWSUwh9mAaoS7Uc43DN+31T1cQqxz5q
         CCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cPWc7FkLme0xcnC1K2Lqk1CfpMV/JmaYPU5OWvErWdw=;
        fh=RgEykFzgTGsqtrNaPbtDTloUieDMRMoYo7dU1pXfZqM=;
        b=DtnbhhIGTJHj9kcfG2GtsT1lLCfEf9lwVTKOpFY0Ct+sGJlpzPxGYG9lU0rzocYLVF
         F/XmdPo84R5YZpiTlexg6hlzaGymJ1qhI7FSJIaC6cecZ6EfwClwSg+ChnoaCeurfW67
         nzqJjRTq6Sm8oX7aMcEb4oUo9V/SREdSMlpgypH08IYzbpmEAF7hLzfnhEEnsZxBctqq
         5EN648vE+JigV9OKXqKPTdvkebmjekzpES4NNxIyqadQDmtS3FlMjmuTVo5BLY53QbC4
         W0kj8DyMWlUxyTkMZeP3nOzI0hO0ZIVZyGCTaXkbI3Rm/pcd2hxWY6R/RhcVUhIYsbNr
         1k/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787694759; x=1788299559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cPWc7FkLme0xcnC1K2Lqk1CfpMV/JmaYPU5OWvErWdw=;
        b=smG6iQ9iQ/QObe4oukqjFoVXQwtGmr6U5gfvpsnvLwcKMu+HpdGEv50Ey4KcdBvQjn
         ENVZZjR8UHeqxwr4jhGtlCiNWH2nZD/6K+r5D6xUZPht8Bc6uNDouZV8UaMp42J5BI/6
         vgRz26PPRPOvAhAlLzM75CQEFkHU6CoDMhrcf3xP/Ipne4orT4dSC39KnJYJy2uGlt+6
         vGckww5wNnvpXfkSaswNczom/fG997rf7zSsaeYnRv+8SidnOflsBHOij4rQ7z3v9sjo
         YmPSctYoN7fOuw7nG+IjHEPDeiRfIN0V+K6yRGTMn/k7iL/l3PNDi5VmXe4q+Ueky6p9
         Z8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787694759; x=1788299559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPWc7FkLme0xcnC1K2Lqk1CfpMV/JmaYPU5OWvErWdw=;
        b=RLj/wG+XJV2H3fE80FzUaAfhQlN5rHGJZNw9hBnPAeUT9NoLRkxJYT1aR73MXeNBZN
         UiieDlsHSBnQSifwQJ+2Euk6YbpsmMgnO5bDljCD6RsI5sfjOcCRZlKNq2Oau3UVM95s
         llfz1eaB8KaYCOpxWeUDNc65Ku7rEuCQX3Layk4VSCCW+au2WQCQbkacHx1+NNpvwriG
         o6KrQycOeV7EWGwZ/2DL4KxBO+EG2egdZ+NjTp/yWAJ96ctbNC9PU8NacaBu7D5FS2ju
         f64BS1hPKqaZq0XxvCfVjjqO8c4DzJQWHwWGEdQcaUXvXk7xaC+qDwKkm3551rd5DJKt
         EjfA==
X-Forwarded-Encrypted: i=1; AHgh+RqnF3SsjRJkbjVwuK6zNDUxoVI9jyILHxDULmwtYTxfu2V7dwek1DLmR5qgEucLmtKrtS7FLDfmjj+t@vger.kernel.org
X-Gm-Message-State: AFuF++msOft9b6WW7p4QYpggGw5X+i5NeN5MJYymMOhpBtFOd8qO5+Ox
	1CTPDD/BCA4FEKoPQZMxEAOEAgPhMy2yxGi6PI9TY9zK/9w68ssixe+tMTgNixB90xL+zuadMqQ
	CS1s1OEpjJk8MyWBAuRQILFZoxJQkYtz/mTMr
X-Gm-Gg: AR+sD12qjO/Kr+z1mpk+HdpkgqEfccqLgAFP3u37IXQfnNaIQb6FtDN0uYZK6V2LSos
	G4PpqGWLdpxZPE3mkMLpGj455fVKmbmyRbXpOEaNeg9Geha9FfJDMOVSThEyfG9qm8oDRtgg2kK
	39x4ysyYdXRJEreCoiUu790EPzM0C5lt6lygXUkFhFSnVkJ2hQm4czhzy72ASmMuzj3pNAMz8/1
	jvkv49RmXMMxZL76TeWt3N1EMHIlcdZRGzFDEQyF1sZQx/dmnTyCwRySKHpOoOCRJI+sQqln7V8
	SirmnyKtvD8dkes4Wxtzd8x8Fl89Uu4IQDyhaeOaaCO68adAlElFyWEYrDntUPF1hLWF3RtmY2Z
	jIxfarZ4QCbTgtiq2hgbjB/FvCrowHidBgQ==
X-Received: by 2002:a05:6512:145b:10b0:5ae:b260:cf47 with SMTP id
 2adb3069b0e04-5b4a900f79cmr285294e87.10.1787694758497; Tue, 25 Aug 2026
 14:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com> <20260825120812.2152-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20260825120812.2152-3-laurentiumihalcea111@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 25 Aug 2026 18:52:26 -0300
X-Gm-Features: AcwNN1VZbn_T3F-FXzxO3As2xrvYIwwIKPf7ufPYVHOZJ70yk20HjiCElkvOxsw
Message-ID: <CAOMZO5B7Cn_qRq=_9ALXHx9svU8WQZbaaL_jXJorhux1L-JoPA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board support
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, elena.popa@nxp.com, cosmin.stoica@nxp.com, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,

On Tue, Aug 25, 2026 at 9:11=E2=80=AFAM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
> following hardware feats (list is not exhaustive):
>
> * based on i.MX95 19x19 SoC
> * 64GB eMMC
> * up to 16GB of LPDDR5 memory
> * 1 x USB 2.0 TypeC
> * 1 x USB 3.0 TypeC
> * 1 x RJ45 port with RTL8211 PHY
>
> The support targets revision B of the board.

Please add the bootph- properties as well.

Elena plans to support this board in U-Boot where they are needed.

For reference, here is a commit that adds the bootph- properties to
the frdm board:
https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/commit/?=
h=3Dimx/dt64-intend&id=3D50c0d934698f7602d579ba21262fcca3643c5464
