Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F3C2D7DD7
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649450; cv=none; b=QI+4rsBhSkaXgzJRrzwveoQVV3AxUiCwqLDSdQVV0QJpIfYBMl1cgt7bNbJ6sgfZqTUxy8nwCUsrnJRid9fTrzhkOkRqBCsNkCHMhneQbnHMHTZZHVxlo3iGCL8P0bUvT3Jtep5DXF/iHK5AsnvMpwG/1AY0noYqrDbMwI7p6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649450; c=relaxed/simple;
	bh=lihiiTwPifUcAtDxUq5btFnr9qjxR7ME5vy/TYYPh8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8PTAqNOwtdz+Xg0JOV/7b/JF5yPGUSmfyInefSJgx13Keql+oNZR/44zCekbyT3O3SAr9+gKrHMX+TOgzzncIEzuhi67wA8SaH9cDxYXzDj5MQYJ4qeqhCbitEqTLN5qJft6R24WIdQKOAn2+noNm8vs2VaIUomN0pSJ1fqPjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrxZ3reh; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrxZ3reh"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50d7c12e48eso16890251cf.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649448; x=1778254248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSbjpL7+FS6L/5F7be2H7D2Bc6xGNNobMjYaVOSt09w=;
        b=IrxZ3rehaIOyFYFYa1HkvWu6k1YGC+z+JopwK6654nUFZbS3WlhWRsgAu5IW3OEolH
         KD4RULZO1vIxm06jm8FBG0VqieeXQxWxBXEDOYNEWx65Mbodl6No0huvmh9r7djPMeUC
         CzFshOjSvEm6g7dazL7vV7zJe5S1VMNVA79taD2of5W1w1lM5NPntZNtJWKNJ3xvsrVI
         XE+UjsfFXqLWanMU8t6Zq+JSRij55CqvnqeL3j80JZibA5Gq5CVZtPNJ/WhOuv1EPl+p
         pUBUC5azI3DnGmPk7u/lu8tIa1Q4Rcj9Vs1erlfAzxZsUUHpbBykEN4CXmKkkRBEIzZp
         YHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649448; x=1778254248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VSbjpL7+FS6L/5F7be2H7D2Bc6xGNNobMjYaVOSt09w=;
        b=NB4VUw1gm8zKbSJpyH5DMY1Ls4qkAWiaFF8aw215OVOK/F/Jn8UymHux7E49KREGo+
         VjXPgsdeKpUE2WcQpVBvBzZi/JuM8hgqvZFN9xPSWphgjGDKHLyTu6tRR0BmVpN2RGB7
         zNbDZQxDYbAeZF7tDsttiUIE9mfRl/oheAAzgmDGiAXZ4GYjm19GthAWX0jggohNH5Om
         R7PKv/0ERF+x9zP2CrlEbplAlpB57b3BBSq7SPMhDFm8NAtwUZxOZrvut3EWXsamScFE
         YEyBJNmAu/CXKyfPJPawZN24Zu2mZbe20FFLs/AiE9rzw1McomwxJ6DABPxMLji9MwUj
         7z2g==
X-Forwarded-Encrypted: i=1; AFNElJ/k3TQFSQ22IHov+BLnp2luLixmyWk61mYm5jWD332FCTzXNyfax39KGJ+UDP4HAUfyN7gTcnNC5Fmf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx90QmMvuNoW+hRIL9pDjGSFyXByK3jSpvcA9zHhaxUVPbRQ+Se
	wtS3SveoHfgYXVRY4DjdfDZujeMUf44sXNTi0VCRW25YGhgw+INzh5+s
X-Gm-Gg: AeBDieuyXfpTJhJ1s2706Kc8PPr/YPkYX5wXcq0ZeOxvsgt+9CS1le+HrRZZGDhBFrZ
	Kh/RIf5lnQndbRpPaZbrgvKlgN1+0ddGBeWeU8iBm5aJ6YAYCFBtNOvQkExHPN6l1jGrtYUmokY
	h4rjoBiM8Tp7k0in4NBe1rBBD7MeHYhTsTxfBBQP0VBZsq1qgOIxuhXxY+ZvyYUkOQBMj+xjQiQ
	T259J8pUWGzl+lwi7e13xmuKDD/ms0Zzo1f7BfvPKwMLHPgIaiw2x0oE7/VyCnYIdTlza4u8yYt
	ca7X2xNu91r194K3q1fZB5ceWh3zcvwB0GCjXpeXpCyd9RHKJGOE2NlhFRiez9lMXkpFio8AOG3
	HwEQpjM9IhoyPQGMMlZ4Q7cxNjgBDFvtA88zm7hdjAboEX6d1JO+AbJbbK+LhvjqCHlU7cqOSRf
	H3Lkj1qQ4lbhBKHiycdLHY06eSPVt610lqPe5R
X-Received: by 2002:a05:622a:5d11:b0:50b:2dd5:2be with SMTP id d75a77b69052e-5102d0f99bfmr68786081cf.13.1777649447924;
        Fri, 01 May 2026 08:30:47 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51043c1b8fdsm11833831cf.6.2026.05.01.08.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:30:47 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Fri,  1 May 2026 11:31:14 -0400
Message-ID: <20260501153128.8152-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660 based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..63c744524e01 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
+          - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
-- 
2.54.0

