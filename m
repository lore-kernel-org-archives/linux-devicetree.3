Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FBD3911C0
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648607; cv=none; b=ixeV948TGORsYsFywuxPznhIxyVStZUyzDv2hYp/LB/O8KFi88lgBLEAE9mQvk1nnpqbakd96DG5QFtu0mT6qOyCWUKRoxxKBLiLIkoeCEoUU8M4mzY8QkLRCz7dm3BERRqVssKqdwkhi2/LefT9c6WBuVQsPhwq63IZy8/c6QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648607; c=relaxed/simple;
	bh=3y2DTgGvaCN79v5u846mV4AvR5kKV3/9Ga6aVGHPK28=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RaXpodWpNRKgAIVrckZH9Cbitrp8QFCXRk3zIudwC9Vn9O5pjfoDg7mN0mrrb3tat0Cfbb4YbKkNXe2dWhj8Jv9UlI7jp/+VYk0rcnbqHJmMpNSfFRisrEpGHunX/3V+QUWOFxAK61e5REljI7IEWwGthd4sXBXpYgmvwlUosRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gXGXy5fS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZiVfsSs0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gXGXy5fS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZiVfsSs0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pPQD2331990
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d6j+XWNH1ImNatZS4xxXIB
	mLlEqL9OYbGkyb149+3Nc=; b=gXGXy5fSnUkytYNrRW8W0x5c+GW0Pm4WEeArZj
	gscfmRd7Ey8v/sfGsRHy4ep7zR2Iidh+Qooe6uz5HOguG/rnxJCBXubKQ/xxsUh1
	8LdvM7qPSV6znYOdzx5bWhRZnVBr0a2NPSzACFI2Fr6ZNV0Qd2Lw0cer6SlhOBzO
	UG8bBVik4uhoyjKiaHnig7O1lQK7cvQQxu83q62KfPtY9+b5AFhKZg6TEPCL1c1B
	2JMe1OuxchHbrliYWlYBijpl/MsrIywx7vOkXFWT/6udzhSK9PhdK1cBjl8FP9oN
	is80wpnhqw/2UuBR7mOO29swIpnTXfwuhxtlILZs9PrTqaVg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43ypbdd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:03:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-836cfd84728so3759545b3a.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778648603; x=1779253403; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6j+XWNH1ImNatZS4xxXIBmLlEqL9OYbGkyb149+3Nc=;
        b=ZiVfsSs0qWrrmcyrNEMNGkBzIshUQaMShXSnboQuJ+DDSA8FoDF2U7U9t8vvGR6LnA
         oOkcfNWG0nvW5SkE7Y/17Yi/FZlxYmgocpuU1b8WtA486BGJx9LKA28jDM4A1BVm3wsg
         ESmVupd5Rh6FbyxLpMQLLVSc+1c2DduoAltLeJZ3oGjp6EfDcIrQ/EMOhjo9Y+CVcZ7r
         AiOxeoQ+oMO8oCi8ZvxnxyLEe8fE2uFqG7MywOxze3/EQ1k3/ICw1DhebE601QIDQGEo
         bdHAvDsEThsj+tjx3SCOjO57b9BS5eS3UcMENqZHv0T10EI9dW9CT/eGfZjHi2xM7N5/
         Y1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648603; x=1779253403;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6j+XWNH1ImNatZS4xxXIBmLlEqL9OYbGkyb149+3Nc=;
        b=Oto2Mdfme2JCrB5OuTu2MenVczsgp1eRfGm1fwPJW7XuZ0MQb+zvCAc9TF/6cS/jWq
         M1guH5jWfTfBA6elVlMn0SUxg8Zn8S7NHNJ4+AD6UgnVNpa4yP+xII2juttsnPd74wHG
         Cccq++kvzLpxb73Mo4VLMFQCFV3JMLmqe6isipEDMyjF+pzgfojQueL+T0cq1FI3qEMV
         vGcsbQqVIWCMrpLUf/Yt2yU5lqLDTF1CzItSjZxRwipzt8UiiQ/wH3xD+kg8FNjgI2qJ
         pd6k9gtUv6iE9Z8UXefvp4A6fn4Q1Aa4/q18lK34A5Y185EnvFxmX8e9q4l3oD+8ODgQ
         EeIA==
