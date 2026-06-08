Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E102379971
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 06:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901969; cv=none; b=lyhZNEpiM5EF1c0OcbS+0nMCrXt2cmZXNFt6WuSuSaWu4W3i6p6MdVwvb2f8Iy3/YZnLYX/NeV09y9NSy0x+5fAbACkkd6InNC8uf7mQW1ip781Is/OMhIzVTRPbPI295knzKhT+xwDznQWMQqeFl5woUeJS6+8Dcx3s+/QyZMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901969; c=relaxed/simple;
	bh=kX8sQsZD7+GXxK6scrMwZsmWM36HVbnaMaQ+ChX05zw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=upNUZvBaWYGsHtqrhsCDw6U1zf1jcgEHgqFJBVF417/EC/FeJs2HdwsB9ImXNPTk7ai9EjP8J9fNPgHgy4hhuMXOUxjFOQGCg0PuX/Q3NUPJg3wljAD64788PR0xiq6kxdWUOYTqD3bSbmYv5GMFLQuRcknudtk99FVjmSUjnYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pd7Z+oYL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FdYGwciJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pd7Z+oYL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FdYGwciJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OnMq2802065
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 06:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DoLbGeNFDGlHR+89QHRczU
	z9SK+zm6OjHb7++b63eUk=; b=Pd7Z+oYLLpo92FhhBgXxctOptCvzfHaK0jKa46
	z6i9ZA+O5LRmjVc+ab0pJYbzXpfeLXJS6p3WLmwOD8fx89qT6TaMtMCyb4e0jvt0
	OquOQG72MPLa3Jm2VhlUx/6R5Vq05nifGYP636KhjWDZMvv8kZCo8sbNJcA7e4KP
	uJuWwbNj+emnIwr7UmHWAqfU8GFLfkhLG0giwcvSA9rJYFukBGdvF6WMquUX/uAV
	C2mOd2utnUs0Ads10bV8h+o1sMAOQDG4XsgzTgCLF8i8Po5kMIL6F/TyQ+n011SG
	IR+g/PFb0F9zlBCqkbeFkkVg78CEMcdPKnhcYoTQ/V8mxkvg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3psdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:59:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d7e5ac48so4501844241.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 23:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901967; x=1781506767; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DoLbGeNFDGlHR+89QHRczUz9SK+zm6OjHb7++b63eUk=;
        b=FdYGwciJyZwlJsy3bj09mUrAHxCQlHpxYIftFboBrYFHBY62Kdark8T+RCEstF455s
         shAYBY7VDWbjAPUFO9WkmelvlAI6EAY0ahRaG96SpGIP5bLvG+Br8USxEO/c2ogjo4j1
         XnfiaucaBipY2jUZmxAhh+BSF3jQ+S9+VNzbb3EoiXTrDEXF4LNQz5MUq66mev8g1lJ6
         nUPbYj+o6OOCujVG70N/698c2ynKTn+eZomCKXQKGFbw1ihF9aIbWSF1U/D4ZGNF3dob
         9zjYm2APCcuCPtYQd8utPdGuD8nEE9UKbgo5XknGSM2GhMUekzKKc9vz7g4bn9jZKDZM
         jDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901967; x=1781506767;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoLbGeNFDGlHR+89QHRczUz9SK+zm6OjHb7++b63eUk=;
        b=hc9qzrrenlaTcl9JgrIAYbKIs5x0IUaEdo0djMXc1tHxxKup1yiO8SJCBqIEZi+qUK
         w/zqLFdHSCQ1QGns3X89knXlbjW9aQAZLwMaDmlwKQr5g1zZ9Lvfdj/zGOokFPNVatrU
         GDijmjtC/TyrFWZBDvD1vqVMrT61fH5WVTnLLYQsxTdDuV2qOKk5Fsgg5VB1Iw5r+HNi
         C0Q+wOex3hrwEC+uwerW9GeDVuUo3BhgDbB28H6/DFRq0B/lgsem1XZUHYnWRtgHu6Pp
         WA/OJ51Mkxv6iET0h8h+8duLNwWp7bcJC0AfjIQj8qn0GqHeu0gPtXWlXDPsxdHGRj8P
         LDXg==
X-Forwarded-Encrypted: i=1; AFNElJ8ob4KB53sNx8r0W0ELBT5gz7HMue/X0eT2tVAbw+KwpwTFMwU2qt5Yy1kJXnEQM7C12Abp7q9WI8By@vger.kernel.org
X-Gm-Message-State: AOJu0YwMKfg+zGW98s17xOTovlW77P75yXdRvrzb7Q9/pHiSfacYItVb
	BSMJpG7zjG1dOFUtedbudslL7vpsen23dyvBQKC62Yw065N23Dp0f4z0uKZfOtyiCp2mAYELEiV
	BgbhhV7gDr1Tn9RPpw6SpGDnJjJwPFSPUch/SWiPwZPWEWrNCKGVXED8JBG0LH3vL
X-Gm-Gg: Acq92OGn8fyZ9FabpOpKy4QsQrN+hQzgLuyZdghpmXfJVA4I1IItf0RxKG0xyJJvAwx
	BQQ+f6gR0vVAavfGQsn6ht7Hqrx5/3NWyqroFmMzRMkozedq/cw/vNwnCIr+9aSHF3M50O7ouK0
	kRUbD3WTE1uDLf0BoHfxa44wafboTN1zZ+DdZyGzGrxTvbiuFa3H28PGnc17l6rFp0APe8zl5SA
	KRq6k3KEzV9gmfx8W8/Qedn0cgUMwM0RgJTmIMawuF0UB0c9JJHlJNv+2cvOh6tLTcksieNnoKE
	zcvyniBJJ+qe6K6SjrA908A8SI90HSqf8EqXAxjE6N3dlxHNvoNcL8yq6JzSd9bo/7acB2ia+mh
	isW8Xr4yN88eVVCQEdNGaP7drKMJgfZEf7GEOq5GE+8Dp+92fF+y0KImfMhkP/BDcFm6hpZvRn2
	PrqA4vekJqmtqtp986MT62c1d5+fUgEkFzjgKQVBfJMVedag==
