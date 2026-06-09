Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451B33D8107
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988768; cv=none; b=SoVuWbU53Ymj1lF10QnnCuaALdWQYas6cq5flfFF9yus9h1wDXq85FM2WrSZH3hPwhqmfnfM34CiCtcuwAB1mQ+q1yXxqvwjs1aaZA1Acn8ikaj5ai1SOl1k0X4MhOo6Dam6hPx3hAXUAUgxRhz9Q6o8dMs6mHnuptboQUfcwvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988768; c=relaxed/simple;
	bh=muK8R/WrqUlZEO1LVYC8jRIzCQpvBvIP+CW6+r9FZPo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=isQRdCFYiboijG/ZR5DpleS9+Zfl6io2EtWNFKeY0dtTyEy/etIMoectXdGwNVArtWbb/cAGQrtyDDyT2Vym00dk12/gg3v44Z+RnkKWhVdsbd4WaQ/71gG1YdvpjdioBZS1UtAY6NYKlWyeVLBB8mEaPf56Jv2vNpcZl1P8uTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QdNIacnU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdNIacnU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177DF1F0089E;
	Tue,  9 Jun 2026 07:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780988766;
	bh=VE3VBtQc2sVqCWzSKClTsIc3BBoaSx3PFbAGF3Nf2CY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QdNIacnUn1L10BNQXg9N2m9zX6OsMgvbUf2fp8e/u0jFjdI/dTDkKszlkS34n3q4w
	 gQmfloBfLfUs0a8fQnqpNvxiZpFcZCJzYES8/dgd6WWWmRqG7sFz7jRdrgxm+j54Ha
	 u/4fdW/Aj1CTRF69INlHqQq4rGbSLYKEzYkOi+XAW0FY2/Ub9YI7Ac3ox23B4WFVbj
	 j45k5bRcLu4h4VJ/orpzmcqWpSWQhw6n5okbOm17JmPznX+9bkoA1wH3wNtanuNb5s
	 zoWljFH0D8jcd6ZRPr9s5IqHnnippJxDesNa/54TH6cSPipW6w5ijO57lpi67EI+Oy
	 Ezt172ruVZtVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] thermal/drivers/qcom/tsens: Add support for
 ipq9650 tsens
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609065447.4024695-3-varadarajan.narayanan@oss.qualcomm.com>
References: <20260609065447.4024695-3-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 07:06:05 +0000
Message-Id: <20260609070606.177DF1F0089E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The device tree property `#qcom,sensors` can override `num_sensors=
`, leading to an out-of-bounds read of the static `hw_ids` array and subseq=
uent out-of-bounds array accesses.
--

commit 1557d45f1d577e6cb959599793cf39e4448627b6
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

thermal/drivers/qcom/tsens: Add support for ipq9650 tsens

This commit adds support for the ipq9650 tsens device by reusing the
ipq5332 ops and features, while defining a custom hardware ID array for
its 11 sensors.

> diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens=
-v2.c
> index 8d9698ea3ec40..ef1fee2266a32 100644
> --- a/drivers/thermal/qcom/tsens-v2.c
> +++ b/drivers/thermal/qcom/tsens-v2.c
> @@ -300,6 +300,14 @@ const struct tsens_plat_data data_ipq5424 =3D {
>  	.fields		=3D tsens_v2_regfields,
>  };
> =20
> +const struct tsens_plat_data data_ipq9650 =3D {
> +	.num_sensors	=3D 11,
> +	.ops		=3D &ops_ipq5332,
> +	.hw_ids		=3D (unsigned int []){5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},

[Severity: High]
This is a pre-existing issue, but does this hardcoded array expose us to
an out-of-bounds read if the device tree overrides the number of sensors?

In drivers/thermal/qcom/tsens.c:tsens_probe(), the number of sensors can
be overridden by the #qcom,sensors DT property. The probe function later
initializes the sensors in a loop:

    for (i =3D 0;  i < priv->num_sensors; i++) {
        if (data->hw_ids)
            priv->sensor[i].hw_id =3D data->hw_ids[i];
        else
            priv->sensor[i].hw_id =3D i;
    }

If a device tree specifies a larger number of sensors than the length of
this new array (for example 12, which is under the MAX_SENSORS limit of 16),
will the initialization loop read past the end of the hw_ids array?

It looks like this could result in garbage values being stored as hw_id,
which are then used as offsets for the fixed-size priv->rf[] regmap field
array, potentially causing arbitrary out-of-bounds pointer dereferences.

> +	.feat		=3D &ipq5332_feat,
> +	.fields		=3D tsens_v2_regfields,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609065447.4024=
695-1-varadarajan.narayanan@oss.qualcomm.com?part=3D2
