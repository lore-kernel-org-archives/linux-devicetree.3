Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2FE42DA5A;
	Wed,  8 Jul 2026 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522669; cv=none; b=PEa7ndBSvEcEZom4c9IjDcyOUc6unw6//i2wy/9GYxHA98dkDYTabqleczaUZj38o6jpnIgKn2uE+bSEZjyT1ox/4K+XK3RE7MfG/qfNucy1+DxR0qLFFyPA82Vt5czQ0rPE3hc/6Y9aDfgVW9Z+gbUsYjAPnnBtXOg6QG1ybdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522669; c=relaxed/simple;
	bh=LItOOZnqvjoUn5Y78ySggl1JTBMTJHKdwHO/ognsYsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U4IZJ8G/rcAlz3EBG2pC+iOz9hemmyBMAGZaFqJdguTRZBrdHow5kd1H65Z3N2/IZRR5cS0aBcQh5VW+OchPwQ4eB30yBV/EkamSsZWxviUDUyXeQlZgnqbUoBBHdp9238bMFkf9qPr+PxgdCT7F2l/9VM5/O6VqFHVOF6QTqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AN+8o1/i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AN+8o1/i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB7A1F00A3A;
	Wed,  8 Jul 2026 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522668;
	bh=Vb2pB62EmI8Hw1cgHKe8iq19Tzvpy6I/2EMSnkaAwVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AN+8o1/ieOgs+5vQlat1T1I5hNTgUqNx1tcBK1Zuv0qf5yi8y+Br+ER8DwX/ICk4G
	 n7liJsTse4WfjFCuDLGyYvBRJgEnabCbmLsaqYHHv3r0VyZ7ttH7t0O1TUaFHWTufI
	 irp4XvZZFYFyqg06D5G8t7ellM82fdmzLCsWSMzqQQwIXryfjHABooKfGF+I5NezmX
	 pyL8tZ6tG829diBtz0Vys8+G9FHN6pyfHeLUPDqBO0/aLmz9z24LlZFOmqi8zlCF0t
	 C9L8wWCN0J9OzjVD00bZVLblMBKpHNcufXeqKWDdgfBnie7ODsXxrtmJnsQ55BUX0o
	 /GOJsna/e4UMA==
From: Bjorn Andersson <andersson@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/24] dt-bindings/dts: qcom: Fix PDC OS Direct Resource Voter region window size
Date: Wed,  8 Jul 2026 09:56:49 -0500
Message-ID: <178352261608.2235436.5006981625861359346.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 27 May 2026 15:13:05 +0530, Mukesh Ojha wrote:
> The Qualcomm PDC (Power Domain Controller) hardware exposes multiple
> Direct Resource Voter (DRV) regions, each 0x10000 bytes in size, where
> each region serves a specific system client like TZ, HYP, OS etc. Linux
> only needs access to the OS DRV region.
> 
> Despite this, most platform DTS files described the PDC reg window as
> 0x30000 bytes three DRV regions which was wider than necessary and
> matched the driver's QCOM_PDC_SIZE ioremap clamp introduced as a
> workaround for early sm8150 DTs that under-reported the window.
> 
> [...]

Applied, thanks!

[02/24] arm64: dts: qcom: sdm845: Reduce OS PDC DRV span to 0x10000
        commit: 054a4ba10d02ee3a03ae71fd0fe4463794df973b
[03/24] arm64: dts: qcom: sdm670: Reduce OS PDC DRV span to 0x10000
        commit: 5474c37216819283bccef8bfdba998bd4e15f9bf
[04/24] arm64: dts: qcom: sc7180: Reduce OS PDC DRV span to 0x10000
        commit: fb537f6b472785ac47c93565e746aed219f8aa17
[05/24] arm64: dts: qcom: sc7280: Reduce OS PDC DRV span to 0x10000
        commit: 82bcc4504f24100b86500843d4ac2e723e940052
[06/24] arm64: dts: qcom: sc8180x: Reduce OS PDC DRV span to 0x10000
        commit: 75a65b596d3aed11c398127bbb241560a9365205
[07/24] arm64: dts: qcom: sm8150: Reduce OS PDC DRV span to 0x10000
        commit: adf6aaa7afa618016daa64cb76afc8dad06c6e94
[08/24] arm64: dts: qcom: sc8280xp: Reduce OS PDC DRV span to 0x10000
        commit: 713ae69ac61195b557633f709d94a8d959b5babd
[09/24] arm64: dts: qcom: sm8250: Reduce OS PDC DRV span to 0x10000
        commit: f70d152b66cc8730b1a226a38bee90aa0e8ed608
[10/24] arm64: dts: qcom: sm8350: Reduce OS PDC DRV span to 0x10000
        commit: 39be29e1f8440b532ac8ef8e6f33ae2a7074a0f1
[11/24] arm64: dts: qcom: sm8450: Reduce OS PDC DRV span to 0x10000
        commit: 987150965d14d86b0b2c865069cfc74275d56220
[12/24] arm64: dts: qcom: sm8550: Reduce OS PDC DRV span to 0x10000
        commit: 02f185df7dec96031a5139b4273fc21c652fe7e9
[13/24] arm64: dts: qcom: sm8650: Reduce OS PDC DRV span to 0x10000
        commit: ce4014c270718611b9ad11f8c98c518fafdb1617
[14/24] arm64: dts: qcom: sm4450: Reduce OS PDC DRV span to 0x10000
        commit: 31cbb1901bd332dbfd7503f20251e604dcd6d4a5
[15/24] arm64: dts: qcom: x1e80100: Reduce OS PDC DRV span to 0x10000
        commit: c39df6b350ef51a9374fbd7c399a56b563be8deb
[16/24] arm64: dts: qcom: sm6350: Reduce OS PDC DRV span to 0x10000
        commit: 3d8497841d4c831ba313c1ba0b8bbad554edc72f
[17/24] arm64: dts: qcom: sar2130p: Reduce OS PDC DRV span to 0x10000
        commit: 3e7c9c6b4deaf647c46308fdb6d0f71e74c402b1
[18/24] arm64: dts: qcom: talos: Reduce OS PDC DRV span to 0x10000
        commit: 0e89a53d7cc5f0827202137211740f7452d16dc4
[19/24] arm64: dts: qcom: monaco: Reduce OS PDC DRV span to 0x10000
        commit: f69294f2cf6f59693c62e2ef30ceaadbd17c1e6b
[20/24] arm64: dts: qcom: lemans: Reduce OS PDC DRV span to 0x10000
        commit: 9693db25077ae8ec29702b55126e13540ca9a09e
[21/24] arm64: dts: qcom: sdx75: Reduce OS PDC DRV span to 0x10000
        commit: 152ca0d83314f72a0f56d200e604190c47f801ef
[22/24] arm64: dts: qcom: milos: Reduce OS PDC DRV span to 0x10000
        commit: 008bf7c2b6ae7a5ff82089a45830bd73a980dcb4
[23/24] arm64: dts: qcom: qdu1000: Reduce OS PDC DRV span to 0x10000
        commit: b10afe4618f36aff99f3495da44f6a05a2a3dbb2
[24/24] arm64: dts: qcom: eliza: Reduce OS PDC DRV span to 0x10000
        commit: 9c10f67778541fef41a35374ac7f5ffe1b928561

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
