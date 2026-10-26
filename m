Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029267;
	b=R6mf/womazuuS6NUSRESSiefx4iWUsOo0hewioL0tjIs0PDkZ+/cvkmXT94w4RwXRT/b
	 GaWH2CgXCFTNa1OTwcGHdK7yrAqvL3vSMl9Gw08qkufk14ScOa2hqFVIsYnRjEGQ5sCqv
	 HxSGBwOQ14y9FowQioFf9c97dr3UzL0Vwgj8DgCHnvaERpNSXaRIQcVyqhW/l5hVftDAX
	 L6LA8UbRb09zT3LSaUPlZmbPblkvLgmZlqRSgmxnw1TYS7NoNuCzkCc+29g3HrMQpf3Iw
	 e33DIoKdiRO6goyspsRTu9wGc1ZRP0egWr4mZZqMIUfu1HilIfnDED26h2TSGUqqLlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oXvlMSArAdPznEGPoRfsgQqM9zglSgDnbfxhA6Z+wyk=;
	b=CZDMYZFtdj307oIWvRTqoNg0QhvUmq27he+J5E/SFTE/n7GIn7w9FsF+b0Bv38leeDeg
	 pl3KDeYgoUG+b7t0NWkD775qXRHeKbXZGtS8KhHVRBpwL4e9na8ObcDC0UqmN1a+GI29K
	 TJDKznASwq8BjT2Q117bmYRFnb35Z6YBer7AoAmN4iC9qz+9MhVrJCjaLHaDjkR05jdDz
	 H838Ee6LlOY4pxH2z8zvLPQTMgYWldyYnpkqTk0VZqQraYsasRLdutzEFGnXnUHd5A6V1
	 HEcttTgkWGPTMDcGwVHBb+TgWR+DLXb8xElnmq/FOid8883Kng6Za2sgDgCllRtEzEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kydrx5lC;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDA7606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEDA7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kydrx5lC
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-843ea301d60so2348360a34.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793029266; x=1793634066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXvlMSArAdPznEGPoRfsgQqM9zglSgDnbfxhA6Z+wyk=;
        b=kydrx5lCCIvCkSDYdmEzz5tuOnzwKKCEvi+/GimiJ/pbp4X7dtXpkSy8g0554b7Z3F
         KssOxSNc1k65L2cdK/q63N9sp6BYHdDq52Z7aWfM7wZsEanX/yQODUNE09pOAPNfxTam
         aUCI16NSHL1lClaLj0NoihkBAywcb2hm+C1rq6+Z3Sbsft6EdgGFNwr0JejGfBsEbFYG
         k8x0MSSxYECwwLhYDP645aRZa705vFNVDuQlitov1vSoPWRDYR+JpMbJp4ZCLRiUiQIV
         y0HSKCOE1k5rmgFXrBW7PFAT8P3sx0HXxi5CbSEyueJZ/UwTGNfqdFvYslHsEtODsfZd
         Z/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029266; x=1793634066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXvlMSArAdPznEGPoRfsgQqM9zglSgDnbfxhA6Z+wyk=;
        b=nElUU/FqyjxYtl7VCN2dpvrDkm8cTuneM1Gu2trnsQrr5BWdvZvNtB3nITzNoCLiOm
         bt/X8rNTCsJ/nsjXuK43in85OPNmaZJGzc5ihwdaX/SPP7JTDfe7C0LsvscRVikWFMkd
         rMz4313JhAFMmh4S4tvxVCKPRrfxs31V4UDTNXaEN1+/WDyFKYnR2yEh9OnTYM4UCTUR
         qEB8kFAM+W3FEvB3BXtE590oB3KBSrNPftNko+Fw0/GREHMflyeqG9QThY4JwAxZqBqI
         YCa7yo+9cxcmGCHXhUnjwp5X3jxJfPzhzr3Zy2n+P1MrSYiDso75HbO13cyZQYnruReu
         C1+g==
