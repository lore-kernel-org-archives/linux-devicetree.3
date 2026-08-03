Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FC43624BF;
	Mon,  3 Aug 2026 03:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727465; cv=none; b=FOugzUwBx8bv0Q1x9bH7nMnRpsiOlKg2ZG25e2xxC58WxEBr90fZ+uijAjYOBJAFOLAygXgIHWSm7kWGae9mYUKdeb1IZYuFHGT+nW3Eqa/eSRGZTA+jJAZQCooaKx0rYpUdMownxJsSKu4cf6w+LVHNFAqdxbrwknyuBpiFimY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727465; c=relaxed/simple;
	bh=IK2mAp7lTAtIwiDgTArynEjFvGmE1FdUK+EN+l+w4mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DHLX2myULNcvcgWCAEYZQUYwZbWU+K83GBSMvZPJdpmUErNnTN3xMScBhQWI7ZChuKv/02HXcPTtncqJ0m92iDqUvda/2mqmKu/bxYdS1AvP9YbiAjCmK7cVKMES+beDslDUoDomis33GiKZivxTZ1/6J72j4uTcg3fCCsiPX08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVc3R3UU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVc3R3UU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88491F00ADB;
	Mon,  3 Aug 2026 03:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727463;
	bh=C14Pk2V04vUWNxElm+AoulYZu1v4l/qwX82cv6AyWz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CVc3R3UUTchsh8d9+CMEdUd5f5ufn/6RAoevoLSIiSm1X9u8acgSGwGfVzmsytCGn
	 IR0LEM4Tpa2Ozn+HqhdlsMSVqzY7WYd8E+6MIOlMSF4veolqW8Pb7Rt0KC00197qpE
	 4TOJx0WM399tBHoWq0CcQBJvVuTbm5G1Kxekk1JXi7NoR/bmgCUcwOSJh1Zg1seOI7
	 v7bzgjMm9Awol1mV9maEiFu6jVRp3OHc2V5Mu4EpDhxXPMjzcD1Bux6n3j06hob9nR
	 +FDgE6dzuTlpNnN5JMgW+TyfN7JfCdUVUjKLqiCp5EvbbnOW6ihJ2EKCPCOiRaxzyX
	 AAjVl+U+BUvWg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/19] firmware: qcom: scm: Add minidump SRAM destination support
Date: Sun,  2 Aug 2026 22:24:01 -0500
Message-ID: <178572744558.408250.13232612151478495014.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Jun 2026 00:38:11 +0530, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in
> always-on SRAM is shared between the operating system (OS) and
> boot firmware.  Before DDR is initialised on the warm reset
> following a crash, firmware reads this word to decide if minidump
> is enabled and collect a minidump and where to deliver it:
> destination (USB upload to a host, or save to local storage) and
> OS is expected to select one destination.
> 
> [...]

Applied, thanks!

[06/19] arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
        commit: d01693e992b8faebe61612208096e5937684aaf2
[07/19] arm64: dts: qcom: sm8450: Add minidump SRAM config to SCM node
        commit: 90a6f902c8de56a2e32f8c458c10e42b29a4394a
[08/19] arm64: dts: qcom: sa8775p: Add minidump SRAM config to SCM node
        commit: 1243108ae31de2de25ba08d08debad4bf8afe3ad
[09/19] arm64: dts: qcom: qcs8300: Add minidump SRAM config to SCM node
        commit: 8106cb30725baca6568cc8f54dffdbef792d52bf
[10/19] arm64: dts: qcom: qdu1000: Add minidump SRAM config to SCM node
        commit: 27ba11afe4aeeed7d9aa31179fdc46656d6f335d
[11/19] arm64: dts: qcom: sm8550: Add minidump SRAM config to SCM node
        commit: a1db65c7980a5567396a74ce94272d26f0bcb86a
[12/19] arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node
        (no commit info)
[13/19] arm64: dts: qcom: sc7280: Add minidump SRAM config to SCM node
        commit: f0259f721e1870177a949d56fc6970454c452d23
[14/19] arm64: dts: qcom: sm8350: Add minidump SRAM config to SCM node
        commit: e030c56e38fcd5d30fb57f0db3388d13e29872b4
[15/19] arm64: dts: qcom: sc7180: Add minidump SRAM config to SCM node
        commit: 9d2f33d8ceacde93631319f06243bfc5ed41e2d7
[16/19] arm64: dts: qcom: sm6350: Add minidump SRAM config to SCM node
        commit: 4e9b6041bbdddde93369df47ba44c759e29c0972
[17/19] arm64: dts: qcom: sm6375: Add minidump SRAM config to SCM node
        commit: aadae3dbd5ae8c98ee1e6c8b6636f18b006cb905
[18/19] arm64: dts: qcom: qcs615: Add minidump SRAM config to SCM node
        commit: 32df14ece3e5c92bd2ddf1eebb3f193df3b7a701
[19/19] arm64: dts: qcom: sdm845: Add minidump SRAM config to SCM node
        commit: 6fb55156f44ae3fd8e2a308167ed8dad1249492a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
