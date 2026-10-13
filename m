Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4341C49C4CC
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891304; cv=none; b=TijvZMUtvo4fTFry7JlHYhbyKTd4EFiq1ptuAEqSTbmTOdAXfpbC/z2eYMvq/l95gGldtEi4a0UYaH65pqdOtr+rHNFIgNKaFLad+OsauyoC5CgvRerIlMcDRlJDW56Sj+2B5bCVHYSR0fybchAQid/kX4M0XJZI2+FI/4FToQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891304; c=relaxed/simple;
	bh=LoI9OPeomIZeQLmrjbKF7UNUwZcKe7tAMrZPNnaeJD0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ivFcrm+KTdDaXLHCVE4ZjKF3RYepAAX1Upgnm3YUdfSGQ8bo76gKbl4ujFYOW46B1guuVQkbmMhm8hszRZ0u90sUyKRHZTdRhEsAI6H5ibdEuAYls9Dl/+AIgddYjcU8N0iIP0OtFfCdX2/xMstjMbnGIPyEYmpivPwlOw9QaeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmjwQzO9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftpnpXIS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmjwQzO9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftpnpXIS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CQs0949222
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yBfucQA+RDlQPh3luaVEA0
	hcyLH+f0PQT5YwB4FLTK4=; b=KmjwQzO9m0zvh4j/tW4zZ51J5piXYhvULqIBlG
	L0xAXWZZyQKvMuB/RqsVzatwqqtl7mp2ZJm1KDc41ue0AYid1rG/4twzYWyp8UC6
	TCcLvnFllaPuoo8osxC5fHuVIlWT0toCwrtMds2IE1vMiGRBKMcjxjsAPXnLpmBo
	gcCTNaIAiuZl4Fi1v+ICOZ5aXXFEwJUqMiXO4a3x0IoH6D1bAS9/3oUBQQcJpzUP
	oqo+pBTwHb9syw0XDDLjIPMojIq/DxfduaF/wDPGljOkrbPFn7Mr5SmPi6zhuXyO
	PKnWhMjCzSWz2mBkwHXSlm2jZPSKhMU2OkEn+arS8WdjbW2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f629bg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:35:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so800506585a.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791891301; x=1792496101; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yBfucQA+RDlQPh3luaVEA0hcyLH+f0PQT5YwB4FLTK4=;
        b=ftpnpXIShhZ2PNhGv3wOCHALE93476CwHp3HM/m+ucn8UWIkbYkMJ/mlJPKWtdgbkv
         79Ujgfd2M8w0LMRv0xhhdhL/PsCFKHQdK8SKBIL8gmvlGmJMM24ayHQtfMekYzCFyDw3
         Mm1zaMbrlm5tXZhCcLm9chz7he9DJQ0NA7y4CUbKRZn4QmObR4kXEbpozVRZbw+7uFw2
         eM11pdFdQGbkKfADG9UEScds+x1jjyerTH7Ar9c2pgEi6K88lJ8XjyPMQ2wDhqH3nYfu
         zPcyikRkpRPv0IoX4KchRibV63tZ5dAN33OW/R0Xbaw5glmaOWqrpX6IMnDZjOIkslTm
         m4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891301; x=1792496101;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yBfucQA+RDlQPh3luaVEA0hcyLH+f0PQT5YwB4FLTK4=;
        b=m0woZWSfjToyyNy5gPvPEnRrWBCjNwbJ+SyIdvxR0xQAWCViHMZFOJ//qbLl2ZvnDo
         0I3dA27fD7T64bfH5Uk4kr6Peoz6m9dJdqowujHUy+lPT8lCycxCEASBw0YiQWeHxznb
         dtlUeUxRUqHXZA7/txhxV5veyx2o7gyf8fMB4x9FcPefXp3SBSJT9FLs5FbAn45Z0ltI
         K6lQzjGhmqSKMLjnzSql0jMwQgTGH9Ac1ZVFK0m99/o+lfiH/UYc0J1ArkVFQeYcppyp
         CjI1kir3wZXfkC4x0x/si9CK5nfqWZaOI7eJQs3QZfqhL4G+zwsdsHJ4SdUMik6EETG4
         W4OA==
X-Forwarded-Encrypted: i=1; AKwUvBzIUtUNFq1nnuDJRTm25ZD/7qYOszsiUkP0INE2Q6cZ3oAJFCipNE0pASCia866oV6fERjgJo6eZi24@vger.kernel.org
X-Gm-Message-State: AFq9FYKHSwzWesseNGT61pcZsC3CYjZ3j3MokJIuB5fulrqlq6iD7QVU
	n7nWp4eFVkRu66zssl28nnnANolnEpNjn8appGseI2TgI4KiSuEbbwGBeJsEg9xAqNjqc6R4kkc
	F5n+1KXKKFMAUO2LvJdEWAlDWsZC5ufnJaV8YKDsrP6j+aGgax20jM7K6Pwx96Dvn
