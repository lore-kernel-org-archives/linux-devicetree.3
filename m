Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569350;
	b=TJAtqA4BTWzNyiB8qJPJ+9qIR5rdKOrRNGn1axd9XT6KwCbWG8VLLngaDrpz4Z69Qyk9
	 UyBbeZNKqs0W7oHMa4x0kDznDJuapQlcTPJiuzjXJ0MMtv6tOW+nF8IczcBGPlfQIQ/3m
	 ms3Q7ixXNWui8i5+9goaTDJgeoxY1kW9NOpsYPpWZU7v2nAvSiFFaD5XJq6pZanQcuf50
	 yNof3E5iMKpVrHW6s76QHWJbfjutG/PQmvn7DHr5e7y5cIPKG0Ad2rvzJ/yXt8wZ69RSY
	 jSZKAve5WmEN2piJWUYYk04sRCMKoKKz++OCWaZCTvnWkEyFdPUEf8g3lmmZNlzimEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uOPG54pDdWNWWI0UImDPEIHhyYvJRCE6R7piuf/hkRg=;
	b=LcfKLy9Y/C0LOygGA58NL1EAhhzPZQbsUJ9ZG2Hq9817QR2+0M8ZbG+FtOZjdboCnqjQ
	 5/x1p73m8k1j+OYus6u/ZkE6KrMQUoqCRQP1foldsLNdFccC2V4DOrmyfTX2lTelH6z5B
	 jpI4mntnA+CguT8+794LDlymjJyYLKvNdAsGcuH6Sc4WvmLXtPqI+SNq0QQcSy625jMn0
	 XV9j1OUvHKEZaBYq1YxO1lidJnjUyHGkIrBZ0mOPU04vcQ0A6nXMcXEdv5f8CYxxdd5Rh
	 mdV0OCa8IBdzDufH3OsMYJT31H52GsVWKERTR4aanEkWhGVOh89/DN1jzcLgASuzjgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pNGT8eJZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=APXVNncy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A85606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44A85606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pNGT8eJZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=APXVNncy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V7aj3620255
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uOPG54pDdWNWWI0UImDPEI
	HhyYvJRCE6R7piuf/hkRg=; b=pNGT8eJZ8CF4BzOKgfwpx9cpLJaet4U2b/8OS3
	A3uNmXNWdLMMwZ2RTTLUL/TWnHw+54vcOVOL0ArrxKvGvhHN+eDOMQ9PfQxEeFSa
	KAE05VY+8QkKdMCjKR7CaHMxIBuxVm4OMlY2O6RBVAjB7EpmVzx6RjTHK+kwkDRw
	25toPPjdCZuo8v9o/fhpjeIa90Y0jFm0P/QhRaGRuzVy5WypdEGvgrn8VNXhg0gz
	Y/wRu5D076xmW9LQU64geshL09rYxFcujonS2PWMuShw9a77khFsVMEs2zHXWwMA
	+npAdDatKd3zHT9MB7ked6homBiu98oMb8mYTWcbKDGfcCiw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja9420-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:29:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1323909eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794569347; x=1795174147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uOPG54pDdWNWWI0UImDPEIHhyYvJRCE6R7piuf/hkRg=;
        b=APXVNncyH5+dijVex4ZVH+xRZvUD38q+0e3gugFg6J62qtuSEZ4oiPVbPH+mdgCFgf
         +v7JwluLNJqEQdARNt2/cq893OfJ7shmCgHmSoN8Pn1S4hDuHlMlwrHYOKNsvIXSMm47
         SkZAa2W+WOltaC3uQKSKGKyCABlA5lrSDWX6fxhkAkXkQwIHZJIh52G7Tj4pvwGNZ6B2
         N68nugX412GCiZC27/izIMIjpANl92HkMqIczVLDM1HycA9yiTjAoqvLnTiSbc7b6yqE
         5KWZDlhcJAKz8pIkJFLQhKN9XwQeP59Z67QTCTxgHlVO4Ba+2kV7ZCnfMGkEgrIknZr0
         r+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569347; x=1795174147;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uOPG54pDdWNWWI0UImDPEIHhyYvJRCE6R7piuf/hkRg=;
        b=NuQc0bcPw+fipwOHscA+sPwV8bNzjQ2YCI5604vL8d9wTAlcHFz4KjwRaINF0+rTx0
         SnsxI9BMFvvAyyX4e08PpAmqaio1+znZUTdUzsLk2OfYxdq2g76+Ae/AUv6xN04SVxIv
         iYD4PwBWsQb+biqyossGqZ1HgRSOUyZ7zdweKR+EeRQCkQgDffOMli66nqlUOyG5/5nA
         pgoy1MdwWSmFtcaoGVAa8Xc7S3f7TH0f+DmyBGHprhr/GL3o5/7JgOV892u6TvaoK0w2
         OFFVumA66iuug9T8yLkWtE9cOPuc0cwjZXbUhyS9oQ6Cqeo+g6PFrzzhxVqWJD/MulSd
         KcmA==
