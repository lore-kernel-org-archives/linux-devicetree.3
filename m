Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BBB29D268
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 05:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776663704; cv=pass; b=m2pwfoV4davbnyxJSk/uslNUPn0xmmQJgCpeeuLP+S+5YLvjnzl6YteTTtjAAkU95URKrtDvTudNjE5BAPkW4vIiXDG4CgC3j38A+HBxTR2G8Bj5xHFo4ioo9//3C0lLkeIABgqInGPTxYiXsMxvokMKKL2bgNEyhdZbw0Vsmtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776663704; c=relaxed/simple;
	bh=a2aJB7SMktJuHHikq4X5pad+54s5mzyrH1LXXpVJM4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VvumJzr16KD81XB36KxNOKj9DjX1+okpnqyx6dRdONTAzYIXzggnopGMFudTymBzKXOBljY2eWkvTKs4EblDB6aSxGthwcK1oRmv4hGOeLKkgBk/IqkdrZIbAwi0wG6MKTPUdCFC+2OmUEp/Q0ibzBjk3LoS+OvSAcNzltVR3jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BM7CDRUq; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BM7CDRUq"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-610aadb2d9fso817355137.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 22:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776663702; cv=none;
        d=google.com; s=arc-20240605;
        b=gyuusuFTQi2+LKVC9O5O8f9ECNghPnIaSK70vb32pInf9a2qGpZEzjOjqOAhbCnmTE
         fexHZkG9IQRHLYe8tVTOnz0zxJ6XLKwQJLjnwOPZRmtXkh5WAdgrZlYoOpoYZs99KFik
         kfkhSK5PGDf/1dH/Q8j11yec1WQgTxq7ZkDioYo/ysHX9DZdtRonQqlevRq9FbTX5zMR
         GDE7T4DVR3DUHu1Xz3PoK+Vx7x/P0dbkVT/WNJyyreO/GMr1cg1+swoXJewEieR+ZBv+
         EWz4hOzbXVX+jsZiSgwFJjL6kFU3NivN5mT73RC0MA7Oct/gu2QnXN32TCHBWz0ISZAo
         gZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CN0rXWBmzkEFgIqLEHhOXPBNQ+jcsnyYPEtLHAwW1Bs=;
        fh=CQnMn+irXCZW5M5+dUBfQ5/PNsIBdnV+qlAAkHhRbN0=;
        b=N4HL13jcm2dGwwd5ISQx5X/8E/Nn5dvLfW5BVawlxb5ZhsnuKr5lHo4oeZryVa1cNw
         3L2NT2IOqXQIIJIfzkWHcXQCulNSREh+pxhorkCjaGYIjfqUIUtBq60NUrPi437YKeip
         CgK5bJVIIgqvd/PYmb2SfFL2f/P045cec0SCkeNp5XGiGJv4ws2w94jqaYGG9aBo96jk
         2heJmBxGGB1HV6zyfokALcn1OcMukSHXsKZ7FHFOaTumPWus0ad5xuqZmdEVRjNdz9i4
         4Lfc2IXf7fF3RD1LjkSEYktJGCbc28VEwBflRfQpsIP/YIzltL8iKlB8ZDPQQkvUSm2R
         8Arg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776663702; x=1777268502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN0rXWBmzkEFgIqLEHhOXPBNQ+jcsnyYPEtLHAwW1Bs=;
        b=BM7CDRUqU+JuH7Ws/C0O8T1Z1i9wSAGTd4LsxKYXCIZwCkxQ6XgSGu9Ecbo0Xl2jcZ
         qi8bUUywCnopeoTzqrvVhLxztRVvq4k2W/jCFptdrV9hXXWIQOa6IFUvouyXaYHC1GG5
         2jX/4/duWBjeDCoLoxOJumdPStz4kmTKbm4BB/54kTeB5/hlEGQS5PEK0CqizC75D3Yd
         ajP5MHQDQtRHLApIzUoTmZvJVidNaY/vtse9HNDh6fTxa/Z44jA0iW+w9r5/ncoQsoTI
         2QXR7YAMnUyLvB/dejhXPNkm5hnUqP44bYFtY7A6GOSkd32UscZsjI+hrYK0X7zrrIYm
         S1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776663702; x=1777268502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CN0rXWBmzkEFgIqLEHhOXPBNQ+jcsnyYPEtLHAwW1Bs=;
        b=lbq7m+ekuAYPwiDSGt+4aBzDFA1/Ct8QE4x8m3hVDFvKYMYQBiSZmAfY5MHhuUvEo7
         EeZIVMO2sk48w3YX4FRikALfJvJNJRN5NAuMYeJyoSU5wnjcrx3cA+vf6N2wnA9zHxQe
         MzXPqGiEaMEbGct1AwrpNUCA2CwCK7N5ygJFt8xdTi+xF8hjFpevHBmTA5lGAP+7TVXC
         jFs9h0A2+ERw2tCuZ1rPlrweCS5iv0H/liUYlsM/4cnwKZKiEUQqsBZBsRJKwb8hlhOK
         EbidTVAM+ni+/3QZJm0oVlV5kRhH5PTdzhel+1EpB9k7LLRhuTfR1kYBiZaSKWUzq85e
         BgJA==
