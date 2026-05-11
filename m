Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A9B3A7825
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485939; cv=pass; b=OA/viQ8ectWU8a/+IIoKEgnCvq3vq2NNo1Koxm9djIsdRMQDy2o8c/dDCbRRwjEif2EVoYMo3kNyoLSpcuGKOpqadR4OUryzbQ0cv1uPzSyflKwd0E92ZQC+ikh7HGnixyPJJoRl9H5AGyQU+XMxso0XZuksHeBheIyfVfuBcjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485939; c=relaxed/simple;
	bh=gZ8uSKeyXSL7MsPeYFybFKjoeB8keoIiq7+A1hmdnEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKKX9dKgzgGHpsooxE+ikFUolxVFcJh/KE38oWxff1UgpWr7SFCDZ5FxQBnYR7GMdK42S9/kDHRnGzNe0tKvBrJwVeGVBpRf2X+D0PN/kOXyRw7z24cPhtP58+sNpWU2xlcNGPqdYTJdoe1xuvVkY/ljXsoAszqqr+l0PM/iQJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKZeldFj; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKZeldFj"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f0ad52830cso5757035eec.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778485930; cv=none;
        d=google.com; s=arc-20240605;
        b=NS4x9651Fya9CXMYhiEpwFUNRolayiXqymij4Uq2pJIxuXm8RLvVjpF+XHwzyl3D/M
         AZ0dh9mwnrwaBLvu09hrXfJCpiutmG/AM0pmvbh0zUno4obUKxuuw2WcJnl7sWUKMmwf
         U4uJScL14ULeQpH0inHRKdw8NdUmprHxAJ78/Mo9IckfNYuCnnTO/84jQQCsmaYUSPPG
         HwTRYZlInuRoe39lKyAkwKNISrPUzaMWQ06c3mpC0aVagAHoAySPFKRS+Fu7prKmU6Fs
         /dt+hyYo7V4/f8Q4cZqGFFW8tZEqmleZmkvhw0tg8E/IdqLEU2sxZGZoNsDA6+TPsa0u
         HMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SHic2oJH49jsGKC2elmibl6ONEIbwrHFjQoTaB+s6YI=;
        fh=MIIjKpfBEZwWPv16oI7u0/9951h5hOfDd2WN5Rc6we4=;
        b=f+vJstHuZuWxzipmufE6JrXFgWE3e+3x/99jzQxMyIf7YNgPJfj+X0if6KOFoLfpUJ
         LfK2FYm73XGFXriq1Kv7FXMamrGWdqvJrxIKwzoY1WZpns73xfJjmiJuJJ6T3Xpas/vP
         pjzIJfNdMZ0AfSj9HTozBCUc09429LUvChdDNGKoxklaOy1k4P3zF82Zub2A1+CAlx8u
         U8r+/mnIDXQdj/iJ8F8WX8QcvJrrjLqFcmjTLxc7V4adtbeQxzVmNes0oAKAMQQFVeBH
         pk+AqAa5MyFQDDOzEud5iynhFP26vhzxFrcu7nZW851kZ1S16AgO8egKijg7JEFOub4t
         w/5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485930; x=1779090730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHic2oJH49jsGKC2elmibl6ONEIbwrHFjQoTaB+s6YI=;
        b=BKZeldFj5AL3LkO0kPB+j+l52ccnMSznlh3uUo+Z9oy7IkuTjHUc8SqQU/dr9KqWkM
         aBFtTls83gU2/53pIutv45cVyxSz+vkHrgVZCXnorXu/xGIydkUgsGXiBqVxd/IOZDu2
         frNrixS9jux2JAwA3lNpjQf9ooF/gz8MdV51qeFRt0Df/LrxFmFY7b/lKmE/N8BoE4Qu
         aOYkkrKNwncpiQlZhfgRgNj+p1U8ppAXWjaX/HRBs8FwmljftTcOnhVJrRgVIEqPTo45
         X1cL2F6oD6bYA4XnXqSdPTECSDUokCAArKmlFgSl3yUDinoeRhLy/U62xaLMTZcDsytF
         BkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485930; x=1779090730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SHic2oJH49jsGKC2elmibl6ONEIbwrHFjQoTaB+s6YI=;
        b=DDwqzzE+YEg8KUu/Yysonzm8IXbIMzfEnA5+Y2p6kD7bn9dpjGaQdtgiDygMIGfj6G
         C5TxsN8m2WKZjlb6kaMOtZIcoVDmD/iT/uiSij8elUrPPPLDJ3PES01RklPj6/RYzCRA
         ev9w/ZQyUfDZ1/TMT69UrH9X13nIW7yq0wD8/zBYHlH2P3dImga3V6Jyce28c2SWtWav
         tMt3d9xxnmLeKWHZpOu81VuWdzICksSfUVguFg17SAWU7f099e6Wrgfn71WLo1q+6osK
         fG9/Q6f8F4PsbYidRz/LNZvnVMN9meIlEWIjd5GC6EwqSUcYqJBBu5TxGhXVopE/dQaB
         jRzQ==
X-Gm-Message-State: AOJu0YywvnpW11ZwytlJR7utsOCOibu76F8nzeMMY0Pzzh+Hty9UGXjN
	QLLQzBfNSFHIZTs3qCdu7by8MW11KcEzB0aK+MHUO1EWYoyzr2bLYnWBIbzJOoQRYwbSFI8o6a/
	I1E9Y2uC5HCQs/+xM/HjzNxj5Gb17laU=
X-Gm-Gg: Acq92OF0EnckqZJ0iHRYT9PKNi/qJSoJ1TB2WrQ1AUDiqQqW0Brxq7IYd0DlkJIsuxK
	Bny0pxJEu5TIX4crI3da8SPHHWwQFEjwUGNZ+5h1p3pEO3S9qYmvpXQsCZcvQf29C0ftofgndci
	PkcA6mvCvcInyG4ZcpcUWzqR7+JJ3bkKVOQxlEn0c2jdltKXsA0u3bY29P72Rar5PKyptNxmMFE
	4cfipnMYE2puAkWIeN4XE6Y5h3W41lKedVQPfEZFg9Pxv/Lkg6hkhhYWkZGODv24rhGqOrDtkDe
	MV8GHsUR
X-Received: by 2002:a05:7301:4601:b0:2fc:9aa8:83da with SMTP id
 5a478bee46e88-2fc9aa88c76mr1869973eec.29.1778485929756; Mon, 11 May 2026
 00:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511074752.24745-1-clamor95@gmail.com> <20260511074752.24745-5-clamor95@gmail.com>
In-Reply-To: <20260511074752.24745-5-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 11 May 2026 10:51:58 +0300
X-Gm-Features: AVHnY4IivgDDcg6H6JpbYVndDKJmB-ke1DQdhmpnseZc-qoh0dGzWT-RrSUld4w
Message-ID: <CAPVz0n3nFT4RfgzfL0rVi0ZxB8O-Q0v8Syf3Gu+OHSv_y5YXQQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:4=
8 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Tegra20/Tegra30 are fully compatible with existing tegra DSI driver apart
> clock configuration and MIPI calibration which are addressed by this patc=
h.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c |  2 ++
>  drivers/gpu/drm/tegra/dsi.c | 69 ++++++++++++++++++++++---------------
>  drivers/gpu/drm/tegra/dsi.h | 10 ++++++
>  3 files changed, 54 insertions(+), 27 deletions(-)
>

Please ignore this. This patch was send by mistake. Sorry for inconvenience=
.
