Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF38A41F5D9
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790318511; cv=pass; b=eEVQzih1AfzTY6PxpXAsUQaKIM3+DdVx7S3nX9Kgg7GWAr/HQ8e8aVtZqAuUMYP1qYAURZ4/BBi9ebIRAde74oJWKdrFbRDRx4Gj5BmLS8DDoW4XVhNPgMSNwrHqEPIPV0yMdMmYcg0BY/B4R0azhhdsfG/HY6zVAAYpNM56aOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790318511; c=relaxed/simple;
	bh=RkD0ncrXK0q4FdIjZkUOUclIn2t5h5U0/ZqoP0P9Mzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oynEN/VBoxByQ7o71r6RKpekMpsqnqgU3b8YsxKjJrS0wZWWSInh0h4NrgH6qenfqWDy/FZXpsQ9rL7x5lrGqsmYq8giivO8BBybx77d8vYSLpPHCHL+egBHokNrcoI3tKEZMf7gICebyScEOW005el3h0RMwdHBSdtO5T2SOVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8OriHiS; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8OriHiS"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so568224e87.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790318508; cv=none;
        d=google.com; s=arc-20260327;
        b=cBuXlTsDgVLYp8mUGJ/Ss90rvWP4RxD52tjrLdNaLoqkpGZ5rgrCDNrE51YCqX7LyF
         LPGoK3unQF17s2bTs0HOqur0dZBcbbIXU/HFzT8P1NLX1pu+JYzkNhBzv+nJXKBQmyc4
         vnvjEjV3iV+UdvWZZO4n1lxw0kmU9kXuy7v4zcCDIJ9Ma0Z8Yy3Cu5HT/avkvGKkrQDZ
         QritW+cIjhBBeNGlOQno6VABZLjecj9CqGmOogy/NSUl3N4pCloe6AL2f8cpcwCXcJvB
         AUaHuWWs64bsYHSiTBJD9n2QbSFTbs17xETq7JIq7wTQjAt4H5ESJDATfkC7niejQAPQ
         d0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oCUKdWQbsHJgUOSvdlicS2cHjAoZu9s1v/XdrzjTDIU=;
        fh=zxcmBLIOWQYNxz7rvt++aQmGdiUWHXNDvL9xAUAzJFM=;
        b=hDSzwrSG5iGtdrkAsem4wPKhrHUkM5Td/FrGm1HfvV1GD5Wy98wQ4cNLTyqEtHy/LL
         R5184Sym86hLXROKoMPEJ+/fhlOgw5Rm34sg9Ts3HvtMyvLBmmDdqjti5IpXS8pT10MI
         +okEOxrKgYey1W4nOwPDUzUze4tIL3CEDWb22hF1mmIaKPU/qtkg8/wlKBg5ggVo9i/2
         gkD5aOEW9y3V77qbfs0XDrX5OMTbxYo00ZO0IbSOr9OYkJTT0a/xTWpsx8l2nZBsUngd
         haWFDMrHL3Y0MeNTeHK07b1v5bwTi3nfZ+Y7aMIfHZe6wFuCMEhAoQs06RFAgifRXl+h
         n61Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790318508; x=1790923308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oCUKdWQbsHJgUOSvdlicS2cHjAoZu9s1v/XdrzjTDIU=;
        b=k8OriHiSUhYSimjZzzOgSQ7fiEthApf0hKVCTywB39HydjMmF7ElQ7E5hbLnK/D7X2
         lsL+IyNTnAFrXfSBQBDEKiRXUlIOgrhcaKVz+yOoVuKumnZqlVZa+NyBzq8aFLPzaJMf
         qwywzm58NdIhx26NEYDfvBloknkhd6IXUp8s+t8t84SGSA5n5/CnvHAQxeclKQtBkVTc
         ISodHerrV/Vsr9t5pzFAGVWJwCmTBXm5vfgMt8QxX+iDDCWc3ZfyhEbr0tUOKBjKJXCN
         SMjQLydGyjTJL6rON25JN7RW31yvpkk83v15UaIczLo42OXj9zQdgPc32hQowIGcNtX2
         8SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790318508; x=1790923308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCUKdWQbsHJgUOSvdlicS2cHjAoZu9s1v/XdrzjTDIU=;
        b=pA4Q3oevUK7LP6d+H9ZJZn/n9gGWsUrBed0PMluZwbnxaf3ZX3UIRvEnUtCoFNNgDK
         rGD55K+4nNQlCvtFXCSHxkYzLGg+7BVuqSZjb6yRdorsvwenoKBhJk0PByJ786Cu+GaT
         pa4DSyGp7h42rjLJkVEc+FYkcaIKKxs+WVo9B9iyFeENBVio0M3Cl/7aiyqxpdHiu4c1
         fmvvD0seadvh0N667L9dhz1J/KRHRMmoxFrNI8TCkrp1bwqwMSwBIgpV3w5U+Bvyh9KK
         s+NGDU/8EIDOCsycGMRwGPYDwZs2h56EW9/zO/6mJkhVlSTfE3IQOBjucB1eAlEUveo7
         Ms6A==
