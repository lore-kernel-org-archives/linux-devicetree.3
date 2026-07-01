Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62D43B440E
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 07:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889803; cv=none; b=L0pdy36oo8XOILwNczdTUpFF+qC8xVKnSePm/xo84EWVhZtOIofOKh9YYeAs5D6idm8G/yzg+ej3vXP46lvQwk40JLcbvpl50W4zZfKAv8yf16vND4YrjEAkeQKvAg8mTE+85wqZSsCEm7/1eSH7iXjGjs11LFeZU0pjewcyVrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889803; c=relaxed/simple;
	bh=5MKFt/zaYcFq7IKuke7jKlaQbD9tKD2HGDHqp3vOFnU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pxLEO2oKM7rfq1gKhn4bMbyKar9qA95jyuoeWY0Pc+Kr2wBZl3bp4IlREev4dDMWu+2APa/dU9Rwu9KKO5xCrnvsrCog13+u+pabzbnB5lT8cix9oAtR+4gmeLxBpw+QVPCLHhcpVT92i4d6WkAZFR4Z/ufHYLE2n++hPEC3CeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTck+D9h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfCui7+y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTck+D9h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfCui7+y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lXIW137160
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 07:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7NCJWTnRs/jLLCrPUstOfZ
	DTejQrI7BQ7/YfnIbBOKk=; b=ZTck+D9hKsuTr0ZCuipX7Qka9QBg2oQEtRFADS
	++i9iehiNQ05GHEQdkQXY1+KaDhLmT2wXhadk/p7LfwMP8GYOgJHjLP8L3jGEcJY
	CLXteC21YxEynWlscW4RRPoZc1nVQalSA0WZL+7zDmDef9YjH/LubTF/MFRHF+Nk
	mMdwBlPj6DhoSzR/MGQVIJkIsKiLPT6ER/rXc71jjENduk7Up7D2Kq/IK67LNC1j
	zCkUxp5fOKwkDpV8y0CjJ8VgHZCcF06+F4A1QsKu9lCcM9ZRmc5kA66JUIZMDKtp
	jofmkoSj6GQ7rlUxSC2Vl8Z/CBtGEyuVnvUVVG5zY/z/VXuA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0aubxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:09:59 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137f3465368so887535c88.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782889799; x=1783494599; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NCJWTnRs/jLLCrPUstOfZDTejQrI7BQ7/YfnIbBOKk=;
        b=gfCui7+yv4nLL2+Af8IcKVZ81nykOXya12nBkwNlKys/qXHALDeb/V4Feczc5HBowS
         hgeYW9Kih/6vapUKjoU5or7CVxIBCn18rjyIuhAzXqPvkXmaJibTgIxmufnxsrJdCUBY
         /EbTIhKdyL1pZKLEJDIgNJdri6Z/AGTsAyA+ckq43vf3+4E645SWOpEn3GBpLZ6Q1cId
         +0z+FFoHoSmayZ/QcJAV2ZBujndJYvJBm32ABRXSodm59wOyqX2iwQijwXilZyJLcTDO
         5L8i5Vy7I/qgvRt1d2BDt6ApMdAdu5KemiSIi7WK4LHO0OCLaf6bCNVqKhr/sjPHzmn9
         BPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782889799; x=1783494599;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NCJWTnRs/jLLCrPUstOfZDTejQrI7BQ7/YfnIbBOKk=;
        b=ksvmZGuneAOWvxK2ioRHL4ym/guDxVyG9yY2kTbDg+2rtcrIaTb3gKW4cJUDAfkaPb
         heHRk9zwyWbbmmpG1dL3FkozMOQuS+VkQTYASqoIeNgysW38uSRsHdU6Ewltth+Nh5bA
         GMfw5Y1s+6xUfDwr36IWtBIthpZ8huQFtt1bLFCRziEHifo9U5S4Bq/yzewWZBFBWAqt
         mfN5I7qRUwLKP6BRUN/a9tRizdGLolDKuBZyFWSayMQZ09yB87VPXiOzOXGFQHLmBcO8
         PRGUAB1F+CJiEMAzzFOe1sFxe+/KCuI8Ig0drIN1EuBOUYEgWCP36teipcpn2m6b6OTB
         6rRw==
X-Forwarded-Encrypted: i=1; AFNElJ/gGAgAUY/hXyfM0KHIWCZi0wZzqtf9C/NqS+t6/tCcDUjzlsr9RdgiTZFGrgPMpgL7JZ7fcEDc3W+c@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4qGfiNWfOVuFjEzTrdXAt1C9EaoPBP1TJb64p3bzhrDkYr4Dm
	mM6Nral5khRvTjC/LjvrqeNQ1xajGsk8YGV3Txsj+4t8t8J9zwNvxejfsHTNzkeQgKyPIzN/+xU
	UTdr+NTBNK0/V3tmnkzUI18zIgeE2J7ncp3204veFXS2+NudWpo5MtEd5NPHhmPmhSJpwqBt6
