Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196A433FE33
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870128; cv=none; b=Ah9W/udpe2w4HbqAzbcWVdVYi8uhFsC3unyeQ4eHnaheDm9Mss6mWWTMG07w9Ymk8pL39M5KzxxCf1p5Ln2hjO6e7ZbTkn9XIkP4L1unzI05AqIqU1XZgMrCucwnJGLKyPhbJnwhaab9+T75rR6m4lP/Mw5ZfD52SMkH/Ph1Vq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870128; c=relaxed/simple;
	bh=9AcQqP3IBA61ponBq5aLuiVfoQQyMrsvshw4ON9Sb5o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AbY66td9ofBOYRlNLjHJzHUHc4tzELjyTM+KdQwGjSi5jXAhaqiYCiKn1I1PcuG8Q0MbD/2TJKreIUWvDw0hL3f2+0ja23jbIwsWkEjiI99yaGTxpn+Uc/qbKi3QeO724IVodQ2o9mYPCwe4z0oguPa4nUKbXV4Vmck/7dI7gxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJRdIiL5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUN9bUr/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJRdIiL5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUN9bUr/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZgDU2698028
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T7LzRzdOtGRUoiK/jsLmZx
	DmijLhPZ8dl3wvVuyklfg=; b=jJRdIiL567rIJv7vAlm73Cug7HBSNuu3qFciwM
	uJqxDfp687avA1HEEo0V6m98o33KStttKWB+fRay+FYHcfFF/5DbZ7hWut3cEATw
	tpw6TSM9/p33yIDpDY0w7JoYaGD0B+gGm2Pn3aAzxaNdRJukIV+7yUN59UnNPjZ6
	oFWznRw+9HR7VCKEbNOrW/LG8w73eKGub+wt6/1B+jCzHBPS6fIj841HNPRp/IX/
	eh/B25nbmAtRPEdM1tBmSEvYhaQlTSkJTMCX5R2akBFeFD0npxDNXADTBm9mn5ba
	hVuKvgkAaL00AMIWuo2O4z+G5PlnC6ORmMrt007iYkZ9WyUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamu2bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:28:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so1590573a91.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783870125; x=1784474925; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T7LzRzdOtGRUoiK/jsLmZxDmijLhPZ8dl3wvVuyklfg=;
        b=AUN9bUr/GlXAF3imd2nm9gSiXgss9YDxkvWkcrW9JoUaw4Tev4AOkPlY/KqGiTw1lC
         9sM6T/4fjAyugFpIEBViUlvouQZGWuImdZ7emtDVGX5nQhn1Rzr+UdWODIMwMxyE1k/P
         cwvi0q8RQdsVOEeDluUSZL4shpAll0Y7TIRpJH0kBAphOhGWUTQ3uDYdTLF3eK+QOSz8
         /Eh3k9AlaOEMmLEcUDPleerakKXWxqz1w7IKwRj/1wpzub5Wz/z/xoIwij3sG+Z9FSU2
         Q9PUuzJdcJCtjCLQE3K42DKW758GQ2MUByFfmMmQ3rIsru0PRveAMM3cxtNBdnl16MQC
         Mfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870125; x=1784474925;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T7LzRzdOtGRUoiK/jsLmZxDmijLhPZ8dl3wvVuyklfg=;
        b=hWb68GzEvKa4+Z6gZJo9Fbwn5v2AFik/OfxZbbHQa3FhWOXuVs5dLR1Ngs/0X82s7c
         i6iYjSd5DDJ74aruDLcnTvicW/+5fa0sJOrREo+JfIoMqtC19BXlf/HBBeOCEypEJOHL
         dmkWkSDmC16+S2e5fpBEhr1/cli9B76lkUtLHxgkMpD794q/z7Jh1fCTKrHGPMVf7fJ9
         Rvxl906Cicyfua8agAJ6KjU4g3s32bi65UWAw79KdZPdEanxIOvcpJ9tUPAP85NEL+/X
         CysMbwI/mIZRqIZH/pW6Sc8CMRnaLLm3TfO9piU+r8Qx4JIHqq5xuaGomRPlAEvYxuxV
         mtqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrofGzni6ZUlYbHE4beXMlKj3XzpTzimVhlY7u0GiMyDTejlJ5C4FgUHi7iFlrOwi2tJR58kX+lxlEg@vger.kernel.org
X-Gm-Message-State: AOJu0YwgEULzC5HarRQQQ3KX8Ee252UgnPlBGKArFq6Wy4Vzf4kMSYXU
	s0vNAb2S3QTO/ynuJCpqfNSl0MrkgrcR/O3Gq4fkM7+75/DEwCRT8MhBn1AIoswBmWfqPnrstWH
	KLSld1SS0g+IkrxirNGjZJ9dtmcahv2hkTDgxtACj0Q8JfD3CuwlmDLxzEO1SXuuw
X-Gm-Gg: AfdE7cnETwRt2uNLHUAnxQBJhUw5w5y7CidLqM4DVbpLXwHoPcT4q1ecX29nKKQoHNr
	FQTd19gGoWGA0a+p2nt7VIqqLBDWzb+iJBwSDvFzpM29ZTApt8X8j9qk47dbTqROvkZeinQskxG
	Dl/b7Tlwq++u90LnyyvAwj1mMfi3FrKb24hX202Gl+l5d7AanVHQOjYvE5pris8nI2Su5ehZsZR
	wsc7WSw9eO/vdVDuXezsN29q+VIwE4cEQ8g8m7FkGd3n7Wck9fJPBDjWAhvPxk8xlBwLDE/+vlo
	CWzIWWn+To8XY3gsfREcjAerrQ69Iv1TTXDI6LWCgi7oyN+AAHv19ERtYSrQc99Ji5mn+UPl9OZ
	LgraIbJICPOYAq1VGxMhKPyDtSw3H3HAP0fqf/sRcBftySbBhGOzwlpGec2yZfiehYXXZhxWVyy
	NEQfco
