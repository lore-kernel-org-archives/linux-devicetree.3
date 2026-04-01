Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A213AEF46
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034941; cv=none; b=iZ25aCIcadz5YcweaY2G3lLNTehIXJPiALNGN2esQdGr+D1JA9SNb1icMHPhq8VbVsoXm7IvNispWl2XKZRRw5t6TDOYICUIrDjVW8IFRTU8E3C8ZdppoZXier5nexgtJdb3bxZyTLO2L8zRwvp+PYq9p2qQTIqMthpzwCbngIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034941; c=relaxed/simple;
	bh=88dvcps1dv2WXNE+TIBwTsSm01dkH2Ji1OH6My5vMKY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J5XqnwsLLhFRj2bz0FwnmE5ePjUeB/OcRBg291oisoHSaYyvL0cj8goSMQepFG4l+kWFIPl2v+gnyqeYDpav89veAb9l5p0YxBFTiYZpEQQ73kN9cgLR0+njziOAl88+4Wxst3lMWmmyvNp0cKEEmBbKwZX+HdmYrhx34LQfl2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eye0V7bv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9J66q48; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eye0V7bv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9J66q48"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317jtMD1004266
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=23oAQOYzkD0eXYAJPVUK8k
	5oiGtDoTeViqweGnAixQ8=; b=Eye0V7bvN2hi1m7czpS+vMwOyIWUTSJoq9PwFM
	TwwQ9phl8kzBPFZ5BLSWtabbpWWzmo0taNzcEoiqgNTIB10H2j/YUpCyDH3ohLxO
	hAC20VlS9o8nVZrXJv1Wz7kMpGPaUE+gMNXQ2NmGCtayZ/g4XPL+asfAFbsqBb/s
	mx1+06rikr4llLfyKvPfvwyiv+KkIPk2qc0C1KbTQjjLj1EE7tAlXvmZpi149qdG
	1J9HQ1l+DwhVeqrq8WTqnAlBJvYOz0eTd3pMGDvc64R3SZ31IukQ1JyflFR+wsf+
	Y9y+a5A8Mbc4/rae4znIS3jBXwQR4jQDUuQOb6wp6JJYqa8g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjhh08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:15:39 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-128ba70cc99so5349449c88.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775034939; x=1775639739; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=23oAQOYzkD0eXYAJPVUK8k5oiGtDoTeViqweGnAixQ8=;
        b=U9J66q48mKprDzcvy6asyZeuZCATlEbxU9t1SIT1wpr6A6GYnmCFY3zzXblEVSxS/X
         371m5i6WI7p9FpD7Tbm18HOAvKbqsFou0B7GOYxrt6d9UWeN47IkhB0lNCVqC/KsBU1N
         +X7T2amvtkM3O1xHHR8Xlh5mXxl4AY25ajPue8gNribDaP1NldZOPnmq98x7d88bPvRw
         b8efK9xN7iyCEFSloPdfCxeOuui9zQWWGZXBggEXzUGxlNlnQLkYozwa4DwYItLD7N/g
         dKeGVFvKU2jUJyoG3hn5JYfp3J7dl/Rk/gvMKTw1Szx+wXRBxcwI0YXnGoC0HbsCjDLx
         SJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034939; x=1775639739;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23oAQOYzkD0eXYAJPVUK8k5oiGtDoTeViqweGnAixQ8=;
        b=ry3dAd5EU57njfLUM19ztvjIYlHY9Xj4a9uPV5SltMiYi3887HH7+W8bn12p3Bua/c
         mAn1aUcyX3h0TCMdlD/sZTP8FWT5zIYwzOpVYIaLivK34aEjH2ZeNMaSQQMCBIstl+0q
         OPBhWO8UECc5IqAoD1WZczTsiq/xR5E4/lo2U4O4TGJiqpd4au+HBHtr9OyCF8EXJWw1
         gNHtPHLw115XXk/xY7L8kVz1/KNGHpWiWvZ7SOALEzX4YqbLmalsjfA/cJdntaOZUYG2
         6AuVdHFdlYzs6Yrl30ZePj8xWjjJ65EAHOHAsOFc/cqdU68KfFnC1M4jLfxEQWlidObi
         OuBw==
X-Forwarded-Encrypted: i=1; AJvYcCVjQVrsfoFgeNmdiPBmVE4qwYxSOxR4UO1dyw2mnrQH7cmzE82Kgzx+I8IT23pufQwv+q1PqH1Fu1gN@vger.kernel.org
X-Gm-Message-State: AOJu0YzWHkqcSh/lsCIUki1N3gtLLKju4oU8CXwrv5VJy6aFsUUdH3Ms
	TY/vUEmZz99ONPclJWIkkTJRC1Z6tRVGoTysH2WgeLEpN+DOvJhl8ITorMolzjMh0t74HznWrjr
	tVcxb/pOpOZJAdoPrd9SNXB6P/ry7idJyb4zz87R3zmCbpZrHiTAKKUr0whsRzLWR
