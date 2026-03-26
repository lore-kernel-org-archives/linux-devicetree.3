Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F73290B6
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549717; cv=none; b=p4fohvRzmpDFZf/tuhEl+35ldzjt0Pep1AGrIWK8iP/mW11ISpV530rwNySvPuI81JrN5s5Xc/7aXP+8/EAYHCXwLImDSyygLAs/u2jsdog8Boaoj05SdWCl1BaLJtXM4HIXKmJbw5Q6ZhGJWThaAfLcYk76I1w7rTYtkBK7s/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549717; c=relaxed/simple;
	bh=Jc3WGM9+nSXAgx36gi73IUpaDeFuSOdmq7+OowChnuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVSepnw5vwwE91+K2TcTVX2FEVpYv4wFh420GI8JSQdYSGkIevU4ud5zNjdMoNkKZ84qT2nFqameE6UlQiZE1CjCa/s4kL/DsIbTJyc44KPfrKCc+eHfYylYnuzHViOUW++YCSWmOkNrwRy6uWlEKjE7ZTo0aOuqSYyP7CweSg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ng8H+v2f; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ng8H+v2f"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-356337f058aso811895a91.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774549715; x=1775154515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xq2guOjsOaSspszJVZHGbMTfXj6L3NYNNr8K8Ir/mPI=;
        b=Ng8H+v2f2gb72FkTKL926Ur2LpFCywyblJxHiipmgBBoesWnFT9mK4JGhYLTFG+Gms
         CfY5M4yzKUScXweA9XyaI21nEB79fAFAgDRMbj6gMLA1sMWVRWBcSbmF4vyFm+pg6FTA
         okINvyZaUY5KdplTpCBaiPJhSW6cmDLzAgkoZxuJ1lXkOuwnVBYqxexny/0HhKkvEXaL
         L0jDS1WkN7jAHkjegdotknB8wEO9OLsP55Aibjwb0qORUDXWd3ZdTGp+PECnuCuClWmC
         kC7nUEyNcLXur79YXFvSJj6h8kFLoHXfFihbkjPGsq/ZJukbimctau5N50qkhz5kw2+S
         gntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549715; x=1775154515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xq2guOjsOaSspszJVZHGbMTfXj6L3NYNNr8K8Ir/mPI=;
        b=BhKvHPmO/+11jOAw+kVUq+jVN5ChNiLXLuxgLpxccyZoaGKOFYm/nP5rM4dOvCfKmp
         60/y+uFpMoSOwu9lTPrzXi1IZqrMlyP0C3eCjyjkgW9C4yqUpbGzzEF/wV6n/IDqrUoc
         4vzWEevM/wJb2BT+LEClEFgRYh6IvBhuRdi7OW0KcpXd9/Nb+SvIy5GCutYYwlAKhIxs
         ewO9O+aO0TZlaZae8I69wu/8fwXMvbrH1gOikJJWltnWMzreD7bO8hY+5Y+JpsZPDJ4G
         78UU+v+j5YARKBXy2OBDTVHkIspw1w8po66+9NGGN91x4RUJX8iAIJjW1auWEwHRBYWd
         M1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/264kFoJUqKamtfHTs63FV1na7pRfLba55OksakMSxN2k9cACHkCwvtedZK7YIO3Y/prMs3wU0ZAx@vger.kernel.org
X-Gm-Message-State: AOJu0YyBOfQ+22ohj062n7wgvF9sBlBmupi0ctUjjw1fHWRsU6K6t7bR
	6axOuX1w66r6DayZBM9zUeH6kd3HUGfRB1zIZ98PcD9n4q6iFmqy79vc
X-Gm-Gg: ATEYQzyUn0kJVP8o65kACRiejLhSPrV+IDACPeUbN6TxOi68eEcnAwn0m7nqnq3cP/a
	di2bo/4UMwYK819mBTFZBfRf7ajzaSHlkkUPiAUGnWaervdCvlpgHzuZy5ZpwrNhPViyCyoJdei
	t8kElII+J54XT08e/PC+bXWU8l6FMBWYi7kyJw1sehi4HCKYIarR92Rmdh1h5MjqCPkA0nVSlQ2
	Bdezil5Fbw5YbSqkVE2uuSRwPG7PgXoHZB8hxETIn0nLICYvIJ3oPwUxOBy0ir/eTV9RrffHrA7
	ghrzE9LkmY+t/etGO0je5OVH+BpbrzUBTGOoaayFAGX+XMNEJqQ66JTDAJ7ic0WSUNGAzYJg5oj
	t/Q6+vV6Azv06LMvn3bX9FPPrkOgdkROIkahtqM4lqf25jdf5fl0Bs9U+bs5Bfa8BEt+clkEP+K
	JY/JaHCIl3DS9ZyLQK+74vTMhyA30HZa0=
X-Received: by 2002:a17:90b:3fcd:b0:35b:a30f:8bfa with SMTP id 98e67ed59e1d1-35c0dc813dcmr8363731a91.7.1774549715010;
        Thu, 26 Mar 2026 11:28:35 -0700 (PDT)
Received: from ArchLinux ([43.251.91.119])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc795f08sm47816045ad.21.2026.03.26.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:28:34 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Date: Thu, 26 Mar 2026 18:28:19 +0000
Message-ID: <20260326182821.8332-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <593b3801-a83c-4132-970f-5075ebca2bc4@oss.qualcomm.com>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Mar 2026 10:41:03 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> > Plug in USB-C related bits and pieces to enable USB role switching.
> > Also, remove dr_mode to enable OTG capability.
> > 
> > Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> > ---
> 
> I'm not sure what this is going to do for other 6125 devices
> that don't have the Type-C infra wired up.. Does just applying
> this commit alone keep peripheral mode working on your phone?
> 
> Konrad
> 

Yes, I have verified that USB peripheral mode is working with this
patch only by using USB network[1].

[1]: https://wiki.postmarketos.org/wiki/USB_Network