X-Forwarded-Encrypted: i=1; AFNElJ87m8CZPdrdNAdZTILaydUAi399Fc8xtn9vC0YuWwmW5G84N5X/WbnMe3e51HWFe2Zu5acyJd6BDugM@vger.kernel.org
X-Gm-Message-State: AOJu0YzbmG95jFRffUwVdahGTccz0+T4MM1OL/MSEbbienrfkjgKTfM5
	zH5GHbshrHqXDgcDHuHCKlgLeWjqENAGIiorAp0hqarT/3DytiUBSxmwYim3uyLeyQ0CX7wnT7j
	jX2SCgKiIribN+xUS9aSBk9ltoZGAsjTiIghgB/1LFs/xbNK9CJeLHOgjsCOyjNktPUGIGW0n
X-Gm-Gg: Acq92OEUFqv0ThtEvVr7nn+LSP8xbBJL13nY4vmlUUEXVG+7rq7I0gLnVP0XWERUu0u
	YNInRVpI1fDkTFkbBzwefl9uU0z69qLClR9Zs7xcxTba2Jtcz7stVgxXxJWpRcjIzbYEaV7sgLn
	i3B8Y59rfkERkWCarZYijZfy5XzU524SIr78u9SGXtOOpQtU1wtdVrHIgGqk8VGVn7mrcXeQk8m
	uBB1BBzokgK8TW+oth+bLAiktORY9OfndmsaOgn5KZ+z7Sbv3VTKrwhUIFQafNAJMxxqYptNPNh
	qzOuvhXkwVUeoxb8V4RP+RxPBt6SsUIour3B2NgJnHeV5I0jzB7EEMkWAZ/fHI1epWFd+VFhjQH
	I+f5WuehAhEA/+sKuVt42L+CyPvC1wPJqBgcGDPM40SEmEtHM51NKBKHXGv1x+1VhE1CXZcVrD0
	u4yeDpJpmAVDfvdAGNywlBtOs73dSrF04D6G5Wj2x9yKcGUOL/smKC3Myf
X-Received: by 2002:a05:6a00:1886:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-83f02d2e731mr1711349b3a.7.1778648602796;
        Tue, 12 May 2026 22:03:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:1886:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-83f02d2e731mr1711306b3a.7.1778648602257;
        Tue, 12 May 2026 22:03:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm26328020b3a.15.2026.05.12.22.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:03:21 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v10 0/3] Add support to read the watchdog bootstatus from
 IMEM
Date: Wed, 13 May 2026 10:30:29 +0530
Message-Id: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0FBGoC/3XNQQ7CIBAF0KsY1mIGKkzrynsYYyidKoktCrVqT
 O8uuNFF3fzk/2TevFik4CiyzeLFAo0uOt+nImC5YPZk+iNx16SBSZAKtAB+b4ZDoEg5TfQ9R6N
 MSwgSULF0dgnUusfH3O1TP7k4+PD8vBh1XjOmQRQz2Kg58LVAU2NZ2abCrY9xdb2Zs/Vdt0rBs
 jni15FSzTiYHK0aVSMVJKj+45S/jp5xyuSAELYwpa1128440zS9Aa9mlaRIAQAA
