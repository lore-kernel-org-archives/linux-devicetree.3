Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC04257435
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552259; cv=none; b=St0x1RHK6Lc5Hd6dW7wDHfJeFaYvOsEFQT5DdaZUrcAvck7qE1eiftk/QBQaK713Zl5u2Qkv6CjXzslUFKsMTu1YewpGCIDhXESiyLOfZMGCm4nPOJVaQdn68zc9lY0RZNAl2QPHlImONe9EMqusbR8pyTRfrg9DEFj5Dxw7BDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552259; c=relaxed/simple;
	bh=66P9cV0YfwWRpmwvfxY0JrUvcpwN4IjbiM0vmrk5YJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hv/5/iZ0XovI77SbiJKu3UG9Qj11VQI1hHHd+o3qCFm3yMxeumuHziBNQYkJSEy2y+aEhLmKP6oqOwzXb/0k3Ai0Y1224K9JJtf3X7RAm2YnysBnEevOo1ATQiw4qQI9eI1kSYkygNbYoE2r8fOl3ctvEF9FyEZwux2zNOKq4QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwvlnX7X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwvlnX7X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06ABC2BCF5;
	Tue, 12 May 2026 02:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778552259;
	bh=66P9cV0YfwWRpmwvfxY0JrUvcpwN4IjbiM0vmrk5YJ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JwvlnX7XXmC/Fm8ZF1PSc/bTac3qq39+YCRqDN/ZwYnXnqwi++IamXcFzw1U446Cf
	 iUFFHA9Sz0fZ9eki+ChiJ19LIxnTE8uMmbFL2PdNib8imczhr08yjsXQacjtIF4NIg
	 FR+ChDz48xYQ+m/AwsfWMUyIvRQ18HMANZlEk40uP//d/LkXfYsIkoTmVzGMgfZFzj
	 rr11g+ZGFwu4dBpDLddaSDEjggCAfUb1qMfOSY73anRcuGZmdWU+NiP9bUuoBh6pnk
	 KUtgeOiPEF9haUdg8DlBfL2OAdiAbEi+AcyMlsEwusagbJq/NiTZGYfgySo2Yy/HCh
	 UYs+CLDwD56BQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add the download mode
 support
Reply-To: sashiko@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260511-ipq5210_dload_support-v1-1-5609c6b8330e@oss.qualcomm.com>
References: <20260511-ipq5210_dload_support-v1-1-5609c6b8330e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:17:38 +0000
Message-Id: <20260512021738.F06ABC2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit introduces a new compatible string `qcom,tcsr-ipq5210` f=
or the TCSR node in `ipq5210.dtsi` without adding it to the corresponding d=
evice tree binding schema (`Documentation/devicetree/bindings/mfd/qcom,tcsr=
.yaml`).
--

commit 9435d5db06195f6fe5ee397b1257dbedf5ed5ea2
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: add the download mode support

Enable support for download mode to collect RAM dumps in case
of system crash, facilitating post mortem analysis.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 3761eb03ab246..cd587eef00180 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
[ ... ]
> @@ -160,6 +161,11 @@ tcsr_mutex: hwlock@1905000 {
>  			#hwlock-cells =3D <1>;
>  		};
> =20
> +		tcsr: syscon@1937000 {
> +			compatible =3D "qcom,tcsr-ipq5210", "syscon";

Should this new compatible string also be added to the corresponding device
tree binding schema?=20

It appears that "qcom,tcsr-ipq5210" is not documented in
Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml, which might cause
dtbs_check validation to emit warnings about an undocumented compatible
string.

> +			reg =3D <0x0 0x01937000 0x0 0x2b000>;
> +		};
> +
>  		qupv3: geniqup@1ac0000 {
>  			compatible =3D "qcom,geni-se-qup";
>  			reg =3D <0x0 0x01ac0000 0x0 0x2000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-ipq5210_dl=
oad_support-v1-1-5609c6b8330e@oss.qualcomm.com?part=3D1
