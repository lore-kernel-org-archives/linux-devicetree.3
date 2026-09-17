Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8A94D7D4D
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646088; cv=none; b=f8KYE5wtxOjKZH3yTO/0Xg2b4WZNFPuv8Uk2jxzpkg3tyR4fjZHfTT2qfOJG2b3oznNESdVrENOzvftaUtnvXzdeDsUHKyV2pMFj0M2HjAVzg7PW7jxSmqQTZ7fs2H3gy+kLmE1LvhDWZFTB4kub8wKL7JO7Zlt1WkL4UOgyLBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646088; c=relaxed/simple;
	bh=dnjpEa4I+vlCsqv+IgfA5NmF4iZGvDVvk01fzkpHuH0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DWRZ1eVmVl8thIdsJW66sijx9Tx1jML9glEgyKdckKfSTRnAfy3cjsTcboYmpox/A1AaNi8fVIT9v3wIdaY/xqEMFK/EM7w8HJgpPIzQmf5tOuDWZ+XkxD/cTfIWBd7ADmBVl9L4fsQa7R63GwkEjyTPG27gpmskSaEIsuKvXno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmUXOL4B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIRiFTuw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmUXOL4B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIRiFTuw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZmgG746783
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6mPMOUpi6SzQKlk0Nci9mw
	egyXRSmD8A3iQm0iwbxK4=; b=CmUXOL4BRQYIW4uDJouuefBNOSElfaX9fcxVUa
	IIM4+9XcCrHFS1z8o+kFtkpyskLvePYysPY8SsRZGXXIicRWztDOtg8O5nMMFlOQ
	rop4XTydnZ4P9t/nPJ0EGkENY+OWy3PIOZnrw1PcPikQgbusP3ZpzMGb2fMSDyff
	++ofm88+SfVzhfLTW3pQ8UXgqNYI6nR6nGZ6jDNM7vM2Wd8Vdt09u5Kcf09Z8njD
	wAEvhgXBjEIa6rW9CBd4F8qtq5NFL8W3LzcZcdvlDIwtH9YWErP7vXP86vKuPtCp
	B53e/Zdu2BsfM3pIXetW+74kI7KvShVltOjnuOSa0fbnGHEg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8t18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:54:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fb956002so10739335ad.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646077; x=1790250877; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6mPMOUpi6SzQKlk0Nci9mwegyXRSmD8A3iQm0iwbxK4=;
        b=RIRiFTuwffTyrqbQghRZ5gbc80eyXsDoyIqToazDRaaemnx0LiPCHO7aAeKA8GTL7f
         w+tyLz66DLAZHCQ+w++fUc2iGV5BVJ5vsBEUGW7HnfokYXRHvbr3mkbpgav3R1NLDyXA
         Io3uzLm7bYEbhc80V/yyLCp9VUyOIrjwFucBpKil8qcHcaWV3aj3CbdY4pU9xvS2FTqM
         X6mh0mXM3SrvQH4qSVo9jEV/BtpswZesusR7dxppdE+f+ex9J93DZtCODL8WlXIV+jlQ
         2VD2ImrSG9zaZUZpIQLwzphjqx1Q8sbKSP8DXomCe1MRUFaowslMeJrAIWLtNES8+4bS
         8WEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646077; x=1790250877;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6mPMOUpi6SzQKlk0Nci9mwegyXRSmD8A3iQm0iwbxK4=;
        b=EcUpg2t2C/ScztXn27L27dUq8vZKxcd8z+P9K0AwlJRVyozVlcnedsT/64SCiAzYp2
         Zd6hOWPu9WtlLXktcN2MilErY+jkvPmMuK5pumv014B/JTzLw2sjlosbjCGJNzhN8viS
         sj8iWkM4BuvpcBwIvwDYC0mNsk6muCmcZnhyucr9u3itKGXlrR+q4NAH5v6PEDsXATqE
         2E4OsAmd8UQKwFQ02FuuyR5go4EZHdpCuj7Afkm0DMbDQF5Lsr36vRPX0212fzehQvcK
         2FImLLrYMdCg0mIoMpE958B+pCyU5ixn2yK+MpiAjO3N+nW5pCeHPfqCxUtFCq3iGz1k
         IEcw==
