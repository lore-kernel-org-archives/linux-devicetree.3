Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1083468C3E
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448033; cv=none; b=qOwTtqGJ6yDLROYClaNJDumBfv2Z7gZ3EDrJdmz8z93brKuR9RbQsf73ZUTLEYByUgwpS9Y3C7zW+UotZtZ8BNn6RTjUFgPGI2UrxZEeNWFUSJ487VpkUStiMNI1yIs9o+eubdLhw9rajZSlvoLow40JjcLzQdITVDU8jRB9zIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448033; c=relaxed/simple;
	bh=DvY286Kgs9LpIkD3BgrOsMV5PkiyQTq3FRBZELc+J8E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ndeQtvXaOqidGvQz61jfsOclSjSxpiqrPkOxxPIhu8F8eeTrF13WHeiM7jxJi2weaBZ62HsdjRDh2T/k+G7M8B1KNU9U3eBGA0dxN/gFpS7Ew7Pyj0HjQ/uP5p+7+yKUru8laY3/4gDPT3j2NOY1OUtc5O3E17+aDGnxYo/JAJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5uBGPQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOky1WjZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5uBGPQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOky1WjZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K9md1574548
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 08:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B37p6ZFYdaHkkMX6RKFojK
	hCiYRU07fS2ZyvpTfamfk=; b=U5uBGPQXb2/ryfUqoopPMymvE9wwESyofzbjqZ
	oSSLcagOnT0N26vDEpFx+Tumv0Y5lGvPwJy5wC3R/CbwKDNuKeYizIT1BAt6rwQK
	yMlqJCPYy1kKZWhHJ70WLXzzy7Tcj7asTmYF9wJecWuvRUtzqqr5utyfTpQXRt5L
	DII/zpSRRvpiLwaOcnagjRYyV0pNec60FCYuP3V9qX8Oga/8DXMDVfgrIp67tmje
	AhNcsKKYnQB7lFJVPUhQcu5zSayenc41ApYqI44sCssA1Ct8mdQ7FeWfVWRK+tKo
	GxSgwEXdvwPK0CNAYwM50zwdwfb7lpgUySIZ6y4hnkbR7/7g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51x41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:27:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5358515b4easo19773981cf.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791448030; x=1792052830; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B37p6ZFYdaHkkMX6RKFojKhCiYRU07fS2ZyvpTfamfk=;
        b=iOky1WjZ1mTQvXMp7EQvi7wJVNNRE139ygTcsCualUWq/1k9q6t6JiOL3GrzXkSO0Y
         CGtgrVy9mXkwjVXmN+hQ9lsTsjcaNizvwho5vqsRzdUytjZnhypKivIeZBGKPMkb+EiB
         ENrmWDOUSNvRCp5y5q0g2TPLvKMM0surd2RIW1+U16wijmu+F4DwUmR23IsZetBmg/qC
         Moz7MQaho4VJIXdW4g0Hxj7d4VI3v4z4mY8VGV1q2OWHZkUpE4kYsLm1H4cPwwgWZCwf
         icBj81dP5k2wIfgE+08/7mx3Md0vkOyymt762IBFrD1rdjyKUKYFx7KEFAq3qPRi0Nce
         NjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448030; x=1792052830;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B37p6ZFYdaHkkMX6RKFojKhCiYRU07fS2ZyvpTfamfk=;
        b=loDsrmLS6QKJsY4HSqBPSGnPZmaD5MFsvkKOxJfJva1aPo0+POTXKXaWNlHwT3Hn0t
         rOvkM8NdvmwZM7jE/hp2W3pRjQJzaKUZ7VzRIOJP8bO+KZMszkac4iNhnI2kFe2pTVz2
         MrIYXwdezjgZV1EtmpVCras1mGydDlpWHfxBZZxnE4MZWb7sERI1TjIq86Mb9HmYDqCJ
         qJtKNPg8mZZN8vJyd5Nhn/DmFqcdhEtEo5h0DOyAnsGHQa2CxY7qo6yCG5SXExYPRkit
         XB56PnIG6FKREFxiBtYGMGV93wqjsYgQ9/7+GD1HIThRCAD4egGtvWmmD2/jWKrf/rFe
         FDjg==
X-Forwarded-Encrypted: i=1; AKwUvByXqDa4ImzuO5GdKzC9eNSFALSsy1ZWl18ZFzMUkzkOj0e36C9k0Y2oPwfiZRH3TsL2asA0uw9o0I07@vger.kernel.org
X-Gm-Message-State: AFuF++lQdWZ8Ow9tSHor8G502+J20obGRjaC1GuEeOdTJZwqmnB/ciNP
	PvWntArMkrI5LXapEXHEySwks58xV8p76hTdzspJTPiKVyilQMv7FLhyaC/dRjL4KVev83Rq9/Y
	LYBdWbxVdpQp+EI1YXj3xNuLCU2FkmOLegq1NpF/UQ1URVg4DXu+igXM55/F4jCnR