X-Forwarded-Encrypted: i=1; AL+hErHyatWdhDJ+4WnMcgYla1OSCKcf+lM/0OmisqL6mL7l6fNuH1cBKejzHBnhePRNvWVNOuT0Uw5AcQBg@vger.kernel.org
X-Gm-Message-State: APuU4Z93XdQZQJ5n6gl9+7H072ZYeaMDKXhD+2zymqUrhVgLRMZbl9FQ
	lnV1a85wAB6ofMGwJDvCroLbNP4j1nMFO7ivP+414XD3IQSc1COk83Y8fKMnzRKuKUywaQqJWzB
	Vfic+NUjGvvun3u7rkbwofDVS9U3OpZptdqGLLjcMDpP5Q7lkJxJYj2UNEHrUnmJg
X-Gm-Gg: AYBFou2HbDmd9r84eFD5L0eqkcBUrjYLWksa1kbzlmubFweVSxes1lu4+O+t2zmFqjk
	go2wIUaRncyBEmHdNclBO+LUGKsUE5csT0QyXSVBu+3kVjjlXM3F3KtTS8zsrhgvQlyDsNQSNDu
	w/8s7ptJEWFTZuK25EEpR369Psy2zj3TJq+fJKyRxC5O2FSWd2LX2NnvAi618pmfmLt/BI/S0/L
	MAJSNGXfCvIFzjVX+2av5ToNLVXJWGCB1zc9X3AvHi71bef+OD78CnfZQ5ogxEzyM/jnXBZswUA
	olsuJ01HsKBPAWOX2dfNefNU5htVkOaGGtfrXkrrts/9vHONqkfioTsYIT14MLeVdijoiWsqU/f
	kD4Ira57VOaf6jCYNDLfZ/4rq4NIDifnIIaLvbr1W/komGjP06Bqm0810Na8Ympz5KfQ8KaXKGF
	8O1nDaeNhpLQ==
X-Received: by 2002:a05:693c:8816:20b0:36f:350b:3838 with SMTP id 5a478bee46e88-379671247e7mr1977143eec.31.1794569347373;
        Fri, 13 Nov 2026 03:29:07 -0800 (PST)
X-Received: by 2002:a05:693c:8816:20b0:36f:350b:3838 with SMTP id 5a478bee46e88-379671247e7mr1977112eec.31.1794569346720;
        Fri, 13 Nov 2026 03:29:06 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm7342924eec.2.2026.11.13.03.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:29:06 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add support for LeMans Draco EVK board
Date: Fri, 13 Nov 2026 16:58:56 +0530
Message-Id: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHj09moC/42OwQ6CMBBEf4X07BIKBMST/2E4tGWRGmixC0RD+
 HdbiAdvXjZ5u7MzszJCp5HYJVqZw0WTtsZDeoqY6oS5I+jGM0uTtOAJz6DHQRiCxgllodVG9HA
 ICaTT5j6PwGUpy6I9yxQz5o1Gh61+7SG3+mCa5QPVFJyDQgpC/y6M6sLqJyPcgqbTNFn33psuP
 Hh9S1X/lFo4JNAoIbHKW56U+dUSxc9Z9MoOQ+wHq7dt+wB2fL9LEQEAAA==