X-Forwarded-Encrypted: i=1; AKwUvBwKxFUwCIGG6lvJH92H82/SOb3NVPXy3dm2cMoFxef3G2+dGPYX2u3RRLH2Geml5SA64ljVUtbUcFqI@vger.kernel.org
X-Gm-Message-State: AFq9FYKEWsDaEwukJ1p+7klsXZcpvBlr4JQHmboc8WM2oZPiy1hPwUBM
	Zjw0vJSFK8Pggm9LWARU+IYqN49boU93sf0KAqQrytHnx8f9SdJFeZ6o
X-Gm-Gg: AYBFou0Rl3D0ljRZI3vQ7lWAsb9eplUsNWTacvNr+qUxp7vrIHNuCZMj6XPaP4gnCf0
	BzvUOunCL25wtMLcxFGCD7QBeV+Suh1JW1MGWNfZ+3fjCSUQREob5jezEcFb8MhxwrqekHvnWJA
	xlSviTJYMKTKr2wlnWHo9QNupZKxgELQVd63h5n86cbGIW8Xv+6GA+MkPKD++iLAKmOCsc233eO
	Yjbfy6q7fYuwUa5ye04gZEJLcKJv7/+zZdNSChQCuIKCDSiVr5hqLRH0bIFqwYfdrP+oDOdDn5q
	etPyPuMxHDV0XLOa9kGXOw/t2yHNIcj3ELwerBn3oLsLcWLT3sRQsG2XVNOaE3EaiO067XFThO+
	Vboizy9SA3L7vCoou3+2/f6KZT5yy/sU9yMLr+Zt/R6tEtLA602aRR+XZZN7xBYyOCBfYW5r9UU
	Dx/gzKSCLsBKd6jfOwIL/2AQXle91Qsr9zeXU/MajG6OTKniVRFigPENmEoPfRFaarc1b9rcdwA
	I5lbsp8tHX13NVeR9tp5meD7t9/qwvHDF210FCzNfpkGzSVoCqIzgqSrAzHIVgIuNPOF5It4amP
	IQ5PJlZHDw==
X-Received: by 2002:a05:6820:2203:b0:70b:afc3:25c6 with SMTP id 006d021491bc7-70bafc3263emr2251069eaf.83.1793029265744;
        Mon, 26 Oct 2026 08:41:05 -0700 (PDT)
Received: from jeffmr.mynetworksettings.com ([2600:1014:a112:1526:a95b:f8ab:d834:50c9])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a84315c0c9sm4746441fac.7.2026.10.26.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:41:05 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Mon, 26 Oct 2026 10:39:59 -0500
Message-ID: <20261026154001.9323-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a device tree for the HP OmniBook X 16-cp1 (board 8F46), a 16"
laptop with the 12-core Snapdragon X2 Elite (Mahua).

Tested with Ubuntu's 7.3-based linux-qcom-x1e kernel. Everything listed
in patch 2 works there, including suspend (s2idle).

Notes:
- DisplayPort at HBR2 needs "phy: qualcomm: qmp-combo: update DP PHY PLL
  programming on Glymur" v5 [1]. Without it the stream runs at half rate
  and the monitor shows no picture. With it, about 1 in 4 plug-ins still
  gives no picture; replugging fixes it.
- The GPU is disabled. It works with "drm/msm: Mahua GPU support" [2]
  applied; I'll send a follow-up to enable it once that lands.
- Audio needs a topology and UCM config for the "HP-OmniBook-X16" model,
  which are not upstream yet. The headphone jack (SDCA) is not described.
- I hit one hard lockup while plugging USB-C devices during testing and
  could not reproduce it in later plug/unplug cycles.

This series was written with the help of an AI coding assistant
(Claude): the device tree started from glymur-hp-elitebook-x-g2q.dts and
the laptop's ACPI tables. I reviewed it and tested it on the laptop.

Earlier bring-up report: [3]

Changes in v2:
- Add static data-lanes to usb_2_qmpphy so the PHY uses USB3-only mode
  (reported by Sashiko)
- Drop the Assisted-by tag, describe the tool use in the changelog
  instead (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20261024044650.9936-1-jeff.roach0@gmail.com

[1] https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
[3] https://lore.kernel.org/all/CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com/

Jeff Roach (2):
  dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
  arm64: dts: qcom: Add HP OmniBook X 16-cp1

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 855 ++++++++++++++++++
 3 files changed, 857 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
-- 
2.55.0