X-Gm-Gg: AYBFou10Ej1+0/UypPk2eHzwEn2RrtpiB6ew2zeQ5fHpVFSIjmu0bns388t137B3H+J
	14DDaEnEacpgYdW5eGy7n6ZFg4KytpibkAUlTpDz+nTOlayXHf4vVTBy44SPRB+/xnskiajQF/o
	moYu/xf+uJypfAWCIow1fUOjboLTuZyFhumRedwFbELkQFSjcdBZuk3KduKg+JvymLVOirDMz7q
	PvYjptnc6XxuBmT+sduRgSqmq0elxYoP2s1vVp9BCQdghs/ajyxIoSeCTRs7oiGZD4R46UuTL5f
	dHL1s26eHvlHqrPG6CQ0Ba6EBYjsxwh8OjUnkmNzS71Vc0rySch8rFZxud8pva1AS9irrTwdftC
	GjzQ409Yr4+CAnjxwj/zrEH6gd7ge
X-Received: by 2002:a05:620a:a0d6:20b0:93e:c12c:fbc2 with SMTP id af79cd13be357-93ec12d0818mr1370631185a.79.1791891301264;
        Tue, 13 Oct 2026 04:35:01 -0700 (PDT)
X-Received: by 2002:a05:620a:a0d6:20b0:93e:c12c:fbc2 with SMTP id af79cd13be357-93ec12d0818mr1370627585a.79.1791891300771;
        Tue, 13 Oct 2026 04:35:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm654407215e9.9.2026.10.13.04.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:34:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/4] arm64: dts: qcom: nord: Add USB support
Date: Tue, 13 Oct 2026 13:34:45 +0200
Message-Id: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFUXzmoC/2WNzQ6CMBCEX4Xs2SWwKGk9+R6GQ+mPNBGKXUAN4
 d2tJJ68TPJNMt+swDZ6y3DOVoh28ezDkKA6ZKA7NdwsepMYqKC6kFTiEKLBmVs0T41mYtTkXC1
 ORlApIc3GaJ1/7cprk7jzPIX43h8W+rY/Gf3LFsICW0VtJV2pxLG6BOb8Mau7Dn2fp4Bm27YPx
 yGvWbcAAAA=
X-Change-ID: 20260921-nord-usb-dwc-dts-c2ff685d8219
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3348;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LoI9OPeomIZeQLmrjbKF7UNUwZcKe7tAMrZPNnaeJD0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzhdZSRSzzugpCTNQjxu2pxF4t7th2YyU4ZSvl
 K4O7jyd9vCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4XWQAKCRAFnS7L/zaE
 wyyhD/9Fv/jTF3ZUwaFYiMYlMVxgbFvkUhi7l/vL6YXf1n5Vrzu9FDKAMTMnaSa1aGE0JAlgkLX
 wQ5pJqetpuFsh7sjD9uKUGrYWEHs/nz2dhQyb/cqxhbd47eE51mf6mHF+3eYGOs6cow+HnbmmQX
 fwGz7QmS80AMCkQqBTximPWpXkNiS/1wnr9CcZW9FbX4jUAjegPYgjBoVcoMoWlt+WDFYfKmXec
 gUwsOZbzLBNM4VffUiZjZBA4zhly+WkExl3ZJEETtazJumnjywcz0bkwtKXSF99W2oeLT6e7inG
 FofsrvOoTFhEA5XK7kfBtPCaotWnWqzsKtsWuDQui/1yr57D3BuSr8D4Rdz3oiNQhPdHNQw1KVs
 nZmeeijFBQxpNh+KsaBVH11gWPcAyFZ3mS4gX3IqgznQNBDZ1cPnwAwWcH3VB3EGHma9oF6vjun
 VDzmf7WJs+liI44tmscybL5F3GQL1BUdsOati5te4RKcXPWMNwE0eXRc8TsOHe1DuRXleBvG9n5
 aFXCDMLGp28I9qBpNHcOeGeqFgevjVQ3gHYhBavIFa2ynSOd/TFwRCz5E1Ln2py2gbcV5lAwpK6
 FF6vJYH1zuGIJYIyWlsJsc3vwHoKhCCPg9zVnKbK7bLgAp7myJEPpOoD2XlnLG2n6+tibz5r8la
 PsldkFE2amTjVWw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace1766 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=xTrmgH0f2Gs-2PNJ3BkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfXwFPFbTRMlBeA
 fCsv30O58r5bFq53E8EvWf9mIWB3Lyo6w7DOYZZNSzz35A9aWyt178HgUXsb2BM16KF0jfyaJ1l
 +VWSyfaY7lSRcDneE0stXo/jazBsH7Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfX2jWFlvGAFgs6
 QMm2PHHjAuFLR1FHPcRJtwk4NXwoFVgCXK9GrcPO3RoT5MOU/up3gW7/BWhUDWFSFpJOP27ZEoy
 BZFs8NT5cnqLOyuBB+y+mrfb2yVFr9ClyO7TOCDh6iQOLCum8awTLEIiE+qI+1ws+QzhmPvsvRF
 xvx/DD+vjG85YfGlM/9xlR+dmNx1GKA+8iY7uLhXqFnTLLpA0FyQNEtTUitu0ypqCxCRD8V2rvU
 NPWptlfhF8mKMVlEDOWOSun2v9F1i5RibCZvV4cyuodLqqcGjmk/gXS356rDDHB8bJvZbUF9YD2
 btD2Dzv5Shn/jx4dgbpvkJHrp6jhH+aENhKnnIUMxLc3C4Umze9bPpNfyxicf1CtmDZbIef4n9e
 QyFvoH7ksY7W98tTxOoqI8wp6Csk83Ck7WjpghFA/oBVkmYEu165XEn+f62xohP+7UwfLp0c7LQ
 xOgaT/Bf1si08bo8Aow==