X-Change-ID: 20250610-wdt_reset_reason-7a5afe702075
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778648598; l=4515;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=3y2DTgGvaCN79v5u846mV4AvR5kKV3/9Ga6aVGHPK28=;
 b=r96DTGicz2FBmzYyestGjnOSb8K1Y9lrge0HpZzvrNnOv77Ne2DuNxs3TDczLIAzDC8F+CWxa
 bcqCKsJVitYDpdT268EuCTe5N1Bf+HepRPFi6RLTTboX2VUyV5ughGf
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: v8At2Kzg-k3ZuH-DifH0p7vAqPru_gKq
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a04061c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K0PYKaws7Cf5qQY9JUMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA0OCBTYWx0ZWRfX5Kat+dz0YWCl
 6GjgrqGPC4rf6Y5Cr9Rk66hGfWWSZC6WRat1geN32Ub7Jq0bBtyaOYJq8QSPuKIzBCf+iG68YGe
 V2sPT6GSLFuT7Iv4vt2Nu3+rb/Hw6jOoK8+fpnSkFK/uh4ScBAae85LO2i3BKNzTexb07eWPB5x
 +nDUAY6ZOEzeKVJMv25OsqYhk5FTWoYHDDzyiWUHnMwceCcsLtK8CKq0MoqRX/R7xPANMdgqf5k
 QBtJUNZgNLxpYCHq3ZGRCIH8Ww/2s290B1y3+rpmrFNSFWUdwcKacWP5+bf/cZR9me1D/DYiRyW
 9IFxkCITM5al92a8cVUMqs4cKsUKNubrF05V4sm07c5FSyZ3yAEXpVujKr9wYSoopqROkNz8a4v
 6feLjnIjRulBhsmE9Ns0Fa8lkZsrbkgMbUdsR6dsg5k3aXwXqKIlWZScXoirDx66Wd5fSOvw+fT
 8yB2NmebeROtRHk+ybA==
X-Proofpoint-GUID: v8At2Kzg-k3ZuH-DifH0p7vAqPru_gKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130048

In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat
/sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Upto V9, this series has changes targeted for both qcom and watchdog
tree. So V10 was sent with only watchdog changes and it is picked into
watchdog tree[1]. For the remaining DTS patches, sending it as V10 again
which needs to be picked via qcom tree.

Since the watchdog changes are not yet reflected in linux-next yet, upon
merging this before the linux-next gets refreshed, below DT binding
warning will be seen

arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: watchdog@f410000:
Unevaluated properties are not allowed ('sram' was unexpected)
        from schema $id:
http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/log/?h=watchdog-next

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v10:
- Dropped the watchdog patches which are applied to watchdog's tree
- Link to v9: https://lore.kernel.org/all/20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com

Changes in v9:
- Picked up the R-b tag for 1/5
- In 4/5, if fetching the boot status failed, just log the error instead
  of exiting the probe
- Link to v8: https://lore.kernel.org/r/20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com

Changes in v8:
- Collected the tags
- Updated the commit msg with reasoning in 1/5
- Updated the comment in 4/5
- Link to v7: https://lore.kernel.org/r/20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com

Changes in v7:
- Collected the tags
- Added the reference link in 1/5
- Added the flag 'no-memory-wc' in 2/5
- Link to v6: https://lore.kernel.org/r/20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com

Changes in v6:
- Moved the IMEM compatible from qcom,imem to sram binding
- Updated the 'sram' property in watchdog binding to point to SRAM
  region and update the watchdog driver accordingly
- Dropped the Konrad's R-b tag in 2/5

Changes in v5:
- Rename property 'qcom,imem' to 'sram'
- Use dev_err_probe instead of dev_err
- Link to v4:
  https://lore.kernel.org/linux-arm-msm/20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com/

Changes in v4:
- Kept only the WDIOF_CARDRESET and dropped other codes (Guenter)
- Renamed qcom_wdt_get_restart_reason() to qcom_wdt_get_bootstatus()
- Dropped the device data and describe the required information in the
  DT (Konrad)
- Link to v3:
  https://lore.kernel.org/linux-arm-msm/20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com/

Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

---
Kathiravan Thirumoorthy (3):
      dt-bindings: sram: describe the IPQ5424 IMEM as mmio-sram
      arm64: dts: qcom: ipq5424: Add the IMEM node
      arm64: dts: qcom: ipq5424: add support to get watchdog bootstatus from IMEM

 Documentation/devicetree/bindings/sram/qcom,imem.yaml |  1 -
 Documentation/devicetree/bindings/sram/sram.yaml      |  1 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                 | 16 ++++++++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20250610-wdt_reset_reason-7a5afe702075

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

