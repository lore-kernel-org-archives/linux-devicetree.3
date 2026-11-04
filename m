Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779860;
	b=ESDokLFevxKvaoLrBmatBCkjCOkXpjSLPbVCKwZ+C4AmnsZpeSwX1OjJAww43HItv/Tx
	 Qr2kUmE3DHSbQ4FDxdGhPAdzUg5cI0rkVM848PRcxsUd4EJLFBoLC6U+0SU4lbo3E/WGi
	 9AC+PTPe7OaobZbY3W5Of8ESqVpj+gXONvCtGtzc+RvWahN5fo8208IVblx85I4B5yfl+
	 HfayQJJSsZeTJlbmcFzmLMkwXqTjoTY8ve7NdH//UGRo/xJ0BvjYNgVRRvHSHXKn1Fl+D
	 gu4IqHZCn3NlDMooAK7MfUICh7dbOv9VwOBkfrPzF7AxOfavIuS38j3eJ7lTeMzWMZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wpjASZFX8c34eRfTv9obddqQTOa+9xegFnCuM4xKtAk=;
	b=FYY9Uy4m7+be/8rNnpddJMbl6Q5itm/g3J1OEQosJl2jI0DiYlc0j+JvfipJFLL2J0jj
	 8pezXy6sPXBTSa55cmU2WM/seIJkdyTaoXDYKxkB8XmtmOet16a6zMzwVyTEVXm0WMms4
	 bIX2uM5ITxqzM1wHG4J9iVsptSL5o9TKmpQ+7UFCj7VXH6CdEI+7TYZAej709SECjpSxN
	 ySVvQRP9Hoh7Obb4/d9c8dk/vmPnJCDpqA0GyCgH6RLsaWVXV8+4FntIgukJlukInqjhH
	 zPNbXLOZiP2Z8eH9wYOBlZIQ92DFq1S/ys6QfPwLihnWATo/e4hGqXQsbcSnuc5lizg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BWQ/2s4s";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VHg9+hWo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C0C606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C0C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BWQ/2s4s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VHg9+hWo
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43Opt6267281
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 08:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wpjASZFX8c34eRfTv9obdd
	qQTOa+9xegFnCuM4xKtAk=; b=BWQ/2s4s+KWDyptBlco3xv/2WfNuaBYidH8YHv
	ZCrsG9i8r20T6JW773TwIS2iITemH3ME6CN9vaeC65OieUfE/Issdbsw/Qkp4zBS
	CItfAbgbnnsoPizoqxyQZXNZHvq5O/Xls/7PIjmFV9xJbekdcbtKLFpLIMc01+Li
	l+FyTTibKYCX7w4JMa1tSDqlysg5Ilipl3qmmZaBGXl3NAY3jxJMWeronlsgaOkj
	F50cNMiCUAPLZzNUD804LXbpWTZHLOXB0WIa3fBKkA/V+4iDNKwKJumqG8w/dzDI
	Gc+iyEmXQIVbSeEE2H6S36MBo1mORNHvJD8ldZ/h0TMQoktg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg9151-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:10:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so818249a91.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779858; x=1794384658; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wpjASZFX8c34eRfTv9obddqQTOa+9xegFnCuM4xKtAk=;
        b=VHg9+hWokpw9Zgx3cAnIkBG4jYuLLG/zL8CFxHIV6VV9OkeNnBWykk2y6RFkVauyL9
         IpiTutD2tCeZiejPolkZE6NETqFqxeqx6i8CgMY3PysMKqZnnaEm9leak55uFRTr0EJW
         X8mzPamXJeC+krzkA2JB76FHr3/q1heaSogUXe+3m5Nc9uBoyf8xxUm3T7wz0+8FSQ9b
         FBl1+zOn75b1nRV5pOKa/ZneNRlp+6phH2m1VN/eQ1pOrc7xUv6c2FyjUOqgxnvlyj5X
         AEdzILtajDeAeAi2x04Vmv/0VlNybjRK9R7G0sjT6wOv2E9JSlUL3YDRhDtFovug1LZT
         tfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779858; x=1794384658;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wpjASZFX8c34eRfTv9obddqQTOa+9xegFnCuM4xKtAk=;
        b=WK5mROhDyOP1si3Gec/ahAcuTGCXPAHwGJkNh7tS3Ca2MTzLrg/H4njqWq3YKcQFTH
         knJxioa6+Kbm6nm/I4L33gTj+Yt+au/sFpJE0Y2uMW1VA6H4Vwb57cok2lhokNYRCnE7
         hJNxlQyFt1IejDzXBpP5YI4Dbxj98FliQ02eWP6zTlj3JCcNiPQSZJix+uQgH5bOAXAq
         cOUAfKZhCAFRQBJ5EAecQyC2sjWIqrLRvEjnSmczY5Zp01PDrhDiJBuOScIpUGNlXpbP
         hxOTJ76JhzHAvqhma91qjeY8UzYxptPwKfeiBY6+rWXnl8PeH0/C9ndPe7PL5rNVcuah
         GliA==
