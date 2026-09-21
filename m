Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE30048F033
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993083; cv=none; b=M3LxunraNE15HBvKd1XH1cmDeq3Uuy2IJlcv2zng3U2ImMmzons6U1FjRjlJfeXHFBK4KqbZLCQGymU714qXQJxh5G3bcQe9/OijOVYMimqRJGLv3NeEo2Oy4ofGX5qVIxCFWZNoHO0UBz67CrX9SxNYdjwtoqFkcwoKvEqurEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993083; c=relaxed/simple;
	bh=UZGB3K2JcnX4lOV4vLAtC2gzRNE80zgmQkUEh7WGGpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GNXd1raRO8AdzbtMRCh7beU3NiKB00yidwEv4H1UPhr5bOvnWjAedYEJFvOr/uCSNhxIU2tIukS4S4NeDS52ql2n+1t7ONs1w52cq/0ul/S+8PLFUigv5t4ZKHieRvG8R+WlU6jstUNxpZflf1CkTS6W0t8s55s82Lp9kW97P4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZTrJO0+; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZTrJO0+"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c254fa663bfso430776966b.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789993080; x=1790597880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UZGB3K2JcnX4lOV4vLAtC2gzRNE80zgmQkUEh7WGGpE=;
        b=jZTrJO0+fauueQL9TtT4/Dld7m7bmK/cJxXkmA074KiULrS3+IxFCCDiYYlTfZYmBT
         cinvcICsh00cYtoOtnQemcRz48VN9p2FR0RENoahW2eH/YUpOcTvJrFdkRdF+N5p4tAx
         UiGnRXQtZb/hDRFuVEUWm5PJe7Ovplz1UhV0MDs/x3EKliRd+ocR66FsIeR/mEq08iUp
         YBAXpdlHNagZPHD7NcGjllYzVwMZfGJ3O8rIoP2zOWizj3xNpGAdhh2m4Jr3IXzyxPXf
         jz359vv/07t8ddYVbSAz0sjFhhLSYwymm/ckMlBICvRchhlOuGGu1edgGUj5wxj1NcIR
         cb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993080; x=1790597880;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZGB3K2JcnX4lOV4vLAtC2gzRNE80zgmQkUEh7WGGpE=;
        b=rxgFdgdTYxa0ewyTepeW4Xv/UKmQkHX9XVb3faEERkzsz4/XMeRBkVw7Lg8o1HMZWx
         gqcI6jP6Habn5i88BZyBO05oDyzZt/I6s/qvsRBSJL+q97hZQELkBPGbqP3JmeKvSw3N
         qPhzqGgkz8iOyHVIMpRuxptTCh8sIajYHT6scBPSEXPASLeWy4cTXhV7wuyVvE+OUZ+o
         B8bxfroKzdaZX2J//wzJfG9En9CQky6jW5ehXPje7LskMYEqFnQp9D0UF8ZZoNxFWXYX
         eKi/UmDcaWt1nX6gvrirF+8p52VUWepOJ4vZ2xEmla3leeMCNjDI4XKgHv23u61tOdhn
         WM0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxUjTIQ4go93kfYgE7HYCfbYLxntGwAmn+gS+sPcRJb2k24eXFfxIbdwrniZ+wRjEIoqBNKF88naQ4k@vger.kernel.org
X-Gm-Message-State: AFuF++nImN7eKE2sxm/Nv0CeZbOt5IStR/s2QBSS9ondVKHZ3dn2C0WC
	UojpnkAyOk4BQCOCOzWsJFOf9ZoG3dWlmM6B5rzlJqXPDVVG1WL0EKxF
X-Gm-Gg: AYBFou0p9tNE4ZLnyZDICYE0MkSXpP0qiTukWBgTYnfE2e7MNUpDvFVl7jG9Tx4WLXN
	Reae6FXxbYcZWlzpBiHzsyWTitplvZzPnmQXceOuGtP6QzjW/1kxdXhi/gF6STxdwELIDg9czGj
	31FIGsA9M9H4PEgFCuYWJgIPVPuk5LyeWZwR7M4jYJBn3kmr/Rtegv9u1ORaS4Si8irIHolmJDp
	eI6Xar51mB173NwgthmHCyStMZJ84bPqF10wS+jzl1kbyPc0/IS62+fgz/tcnH00eenXM7ezauN
	Jrau+ZWrefdqOdS6DBTGe+fwoSLn3u4tg1flFvn0Vt+CovKtTwPRiqyg2BT8hW95rC6MZZ/vtj9
	bESnQsqrrjiGv0+Ky5Ioab1AwOvgZsrZudt6ghU5s0dazSMPsgdayAVTNVU6EOPhrY1jMD1oCny
	zx4sJorLlDg8ByajTrrQ98OeE3RQgjoI03Z/F1FSahLUJNbllE8ZOo35r5rnvNJrfBcWIHuMbxq
	Oj/r7jv2Q==
X-Received: by 2002:a17:907:9484:b0:c25:c7a9:7b8a with SMTP id a640c23a62f3a-c2a156d4a6dmr916170866b.12.1789993079677;
        Mon, 21 Sep 2026 05:17:59 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm308205866b.63.2026.09.21.05.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:17:59 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Mon, 21 Sep 2026 14:17:51 +0200
Message-ID: <178999307097.27086.2572116331075139440@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <165d1eb4-f5e7-4f54-9f9c-22a210976d71@oss.qualcomm.com>
References: <165d1eb4-f5e7-4f54-9f9c-22a210976d71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Konrad,

On Mon, Sep 21, 2026, Konrad Dybcio wrote:
> No, merging a node without dt-bindings would cause DT validation errors
> (which you can check via make dtbs_check / make CHECK_DTBS=1 qcom/foo.dtb)

Got it. Please drop this patch. It will come back as the last patch of
the EC driver series.

Thanks,
Oleg
