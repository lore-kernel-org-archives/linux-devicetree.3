Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067C03A75A3
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763831; cv=none; b=XGIBq9BQrSQtjt7m7a14ew2CcFYttehhGP/5RWlPZQ17sqgk3CSbG6JKD02Pky5uIg07jK61dySRVFWfcpZkUyRo04AI+ae1gfp1Ja1lbdhPuKqR7qVdiByHlxQTUlAPEdxDFfvGHYCCQM4rhujXOa9QSQc7mIrJp0lS8jnKLaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763831; c=relaxed/simple;
	bh=JmNFZyPbdOmvWrGytmgIq+OZ/ncJmYtkqcaiw9+0EZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmbTn13uEZPswVR16kla/YJnOzbjuWK2wTol8JvqgesYfrtM6CNCJedNJfT41v0c3oTbOYibQEMXg0vWBc3TeuWJgMPMU0F+8sljnSs7Npj4Ar5SrCxI62YNMPwU7VtmhkjNZamxwXdD5O1V+c68U7yFrkIp34/Ze14yBiNtAZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1atVNFc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eeASjJb5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1atVNFc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eeASjJb5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuhx32548595
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1yggnaC19Gp1PuLDDoUv9K8YjHZMTLGQKuxWhz+C0c=; b=b1atVNFcf7vwR9Kj
	TTKCO3Z39yxNDHgW33D7CZFihE15Lon0pTc5r6/LPJTvhRz5wImmprLb9mVlFfEl
	fT2UwU158dAchNPzdPa1fzn8tqkkUaA49rFKzkeW9+xlrLyUtGzopNLPRUJQms+Y
	Eokrr35qgcUSvm/8TvxGG3HScjrYJnIQbB7ovVa19z2uudYXH6RWcFDYjeHNEtqH
	BYMPiThEyM+1qTz+BhXVBR+3wGv3oV9z5c0kOKQelN5bATbljYNuie9z2NEj+06B
	1eNrlqeksyRG8bDsfTrH+umDALynHyYJgwdLHVbl9a2/FkG/OyXvUts1OfPzsLOK
	bdaeWw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1tatm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 17:03:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6df0a1e18so17176415ad.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763812; x=1788368612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1yggnaC19Gp1PuLDDoUv9K8YjHZMTLGQKuxWhz+C0c=;
        b=eeASjJb5Axgz/XP4lnWIz/VKxkXL0ERV0eRX3lkobV3HVnEPQXqvXLE3ULMFXvEXiq
         ExBY7Wcuut0x+y+AZ6XTJ1nHRRZSZzBCitb9Qmb6l4jXp7nSp2iCJFDGDX8uJ59moIlH
         69JMNONp7vPXW33e2eyLRcWBlcypT2uqEXPZKEraR1j49wGhwj1lz86d5hPFAi0zBk47
         aJZjZGz0/89g7skW/j07EWFp9Hmljg/kLDkQQQHXny9JYoWMgqMqXKTDjl04zyJvFwEz
         u9Vxmqz+bcmjEefvrOk4PTFgvROF42Vk0E12fQzT8xBGFcJkXY4CcMGCRY5RM8kC7L8C
         U/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763812; x=1788368612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1yggnaC19Gp1PuLDDoUv9K8YjHZMTLGQKuxWhz+C0c=;
        b=Wi4j8b7XKJHc3J3od4AqmzCbUJzmSkzKKhhBGTxcApV9TEDwmCeZ49dbsWtiKJ8cLH
         9kTQ2NEMLEBP9F/4ln8/wwISF/n7gQrfkSYa5q+hiw0P/Pty+b2Jt910eVeCvOEhD71r
         BlwELuB8B4nlTkZybONvuFW3PBaXavTo66nhKrICf9dio9RiKmKWqg8O7UU0qg+2DuEX
         CnaUGbjQBYPUPCCffwReDd365/I7zhnca6aXrF4Gl+TEGiQqODLoI8RqBPKCtAeYBrid
         rIUjRLBFt2woGrwkktOMy6ZCe0BO0kns+VUFQRKqg/T2Z0jZFJOqQqVdGbAlYRHdsJOc
         HxQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrltPFpzMA6CGZnhEIXXMy8hgu4xX32w4R09ZOhrjOTMjkTve4Ut2xmSfnquPy33X5d2r0QcfxsEaxn@vger.kernel.org