X-Forwarded-Encrypted: i=1; AKwUvBxhEUpR/sXvJCBQ0Cu5srGqM4w+22J0CDCJqH4KpVpjMgnGbl+7E5APnu9L7yxlA/tyJDPc6WRJG8UK@vger.kernel.org
X-Gm-Message-State: APuU4Z8EV74yct+UUjTdfcROXf2FOQW7YWKslSYgP6DxrT5InKaHfXTf
	df5827POBTX465Ssg1CWIvl6ekgdfUfVYMjD3a/vpFrLfzI5LgUNFyBDvgFCYk6TFga/4DPwJTs
	V2hS6thgzMf4ROZSaVLTZTkq/ugeoMD2hPenUO5/ZGCzgtN/ZNUHHRdLzWViB+RcC
X-Gm-Gg: AYBFou2iNTOmcajRlXqLOH0KjQjkwrcDhFf2VE4xm7y4aPEGR0o+heqOAf6WXDiDalh
	DFsY6knURTau7GHtjSOg6F6YsXxkM94Yl6zW5Nx/2lSgEWy2MptbApVnENj/OaoFvhEmAZPUpXR
	MM0JHxs/7KCmWUQrH6L0tizUHzrptQoQEq3T4hDg2nL5gZ++j24c9D4jIZr5mhb6qTJlq7EiQ/A
	QzCMVWYSolGPKE/jSlhazPP7ruBKPkMvDo3pCiHWmIA9H/7mB48mNjl+vTJuOfImhvI4HkyiYOi
	bRy7zkIihvCgovcctu1lIv0dHV0y7yErV/Gk/UAqxTpeGz6WfawvxGFlJWutzBGqdT8+HdyzO/N
	R13TNY/R7XM6hBPU3u4KJVWX0pUgG4LO2R5lVzZ7s4ieIWt4Jd6kKOOl/gDutqy2b3rGByyjs+W
	rEedjGHQGu6w==
X-Received: by 2002:a17:90b:28d0:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3ae895743ddmr13951546a91.5.1793779857752;
        Wed, 04 Nov 2026 00:10:57 -0800 (PST)
X-Received: by 2002:a17:90b:28d0:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3ae895743ddmr13951518a91.5.1793779857187;
        Wed, 04 Nov 2026 00:10:57 -0800 (PST)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm6089920a91.13.2026.11.04.00.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:10:56 -0800 (PST)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v4 0/2] regulator: rpi-panel-v2: Add vcc-supply
Date: Wed, 04 Nov 2026 13:40:46 +0530
Message-Id: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIbo6moC/22NzQ6CMBAGX4X0bMnSUn48+R7GGCiL1AjFFhoN4
 d1t8aCJXjaZZObbhVg0Ci3ZRwsx6JRVevCQ7iIiu2q4IFWNZ8KAZVBCTs2ozgYvtJBZUYiaCxQ
 18fZosFWPbel4erOd6yvKKeTB6JSdtHlurxwL3u+qYxQoSFFWVQYNT9qDtja+z9VN6r6P/SFh3
 PGvnLFPzn1esiTlLJEp5PAnX9f1BR9jGSD2AAAA
