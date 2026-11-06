Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985306;
	b=r5zmjiQBC3bkOpE0WA0ACDa9As44qe012DuA54Bj6ZYJfHnTL5gbSsZHDtjfKpnw7FhY
	 g6UdM85GwpbYXBnooj4lqPjSX/ag+ZJNjoD2k65h25/7OIpDBDqLCCJE4JQb/mkVkyxRm
	 ltTarQk4etJK4dNFn4hwEPgs18cRHx7djtY4osaD4ysHrDC4yEjD9a5yWkqCPu2cBkwat
	 w7oEy//niiAZHStY0WIYuXfTCk6UPBxVvkaSseWaYWPhxABNe4GyS41w7J7icTWrZ5veX
	 Q/vxY8nMcQB3hp64N7mcUWdrrZFRxVbMLSI8SxstuBfXfv/YgwsuG5j9do55g4Vz3MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mzPETPHnkYVK0UfJpNaFhQVJoXImwU21czXLXkKClNk=;
	b=aIII5G160TIZUGXUcHdMoEHnQEmSZe2gFenoyfTHmQzj6wrCCjDtWz0KoChDuCq6DRTf
	 jy6A6iClu87MHUItgokWlvY5cRGn2yTZndkdZ1H9voGZLSHpGxHm6J3bfVrPXam+AZOh8
	 sf1+sKMIxIVzkVUD8b2m1tvAY79256ZdO5B0y4jN0mSFHn916JpHPk8CYzGDCG4ouCIQ2
	 lYdtQeFoQIOYjME+aYOrNL86iqBqtg3HmLR8pU74BqqGrrOuZtLBe5mHSQbmqDG9bKgML
	 cVN68IJrpeqjfP4aWGuYznYrx+5yOZdx7SvWtR9hkLaEJQrKhV7XTh3xX6UDD58pc7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WU1WEKau;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYHNTpje;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD81606A336
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD81606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WU1WEKau;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYHNTpje
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F0ME1687909
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 17:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mzPETPHnkYVK0UfJpNaFhQ
	VJoXImwU21czXLXkKClNk=; b=WU1WEKau5zQSj+GfaHdAlAwBxl+uKl+Xc/Ixwj
	hJ1gFD3A60RZoELqBS7gKmcYPwyRmm1VbfXfxX/b4nW3DQx+f+P19s5XDGoFG+RX
	sSDNky0Fw1gn3yJnMZzn2Y9tCe055TXZTU6lfSETCxL9EiLfK4JpRaOOET+llHq7
	HHJ3W4NQ4snARMyhFqDLzZ6L1Snplds1Zhwd23BeruhorgqCjIzeFAW0DU5Wp3IC
	8/o9P2V0ry1EyAvj+ZuAj5kPvE3zzYGQ3r7FlLBZCtJc76Qhwb69Z088/X72yYDt
	GV6K9jfDji8WKw3bMkCAXcGb6ki/WHvclFsl7yj17H+GsN0A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb3tj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 17:15:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so2465968eec.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793985304; x=1794590104; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mzPETPHnkYVK0UfJpNaFhQVJoXImwU21czXLXkKClNk=;
        b=XYHNTpjemryJKWQ1SwERJ05ceqh/mtc2HFf/NA/dhvONMcgh/SV7aw4b4ACJGbZNq0
         cKI3wo2mcm94ZwyFf3fmVyE0suDq1SabQnNwkxHeD67NYGw4ff4OhYvmP4lW+GtFIuKV
         pNd9zrVtCacHKZgRUDNsls2w8tLDAVDI9JQbsKjL6uAvwDBfFUyFetInufaGkjdY3IHU
         QDsDVsEWM8Y/Kcq5TaURcWGyssptIDSSQc+LSGyqydFsHet9MA8FvoCwVNJeojICt4tF
         VH9iW2DmaxkZpKnYE3GFAO7Xf3d9hX7lSiCorSTzWwcJTcvtoRF8Y7GxuZyWREjXrKBy
         5dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985304; x=1794590104;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mzPETPHnkYVK0UfJpNaFhQVJoXImwU21czXLXkKClNk=;
        b=oIgxUTFmmpT/VEDsebkH8c9iR/gzbfNh7s0obVpQLAX2OovZPTPkLL/K9B4ZKmQQNj
         /bdr2QnMwUzUjN4QOWYBpgHEsjdBSHcAljFATpHSObiBTdH6GiU4DYedWt3MeiyDIjsk
         yvqVhG9T8GC0fxE+87Al1OF9t1xu23lZXE3VKYCVl0qUqdCULNizn2EXdjd7Lf2+EP1Z
         fNjAMJNWte1zqxocJ0UgdOK1+kUcTHdHD9IccgBG3B4c5+9YwdqUItgo8+A3BDBdIaQv
         l4AfXvjieQNzsH2c4f0tbS1JSZSHwIyHqTieamPT4j+SwtufvNvsSiIwzbDHBu+S2Qew
         lrdg==
