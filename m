Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE592D8364
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769878; cv=none; b=o1bTpG/zdC7djRAwcn2Lcy6m1tTCvAStSwjHsRdT7wTAknBA8mQeGQenfocf7drr/hUuw88uqKJET7MdGSZF1DMnF9lG2xAeq+eRsSRmCVTWSVs4Ze1LahKsFoP+SeIwSb3WSq5CUrt9/hyQhwxhkBPWKZ/uCXDJH3b1beKTq6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769878; c=relaxed/simple;
	bh=69rklTuc32Cd4OSZABo7R/EXNle708vAHcroEFr2Ywo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+YmOx/AIiwdAaZnWWZeW/Z1pS4QGJLBvkpUy1AFjadmjBkN7JfSG7+HNt6goi+AyF+GRcs8hAqaIgL4f1RciVKDMJkc1AfexNmGf5pf/q9yccrMonI4M8oVclNZ42aq6XliwB4JXVKzCELV7IbkNYUxK26U6/BE36sV5z06WRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCQiTLEn; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCQiTLEn"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6685001353fso57311d50.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769874; x=1785374674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jklj4blgO9oStgR2TCQBRvz085wQbqkbiQnhj+Po55U=;
        b=iCQiTLEnTzs3NS+NnqOhu+x227F7RTcdH3qX3DSn4RSMhQuWZ2Ybh8VqUqEV50FeeR
         7brB+ov4GVcvY2wuJCpPWn0+EJ4HWBC2rOshoUY/C3uUFGBktVZc7x7UcdZNUirRLfrw
         jpCZMqz3aeT/rug1xcqjrMtJGC1WsLenbyzOr25dapuRQNLeCQkIK5NLar3fHaogrOxx
         QwJYQEI3kXh3ZZWmwDMApmil7SJ5XEWtpj4FjDJNHV2BAYHFDhy8K+t8eGINIMU+0reb
         lG/9Qgmj1dSs9hqP5pVyqz4GPYnav1jbNYhuhuFyD1b2YdebpEZ6nO2E6mlgmTrKqqqf
         TKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769874; x=1785374674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jklj4blgO9oStgR2TCQBRvz085wQbqkbiQnhj+Po55U=;
        b=ifGlc3VJcMj/eVn4urhf22RDb3cUO+UW0AG3jWTZrBAis7Pex+lPLB1GuU0SOFuih/
         jv0A4aYftk8R9qDZwF1Aabyw8w9qJPKgDejKzMwvIqwFUyt2xsE/7Jbj787oMiQm76jz
         VFzGP160Zpp4bXAFVqrkqwvd5EETfQjipkMGq3ovYSc4a9Ckwo8alZcJiPX+7nxjHoOi
         JMhmOyCN5qt+FrNKxP2YWikDNTKbhPhO8XuPYO5Oka2K+c47HfswZjoGO88AHjx4Vxa1
         q3r86L5OAQWI7+H3KHx7vtZHeOjQ6k1mYDDLRUfKQVG5TacTBuYqAyltwR7KNLwWFI8a
         C4gQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqje7gy/8AGDYQWuk4ntLU6jKhVP73KCFKHL7AwARBRwVWitgZii3/rs8PlnGKG20/TMvwX8BIzkbkN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz62jg182iNhgli1j9sbKnswQHJNs5p+VIlyWPnMBjCWM/3Pdkh
	+6zMYj0DNgpelxJlKStDlu4O5F09P/xZ5QJ7il4taxOAlDn/Znl57zJ3
X-Gm-Gg: AR+sD12fn4PQk4zr/aNW2Ogj3vITUhpECFFQPpO2cMCcs5UPQyjVIf/WMFmk30+4zk2
	W0b46by6Sjh0GsoSxA0haerpKtW98OWsDs3rLL/JPc10JOKOHAd5/yA9kY5ibSD+0HDxacZ6px1
	AYwn3+5ko/ifikETxJpnB23J5Bm4JQZNBhXSgoGuErG+i/ywJU+E1PCcLVw2BBqnuhALSsNiKu1
	vnd7eY3CmkrM0bO+z8sTXulQ0s9tcI177j1VBZxoCARqLebkUbUBojjbXyo4CNgGH8rUqAZ2poo
	E3LeITPiCfsQCYWByzrk+6dQ6cwRsXGr279fhGTrzVChFQd2c28+fSX6MgEn6JGlQoJzeZrBUYp
	Yzeq6ivmBeE6Nl1jRbwsk4ij9uP5xHur0sd9oi/FtOIQWZd2dIL8dxqXw1tW28UWgJrI1/PasgV
	wXAWTdXPh64C82/+6qJkoacb39RSBr
X-Received: by 2002:a53:a7cc:0:b0:668:43a3:1290 with SMTP id 956f58d0204a3-668a5028887mr176486d50.97.1784769874607;
        Wed, 22 Jul 2026 18:24:34 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66890521188sm2310775d50.1.2026.07.22.18.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:34 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 0/3] arm64: dts: qcom: initial MSM8920 and Motorola Moto E4 (perry)
Date: Wed, 22 Jul 2026 18:24:28 -0700
Message-ID: <20260723012431.48499-1-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012415.48288-1-aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initial upstream support for MSM8920 and the Motorola Moto E4 (perry).

Depends on the separate qcom,rpmcc-msm8920 clk series (binding +
clk-smd-rpm) for the MSM8920 rpmcc compatible used by msm8920.dtsi.

This is a trimmed mainline-first subset of msm89x7-mainline/linux#48,
rewritten so every phandle exists on qcom/for-next's msm8917 / pm8937 /
pmi8950 (the fork DT assumed richer SoC/PMIC nodes that are not
upstream yet).

Included: regulators, eMMC/SD, USB OTG (gpio-id extcon), keys, RMI4
touch + reset-gpios, BMA253 (i2c-gpio), WCNSS (wcn3660b), PMI8950 WLED.
Deferred follow-ups: DSI panel, IPA, QDSP6 audio, FG/smbcharger, modem.

DTB build verified: msm8917-motorola-perry.dtb + msm8920-motorola-perry.dtb.

Catherine Frederick (coolguy) (3):
  dt-bindings: arm: qcom: add MSM8920 and Motorola Moto E4 (perry)
  arm64: dts: qcom: add initial MSM8920 device tree
  arm64: dts: qcom: add initial Motorola Moto E4 (perry) support

 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../qcom/msm8917-motorola-perry-common.dtsi   | 412 ++++++++++++++++++
 .../boot/dts/qcom/msm8917-motorola-perry.dts  |  20 +
 .../boot/dts/qcom/msm8920-motorola-perry.dts  |  20 +
 arch/arm64/boot/dts/qcom/msm8920.dtsi         |  12 +
 6 files changed, 473 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-motorola-perry-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-motorola-perry.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920-motorola-perry.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920.dtsi


base-commit: a27464b0b99874d22b04a92186ab7ea9252c3847
-- 
2.53.0

