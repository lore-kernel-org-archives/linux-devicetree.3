Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743798;
	b=HRPB/XfRGLt/Sc8vmvCViCtEGDZ01c9KR4o7kdk04T2nSbA/wEjnVMlTWS31CE3BWpTu
	 LlDqzMQyKP1uAVg+rNay2Roe2SETfjMr98i6VUY/14Umrhsie4zX6LoXkZt5COx2O0n4u
	 Rm8Oo6dlDNY4VbtyBoqf2xK+A+VwcuBip99oK3m8eAnufXDYSd+HwxecLjVOobF4ZDMmi
	 G/AMvhMglSvMr3R+H02KPh8JMu+wTIlrglAqMUmHeoPfZ4tCDwFfFzA3uQdGH002bagSJ
	 MAerxSI1wL5cPUysz8Qx4tczCls5qPCjwM6Un2BL9WT8M7+VzmcGgzR8uqP3YG1O2RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743798;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DvviBGBIJRQKi/WJihFLJk/UaJC+vxIlEpLqn7MOxoU=;
	b=43LoBapf9Xip+pWePBXwjHz9NsXA9POlWKGwm2kKpHHvmU2rPk7Z601BiaqBSBHqLhJY
	 iUu+V+CtVYGdV1qa0RBdOu8kdRdlZyKcEg4Kog9DpXgoeYuf4+AM9+M5ct+uvtNwohE3D
	 w1RSNrH6vRVYiA55R+lZps5/y3/3Uj9tgnqweF6OuOuLDSPe6orRP8emkzDgPYtTkJ+kr
	 dd2IzkvHHTc0sIZhMYRD0dCiAjVegBscZ4ni6CjoxtKIUsafC317xLTnQ8xkDaJ7Ac3LG
	 khDBwt4kMt4UQ+zX24IEFfutYCDZD0nsVSqUu+hmIRP4j3UfQ02tOk1Dte/TBbx1FAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BmNjzFgF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E0606A31C;
	Fri, 27 Nov 2026 01:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BmNjzFgF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2ED1F000C1;
	Fri, 27 Nov 2026 01:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795743798;
	bh=DvviBGBIJRQKi/WJihFLJk/UaJC+vxIlEpLqn7MOxoU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BmNjzFgF8FO3CvfjQJlFT4VwBf2fu5ui+Vd4K5RaJIvkIMmwbktFGkuoSuOBSc0ao
	 qlAn8c5oA6rbm6iVCj5bwZTM7CBTUYC74/K9texFH7xhYlM6ZWJ+xy4N050KnspQZJ
	 fz+lLvJOTtvUI1vP0mwnIMOFHt2p7lafxMxaZxB99x2dZ+bsdScdVy4SEgXWApthVA
	 DyJvXC7JWT2RDtDAx94+DJh1OA56Rvm+S9H+y6LVMdaGjp2t1bG1uiFCFtCGILZKEq
	 +8SHbETmtUj/g2ZKyYROEwXwbqMAbsOxlkpjczBmmAnWRI3HVZplypTVZ9DOPjTF0/
	 zsVlxY6UPHqyQ==
Subject: Re: [PATCH net-next v4 2/5] dt-bindings: net: hisilicon,hisi-gmac-v1:
 Add mdio bus child node
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shenjian15@huawei.com,
 shaojijie@huawei.com, devicetree@vger.kernel.org
Date: Fri, 27 Nov 2026 01:43:17 +0000
Message-ID: <179574379712.3135.10430747530251606424@kernel.org>
In-Reply-To: <20261126005524.4156940-3-mmyangfl@gmail.com>
References: <20261126005524.4156940-3-mmyangfl@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In this commit the binding hisilicon,hisi-gmac-v1.yaml adds an
  optional `mdio` child node and says that PHYs sit under it when it is…

--

dt-bindings: net: hisilicon,hisi-gmac-v1: Add mdio bus child node

This adds an optional mdio child node to the hisi-gmac-v1 binding. When
the node is present, the MAC looks for PHYs under it instead of directly
under the top-level node.

> diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
> index 89ed6ab1905e1..a715298259552 100644
> --- a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
> +++ b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
> @@ -53,6 +53,13 @@ properties:
>        - const: mac_ifc
>        - const: phy
>  
> +  mdio:
> +    $ref: mdio.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Node containing PHY children. If this node is not present, then PHYs will
> +      be direct children.

[Severity: Low]
With only this commit applied, does the driver honour the new mdio child?

hix5hd2_dev_probe() in drivers/net/ethernet/hisilicon/hix5hd2_gmac.c still
registers the MDIO bus on the top-level MAC node:

hix5hd2_dev_probe() {
    ...
	ret = of_mdiobus_register(bus, node);
    ...
}

The binding now accepts PHYs placed under mdio { }. A DT using that layout
would leave the PHY unregistered at this point in the series.
of_phy_connect() in hix5hd2_net_open() would then fail to find a
phy_device for the phy-handle.

The next patch in the series, "net: hix5hd2_gmac: Use mdio child node for
MDIO bus if it exists", looks up the child with
of_get_available_child_by_name(node, "mdio"). It then calls
of_mdiobus_register(bus, mdio_np ?: node), which closes the gap.

This is the usual dt-bindings-first order for a series, so this is likely
fine as is. It is noted here only for completeness.

>  
>    hisilicon,phy-reset-delays-us:
>      description: Triplet of PHY reset delays in microseconds.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126005524.4156940-1-mmyangfl%40gmail.com
