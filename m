Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2973655CC
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917541; cv=none; b=KBta/kmeVFxNRsRpH6p78hwMMoDTsw6FZt6AxAC2z4JB8mYkCmBJPfQs7WG2nj8EAvur11r2kcbf14wHs3Jnd7D2WKpMuDeTFJruX5nbn52fwPp15iHsTZCp/k7al90BoyaE+F9nUyjZVQ6Q5mLk8pzAIu09/XdWoMZiY32+VZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917541; c=relaxed/simple;
	bh=DPpaot2Svx2MSbq7KY9ZMt5/x26NfewXAR6zENf8kbQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xky7n/MMVQgAAjdFTpDLILJo9Lj56N+Ol/05EuZR8yUwjslObQZ/yB6UbMFVpZLcqnlRQF2+PrYHIbF/Azv4RcnzJtW42wI6DcvrCUjS67vxjJM6zCMqAxSsuG/HC/t4JKyjumkRER7o0O7nlDWyoINrXq7ds0AQP0+cNjIWVgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqjKgFkO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqjKgFkO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADED61F0089B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780917539;
	bh=DPpaot2Svx2MSbq7KY9ZMt5/x26NfewXAR6zENf8kbQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kqjKgFkObqfwVvcVXJkmpZpX1TkQLYU2+UZlp+tpOIg2EQzD0ciQMwI5eKqP5zNNy
	 1MnoAYN3hwHkJNojge4fY+NqquZfjcy1RFbVwG9S5vYZVoS7zIvnokjvKHsnZsatXL
	 rkNjgnxHzxM+NNcXGGfbHCf4YLS0NUpvgH2u75haXaazraTVOdDCnaGnrs9qfizMBr
	 OCXo4+GKRuOhfmzK7xphPdiBEIcJ5D7IVc10xgYL1LHgOXKW5TfbZJEfdl7/0qO9m9
	 EuWqidU/SAy83NacJkFbC1yw+bkT0wGwguF7deGgd3UfJtYIBpIQrvdTVsXuRdl+QS
	 +EgFvL7SjvVuQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa7a70c0aaso4221724e87.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:18:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8TUVzgmXhq4TsK+89C6Ao0BS7c++OqHZ1Tm9hJhaHg62PC1z1VTmLQoIMOe5Mcf3xBNX+1fSyn/C9j@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdyc5O+v2mc/Qf0KxNZwSxOW16x8Q6+Olb8h9RBx3cMC56zGD9
	Xsr9drU3xCkrA0ca1rMzAlmsAo3lfGw59c0eT38bXkX8mGiEG6zemjlLnS/A9ra/tg8UGCzw6Gw
	enPS9cYVLutLR6Jb4heEN87pibaPmbE2G+j7weSViRQ==
X-Received: by 2002:a05:6512:61d3:10b0:5aa:6b85:85cf with SMTP id
 2adb3069b0e04-5aa87babf3bmr2724481e87.10.1780917538408; Mon, 08 Jun 2026
 04:18:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:18:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:18:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608-block-as-nvmem-v3-2-82681f50aa35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com> <20260608-block-as-nvmem-v3-2-82681f50aa35@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 04:18:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeyOS=ngzVcu9zHN1g2W60GXHuZgSFozCTSVb1cGxJwMw@mail.gmail.com>
X-Gm-Features: AVVi8CevzSi8FWjqPtdJGMMjRNFkh5D31R7JAhStRKSOzvhr_7JJA4oBvY-YP1c
Message-ID: <CAMRc=MeyOS=ngzVcu9zHN1g2W60GXHuZgSFozCTSVb1cGxJwMw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jun 2026 12:50:39 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> Document the NVMEM cells supported by the ath10k driver, the
> mac-address, pre-calibration data, and calibration data.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