X-Forwarded-Encrypted: i=1; AL+hErG5zF6MiQal6jb0ZKiVHM57nXSK2uQyHhLeAvDo4bcfxSoqaj66ndSahHQXZeJlaMjAz5nZXiEpIx7i@vger.kernel.org
X-Gm-Message-State: APuU4Z9xEa3VbrZVVDr6U1M5ga6G9EbHrblDzMQzlEaYup4tV0+SzcWc
	3OabYvrdBfo2rXNMRfkLW4o8Qbz6GFbqbnvbT6VKIg0FQJ+VghzqWmNHs3bgf7mCbhfx/T21K8d
	aJdqywecZJRa0oIx7RSxdY14mnN2JpH1qNH47jjh3/jAxw9ZtAirIsMji/jcb6Uyl
X-Gm-Gg: AYBFou2lEUU/2ZFp1iizcI1IxLQ40vOatYsatW9de59nP+mbKN+H5fg/XHULOyPn/Tm
	9JeXV7Lj7LhMNSAcYU1Ii3gJrTFe4mfX9it2KOIt6sBwAirhWdPHMqFAbDqWA5yR2y4KJ0MF99o
	t0k7hA/ekeDvfJNMI0Rxhz+3AheBu7MapvmfcxuaK4ZhFtG/n633u3KDbMkYVRcticp//iNPTmo
	z+SpWu+T6X+nJg1q3d+0RWC3j+8n7FP0+fAdrUIxykkSeZ+zSyqSN9v/PX5oSiJvazl/Vh9KqPk
	Igr9ezzranc19ieQdN1CxxjlXrpQIDM+C2zPLOkJ8Y5cpAfzm4dByweDfDgj3VP3+IRDnz0W4qZ
	yl8nSn0CDy914CO22QRejbtjl9u8HdipR8N6kE/+bC8wCV2hcTEnPWTqy/y/jq71VLZLgN9L9ow
	TZhyYfAdGq
X-Received: by 2002:a05:7300:dd05:b0:36a:f99:ae79 with SMTP id 5a478bee46e88-36f75a2aeadmr4180203eec.7.1793985303528;
        Fri, 06 Nov 2026 09:15:03 -0800 (PST)
X-Received: by 2002:a05:7300:dd05:b0:36a:f99:ae79 with SMTP id 5a478bee46e88-36f75a2aeadmr4180176eec.7.1793985303019;
        Fri, 06 Nov 2026 09:15:03 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm14693756eec.15.2026.11.06.09.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:15:02 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v7 0/5] of_iommu: add support for "iommu-ranges"
