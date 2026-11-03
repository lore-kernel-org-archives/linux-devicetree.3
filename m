Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719798;
	b=v6hIu4W23CYrDrpHaGv4SUIglitjoWxQb+d0rFC+gCGiNs5hIo6V0fHk7VqRpWZa0Mho
	 Kdg6JMhmHrsib0RbRoXOnYB1jvNQS79eRAhOTrzZyY9xQ2EsE42NYgrJxsYbgGripNa3D
	 0raTEYH+XV4LwxQBn7DfOq75rJdEFnom1AvFX4S2pL1uuoXLg2KteKjGLySYYCC+Ql+Kg
	 Ow26yAKi1q09bo36ldLsYiLZVgQsqkGqFK5PV+dMHORk5+JEuS7INMxoFirSXyuhwoZcC
	 BG1Wbnum/yIRJXkyokC5LfaWrlKgfQLkV30gB5HVYrGSPj2EL+OIU+aBjZqIcOYyqzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RzAwmn1KqONWs6eIlRenG+fOoEFpFouVi0Vep/WmIJw=;
	b=dtyud9y1ykXepuRTwRG+VvxtoaIvpU6cmSvWqj+6Iyh01IUI72iath2znWPfeEQybSY3
	 OOp43K33QuQWegj/MghiYF0ZoKtupc268LBMRNYi64fD0MM05A6EZynj0XCusiAsn0Jd8
	 9d+uMc+WtkPtuQC/6KPlwOghD1tXH/O3u/j7Ym86z0DoL3xtACNdTPH/zmswdZeLAOFFC
	 7Vi1prj1Dx+qzS6f0A68KLzTgmZGbZMMXt4NjGqWxKsACcc7HiR0qkShIE6qjCuKdMb7o
	 kR9adfPFS34LPItchf32wemqfGHEZY0N6DLz5TgdwqQH5uxNehjwHX/zMFWFZ4ACWDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OiaEb7tp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SZcZZQVf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41FE606A32F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E41FE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OiaEb7tp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SZcZZQVf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9tgS4104142
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 15:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RzAwmn1KqONWs6eIlRenG+
	fOoEFpFouVi0Vep/WmIJw=; b=OiaEb7tpyJlOXnQBKO5HXYHqU2QXQBLRj5DN2s
	J9m43VarO96/fhzBkqOF99pH/jp7CWtEd/7gB5g1obL/Bic81XJYCHaohzZ9l0xA
	L+lHtvzwMr0+EZwyBMpRGgDIamcU52pS6xKLVo3lnjqY/CW7vfFF70dfPu663YXp
	nY084CVXXX7M9tr1eG+Gk3Tld4uOjtgbHBopSwWz5AZc5phqE6SM5BQbwlZG3sXK
	wSM+nWcVUYuiimzvXkGUneVvCBHfi8DB1N11earN6dSoaSAKuDC8svxOHbUS+GIA
	Ic/5z2TXwadvdM0rxALUyXhXU2bc3F9NRqopaWEGqbBOcIRQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76dauda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 15:29:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso2264836eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793719795; x=1794324595; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RzAwmn1KqONWs6eIlRenG+fOoEFpFouVi0Vep/WmIJw=;
        b=SZcZZQVf1F3wcM84lqUno+8GmJB1IwwE0GUaV9fx8dTjxP4oC0u89xFF5m+RRyRQ8r
         Zv7ZY6N7HYwHcbXC9U94WsvgaJyJfPzRw27NisHqZyo33dJTpP8gVV+ddCaCq9tRsHF7
         ZbAXttlozttfc3IsbsLwYNTcAPbFhypeKVDM6Cmav7OaAFT0EzRx7d1YFYXy+yDBpOwm
         Dl3iJHtGClkwjPlxpNQX38sHkLALovubhy5038cm9dEwJj0WVdmCvjZi2M2DZL9ydqUx
         TRYvRS20EPgg8/2k4f9FCZtbbJ+eAfcpXbKxrElIM9PSEgje+BHUyU+ujxCe/lYeWqN8
         fT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719795; x=1794324595;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RzAwmn1KqONWs6eIlRenG+fOoEFpFouVi0Vep/WmIJw=;
        b=qUnr/PhwpSOKu+qv04YovQECorLysk8Dhu38UwM7LoX+RSFYmQM549lu2x6s5nOTgy
         y727Zdu+ft/FT/yeezX4cUH7ea/EJ77DLLUnJoY9QQSBx6ftLz3mWpnTfrBiVCT9Xw+Z
         zRk3OKOb1VPBYubOZg+G+fqdlwT1qyccXArI4e/1Po06ta0c6DjJAOTgYUkzSQ0sfT8c
         L4D1w/I9KW6JrGWSqYsOi7S+LvMa3A/FfWd6977QQURc1kRXTg4jLdzw2X0u16sYVCHc
         1pJyvU+dRp44S2B+qWL8b4TfFuWImSNv7v5+7n1X/0rBkpdrfQL7pOOpgfU69O/3ygSm
         iW9g==
