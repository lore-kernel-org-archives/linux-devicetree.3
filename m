Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C2538F92D
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974014; cv=none; b=Cm99/OzxCcuRWjX0S8n7AUvCKHaDSkelQoU28gDajmEC3lxEE0Z/g7n7f2ReJOREzLIvfgrqA6ZZyj5CbRx0L+Fv7mm+8Spdf37kVG95WBKKHiwhPWX52zu3iJ/KgeW93Rh1r70YhJthAINn4vZcznxOC2kXk1OfbsDeUCkaBow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974014; c=relaxed/simple;
	bh=I7NhiAYsf2C/LfFM+omqGp9Id1WNyg7n5w43slUQMA4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q3emadF130qnJo8HfjEmobG/4TgpTIIX/na0E0jYU7JJRz1Gu4nDuZR8GuwSzqPcWdSD4iP1Cs1I13pJFFLYRpSEKVltFiFYYJC1NIw5ogiqS/H2UX+UivhMH/Md8bPrMNZLo246QPLs0rNA+GPsgEaJgFxbtfPrGGzBdzpQ29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SoSMbw9k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SoSMbw9k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FFD1F000FF;
	Mon, 21 Sep 2026 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789974005;
	bh=ytDoCDtmJ2Lf+oTUkMKDPXWbDzG8zfd1jmrWuh6fyEI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SoSMbw9k8TBRizgh1+9pgPa8x5DwzzNQ+mwqcGjBL1cKqsmdwQuyj2Mtdh/a555c8
	 xfOFY/Yn+ySrmN1O4krTSfe3bGUceUjOJaCSa0ny4gp5z2quLZXT3iguk7zHOj1Bkm
	 WOUkboj+/tnHtz5F0VCmKmHqsfuZy+fPICvpY5pW1M856M/Z+mTySEC+kp6bEM1RYL
	 etCATybEiFLwy+fLblcgh1qQJTka6fN8B/uldRl+99PxpK66qqX6Y5q1nbkeZua8Rx
	 uObZDiNN4aBr+PiCGRHuEiiWEu5rrubP83EQ3TRmEdeH+/gj/rOcEZhETkIqpz3Epx
	 vrbJVDqaX5/9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: add few more SOC IDs for
 IPQ5210 family
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921-ipq52xx_new_ids-v1-2-63d68a11bbff@oss.qualcomm.com>
References: <20260921-ipq52xx_new_ids-v1-0-63d68a11bbff@oss.qualcomm.com>
 <20260921-ipq52xx_new_ids-v1-2-63d68a11bbff@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:00:04 +0000
Message-Id: <20260921070005.27FFD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] qcom-cpufreq: kernel panic on boot for new IPQ5210 SoCs
--

commit 9ff7f8e096f96a22381e41ab225a2e460fe769da
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

soc: qcom: socinfo: add few more SOC IDs for IPQ5210 family

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. This comm=
it
adds the SoC IDs for them to the socinfo driver.

> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 63ee5cd561a29..4e7e14fe72317 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -558,6 +558,8 @@ static const struct soc_id soc_id[] =3D {
>  	{ qcom_board_id(IPQ9630) },
>  	{ qcom_board_id(IPQ9640) },
>  	{ qcom_board_id(IPQ9670) },
> +	{ qcom_board_id(QCF3211) },
> +	{ qcom_board_id(IPQ5211) },

[Severity: High]
Could this lead to a kernel panic during boot on these new SoCs?=20

When the qcom-cpufreq-nvmem driver probes, it calls
qcom_cpufreq_kryo_name_version() which checks the SoC ID. Since QCOM_ID_QCF=
3211
and QCOM_ID_IPQ5211 are not handled in its switch statement, execution
appears to fall through to the default case:

drivers/cpufreq/qcom-cpufreq-nvmem.c:qcom_cpufreq_kryo_name_version() {
...
	switch (msm_id) {
...
	case QCOM_ID_IPQ5200:
	case QCOM_ID_IPQ5210:
	case QCOM_ID_QCF2200:
	case QCOM_ID_QCF3200:
	case QCOM_ID_QCF3210:
		drv->versions =3D (*speedbin =3D=3D 0xcd) ? BIT(1) : BIT(0);
		break;
...
	default:
		BUG();
		break;
	}
...
}

Does qcom-cpufreq-nvmem.c need to be updated alongside this change to handle
the newly added IDs and prevent triggering this BUG() trap?

>  };
> =20
>  static const char *socinfo_machine(struct device *dev, unsigned int id)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-ipq52xx_ne=
w_ids-v1-0-63d68a11bbff@oss.qualcomm.com?part=3D2
