Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626712B94
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122110; cv=none; b=UbsAHpfSj5rxYfRo6ns3KRS+1NUNS5quvkw93ArIvvUjhpZ2NgLDykXnXhGq8fsRsH+92O4JljfKbLizIpNWDG3pGKFKLD2Nw3bUmCHg3b7YHPxA0KGFwq1Gq75f+NtQKA2B/9SIS9o7gn3pntVAhtbHGkXqfRFooB7vcGTFHCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122110; c=relaxed/simple;
	bh=Xz1lLz3FcboExwP4ukfou8RbTpGpdImVzWU0oQ9cOGo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=F242iSn0eydnng5ijMJB9Zza14uF16aEMfoQwEGmqeSKYjeynV/BjfXGmpAkqVaIkaC2C2tsy7fb7vfWzRL4QF6qKJgFvH3hMAT0xdo8oVnVPeeRIOqRpZP1fimZeEIVCwWU4Rkbof1cuCa/7TGvc8JMabSiWCjj1rhD52X05ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akdpy+Pa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akdpy+Pa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AEA1F000C4;
	Fri, 16 Oct 2026 03:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792122109;
	bh=wwM15vMuWgSsKyABxVf9XVS0gdijDzYBtlPX0Ap3tew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=akdpy+PasDwGpUYQtvErERmXgkgAWX4ptgDwFiZQrWOUh+IvKtWkL+6f8WW1QAmBW
	 va1kM2IXQQtsn3XWwuaSvrfrWCzKc/c3Vg2kJ/cdK+jjCpNzPRPr0Y4SrhZpQKQG7o
	 QKrviMJ+ym8acAL2oVJaAOKTmTiL++98yoSwTVXMX9JfRUHF9RQiWvixXS1H4jp8lX
	 Uf24ivI7HgWss7D2Jq5YJomXoxWNjmiODv10RQIqm8gjRu+LulbQkDqWzOJTnSu9N1
	 fpqpootJZt78cK9KgCEF4HRxcxcglAUrJfW453z4JyKtKP9BGWSRy8ir6ODdQ33hPN
	 /rV6gNDZhU4ZQ==
Message-ID: <sashiko-outbox-173693@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next v2 03/17] wifi: ath12k: Add hardware parameter
 for QCN6432
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaradhana Sahu" <aaradhana.sahu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-mpp-bringup-v2-3-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-3-f510c33bfcf5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 03:41:48 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] wifi: ath12k: missing qmi_max_chunk_size for QCN6432 breaks memo=
ry allocation fallback
--

commit 417c2f74682574a9e982b5753b7747e20b63cda7
Author: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

wifi: ath12k: Add hardware parameter for QCN6432

This commit adds hardware parameters for the QCN6432 WiFi device in the ath=
12k
driver. It introduces a new hardware revision definition and configures the
ath12k_hw_params structure for QCN6432 by reusing parameters from IPQ5332 a=
nd
QCN9274.

> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wir=
eless/ath/ath12k/wifi7/hw.c
> index b1c17cc197dfd..494c7b3ae1acf 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -906,6 +906,91 @@ static const struct ath12k_hw_params ath12k_wifi7_hw=
_params[] =3D {

[ ... ]

>  	},
> +	{
> +		.name =3D "qcn6432 hw1.0",
> +		.hw_rev =3D ATH12K_HW_QCN6432_HW10,

[Severity: Medium]
Does this struct initialization need to include .qmi_max_chunk_size?

If .qmi_max_chunk_size is not initialized, it will default to 0. During
firmware memory allocation in ath12k_qmi_alloc_chunk(), if
dma_alloc_coherent() fails, the driver falls back based on this threshold:

	if (!vaddr) {
		if (chunk->size > ab->hw_params->qmi_max_chunk_size) {
			ab->qmi.target_mem_delayed =3D true;
			...
			ath12k_qmi_free_target_mem_chunk(ab);
			return -EAGAIN;
		}
		...
		return -ENOMEM;
	}

Because qmi_max_chunk_size is 0, any failed chunk size will be strictly
greater than 0. Will this cause the driver to indefinitely return -EAGAIN,
asking the firmware to supply progressively smaller chunk requests, rather
than correctly terminating the failing QMI negotiation with -ENOMEM?

> +		.fw =3D {
> +			.dir =3D "QCN6432/hw1.0",
> +			.board_size =3D 256 * 1024,
> +			.cal_offset =3D 128 * 1024,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-mpp-bringu=
p-v2-0-f510c33bfcf5@oss.qualcomm.com?part=3D3