X-Forwarded-Encrypted: i=1; AKwUvBxRNkba/DGP7qxC8mWqFOSYGFMqSxOvZjqZjOQ/yCSRwF1IZAGw+PJMHFs96UTkzK6kwWvHxBShmERE@vger.kernel.org
X-Gm-Message-State: APuU4Z9J+otx4hN7R/tVR2EnQ2wyaATryoDY9Blm0THoOy/CcqFd0xTH
	2a6Im8pTM0srqngZIGIxzO+OzzMvgvlRxBco/7riKx7HDK3VArcm/HeYiXNNqTB6pgj6pEKmciW
	rb5PoopDHWfQixMAoxaXyWKDv3GD0BIglFnUZtWnih4hdKlDvCQtrAMbrCu9HgYKp
X-Gm-Gg: AYBFou0aoTvG5rX4eAgkd/Huwtt7ZXVcWoGD4NjJh16Up7izhyBgAxMxwTR9TruvAax
	zRYH0tj+YobfKYh1b7IiZ0LaBHIN32DWLH9ho5gHPKtPne/xn61sK++woSD/SzZ9ruSi4aRel5X
	4L9nKvY2kl/2qn0gXl5+BKDO3CzJFf/jI3/UBc54IbHQlZeEkfrGv3/fyLdqfSkz6MElAt3t1y7
	a5ojT634ZfKmhdfA7nWwnQOUgMBthqpClRwWLjVw/JKq4wfPu1oivlOKhepbDtLMCmAuUGPp3go
	9ETDpgp8tE52m0CQI3WbnPs5Vge9MO3ZagmiOBuyMtx6Drt9aZ2/Lc+A6OWjfhh2e1jsCWG/F0O
	8wOugUpWqX9glImwmqRMs6i+Q+1GIOSRW93qrA5HtrpV/dNI7XRod0P5GvEoxmnZWVsKYd/ZKEP
	Y2J3JbkT4k
X-Received: by 2002:a05:693c:409c:b0:36a:30b:5dce with SMTP id 5a478bee46e88-36a423a3232mr23680640eec.19.1793719795254;
        Tue, 03 Nov 2026 07:29:55 -0800 (PST)
X-Received: by 2002:a05:693c:409c:b0:36a:30b:5dce with SMTP id 5a478bee46e88-36a423a3232mr23680576eec.19.1793719794488;
        Tue, 03 Nov 2026 07:29:54 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm59888302eec.1.2026.11.03.07.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:29:54 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v6 0/2] of_iommu: add support for "iommu-ranges"
Date: Tue, 03 Nov 2026 20:59:31 +0530
Message-Id: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANv96WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNj3cSUlPjM/Nzc0vgikHSxrqmJZXKacVqSgYWZuRJQW0FRalpmBdj
 I6NjaWgCSac2bYgAAAA==
