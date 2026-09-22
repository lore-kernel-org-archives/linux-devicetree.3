Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BB9535FCF
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076523; cv=none; b=anx8TI9nnJOWTh/jsWngWJh3jPiEJOtp8SbfM4HU4rF3eHnd6ha3h4qG3aE3+zWSG78SEuBeq4g5+IWbzGZlwrXC5U+wc/A2z07EccqzuP/84akl2GtfhGq/Pt2Nln3VTPhd0KWM6qNF3OXHn7Qd+2oJx1P/PiPwIvMLJ/vY6dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076523; c=relaxed/simple;
	bh=fYGkUx/99Fm0c7kzSPNXjEgt5w0JRZzbxo1j3pn8PGc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DOxclmPUGhk4vSg8lLF9eQAX0RHnCFvrkHd8wSjE9m8yCSCf0NOTHU5C7n/tW2H19ikic0dIobL6ImaFYc7sJLr81/a4mTPBAWpCVnceJSETIF4YJ9ZUhSSTuuIfMhlLiaTqIRKhUZTxr7VzE371Yrr5FtgbnKLuHDraYe43AHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hd9XwbVC; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hd9XwbVC"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so19509755e9.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790076519; x=1790681319; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0ltBuBBWlL9mibt9d/tgEVpEn1LtaUIkxlCUSVJwzoc=;
        b=Hd9XwbVCvxiotOu5UhliwsmIRlESQLr/SNzX2cRnkBjpam97IRRs52mNXKMojjuEc4
         gwTKdmpEEs4L7zTiv1NCAS7yCw5Au5SDpwY69MLa9Mqv4zFmMc1EIbZzdo/bpKOnQOYF
         /NQmJcQWRFqsBFXfz/4ouSVf2DTuvuo6XctOB4s793HJunAb2gWnyM4tdr6wsbHXr1AT
         Huf+NX0mk0R1L27iFruUPnpp2emgN+6GI0kMyZIw2RWw7ybVD2Ixq987D8tsyfw9KJ27
         yS/wEt2t1z8u+FoPvU+ArBzLSqOdrpEEmDDEtHQ6PQ3rCO24YGsnfWdH3oLwLbBuryQu
         GlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076519; x=1790681319;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0ltBuBBWlL9mibt9d/tgEVpEn1LtaUIkxlCUSVJwzoc=;
        b=ms0ia1ZdP4SHxbtz4OLjkToxfwFOLIG2So1R6S+mNINpPY/E0KsgRPQNSOG8KDBxBo
         1ljp0jERU9DYD2dv2WeDJWFsR+REK8VtWf2ZaxytdrfpCI8S+90S53FPnfOSS1aGdXFM
         zHS/B9iPmGrWbAdTARa7Mh1/ZCN6vrbbvj30c3SQcHPfTDQOVCuvU59yy1MCu0imxUR3
         cY5iKF07E8vQVOIwk6M/XY6Za+BZ4G2oywu7X9KGC+Uwft/92hWsnUNLjKDZYqTG43eM
         miFESzzadukksjjAQiFMHHTZA5HnqdZMtWLL2JYam6fBXovhJTJBHaI5dU8bHWvAnloW
         NQOw==
X-Forwarded-Encrypted: i=1; AKwUvBzccJLRn+h0g49pkPKbIl/R949DcTq3pgHPqz9CnVN4d65I7ankwuCiP9txCYoeKmaekSS9bIiDOEH8@vger.kernel.org
X-Gm-Message-State: AFuF++n730k/s4K233rOMHOnl2nOM8S9Mi3V88BU444bC/z7bKJM2J4P
	Q6zVenVftUJpwQyaKVcZ9grTq8GyTRZD82DULyUMl+NMkLM4OOVuWfxXzKzvR0cOVmA=
