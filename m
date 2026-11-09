Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230396;
	b=VNMXEaYA4NYQyYLOKij6EWDGnjWXWnPbhiDNhJlHiishwolBiglVMCF0sUPSpO52zU9Y
	 h9xZqZmA2vFOwnTDbbby7sCRR2b1ZvNcOBWJrYLlNpRnGiFlVmofPv/CHMusvV3Ia4BrG
	 YZ4gDdxX/4ojFTyEhUHZPwYIafTX++i4jsx2bB/+WREhvZnJmpdZcB5W0SY2GK+GPE+AV
	 NapUg0EQfv9XEGdFaDRPF+NQaWEUiFaJUrwqwjLizsXAqSRJ5LDQjbG54L9TfCDTB+svS
	 2NgZ5tfULL0Pv0nvNLBeCHJK4tT5CGbq4AhhuF19Gn94jRswx63nDmZIMrrgoZ0my5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230396;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3FnSqJrWS4ELvCje4YSdQSTgDxIv4smkvAP12RFB0Mg=;
	b=ECJzijPq2dNHFVkLJ/PD0lz+DATlmwTuCquBLqwp1YYgJoYIgEux5FNie/oPnKrCoxzQ
	 z3UvAgazKZHvVrJ605+YNMVi4i0XBMUh+oEAygGI+q3LbE2j2iGPEvOx54h82+9PTztks
	 I+cygtgEI/puhChrijg7nYS0ar94yyvnQ6WLYfmlQ17ywBOCOBD6dkzfZMeVgzkRQGITH
	 jgqCt4XQdKQj8jyyFO2GVIDo9ITbHXRAH6fzopCJiP6E9KVv2QxqguB7mjUiFsIB9XZgz
	 D2kmAVhIcAHzTEtPUY9e7XnEgFWWPhGbcAicKHOLiVZuUY24Y1tqG/wG7gV9254+spw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aeVBxNZE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0671606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aeVBxNZE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4E01F008A2;
	Mon,  9 Nov 2026 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230395;
	bh=3FnSqJrWS4ELvCje4YSdQSTgDxIv4smkvAP12RFB0Mg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aeVBxNZE96jWTqV55VPhkD5eh9XUlPbc0rvwdrQfLLqs7jYeByXC8QKxtPnZVPbpj
	 FGXiSNGM866W1HRo3aHmMCvj1vBQR9WmGmHieGk/i3eJont5FqGrF4awx3RgB29i7T
	 aMd8sBW7LCkEMsOKmqA8fHsjMdWwENZCFMlN3LKV7j+qlul1kabwqt1FQZJ9mJL3WT
	 j2dwVF41s2fdfgOs7kvXvSkFMRUT+raIx9MH4KZ8PLOk1NtoWlOHvuTKts6jgJN8pv
	 LFYgwlBCPSUXH3T9ag4LODUOc+Zt9GqkIPB6MrNkdCMQ7rBXMMeD2BBJy0jawIYWV+
	 aiC+1DbbGEcoQ==
Message-ID: <sashiko-outbox-205003@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/10] arm64: dts: qcom: lemans: Add support for
 TSCSS node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108-tscss-v2-6-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-6-d5f575010427@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 13:19:54 +0000
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
- [Medium] arm64: dts: qcom: lemans: missing CX power-domain and OPP in
  ptp@1c80000
--

commit 75dd9885f6f6ae470214655cb90edbd903d34847
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

arm64: dts: qcom: lemans: Add support for TSCSS node

This commit adds the Timestamp Counter Subsystem node to the Qualcomm
Lemans SoC devicetree.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 1fdb72fa55184..4c76c820cacb1 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -3022,6 +3022,18 @@ pcie1_phy: phy@1c14000 {
>  			status =3D "disabled";
>  		};
> =20
> +		ptp@1c80000 {
> +			compatible =3D "qcom,sa8775p-tscss";
> +			reg =3D <0x0 0x01c80000 0x0 0x2000>;
> +			reg-names =3D "tsc";
> +			clocks =3D <&gcc GCC_TSCSS_AHB_CLK>,
> +				 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
> +				 <&gcc GCC_TSCSS_ETU_CLK>;
> +			clock-names =3D "ahb", "cntr", "etu";
> +			assigned-clocks =3D <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
> +			assigned-clock-rates =3D <15625000>;
> +		};

[Severity: Medium]
As reported by Konrad Dybcio on v1 [1], does ptp@1c80000 need
power-domains =3D <&rpmhpd SA8775P_CX> and
required-opps =3D <&rpmhpd_opp_svs_l1>?

Running the counter clock at 15.625 MHz requires the rpmhpd_opp_svs_l1
performance state, and rpmhpd_opp_table defines rpmhpd_opp_min_svs,
rpmhpd_opp_low_svs, and rpmhpd_opp_svs below it.  Once rpmhpd_sync_state()
completes, the CX power domain can drop to one of those lower corners when
other consumers vote lower levels or are idle, operating the counter clock
below its required voltage corner.

[1] https://lore.kernel.org/r/a93f11c5-d0cf-4acd-a959-53fecc996e5f@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-tscss-v2-0=
-d5f575010427@oss.qualcomm.com?part=3D6