X-Gm-Gg: AfdE7cn8XAmUlJ/AUv1YoCZUZvC6FdCbxWItIvdVkMA/hkY4VjvNnggCmkjsPcymZik
	rwpY+0qJkgw0XEtoqdUqJ+VY7OYw4NQOwr+ndeKWv/nei+d5MCjYMGZV13Lz11HqH5JLnMWHZ/k
	5Ik3bGkLSVOaBoD/vsg/1RNEZRqCetOcLhEgARAYAfz1VYND4xll7978joOM5RGctXwRdKZmO/e
	DaPBm+1y2hL8f4zlVtXHrAbuvOcGC969zUlo5UFCyWJ5crvpaCvY2uL/AdIEFjLbVE4zkFdSApv
	BNJr+Z56tFO/c4vyAnnaPtkqYs+hlaDIZinwI1zWrLWjDTOjczZzMM6hL5uOZIRkJzp262/FBqW
	5bHM45ChhbK8YVXaWXfPosKuJF9al2QDe1G7SIMhkwNAJfa3l756itKEw95GJ6SBo5PQmzuCatD
	/xDPN2ioI+Ohb/vqlme/r6DoxKHajHLOQJ7jca4A1E
X-Received: by 2002:a05:7023:b83:b0:139:ed5a:eeec with SMTP id a92af1059eb24-13b36e0d71dmr564871c88.43.1782889798371;
        Wed, 01 Jul 2026 00:09:58 -0700 (PDT)
X-Received: by 2002:a05:7023:b83:b0:139:ed5a:eeec with SMTP id a92af1059eb24-13b36e0d71dmr564829c88.43.1782889797880;
        Wed, 01 Jul 2026 00:09:57 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab2dc1fsm14426709c88.6.2026.07.01.00.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:09:57 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add APSS clock driver support for IPQ5210
Date: Wed, 01 Jul 2026 12:39:40 +0530
Message-Id: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADS9RGoC/0WO3QqDMAxGX0VyvYqtTtSrvcfwoqtxlqnVpopDf
 PfVH9hN4CT5TrICodVIUAQrWJw1adN7ELcAVCP7NzJdeQYRiTRKxZ3JgYip9sOwinOVRFglaQZ
 +fbBY6+VQPcuTLY6TN7qzCS9JyJTpOu2KoMfFscsawx5oNDljv8crMz8S1zz/X505i1imclEj5
 5nC5GGIwnGS7S4OfYFy27YfWCpgstgAAAA=
X-Change-ID: 20260625-apss-clk-ed39c40ed468
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44bd47 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nZJT0DbqkGW8ujxwV40A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: KYNampIcv6JNeR3Zeu99-o0fyQclVR4l
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfXyvDc4FRHAaJ6
 C2TPTNiqvoGrylcsK8GazIsbB567BDCUAKQFQvfDh+VwuX5gZDruOWx/s0hEWNdiwvuvyBd3HKW
 PcU/CJbL/qQCaDwK2PK2J9mRINFEJrI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3MiBTYWx0ZWRfX9Przxgficzz0
 4LRdb4GSKrzBvuqtM7tiFa1+n5mcmqfx7pQhiiW4gCxs1aInnriUzU69fH+0HM6czioOD/01ozE
 5mncHn2hk3ZOXGY5kCY7St6nGvLexbgIZX4/kDbECIT6yFk1gp7ce3Ed0KRlATahg8Z8/xWvWJb
 0qJdd2IZ2B0qZKQ7QcEMdqdY6xuhNeZsTtxdWHWwViVKuXiZ4ifJ0Io+jCz6g5It+x34JiCKY1q
 QzyfeMeMCebocqVtXPhMs2KO1RyWq7EN+8JkU9H5kUlAcfg+1+pAX5pSBZWn/lmKKxiUk2/di6j
 KyrYR/iKgNIFMuOYgfzF2DRJ6N7dUM+qGHrggO5CLXo8bhS9/ubBo/u51WDHt2qeVzsnhnPPxjN
 mVQPzTSdnnynB+49ic/s4KSEuJ9avZnIKgYG96jALAtIHjdwyN9ui+kTypZ/dEuQf6kPfW/tmg5
 OZJ1TXSizj4MBm6/5lw==
X-Proofpoint-GUID: KYNampIcv6JNeR3Zeu99-o0fyQclVR4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010072

IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
for the APSS clock to change the CPU frequency to one of the supported
frequencies.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- Remove incorrect tsens dependency
- Pick R-b tag for driver change
- Link to v1: https://lore.kernel.org/r/20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com

---
Varadarajan Narayanan (2):
      dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
      clk: qcom: apss-ipq-pll: Add IPQ5210 support

 .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
 drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-apss-clk-ed39c40ed468

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

