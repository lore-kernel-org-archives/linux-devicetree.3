Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461D4435AAB
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121755; cv=none; b=N9GrN36U89kKFoh99JKYBDaeBVSLQQ0PLNqQ2pgSdg9ZoiXt2aSh/EHOY28j196Zyyr+thRclu/6amYE1Fag9H9lp9ojyzPdkAfe0CytFTojIsc9V2l9YJBKemg8a/vNbl0ECREtivaPtlMWkaWHnNIcirquWU8CsuXkvC2sgSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121755; c=relaxed/simple;
	bh=68eZgRgdcmNjgSdNgODpVZyt9WyIdiTgG9qRJjHQTdo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VkKLGD8hpRR8I/yQbnvg3zhQEStSNX1uDpddjXT9Q1k4f2dsD7l9Xxtc5hbKeM48SLq4nBZ9GQI+rNyX8LaMtutbsRY+KLNl5UqNGbYRr609yzeorHb9GXu0feq177pCBaaGRyWjZieeA6BI0kEcyH2mlFwukpHZKCwacTrIXCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzZxgmwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXNDdUir; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzZxgmwO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXNDdUir"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcZk33450193
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3pOrjFkRPKJ+aWas0PAq89
	n4Eek6ceWASyL+xpbnAwE=; b=ZzZxgmwOcK2eaqA+o4aID1stj3d10JjCcbGsdX
	+/Oh/RVYAYFqxmtB9/SaSWsAWTxFJsFKLStO0FdJumnULMadB0dDxHVC+CBVANEy
	ehdwlhNhmiMuJsPMuV/hBmxLj6cmpppthRyvWwqNakt1j6N/fK6u2NhnhaTatmbp
	UvLHHt9U5Lfxq5670y3pbZ2Ysc4EQwOOd4rFE7FNIqembjlxpyd2qpL2dSVIyk7s
	gA4iUHRxQNXe/rlsAMgqNj+osB33SkkwGuBVPoweOKbN/2+1DfTmD82y2vFtw7Ab
	0h/kA0MSz4PI+RHy2o6e9625uBDal0WQ5+yJo4I1sEv1PnRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka8wsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so800897085a.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121752; x=1784726552; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3pOrjFkRPKJ+aWas0PAq89n4Eek6ceWASyL+xpbnAwE=;
        b=HXNDdUirD3IW5y0cWWKLvv8f5ivDTNoR7ir9SgnuTXEydS/DUsj8H6A0rJqRCU5NCO
         D8vn6XI1F1cIhsvoPDxvwyb3q6YNMqPOlbEwAU7kOk4Qz97/zPWpPyh/3LrWn9DoSHoB
         DZjLFRx5yEZO7365twLSpYe42F03n8Ldobm1Q0syiXo0ShYUgHSwv3kRpgrPaq3g+yHR
         VH1AFJQjDhF8wNpjIRh0qoVY3U1MimjGg+gKtsaq9lxt9OA6HwQBATkBhNk88/caxUEm
         aRvsZJmEAvEEuTG4jNZ6YSTrHbJ8OobPplWwadZD34gLRt1/Voj9scja4hK5hqo6iWWM
         p0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121752; x=1784726552;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3pOrjFkRPKJ+aWas0PAq89n4Eek6ceWASyL+xpbnAwE=;
        b=YlrLWmdQHq/+qCgMp6HIWkb+bKksuMdIJ8VGCC6vzj3lkUOQt6hVBjZcOdbOfN+pAe
         xlSHGYIHmxNaWxj1XiFs/22JUZDSEMNVG9MrFmRhRz/93ZzyS9XNmsQm1FRzI8iGQgFm
         XdTs13FE81vKKhvC+ou7qvXvUng+xCy9P387t34XULbrOqfRmzybAD17RW5mf1S17cft
         c5K1XJfWbIfEOifFEmYWFRFFTFIxfFRd9Ykx/MdTHTxlRc+KGHkCpkBZLdvMgtDWZwpQ
         m++ZXCxx/ToomyN6rM3jiPu8wExg2v7IXb/haAsZGDXniwYuXmKaWujcliVVUGjC3bnF
         paOw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9u+/76auYVZEJDDCzx8y+vIG+LrGyC7ENm6UGThhMZTlHSbO9u6pSf5t5/TVlLjNvK2HhdGNds8Bv@vger.kernel.org
X-Gm-Message-State: AOJu0YymneQo2Bvc2aLIQ+ButYrx4IGD6a6ofI7c6elT6Cbw9VyD8Ixi
	2rlYaKldjeuv7INY4oULjKJ2HcdyXvHPxdR4jN1NubggIRKcp4+T3inshbbj1ZjtY+rNwqRjI/o
	mry2vOURl7HH2zM0ZAqLjjwsO/ITZwKYiswMqgPisBraw+2B24//bfUG4IPiPikkdGnFLcuhj
X-Gm-Gg: AfdE7cmvs09mP514i1K/2Jv3/1YZ7CTwfgyN8Lgs8zs6FdKQhsaY3LgaqrvNmcCt6Yk
	j1eBAjIMsh7GUDuQluZOMrqHeyP5dlHbAWe4yLSkNRxGWYYC641LPE7zu620iGGRL+OPwSehBJx
	x1zhE/lQBrrAb6Y/gFiLDIHQeky32+NJXoxbZgZ3eJEAYr1ZMFFQJL33KtDTL3dkWJMONu7fMZP
	R6JXwxS6RchYUUesAhh3msmRrSvIUWyoEvvd+Nh3FlDY0HW6VsqD4rxo8mT5y9l635iIs7346SJ
	EYOYGVMrssOQlXvQj45Zh3EFHX+W0UPjM/eXysWpDcGAzFVvCQUjAia68W1sLMkMmcB2zkkGzkU
	3ZgIJmIB3gpOZCdu35CpHWATau0bYHdfQ7X4DzWU=
