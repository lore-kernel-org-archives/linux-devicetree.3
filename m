Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD45546C4C5
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925195; cv=none; b=Hu53R8Lf7m1DMjm/3/ciGQwhVIIm13vM9dJaP4VRPa9BPPE04DPmfx76efWWcL4Zb4uvorW0kY6gzdR8/6+QYJCs7PcvogIbFWWxoP1aktBVTB+U5x/6UJYucKcGA0lBXexEgLfwqwPJDYS0sKqRU9eUv5iiDBsH8dhzrwbHRJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925195; c=relaxed/simple;
	bh=/u8UW5KKLLAQ7lE94rbg2jTG076DDNl8pi0T5YsPqXc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DZuErccGOdt9XgmPLF18xEywxOfR6ttsJ6qDkJeCL4KG44fpL4XYy+1MdyD9gSLV3YTg0u2qCb+yqOqPEY0EN0LGHBTr0KbfKe+essp8OEYj0j25nK5TPTJiSSXeiGe/a5PmfNv+Mgje5RpqZ5QzCUwFkm5QzLxAQ1hEA3WgfTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=nAW61X2/; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="nAW61X2/"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=nAW61X2/KsfUrHv2WqkCt5+3ZFTAgwwKdDIGfKpdPGniI9rWa5n7V0v/b/5Bc5yy9JoUQjryGxRq+MOsx5ZndP94fWtqlwucrlgSiY0y44+88/ykzJ6IJex65T19hdCZpi5HH3HFGRVXILvJgXCuAi3ck1oL/f3WhavJ2SKbS5ECDgcncJV/fHRvT0UVujeDF4TrKsoXLO4zKtejANiiOyJaTZxNTFz79YX1nQmAPIzD9CO0O/v4v5XUWhjzNzhu+ji0rZYaCHTpZnCJAx6NxbZEwrSkVIVETBKuRa8F4DkvUCyJhncrpJCTrHi30EFyuNA6FQ2At0BM0w/6QXGurw==; s=purelymail2; d=purelymail.com; v=1; bh=/u8UW5KKLLAQ7lE94rbg2jTG076DDNl8pi0T5YsPqXc=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: devicetree@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1236780859;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 28 Aug 2026 13:52:50 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] arm64: dts: mediatek: Fix pinfunc headers of two SoCs
Date: Fri, 28 Aug 2026 15:52:45 +0200
Message-Id: <20260828-mt6878-header-fix-v1-0-b70dc9b2479c@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G7BFavQr4qG1UXNwoRURxL8bP
 M7AzAOZk3CGrngg8SVZ9k3BlAWMi99mRonKYCvrKrKE6+moIVzYR044yY0UoqltMK0bJ9DuSKz
 6f/bD+36Wt25kYwAAAA==
X-Change-ID: 20260828-mt6878-header-fix-8bd142b196cf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787925168; l=895;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=/u8UW5KKLLAQ7lE94rbg2jTG076DDNl8pi0T5YsPqXc=;
 b=EE+2KyOZ6REjfgYNnoWEC37uIZ6e4QDtYry3/QrBnOwIYdh1aBk6en9BUD3pczEmQ4hkBgeLC
 6aJplp4Ho6iCA+hdjZ32rYfOKUzjhSReRMWQDYeA0WdH/WH5ZkkLNxo
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=

Hi,

these pinfunc headers were including a header ('mt65xx.h') which is
outside of the search path (it's in dt-bindings), thus causing a
build failure (CI couldn't catch this since 6878/6893 don't have DTs
merged in yet). Use the correct path, following other SoC pinfunc
headers.

Best regards,
Igor

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (2):
      arm64: dts: mediatek: mt6878-pinfunc: Fix pinctrl header path
      arm64: dts: mediatek: mt6893-pinfunc: Fix pinctrl header path

 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h | 2 +-
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260828-mt6878-header-fix-8bd142b196cf

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>

