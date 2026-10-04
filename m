Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AC543BDC2
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115152; cv=pass; b=rlJG+jWAeyNr9zcVpcdmjvrcpsN/mMmNh7DDtPkkFeU4u8gPCH9/4f1y3HGGIEv+YYw/rSo4qnpfOopJd69tkPC1p4waHtKBuD0+qJJLOJg1UGGTQ7/6qOZhOuzkxl0NGfiMrIX5QkDe3/AWv8n7khSmWqj6GbMw7bPaWnCLO00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115152; c=relaxed/simple;
	bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLfbbR5R5WN0LKD7xSJE7PWPy0WkU9t/+lZ4eqmQF4Dz+j5E+4QrLqKfFIlbCpsLy2CALmJwYS1p53Uw8BS+vfXAvK6hQ1otC39t86r1YxZt6dHjfg2b+kqBYp7R3m9NoRiewU99uDrG6PfWl6DyNdbXCHN6EZw1u+6iY5AqPGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqMLGH3p; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqMLGH3p"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3d90ac37so692440e87.3
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 04:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791115149; cv=none;
        d=google.com; s=arc-20260327;
        b=L6Bm9BUr1IIYwOrVSvmk7tN+qRNXvuMVFpF8ev5kYHe7k5W+AzQ9/gH7t4PXYRcsW8
         HFdtGUcZRx0+sut/SE5TB9eGeRme37bFk/Jo00aqsNYbw0qUM6ciDwGzHjYas08awoM6
         KQj2b7o3+wDt1K8YWIytKkCJBT/uO7XqIR1bz3xtyqGcuyagUXW9Mk9QfxAO+7RStz30
         rt+sp7lOzFPOh9P0LGlK33thgWJKruoXYKSLDYBQb6X4gVQV9vT0Yls1uRnI5tvCIrck
         KHjd9x+3FeuxlohXh4f/xTyyPKqd8ceXZBgIJ6/EtuQrUSGuemw82rB1g2i5OL8JGy3w
         FFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
        fh=uQJNK2TeLzfAaEVfktBX5s8NxoK2aqfQqOP4wAk6bMk=;
        b=RYt9lrK2cXBK1GhwCpTMIepCPRv9RY9vSWM1/gpVD0P08s+zxzryAR9w/HWpvQ4pDW
         EfG8T2bkLoQ6BgHJ7cEWrDEvcRUtXzRFjhIfBd7JBddyWpoWXLyWNI9C+qckm9YgGNY1
         B9R8e0iAna40uZ+IuSD6IwPX81/jBNSqObbr5WMRr3zB8w6LR8k8qZLwWTmhwv5nMy+6
         P1rF2bldrjgbFmOh7TbLENcL0nh5lYvWCp4b1SEgzhusjxz/QVSHGAMXOZyFNpEZtnlD
         fDuixAS9uCeKEWlHMpee5vXjBCiD/6AL/Wa6WSgf2kHlnIL2qG5Mqx5Ezi0kBmUti9BL
         aOsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115149; x=1791719949; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
        b=VqMLGH3pwV5hY7J2/iWBbwzoGS6jiCnk7KAk6ke0Y5Pbrt6TuydcD9N4g2hrXLiZeH
         nfqcTfyvgbmZBqPRYMm1CrrLcaIfG7CkPST1xEi4FPj1oeTPUkYeJu/O5Zgm6sw7oHXO
         KF3o+/3OSdPKbPOmCaRirw+/mfU4t87U+nIUcSGRHpM/cToqQHKsl7Dkh6MsqYt89gEj
         RBMvD9gosXW83TSojA1gmJ+AUPGq2lQ4g+HWct0/fzC0fm9DXy7lE/t+n+Mq1xnDFZjr
         E0pWQZzloJ5S74WqosP0opk/LVMUy6mA9UQlPVnIIuZfghh0N4ByKelCKkoYTomRoR4/
         /ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115149; x=1791719949;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
        b=oqUZllTcgFdMC+XVIIAyAL6tFBwyd5RhxV63lHQfQm+4tLQ+ZUgbooiG9nowWfJwd9
         vpIqP0E9mr9WMW8P8bfv3iMz41c2jxF5xRw1S3B7F26Mrf9W2tuCfpp90eP9QgU5b4SU
         A/rb18sEe+gop6HdIP8bpj6v8v4He6vt8I1bkOXkNGsY7t0OcrU4dy8YJqse3GwJYinV
         gsJ7vSObtWvnsm6T9LDJzLx+uBmhvc/M4WVFH1TP4RwFvvauAC/2lqWmp/wtBRVlWk+I
         NKmV+H88uEvwsi0nuYNja6oEtlQwEwcsperHJ35dr61k3PiXuHPcBHoc4QBCERHffhY6
         Xt9g==