X-Proofpoint-GUID: 8zbZjkidbkUVMtGcDERy15fOxdcpuR_Z
X-Proofpoint-ORIG-GUID: 8zbZjkidbkUVMtGcDERy15fOxdcpuR_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130046

Note: This is v7.4 material and depends on several patches that are
still not in linux-next. Sending it out to solicit reviews.

This series enables USB on the Qualcomm Nord platform which has three
USB controllers:

  usb_0 (0xa600000)  eUSB2 + USB3/DP combo PHY
  usb_1 (0xa400000)  eUSB2 + USB3/DP combo PHY
  usb_2 (0xa200000)  eUSB2 only, high-speed

The first patch is a fix for the i2c9/i2c10 pin functions, which is a
prerequisite because the eUSB2 repeaters and the Type-C controller all
sit on i2c9.

Patch 2 adds the three DWC3 controller nodes to nord.dtsi.  They are
kept as far as possible free of anything variant specific, so the
clocks, resets, power domains, interconnects and PHY references are
added separately in patch 3 for the "embedded" variant, alongside the
five PHY nodes (three eUSB2, two QMP combo).  Adding the QMP PHYs also
lets the two pipe clock placeholders in negcc be filled in.

Patches 4 and 5 wire the ports up per board.

Nord RRD:

  usb_0  OTG, USB-C, FUSB15201 Type-C/PD controller
  usb_1  host, Genesys GL3590 HS/SS onboard hub pair
  usb_2  left disabled, not routed on this board

Nord Ride Embedded:

  usb_0  OTG, USB-C port 0 of a dual-port FUSB15201
  usb_1  OTG, USB-C port 1 of the same FUSB15201
  usb_2  host, USB Type-A, VBUS from a PMIC GPIO controlled
         fixed regulator

Both boards use NXP PTN3222 eUSB2 repeaters, one per enabled port.

Dependencies:
- PMIC DTS: https://lore.kernel.org/all/20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com/
- FUSB15201: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/
- USB PHY clock fix: https://lore.kernel.org/all/20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- fix eUSB2 PHY reset assignment
- add AHB2PHY clock to USB PHYs (Shawn)
- fix regulator node ordering
- remove code leftover from a rebase
- Link to v2: https://patch.msgid.link/20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com

Changes in v2:
- Drop pin control fix that was applied upstream
- "otg" mode is the default dr_mode so drop it from nodes
- move the usb-mode-switch to the SoC level .dtsi
- Add hs_phy_irq to DWC3 nodes
- Wire-up the USB2 type A connector
- Extend the list of quirks in DWC3 nodes
- Remove stray comments
- Link to v1: https://lore.kernel.org/all/20260911142040.100263-1-shengchao.guo@oss.qualcomm.com/

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: nord: Add the USB controller nodes
      arm64: dts: qcom: nord-embedded: Add USB resources and PHYs

Shawn Guo (2):
      arm64: dts: qcom: nord-rrd: Enable USB ports
      arm64: dts: qcom: nord-ride-embedded: Enable USB ports

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi     | 311 +++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 222 +++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts           | 166 +++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi              | 100 ++++++++
 4 files changed, 797 insertions(+), 2 deletions(-)
---
base-commit: 3ce5d3ff6659394e56a7ef0cb2c9982a5c39148e
change-id: 20260921-nord-usb-dwc-dts-c2ff685d8219

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