X-Gm-Gg: AYBFou2rXkVstCPd1a719qSovy1UJzypO4UMsazmLi+1b6LY4wN/ssJmJ0n7fFzKKAy
	qsoXsd8cHGmC76OfWTs3UeaGUZ9jKX+Nq5YhYjRNdh9H0ifxExcS6qaoQ+FkgTNfdLdxHaLhhYn
	x/Rq8t8dh37YZHRsFaHOkj/oqYCZEQdRmAFSB2beHPQjD8UyX93YkcXLbcpuphWWSw5Baw24kfg
	uHnFh4nK1ucKiel0wGCEz6gVysoi0XhyXvxeRGrvPK0cNM+vm4ZdZ0/+byoTmqVegD86s8E7+9s
	QRc47n02mco25hM1X6XxLWXRr0IWMAYXxZB5PrHzDV/9/gX98TFgTEbhvz6Sc0kJekB3jnGt4PJ
	xqO8wdE9aUENV8gh7lHHY3dUnMGABzg/2MxUT7VmPlGYQlQV8xrm5pRRevNpirnw5NZz+
X-Received: by 2002:a05:622a:90c:b0:535:16c1:264f with SMTP id d75a77b69052e-535753ed71dmr84042251cf.14.1791448029874;
        Thu, 08 Oct 2026 01:27:09 -0700 (PDT)
X-Received: by 2002:a05:622a:90c:b0:535:16c1:264f with SMTP id d75a77b69052e-535753ed71dmr84041981cf.14.1791448029301;
        Thu, 08 Oct 2026 01:27:09 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5357219c5f5sm38928981cf.25.2026.10.08.01.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:27:08 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] media: camss: add support for purwa platform
Date: Thu, 08 Oct 2026 16:26:57 +0800
Message-Id: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFTx2oC/23N0QqDIBQG4FcJr2eoWNau9h5jDNPTEtYsLbcRv
 fusDSLYzYH/P5zvTMiDM+DRMZmQg2C8sY8Y+CFBqpGPG2CjY0aMsJxwUuJudE95VbL1HnORiUJ
 UhQDKUbzoHNTmtWrnyzc76MeIDlvZGD9Y914/Brq0P5ySHR4oJhhAqzrXpS4ATtb7tB/lXdm2T
 eNACxfYRmSU7gkWCRYXhaxKynL1h5jn+QPR+O1qBQEAAA==
X-Change-ID: 20260409-purwa_camss-475787b87e14
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791448024; l=1519;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=DvY286Kgs9LpIkD3BgrOsMV5PkiyQTq3FRBZELc+J8E=;
 b=VY96vHEHUrDOot2nltDp9uwKQjd8s/jdJDNM6WIGK5hDt5+b+NGF6616hnCa7QgSJLs1oZQuQ
 7t+V9HKK3I1AGTFrxyFNPlMSNKctKAJE39fDAVQj75WxGV8DMhZZ87q
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: CJMb8ZogsSkooi7dQheKk7gjyK_oL0dX
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac753df cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U4S9WEnYRaEk29xky1oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX3D+LVgsRAn7d
 6AIRlUSEFpQmXmI+F05W3THlIZvG6mYtWklfC8smgZ0ceeUTF+jdZYYhv0Kd2ub3B+SOBOWWHwq
 7paYOR+jnsJhFMuZFqZ9y/c5uq+mdHk=
X-Proofpoint-GUID: CJMb8ZogsSkooi7dQheKk7gjyK_oL0dX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfXwJQurS9GCOEK
 mRFm7ChVdRzJQMdLQ24uXL0z6sEXVJuwDyYJgmJtycaLF4BKP+wQdyAEPa08ufl3GXuHpF79a+5
 E0gMff23OQ15uR22iWNl5bJQ2BI1khzae9LZbWjKX1D/ABdWHHTX5YCW/Dud/x8HLnFwSgYyIHZ
 bxPwmMjODytnAXFTCya0bOeaC1ozbDk8ZpiMXlMoQl9NsCABRBmwh1RHdJr167iGotLv5kglbzU
 IsRGuM6aXGlD5hOuLcgYFb59sDPecaaoxpTjWmpKuAZwsoo+s0HMNrsxWYXpncQRgouPWcffpsm
 TnBI0g6Xpww+h5NvMndi6NlFAxaN3mczyZZ+bzH8qnWArTBGfuQTFZhOpxBh1oD9VI9a3Hj3JZU
 KNVXdcvnYEke4oL/TuIwaYgHDrv2lrd+DRvIOAE8Ds4CY3L3n6o0Z66PFZxwgydEoaYDR9t6Lc6
 n4Hyu5Z95HJXHCPVyww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080033

This series adds camss support for purwa platform.

Validated on the Purwa EVK with the OG0VA1B sensor.

---
Changes in v4:
- Collect R-b tags from Bryan and Krzysztof on dt-bindings patch.
- Rebase on linux-next and add Bryan`s vfe patch.
- Link to v3: https://lore.kernel.org/all/20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com

Changes in v3:
- Rebased on the latest CSIPHY code.
- Link to v2: https://lore.kernel.org/r/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com

Changes in v2:
- Based on the old version of csiphy.
- Remove Src clk. -- Bryan
- Extend the register block of the VFE. -- Bryan
- Add comments for IOMMU. -- Bryan
- Link to v1: https://lore.kernel.org/r/20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com

---
Bryan O'Donoghue (1):
      media: qcom: camss: vfe: Eliminate ever expanding src_pad_code switch logic

Wenmeng Liu (2):
      dt-bindings: media: Add qcom,x1p42100-camss
      media: qcom: camss: Add support for X1P42100 CAMSS

 .../bindings/media/qcom,x1p42100-camss.yaml        | 263 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  20 +-
 drivers/media/platform/qcom/camss/camss.c          | 216 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 482 insertions(+), 18 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20260409-purwa_camss-475787b87e14

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