X-Received: by 2002:a05:6102:148e:b0:633:8c42:183a with SMTP id ada2fe7eead31-6feff8177bemr7670989137.9.1780901966552;
        Sun, 07 Jun 2026 23:59:26 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:633:8c42:183a with SMTP id ada2fe7eead31-6feff8177bemr7670963137.9.1780901966202;
        Sun, 07 Jun 2026 23:59:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/7] arm64: dts: qcom: enable WiFi/BT on SM8350 HDK
Date: Mon, 08 Jun 2026 09:59:18 +0300
Message-Id: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZoJmoC/1WNyw6CMBREf4XctSV9CBZX/odhAaXINUK1F1BD+
 u8WWLmZ5CQzZxYg69ESnJMFvJ2R0A0R5CEB01XDzTJsIoPkMueZEox6rTLO3tgiUzXPs6I2Qqs
 K4uLpbYufzXYtd6apvlszroq10SGNzn+3u1msvd2c83/zLBhn8igLcWq05kpcHFH6mqqHcX2fx
 oAyhPADyvkjMb8AAAA=
X-Change-ID: 20260531-sm8350-wifi-3b0659bc183a
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kX8sQsZD7+GXxK6scrMwZsmWM36HVbnaMaQ+ChX05zw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJmhJ62EPLw2wHCOzmMHkygIyfRi3VNIwoeZ7n
 XMzCJgYxB2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiZoSQAKCRCLPIo+Aiko
 1aWWB/9q9FMl9zHtWaCN27mxlfW4OEuabIPIMZoM2/kXkQzi9TkoXEnIPjkwhXeEMPLRuJ89Vte
 lWl6jykC6bN6e0GDhye7fIZdmt8GIekDsZ/OzX5BxqoSsBgVSRlmlhP6rV6StRnkRhPb3peMVzn
 I9ErCOQyoxPtixjB4mVZAGqs8O/rTE2LAtdLQR2BhOpNnDxLL/S4al+KhAKzpoeLZxU0TteasLW
 gOVd2QDSqGUYmo6xTb5jbHNBMpvyVQKGlMnR6wjwHg5U5ra0vE54cneYutMDigJNxVR/xPlJeg9
 GA4vhuuZTwRz1aJNPRfnxuwDXYtGRAu0BNZP52BVtTj2KOof
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX7dJolkFbKhHb
 7QadxMZIxtKvYayWnR/pTQcpt3wlBsOdMcyYr2TxWCfhYUNHhrhGcKqHdhRPuNqcjGM3MHggnKK
 be1PnmMaHISIHpbZ5UXrT89wghO5RF8XnOsP3ketZ3BWrcB4VaquhihcKShGhJjPP2WTUkKzb2i
 xkgxp3kOkgbvJIwzk4mC8zDqZCcZ6g/p7pIYx3FEOTDJ51W7r3ba5XzA9u8nj+cW7mJsaAw5pTt
 OTyuUZZQzpMHX1T3LqhRf13BhD9hck8WEdgKgsADaqCZ/kqbzR+hR1Np+4KQXAI3tJcz9g3yiKa
 NiZTtgxGj30D8yi8e00ko7bymPyWb53yK+yY0WR+A16sJTR0VUptC5zn/D4o0u0netvoWMT2dan
 SurNKg4ddKCbtEtmGGHwS1oplBfBYXD/LtbsKsfT0ZVEKOS48iBzdPn8Jt4C8O38THN5cVqGST7
 q9O2d2yYanLralbGAOw==
X-Proofpoint-ORIG-GUID: aV-YuRq7LLufrSCP2yY0h9cUAj4Yier3
X-Proofpoint-GUID: aV-YuRq7LLufrSCP2yY0h9cUAj4Yier3
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a26684f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=6KS0kTMdj-vf8_meW0gA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062

The SM8350 HDK has an onboard WCN6851 WiFi/BT chip, which for a long
time was not supported. Bring up different pieces required to enable
this SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Bumped num_vdevs to 4 to follow other similar devices (Jeff)
- Link to v1: https://patch.msgid.link/20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com

---
Dmitry Baryshkov (7):
      PCI: qcom: fix parsing of PERST# in the legacy case
      wifi: ath11k: enable support for WCN6851
      regulator: dt-bindings: qcom,qca6390-pmu: document WCN6851
      dt-bindings: bluetooth: qcom,wcn6855-bt: document WCN6851
      arm64: dts: qcom: sm8350: expand UART18 to 4 pins config
      arm64: dts: qcom: sm8350: modernize PCIe entries
      arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip

 .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    |   8 +-
 .../bindings/regulator/qcom,qca6390-pmu.yaml       |   4 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 142 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  14 +-
 drivers/net/wireless/ath/ath11k/core.c             |  92 +++++++++++++
 drivers/net/wireless/ath/ath11k/core.h             |   1 +
 drivers/net/wireless/ath/ath11k/mhi.c              |   1 +
 drivers/net/wireless/ath/ath11k/pci.c              |   9 ++
 drivers/net/wireless/ath/ath11k/pcic.c             |  11 ++
 drivers/pci/controller/dwc/pcie-qcom.c             |  25 ++--
 10 files changed, 275 insertions(+), 32 deletions(-)
---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260531-sm8350-wifi-3b0659bc183a

Best regards,
--  
With best wishes
Dmitry