X-Forwarded-Encrypted: i=1; AKwUvBx3bXeMXNO5sNvB9+uuWz4awzLP0M/7FpDBYGTnqS2ZfdaUHgQI5KnVfUrvTbx7+E8Ll+qGni9da4yD@vger.kernel.org
X-Gm-Message-State: AFq9FYK8t6onHjCgdO8UA0+ZXRQ7R05lcmiWDn+nRiaqvgVsyik/qwQY
	93OmuqNw2TH424fZ/RO6YJvkr+xnvImeDLAomsOD83KTzNq/4LK7M2jKKw8oZA3JLnJVQJ5OTbG
	bakJNRjDPDW7BPel/ocOwcfQZ7pkVnMY=
X-Gm-Gg: AYBFou2SuwODQsl5G/wA9frCUay8l5E9/rH20xKdVkn+HEl2lLBTNlBRt7EUjEDKfkq
	tDAMg7EL9fWHVTnpQ+RXXS7vL1K5vcMERl2lTBk2M3KY9GPLxo67Ki1ans7GaYDp8D+58OKdzjz
	raNTHJZ55O4MwWtDly/NcV+nK2EO81iZnSJXd22Rgl4hlb/RxETh+hfXINT7U3DsGxKtxuAj8W2
	3ZyTRWDGJXaQdwSuyFBmO2ZffskYw3YE1kPouFluCtVdAhr4ghjLVdAOuIx83IL/9+GBgwSAyTX
	UZUk/CKUw5wbfrKKX5irKGQVx+OlfBg52DVfSbM23giEaXJn1CoGsk+Azg==
X-Received: by 2002:a05:6512:3c84:b0:5bc:b8d8:d766 with SMTP id
 2adb3069b0e04-5bcb8d8d985mr953656e87.16.1791115148823; Sun, 04 Oct 2026
 04:59:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-qcom-smbx-chg-state-change-v1-0-fffaef446932@gmail.com>
 <20261003-qcom-smbx-chg-state-change-v1-1-fffaef446932@gmail.com> <20261004-jovial-fancy-ammonite-f9fd1d@quoll>
In-Reply-To: <20261004-jovial-fancy-ammonite-f9fd1d@quoll>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Sun, 4 Oct 2026 08:58:31 -0300
X-Gm-Features: AclHuK8XfUMsTrUjezp37dJXnfrGVlkqDXrTvYsOblQTNjNZvnfYIKp_Sma2dwU
Message-ID: <CANxzQdE8tmPLweN+gfs4DdpFJXpL7ruiyk1cwNA41TL8NbefCQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: power: supply: qcom,pmi8998-charger: add chg-state-change
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Casey Connolly <casey.connolly@linaro.org>, Sebastian Reichel <sre@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Robin Snyders <robin@snyders.xyz>, 
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org, 
	Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 04, 2026 at 10:06:52AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Oct 03, 2026 at 04:45:21PM -0300, Fabricio Akio wrote:
> > The charger raises an interrupt when its charging state changes. Allow
>
> Each of the ones mentioned in the binding?

Yes, both. PMI8998 and PM660 have it as interrupt 1 of the charger
peripheral at 0x1000, as the downstream msm-pmi8998.dtsi and
msm-pm660.dtsi describe.
