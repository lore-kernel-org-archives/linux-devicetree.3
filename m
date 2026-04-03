Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D19339870
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203811; cv=none; b=r4RCXzOaWOEGq292bhmycUejLrNhPanQOTZUOsCoy74cLI6qI3KlMuA5vBOFbsxtunywy7cau0/VMfd3ewYC/zewLM50Sw9Mjb/EQpeGPWLXe2J+MkpztvJv1EB5vncBxb2ckPE+evo8lQZHxMN0jt3ZpQm5Wzbqup9KPAAz1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203811; c=relaxed/simple;
	bh=w4iloriSlK8kznmyqJnVQZrzmn3qqOsRH37L7AvSFdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qnYCAlLeyj90TGMN3LP2HA1ARiUnA5T0VM4ZN8gbRuV6LPoi1bVoVr/4hUGHcEiPAA0irwhXHrqaKJFoOuf82bLe5n7gY70CBzChlyo7j7eS85ySVHvf5RQWzR1kvkFX1QM/ng/U+fWmYlF/knk3irHHXTniwDtY29Dz3tGllJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAlay7OM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M9hL8CoK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAlay7OM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M9hL8CoK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336E1V23772909
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 08:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3yxxuGjGRSktiOSFeurkfNMNMudjTni1PnN
	qFP61cks=; b=SAlay7OM5cJHl5zc5svK6HLlTmllvm6qvO8B3OEMGUNL2vx+R/m
	9imWmfELIzjPpHzsJi0lgYxXqhlxKY/2nG/4oRTSl5MYmvTyj5yunplFH8vYf4Za
	WMsIFtieSLkpiorWwQyj/O/bF/sgvkcnZ/8zEQKhXBbVSbMxdYrCdul1yubbc+Ly
	2oGl8U8jqB+/iCbcCPCTVWVlAo7mzT/+whJNxd+zjxD7xvSSzS6kBhppmUCKXZbU
	StM2x2oKzmdMTeszpDl2b+QMvwdWUfpNHDqrk77Lou/toiBH9kSJKpI09DqjkDzh
	DDcXi1c8jfRJaG+n0BeWrA672wkxfSSoZVA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs258t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 08:10:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630753cc38so2799026a12.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775203808; x=1775808608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3yxxuGjGRSktiOSFeurkfNMNMudjTni1PnNqFP61cks=;
        b=M9hL8CoKZLmvCFUfqkTX5dh57htw7ggb83AOG0ZfiixMRZktV5Ck/a4GvofaqJOU/v
         Kbm5M9IneW4TUAzh/1NpkoUvy+5Y0+P1EEsgieM+Kr0ufdizpCVbT8Z7mGs/8sKI7i7E
         hcC+fa1r8iQySYJwyEESMiq5I7MQ26y7d22aYPREy+sD+LcWcccue7VKIkI86UiSZDac
         SIYiZLO0u2JlJft/xsLyZbIltHx8cWCHWU2L87NHPuKcWf8FtJ7TimVHkx+lYLl5WUvp
         akYf1cdbh1aVt+Nkbaxc0slcMQ3jlMRarrB+QT8ziPBU94NM+KNQGZkBa8wnwI71ehNJ
         JyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775203808; x=1775808608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yxxuGjGRSktiOSFeurkfNMNMudjTni1PnNqFP61cks=;
        b=iZin4Na31p0FC9B5lTYCX2cB/OQVYmZTghxEyeZUcgk4blOSTs/V5ikENxbmFtPfTX
         JfV+QKMWVxAzh7r95rBU7ksvsCGSkv+CIxFx10yesaoxmfOQXaNLOmUNL1j1M5PTnLtK
         k/kJy4DcEQmpscrVlgKV6oZGuqgUTP0ldi5NJyRDjRfQUj4SfxLHVRjKzMpWEE0AkUvh
         tTpYXmplXI14pxJI4wlwHSAOL/f5EuQWKnWN7DJ48C5M0MR19SPv4sIwGNQIcY9Zfudi
         LI8CH2Y8A2q27rf9JLybFo34JM+8LfkWsu0tftEaNOcbz2ob/9ZoDC/2yPtE6Ox46rl0
         E28g==
