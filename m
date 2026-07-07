Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7ED367B9E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452397; cv=pass; b=JzCu9Ut/Vpqe8kTGHfrrREMGAhHWZSuVJOVpn9pT8AtbgjiTsk6qkA3Z5tDNBDwLkE20Ni6mJV3YJpv6+4WtmWMwaatlVneaXOL/MtI/9SQ3LXbQbSzuE0NhAmduH1F5OgljWOcxAhkdpqS9V9tQMyRUnVLNtLIdBJmIr7BSOKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452397; c=relaxed/simple;
	bh=qms9FBXHfXM9lTUAjaJC2T+LCme+UWJQoa3riyCZ/6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZMMoKSAr2Z58sVFF67RaPR1SRZtX2q64P4al+X5eHJYUnHaiVrYm4HBEqlxbXMbLHS6bnD8VkimG00tVChDkJHBdefRK+tSDaXMuZeL5Gjit6T3Fz791RFk6gXsTixFj2mHSZSc9yQ34bPo4o+fO2X3iNi/b25GwCjeYWZISMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=dsRf47Yn; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dsRf47Yn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ca70925c25so58782835ad.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452396; cv=none;
        d=google.com; s=arc-20260327;
        b=TebIcdLN8+hEFHF7evz+qx9CZyt5acj3N7kqvnwaepzVC+Nj5khN2qkSRW2z00lh2H
         SsGFjDlC5q70M8krgXoiYV0ECh/mBIh9gmUOy/wQgQKFyZ/ZrsAaspy2ba9FKyBy42Kx
         Ev35SJMQCFLtrFbzhWBJNrYRwj/geFrb4vwypzez6bB4XCOm0KIsOsG18Z+/LE16hk1g
         pcl+fNr2GnjLr994JhdE8uxPRQKlgEGWO38SQ78b6f2aUeBeYAMcuxXMgmkFKxpxfXqr
         FnbjI7T9KTQuUi6QGbH9ILLSfcJSIPHJr+uEluC19we6MelzHtccYj23SAIm+iZdN98P
         hNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1u0DNx/dvFBXj7ONBaHCpq/y26kmxzUXBBihnDFYivE=;
        fh=VGqsV/sAYxIG9PdrsarChwH0CBkYRifgjsVifFM9KDk=;
        b=ay0o2ILFvkX3t2lDb7iCcn+Ae8hv3/bK1SuaZDXdF/f5kRCc1uRAOqzHEWlnd2yCTt
         xWkfOXbKixNEKXG6YpA5x5pO8feLmD1S84NzUFK1EAZQybCgcHmzIL8C6kGohH+1CL/x
         l6/HBMB9sDumFLaHs0ZrmAjohvKKBjZo2f73X5f2il/cN+BQJudZ8x42FSsW5pDKwRfM
         ZI6o3TZSxD88LcQ2eneGEzNryNson0rQdu+KQM0RGEEty1SHCpO1ZkQZ2I90w1oTB7q2
         1I0nRYQ/y8T3801ejvyORoIfMWivgIYUdl+z67YFhuQZdJ0xM1yIIvsQBpce1iBi4350
         nzbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783452396; x=1784057196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1u0DNx/dvFBXj7ONBaHCpq/y26kmxzUXBBihnDFYivE=;
        b=dsRf47YnGABi0HuLBvyYYzfuKS8VENvWfXvYp7H3iQGMUN+zihWIDq0LYrQat/QICN
         NWSGBiNcIlkiDjEih9XGBkX4Lk2BRGfvAzECptDRfE3c5X7MWqs06mW8WgK47XstHFxG
         HiZQr382l1NL2lU8WS+A6mZ9T3S+jP8mN01hVPSx6hMMhZ1I0Xw3kq1e2hnjRnis5vVT
         GwB+iS/2oLPcItBrum22YcIFKoE+cXUFXyVYPzMn7yF6JGQDOQ631FxSY/RCWs4lPTgN
         slL7O2J/NmcuoZYKC8pCvd8CKp9NOeUAIusFBjaOR79dOyHP86gziv8k5loonN8te5z0
         OYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452396; x=1784057196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u0DNx/dvFBXj7ONBaHCpq/y26kmxzUXBBihnDFYivE=;
        b=nHxWl7sASFEvHeaVVcznN9TWVYXDti3AoG4qDMM/SFAHubx64JHZiUgXgSL0GOz7sj
         /Hd5+IF5pgV5i1EgcPHSLPSVWJY528S1BIcZaKJSP0U/vzlme3ij/iFygNDqt3BBLUp1
         eRExOr2gLi4U3CQTbH3qiH5GLTxe0nx8i8xBCaCdkuhfclzEbLSnycd+q3tf5Jmj8BhT
         oB5rCkxnlJ6SvU0cxwsXTLxkyGiZ26/ar0+hEl6ve9nqUxViD5CyIFKWDwzgeTZWNXzL
         16vrtynlvsqMYH1/Miqc6zHQ5LRUFRBmK71RXGDwZmy7HcFr2Guwjtx+uzKynK3ORquT
         vwEg==
X-Forwarded-Encrypted: i=1; AHgh+RpYq6L4+7s57FAhIHpXCRBiLgMDMfMAqbOZloQDWUFUGCyrPBN655h/nHxu0QGXu3FA+CTYQbUeZdOP@vger.kernel.org
X-Gm-Message-State: AOJu0YwR8aDFaN9y32BkZqSxo0WWW2ZYH3ci/vwdHiJgRLp3pkn3HhIm
	PPT7tucXgg0Uuho/HgoZNXtn/qUcQaDnlB12Hf7JC6p2u7bzcR6nC6IKtZRIzAxHAYwzqc1m64/
	1UtUuAFi1vIWc/iDPzr+3/29tn9R2YZA=
X-Gm-Gg: AfdE7cmHHatSgmZpnhZqeDy/e3T70kv3PWQBOWhJGRPMfIgY/buHU83o48SBx038KJc
	imjF3p1YyS2SO4gecUy2UAjeEv+iFvdKmPWMl5THtNc4FSHN6TtG6qZ2XzbEXbw49sXho7WME6U
	KEg76SYrnAoJG7dmN3Orm0mWAz/fxA0UM9YjRuShuUKS8HHaUE1qL2PxNtXLehu31pT1jF8pw8G
	7bbqQoEPobAz1uTIe+qFhm2/MUC77/Wm0jpIyYUvu5Gcp2KWnLfOddytA4lnyLfVEpt4rAeTQfn
	0gm8QvorlVH6nOm+QnEnijHjhg==
X-Received: by 2002:a17:903:248c:b0:2ca:11af:5ee9 with SMTP id
 d9443c01a7336-2ccbf0515c7mr44657295ad.25.1783452395771; Tue, 07 Jul 2026
 12:26:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:26:24 +0200
X-Gm-Features: AVVi8Cew5STZTOkHk0OKqMhqBm-tS-RzEUyhCNysxzBbiVbMzJ57Y2V-AnBf18k
Message-ID: <CAFBinCABGgQtsn1MsbQn_wjuCAUTaTaEhbGbwNjKeJRx-NDcZw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: Correct indentation and whitespace
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 11:35=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Correct spaces or mix of tabs+spaces into proper tab-indented lines and
> remove other whitespace violations.  No functional impact (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