X-Change-ID: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Kishor Buchi <kbuchi@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794569340; l=2102;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=9JHI65o4N+P1Y1EWl2jlx8W5cI+jtPQXJIohhY7Rnow=;
 b=MEC/P9qfuN/Rdg7X2QcwPJhCMAjNawIUHeIeT8WzvrAl5Cu7gCFNDXhq25FFKkSNkeWOCWOlC
 YXoICX8yVdyDeOBUafRs63mQ15FINpxRHuhtN7RgOluGUWNu9bDC0B4
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-GUID: A4qQLUWbQQWFE0WIoEsZO44AfUjPgd4G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfXxb+CMV9ZOlFz
 2uHmckp0OfXu+9+AyZ1/34dO4pYeeb+REkekZCSCNbcpwb2tF+1KB67m2aIPPNNXyHOYlLMzZTW
 Eh9xCKUm2sR2yqiB9dv9pZpZPkrarZ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfX4Ceozxtsy2Cp
 ZF/76MxKqfOFqpsgTheB6Qro3oGdUlIyCAOeeirIj7sglsOTFW7NSCRpA/1lf1m+iOcC0kPEIAb
 EKfexEN5ps3LnXpRcuh3FUsz3z96orJJc4szhyDe0Ek2dhMzAtqA30OK/dwXOaldeAA94hA+xNL
 kMDBjJ4I8tuouOfXEA1rGhojwZJYYWlH6jZON7WKOlBPDRMl1nkMBc+QYc7zCXTUoW2snZCSe1V
 1CL4QVWurs4jUYpAl2NiVUdbuSjxq4KO001RCjE8Pia3yv2ImHKPp2bJWaTpocSiP32vlSlzFC0
 sB3V4ZfXPhJ/Drk07e4VKHImLoR/JLw377jAaer0gP8J9UYn8YLN2BYRuhS98yAjEfpdkrrpL2m
 WH1VDLJogjBK2Opqrd1yjNgCigOenTywx6fVQ4adWuG464x9yZ0TS5NqSl3cRFWc7nYhq+Sr+1R
 mdiaFnEkS4r3hm8rfYg==
X-Proofpoint-ORIG-GUID: A4qQLUWbQQWFE0WIoEsZO44AfUjPgd4G
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6f484 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U-ZJO_i5hC5E2wvnxUoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130045

Add device tree support for the LeMans Draco EVK, an evaluation kit
based on the SA8775P/QCS9100 SoC targeting automotive and industrial
use cases. The platform consists of a System on Module (SoM) paired
with the Draco carrier board.

The LeMans Draco SoM integrates the SA8775P/QCS9100 SoC, three
PMM8654AU PMICs, UFS storage, USB 0/1/2, GPU (Adreno 663), and
essential connectivity. A dedicated SoM .dtsi allows carrier board
device trees to reuse common SoM peripherals without duplication.

The Draco carrier board provides board-specific peripherals:
- Four DisplayPort outputs (DP0-DP3) via MDSS0 and MDSS1
- I2C GPIO expanders (TCA6416 x4, PCA9534 x2) and EEPROM-based MAC
  address storage on i2c18
- Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
- ST33HTPM TPM over SPI16
- AMC6821 fan controller on i2c4

Changes in v2:
  - Sort DT node order: move tlmm block after i2c18 node. [Dmitry Baryshkov]
  - Drop unused sub-node labels ethernet0_mdc, ethernet0_mdio,
    ethernet1_mdc and ethernet1_mdio. [Konrad Dybcio]
  - Improve dt-bindings commit message to explain the two-compatible
    SoM/carrier hierarchy. [Krzysztof Kozlowski]

Link: https://lore.kernel.org/r/20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
Gopikishan Thawre (3):
      dt-bindings: arm: qcom: Add LeMans Draco EVK board
      arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM platform
      arm64: dts: qcom: lemans: Add LeMans Draco EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 +
 arch/arm64/boot/dts/qcom/Makefile               |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts   | 543 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi  | 401 +++++++++++++++++
 4 files changed, 956 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3

Best regards,
--  
Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