X-Forwarded-Encrypted: i=1; AJvYcCWEvJ6jk889rSlLTLXDt0OYfdgzKoPDfRYLp9Hl9fvz42HZoJbRkON+E+pJUInTjWEhIFH14n6LuVbM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+O+DQNW9jciXUjFC/CW84FQI+VPRJ2pnKTKxuL46LLcqOPAuN
	2ns6gyXbkHRSKO7GL+FRKuqfvkn7v9rt0NalN4ucjW+H6gx/yEcZ/zlEtfN6oyPDKxUE9UDF/yQ
	zLS/oKQwAyYo1XHfWKkSVa/E4dSz4lWVHlBmJYISdfNmcMlAMmXktiDEPAUA6Fwi8
X-Gm-Gg: AeBDietqXR1QhfHcJeTNezM4xOO9rTN7HqLOsqWD21b93Ee+Z1XUwD8NqGTG5h37G9c
	TFja7EiIAgXhDmZxuokYiFqjULlOjD7SLuxtcAxJaRist/NeDGGzj+lBa4+9BjBpAR2TsuqHLy2
	YyLm28PMJAib412awen4PZAwO/VtDCh9nWQO+2Vqao+wft9YM1bobQLkcxVPcLBHP1okecfVbIu
	DzqIwz8tqSJMfPuIjMBcq7sZUfJAOU8/W2nyyJZF5LB+L1VmrFjS2BD0hVo8Bhk5pXHzfpa4lfJ
	LNh4xvW5j8rqsLOnYKKxY6Khv55NcYAR4LzrtC/QxznKEXa6WW2/fYnxVunFIJbW3Yi7oM8rFKf
	H2bTe7D9kpOkTsFZ2azCJ41Y0UAyL/b150DY6XqcuP6TAyLIs
X-Received: by 2002:a05:6a00:2e85:b0:82c:6aee:b21a with SMTP id d2e1a72fcca58-82d0dba215cmr2162806b3a.45.1775203808248;
        Fri, 03 Apr 2026 01:10:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e85:b0:82c:6aee:b21a with SMTP id d2e1a72fcca58-82d0dba215cmr2162769b3a.45.1775203807745;
        Fri, 03 Apr 2026 01:10:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b23c6asm6989864b3a.10.2026.04.03.01.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 01:10:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robin Murphy <Robin.Murphy@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: qcom: Add compatible for Hawi SoC
Date: Fri,  3 Apr 2026 13:39:56 +0530
Message-ID: <20260403080956.2714415-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wA7Ul8KbPm7Ey4e2hwGJU0y4tVEQpNDK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3MSBTYWx0ZWRfX7zPcndONnb3X
 MN/FKRrg6+G4plq4Y4iQA/yNGEkgP4WSMs6YAVV0kWw503HQooxUMjv1icOxkd/CpPhZTtRmJ9I
 VhxjENyVJ4DFmYmZKghYTfNXR5epQ6lvdm8c0AcjRZbMGm8Mex0HrGHzV45KgPHPGSzBRLEHHYX
 NmEnSA1DzG3+TaaElm3rtjwonwOw4Qo91iIqGanT7sFeYFDSVprKVzskow34kX+kVo0QCScmFYX
 fPN5gQ2cmNA8tJmtnBSXyJxhOuNGFRiT7BHNiT6jNEaC6/eRyR9/jw7RSKHI9e8ginFw6LK+kVQ
 lkRb3hTQSvUYk/ObcMniNPNDW70IMJAcYkhAWnLe1auxKJ+7hB3ll2id/BaACLNmCrQ3S/dcyPT
 vbv+v7KzfXiF5z0zLvVB+8A6CxALdYMVwlEnGkp09Evtfk0t69A1lLwkZFndKj7Z+J0q3m8lp8s
 2D6ihxbrRYa9KiCmfrA==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69cf75e1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=V65sNsENKvr6zZljLJ4A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: wA7Ul8KbPm7Ey4e2hwGJU0y4tVEQpNDK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030071

Qualcomm Hawi SoC include apps smmu that implements arm,mmu-500, which
is used to translate device-visible virtual addresses to physical
addresses. Add compatible for these items.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Added qcom in the subject as Hawi is a Qualcomm SoC.


 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 27d25bc98cbe..06fb5c8e7547 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -93,6 +93,7 @@ properties:
         items:
           - enum:
               - qcom,glymur-smmu-500
+              - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
-- 
2.53.0