X-Change-ID: 20261103-add_iommu_ranges-549cf3fb0867
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793719787; l=1715;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=52kUfvJEjuAQ68NM7IfYjdmCWi0NnQFqIUoegHkYmd0=;
 b=DsGcdPC6bbyZcgbXI+x+d2nTQHP/P17/5VsA0eTxp/IopXFAyFXAhN7bSJu6be09Ke2TJ33KG
 Y8u+E7u3GIUD4nBNAz680SfcfPFwpr+6GDGk0YC9/7/b9OlbVEMWgCm
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9fdf4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7TpIluchohn6vR-9VeIA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfX+H+NJb9bye8S
 QxGSesBu+O9XyndbFknFnFGzHT4Z8FEwMcqugtNbMbc3knVyr2f+3QACvgrBrTfPcx/Rtuq97jP
 /e6t3XDVoqFe2kcD0ZPfDlAQNu0bKCQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfX43PF315op2zt
 d/H4Aras3rgd3KlvuZMizX/NXt/Ap6D9w/4UaKMYJ1KN3bHRkL80/YFv4YlAoskkZErwzjsyocQ
 MXDV/GYzCqExTTN1aeY3WS9Dz/YajciCHgLaAPpCoHc8awdVWZ/MU6ANt2QF6mstD0imlULlWcU
 Oa7SLBKRPXjLMnHOG2bPstdtL7mDzJhl9g9GaWQmWj79yh0LFYjtj6vqekEH7MeFi60YXOS5TV3
 xSXy3OwnJDEuf/lGfIFCIpdlc4RPqBpLYH8XZ8m/n/si6SRuoSGPistUJur8PpVmjTIgB0LoxF+
 BAgMsrlroflhOuh73uoNlmO3vzB4RU1o+ZQKxiqgKxBsGEutHyiSlR/A+f7QyuuvmpBq+yEXdqL
 RwL5VewngmhWk4un+AnqdmWkNG1SEt/ouKyzfbbjHpwHcr17t+iylg1CMuzE0te7a9BafqKamKH
 r2K5oYN8EWLlMc363DA==
X-Proofpoint-GUID: x4hzLqKc1uqWCSGDvnLWJaoYfv2CfmHs
X-Proofpoint-ORIG-GUID: x4hzLqKc1uqWCSGDvnLWJaoYfv2CfmHs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030061

The series adds support for recently introduced property 
"iommu-ranges". It adds the required checks to error out for cases 
which are not following the schema definition.

Iommu-ranges was defined in schema with this PR
https://github.com/devicetree-org/dt-schema/pull/207

The patch series is being posted as revision v6, since the patches 
were initially part of the media series [1]. The patches are moved out 
to get review comments from iommu reviewers, which was otherwise looking 
as a media seris. Happy to move this back to media series if anyone have 
any concerns. 
[1] 
https://lore.kernel.org/linux-media/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v6:
- Addressed sashiko comments.
- Addressed comment from Bryan.
- Link to v5: https://lore.kernel.org/all/20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com/

---
Vikash Garodia (2):
      iommu: use resource_size_t for reserved region length
      of: Add support for "iommu-ranges" on a device node

 drivers/iommu/amd/iommu.c    |   2 +-
 drivers/iommu/intel/iommu.c  |   2 +-
 drivers/iommu/iommu.c        |   2 +-
 drivers/iommu/of_iommu.c     | 138 +++++++++++++++++++++++++++++++++++++++----
 drivers/iommu/virtio-iommu.c |   2 +-
 drivers/of/address.c         |   2 +-
 include/linux/iommu.h        |   4 +-
 include/linux/of_address.h   |   2 +-
 8 files changed, 135 insertions(+), 19 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-add_iommu_ranges-549cf3fb0867

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