X-Forwarded-Encrypted: i=1; AKwUvByfyPmsY5n6nplXLtOyPGDx5UfSCqiRxQtG9dwia2R7Dqn+lNeumW8Qhtf3VSkka+emhy0fQEfvJ4gC@vger.kernel.org
X-Gm-Message-State: AFuF++k8c2bscfVztVCz/QLbAUzdPEqL4HrfrdrPVugCLmI48UEZu1E/
	t5J1izFL3VEWXxp4VTSZX6Quy2xuFDz7JihAOXwpLORzgO7ncJg2CB+hFvIRUE9MPvFYp/qP4vq
	if2hRrj/VGztLbfbnNm1KSk0PzMKvOrQ=
X-Gm-Gg: AYBFou2AFxg6an7GISMJ8/icpSSXb2Wgb+6z8wMJsfs9MB3WLvyOTGYpnXaYnklcZCD
	BgRS1DKPUCiI2wGVX3Lu5mkxhIHBBGCpI7Baa4TuWEaDKsIouBbnSP2yBW7V7INVQOsfN1Z5SV2
	bBqIiapDFOktwv1ucuAudzMpkrqygtra16BC37hISmGhulm3b8U2MWsR4cBKhXZkn/FOZGVxaPS
	RTjCt7rfcCTKvNvUc5rG9K8KwHvfBeD5u0H6SuT+UoO0Fx8igTz7ojCveXu9qSGOaqG3TVL0eyX
	kmon5lzIAQd4ReuOPgY6itu/pDisLAighbmnE68zoj0QYYTRUPLLL+LNg2KwVw2/tU8h4VffQ02
	zdjT0TXNhuuKc0b6q/i+Ul9rtIvOdi+iBOYNnTxJ3OdU=
X-Received: by 2002:a05:6512:b23:b0:5b6:1a7c:59e7 with SMTP id
 2adb3069b0e04-5b8e0fda144mr1478322e87.65.1790318507668; Thu, 24 Sep 2026
 23:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
