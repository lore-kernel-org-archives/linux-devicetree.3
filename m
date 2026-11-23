Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445197;
	b=FW5UlsRpYm7euY0yClaNk1/j6xah6SwdiifD9/L1lfsybpzfO6nDGy/S0mEpSL0hGqif
	 uEC0Axo7JII3/tHwgaqt18ha71MpLK/o6KPHpx0zzp4cLXGbFuvGiOdxSa08YHobmLCfH
	 /giksb31dKtgJA4UqwW91pApfggXET370HESR851MBgbMiNv6MhykprwfO/g1E/xkhMmA
	 NYOlCaooT5FYDrnoWNWv+B9u6Wukt4Q+Ql+CJoRZ7uDBPx9aNhwWY7Ar491Gm9JpEtlaB
	 hWmyBJrC+I2xJkFyuE/KrfRYHpy/CAKDR5q4gdqovCZyvai8U0dgQ3ISGB7C62hvPLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hOiDALbPnrqA6KJcy8uRK3cvX6wgGPZxTJtro65qlmE=;
	b=k5W9U/DXcA0t79SXWuMY/a8QpUe01evzOsQ+Y8gg707+qsEK2hN3/bHTNjWhsR6S419/
	 DrfN2kNUcojd5ryq7DemseXzavf6crcpVKYqpba4XuadD/PnAWIRxnyL8pLUF4+cBCOMv
	 B9bMAD7FxF9tBWaPoLMHiDD/Bk12USB6d+3vYJKkT9LxyPxUccJ7lFjhn245qeC9SSPGR
	 oxxow+wuXC2F00W9lj0bfk3kWKuAt51cfrAMcnmawUl5GLMsx3e7vSoW6yPOfETiMJG2A
	 PfvKFzf/SLP1rAHK+A+Fi4s476VAup1L2VVi+xU8igdXyLaHbSUfBUueHVmoOEbsm7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=3V3QAHTF;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A110606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A110606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=3V3QAHTF
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c516a192844so190724466b.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795445194; x=1796049994; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hOiDALbPnrqA6KJcy8uRK3cvX6wgGPZxTJtro65qlmE=;
        b=3V3QAHTFqqSatjwHxXfNY2MyCBNCEaglsVdv4D+P4z4D/BvwkEsI8vSHHchijFSBZP
         CQkAL90DBqBijJ+dyzaaTJIDVRHnMDWIlEOyyDOB0TKnatRCThfnpTApYilqeREykpVg
         Ju4SJDaFB+U/7u6W5tJO1P6aazSxvN4ULGDWqZ4qbS0HAnn2bJxysQNIPQjBXaybnEnw
         svDjA2gtJW8rSHq7s77st8D9Ca9UMuucH3PUoVOcaCEMqx+DeaGEbOvx7vBgZmRh7IPh
         rrFG/V436LOAHg87Zg+/7we0YQ8MN8ITEmQrQhjWicixTT0SXVVSYNf8RJnAzz95nmfA
         yA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445194; x=1796049994;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hOiDALbPnrqA6KJcy8uRK3cvX6wgGPZxTJtro65qlmE=;
        b=V87eW2+IiGUgIoyn2g7TDIDV8TZ8n/ubiCi2k9pFw/PICoUQKEYq2UhFfDCXrO59dB
         PCclj9lQ0+ym/+yxa3rKx5OIqeyJ3ZUrT0uIMQgkZMqDEEUCtZxbiy+uNEFC1+9H93zz
         CfLhAswIVzffH0KtFNCNF2QHVL/twb57n+8etaHqse6ihvH0RgBhI80k5PhetrVuodiI
         n9/mhr7xvPGBPLcweV7lBk+lI9bnv3nXy1jSMWLPj1JVroPRx7kf0twfuD/uj2nGKxWE
         w1Cj49Ip0SUZssyPMskvSkC3BfORuuNhopGX2lcTv6rmXq59D1P7rrWs/W8HjSJ90wYH
         f+LQ==
