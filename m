Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3AD3254B3
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472348; cv=none; b=mxWWE7c8k7iZTok2+V7KfE9zY41aumHsbWP6GObUA1GOzaIHgYLdDIXvHHAYBNZvmS/zlWfSFv8nCQ49RE8KJK9Pp7X5vga4YCJdhAQwUM2O8M3PBWFGrIpjqWZh/DMXZPQOsypwaVmXJmcyL6Jc1olZLlJXmcXARS8qbt/S4w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472348; c=relaxed/simple;
	bh=l2VwwdY0f8fP42No1Lq6QNkjHif6XCCH1yOub02MhsU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=htnS1JrK5e8wKrULNnIzqyr8jk8rI87vNJPWXH4pD29YgEmuq9iOjBjxfNWau/huGL2K5CNJ2EwtsSClp4Scv9za8DmBhQrgx4GahzjRPH2rWqidPGdcrADfWR2aerasTwOoT36YFCzV5a/4agq7/166HMkC77/94V+Y6Kdy7xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BgMYJjnH; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BgMYJjnH"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b9360e9f43bso1339028466b.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777472343; x=1778077143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l2VwwdY0f8fP42No1Lq6QNkjHif6XCCH1yOub02MhsU=;
        b=BgMYJjnHhACZTFQq6a0keIEJ/Rp1m0mim0Oh4+/vFLOfxASvU/F3jea4EbQ0UpEtym
         j4VoOJfWGmy85TWQnBdC0oW8Po06bkLA2gN9XdmCnmb7vmyD5LklMv4b2WsnpFj4AaBT
         tLHszQXucta/KlKcL/Mcoj1JspzdgGXYunVRzGA/InxZbNqv6QLkyX5cJd84WKLGlowP
         56gIy3+CKzV5RTkrPdx/rGCigoNXHQMJYVKfd/TiVt9GnqgZv6QJSnwKUYeDoRY6wSlW
         7fnJAJ2K82u+Ph3FUm2N51ycoHlXXQ9LGx8DnMaX3og3tAWG1sV8bIGt3hAk9b8K+6eu
         H42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472343; x=1778077143;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2VwwdY0f8fP42No1Lq6QNkjHif6XCCH1yOub02MhsU=;
        b=G8t/XgJ+Ipg858uPbdHkxEheTKFj4TrRMvIu0d3IXYmzDtqXVQXxzb3BDJcXXUPQFe
         vf0sTQT5JlugyQ//18H4VbCAJgvZaIHE4ZYTmCW9KofNl38gbhsRY7NUAoRcwhqdQu/z
         4IIsgBnNBuIneXsPSaiLHOJe6WGpkQhsvY+FWtsjQb/aThujcSj7STn6OLZOnX6eiXja
         dO2Gdydevu4m0hIZzVILKP64F1STH1brAfeBm4W9M0soKNsbcso27vFyJqh8geo0JLgW
         LmVzQvoVrES8THujr7172HRikkZx94gjVoI8ybYTKmki2bMM34gPCA1+itw8h2DfdRwn
         c7/g==
X-Forwarded-Encrypted: i=1; AFNElJ8n+eV1kGvQkBpXNznE1RXLDh6cUAYe6HVu+LhOkFgpzh0XClV3AqkgA0tirMN/XMt3d/KceGU6ast3@vger.kernel.org
X-Gm-Message-State: AOJu0YwjNxn2zq1SlqPlUB2drEUeQeahI9qUHjYbyLvNuWefTaYxoA0B
	7SIFWNZSribykQYBrq74RUEm1dxvJprAXtx8eGMJz8UY7qMcc6Knk+BYP+ais2uKI2kOFG+ICNh
	gydnZokYM7U23Cw==
X-Received: from ejchj1.prod.google.com ([2002:a17:906:9fc1:b0:ba2:62ad:29f7])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e1e:b0:ba0:d58b:6045 with SMTP id a640c23a62f3a-bb803778202mr518587266b.27.1777472342464;
 Wed, 29 Apr 2026 07:19:02 -0700 (PDT)
Date: Wed, 29 Apr 2026 14:18:11 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260429141815.827157-1-smostafa@google.com>
Subject: Support for Lenovo IdeaCentre Mini X (Purwa)
From: Mostafa Saleh <smostafa@google.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I see that recently the support for =E2=80=9CLenovo IdeaCentre Mini X=E2=80=
=9D was
added [1]
However, unfortunately that doesn=E2=80=99t work for my device, the board
resets once I try to boot the kernel from UEFI.

I believe that=E2=80=99s because it is another variant, as I have been usin=
g
my device tree for some time[2] which is hacked based on the crd
device tree with some trial and error. With that I can boot with
PCI/NVME/Ethernet and USB (there are also some other errors in the
log related PMIC), this device tree is based on purwa.dtsi unlike
the upstream one which use hamoa.dtsi.

Are there any plans to support the Purwa based variant? I am happy to
help with testing, but I can=E2=80=99t confidently send patches as my devic=
e
tree is based on trial and error rather than a data sheet.

[1] https://lore.kernel.org/all/20260401-ideacentre-v2-0-5745fe2c764e@oss.q=
ualcomm.com/
[2] https://github.com/misaleh/linux/blob/lenovo/arch/arm64/boot/dts/qcom/x=
1p42100-lenovo-ideacentre-x-gen10.dts

Thanks,
Mostafa

