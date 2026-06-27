Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59A330F932;
	Sat, 27 Jun 2026 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782582618; cv=none; b=JdwdDFLHAUA15hz7Ooeqb2Q15so2pUOup4jn9QV5VyRV6gH943lSKwOUf7muDHdRgKw8KGbu4nP+qM3kSFysekIDKLVb6gKfUfGd6AeeiU5y8VtViBc/hXd5dMY75Q4zQyI2AZHigqZNK85DVh6U7GF71jaSlgR6kJOaycyulSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782582618; c=relaxed/simple;
	bh=/HNG3f78YIRsRKCwKJNDTmkSwLWsUieIR+XO+Hc3QL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9wQ3b1HJU3cmUJA2GCV5alL0OLaGrmBvYzzf4Q/AGnoHvHrWXU/riKDf62S/J/uEbPs318BaAMMrCuHiA7RdcvKi80r8tb4FKkG4vCOeO6Hxcm2Oscv4ypK+P8/dRFyqqNCgiSatDmytxlJykUgiLG1E1l4hjKb4et+7AuOm18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klJy8mq7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klJy8mq7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76794C2BCC7;
	Sat, 27 Jun 2026 17:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782582618;
	bh=/HNG3f78YIRsRKCwKJNDTmkSwLWsUieIR+XO+Hc3QL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=klJy8mq73bhbp75m8ihZGQ7E+6DHJS7O0oQZF0O6IMr2mJgr/xLNGLtAZ8tRlAEGR
	 3Z7eghwIh+oDyEKnGZwl49cZCIykcf7P3zde61QEPO/V5do8OnHaynpWFldSXnTsyE
	 6cgFbj5GT0rNbGIlKRNS5HDzxcLFs9piEg168kmP+b4W4Bp3HS3eo9Ye5y11BDSMNJ
	 DYenJ6kSnJ42GNtRGPXqfnMgRPDDFOYBldukcSp/SilN3ZUXacNy66W92ghixfRASw
	 F1xmrl3sy2HveXPvRMVq7GFX3cnp3zgwDl3Ck/bHl8izhowC5au3atslveWYw8aRKV
	 39976JHRM5B6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C24C43638;
	Sat, 27 Jun 2026 17:50:18 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 27 Jun 2026 19:50:16 +0200
Subject: [PATCH v2 2/2] soc: qcom: socinfo: Add SoC ID for SDM850
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-sda850-v2-2-44bf46ade42e@ixit.cz>
References: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
In-Reply-To: <20260627-sda850-v2-0-44bf46ade42e@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=925; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Xn+qNAcb0PhgtgeqElX7l/kJ7Cxp5jn3JqQBWNWtfAc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqQA1Z98Bkl+uqsNZLU3rSbDb4orvxGE5iyjjxo
 dg+ikEit1eJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCakANWQAKCRBgAj/E00kg
 ckDwD/9OT1gp9OuR4ZFFwAEpeMmEavmBLdHmRZWYf4mkyYE2q28t+GmEpiQlD5rbFbMbbHM6Q6t
 mrUp5htDIy5hvC/c13936dA4iHzSNYg/GuESsgqJXOAwyOUAhWNOi47o3fjdglgVFuPlyRdaCwZ
 mw0ZYVjnTyyzPpirJzc7W2aiTtTEB6uAgGlYaYBBz3QQVp9DnJ3Jg7VSmXPg/qARI8iPmJJswQ/
 vzRolbblALhvDOfhQZDjlMCH2vf726zWsBtcAd7QoXySiiVr7J3A0ACYfTCqJ5BFbfEJJCs+ySR
 BPvUhPXuYRHcdcNfarn+Vc4fIFrowgBodKnUZ1eYttHweCfx91pITKe2BK+NYMLWxb1TAenmCfA
 6J3AaCxK16A77CP9qBafs7A+L3nhJYd5bMUTt8Cankz8ESxAqybFe/aXbeP4LBmPLp339BmGyZX
 IFnvQQU0PHvOglFaNl56hy5WU51Pp1ivJUUuHajS5lDw+hpuVMkr5IYxdcT7LOXnkZFp7A2EiQW
 GVnUK/Byx1pVOkhijsN41w6hjC9ufBlkyiznFM5O7+ZDXAETEp9hMaloTcsdDD7XF0au+Xp+TaG
 3npwBbQrh7KbX/T9IfI47PwFz54TSt5GdSPst/Az6WgcxZjX20V17A0l7/ZLMW7GwSbmcGVmTN0
 REA/XaCl8mWHjuQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Recognize the SDM850 SoC.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index af418adad7aaf..1836e226a2945 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -420,16 +420,17 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SDM450) },
 	{ qcom_board_id(SM8150) },
 	{ qcom_board_id(SDA845) },
 	{ qcom_board_id(IPQ8072) },
 	{ qcom_board_id(IPQ8076) },
 	{ qcom_board_id(IPQ8078) },
 	{ qcom_board_id(SDM636) },
 	{ qcom_board_id(SDA636) },
+	{ qcom_board_id(SDM850) },
 	{ qcom_board_id(SDM632) },
 	{ qcom_board_id(SDA632) },
 	{ qcom_board_id(SDA450) },
 	{ qcom_board_id(SDM439) },
 	{ qcom_board_id(SDM429) },
 	{ qcom_board_id(SM8250) },
 	{ qcom_board_id(SA8155) },
 	{ qcom_board_id(SDA439) },

-- 
2.53.0


