Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F6E4F93D2
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165804; cv=none; b=YsHzxxC420urNnn+HOsKh/xyHEK/RxD1VHdOV0cSNkLWj+GYg/Z/SDvmyVM/K1sM2D11Ki3loZg76mzIFsOIxV9uehOFbcddPYDjP4IFiROgMYHyBbB4I4vYVRCJAy1f4MQzocN8EoHTThS9bNv0+gU3Tct1zUL6cFZuTHXfyjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165804; c=relaxed/simple;
	bh=3fuxE0K0pdKY88jlD8b9+b8jsBFzputLxXJvAFlNEoc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F+Y1TbjsEdKDvDbkhLkfhOGQZCAX4JbXbPgw5KHUNSJ4h20o8+xeSE3alSp/rQQT3a5Ih19b7625Uu8Xg3w1vsXY5h8+piOD1Es9YnuVG+4pRVF8DtmOCpUraJOSIFjV5R89B7or+S3gkgJu46e3fWMrF+wBWN4zu/nXugNFRK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QuNQG72c; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QuNQG72c"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so780234f8f.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790165798; x=1790770598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B3p/QU7OMVVYXBcpiGeqAoPHE1xk40WRckQQBqak4y4=;
        b=QuNQG72cCnzHBrizFkkcS/yV53tq09AzzS3e/jSS3v2VPdMsJ2ePthzOOVNcnU1bZN
         RsvyzwiIxurFD4zP03/1+ts4bHpmaci6jSQLBGPpprLBCJQlNGrBWDfKiB/y+UFx7EJj
         lQzs6X5iGA2y9F/8YMbGlhjajywlbvNZ9cyHaV7K/TzMd6tcDd5MN0vj2xOoP5VWKyyI
         C2tbhEYNK4a/eleB+6IsKC2hFxxo5Ib6fJaQOVvR/DoXQlljeCRuj5q1KoYVA8hzYMfO
         OIJf8m0Z+AXaSeikAyS1IKq0t1s3X+8zriwFTJb9FQgPn0QUMekv2yJ8tD2ZlcFM6ESn
         N3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165798; x=1790770598;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B3p/QU7OMVVYXBcpiGeqAoPHE1xk40WRckQQBqak4y4=;
        b=ELaKdBiagL8vwge2YK9QgMJ3QMg0louJnhDvk3gNeXQMi6U3OBFyRa5Flf8XDlbjAY
         tm6MDWYATEk+8hO6EBR4qO1eFeCjp90+DE23QEBr3MWg7WDKkXDAfivEcbpdsq8ULQBq
         WHWmohK9YbQ/JCJdN/C8BT+On6ZAJgbsgNHQ3vcotsM+SBgJC3jFk9JZ89VS7VXjuJh5
         HWL9Vhq49ri1SXSNGVRuGXr6RT+ZKOdDbupY8z6QODqRBOcYa8lLpIsN3S1UlWS0GivX
         DfcHYg0hYS64QOv1q/ql+1ZC4uYbYsM/Bnp8OvO+Z8aRVP/yq5scT5mYzQH+U59SgmIS
         Tdlg==
X-Forwarded-Encrypted: i=1; AKwUvBz02x9aQyIwVZX7iWWHh/imICg3QWVeuuGrONz3WPntmB8pWpXh/1Z1NupHurAFspWOXNhUi9H1Ym/P@vger.kernel.org
X-Gm-Message-State: AFuF++mZd062iyrPCnbbg7snfQO/bBVyXwIX4syy4MIO4Fne5QYnRbLx
	BmQpTWIemt0uaY3ViBZpunzoTI+m8qAzvd2OLT4F49jnMC9jVhVkJ1tq3MgQdOR+Tds=
X-Gm-Gg: AYBFou075lyqasnOxDCfON+QC/PuKqZJS7BnMdtnPohR7iYfwQGJFPkmN8xNFZb+2Lr
	mI8MPgO+IcM8II/RGJ34tjwRDZWl+0TrAhvc+Z2sYK5m9wOhESSUvTzOCfgYEXMwWr0sog3SopO
	j5xUDKxCWdyUQhEeXcc7+5aLYW3muEOmO/qmAKXo+xT66FyCdYxpqqxJdcySDAlbPw4gAATbUVl
	5hoVB3KnA7gqiXO/x/8TTvAaqcKWqvyANcooCnnDf4k7fZRj+zzFRRjV/ChLGdHX8E5zz/4OwP+
	D8/774i/OqOhlO9g8Ucb32WcE4GR7KFK+6NhoVUnSg2ykx+hcCqIf37g7VTpuwYv8DYzfSrtgAW
	Gd+POczq2B5tR5w+DNTFmsvLoCh8XAa2FXrrMDlpYFcu7GTItlUislv/7SBSjYikyrHaeH8lPIw
	DVsjDIp7i9S0T/LCxnmm95doSxv+4pzEF6E+HiJyb483E0RaxnDe0MlVpjxntWdszrYpqHn/mt2
	FdfDesz+Uho6Q3XEhc=
