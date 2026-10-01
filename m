Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2ED221FB6
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868499; cv=none; b=DrDwFvt6Yq0xxEnzVpCSG/gkat98cdMVfjsTUJw0sFtfZjzteEJQMo5uw+/bOtE+8V5I2QrinnSXhwBIxfPdQGVY/WXNhhpCnoCpiVh2efM6J66GKwFnF1pc2/JQIu+XKzxw67sXb6QW//2nRgDo3AsD+ob3OwH2blRghVJwm4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868499; c=relaxed/simple;
	bh=bdGCU2QkWOLdoyQDggJ4mc3eMkpqQNjzpJQ2pZ3KTiQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W5PlwGtTLKKOjMWOTTXIKbWN9+hjb8RX2ZjavBCJlXz9UPabP/wvuuoORT+VpS+g3AgbEhzXSUGeqNH+ruKUsWgu97SveIKfmHRDz+h82MPl2kVcAGJiHrIclvYE1gNt2co7Jfd/uh0XltZKw8SgDRXrXAOfaXAA6G13yl+BQlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eK9DYP6H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eK9DYP6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275E61F00898;
	Thu,  1 Oct 2026 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790868497;
	bh=krzDkuEu/POPTKqFY5S4CUkWO+EHdeGqvd1jS5HLZMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eK9DYP6HY5/IAivcfL5IaIvRqdzrnZa7da6ENgdi80zHii/msQeSV++uCQaf1iW3a
	 yFj/Y4ZK7Hz++is6ixtqD2f2qCE0xzEmsifF2AZ5rYpUkeFAxcxidtyOMLUSErH4pg
	 vwoCW9cz4RSyCl2WsqNC0kF7M0Qk/TJGUU5nVnHErdwr2rQZZ875ELHO21S5KHQRVz
	 BngkB6MhgjfOIxv0GHnQKCf5U1lmeysZmOjXNfc0KRZTxHdlPbfhYHdJXRRfPOcxQ4
	 EYyeANVepxljxgopgtZ7Hmt4Jl1t90fLbDpgfMK27bxwq4WeB9S3is931BgTqJ+OlP
	 aaB4/V9UAaWwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] media: iris: wait for vpu NoC to enter low power
 during power off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261001-kaanapali-iris-v4-1-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
 <20261001-kaanapali-iris-v4-1-642f9ac5e699@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 15:28:16 +0000
Message-Id: <20261001152817.275E61F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] media: iris: unhandled timeout on VPU NoC LPI status poll
- [Low] media: iris: magic number used instead of NOC_LPI_STATUS_DONE
--

commit ad8593fbbb8fd303ff77853725986ef7bd6d05a9
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

    media: iris: wait for vpu NoC to enter low power during power off
   =20
    The recommended hardware sequence requires software to wait for vpu NoC
    to enter in low power mode and then deassert the low power idle (LPI)
    control. Add the missing LPI status poll and move the LPI control
    deassertion after the hardware acks LPI mode. This avoids any pending
    transactions on vpu NoC before shutting it down.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu4x.c
> index 02e100a4045fc..32a161c8d534a 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> @@ -316,6 +316,10 @@ static void iris_vpu4x_power_off_hardware(struct iri=
s_core *core)
>  	if (!handshake_done && handshake_busy)
>  		dev_err(core->dev, "LPI handshake timeout\n");
> =20
> +	readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> +			   value, value & BIT(0), 200, 2000);

[Severity: Low]
This isn't a bug, but could NOC_LPI_STATUS_DONE be used here instead of the
magic number BIT(0) to remain consistent with the rest of the function?

[Severity: Medium]
Is it intentional to discard the return value of readl_poll_timeout() here?

If the poll times out, the code silently proceeds to deassert LPI control a=
nd
reset the NoC, which could lead to hardware stalls from pending transaction=
s.

Additionally, if the preceding do-while loop times out, LPI_CONTROL is left
at 0x0. This appears to guarantee the new poll will unconditionally fail and
wait the full 2000 microseconds.=20

Could this return value be assigned to 'ret' and handled similarly to the
other polling loops in this function?

> +	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
>  	writel(MVP_NOC_RESET_REQ_MASK, core->reg_base + AON_WRAPPER_MVP_NOC_RES=
ET_REQ);
>  	ret =3D readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_A=
CK,
>  				 value, value & MVP_NOC_RESET_REQ_MASK, 200, 2000);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-kaanapali-=
iris-v4-0-642f9ac5e699@oss.qualcomm.com?part=3D1