Date: Fri, 06 Nov 2026 22:44:23 +0530
Message-Id: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAO8K7moC/32NWw6CMBBFt0Lm25I+tAhf7sMQUmkrkwjVjjQaw
 t4tLMCfSc7cO2cWIBfRETTFAtElJAxThupQQD+Y6e4Y2swgudRCcMWMtR2GcZy7uMXETse698r
 f+FlXkM+e0Xn87Mprm3lAeof43T8kvW3/yJJmnCktvKqlMEKpSyAqX7N59LlW5gHtuq4/RAXNn
 rcAAAA=
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793985294; l=2711;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Z5Ua5oBOiMcZbFYp3oCu5cR6YJYcm7KwL8DCEcA6yZU=;
 b=dLAbyFhw5znL5UwjVUjewzKHN9IhmK8lt4IzRQsAfxEF+wfeGjBKMi7gA6LhDWlqg/7I8BhFy
 kyP382eR98EAPvFVqWUFsb0MnYZTmNPIE/Wqrf6JXkgZiv/PbKP1CNB
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: JHb7DMLUhQNK9U0GQCxja1YhRAq4REKD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX7gLaHuYbi9kP
 Kzed8kgCQLI0aeblszzrX5M+vRwbkGeNHZBtzY3PkXUQDCZdjOoLMuhShKWZ8jYGdmpUFbLbDG+
 MtvO1jjY7HdghUZdLxilNllwmSJ/Wxs=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aee0b18 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=izMSoC9YYMgMvuwp5ZsA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: JHb7DMLUhQNK9U0GQCxja1YhRAq4REKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX1O7l2UHQ9T+Z
 3LabD+Ktm0TgmRMFk6iwgyHS/oQ/vL+O9FS8L2Pzcki+ucuvKkxUlN1aLw5TGoa1NLW06xr05Fk
 sQMtaACGdSzVnHfnTd6ZTZNByotQJAj9hyijXSArA0/Q+pF5G31DahgXZD/j4de9ZPsdkj/eAGO
 Pj9grA2LF7GlQWnB/s3/ZN2um3xVuacA9gaiwzN5iGc2I1T/g/MRsvexfcZhzggSr1xtLn/CIZS
 i+02ur7sL18i6qCa2E+e2WP1LHV+eXDdnDnHgA9BeqN0g/FzT8Vi6N860CpedH38CziPwK4RMcq
 MSOPHlULyNk752GuHY3RVZJqHh5fdlgX/qNRToWiHGaN9fCyzH26rVbc7U2Me43Rzq03+JV9FW2
 6uEmJsm7WFwysOI72EfwWbM4r753HiO1bXV8u4v0BCBfQZPgMpwkc/H43OvKdC32o1DP0C2EZfv
 R7p/phI1Nopt6goWvOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060068

The series adds support for recently introduced property 
"iommu-ranges". It adds the required checks to error out for cases 
which are not following the schema definition.

Iommu-ranges was defined in schema with this PR
https://github.com/devicetree-org/dt-schema/pull/207

The patch series is being posted as revision v6, since the patches 
were initially part of the media series [1]. The patches are moved out 
to get review comments from iommu reviewers, which was otherwise looking 
as a media series. Happy to move this back to media series if anyone have 
any concerns. 
[1] 
https://lore.kernel.org/linux-media/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v7:
- Move the "iommu-addresses" behaviour change ("reg" required, non-direct
  mappings rejected) into its own patch before the iommu-ranges patch (Bryan)
- Make OF_IOMMU depend on OF_ADDRESS and drop the #if guards (Rob)
- Use resource_size_t for the size in vfio_find_dma() (Sashiko)
- End the derived trailing reserved region at PHYS_ADDR_MAX - 1 to avoid
  overflow (Sashiko)
- Add a dma-iommu fix to protect the IOVA rbtree anchor on 32-bit with
  64-bit dma_addr_t (Sashiko)
- Use the "iommu/of:" prefix and fix the subject case
- Link to v6: https://lore.kernel.org/r/20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com

Changes in v6:
- Addressed sashiko comments.
- Addressed comment from Bryan.
- Link to v5: https://lore.kernel.org/all/20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com/

---
Vikash Garodia (5):
      iommu/dma: Keep reserved regions below the IOVA rbtree anchor
      iommu: Use resource_size_t for reserved region length
      iommu/of: Make OF_IOMMU depend on OF_ADDRESS
      iommu/of: Require reg for iommu-addresses
      iommu/of: Add support for "iommu-ranges" on a device node

 drivers/iommu/Kconfig           |   2 +-
 drivers/iommu/amd/iommu.c       |   2 +-
 drivers/iommu/dma-iommu.c       |  32 +++++----
 drivers/iommu/intel/iommu.c     |   2 +-
 drivers/iommu/iommu.c           |   2 +-
 drivers/iommu/of_iommu.c        | 147 ++++++++++++++++++++++++++++++++++------
 drivers/iommu/virtio-iommu.c    |   2 +-
 drivers/of/address.c            |   2 +-
 drivers/vfio/vfio_iommu_type1.c |   2 +-
 include/linux/iommu.h           |   4 +-
 include/linux/of_address.h      |   2 +-
 11 files changed, 155 insertions(+), 44 deletions(-)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-add_iommu_ranges-549cf3fb0867

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

