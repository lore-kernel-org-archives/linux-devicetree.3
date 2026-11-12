Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516881;
	b=dpLn08EVbi6phuDhqmZwzsqoBQwdl4k57f5scNx4a599eIBS9Lt0RYUNjMH1SLUAkkSQ
	 2gPgTl4HKHqmv3zbvaX2XcxxlI+Ldlrkl/cEWS13vn/+g1BLB31MP/x8rFKtNunqjZz6P
	 a8mbSIVam3O2XGTwd2JKDoknLRSDXvzXtVBfjU9JHeLUAUiZbALEMWoUOaN2ufBL307dR
	 ZRuBA+My5Tf7ku4vIztBmOfO4MFOFn7WYudM+l8wq6OFLeqMFekxTD0X0HEZs3UB4kzQJ
	 On9xVyx1iiczp3UCymSzzqPDKxmfpeBOP+hNyQYAY7MryZtYaQXrof7nUlL3EG9Rjmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516881;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nfEr9Ed0xKrPaObuDRA9OLvKeoZjdTFQ1VEH15DAVSE=;
	b=bab9vwcowEmolD2dHI2USzYh+r6YAF1nQ7BL8TKUWU7nPyezyPgQ10ZVX98zVmrLjQ2I
	 TPd/3TyjvliLvvTRsW+2csGP1P9s9Qy1HQaQd4HIDOmec6ozkUD/35t3Vs0jiaVx2vlyQ
	 4OwHaFw/KJpCRk55byR0Uch2hRHezuRAWLDj7mJpI8rQ00magKEFPTNskZrGh6RlvYPJH
	 pMQlwqa8X6rbMsUt5GMqyXb99ro3kFz+JAlpFhlXbbiJuGvbgsCv45CFHPtdGM+MP38Iq
	 x0GK+5qZ9lKXDY9zZa3ZWGfbCzJhlamvhk47rM6sQ+j94M6XEZ9L69UOWd9zQSFhF5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MluUweb9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A28606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 20:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MluUweb9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151DD1F000C4;
	Thu, 12 Nov 2026 20:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794516881;
	bh=nfEr9Ed0xKrPaObuDRA9OLvKeoZjdTFQ1VEH15DAVSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MluUweb9YwlpE9fNyNTnTcecb1nFNX501J+kldVLm286+R1lk/HE7f8QBPyybyopC
	 KgYWmST5D7EV+1YvChEBHvffCOKi6dATaDbtUZfGiOZvNMQwUWTaBj4AaAYhBmfTpY
	 pFbGayWtYAoNAsPPUIze6tKjHjLojtvN2iHR2iakZYlCqjrjgIfLt0lDACw/pu55r7
	 UbrqdSsnkFrBVEykrotElSyqMP/iVMOtgzMfTVANXebCxj2ttiqFXTpyhZWjzSVx2n
	 IvuGYTQ2OAFbNO7DhFBAAzl5iv/ozEjMXVUsYGRMfQfMuoimTSXg4bcxFAcRYecH4S
	 mEc9cPGTs0ORg==
Message-ID: <sashiko-outbox-211833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Weiss" <luca.weiss@fairphone.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-book2go-v2-1-12691134e34e@fairphone.com>
References: <20261112-book2go-v2-1-12691134e34e@fairphone.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 20:54:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: missing qcom,vmid property in recreated
  rmtfs_mem node
--

commit b1d940dc3b330b7fb51fb7db7589ce050a146ccf
Author: Jasper Korten <jja2000@gmail.com>

arm64: dts: qcom: Add Samsung Galaxy Book2 Go

This commit adds initial device tree support for the Samsung Galaxy Book2
Go laptop based on the Qualcomm SC7280 SoC.

> diff --git a/arch/arm64/boot/dts/qcom/sc7280-samsung-galaxy-book2-go.dts =
b/arch/arm64/boot/dts/qcom/sc7280-samsung-galaxy-book2-go.dts
> new file mode 100644
> index 0000000000000..51f0a92d0026b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-samsung-galaxy-book2-go.dts
> @@ -0,0 +1,644 @@

[ ... ]

> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &rmtfs_mem;
> +/delete-node/ &wpss_mem;
> +/delete-node/ &xbl_mem;

[ ... ]

> +	reserved-memory {
> +		wpss_mem: wpss@84800000 {
> +			reg =3D <0x0 0x84800000 0x0 0x1900000>;
> +			no-map;
> +		};
> +
> +		rmtfs_mem: rmtfs@a0800000 {
> +			compatible =3D "qcom,rmtfs-mem";
> +			reg =3D <0x0 0xa0800000 0x0 0x300000>;
> +			no-map;
> +
> +			qcom,client-id =3D <1>;
> +		};

[Severity: Medium]
Should the recreated rmtfs_mem node keep qcom,vmid =3D <QCOM_SCM_VMID_MSS_M=
SA>
from kodiak.dtsi?

Deleting &rmtfs_mem and recreating it without qcom,vmid causes
qcom_rmtfs_mem_probe() to skip qcom_scm_assign_mem(), which leaves the
RMTFS buffer unassigned to the modem in the hypervisor stage-2 page tables
unless the boot firmware already assigned it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-book2go-v2=
-1-12691134e34e@fairphone.com?part=3D1