X-Received: by 2002:a17:90a:d00f:b0:387:d5bd:6231 with SMTP id 98e67ed59e1d1-38dc8499094mr4855705a91.20.1783870125019;
        Sun, 12 Jul 2026 08:28:45 -0700 (PDT)
X-Received: by 2002:a17:90a:d00f:b0:387:d5bd:6231 with SMTP id 98e67ed59e1d1-38dc8499094mr4855684a91.20.1783870124518;
        Sun, 12 Jul 2026 08:28:44 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm41458776eec.24.2026.07.12.08.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:28:44 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v6 0/4] Add USB Phy driver and binding changes for Qualcomm
 Shikra SoC
Date: Sun, 12 Jul 2026 20:58:33 +0530
Message-Id: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGyU2oC/yXMQQqDMBBA0avIrDugAUftVUoXmoxmFKxkqlQkd
 zfW5Vv8f4ByEFZ4ZgcE3kTlMyfQIwPr23lgFJcMJjeUV4XBVTtUL1NocfE7boTGlnXBVUMlOUj
 dEriX3//5et/WtRvZfq8RxHgCvsau3XUAAAA=
X-Change-ID: 20260712-usb-shikra-phy-v6-2c581e79656d
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783870119; l=2427;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=9AcQqP3IBA61ponBq5aLuiVfoQQyMrsvshw4ON9Sb5o=;
 b=oSeXFglkEXHHF132UQDh6cuFaE/2xaFCbvsvFDtKGzfu9yzB0UxJXgx+ZzslPhZhZvEhN4oAn
 IAkqE2hKhqDDedPeoQgU1cr0Bp85PL0XWXffuBGL4KAqhFiAK+Pw2/U
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX7WxLCjcSNjbX
 RUVvJG9+NSesI6m0HoJvw5XAJmGJ9K5rApBWSkIwzr5o6nQS351N9gGU7+ubgH3ZE9bwV2KpeAn
 0miVlj+En0tkDlrly5i9/zdYTUwG/1E=
X-Proofpoint-GUID: j2PO9Nyfi4ic08Perr8d4yAPbkVK0WY5
X-Proofpoint-ORIG-GUID: j2PO9Nyfi4ic08Perr8d4yAPbkVK0WY5
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a53b2ae cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1jnLzvbcVs2I2Y3RooIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX48vjtXzs319F
 m9fvJ6wdtr17v5HPL/08L77I9yrblctIjLj3NMOBle0FGDrxszzdOXd9zalVUEsH2TjU6eBlZY6
 tIqB2ASqLWE73T6BvV0sat/Ibkahf1P6RJJoCoBW014ko5iJ/UATP2DFAuKKeMPIESTKlrSsYoo
 DhgHeU5a4PFa9RuniOPd4ekQoMZ41wUWzNwIB4nsG4trc0RLlYjS9cH9KlY5RZWuUJzdYB3c80a
 I7ipYy4VNfxFzHz24wE0O/U8E9xcyf3k8eU8a3FahPEsdXkmIwqwY59bT0am8ZG6qEzV04iMO86
 edr21ubcbXPznCcFDpXrY04TJqVxKDLL3yf6K41/uPrtnxm7JenOf19WquTgBL7FZJBUOdsoRI2
 BnjRrSG47He0tNaGSHRrpw4NfJ1IENhpdkhJ/pcSRlEDg+miOjlcSQL6/LW59NOWF4UBMOFDOdz
 wJK1xmYim2aGYHm0Ayw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120165

This series adds Driver and binding changes for USB Phys on Shikra.
There are two USB controllers - One of them is SS capable and other is
highspeed only capable.

Changes in v6:
- Fix the minItems and maxItems for reset-names in qmp phy yaml

Link to v5:
https://lore.kernel.org/all/20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com/

Changes in v5:
- Fixed shikra specific minItems property for qmp bindings
- Rebased qusb2 driver changes on top of Dmitry's change [1]

Link to v4:
https://lore.kernel.org/all/20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com/

Changes in v4:
- Moved to using qcs615-usb3-dp-phy and added resets specific to shikra
- Updated bindings to reflect that there are 3 resets used in qmp phy
- Add remote endpoints and orientation-switch for Type-c handling

Link to v3:
https://lore.kernel.org/all/20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com/

Changes in v3:
- Moved to using qcs615-usb3-dp-phy since the DP Phy is present although
not operational.
- Using Talos as a fallback for shikra in qmp driver
- Add required "phy" reset in qmp usbc driver since its needed on Shikra

Link to v2:
https://lore.kernel.org/all/20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Separated the usb controller binding changes
- Updated commit texts.

Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com/

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (4):
      dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
      dt-bindings: phy: qcs615-qmp-usb3dp: Add support for Shikra SoC
      phy: qcom-qusb2: Add support for Shikra
      phy: qcom: qmp-usbc: Add qmp configuration for Shikra

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 49 +++++++++++++++++++-
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 53 ++++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qusb2.c              | 14 ++++++
 4 files changed, 113 insertions(+), 4 deletions(-)
---
base-commit: 716471df03105a6abdf02727f8a6f096b70aaf98
change-id: 20260712-usb-shikra-phy-v6-2c581e79656d

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