X-Forwarded-Encrypted: i=1; AFNElJ+9dc/NvA1mHc7+UUtDLY87naFXKhGdsZufeJnPddl6uEaE8RxjgZoBelSa2uP/R75Msj/hUW/HALqV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2AgjFG4LpY410pB7RMye1ryp2vWUUIYNa821Z2LJqt6A6PCbe
	ooO7P3DHnbG6vcJavBj19/hCd5Fmk/X4Xdg555YOVIgkuNQyGhVhhUyzeaOekGObmMDsRUV9jDl
	5gh+DcqX6IRtUod+Hw8SbL4pizmbLiMs=
X-Gm-Gg: AeBDiet+3j+99761S5ko7Pef5LpMqJv4fG8598+w08+ZYssir5WfbL430Xz5E0l4Q8L
	MFNbKSEkx/Z0mHtYHvsqVnJe2N/+O4yumXPx744DRenYtOvU7zpbWX6+qMxA4sAWknkjL4kLCQX
	2kBFbYTUKBz9gOeGxziLegop+tBQIcAi+Gpv1S6nG7QPi5Za/hKfD0dtx9QVCiCdXToqxiBGMlv
	tli4LSEaOjC3abn5m6F3TO4NKZvmn5oN3pCPitYUBXPkp4F+EdjB8MI/ES7oAa6lJxMR+3Axz2Y
	xwsAiP6VMuCPdpXVkFkogbTEWn8=
X-Received: by 2002:a05:6102:1591:b0:607:9443:b2ee with SMTP id
 ada2fe7eead31-616f73ff3e9mr4135707137.15.1776663702601; Sun, 19 Apr 2026
 22:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
 <20260409-anacapa-devlop-phase-devicetree-v2-1-68f328671653@gmail.com> <20260409-foster-stability-f77b38c6f7a0@spud>
In-Reply-To: <20260409-foster-stability-f77b38c6f7a0@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 20 Apr 2026 13:41:30 +0800
X-Gm-Features: AQROBzCiKd51EWmBsMq2VuVFATQ6pDOW-cn9wWzru-4S9PgURyPGAf8ahBr1njk
Message-ID: <CAPBH0A_K39218+=QHJuEY+SbFk-nCnM=Z8RQMdHBK7SkCj2QtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 board
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=889=E6=97=A5=
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:36=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Apr 09, 2026 at 07:40:26PM +0800, Colin Huang wrote:
> > Document Anacapa BMC EVT1 and EVT2 compatibles.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Hi
  Could anyone let me know, what is my next step which I need to do?
  I can't find the changed in for-next branch of
https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git .
  Thanks.

Regard,
Colin Huang
