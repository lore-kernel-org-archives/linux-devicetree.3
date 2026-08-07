Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E389022579E
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 03:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786073063; cv=pass; b=fgfC3ESLJrebjbc1t6jFCEcEZyB49h5jZ10srQEVPfcLfddAJ9RoTA+xwFYQ6IspFlLK+2QZoGud/99af2LyVfoqcInoiveSMMavmQqwoUWeOT4lPyc/U0WZOo9h1z75gVrKQjHM9LZ48q5yPLSXPFO+LmTsm7zYcfAqdvaMbzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786073063; c=relaxed/simple;
	bh=DwhFItc7Uza+jOSDpnxs4kuIhVwWoyQzPZCblQUNSGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTlS8s5UQzGDcqhhGqeg0NCXK70KptgcdFyO4eD8KzCWrT92q1IPBj76awe+X3wOhGRKGOeLaa9SU2u19XNDhOljOL6fu9MCNPqVVdyrZLS0IXvJ1qvhIAL21Rtcm21V8rqSymyLOtK/B/VYETFnwhAMygoJvNbAgJ/8Q6/lr5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RT9LSj0k; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RT9LSj0k"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7ff05e5d009so34586427b3.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 20:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786073061; cv=none;
        d=google.com; s=arc-20260327;
        b=YNQFEWPr2xZ9mY+QT4sfmiemkdz1VKrfAV/mbeIGqrOSqsoyuhrsi6rSebUuKOEgA7
         L/NJZ9cU6OFdqou+Es2DOBQTik5A/cTF4z/SUBBHYPN/gVQPY8npqxbEs6sMeqUnJfFp
         Swe9HOAAz+dc2QWMLYPi9qefuVsHWYqKx+f08M2bqA4RoJPZO2suQVihfycBY8girATb
         CIyAPk4/hqxDg7GUuPEKUQjRUJ193nvXeKQFenEoJGdq9/Wg/E2U/w78HjN19zSiqyqv
         sbWB7SkwLrsHQr+Pv60xgAWXP+CnFh+nl/juRH0odIgbpi6A/gc9uvC9b7VeuXOavVp6
         vjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Rxym6s8p5fdNkShVSkwaV8afJle+IJgpasiGsN9DyY=;
        fh=KxUkGDy24v0AjueGwj4aIV+KPjAqjkgMVWiqmLK3gUU=;
        b=g9Y451XDvoH5jOqAvU2rhJu0pGvvhbW9Pnxy6UoPcaMODeM0g1S4wUyEPBCTKbnzZP
         pR9eQhZSX3cAUonOm1Vech8R8F2BrKdJnsrtqWe8IwpzaapKugoeqqPbBbsq2Ttlv9CX
         EZVl0gFfHqV1DzHsD4Ez9Eh5prmSb4DQz5axx+5UFVicwbnlXt28vGIf/XQdMcW0EvOx
         7t8Nlne5AKYygk6puQTxYfYoYxMW6WyumNybIJSKeO8RJEenhKM6ffSPLf+IfiQpcXvB
         877rh6yvj9eLmRaIu9I3ggc0rNMwLh8LFtlqXYdX/ffzIaFdSQKJSziX4LYxUVpMi688
         s3BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786073061; x=1786677861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Rxym6s8p5fdNkShVSkwaV8afJle+IJgpasiGsN9DyY=;
        b=RT9LSj0khGrH/Q9IfIU54pWiJe2KWnNA6vNrqTexJD22Yn3k4e/Az8AVvYWBjbTnve
         TtPhSE86a1mpfoMm1xdKRCTOpIs1OVaM5+EeTVkBmzKW3nKKvfUKj+UitccXqkGjL2KQ
         xSUmsOVS8qU2mpoSasH/v6VhWLFysy5Z93jAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786073061; x=1786677861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Rxym6s8p5fdNkShVSkwaV8afJle+IJgpasiGsN9DyY=;
        b=L91uQSqKKw7qpyvtTHx1smF0NOCWBKjt0DubmQFO4GoVxm6ejaXFWQ5g9dQYkwwZA4
         5y3W/WhM7IXod7YjFFXgUR23KZ7HUB/N4gNtoQbs+siYeBHwZWnY46Prdgwt9ZLu6JFt
         eUgHQFsSSjsRlku6Ro5zwtEPNaSEVWxgxmce4FXpWSQjB3rvlK8NgT+wWt3YPGjrw+Mb
         4LkWfv8ys4IaxNl1/fXfc1VD2wWur8WwLPrDgsfRGCQ3HMHxEq69MSxO5E994tSrgrn2
         ZQTyyL9Ca8yaJp2P6rldmqVUaR0+qISYE6z1Mc75+iLycjE/Pvb3YJSw/jjTb+pIlGSS
         J34Q==
