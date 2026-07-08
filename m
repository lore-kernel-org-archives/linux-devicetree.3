Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40800437130;
	Wed,  8 Jul 2026 14:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522678; cv=none; b=NR7Ulr1UdCj7IUcWQGIM8UKedpFSz9PJFiq0O8jCBKeGQ+Jbr1UcXPQmt8Lsm+TTwhUwDetxzEyWHYB5RyFl48ep5ECXg0g1le25CEO6Gm7DxBLxPeWgAqhjJZGkeqEjqvRQcSiZYO9xLPvRdNOWFRiwUb52bpcOo420eQNVUHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522678; c=relaxed/simple;
	bh=w6kFCr2gkvLCp6zPrBGKfYafHJOx14HdMyBeg8s4+5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQIuLJO45UsrVm6c3G9qYQe8VNSqqFwPaPbgLJIeWzm0BE1LOnYDzeBeSk2g8fCDihL7ow+BBOdcY7U/zANvHyeY0S03uUg3VDYrw9gXGsVnSYILjq1s3ycqYO1QG/1Xq73npZjIyFC1/z7F5lDFQrJgER9wNGkwrpQ/Zxlq7zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ji5GUXQ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ji5GUXQ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37871F00A3A;
	Wed,  8 Jul 2026 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522677;
	bh=yvsPKq1kz5jm41pEOhntXB+dktSpmiUQ8ox3Qzu68S0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ji5GUXQ7kECVG428RlaXn9Q9RPtbQnIijfGqhxaW17Pm2cA2x1nKfQ78/uI+wBomh
	 JZXXthdiJH8aqLZGzjWVhWFlQqjrbGP1HfkaYZsYZEFSg3fWbSi6pep1xuxCU9Alt5
	 Rp3+N5YdxQV+WcbT6LDGO9XBZf7dCHXoCReDpvCNTtAYNXOKVKwM2UuHkKfpja6JHr
	 hhg1l3ZocPSYj+umK83LQrH7JM6DvxGbTOdk9FcKIXqicfcRzOv1k9c6mFISlnKhPE
	 8MNQOnScOrxz2XfdTvI97w4mYQBxDJHK/XVVe0F9LAYGuvle6OVwB9AN+AcKgKecVI
	 R3zPfk8Z2LX+g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Deng <wei.deng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_chezhou@quicinc.com,
	cheng.jiang@oss.qualcomm.com,
	shuai.zhang@oss.qualcomm.com,
	jinwang.li@oss.qualcomm.com,
	xiuzhuo.shang@oss.qualcomm.com,
	mengshi.wu@oss.qualcomm.com,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: lemans-evk: Enable WCN6855 BT via PCIe M.2 Key E connector
Date: Wed,  8 Jul 2026 09:56:58 -0500
Message-ID: <178352261641.2235436.14042420784644529836.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
References: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 22 Jun 2026 12:11:55 +0530, Wei Deng wrote:
> This series enables the WCN6855 Bluetooth/WLAN module on the lemans EVK
> via the PCIe M.2 Key E connector.
> 
> Patch 1 adds the PCI-to-PCI bridge compatible to the lemans pcieport0
> Root Port in the SoC dtsi, which is required to associate downstream
> M.2 connector graph endpoints with their PCI devices.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: lemans: Add compatible to the PCIe Root Port
      commit: 4af0537223d511a903f0a2a6b63d712b63184a08
[2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector
      commit: 5bbb7dadda0cc4b327a1fa2fd055dcb2a6a8ee37

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