X-Gm-Message-State: AFuF++lm6FiAmoeLejyCsCv2aUNNcId/Bu8lCfeZtxQHPkB5tpFBk8KF
	sQvuG+99XmvN7WyIh5mx9DRDDg9nDbv81OHxqSZN9XB+MNYATDOgCk1YaGfJB1kYn1FY7S7/VML
	ZwjbHK3EgTH3vacwcaGb+0bcX5gsJ05mvWaLA6ue2WmZZDQO+5mzWoI9Fy1X1qzDU
X-Gm-Gg: AR+sD13ZE2ytZkfOE9G2gzYdZJkH36Me4Kysnu/bwV8/x6l4V68oX+vXVwIv0RN7H/6
	szaMkoqVnwzXLEQFayppYsCsyV6l0Pe3wL8mZVsx0WEBM+qfS1HU5slRx7Aui/v9qcPHN9cButC
	3CjlpyhJwEtp9enTzv0ZDVuctmCjK8wUvh0UbYmadDIuuu4bmjqYMkXdwTNq80/emMX0C2IeGpR
	069WsOp0+QLYt2Iy2xmQaQ/WlBgDa+BRzpkdSNzBqs0w+M1uwtyK4G8CbXB24/8JwCTH88sFBSp
	JiUV8mNiOVqBFVPW2RmPF2tFLoUbg3J3JhTXq3dyli3Kc9wHBZquTOBHo1RoiPyvJG+szIqO7Gx
	ykSym/2hBudLydL8R71LYrVl099y1oClCU0XsujFO1hjWRXsuriF+k7fOL+7frRJWK5L+HA==
X-Received: by 2002:a17:903:8c5:b0:2d6:3c2f:69b with SMTP id d9443c01a7336-2d707aeb1b2mr176403025ad.8.1787763812359;
        Wed, 26 Aug 2026 10:03:32 -0700 (PDT)
X-Received: by 2002:a17:903:8c5:b0:2d6:3c2f:69b with SMTP id d9443c01a7336-2d707aeb1b2mr176400575ad.8.1787763811597;
        Wed, 26 Aug 2026 10:03:31 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:30 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:32:53 +0530
Subject: [PATCH v6 3/5] phy: snps-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2-interrupt-v6-v6-3-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=786;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=JmNFZyPbdOmvWrGytmgIq+OZ/ncJmYtkqcaiw9+0EZw=;
 b=Thl+MigrVDnRdnpf4myP9BVRYDtHiWYAUHR1335aGtIbK3xOLkXgyVazvZ7swZ06H2nxhcsXH
 oqB80L+BqkQDO+CEySKkSIK/UxAoYfhrrsRERBKPEj0XHDgLJtm9BXe
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: 5PCARWno50F6VnNfPk6dxYjEu0MSy1ut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX2ESkjcS4CF4Y
 AbCYE8+lOZkOrjTZeGwaFOjXr7L2nV6jAXV+FecXPQWpT2OY51ducXF8kYRyvInIS4iuqBIiW2H
 A+gEIXifwmwDm0KDisrTBARIyDBL/Pbnpyf1YuSHJ8MIc4BPfPcXCtENbk15RXD4lqd370fhb+a
 Cz8skePTb0ykCw3+XjQdtMaLYIOhsDygxzohVIAlsnFUOt2ejX+PLqq7eA6+EiD3w3faMlYPRez
 4DUKR1KndL6SjVoOP1PUYR+fLUTTDyU8Pg1VVagi9uCs8JyyeMkwo+yUZu24GqTC0gWPPy9nXu9
 EYG0XKzbTy6IZrk2TPrklSE2qZ0s0pwbBM/5xoCNt6pV48LlzKc1qPLPlNToAqzIG+UMCUreP9D
 sOeJD4VPAttSfCMKf+ACcqKTG4QNjXKuDrptlazhi7oCmMwmKvfsDkBG0rKeLxVO9uE1xsVJtlQ
 vCFpo74VrpeVxjuRhog==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8f1c65 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ugjOiUgvsQrqGD8bgbUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 5PCARWno50F6VnNfPk6dxYjEu0MSy1ut
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX0MLJ8WFwIKeD
 rH3ZkPXRJE/EsM6f4JBPazG8t+pB05UOrqQuEwdKT+L085FeLohJI3PZ8BBJTZcnWtyBnI6cRvF
 SqZfJ3QSYFh0ofOt9QMOaXUWoks+its=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260141

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index f90bf7e95463..fe4ce9d752f7 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -597,6 +597,8 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return PTR_ERR(generic_phy);
 	}
 
+	phy_set_type(generic_phy, PHY_TYPE_EUSB2);
+
 	dev_set_drvdata(dev, phy);
 	phy_set_drvdata(generic_phy, phy);
 

-- 
2.34.1

