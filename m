Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C6723EAA0;
	Sun, 12 Apr 2026 15:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776008573; cv=none; b=tG07U9Bf1IGOvrBt37tONUaMJPbUEIPC+atzEx1jBwyH6VtoZi56nJkgqwoxQBMSP4iL+LvtC0vYGrzrp+vuOIs5Y60JKaMExyOdPJppBiX3BHLTtCH81dk9u4pOIo+6P4adxEkVgRth6EvUAnwjeGeF6A6OmIZkNUfg6/2O/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776008573; c=relaxed/simple;
	bh=WX7rzjdyWdHMalIlp1Y8xJuS2CTkdmTQG8AZ0eVIwRI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n1+JxEpBmFC1m0KuPAgKZO8AVzWsMF8yPkjuDCVJ9Djh5nU7kq4DtG7XyGf+SudYvuHKWLK3PlojhkUFmNjWD3EDYeMgiFMRmAki/xIeVXLrVGQo73ulqSfHPidlKpJmxf0ySOk6NLCjxvAw2Q+j+nNVYo5aNW+pqUNLloo5GJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Xo7VVe1g; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Xo7VVe1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776008569; x=1776267769;
	bh=WX7rzjdyWdHMalIlp1Y8xJuS2CTkdmTQG8AZ0eVIwRI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Xo7VVe1gSauov0GswKPEv/sRFn7LE65DyA9ULL/gsqyXde6kjGIRgml7HlOvoAGX/
	 +rYBiZMTNC1tUXU7Z64xrw0wp9sAMB6VvwUUa/J7/jX8XI5HL8f1bkwYI9YaawVoRE
	 1juaorSkXlqo3KcFTx3oITD9/06Cpzur6BALhjhzk0YG9N1Qa//GcoGMbqkFgEoMvc
	 WL0QqMZOCpUrFniHQyQD1YkzKxqTeeF1rDmlypHvjqll24TNO0BvgPBqXqWzTBDywz
	 Oy19YaCub5IVGXIR2WfhhJhEIUrfQOoNoHAEoRVq3Sj3+WyqspUb42O35C+uGRLWgE
	 npY/oBGRiCBiw==
Date: Sun, 12 Apr 2026 15:42:44 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for SM7750
Message-ID: <20260412-sm7550-id-v1-2-958a673ff791@pm.me>
In-Reply-To: <20260412-sm7550-id-v1-0-958a673ff791@pm.me>
References: <20260412-sm7550-id-v1-0-958a673ff791@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: f43b675d0612e93aa1b138c08ebefbaf0d48cade
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Recognize the SM7750 SoC which is an Eliza SoC variant.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..3f67fbbcac54 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -519,6 +519,7 @@ static const struct soc_id soc_id[] =3D {
 =09{ qcom_board_id(IPQ5424) },
 =09{ qcom_board_id(QCM6690) },
 =09{ qcom_board_id(QCS6690) },
+=09{ qcom_board_id(SM7750) },
 =09{ qcom_board_id(SM8850) },
 =09{ qcom_board_id(IPQ5404) },
 =09{ qcom_board_id(QCS9100) },

--=20
2.53.0


