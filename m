Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424496;
	b=GBEpW4KsRiI5Bxk7tcT+x7VCVqwwQI/dAre6SnR70o19KAkocAjNtDLE5EZrIQIOQvZK
	 eQrA7Y3MF/lg0aPxiSTc5TXg2d2S9EzoJo05OSe9QWJrCBl09bylaPo8E8Qf9bguqjI1e
	 Ajxs/ua5ZyfoUfPHv0jG6e1RcJGp4g1NQMHdJVOvXsJJjAepALq9bNj42/MhM6FOj/E1L
	 t7arGH/uiUl6OCR+WEFoBInIt/lD1joXQUy5u30EmHDtwGkUgKhX1LAs+wbZgqaAqD2PZ
	 A3KsO783i8TZoCQuLn9vEb00heqpFZU4jNGAyJ5xFjTPEHOrRGRv1uj2qVtd2stx87A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424496;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LVuQe7q6HekjQJUOHTB1a3xtTIr4EkVsXRtd+BKG2do=;
	b=0tM9WYtebP0ORFsp+TyAbuKs89x8XGOMwOiEWfVBOtoKYHtbWutNw+KwgZ8hFujhMsDa
	 H79kEFCsvcYJ6R8kRS5E5g15nvUG9Wvg0abhdVL//wukQEZITE+t4p6FV7wgf644nh14i
	 JZeyym3gz3PTQIxvxzhROGPa8//0fpwPMQnDXwmt3QvEFFrRhVex7gd8HJvW0gF6gMXbG
	 4s0vNC3cE1RpqKUtvTEgY2whDXelwegCFfm6YWJNPCeZ75RHPWMIQBjRE2ImkD/bkDz12
	 rxja2U4cTY7kXRNcrIGMp3eXZXdNPRO0q4/IvJpMF2lmglvwZSPVPBFuGX7+bU3jxBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cujZ9MPr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0FF60705E4
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cujZ9MPr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1131F000C4;
	Mon, 19 Oct 2026 15:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424496;
	bh=LVuQe7q6HekjQJUOHTB1a3xtTIr4EkVsXRtd+BKG2do=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cujZ9MPrw/yZMXdpJGEiPYyzA7w1Nr1ITCf4u/QFtEDdVLNCRZl45oitfmOP6/Wx+
	 Skt5WkO4V1L2UN7RKazzvcFQ5prmY14OpdLnrH9EfiHmjqNKRgcV4TM9Gkahz6I0jd
	 mIQjNWDu96oyLGwOOSWl7pT3DHk2/gDxRCB5WSWLVzcH6XX3+Z4bYEfLzHqDPmJaAL
	 QUMrQN12bGIYT7geauVhkmv9FNnD5/uTbiEzHIf/t+CNK+WP8dZPe5Ak2NKdqmsLjk
	 alSEipNifyriVOALXV6ELAcQL9zdI2i0RTrlrJv/H/wEkIrdCHUdM6m+m3CGGOy/7J
	 f70JabY+oon2g==
Message-ID: <sashiko-outbox-177780@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] interconnect: qcom: icc-rpm: depopulate SMD RPM
 child NoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-msm8998-icc-v1-3-c2da3934b6c8@oss.qualcomm.com>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-3-c2da3934b6c8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:41:35 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] interconnect: qcom: icc-rpm: WARN_ON() in qnoc_remove() for chil=
dless NoCs
--

commit e3eed275bb16fc9fb22f00c7b7dd10e369c4c8ab
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

interconnect: qcom: icc-rpm: depopulate SMD RPM child NoCs

This commit replaces of_platform_populate() in qnoc_probe() with
devm_of_platform_populate() and calls devm_of_platform_depopulate() in
qnoc_remove() to clean up child NoC devices before tearing down the parent
provider.

> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/q=
com/icc-rpm.c
> index 6f325789a96ea..ddc7df31ed331 100644
> --- a/drivers/interconnect/qcom/icc-rpm.c
> +++ b/drivers/interconnect/qcom/icc-rpm.c
> @@ -677,7 +677,7 @@ int qnoc_probe(struct platform_device *pdev)
> =20
>  	/* Populate child NoC devices if any */
>  	if (of_get_child_count(dev->of_node) > 0) {
> -		ret =3D of_platform_populate(dev->of_node, NULL, NULL, dev);
> +		ret =3D devm_of_platform_populate(dev);
>  		if (ret)
>  			goto err_deregister_provider;
>  	}
> @@ -699,6 +699,7 @@ void qnoc_remove(struct platform_device *pdev)
>  {
>  	struct qcom_icc_provider *qp =3D platform_get_drvdata(pdev);
> =20
> +	devm_of_platform_depopulate(&pdev->dev);
>  	icc_provider_deregister(&qp->provider);
>  	icc_nodes_remove(&qp->provider);
>  	clk_disable_unprepare(qp->bus_clk);

[Severity: Medium]
Will calling devm_of_platform_depopulate() unconditionally in qnoc_remove()
trigger a WARN_ON() when unbinding a NoC device without child nodes (or when
depopulating the child NoC devices themselves)?

In qnoc_probe(), devm_of_platform_populate() is only called when
of_get_child_count(dev->of_node) > 0. For any NoC device with 0 children, no
devm_of_platform_populate_release devres action is registered.

When qnoc_remove() later calls devm_of_platform_depopulate(&pdev->dev) on
such a device, devres_release() returns -ENOENT and triggers WARN_ON(ret):

drivers/of/platform.c:devm_of_platform_depopulate() {
	int ret;

	ret =3D devres_release(dev, devm_of_platform_populate_release,
			     devm_of_platform_match, dev);

	WARN_ON(ret);
}

Should devm_of_platform_depopulate() also be guarded, or could
devm_of_platform_populate() be called unconditionally (or
of_platform_populate() / of_platform_depopulate() used directly)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-msm8998-ic=
c-v1-0-c2da3934b6c8@oss.qualcomm.com?part=3D3