X-Received: by 2002:a05:620a:40ca:b0:92e:1725:15dd with SMTP id af79cd13be357-930961fdecbmr278943785a.26.1784121752126;
        Wed, 15 Jul 2026 06:22:32 -0700 (PDT)
X-Received: by 2002:a05:620a:40ca:b0:92e:1725:15dd with SMTP id af79cd13be357-930961fdecbmr278933785a.26.1784121751041;
        Wed, 15 Jul 2026 06:22:31 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6a77csm1773676985a.45.2026.07.15.06.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:30 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v3 0/3] purwa: Drop the Hamoa PDC workaround from purwa
Date: Wed, 15 Jul 2026 18:51:59 +0530
Message-Id: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHeJV2oC/22OQQ6CMBBFr0JmbUkpUoGV9zAsSjtIjVBoKWoId
 7egiRs3k7yfl/9nAYdWo4MyWsDirJ02fYD0EIFsRX9FolVgYJRxyhNOBm8fggxKkqTIKU/rY87
 qAoI/WGz0c++6VB92vr6hnLaCr2Fx9GFk+mmtdpOxr/2DmW3pv7GZEUpypcQJG5ZJzM7GuXj04
 i5N18XhQLWu6xsrCqyW0AAAAA==
X-Change-ID: 20260616-purwa-pdc-198063b482b9
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784121746; l=2407;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=68eZgRgdcmNjgSdNgODpVZyt9WyIdiTgG9qRJjHQTdo=;
 b=O9/mA1inZpijsnLStbohm0GFGrbot4fkYzzOBJ8ujvdr2Mw8Qdtdjh0pjbJmq6lAKPH7wiG6I
 8u9+ZHh9qJBDVj8tozpJ/iZSze4hSWY/0gc+Y2Kai6yScZZq7hsHKyS
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a578999 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=byf8UBOB4SDztmWUoWAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: XyRz2ixHg4oeh_7Nd2fVpgJt3QQ3OD0O
X-Proofpoint-ORIG-GUID: XyRz2ixHg4oeh_7Nd2fVpgJt3QQ3OD0O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfXzwIwiojd7mfY
 PU8Pyre3KE8fCwKFHUb1FvOFQWLCwfYiOWNaKm9bkk2DXiAHwQ9lvS0vAYKmLnx2T/Ii4LZfhhA
 lrytbXAOYTioWRuvoDEDvKgPmnzdeZo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfXyWIVxFkYgPE0
 vCom0AWIhNpJlFtJpR9A78tz/OQNdh93jlgASH7KuqrwQImQsq6lX8HNub0Qaw3/lbm9CWpjz8J
 Mtd32nFrIGd7/MB2qhIPswzuL6miFAViGIlSUMJ9QrG6aTn1zhttjwthPuZ/3HcWUsuNhHd7OMd
 54xHpWa7dbSesOfTTVYvqJzW3SV2rZbwqgdgb0XkEQwQd+8DBq+VfHK7czmtEhNT+FAEJOAOk4o
 SHxFZSfpt8WbdZ3bgjG/omwGx3pegddORJ9gY3Nm3zJvqXci2LxJCjJTS6N3M1cuaI0IRYCUiL8
 /FSC8lYT44nbaxhsFCNdcWXE2pWCPvzJ86IVSoXKNQQQsqIsGqQg60CIIKcvI5DrQ9oB97gES6a
 BmEX0JYohjBrkq+4Zjd2DlUuPWo7X3HxsUbonqG2J/TBVdLRL8P5M4iQTgetZU7F3zDWTxvovt5
 gYW2Rd+WLhYl4JncUFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150132

Purwa shares the Hamoa PDC compatible. Hamoa had the software workaround
added due to hardware register bug mentioned in commit [1] which used
Hamoa/X1E80100 compatible to apply the workaround.

As the hardware bug mentioned in [1] is fixed on purwa silicon add purwa
compatible to avoid applying workaround meant for hamoa.

Patch 1 and 2 are not dependent while Patch 3 of the series was dependent
on [2] patches which are also already pulled in linux-next.

[1] https://lore.kernel.org/all/20250218-x1e80100-pdc-hw-wa-v2-1-29be4c98e355@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com/

---
Changes in v3:
- Remove the dependency (b4 prerequisite-patch-id) as dependency is merged
- Rebase, Add reviewed-by, acked-by tags for first two changes
- Link to v2: https://patch.msgid.link/20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com

Changes in v2:
- Remove Fixes tag from bindings
- Rename $subject to use hamoa and purwa name
- Add comment above compatible in devicetree
- Rebase and mark dependency
- Add new change to invoke SMC call for purwa PDC mode setting
- Link to v1: https://lore.kernel.org/r/20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com
---

To: Thomas Gleixner <tglx@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

---
Maulik Shah (3):
      dt-bindings: interrupt-controller: qcom,pdc: Document Purwa PDC
      arm64: dts: qcom: purwa: Drop the Hamoa workaround for PDC
      irqchip/qcom-pdc: Add puwra compatible for PDC secondary mode

 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                                  | 5 +++++
 drivers/irqchip/qcom-pdc.c                                           | 3 +++
 3 files changed, 9 insertions(+)
---
base-commit: ccb82733ff94d656a66447c374b16ecfdf8d4cb0
change-id: 20260616-purwa-pdc-198063b482b9

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