X-Forwarded-Encrypted: i=1; AKwUvBysgMhH+NdBu7yzfEsnnlxuR3+lQu1pYy8VYMuKP7UQihcFJbK9ZUfZb62/plFRbPgjI1MHTVI4pcFE@vger.kernel.org
X-Gm-Message-State: AFuF++mm8HisIaUGn1eAmXvcyFvFlURbtF2pGv6wJlfijxtrW6ntuwkW
	An6+sxvpghvwxItlLlG/Q68OdWQd3k81TxWvMAXQc1toAS8HAnAFmKvFfS/tCIlrGr4R6c0S6UR
	wgu0gxWrLTxpVIPBZXlG7JdkG5RwuTmSWuzV1NPU+pZH24os/YY5wBqZAZMbuEDR9
X-Gm-Gg: AYBFou3CXH6PShRzHpmhmsEWS/GKQ1gp81n/K6aJ0zpWewMHFYthnqhSuIkXxcVQDjP
	CHW8q5dJQnkMAkijYazuPO0UIzm+KexmICjDB178J53OMg6ZVEI7fQ7JX4VbVILRxi576+wTCyt
	rMsKQSpxyF19ndJWVdA5zbRLshGyAiy1IPTvpUKWpFKmZFhewKjGSyPZgjYkkn5XYp/VZLaLQc1
	yvBkVbdiVNGFMBXFp9XCeo8P1yOY0GbUyKjaP9L5k/+dCBb+HGoBRzKFyoBj6hqs8hD+FBdOupO
	LSvFZxKy4E5S0liHswDF5GNWYICNhmDg2pjLGEZqVG57A89nYbLbApvsveDIv8IkHWZH9ClZfQi
	FYqKwsnNWkOZAWdULsvBsLZPO1Ku4HH35RQ==
X-Received: by 2002:a17:902:f786:b0:2d8:d4dd:24c0 with SMTP id d9443c01a7336-2dd8e76c491mr157327135ad.21.1789646076955;
        Thu, 17 Sep 2026 04:54:36 -0700 (PDT)
X-Received: by 2002:a17:902:f786:b0:2d8:d4dd:24c0 with SMTP id d9443c01a7336-2dd8e76c491mr157326395ad.21.1789646076400;
        Thu, 17 Sep 2026 04:54:36 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:36 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 00/18] arm64: dts: qcom: Fix wake-gpios polarity
Date: Thu, 17 Sep 2026 17:24:08 +0530
Message-Id: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAODUq2oC/22NwQ6CMBAFf4Xs2ZK2BBVP/Ichpi1FaoTFbmk0h
 H+34NXLSyaZzFuArHeW4JIt4G105HBMIA8ZmF6Nd8tcmxgkl0deCc48YrhN6AM7y+Kky6oQnTG
 Q/Mnbzr331rX5Mc36YU3YApvROwroP/tZFJv3rxsF46ziSpaybbXuVI1E+WtWT4PDkKeBZl3XL
 yRxVqi7AAAA
