Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CAD3DB64B
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487165; cv=none; b=WbvidDv6Q8frpTkJ/Kum7B4diGqEPyRrFWDz4ptG+nfd62wpVmFz9X37E4c8c3z+bm9TXuxNC3ONvyfeREnpoeTEAcuM4J2sSIdfscVpc1SaBvBGNRo1VCO80/V7mbLu3w2bnjIL22NVKODQYn0htqLGiaWzwsxGESsrRQa6Kes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487165; c=relaxed/simple;
	bh=9twirzm5nktw8mCQZKCsisWF22u3KfRsBskDwndW4Kk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M27HXS0oOAHHKPjjVcogz6wuXWlreAKz1Nf+vS78e5ObUi9M2PcKDSIKo+gERjHdOfsN/FsdSAGdWDC7Hi5ZOLBCM6Hnl6GmAnxX8TnzCOmTzDQCPMrnY0AvrmW6tfUrFeObaRbK0v/kaYiUryozxJANxOYt5KYtd0q6Ksey/ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZWL8ED4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZWL8ED4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C721F01568
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785487162;
	bh=9twirzm5nktw8mCQZKCsisWF22u3KfRsBskDwndW4Kk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LZWL8ED4/GLHz40ICKDSglo8zKrRJbgy0c4yptTrK9MYgO0oE9fP2ICqkx4SLZ7mW
	 PypWqDT+mPJAtEu6lKE+1BgacksVsqZfl62WhLsdlHzDlaFuzUkb1PwsNUtWgWoMw1
	 YJMezDlF85xTKaD9qTyXa+0lAS+uvucwLJ16a9he7h/vsUVgZlw1AqXgGtfR5VVY1Z
	 uFexvjCVnGfrs5Hl0S/75iqKcV7FaHBypzQcQ+MSZCp1nY/5SsTJpAfEfSbTEaAL6j
	 GnUdknqAihCvA0ycmc+AXkOCuz+ctZ3Xgj6QWhQjrjpHDCp/av4+c4yQGoAXK1t12d
	 eShTbdGyUaTSA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so6443961fa.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 01:39:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpqAHyzVjExeA7MdKKGELZ05D5BgkhLlFpJLcdfWifmZsaYKmBPx7PuleFN4LkHqpUrQKm/YK5LmByb@vger.kernel.org
X-Gm-Message-State: AOJu0YzraZRp4m5irvotw50vXMWNnxE6phqnsaLcbn46ZsifzTYq4Cvx
	3u/xC7qLZAEvqad1Gi5TsJpdhCMLHrbhKw/DMMGzXXkjZhRrNzG468KuYv7860fPzJVam+j33su
	TnugWeWXyCFspupdHsA37dzXtBrA8HdwpCf+sfJWznA==
X-Received: by 2002:a2e:a806:0:b0:39a:fec6:efd0 with SMTP id
 38308e7fff4ca-39f7e3b70e1mr2581091fa.23.1785487160524; Fri, 31 Jul 2026
 01:39:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 01:39:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 01:39:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com> <20260730-block-as-nvmem-v9-1-f72935817dbf@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 01:39:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdRd-FgAa+NMf-GZLi05G8PrGjD9LB2h7dQ=9iXiLh9sw@mail.gmail.com>
X-Gm-Features: AUfX_myHE9QF2TZrMuCq1Fl8GoUB-sokgcKRRxyeNwASqhiRSWL8Z59R0TWE-vo
Message-ID: <CAMRc=MdRd-FgAa+NMf-GZLi05G8PrGjD9LB2h7dQ=9iXiLh9sw@mail.gmail.com>
Subject: Re: [PATCH v9 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
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
	Saravana Kannan <saravanak@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jul 2026 18:00:31 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> Allow an eMMC hardware partition node to describe an NVMEM layout so the
> partition can be exposed as an NVMEM provider. This lets a partition
> (e.g. an eMMC boot partition) store device-specific information such as a
> WiFi MAC address or a Bluetooth BD address and reference it through NVMEM
> cells.
>
> Accept "fixed-layout" as the partition node compatible, in addition to
> "fixed-partitions", so the layout can be described directly on the
> partition node.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
