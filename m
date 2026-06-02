Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265C837DE87
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780386844; cv=none; b=oChen8cZtRscHwrcA6WUMnQWk06760X6Xutd3vuQetyTYsRiE1i6+V3rN9ieYTT7b0i4aGqhRkLFdpvwceITPXz6QqPwlFkp5gmbzLheQsshTbzmOy2OgI/vX8YNG0sKCKmrgDYAAk6imt9t0tqGZJsCqL6aFc/dF/q3Dk4p38Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780386844; c=relaxed/simple;
	bh=/ChsxAwgsClBDNPIth6BezLESO98dSLBlGagkpxSxxU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uge3qub5G4YvGle5XnEmFzkqGooxJG7RTOS36ajocWFZMlaQE08anyUuSap10r8nQy+mCE5ULJsfD42rM5bLKbIdRpZ9HDBo5e6zEDrIFN2YJlrzy9dAdbTFBg8R3A/ymoK0dIKD1rsnI2J12CuTQrt1aZk9TT1jC3KMw6oaPJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5CPkARY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5CPkARY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43951F00A00
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780386841;
	bh=/ChsxAwgsClBDNPIth6BezLESO98dSLBlGagkpxSxxU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=X5CPkARYWkA4k19BezdQ17m0KwkkTG35hhXE3fTOC1whAt/xUUCYkpYNPejA6TNo1
	 03l14hqNxkBTyGQDJakUZLQPCbwf1KtfzZIk8GXLgOxHDL8V7uOQ4qFREZc60nbdDs
	 Y5ahmashf9rDULNbgQcfEmx9htr9PVPsZ13g0uFgQUm/XOlY8D3f9v4AQqx74Fdjsy
	 EnDcG83F+AogZaVAdsk/MNuDZ0YHw4NtAgvIOR6D7ZGoV4Qo1DuzEf5+TZhBDnAsmb
	 J37Kkt2aE/fQsp6VC0FlJ6LNmHXaRcfDhs54otkJAKX1CKJaQLi9lng6cXYoA1twc4
	 Vb44KGxbvDk4A==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-396669329fbso24520651fa.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 00:54:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+wJydulroE5E2uisPhar+OM1+hnUcNNDC35TR+CumJVum3Y/GoKzf5oyjQQnqk9+mPmmUsw6qSyJ3p@vger.kernel.org
X-Gm-Message-State: AOJu0Yz29JOfnVAefZGUcixC/PDnYkOq5OxezIpuXqIUIfs6xZYYQ5tS
	mIGvWSG8wschF+HSD2lw/QIZrttx6wGTBHRUX/QZ/fVfAzsnzrhUrRx65jOcHU1ci+iLbZcf4OY
	WNQ7TfvTUKJ3Zcp1lyuN6/3mn0augcPGVm0kCxhssWQ==
X-Received: by 2002:a05:651c:2357:20b0:38e:94c6:b706 with SMTP id
 38308e7fff4ca-3969b958f28mr5892121fa.7.1780386840351; Tue, 02 Jun 2026
 00:54:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 07:53:58 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 07:53:58 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260601-sm8350-wifi-v1-2-242917d88031@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com> <20260601-sm8350-wifi-v1-2-242917d88031@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 07:53:58 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdmjW60qnyaFMYjGHVLaxxqVH2ZyRUV3YObOVXSw6V3Dw@mail.gmail.com>
X-Gm-Features: AVHnY4L1ltQa8oqTnx4DLvt4170BIuS_6mAm3-M2qQKtchkaVsjqTQPH2N9Sz0g
Message-ID: <CAMRc=MdmjW60qnyaFMYjGHVLaxxqVH2ZyRUV3YObOVXSw6V3Dw@mail.gmail.com>
Subject: Re: [PATCH 2/7] wifi: ath11k: enable support for WCN6851
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jun 2026 11:46:50 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> The WCN6851, found e.g. on SM8350 platforms, is an earlier version of
> WCN6855 platform. It identifies itself as hw1.1. Copy WCN6855 hw 2.0
> configuration to support hw1.1 version.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