X-Gm-Gg: AYBFou2KPW0hLgPpXVKDwnB1w+f6z5G2fyyrsdQyZOTPl42S4STIM0PLApYJSDfImo9
	vGVVLjzZi2bWt62uLjPSagZrlAAvMLgdOrWRizbqgduQkvVKjzyc/ftDT3ICBbhBqP7kPByzk6o
	u+Gv/Tzpiqy3ldh0NRRbavD8XbEDaJQWYbJnNFQ1HKddr2zv2f7ixjPhnx1RY9pFrFEqovfrUps
	/Sm5+9tGKsYhtvBwC7ieDMLxh54U52wNud4CqtX4pSiix3gDW301uAQGjObcPbBecUzfVHmk/+7
	IDvY3HMg9eJXXmHhJbyeosfc87IZEZiaKHNgA9LISP+kVHLsN/3LZhGi+fhk78EVdTM6PuftVyG
	cbxAddRQY5oyXTNVx9MxcepKBfKENKuDx0NGeUmgUtMCTWWcjs3KW1PQymIbiLo8nSOYLxgFia6
	5jFTAUtU70VFkSX5WLaRiMHrxTvnd9jRdRyFWGCxjM3+1j6udDZUC1R0ja+nseIwHwh0kcG34ta
	nM+SBQw6K0RIjYkYpM=
X-Received: by 2002:a05:600c:8b24:b0:49f:ce78:3563 with SMTP id 5b1f17b1804b1-49fce78360emr133909795e9.20.1790076518725;
        Tue, 22 Sep 2026 04:28:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdab0e46fsm6687485e9.3.2026.09.22.04.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:28:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8650: add support from Valve
 Deckard headset
Date: Tue, 22 Sep 2026 13:28:34 +0200
Message-Id: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJmsmoC/yXNTQrCMBBA4auUWTuQCTQYryIu0mSq409aMqkIp
 Xdv1OW3eW8F5SKscOpWKPwWlSk30KGDeAv5yiipGayxznhLWKdZIurr6HqDieMjlISSpUp4Yqp
 IPvSO3EDGB2iVufAon9/hfPlbl+HOsX6zsG07KgeYloMAAAA=
X-Change-ID: 20260921-topic-sm8650-deckard-initial-dt-19a5616b109a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=948;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fYGkUx/99Fm0c7kzSPNXjEgt5w0JRZzbxo1j3pn8PGc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsmZky9jGrp7XKVd0zocgiNoLsTguKCslSsazixqJ
 EzoINO2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarJmZAAKCRB33NvayMhJ0WUWEA
 CtAvsR9Std9hIOy6y1Wif/473bZqC7VF3mNpVeBQBl8ptcuzS43VcVfNRoeJIitsZmVgzw0YqmS35t
 n6GoK5ZpI7qYqZspbzXs2IJ523DfwhK02u9rpqYex6IgASd2j19h+i7KBHNut9DYYnM5QAZhw3vMtd
 Q7n2vjvTPja6wG+SCwFaStLW3Yq2WNtuph4R03sPypY83e8QSEVaoLSsJ9kIABsSN/f+YZC3/g5HlI
 EKZED9cmlmHmdjA9cXtn81rhkQHNWlNn3Pz2TrueXIM2tU8eJQ0FDvr82tf2XqC3b3s5azZHJcA3+x
 7U+iD89oZTRSSn+fnXqTyIj6X376SbXgk/sU74WSwRkoUxHtesvFKf8/5d62thuoKOxbo7ylpOz0fa
 OrTdNgkjxuBnQovs3u0GluAjSgOZEsL6B5JgdWwXbuUKdl1UqQBCcxd1V5pI04p944LXaRJ6NXiTaJ
 VAzkm9GHC8t5YNPcucuKM9FtWr4DvgA0DLX9M68egI8/6QZul1KXcLZYVOLKFDdxI83WIol4oPRpFQ
 6FuXGa+zDQwHSpb1JUoWnlOezEsCCA0nvLSLLBb9htLw92Cli25cLoxTA4VpAsMG24YxUtg7gADCGw
 hRPDCQm/nbRK+ZKtFWf43CkeMwesd991jSTOpxVc6UeNOY8xXF8V60159biQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document and add initial DeviceTree for the Valve "Steam Frame"
codename Deckard. The Steam Frame is a virtual reality headset
based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

Product Website: [1]

Dependencies: None

[1] https://store.steampowered.com/hardware/steamframe

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: arm: qcom: document the Valve Deckard headset
      arm64: dts: qcom: sm8650: Add initial Valve Deckard devicetree

 Documentation/devicetree/bindings/arm/qcom.yaml   |    1 +
 arch/arm64/boot/dts/qcom/Makefile                 |    1 +
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 1290 +++++++++++++++++++++
 3 files changed, 1292 insertions(+)
---
base-commit: 506632261e6aeb1aa05c3ebe4da0a9439153d746
change-id: 20260921-topic-sm8650-deckard-initial-dt-19a5616b109a

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

