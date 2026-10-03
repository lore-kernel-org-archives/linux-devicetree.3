Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587EC3B6BEE
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019292; cv=none; b=COiKTX0gSCQKFDwfP90w5cL0kr/BnEdKspd2ZKlSDWrnDIdUrx//8qw+8YV0lZ+5EmvPmP1nN/Lxv2PYqAJ3XhjPa/V3zOOwI8hCQP4AsfLrpXX4D4FtPxCuIcoNPsT6TKc1MIKamLB6oBnERGN9t7q3Gk0NcIRqbv0uN1ZbmDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019292; c=relaxed/simple;
	bh=CoIuRbLDyZF4C8pGsFXbuwOHAHD03xxqs1xYP4kRkt0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B3Tke3coc9RVvFXh8+audASCtIzMI2QqBTgEq+lxB0wlvQZp339fvwevMV5+xNv68iVsSRUwNwEKscOmKOgohUJ7Z/HEDsF8vJ6TGpYteGFACDFedPX1nnIlPMr/b4McSDleYGidbZgQ2KZTDWGsgE79OU+f+Omud6t/gqEDrV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7ZIflq4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7ZIflq4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7930D1F0089B;
	Sat,  3 Oct 2026 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791019291;
	bh=eumJjVs1Xj0do+SQC0gAXEMlRObqmy1cfV6EQEvii88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N7ZIflq4XriZ6vfi3vKt/7n8EqNrAgqOiVp3khAqD5ehh/V0VoGtt4W+G68iEdb5+
	 PV+EZu/YRAwwX3R0KFYi1KH22t/q3u2ahohrkzQBHHsU12alzCI4YkIXfFxNpYlNQd
	 LoK3+wWpTsZQi8dMrHRY9vrtDq6aS1hR1gQHaSuNiIrXuJrYeEjPyeueYA0Dt6myk8
	 OIRC5HAAdM3grHIy2jvXLG9yFZEmK9/+InI2Gq6LxwOAc0kacQoFvnTr+qzy7h+nkA
	 rV2SElSMQ+j8hA+sGjDKwwfW2oILhqwlh5jAuatQcymbyQQpwFoLsemxd8PREfFCHO
	 aP1xDghf5tQ1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 07/11] media: qcom: camss: vfe: Add support for VFE
 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, media-ci@linuxtv.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20261003-kaanapali-camss-v18-7-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-7-87ba4ebe0db1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 09:21:29 +0000
Message-Id: <20261003092130.7930D1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] camss: out-of-bounds DMA due to AUP_UPDATE mismatch
--

commit cd020a472f6ce917268a88da4eeb7a4d0642ace1
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: vfe: Add support for VFE 1080

This commit adds support for the Video Front End (VFE) 1080 module found on
the Kaanapali SoC.

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765f..3acef6ba97dc9 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
[ ... ]
> @@ -552,7 +554,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
>  		output->gen2.active_num++;
>  		ops->vfe_wm_update(vfe, output->wm_idx[0],
>  				   output->buf[i]->addr[0], line);
> -		ops->reg_update(vfe, line->id);
> +
> +		if (!vfe->res->reg_update_after_csid_config)
> +			ops->reg_update(vfe, line->id);
>  	}

[Severity: High]
Does this code handle the case where userspace queues fewer than 2 buffers?

If fewer than 2 buffers are queued, the loop above breaks early when=20
vfe_buf_get_pending() returns NULL, leaving active_num < 2 without returnin=
g=20
an error.

The commit message notes that "the number of AUP_UPDATE requests must match=
=20
the number of buffers queued to the write master while it is being enabled."

However, if we proceed with active_num < 2, the pipeline start continues, a=
nd=20
csid_configure_stream() in camss-csid-1080.c will unconditionally issue=20
CAMSS_INIT_BUF_COUNT (2) AUP updates:

drivers/media/platform/qcom/camss/camss-csid-1080.c:csid_configure_stream()=
 {
	...
	for (k =3D 0; k < CAMSS_INIT_BUF_COUNT; k++)
		__csid_aup_update(csid, i);
	...
}

Could this mismatch between AUP updates and actually queued buffers lead to=
=20
the VFE write master hardware attempting out-of-bounds DMA to uninitialized=
=20
addresses and causing memory corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003-kaanapali-=
camss-v18-0-87ba4ebe0db1@oss.qualcomm.com?part=3D7
