Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAB212FF69
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 01:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774662035; cv=none; b=f0MFiSaozlOdHHCt4O31tvfoJfqFHM7STZU0N/Cy2NM8AoBCx0kYxbUnAPJv9aJgCTrmbsPEjF+84FH5mKGGFFIC8xUS16GhkayIzQ2tm2b+/D89lj0LaKhOZVCWAWaG3X8rBnwPPeylWRDQRGbxA+VDBV0lL6BCzR5o7nXh6ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774662035; c=relaxed/simple;
	bh=YKU/DnmNIxKk/G4FaBPJrYaaIFx5k+4NkZwdBNpIKdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UaCyvtJ0UNLSKUKQZrOwDSP6PJwJ7DQ2Xn3DZngw1YfBR9+m4PRO1aiymXBTHzEstWOf/hBkiE7cuSsxXvjdvgr7N/UtdRPhxQ8Y5OOKdAe/omS596YXPuXtXHhKUmx2rXguBqhj5izOiqJIDAtmpUzEfTzXXLc8h3pocV9SMhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDpfsk8h; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDpfsk8h"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-89a06bc2f1bso42678186d6.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 18:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774662032; x=1775266832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMK0diFp+y5MtkQk4eP+T+xRtrAK1MN5VxTGJH3Ujrk=;
        b=RDpfsk8hWxIWsHxjL6W0kYjPUu+r37UPgSDgPJNBsU7h1sKwTEOpLbNQ7iOzWS5jkW
         NZqzBBnPYlZmK9T7VIudNhZE3AAIPwY5pASu4/ROS0BzlnaVaD5SsCZnxrt14dgY/q0z
         2S3HOUevslJK7nGrlNTm7vU1c6QDDn9b9u8k3eI8vN/7IymnmZqUwFGol3AZW2NSiOYG
         PskScbo9Ml+KUS/vmQpLlpVRVc61wO8pbQQaSe57S/vmtdfLII/meLw6W67bxvI0MY8e
         7uh94qFTW4rT4IefRa3FHR7L+xRSiQgypTWXwrgPF0SaYYgMDHcXNcvra5IPHRVgh7FG
         GyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774662032; x=1775266832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMK0diFp+y5MtkQk4eP+T+xRtrAK1MN5VxTGJH3Ujrk=;
        b=oQ2R/1q01v1QIrmBffsBMjfjRQyFZ/VmE4BLc+WmtzryoCO1xgk5iF4Dgk2msa20AA
         iJzcFpcIQy8TmdDYeWVoXftbvhazoWH41uyoqlDtqFGaYPUnAiwNe1rhFOuDRVweKYW8
         7RVFeUKbuU4pnKlIF8FdlXaL1RDUredPLew8vYsm70wvT3E8mvepG5kIg3HB2RQfV8dj
         SOFIepxDoAIbk1Q7pIbxi68Toif9uDkeXqnapXKL3Zt2bpk/5GJh1duMaNrxlSlj5TXk
         y1NyrO7CrzKp8CFaz/FUXttj2fA5cnTv4DAf6TFzjy30pEL1Tu6YbTeKTkMVm8Ock+mK
         W8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVp4mfjhhzCVc/bPl8VerlVQM234R2nSggV5+qdDVYDoSgqmja6OU3DkyO6Cku2UXDVOcqMRRHa1z8V@vger.kernel.org
X-Gm-Message-State: AOJu0YxndNfD5KYsr+ou7kea/x8FbbT7J3cCV3lycOs4ZbV1RxE4yo7+
	ZoC07vgs83ddtmFfg7NThAkUCAysaqFhK/niqe44CJNvJV1ajYRD7YjT
X-Gm-Gg: ATEYQzwuJoaYj91i2un2Qu28JlXzIfHfmx8AYQwdv0+ryQZGSZsk4RbjiRdMAZceGAV
	oPUetCUqajb6UT4+KgM8XWmiuIi3HgXkT7OozqaA6s4ZoibV1TmfajoVEy09QOZ76tSfjn1wdM2
	c3FeHN0RXLWZTHgVmruhdbfqxpqysdcnlY63hfMfTyg/eUnWyggpRnv25fjOogc0K+p40p8rzgh
	JM5VSoP/alEHmSc6ci4zdkmdRlWMEBZlbZDV/NvzKF9y9er+Y+uYcs2QgyMnsjaXkoZohYYcF89
	aRCUcwr9OE4JiGayVaxKNKbwossGNSSqqp4ACBV8nxSPLcuDTUl+5liL/nQpuxMM66dOjqhSzzU
	e3sqFtJW1gD0eP5vFUDVbp3YWWpQOQlWv55l73B5GXr2yCVnYVmB8eiZ9nf6+pFdiDwaiMObgA/
	kYLqlaG2UVX+60t+8GslWjqyjRLmXpEM16xCxD
X-Received: by 2002:a05:6214:f2b:b0:89c:df61:7a10 with SMTP id 6a1803df08f44-89ce8f02e4bmr68450336d6.58.1774662031691;
        Fri, 27 Mar 2026 18:40:31 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf95f3c1sm6396276d6.40.2026.03.27.18.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:40:30 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 2/4] dt-bindings: thermal: lmh: Add SDM670 compatible
Date: Fri, 27 Mar 2026 21:40:39 -0400
Message-ID: <20260328014041.83777-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328014041.83777-1-mailingradian@gmail.com>
References: <20260328014041.83777-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SDM670 LMh.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index 1175bb358382..ce72347e29d1 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -22,6 +22,9 @@ properties:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
           - qcom,sm8150-lmh
+      - items:
+          - const: qcom,sdm670-lmh
+          - const: qcom,sdm845-lmh
       - items:
           - const: qcom,qcm2290-lmh
           - const: qcom,sm8150-lmh
-- 
2.53.0