X-Received: by 2002:a05:6000:2506:b0:487:c4c:b7fc with SMTP id ffacd0b85a97d-4886704a279mr4171071f8f.4.1790165797727;
        Wed, 23 Sep 2026 05:16:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm5410298f8f.33.2026.09.23.05.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:16:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm8650: add support from Valve
 Deckard headset
Date: Wed, 23 Sep 2026 14:16:31 +0200
Message-Id: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB/Ds2oC/4WOwQ6CMBAFf4X07Jq2sUU8+R+GQ2lXWMWWtJVoC
 P8uYDx7nGTy5k0sYSRM7FRMLOJIiYJfQO4KZjvjWwRyCzPJpeaVFJDDQBbS46gVB4f2bqID8pT
 J9OAyiMooLXQjeGXYsjJEvNJrK1zqL6dnc0Ob19nV6CjlEN/bhVGs3q8m/9ZGARysVFiWqnL8Y
 M49eRPDPsSW1fM8fwDIIw034QAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=3fuxE0K0pdKY88jlD8b9+b8jsBFzputLxXJvAFlNEoc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqs8MjiU0x/zgmEClWkgsaJjjQSqOX50KRJE6fETJM
 vLjSdzKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarPDIwAKCRB33NvayMhJ0dAdD/
 92PxwPuQFzpWbvqldCJYKmTFyhV7ZKbzcPXp9lnnss8iBvzHrP0EnPo5MYIXTSKtEYEz96nbuaFx3h
 5iFIVLbvPN7HgZ22YI8ibfOz8n4HNK6NXw1uYq6ywjBqyhSuK7SH+dv1glevNd9lJOgIrUmY+vKjek
 vK4sH+RfuWahRp3uPf0CyWok0KkOjV1Lz4lTjElKYnwioVU9YlwCE2TH0i4SXvWPOSLw9r8ZCt/5bs
 GkDeQ0yz5RkPLlUQg34KpihjW76ZOPYicKp0rx7wZSCLxRxbUnCI7780QdhpA/lxNCuWg4FFpGljnf
 3Dr0sDUNSXGPXMai2q7rfe4u5LY9N8inrAfOj03iYnIDB+iX2oeDguFkoYHAWl4H/lP5vMa35E1uDv
 830YxzyPXL6R/5MvahLzDabSY4AzVAMlYkNrYUGXiBTnQAWfWyNdh6VTaLDr/2h4OORl/qWWgYqqSJ
 5s5f6Nm6VqwF6ZdTPgPOcQYAfVOqKLsAtTIy6Q5pEsWAM1/vw3iCYRZIRUIEuwEFYkXDg3Rnp7cEBX
 6lQvq+kCOc/kxTYxIi7QMGrd4BxGEzjZVAOdUmYGDyzYaOUtV1IjW02YPKW9DEQt4+MeYFbx2d9u6X
 IN8LK+k7d6iliVyBXDYIr7nXeIpgIg8yM6F/3oWGD0T4OtBbOyCKXxcauVOw==
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
Changes in v2:
- Added labels to smp2p to make removal of the nodes cleaner
- Reorganized properties (ranges after #*-cells, <prop>-names after <prop>)
- Use "0" instead of "0x0" in the reserved memory reg properties
- Use proper supply properties for vcnl4040
- Link to v1: https://patch.msgid.link/20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org

---
Neil Armstrong (2):
      dt-bindings: arm: qcom: document the Valve Deckard headset
      arm64: dts: qcom: sm8650: Add initial Valve Deckard devicetree

 Documentation/devicetree/bindings/arm/qcom.yaml   |    1 +
 arch/arm64/boot/dts/qcom/Makefile                 |    1 +
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 1288 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi              |    6 +-
 4 files changed, 1293 insertions(+), 3 deletions(-)
---
base-commit: 506632261e6aeb1aa05c3ebe4da0a9439153d746
change-id: 20260921-topic-sm8650-deckard-initial-dt-19a5616b109a

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

