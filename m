Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710353839B3
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 04:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521409; cv=none; b=Dd1vlFWbaVba6e1xw8/s+fKfQO8q2XdoGubU+v/7KayzZOksPTbMLDDlgtbmbmUV/Ny5UMASzQah03WAM2lmhqGkoMjRc6jWrb/l2tytdMtcJObfES3GKUKE1Vpt7V8kumIkAE47IMcyvodLQC636/JkYmG3pDBuNZnmDCC4uVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521409; c=relaxed/simple;
	bh=KpZfuXP2BncoUo7N8+dgXrHsboPVdkVVv/WXl4neQGo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iyfCgXMlmcvFFvaYMpERQtBD130xg1zPBt11nejjw1buEXt/MNzcvYxZnbC3uKEf0E0Xux1WLl6xhCzfHsNxCJs8OHCYI2sj13oyjk7NLq3z6AfUHHv3eaLEwhr8V+GVslWChR+W7J+8/YuSo80npyTEwR77mM8/IfDXxfJm79k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ag6VQruv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPaVV+bM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ag6VQruv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPaVV+bM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993H8eG1597943
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 04:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dthmHVxL/tRbBtpCCqegSD
	oLuoy6NnyQdhGorTIFVK4=; b=Ag6VQruvl1v+iIKaOa8KA11tEKcBYjzMqUBu+M
	CLog0HeYgj716kbRIT8e49OMY4Cd2z+bjgL9WWEqRnUTVQt39A6Dm98wtMy6uh70
	6L0PmsxgXoNCtC3tjR6RpguAld6lDttlviupVQFsafaDtiO3gQdBJ1smCw5ggu8M
	4c/1RkNNkNgsTsP1f353pfUSiU54cb70JpQaQwp++FwvnY1k/DswXCvbMXjI7KxZ
	rAEo9jJyLTMl8yw7V+FG4pVS/UonL/kkuEqeoY+W57PrSjAncdU2tht4XgsYzMQ5
	DYIKTXaGPBzwE0oO24OFCS/UEMfFO7GoCMWmFjng6EPS/tnw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufrqnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 04:50:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3535c27d880so1301610eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 21:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521407; x=1792126207; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dthmHVxL/tRbBtpCCqegSDoLuoy6NnyQdhGorTIFVK4=;
        b=XPaVV+bMCUfpwnzXjUPn+eTvpg9SvESVzwOg+ZQuWfJX8iFMU/IIGJBC5ahl4d/fLs
         wlM2lVic62yMIWJAL8ApgLiuORw07X6+JLMpMWB5h5ZOX8JEn3F68uVFcfCHPOzjnMC2
         8BdmLLnVbU5TPSGryOoM/a1oCJ0COr0631G4YmQJ0B427U9D+kDd/lDIXjXsO8aUi3O4
         K4RWEtUhXsGd3dYe6aEVJrN2sakE9dq1T/w9c1OnviDvQ6GAenP3AXAt+CTTDYvLfjMG
         PcOfsfDs/GErMY5eHTtZ33WHzwXdCIYVXWmJ5eTLCPBFwlXQZnEHtWzxM/hbnos5Tiew
         iKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521407; x=1792126207;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dthmHVxL/tRbBtpCCqegSDoLuoy6NnyQdhGorTIFVK4=;
        b=idZGEMpsroLU+x4YSJqo5h/wbOHForTTzmTowbI+zrlawHGL0J00lGhSP689sJaFJA
         aeDyuy2TQkYyiFg0xbkyUj96wIa6YSfcaIzdQEPYVpT7ZjgrE5B5poHFDqAL006EZglC
         KJ6lg+2+/RRc6y0EMFYKMNLx4UdghBuoaA4mua6MgP7VJQBRGVGLGMuWiMx2X2HWAhLZ
         y/ag0P/jmWR6EO4YuZBjJ35/oPwgQe3kLeLJ9RVzku4AU0nJazMONpwQVADIWtRGCgZl
         jA21AS4HnPa7sb39Bz2PQPZ/ZHdjeMI3yupkC/CggS4IHHV5kaEzc0AQI9vyvZ7XA671
         W+zQ==
X-Forwarded-Encrypted: i=1; AKwUvBytDOvCBxOO+sv/SEbVx3QCMuaPD+8AEJz9WNhHGxoeFuNzW46WJQk+lFnur0vTVH1NYzBXR0k8Hz2a@vger.kernel.org
X-Gm-Message-State: AFuF++nBbPBeIuVZqA9IivxQ7JR8jCOpQQr+fRGHIjVwSDWb422Jkx+R
	9BLNl4NntiOA3azgkj+pYFLoVf0bB6HE88uGsRGGBT2JUUPiqe1s7gqWkdN0MBjZ4ta5XRhTmop
	UVAdpAyvBBsyfTV1FBeqnFXBw+zIq6c2WSQTSO75VQRtG4/GLJ2hMKw7GynlHzayp
X-Gm-Gg: AYBFou3E6qqY/SeE13lFpq8S4l3296vlR6WF4rdSRN/Is5WOneWuj3rQitMqtsw7jvW
	UtpUXFooxJ+yieHZkBdxxfilz3+nKHpnplyF0RMVdJqg7/SWANXTE/ZpEoO9lrPYFL/DBj3Wya7
	bgKAMz3icgbQ0HptidEX4cSskFk18vGchmqSMKs9MN0uJElr/ccy0/FeYHpUUMQPoMb6GnO6UXD
	2WqUQjMfONUbNoso43lGFTvWtOmVsnzdtqFjf2sJWr8R+wWa6Tex5Ajm0eX0mPCaWfp11nfUOLb
	3sFs3eY64CDkjrinptyZkbMaKWBdGYBbaYUZXp6TcaAhV2q6sYywthffL8+Muo9UvltsC/vv4D+
	T/g7VUL9evFmiu1ghzTVd6FiMQnJEATaKKFmeHKw75rFXYV4pX7ly5rlp7tYw59VGacT8x2SaiC
	t3zsZ7Pl++wyfkCS+y9Ln5LsfzricKPA==