X-Forwarded-Encrypted: i=1; AHgh+RqXNPGGV24VPB3SwkelfW97ftlKK8Kv+HZQAcS/saerQ/FU4kSCDTUS6VfSQbyLT7kDSn3JUBVIDwy2@vger.kernel.org
X-Gm-Message-State: AOJu0YwmWJmf6Vy5ImXgcjAR5Zj1XeKI3cTy1XAkXmu0Gs7nF4bd5VYk
	bz7tC5KV2F0Uq/fdN7br4lDCbM/YXSJ9GKP1XgnZwLFNtXQGKCrCJEKDWcNsZMsJWLP9173Q2qE
	yseNrUGaMoPMy+2BnRSW/u58yxXOLhtDDiuy4z0AsN86xB2NnJVjCftdD
X-Gm-Gg: AR+sD11jWKbvZBcz0gJd0TxF+4sm6MYWKcHZzX7INTbWa6X1qNddJBXCwi1MLywupfH
	RseDAocXQw5xqXJViM2FjHqG28MHE+EYDVEej38HF7bDzh5N3Rf9L8SHGL9AqCtSvkgEi7WRr5V
	3WrwNo5cPioumr/p3vQpGrfaKbg1zI5LiOzvEOILgIfblF/PLOwubagm9fUUY5wytftay+6pYhg
	NqNQrDwqlrfIijNnsYCtKnZfQrwNMOoBr3UWojXo2mIRQq0RDu6k2rbbj8HZ9vuT/86q3rEJsSs
	sUtTTNeftFURyhnZyfPaMzTJrH5vS7EVjDaU1wcXPi18vMhNbL72O114z2NCe2fUxK8jF43RT6G
	53FU6Xy05iQ==
X-Received: by 2002:a05:690c:3192:b0:821:1013:b420 with SMTP id
 00721157ae682-8211013b613mr61043287b3.2.1786073060720; Thu, 06 Aug 2026
 20:24:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806165334.7328-1-ansuelsmth@gmail.com>
In-Reply-To: <20260806165334.7328-1-ansuelsmth@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Aug 2026 11:24:09 +0800
X-Gm-Features: AUfX_mzUdOGgxWn32vBMs4t6vRLtbHLODUQScOwpqh6tGHGYlgOK1wG3cJKPIgA
Message-ID: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
> This small series introduce support for 2-lanes mode for Airoha AN7581

Just a nitpick, but I would probably name this something else, like
"cross-controller lane-bonding mode" or "lane stealing"? PCIe already
has 2x lanes as a standard feature, so this naming is a bit confusing.
It's not like dual-LVDS display in which LVDS is only a single lane.


ChenYu

> SoC. This is needed for correctly functionality of Eagle WiFi Card
> normally attached to this SoC that require a 2-line PCIe card to
> correctly work (and give the proper performance)
>
> The first 2 patch address a limitation of the PCIe implementation
> where the PERSTOUT reset were indirectly asserted and deasserted
> all at the same time (for all the 3 PCIe card) with PCIe
> enable and disable.
> The 2 patch address this and introduce correct reset to control
> reset line for the relevant PCIe line.
>
> The last 2 patch add additional logic and support to assert
> and deassert the PERSTOUT and also apply the required configuration
> for 2-lanes mode.
>
> 2-lanes mode is implemented in DT by adding the required property
> and by defining the "num-lanes" to 2.
>
> Changes v5:
> - Address formal comments from Bjorn
> - Drop clk patch (handled in separate series)
> - Add reference to clk changes
> Changes v4:
> - Improve DT split patch (drop unneeded property)
> - Handle power_down PERSTOUT
> Changes v3:
> - Add Ack from Krzysztof
> - Improve commit description of PCIe patch
> - Use pcie->num_lanes instead of possible uninit variable num_lanes
> Changes v2:
> - Address typo regs -> reg in Documentation
> - Address typo lan -> lane in Documentation
> - Apply a suggested fix from Airoha for PCIe MUX configuration
>   before PHY init
> - Parse secondary reg in probe
> - Add missing reset_status handling for inverted bits
> - Move SCU to local handling in power_up
> - Add check for max num-lanes for EN7581
>
> Christian Marangi (2):
>   dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
>     2-lanes
>   PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581
>
>  .../bindings/pci/airoha,en7581-pcie.yaml      | 244 ++++++++++++++++++
>  .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
>  drivers/pci/controller/pcie-mediatek-gen3.c   | 106 ++++++--
>  3 files changed, 338 insertions(+), 89 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-p=
cie.yaml
>
> --
> 2.53.0
>
>
