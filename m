Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8F73AF647;
	Mon, 23 Mar 2026 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276715; cv=none; b=Chh4B+q06v+lYVBEodeK/8upVGVma2R7592lZJO9slecuVMXOImgtfmOyy/l9SAffpY6cJRc5sgIiX6NDEmcdATJirvbNWPPtYHmFmHghJ267qmVkBnqA7m99PrWI+i/8cNut4qjeac+a3sTqFzEkG+IJCrS5NxcNZOriAzeX3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276715; c=relaxed/simple;
	bh=BhfwVuSdA+xsgoQhrEDX3Uf4cbqWkT25fBtlYNBcb1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W+rD61wU2M10Ma6fgmXK+yPRFYgMCfjeNv7A6JhqsxBf8W+nqB2y+sPQOkWeXGv/M+a9DV/lJibW4KGVx2fOhRopsPYBFQHF9+GWxL97zG4RpvzEpGZ8khJLUEo417kzkcTIc2XXjWTVAqdNSOd/5abs61Ya7txGH0emci+4zPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egboTyyf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egboTyyf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD18C2BCB3;
	Mon, 23 Mar 2026 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276715;
	bh=BhfwVuSdA+xsgoQhrEDX3Uf4cbqWkT25fBtlYNBcb1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=egboTyyf0sIzB+ybUGbA+Z3rPVcPrCnrgXPal9c19C7xoX6vIwBkKy9G/hfpkXU6x
	 Co57lPw0NIzz6EafSrxe1Lagcow0CXKBwH/HevkzHER81FaegnCATa0smY1Rd7J6Ca
	 GtLiszHfHNYHu3legu2uI48gtXBKWX8bGvYI+dVkG4MGtSF9hLSn2yo0yql+mJNg2T
	 Tjq6Uq2KB5ms03SlwIxkSDNBBayozpO5qlHGSVLLrRNUMObQTrSm0YvRvmWIIaBC59
	 loSnTgb3l4GM3NfCYiQL8Zk/GjwnTEkX3lYUygbntclDppW2Ay1BO16lyn26yUx6my
	 jz3+/5mCbWvtg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen
Date: Mon, 23 Mar 2026 09:38:19 -0500
Message-ID: <177427670516.11515.6195054335794076546.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313-glymur-dts-crd-enable-kbd-tp-ts-v3-1-66c5ddfee97d@oss.qualcomm.com>
References: <20260313-glymur-dts-crd-enable-kbd-tp-ts-v3-1-66c5ddfee97d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 13 Mar 2026 15:53:22 +0200, Abel Vesa wrote:
> On CRD, the keyboard, trackpad and touchscreen are connected over I2C
> and all share a 3.3V regulator.
> 
> So describe the regulator and each input device along with their
> pinctrl states.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen
      commit: 1ca87acbf91495f8e337311605bd8850c0d80d05

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