X-Received: by 2002:a05:7022:1584:b0:143:4d12:396d with SMTP id a92af1059eb24-16a61a6def5mr1248993c88.26.1791521406576;
        Thu, 08 Oct 2026 21:50:06 -0700 (PDT)
X-Received: by 2002:a05:7022:1584:b0:143:4d12:396d with SMTP id a92af1059eb24-16a61a6def5mr1248951c88.26.1791521406019;
        Thu, 08 Oct 2026 21:50:06 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:05 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v6 0/6] Add support for USB phys in IPQ9650
Date: Fri, 09 Oct 2026 10:19:54 +0530
Message-Id: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJyyGoC/3XPTW7DIBAF4KtYrEs0DD+xs+o9qi4Aj2ukxk6MY
 yWKfPdinLRZ1BukQXzvDXcWaQgU2aG4s4GmEEPfpcG8Fcy3tvsiHuo0MwQ0UCLwU3vjxiiqNXn
 ACll6eRqoCdec8vG5zgOdLylsXC+Zs5G474/HMB6Kjq4jXwIFQMkW0IY49sMtbzGJLB6FKhdOg
 gNHva9NaSUKcO99jLvzxX4vmbt05JgJ/2gFYqWYqPeVrLGRTrhmg8oX+myViUJZ0t4R+MbaDap
 +afqQXqlK1IHySqAk7+QG1a/UrFQvCzuqpARrlKr+ofM8/wAH2NZGugEAAA==
X-Change-ID: 20260820-phy-664ed5ec0292
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8727f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tpprtx7nRKxrkFoMJnUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX28747hFKWQqj
 hMENf8BF8g4uzzVnDHOafR4Ko0A+Fjkeq1p+qwrGQJgOHiQMQhyXadsg5wc6cssAXixFSNQtgZx
 0miHb8XIiHu436lZO0ocdwd4HiboHU0=
X-Proofpoint-GUID: 9z__1YLiVjw6if0V4GYaGV3Yl6RIVOiZ
X-Proofpoint-ORIG-GUID: 9z__1YLiVjw6if0V4GYaGV3Yl6RIVOiZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX16BmdXU6ONfB
 ZIOVUS4Zxx82TlmYwrf9F8vrE8TWojl9MPPFdTis/kOndCduT1QY97lowyJFz5qjx5WH4tWReOU
 FikFceC4JQddtP0JQFpFh9dW/gz/ReoByx/KxtEJNi9vyTlMxDnRe6Vayqv6zhtgE227SteJA++
 j4/R/Zv3jEkZnV5mtobNctoFzntO1aYGLM8efVaztdubaiUkSghGHcC2RKaTpzeiAcBqq72CYFS
 m0USDFGvZ20zGjwZILWa9xR7KJeBlVKbdoFaYCWN3+gh5amaje+QYb8j4DCuQ46K41AWjzHXlCF
 OcDDoy0XcGPqBeUzQCX30oxg7//6oK0rYe8uPPmFdjR3tT0DYKI9bf9CS5VE1z/8Hs+Tujyf36w
 dqBPNllWrtWfVzlVxvSfFEoLD6N0tOZWovYJAAzB8zuYtKM/h31fPAvTMvLNbcokhLu4IjC0z6j
 hDAKkmvvh3UWmouWaqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090019

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v6:
- #include <linux/bitfield.h> in drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
  to avoid build breaks in other (non arm64) architectures
- Link to v5: https://lore.kernel.org/r/20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com

Changes in v5:
- Use FIELD_PREP_CONST to define FSEL_24MHZ
- Change commit subject to 'Fix order of arguments to qcom_snps_hsphy_write_mask'
- Use data->{pre,post}_tuning in qcom_snps_hsphy_init() instead of a temporary
  local variable
- Pick R-b from Dmitry for two patches
- Link to v4: https://lore.kernel.org/r/20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com

Changes in v4:
- Rebase to top of tree
- Split 4th patch 'phy: qcom: snps-femto-v2: Move PHY init registers to config tables'
  as follows:
	phy: qcom: snps-femto-v2: Fix qcom_snps_hsphy_write_mask argument mixup
	phy: qcom: snps-femto-v2: Move PHY init registers to config tables
- Link to v3: https://lore.kernel.org/r/20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com

Changes in v3:
- No code changes
- Rebase to top of tree
- Pick two R-b tags
- Link to v2: https://lore.kernel.org/r/20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com

Changes in v2:
- Pick one R-b from Krzysztof
- Use qcom,ipq9650-usb-hs-phy directly instead of adding a 6nm compatible
  and falling back to it
- Change pre/post to pre_tuning/post_tuning
- Use array count instead of terminating entries
- Fix value/mask mixup in 2 places
- Link to v1: https://lore.kernel.org/r/20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com

---
Varadarajan Narayanan (6):
      dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      phy: qcom: snps-femto-v2: Fix order of arguments to qcom_snps_hsphy_write_mask
      phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      phy: qcom: snps-femto-v2: Add IPQ9650 support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 118 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 194 ++++++++++++++++-----
 4 files changed, 269 insertions(+), 47 deletions(-)
---
base-commit: ed06cc88c5e644da0f1ef397a836c7b1c10f41ac
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

