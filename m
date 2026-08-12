Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B0B3FFFA7
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 21:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570259; cv=none; b=YE029FuD3foNKWUHZXNG3aZ1t8Hu1GoR+qXopr+YdLhnOZeTq+1W9YQKBbwqRRSuOY6RpYHpUhdufDjovLysJW0iP3rIXSrORwyY7mcYgEDmThGLX9gHe7XdQ6D8pOEh++06ck37yVR1TgSHpSgFYOpVhct2z/yGyurg0q0IYdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570259; c=relaxed/simple;
	bh=ZauFLZdTU+txgWmmv356NEPEzXfMT8LD2hrE87LiP44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MW1iuQ9fGNEPtjapuBI9JIGgRLytYXiC4Iu7b7C/9KlsqBo5LgJyDpQFv+SBOxymcadm5ImdGqrdc+geQJuHPZ4ENwdCz3fMwmPV/OhUj2j32Fq6UmDvCc3VVIu8asKuxZotXybi4rzS4hUZDCP9FO3GOjQbNstoJpZXoNaLOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=koVw9TPX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="koVw9TPX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49553515a8bso20389625e9.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786570256; x=1787175056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OefaEnBP+Xtfr9MuFwvtjIyVzZPHMg8J6vmP5uhECmY=;
        b=koVw9TPXnkRvauq0fZEUkgIVAA2gBV+Tnb7bbjrtvf8Cz94mUCSQnDqL0zJaUaHAxV
         w6G7QEdN1TN5oGEpL5gVkrFNjDU8v3WQQPpAS9qftJk5teMS/vKc9vvuQN8B0UFxJXOs
         AO/19njDKz9rIpIYUZkfisfou+5WU0Wb7XhcWgvntP9AeIDkRdVKiQlUWc0tEQaiRbVP
         zFRMyIkubN/t1PDnETt52uzS4+VpiEu/L3F/fGYVAVlfEs8o8kydiCesE3ychyOm0lAd
         MLToFVeK9jboHF1ggP+GIvBG3diSYaAzymw/AGq9hGGHhp1N2IORwmn20n6tU9YaUvoK
         JewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786570256; x=1787175056;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OefaEnBP+Xtfr9MuFwvtjIyVzZPHMg8J6vmP5uhECmY=;
        b=sTCTqrDSjteAZAPkEdGb/lhECbLr7/rfjAv4C0BeSbRpJSADEPUjzHvhUuzwXExaSO
         9yRLKLd1pnIvDoRFYJ492hK4yVJbF+hu4uE+0vjQsLjPQsmUzcSPT2u5Jwgc+BB4aYbD
         UKO2e+EosZOfrOH9KjbHrfATYlINYSadqHZEsnFR99Z9atA3HHsu7ZMvbdMpvk2dDAgS
         TR5dp4jH63mqJL49x/EtWSkopOcgd44urMEG5n2IWL/358gE4ymJ1XA+RYUdEN5SSc/y
         avd/f8uMA/UDMeO3FPqLjZZLFeyy7qMXml5stjIDOMQRgfAjmvCuBpI+bb8s/WkeiPS2
         /0uw==
X-Forwarded-Encrypted: i=1; AHgh+RoFHqDLQ+BNA8M9Q104cOKLbYU87ZsA3Mk51tUhVTF7a/Tno963FlMlRMfa9uzCD83J0rSoKepD99B/@vger.kernel.org
X-Gm-Message-State: AOJu0YwXuOH/r8qPfmwK+P3SHeO9gtg97SmfGOoWYNGAOr/R0Ma9zWI+
	M8HcGgKX6X3okp2eIymVzJCcBhGc9EGJJGopDl2CCPtoF/ERubNedZyrY5i/9mSo0/g=
