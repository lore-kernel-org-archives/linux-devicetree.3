Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7493B3880;
	Mon, 23 Mar 2026 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276722; cv=none; b=ZMcn5AvJkPOZHH2FqvnCfHh8uBqSIU/cCrlgmcEsGUahxnqFyOi7kfhvK7dsvHkUnFovU8nQiFHkY1gUzHIjLR/4RUh0yRYWHc9tAdaoxS1pNFcl4CXEb9yleW3g3UDOZfnUj23g3uGy0sIp35NcEcxWuNblTta7VxjcYdyvcc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276722; c=relaxed/simple;
	bh=gxfPLso+wf89CMq29ry26h6Fu8oblPqNah4mDG/Vks0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hChcndbJBYX5h3JTrMbuMPBt/BcAxUnLGewS88Rk/Z6DMhhkvLBPSEbhkSidfPrCLleyKOj3qNKIxSk+oM3JFZRkW2luparphvdbglvwmiRKPf9NiPQVzio2TILGh1mNliinA5+dWTAzjbz2yKcPMGM/PS3YHqmLwB/QrE6qH/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqhE3rT5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqhE3rT5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D7BC4CEF7;
	Mon, 23 Mar 2026 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276722;
	bh=gxfPLso+wf89CMq29ry26h6Fu8oblPqNah4mDG/Vks0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sqhE3rT5picMnfdQe1ufFQrr11fqjeKE79fm3NtrwW52ClWzVvqnfwC4dWJmQmyW9
	 uXpcCRpd01xxv52vRTvgTl7NYS0NQAGK23Y+Kp7/TikjuNrEwb4e5PB+GTLDUwsp5a
	 DIpexO5EEQfwXcrunoDHrhKgjgtCfxF56LwuAUKN6jad8+YdyKpALBDOwIzQIHHiK9
	 YmZRbKkJx8ky8vPNsdGVPfG1pK7h3saleK7cg+vAQ5br1ImhvxAqi8RB8lDiDsGmVa
	 SKEYjDNEwzp6ZcPrMo2M2zacHulj5W07Y0V0L9tkIc0qr0HEW4wtTmyYUFGSJ+M9+Y
	 jpQpFOdEFUIiA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Zijun Hu <zijun.hu@oss.qualcomm.com>,
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: kaanapali: Add PMIC dependent features
Date: Mon, 23 Mar 2026 09:38:24 -0500
Message-ID: <177427670530.11515.15866642216934679119.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 22 Mar 2026 23:19:40 -0700, Jingyi Wang wrote:
> Add PMIC dependent features on the Kaanapali Platform including:
> - spmi-pmic-arb device
> - various PMICs along with temp-alarm and GPIO nodes
> - Volume Keys, RGB LEDs and flash LEDs
> - bluetooth WCN785x and Wi-Fi (enabled on MTP only)
> - Display (enabled on MTP only)
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: kaanapali: Add PMIC devices
      commit: 8914cc8ab0b3dbfef56100aa3bd49c7137d6feb7
[2/6] arm64: dts: qcom: kaanapali-mtp: Add PMIC support
      commit: d5b236e796c4c6922259b801a58831f8f568d31a
[3/6] arm64: dts: qcom: kaanapali-qrd: Add PMIC support
      commit: 141ae09ec1200b548a15e11fc771cbf937d01d36
[4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and Wifi
      commit: 27139dce7291f9ad233c00a72780db318b5b6de8
[5/6] arm64: dts: qcom: kaanapali: add display hardware devices
      commit: 52096f3d3f6caf88686b8cf17911225495cbe5d2
[6/6] arm64: dts: qcom: kaanapali-mtp: Enable display DSI devices
      commit: a1a975530cab22b06c8ee2994c64b36eba193220

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
