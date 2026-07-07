Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0A43A7D6E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453101; cv=pass; b=lsTifk0xcFHo20w1P/mnEmq2aY2qSmPbgFkziJeXXoxMrBemBJKpDpqwBYOMIHt3NYPYpuSf2sBpC33iUMWGdH72G/KXCTMMXwOrEXPdHbFxLAOt5w89Ac2avh6Soe8MRlkVDqwE47HQTQeqSIwTlmrbaZrBTvDMjR3ToZYgETU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453101; c=relaxed/simple;
	bh=lBRpzxPz7KT5GWPoD8g2gj9X1WfqI1g484XKzOSeIjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GS9gS6r+FQCmHBjqnm2uVqGDiwZuCgtBlcDHcJZDyZ6r6UN8ztP1S5LlqhposshnfJVcSz9wbCY+DuWyQ5NvjoMz8vN8vucOYWlAQ8nFETcOsGL7XvL7ri/fFJML1fEYOgTaB8lxMS+e8Dl4bmKADobbqXJeJ0HnE/nCs8XdJIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=e/hneSZ/; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="e/hneSZ/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2366387a91.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453100; cv=none;
        d=google.com; s=arc-20260327;
        b=nDxeaBR7PGmZupWLnohx/1kzgR9qgKfLEezvZ7nb/CLteTn8G2L4q6s/eZDaSTHIQd
         xsY2C/56Z47aK73GGhqMkES16vdMoPRDZrGNkwYJliKaBNn0idHJAU5OhFAlxCmXleFd
         C+dpR0PTRYQtYkrtdpnFInsTp2Ki31uYcYg5cl6xEu8IVr/2sQxAdrLQDDE/l85yMY4w
         Em0hWko7y9IJF2UTa5u3oXokk7iDyvnF1WaFVLKWtbN9FJFflGaU/aeSyXRAnnHaMNtU
         OcEd1oR86FpIexwCxXhC0FGSpbe7j0MINRxB+rHR+jHH9/XxG0VLedhYBlmZWMgdf8v3
         bfsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lBRpzxPz7KT5GWPoD8g2gj9X1WfqI1g484XKzOSeIjY=;
        fh=nw5YXUrhpeAyacr5CcmET8aqe7PlLxXvRv9OPwY3akA=;
        b=H3vI1B4l1S6guz1oTIzNwGXLIMSRNRGIIuVGhXBKUMVbY1BkUFpnBffuuwE/crGTbi
         tH0jqwCckily91urecqPec9C7fzrlTcqUdTF92dgR1FV96r3aiVMbIArK3ZxHpJa+CyI
         lEd1o0Ok4d3qqcBbFtewj/So7qeuVko5CSq3HPje31gaJxJtyO/1uf8u3iH79P69iH2r
         3acRYCbrkHxAUQjx7Hr8vxKrdWav2HjO/yUgsejNyTXAtZ4TsJZRJ2Lm32ny1qz26kxg
         fN+5tpuNBL7j5h/kBml8bS/HhtmK9DOMC0mRd/AlOd/n0ORZHo4+4oPGLgQ+wtkZeKGK
         Nr2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453100; x=1784057900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBRpzxPz7KT5GWPoD8g2gj9X1WfqI1g484XKzOSeIjY=;
        b=e/hneSZ/AYCUjPSbJ8vBtT+YnNghYmpRbC/wwN6MGWYK7WNoE0l6k4Di7uTDxf/Wgc
         HJ6pwzZ6algvRrPpE/l0qbIJXuIfXvgoam0J4lLhuSqk4i4Uzfp3QlG1j4Y1RP8wro42
         uMBJoUCT3pA2v9th2VCLy+BJ+uz5jIb2oeTKsyQPtPPGR3Y98MeCVIY/Q4FcaAVTEih4
         gtf9VUut40tjW3kxyz0HQ6r1ku+w41ReCkBlnLcPQBMulmznnT57WzcsvHTLskUCQF8Z
         VVIeEZc3ZE8Va4i/zCnoET7afzReOBT7cXozU/XobKnp0ahVqis8e/NY4Ul7XD6YrHHB
         YAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453100; x=1784057900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lBRpzxPz7KT5GWPoD8g2gj9X1WfqI1g484XKzOSeIjY=;
        b=Q1jhadPM14GW7SwE78wAQhEOH5x/Cay992o3kWDvYH9hEAbkTwei5Sl1Ob7/6Bvm5W
         hRd5u/1aoGxiNnTlN0rYuwnFgfozpUXjhCMiHoX5+rYtc9+2pe2s53mGL/677mptBcFm
         jOHOU8IZEAjyUNVOpbzV/nLGRRhloP2z29M3NQyLd0efS3QtRXWpHTDB/MkJ7iJIejCX
         fX4qbPALXzUU8han5YJKGciN3fBoEYK8t6dHsI61mFOPO2LZzvVRu9emz2GL27zhD268
         p2W5Bv2ZV+3VgFZG42eajbeA3foS7AikiNeEoZa5WGE3/E1d6Vd3bFjpYRZeYnBDJLJx
         Z7Pg==
