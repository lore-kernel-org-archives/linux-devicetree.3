Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF263F4DFC
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 06:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466485; cv=none; b=dzRppPotXNwY1sswB5fs8OfKAl6SGBt0IEquZKytj/aQCy1oPyVacRjbgdPB2qQbWFHbltCWRphNVI5CkIjxMCdyK165IQKMdpr+GVOkaq88KHmEiDolB4eTeUUqrSeEl0BEPTY4mlm50UxDaN4khSWhALdF6+kPXG80EjJa0QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466485; c=relaxed/simple;
	bh=tnpQMvXDN96HZn5Z7cry12pz5PIevfE/ZtGfrRECNPw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OT2sjznSA35Ffs4zwLYq18yVrjjQlYw970C3PeO+3F3AClOpW8m+MGzg9mROxXbiQkOMKZ7W6rJLSQaPXKSVN2JS9wjkvo0BMnKvC1gYNRKySAjQ+bqSZ4PlceVplF30Z1BOVoPueSYyt8PZgMTYvyg3WOBuBtFGdHQLGBu8p+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcOIEXR6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcOIEXR6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4767F1F00898;
	Wed,  3 Jun 2026 06:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780466484;
	bh=6abASxgUjg/+2t9e2EVFKYsT9rgNnOLlhIKwVas6Z8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TcOIEXR6BZQZFXQKpLhSxlqBJjee+WRt6Ue18uNaw0JdcSw+kfHD0TdqxXPKmGzdm
	 KzdH7dZJYF+47WwCRr1NGhDWfbC0vP+EJTEf2IkBLt1OmxYu13RO7ywuFLgtqa75+j
	 4nnzjYm2VZY2AJkE11EqApUzLTkeE/ofRriimPOYwzanRBsMqB/q/bZJ+8jnvsAOnw
	 FkAm2KqWDtjuQCwmUbmBylGW9f1odC9eyMtRnsUUoMfArkBuoDbqL6/vDuK0J3zVI7
	 I3Q+MqC+w26J9ELCqW0J4VFDS+bf+3zfri6gaQrhElBMnxQey5BgtEOGOdYavPOHU2
	 cmNy38SvwqQIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: usb-hs: honour qcom,vendor-init-seq raw
 ULPI writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20260603054809.565723-3-github.com@herrie.org>
References: <20260603054809.565723-3-github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 06:01:23 +0000
Message-Id: <20260603060124.4767F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Using `seq->addr =3D=3D 0` as a loop terminator prevents writing t=
o offset 0 in `qcom,init-seq`.
--

commit 23768611bb7332cb583754c2260443d91ea51fb4
Author: Herman van Hazendonk <github.com@herrie.org>

phy: qcom: usb-hs: honour qcom,vendor-init-seq raw ULPI writes

This patch adds support for the optional qcom,vendor-init-seq DT property
to write directly to raw ULPI register addresses. It also hardens the parse
logic shared between qcom,init-seq and qcom,vendor-init-seq by factoring it
out into qcom_usb_hs_phy_parse_init_seq().

> diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs.c b/drivers/phy/qualcom=
m/phy-qcom-usb-hs.c
> index 98a18987f1bec..89fbe8f8d0015 100644
> --- a/drivers/phy/qualcomm/phy-qcom-usb-hs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
[ ... ]
> @@ -199,6 +219,59 @@ static const struct phy_ops qcom_usb_hs_phy_ops =3D {
[ ... ]
> +static int qcom_usb_hs_phy_parse_init_seq(struct ulpi *ulpi,
> +					  const char *propname,
> +					  struct ulpi_seq **out)
> +{
[ ... ]
> +	if (size) {
> +		int ret =3D of_property_read_u8_array(ulpi->dev.of_node,
> +						    propname, (u8 *)seq, size);
> +		if (ret)
> +			return ret;
> +	}
> +	/* NUL-terminate so the power_on loop's seq->addr-as-sentinel works. */
> +	seq[size / 2].addr =3D 0;

[Severity: High]
This is a pre-existing issue, but does using seq->addr =3D=3D 0 as a sentin=
el
prevent writing to offset 0 in qcom,init-seq?

In qcom_usb_hs_phy_power_on(), the initialization loop terminates when
seq->addr is 0:

	for (seq =3D uphy->init_seq; seq->addr; seq++) {
		ret =3D ulpi_write(ulpi, ULPI_EXT_VENDOR_SPECIFIC + seq->addr,
				 seq->val);

Since seq->addr represents an offset added to ULPI_EXT_VENDOR_SPECIFIC
for qcom,init-seq, an offset of 0 is valid and maps to the first vendor
specific register. If a device tree specifies a write to offset 0, won't
the loop prematurely terminate and silently truncate the remainder of the
initialization sequence?

> +	seq[size / 2].val =3D 0;
> +
> +	*out =3D seq;
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603054809.5657=
23-1-github.com@herrie.org?part=3D2
