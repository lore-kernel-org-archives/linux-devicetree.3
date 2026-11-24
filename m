Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503632;
	b=k4/BVfTw7s1j4uHiEHqlYUoWSbQi4txNTe6E6OEOOOm7qjkdwZmkehmj0DJ+MYbViXsF
	 1hHvaKOakQgnnK80OBfAODOLitdRnv2DEDSEMuNgTTe4dYl7qPXBrW4NshHFhl8gVJgT6
	 54dT50iEJ8zu8THNlbGP8PDntkpZkreb+D9iZRv83eYUgMkDp5Cy352imxxK7LXIJFfS/
	 qHb1G6jH8eNDsDYM7SmrEUuUn9sIv6EIAXcnoRVFJH00PILmKOH4aIfpzLyamNDt7OvFr
	 jNBHMEDdmHDlyVyOmfjr3fGqTckYyhtLECblD8YNcUsTMadBUWrCgPij6+koJ7zSRBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=bUUKY0RsjD+IVYyi5SJxAofkyIWwSJR0q+NQRX7ZwwU=;
	b=3uo5uruAqmTd46w1zEicsvlntX07Y+XERwfxsS8Lc3jcgR/XBES+9ZqxwjI6dzVBgjGU
	 gVT3EV62HF3MonDxx56/WTw3VCwaHEDQTkCXwrEdjPZ6Hwea1rCT8/i6COnrIGd9JbAS5
	 348NSUK3X9xolRwlahfVK2+6/2tUOaCzAu2jGTUO5sjqUvmZplJCIlixnFJ+f4wksrKnI
	 XLHzXx6obmOdOPNqyqa6a8ctAcP5sbic3vzkcsBb7LyPyed2nuFGGD+iTjP2r97z7Z2Pw
	 7M+xlOdJODE4+35ljvWj4+1wdDjDMh6L+vHnzaB1KHtOzEkWPjc9QEVpZt3Yu9WvxwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVGdd82U;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B6B606A331
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 07:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15B6B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVGdd82U
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ace304021eso40066911fa.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 23:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503630; x=1796108430; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUUKY0RsjD+IVYyi5SJxAofkyIWwSJR0q+NQRX7ZwwU=;
        b=QVGdd82UruFfPdkhhDtfnYqoV6hQDoIc6LmdBLufjtmQpvNKfQQwYNlPT4YjkByGtC
         6b10N5ALfWr87MLq6fS42XMmf1oLMR0lG3tNc4la+6M161rsBCiPEePoiahvpmI08Q0Z
         aC53VISrmlWQvFm0CjvJHI1xPz0/R66Iz3+AvjcnKb1mVt0qOVT2+wIJk6LSYi4ate2X
         4S2MWMQVrYYIDvhFU0Kt9KID8whWfbFTA2VbauqgCBsy5/MTuy1exwBW+v/soVSc+irp
         EaLAxJqrZHrbGSaMGF5XpL87gVdKhgZTt3I1BMvo5spUCzG5KXRjOVvEysxZq4rlxvLm
         BBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503630; x=1796108430;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUUKY0RsjD+IVYyi5SJxAofkyIWwSJR0q+NQRX7ZwwU=;
        b=yo+9+PiIU/epXV6giRYG0bvMSVsLXZBn23eZb5J8bvbZz0Vzblsj0Cvo8bwAvTG98t
         Hqr7z+k0OtMoLTFy7fepbDt08Y8KkLj8KX/kERelZG9DIDc+yODoRbvPV+iHmQczRKuX
         jjg/+UHS/qcCldxbo/QW/+7twBpNOVSLTwccWg/9tlsVLZG4JBrCI7RiGt0WhaPfchLh
         7EJin7nR4hiu4vDHaNGgea+FRF/EVZCFVngyQ5EH18r+FoIkBS6VOFRlM/MeX5BWOLk7
         InG0lLXwt5hx/dgp2znQcaHjmUcVWsDtQeoOYBWoFBrdWSE+J6GT0r1BFvDf9awpnHy/
         Z7zg==
X-Forwarded-Encrypted: i=1; AL+hErH/XjUe4bSoNCp70riNg1Eq0ZDpoixLwr5nMN7NCKfGvzxFOb3+Pa/E++mMaz0CtvnmCWygTslh5b/1@vger.kernel.org
X-Gm-Message-State: APuU4Z8lwEd8Co68cQAqHtUjQeaFc7g1Fmw7dqfon8V/D4pNGcPS13KL
	hBBKF5Xg/q4bm8MFPIAOT/HyurMRYnNEXlU9Uj4GIUB9gqifdyrkTrOE
X-Gm-Gg: AZFdTZd7fiaarM8g7phQx1LL1vSPnT+XTrrenXPen6IrGD3YN5SwmbLzdVe0imPdv9X
	n24ZCc7nOcovQgRCh4S1SU9uPoKJtcxTntFX8DSdGd5wHVPWrQ2N0zZ6TZcl4OhmxXmj2kV8wB/
	ZlvslvEfMpk2XTSuxSaJL1qzf0KOYvxEcXARPNL0qTNGRN4b4znCbPv5REiv8DOI/Wb7ANm1AzT
	OU1U5+BIdCrMhAU9xA2yVqgAKw4lC106tT+U52W4Fldvwe8fZeoleg8CnEQSvHZmFmnvSDZ6cng
	L0qzaD9wWzvFXHUs6N1+iu62Ni6DXq8jj4PRazGRtUiDcoui9tWR5fQDdlnLT4vlDLvZmoDaZqH
	Ui+3+lZVosFS+6JXXQnCdYalpKCPkCbddMz8rSlFStRP1GLAZnDthu6/H0Nj/ZxEtBeMnM6Vxd3
	Y+dv1jfw2VE4rmhM9XDn85lkNi6OjQa43GPcD//xO9sZTK8PjF4xit5WkEq7vXFv4IFWZlAUM+A
	dnxx6rDFTBW0btYefw8GBS7CwTy9RKLRo9p93k/1PjOsRegdJ3fmdEvXaUmP5roKKSPwcnsDX0O
	+PagM1ddODwiEq0u0deU6oGEHBG9dqZAc8VEZmKpNiZUCieMXr6IdME=
X-Received: by 2002:a05:6512:12c4:b0:5c1:563f:ff23 with SMTP id 2adb3069b0e04-5c1bc84ebc3mr3803268e87.61.1795503630067;
        Mon, 23 Nov 2026 23:00:30 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05e235sm3481118e87.64.2026.11.23.23.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:28 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/8] dt-bindings: clock: Describe CS7542 PCIe gates and resets
In-Reply-To: <831a6498-9c1a-4829-b47d-52035fe15444@kernel.org>
References: <20261123-b4-cs7542-pcie-v1-0-4cde5201d404@gmail.com>
 <20261123-b4-cs7542-pcie-v1-2-4cde5201d404@gmail.com>
 <831a6498-9c1a-4829-b47d-52035fe15444@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352887.5.18085137758862458863@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Krzysztof,

Agreed. I have folded these controls into the parent global syscon in the
separately posted shared-global follow-up:

https://lore.kernel.org/all/20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com/

The parent node now provides both clocks and resets directly. The prepared
PCIe revision removes this resource-less child binding/provider and uses
the parent. I will let the ongoing reviews settle before reposting the
PCIe series.

Thanks,
Fil