In-Reply-To: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 01:41:36 -0500
X-Gm-Features: AclHuK_MIE9jeQicmnij_O4juXzqsKzVql5g7gyWzlaf76vc-yY3NplBZb2k_9o
Message-ID: <CALHNRZ8kFm98HAxoSya1uzV9TnPL8NAey3y5nUaaiqPiE+Fe4Q@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Teguh Sobirin <teguh@sobir.in>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 7:20=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> This specifically includes:
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
>
> The original Odin 2 dts is not currently included as it has not yet
> been verified.
>
> The initial port was done by Teguh Sobirin for ROCKNIX and was made
> available on the AYN github [0].
>
> Support has been removed for things not yet supported by the upstream
> kernel, these will be added later when the related drivers are submitted
> and picked up. Such includes:
>
> * The Odin 2 Mini panel, backlight, and touch
> * All rgb leds
> * The built-in uart gamepad
>
> [0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v9:
> - Add mi2s clock control in patch 2 as driver support for such was
>   recently picked up
> - Drop unnecessary address and size cells from patches 4 and 5
> - Track renamed pcie port label from current linux-next
> - Add panels to patches 4 and 5 as driver support has been picked up
> - Add patch to document chipwealth vendor as used by patch 5
> - Delete ipa node in patch 2 as it now depends on the mem node already
>   being deleted
> - Link to v8: https://lore.kernel.org/r/20260503-ayn-qcs8550-v8-0-d733f5e=
57446@gmail.com
>
> Changes in v8:
> - Properly order and format amplifier properties
> - Set amplifiers name prefix to Amplifier L/R
> - Link to v7: https://lore.kernel.org/r/20260430-ayn-qcs8550-v7-0-591a967=
35fa3@gmail.com
>
> Changes in v7:
> - Add back pinmuxes dropped last revision, but without output-low
> - Link to v6: https://lore.kernel.org/r/20260430-ayn-qcs8550-v6-0-06a7e7b=
54aaa@gmail.com
>
> Changes in v6:
> - Fix comment style in patch 3
> - Drop a pair of unnecessary pinmuxes in patch 3
> - Lower usb sbu pins drive strength in patch 3
> - Link to v5: https://lore.kernel.org/r/20260408-ayn-qcs8550-v5-0-c90abeb=
7a152@gmail.com
>
> Changes in v5:
> - Fix some style reviews in patch 6 which required matching labels in
>   patch 3
> - Drop hdmi support in patch 4, since it doesn't work
> - Link to v4: https://lore.kernel.org/r/20260323-ayn-qcs8550-v4-0-33a8ac3=
d53fa@gmail.com
>
> Changes in v4:
> - Fold vendor description patch into the series
> - Link to v3: https://lore.kernel.org/r/20260322-ayn-qcs8550-v3-0-4afa89c=
20888@gmail.com
>
> Changes in v3:
> - Drop unused backlight regulator in patch 3
> - Move zap shader firmware to standalone reference
> - Move i2c controller enables from common to devices
> - Add ABL dtbo workarounds to patch 2 as per:
>   https://lore.kernel.org/linux-arm-msm/dczz4uvcq4hc6p3zb6xnrsgmfeomwliag=
whf36tewdz4z6mndp@afbxzhjziiwv/
> - Fix multiple property alphabetical order issues in patch 2
> - Use interrupts-extended for pwm-fan in patch 2
> - Ensure blank line before status in patches 2-5
> - Rename spk_amp_l/r to amplifier in patch 2
> - Remove a few properties that are already in the soc dtsi in patch 2
> - Order tlmm nodes by pin index in patch 2
> - Drop qcom,dll-config from sdhc node in patch 2
> - Drop dtbo support, convert common to dtsi, and include it directly in
>   device specific dts'
> - Link to v2: https://lore.kernel.org/r/20260311-ayn-qcs8550-v2-0-e66986e=
0f0cb@gmail.com
>
> Changes in v2:
> - Drop awinic bindings dep as a duplicated patch already exists
> - Change Co-authored-by tags to Co-developed-by
> - Drop alias to currently unused uart15 in patch 2
> - Link to v1: https://lore.kernel.org/r/20260311-ayn-qcs8550-v1-0-fe8b2fa=
ad1ea@gmail.com
>
> ---
> Aaron Kling (2):
>       dt-bindings: vendor-prefixes: Add Chip Wealth Technology
>       dt-bindings: arm: qcom: Add AYN QCS8550 Devices
>
> Teguh Sobirin (4):
>       arm64: dts: qcom: Add AYN QCS8550 Common
>       arm64: dts: qcom: Add AYN Odin 2 Mini
>       arm64: dts: qcom: Add AYN Odin 2 Portal
>       arm64: dts: qcom: Add AYN Thor
>
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    9 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
>  .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 1819 ++++++++++++++=
++++++
>  .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |   44 +
>  .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   99 ++
>  arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  250 +++
>  7 files changed, 2226 insertions(+)
> ---
> base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
> change-id: 20260217-ayn-qcs8550-16c07b63de26
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

Is there anything holding this series and the matching Retroid Pocket
one? As far as I know, there's nothing more I need to do. Could these
please get picked up?

Aaron