X-Gm-Gg: AR+sD103VRBpEqUhXdcGQXOKjolFyukXYwpzIfCNcJuChtJKnbFzlLmlqe9JIlU2lii
	MoUZ0tChTvmCDHAdswPbeGRCjkdMJx32g4EuAFk+GXkAn/vegVcbGmri1dqN1ztCF2Js3Ls21RE
	rSLw7pWkqwDA09A40UZKtKsg6gak3aYmHUJ6tn56B3AbWqoc3GksmaRcsS7ZCfuIPmOZJdCQ7Vm
	/dON+f6pqvFUMOHxUjj0X6oQyrIMTvqnNYJK15Y+Cd9iRFZMI8Gx8hLepAzUXnSdg/eKIxK1twN
	Eb++Hlneg3Wg0EhKZXCVL+djwIaNzfI0VTQucVygU0tq5eW44mpCwiFd4P0Sm6F58YjDcuRtRbA
	8DhVB/PHno+YUeP63D1nKTykRggq/AwC8WcNbN/ovFUTgHpoMu9tapIQLOH+0OYbgKZqP1ObX8g
	/68qmYNYxOKKPWQGcEGIfjGFqb3BhEi0tFTqbPqkEJuZPIdolZ/4kHMeIAr04=
X-Received: by 2002:a05:600c:310e:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499821881d3mr6458585e9.1.1786570256121;
        Wed, 12 Aug 2026 14:30:56 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:282d:879b:d1fe:f977])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815a5b6fabsm665009f8f.31.2026.08.12.14.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:30:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH RESEND v6 1/5] mfd: axp20x: Constify axp313 and axp717 cells
Date: Wed, 12 Aug 2026 23:30:39 +0200
Message-ID: <20260812-axp318-regulator-v6-1-d6b84b55c000@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ZauFLZdTU+txgWmmv356NEPEzXfMT8LD2hrE87LiP44=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqfOJ7z3JPOXfs4Us1c2cB9/AAeP3CY1Ezg1C34
 l1B3hrwpCSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanziewAKCRDm/A8cN/La
 hTUND/47kRYTvrK0p1t/Rk3HhntWINVaH9muZct9+QebiCYZqJbRo/8rcv9meluUuO8DXATwMyV
 8gFSIzRjpaXXpvT/yWmqyP3d+c3s29Q09JmQWEpiN7WH8/dubwUmIEp3lOr7fFcDzc1JirQH0vI
 jK7EX4gFH/r8MUt03NeK9FnBpxqnwFT9ZUS/b9Mlb3+EVQxRxFGjAbAQrUEPTaKmKk1UHpHsLBc
 RWXZlDZsgpwh/GTg5NDzKlv4uNh5DOvQQ7Akn35eJhyg+h0TDd/ZBPCGrx99TzQsI7FvLVdp81j
 JRxomU2g6WcCQ45z/0aeGw1GQFDFh6mDxamuMDHQ6NejbvI0KZa0EN5zuV1cW+NQv2MHQOMF6BJ
 zXkIEIBEFi6/P5ZEYQwci+aWiR3c2LlBo3z0T42572uOFj25d66fvEQEu8BW+fcGehRk6ttORMU
 ATC/styss9CimyiSvVp4hR/XR3/TKvAl6HJOvlIXS+GH/1qk7PZQjoZ2+1DTE/ff2bNya6VRj70
 /YBOXC8TtkoFrvgxZosP8ntTKtmaXB/++zRMPSqAX+pvy1OJQ1hezQSM7nxtaUZ1jojxzqR0LJp
 q+NS/ENacR6/Oc0zR7yEWfopEFv4NZm+KyRCA3HIDVUB2iK3yCfmG3Qmzf/EQkY4VBJCH+7MH2T g9TjSBSn+QxhUoA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

mfd_cells array should generally be const and there does not seem to be
anything against it for the axp313 and axp717.

Constify the mfd_cells array for the axp313 and axp717 to be consistent
with the other supported chips

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 679364189ea5..22baab6e10fa 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1055,13 +1055,13 @@ static const struct mfd_cell axp152_cells[] = {
 	},
 };
 
-static struct mfd_cell axp313a_cells[] = {
+static const struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
-static struct mfd_cell axp717_cells[] = {
+static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
 	MFD_CELL_OF("axp717-adc",

-- 
2.47.3