X-Forwarded-Encrypted: i=1; AL+hErHmJID1Rzcm4X+03z8ork3gSWzVOFhUDluQ9Edf6XjjiZYxlItJIOOu4TO7jLIiiywawKzLHYIjq/Ae@vger.kernel.org
X-Gm-Message-State: APuU4Z/DaqCNT8J1KapYixnYdwzAsIkMt0qNTnNyiHFOcFkWqHHBeEau
	X6I+f3Q76rYoeXYxjZpvGktweMhCeweJcN4fLxWOpXoRmoyWlk7BZZZNJx8cnAWZLGefW3Ksi9Z
	DCffeNJg=
X-Gm-Gg: AZFdTZcQxI6hEUMku6MoX3nzspMPw818VfxQXJelkz6AIoq+ovu0mxS1Xj5tlVtQHBX
	VIu5KsUvz8mWl+23CunMlplWhV7069/erQsIpMA3qI3dDMYpbnQGD0bhiNaXWbRmRsHlGk4A2hk
	egLX00stDhqLUeW231tJNuZs8rnPpg3qxl3h32FQZgILBrhRZpzMLoE6JWXF+ZXiYE6KmEzR5/4
	W+weqfbuYU4sVobsoBfc3oEz8dcMtvXvcVxtcy/b42q2HHjeDI0KLYGpkpCWoWZJC+KzRx5zz4J
	pZtZjECZ2r7Fu6CYj5FzpfPrDQ3vyUCnGC+fHF89baPYhmjTmOOXi/LAVUTTq066tTMfgQy9s8n
	O/FpZg3gCL8XDTk+RZZf+zxs4B0bR2QLaEavned2FGAyccAd7PX/+GR+2wJpibiZDp2LU6t7xy2
	qhVbrM8v+vlx5HBn0yqE+L1AjMaiMcttgOqVN3kNRCufJLeao6dYZuSujWejix5ravBqYyNI8H/
	eU4xyVbQT/vq2ZVBTlLvFSQ+S5su8KGVUJfNfJjAPgWIPrhu/IPTns6TcmKnLYNNlJZxyT/+gpJ
	buEQRrZDMtvR57KKAVyyRNGHYrMoa1qbpYXIIbz+RTNCgF0MmEcody31ENIzFLP84jmujyp6LLE
	oJJcH1QbebC5Km4OIWIki7S1/UuCwgA==
X-Received: by 2002:a17:906:7944:b0:c50:564b:c63 with SMTP id a640c23a62f3a-c513a43559cmr1008243866b.6.1795445194534;
        Mon, 23 Nov 2026 06:46:34 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3701sm433004766b.48.2026.11.23.06.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:46:34 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Use QCOM_ID_* defines for qcom,msm-id for
 SM6350/SM7225 devices
Date: Mon, 23 Nov 2026 15:46:32 +0100
Message-Id: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQ6CMBBEf6XZszVtKTTyK4YDLYuuSUG7hZgQ/
 t0qHl9m5s0GjImQoRUbJFyJaZ4K6JOAcO+nG0oaCoNRptHaVJJjU9VKRo4lkaNT9cVbpYfgoGy
 eCUd6/3zX7mBe/AND/kr+jYSvpRzlowa+Z5RhjpFyK1Z3tjIFC92+fwDr0fVInQAAAA==
X-Change-ID: 20261123-sm6350-msm-id-f7059b401dc7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445193; l=886;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3RPjICq41onO9PV1h2WL8qP92Q0cMNBODW4SHoi0GSs=;
 b=5/2xKAbhxbBuFkNTIhmbRUi5AeNAGLd4bgsiXjxZ6n585j6DzPcOr5S66J3HjFDCU/gSvYXb1
 bcJ8hS3idWICKcCyJVy8VAGSrPcK/poc85ObN5I+Y8Qgheuhcc1gAx/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As noted by Shawn Guo in [0], both the pdx213 and fp4 dts files don't
use the QCOM_ID_* defines for their qcom,msm-id properties.

[0] https://lore.kernel.org/linux-arm-msm/awQ_90R8_uGWm2Sz@QCOM-aGQu4IUr3Y/

Use the defines to make the meaning of the qcom,msm-id properties
clearer.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: sm6350-lena: Use QCOM_ID_SM6350 from qcom,ids,h
      arm64: dts: qcom: sm7225-fairphone-fp4: Use QCOM_ID_SM7225 from qcom,ids,h

 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 3 ++-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts           | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: a4d7daea71be591034445c17d4d81132a1785a12
change-id: 20261123-sm6350-msm-id-f7059b401dc7

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