X-Change-ID: 20260910-root_port-8237b5931fcc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=5519;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=dnjpEa4I+vlCsqv+IgfA5NmF4iZGvDVvk01fzkpHuH0=;
 b=OQ1txjGB6PMjK0a/yflcALJHEQq9S7a1DI/RaKFjyeM8ykGBaoGhRAqTgnq5ShQ2y6S71TQD4
 yh+RnaeVR6HBJD/87A6PLovbhibLTK4AsZluWEhS8B6vfy5roKx/x3x
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX8VjShxHvDvwo
 t+utfXUmzQMkyiWmn7sJUaoAVip0UJKul0L1H+9K08p1MYSsyPBNbXn+4yHdyxa4c1eb+RLsIb4
 BbC9BhJeKLqvE/6rMVJSufsoL6NjZZg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX+idtk4gYxoYN
 vOLyoxrw7hiREmJZorMw09MlF6ULmBdUum0hyTx5loyH0Vo+tQBKDDpFUH5lmUN5QTTEr7BJqnV
 cWs/OJ096F+8Ab/T26NVqeRdh8+tct5EsJWpb1aWFzvDF2BC+fNClzMA3gNs1IJ7wGwMzg/c1pl
 KFCXAQhp+mKgR0BlritZe9uWpAqRqJt6m/o//KycY0iFTQHTwNPXv2hMhz1V0yr3E9PP3fT2fwX
 up8WcmdeCE7ft3cedoLDtksXzQ0HRALww5D0cwF0AAYLqZzdOJydM4fy3oyPrTYVYVDJkLPeOPK
 JPnM12ZKVdTb7rBiW6gHUkEpp5em1dHZVaLMS8AwqBtY3XuOGK7TWb7Pgxen75Aj3LoclF5glGX
 u6KUVaHnuO0iuBw1AnlGfuB5bhdYLEa72/8US+DtM93/DwxAE2++0M2TaH4F6Uj8rNlTZbc3KPZ
 6t2Y3LzZE52tpw9aRBw==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabd4fd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=jIlwi8Xdj-jZhFTxXNkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 6AjdvzGcR5s-DSsGOVj_Mo_lIx1aALcM
X-Proofpoint-ORIG-GUID: 6AjdvzGcR5s-DSsGOVj_Mo_lIx1aALcM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170166

PCIe wake is active low signal as per the PCIe base spec, Several Qualcomm
platform devicetrees incorrectly describe wake-gpios as GPIO_ACTIVE_HIGH.

This  series fixes the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Tested on Talos Ride & lemans evk platform.

No Fixes tag is added as no functional issue has been observed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Seperate out the wake patches (Mani)
- there is messup in previous versions instead of sending as v3, I sent
  it as v1, to avoid confusion I tried to carry version from the previous version.
- Link to v1: https://patch.msgid.link/20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com

Changes in v3:
- Rebased the code
- keep phy property in between bus-range and address-cells (Konrad)
- Link to v2: https://lore.kernel.org/all/20260611-wake-v2-0-2744251b1181@oss.qualcomm.com/

Changes in v2:
- Move phy, perst & wake properties to the root port node.
- Rebased the code 
- Link to v1: https://patch.msgid.link/20260521-wake-v1-0-d822567be258@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: konrad.dybcio@oss.qualcomm.com
Cc: mani@kernel.org

---
Krishna Chaitanya Chundru (18):
      ARM: dts: qcom: sdx55: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: msm8996: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sdm845: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sc8180x: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8150: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8250: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8350: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8450: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8550: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8650: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sm8750: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: kaanapali: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sar2130p: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: monaco: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: lemans: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: talos: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: sa8540p-ride: Fix PCIe WAKE# GPIO polarity
      arm64: dts: qcom: kodiak: Fix PCIe WAKE# GPIO polarity

 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts                    | 2 +-
 arch/arm64/boot/dts/qcom/lemans-evk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/monaco-evk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi        | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi           | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 3 ++-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts                      | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts       | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi                  | 4 ++--
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts                  | 4 ++--
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts                     | 4 ++--
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts                | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts           | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts                   | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                    | 2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi                          | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi                          | 6 +++---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi                          | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                       | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts               | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts   | 2 +-
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts          | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts                       | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                       | 2 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts                       | 2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi                   | 2 +-
 36 files changed, 56 insertions(+), 55 deletions(-)
---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260910-root_port-8237b5931fcc

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