X-Gm-Gg: ATEYQzzaE2AlJh6PaIvPKgDU52eM9xUjaXEZD0a+blqMUoVD+fOYSfQkr4Hf6peUOVp
	l/Uzez9VDO4NZ5i/tLpcEo57hCstalr1BvpZrifXcY5ks4OagwldbeaPeeb4H6myvUXwm521+ce
	XL2PekDrTSBPkhgbUg89E/dbDx0iVVDAxw1b1HssAda+LfPUY2c+zkXMNjtMFji1OspiR/u6nao
	x9lex1ta5elAK6yUpFzTj/pX36A79Ty0n7LfEPr98oSdZAoJnSZpiGI8teDrBX1kX/Up94G0yMe
	ajEQiznifrXKFl65ZfqXxv4Pfv6U1uMF/qq1exnqS5qNFh0J5+aotFlJQ97ZPgwmJSZd3caKExr
	4yQlPPeyTWqWhqKQFZHlzNJLo7ED0Vl30aw//1ArtVmUFfFrQTpdXo0OuOyImrlWlpYcSAUoxAw
	==
X-Received: by 2002:a05:7022:609d:b0:12a:6c19:d222 with SMTP id a92af1059eb24-12be65844acmr1420596c88.37.1775034938506;
        Wed, 01 Apr 2026 02:15:38 -0700 (PDT)
X-Received: by 2002:a05:7022:609d:b0:12a:6c19:d222 with SMTP id a92af1059eb24-12be65844acmr1420565c88.37.1775034937585;
        Wed, 01 Apr 2026 02:15:37 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97efb42sm18285025c88.7.2026.04.01.02.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:15:37 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/3] power: qcom,rpmpd: add RPMh power doamins support for
 Hawi SoC
Date: Wed, 01 Apr 2026 02:15:28 -0700
Message-Id: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADDizGkC/yXMSwqAIBRA0a3EGyfYh35biQamr3xBJdoPwr1nN
 TyDe29waAkdNNENFg9ytC4BSRyB1GIZkZEKhpSnBc95wrQ4mTWzNor1ORdFJTKJZQ0hMBYHur5
 Z2/12ez+h3N4DeP8ARAocyW4AAAA=
X-Change-ID: 20260401-haw-rpmhpd-b40a68a3ce79
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775034936; l=848;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=88dvcps1dv2WXNE+TIBwTsSm01dkH2Ji1OH6My5vMKY=;
 b=9+MNExvCnXk74J/zr3GV3FoGi7mn/Ee0Y4xIYHx2sYmYW0eiBPsh11qwh2hGCwneLPUa1rN1/
 MW1X8GbOrZEC2zatlfigBX4Ow2vkCsngcTxtxGAgHSJsurg55UiNqmX
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: 2ntw6Bo3dm3xhS1NmfJfUVvr-IWvyrDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MSBTYWx0ZWRfX+rcx4m1uak5e
 q4SUCR8+qQa+lS5zQUj/NmlGxFOMkWTzC4Auqgg8Lx401QrjYnadIH2vCpE/OAql/8CVhWon0UH
 7y4MW+wMua9bUyTbKlCwYH8XzbKONU6/e9/JOR0J1/4vsCN6JcWO6Dwb6IggCIKXQkg7OD7tp2H
 mETxku/lJMd4uanp3HREg2FNZD0YAkAw/LADUPVKJfewO3U00OD0RZKPiaXU6E4Ib8bfOuL5A/X
 dnob3BepwwQkitJu6mJeOnHykv03DH2bq6X/53jG7xmXkC4Z/yjgqhEA73EZGuvKJtW1ZkXJrNz
 mjHUy8yfRrjT2nHvkUgtnGTeehf/BeoyGRk9vyBKvhKzoUGurELI5PpagoS0LYPRwkZZK+sFWCR
 MfuF0AyuzNzHSjC05NB7T/TTFb4P9fWJzB7Nm6L1ba81wF5iJ3iebP5k3PmgTSiMHXumPa1ellK
 AmzxN2ZrWJkzJa6Z82A==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cce23b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3hnM6S6pKqKzLZp0A1cA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 2ntw6Bo3dm3xhS1NmfJfUVvr-IWvyrDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010081

Add constant definitions for the new power domains and new voltage
levels present in Hawi SoC. Also add RPMH power domain support for
Hawi SoC.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Fenglin Wu (3):
      dt-bindings: power: qcom,rpmpd: Add Hawi RPMh power domain
      dt-bindings: power: qcom,rpmhpd: Add new power domains and new levels
      pmdomain: qcom: rpmhpd: Add power domains for Hawi SoC

 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                     | 38 ++++++++++++++++++++++
 include/dt-bindings/power/qcom,rpmhpd.h            | 12 +++++++
 3 files changed, 51 insertions(+)
---
base-commit: 33b1a2ee3a3df63e7a08e51e6de2b2d28ddf257f
change-id: 20260401-haw-rpmhpd-b40a68a3ce79

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