X-Forwarded-Encrypted: i=1; AHgh+RpEhOvNkNE5EA3fIQkYANqsT22PXFnvVxzAX3ZysrAcqCquaiqg6S4LHUrBe4If5MlVmj2ElD5xcy3T@vger.kernel.org
X-Gm-Message-State: AOJu0YwqyQLiSFMP9DbRGxE/kG1U1NcyG0RCQ99vWqwL53oh3GZUSbr6
	2G43DIjSAnB4I7mQlSa1woE2qPGTOPhB8vmnWsAWtp6wennDdTwUZG9VzaOFVrRLfc34EZzcRSt
	81V26HNfsWyyhRVgPf37BrRoIS5U/pOM=
X-Gm-Gg: AfdE7cmoPdWWDTf6wIBzVFndkQiBWMQzGInQXtDk5ZOPmi8aTpoJu1YpOX7X1mUWpVs
	o1grx1ZWOtX4luXQVnYOHcquA29NhULhQ3H8pcUiUs0NecBIOoPPY+x9ym48QW5MDU5Yypnc0wS
	Lp1yd/70uheNuXtvhixulev1REI0GgI+G8Cbu52hSj7/zqxhBcmckbJ4VwNth1x2vOIieniKgHi
	Ky53WcxooXCrIXHCptwfZA2w4u4B09S3S21U9Xc5BIE6jljzCvapKPyQySXDesw+GAN/TaifAvc
	LeuWHONSAb7W455TjvpOfM15JWcUbwucowBH
X-Received: by 2002:a17:90b:2dcb:b0:383:5a16:bd70 with SMTP id
 98e67ed59e1d1-387582624f0mr6371414a91.16.1783453099684; Tue, 07 Jul 2026
 12:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624135650.727077-1-jerrysteve1101@gmail.com> <20260624135650.727077-4-jerrysteve1101@gmail.com>
In-Reply-To: <20260624135650.727077-4-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:38:08 +0200
X-Gm-Features: AVVi8CegJ64Z2gd1io1fmLKunzl-GtPXQOMtd5GAEdMnAz5kN92Sdzb9oNcj0BA
Message-ID: <CAFBinCCB1dRkqq3DsFn4nL0RZ9-pRud5rDUxTz_2NokGaynLxQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy
 node by default
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 3:57=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> Set the pcie_phy node to "disabled" as it is not used on some boards
> and should be enabled per-board when necessary.
>
> This change suppresses the deferred probe warning:
>
> platform ff644000.phy: deferred probe pending: (reason unknown)
>
> The meson-axg dtsi now disables pcie_phy by default, so enable it
> for the s400 board to support PCIe functionality.
>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