X-Change-ID: 20260907-rpi_reg-8c6885b35e5b
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793779851; l=2273;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=TDZPbLRwPtzDhDZDJhYBIn/7Vqee9lBuOpCJiBezBFw=;
 b=bLOTJ/+GihrKe/nz6Kl9UqFPMs/Gyul5P9lFlVm6uUeFpi9zp+tlQZa8/Gc/o+/DuxwYbBPme
 f9sm8Vv0qTrCICNn3/M/aUeM+Hruo/rOaxS7/9Jq92wuJhi64lvt29u
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeae892 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=Q-fNiiVtAAAA:8 a=b3CbU_ItAAAA:8 a=JfrnYn6hAAAA:8 a=hLbFB0PV-noiyqnaVYIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Rv2g8BkzVjQTVhhssdqe:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: jwsWWhewpQgh4qSEcH4hsQCiEcsxnwr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX622+rsbbKJQI
 eaowySQRPU1upFF6e2A3CB9IcNrLJu35HbFNgC7EhPuF4MwA9c+BV2p6+SSkBi+xabrz5rfo4st
 2LMevjlpwE++clN+t4VmoPu+dfQTS5RlYH2vLKcFMteFQdHX4uGTqVDmIGHfHDscxbNGavClrQq
 7XmtmvRH4rvNFUo1yGTs/BpNtzPz7z6XKEknbIFBF0zKFs18IRtYh3DeJaf67SvoU7PnChjEUiS
 htc+jd1WSIsKOsvE7XyzKQSWjyPLF3tduFkaJTGSOzzR/Ewuzlq2tLUepPaVpRzV+rf95MEYr91
 qSR8W4ULZyQ9dpT9XPaDWdJltx6+YPBdgFNMRnHR8gaekqRtQ8ps2cyt0KwDyHH0e5Q1mqOkgu0
 SkBsx9WHzWzbSEhyRc5//PZMzW0LM+IIL9ODZ7OoV5hdmYaOYjrJdfawkZW3xdoxRI+7FfxERp0
 h7FXTKIUfCQfp2ANXpA==
X-Proofpoint-GUID: jwsWWhewpQgh4qSEcH4hsQCiEcsxnwr7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX6/BY8kWOEnfn
 ajhIn2Kv8fHu+TkYr6564yQbUlF3m7zZruHXAAFcQ7LuljDEJo8M7od5dv71g0JbRd+GUNTef98
 UV8wlv6XNmEeUckz86TFo9Gqqi9LNkY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032

This series adds a vcc-supply property to both the dt-binding and the
driver:

- Patch 1/2: dt-bindings - documents the vcc-supply property as an
    optional property.
  - Patch 2/2: driver - uses devm_regulator_get() to obtain and enable
    the vcc supply at the start of probe, before any I2C access.

---
Changes in v4:
- Rebased onto the latest regulator for-next branch.
- No functional changes.
- Link to v3: https://patch.msgid.link/20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com

Changes in v3:
- dt-bindings: make vcc-supply optional instead of required, to preserve
  compatibility with existing device trees that do not describe the
  supply.
- Driver is unchanged from v2: devm_regulator_get() returns a dummy
  regulator when the supply is absent, so an optional binding needs no
  driver change.
- Link to v2: https://patch.msgid.link/20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com

Changes in v2:
  - Made vcc-supply required instead of optional (devm_regulator_get()
    instead of devm_regulator_get_optional()).
  - Added vcc-supply to the required list in the dt-binding schema.

Changes in v1:
  - Initial submission with optional vcc-supply support.

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      dt-bindings: regulator: rpi-panel-v2: Add vcc-supply property
      regulator: rpi-panel-v2: Add vcc-supply support

 .../raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml    |  4 ++++
 drivers/regulator/rpi-panel-v2-regulator.c                   | 12 ++++++++++++
 2 files changed, 16 insertions(+)
---
base-commit: 5436a50a0b44b448f965e928507b5159059dee57
change-id: 20260907-rpi_reg-8c6885b35e5b

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>

