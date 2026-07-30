Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386F63D6CD3;
	Thu, 30 Jul 2026 08:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401155; cv=none; b=qiV906JO/tHY6lU9gba7IkqP6lYJO1J3hmnHoedYSXWW6KI3TZPCpMPxMt5kkso1qR9qeDDWcm32VJw5bvIn6n268TiQry7MDgqw+RA4wlbxa2vIRhYgW2QTyry3MBuWVyAo1gogdJne2ouM3xWWckUvCxB1W0frOwEvYJA9m8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401155; c=relaxed/simple;
	bh=980zylVxvCHel5YKpVnrBTYkwdeEcgrv0bnina8V38A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrR5219FprnLxhRqgJrp04dgJgF7z0Qr1n+RE4P3IjLoaghmUqLiWBIx9RyFpAcN8N6GJPPBRyItaWqiGyYjS1PkrUbH5sKJiwPbZaQejXn22Ec02xvGS6GS0b3EKuSXnq4zx1OHW4HEs+w+CNaHTmqaDITwvCOzrlXJvCu68Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gS4sB9uc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gS4sB9uc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBA81F000E9;
	Thu, 30 Jul 2026 08:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785401153;
	bh=KoZWekAB+mXCjKKPwdC/+UrxluXzPXzJ6a2Xt45RWOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gS4sB9ucDGszwk08PWGv43tuHHcuSoAXn7ePKg9ZpylPcS7XDn03z2KfvkRnVssRq
	 n0HW1Rd1guGWXdQRdAo7thocRrIQOQiDvBkViYFQoRw5hBChs+S6MF7GD1bmy8zCqQ
	 s9c1P4XLg32JdPUD7ah+thRDxIAWH9pi+xMQy9s6zRo6zKPffG+I1NcfltHPpYtRIy
	 M69KiIaMQzc5mmPZo4nIvkfynUpzx5RQmmvxOdZ7divXcsmvP6wGZJWuiEVvFnE+tQ
	 cYgr1GoKU9EwFIJra71Pd76jjSgurJeRNO3nbCsyPMFA8VtZsvHUJBT5q0sxIecQmN
	 dojKfdFLiNQXg==
Date: Thu, 30 Jul 2026 10:45:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: mediatek,gce-mailbox: add
 mt6572
Message-ID: <20260730-educational-accelerated-armadillo-a8a5d1@quoll>
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
 <20260728-6572-gce-v1-1-750bba32689e@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-6572-gce-v1-1-750bba32689e@protonmail.com>

On Tue, Jul 28, 2026 at 12:42:46PM +0300, Roman Vivchar wrote:
> Add a compatible string and a header for the GCE constants.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  .../bindings/mailbox/mediatek,gce-mailbox.yaml     |  1 +
>  include/dt-bindings/gce/mediatek,mt6572-gce.h      | 52 ++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> index 587126d03fc6..d6e93010bb94 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - mediatek,mt6572-gce
>            - mediatek,mt6779-gce
>            - mediatek,mt8173-gce
>            - mediatek,mt8183-gce
> diff --git a/include/dt-bindings/gce/mediatek,mt6572-gce.h b/include/dt-bindings/gce/mediatek,mt6572-gce.h
> new file mode 100644
> index 000000000000..e6d949d76f88
> --- /dev/null
> +++ b/include/dt-bindings/gce/mediatek,mt6572-gce.h

Wrong placement/directory. There is no hardware category as "gce".
Please find suitable subsystem. Probably you wanted mailbox.

Best regards,
Krzysztof

