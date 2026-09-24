Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AA1426694
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235194; cv=none; b=cT1pDskHjfwzqA3152zEffi18w42xHqMADiA4J1zcEwaRCbzs87aKS0sO5tmWXJ7hhFMH5d2hM8FaF2lOdDJIiuRAiLXSqQDfBYd7cNwhpv0dmT+181Sl85sN4/Rp5mqgWQ1kAdTgA6bDq3y2vLEeJkQW+jVQPCfmZkkeg/ZOnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235194; c=relaxed/simple;
	bh=4HUozPl6P8WQA6fqZG5KiRI0jrfGMQDXBfRnaSUaukQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=azmfuofK8T14lSuT+GgYH7il465/ALGMFKOnx99uFvi4752YtDCL+0clfaupw5yCYUiqK30IcKzeS4XFJ/ntPg3hZJ0MT33cOfscN6ecLiSxAPMnwVo6OVCJdQYgHgwG/cOsApGFiyrZ9trNcWmrHvDDzvwz5sNoivMPqUyY5QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cg9m3Cgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZK4j4+IX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cg9m3Cgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZK4j4+IX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eHFC1147884
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2WA7LsDGNuQYaD6cNjqTA1FGgaI7kzn1QW6
	oz4DCzYk=; b=cg9m3Cgyp5c7m5GsozMjxVeHReoL5dYl+zXpL+SoXAqn38fDCPh
	SKro/kMouiBTvCACnWJmSH7VHIxuwn30EKJrvRmrJtH/qVnAgxJ23LAXcax+ltM9
	kfYVoNNraZqaV5WDRv/LAKAwhY07DHqH9Cz1BRUCe8ukNh6eCz9rEF/Oysjyvvkd
	VtxBOaYmtGvfLNAue4MNeu7mOqAKv3FzdNYrQUuqNXAXATvOQ9lp64ES/kX1e2cc
	6hE+poVXlcgTDX5d4LspuU5M2TbGsZjukF5JKBEbRnGTaBFfe3njrSYKA5KZObb4
	pz7tLVz6+TIEZSSghmaGHn22p5lgnIjMJNA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrraapc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:33:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-334f782d1abso1298057eec.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 00:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235190; x=1790839990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2WA7LsDGNuQYaD6cNjqTA1FGgaI7kzn1QW6oz4DCzYk=;
        b=ZK4j4+IXs6RCLfEsUU0SxLdFaNGYcfkFZxhmSRKb3hhPnZUn9iQiRl/Yl0frUJAus+
         ZSBv9OP1GdykHiPUIiHXBu+h2vrNS7jHYBwWvw/UCYvAvRXlobNStxN3L3+GwGWEn088
         9sf5WzcyNosM2Itbp/62GSYIUhaJh40ULXgSHgq+Z0xRFhZtq1FtsqRmKbioGAwwWLNd
         JutIvbzp0iOJnSKPyjB5sB5i/Zxa/iVR8O5np/7POrG6XY5k766DSattNYLloxmky7FC
         Z9FY7zwNeQty6ZFuthDC2wxxYtMw6XThX0rUkPMdtogB5RzcfV/5ld12kdUBtkXJ9UcS
         DZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235190; x=1790839990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WA7LsDGNuQYaD6cNjqTA1FGgaI7kzn1QW6oz4DCzYk=;
        b=MuVAEKzJAFz6fQLhIBHld7jvEnnvhv5GrEOVEeCH75UflQeUQBQPMVe6yQRsuuPZvX
         QIN9KbIwUkgAOjxURQsTlFTtF9zs2f/F55M/Uf4ZelIBehIuqNBTriJZwStqukiizUHb
         1A906iuA0FGQK3XMYecYOoIMffYLEvWVRq4E/r+vEf7meX2vBfUbja5JEmy9T497YooR
         SOFu4brW0kIi+NjVmpI1bJRw6Oo+uPUUU+PayhK55+xaF8A6LekyoaOzGGTTlT6I0uA6
         QTeGGdzuAKzxDq6Uxc2NsfUkBxm9YQat90aKj0Smum4Ff/fiqIqPvyasQA9vmi4Y77gx
         9ShA==
X-Forwarded-Encrypted: i=1; AKwUvBww5GeLhJLe6V1qdGi8Flg2gcZN2AZdk0Vn+AUtLuxDC1cHH/dat0YGNy+jGXOPqwsx2kJpXQOjJ1X8@vger.kernel.org
X-Gm-Message-State: AFuF++mgokSDMAcvvKwqQSQhYWKOpj4DaChv2I7Ku7UL7glXVhi85U0J
	VJ23KYBxPRiiv9tspu7a8qCEvl7vZABwmGWur+wGQ3G7TEDpMCjxkRByTXItO2S5tBwGtEk6lvE
	JWxSqXMPxZI25u2Evu7xrYA85YcHjTBqy5d/T4ruVnkU1MkGOqNl3URdOXdOO0cxr
X-Gm-Gg: AYBFou1qEsHF4EhfbXQX6Vk/XP41fwOAFPExYJOAJehEW4DSoducfyIZkD4o6j6pTxY
	BtC2bAabygvfn1YzmDWehyZAHU/wwg3D5j1ykIQPuS5bMmqXJ4ukVDNYZ1PPKppKPqxLujJvVlY
	8rsQhB0YukofAlVZ/TPiYdXFChRVQo/9Z353Gna/8G/zHMKF88TnsqFRP8EpiDY+SevjDnZr/IP
	dE6p/4rTjZZRci7bnobTJ7P5BB0lImlFQD4UONWUa+ioLRRow8Pluw+6Mmb2FiV+voSS0rqL/bi
	xLmSWPjnATak8Awfqu0edZ8vHNOdkn8lD9ZgD/QGqAIMUXllSYPSF3vBB0KKfurc2AUs29ewv4o
	+EzwRx9ldcaRkmH6yJHYmZTsTenN1dpM+u2D7Mnq0c9BAqiJ3fBt0QXgetXA=
X-Received: by 2002:a05:693c:880c:10b0:33b:fc17:e781 with SMTP id 5a478bee46e88-3400697415bmr1260053eec.27.1790235189777;
        Thu, 24 Sep 2026 00:33:09 -0700 (PDT)
X-Received: by 2002:a05:693c:880c:10b0:33b:fc17:e781 with SMTP id 5a478bee46e88-3400697415bmr1260028eec.27.1790235189198;
        Thu, 24 Sep 2026 00:33:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm11052635eec.2.2026.09.24.00.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:33:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Pushpendra Singh <pussin@qti.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add BWMON support for Nord SoC
Date: Thu, 24 Sep 2026 15:32:20 +0800
Message-ID: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfXxCfj7cnCabVm
 zFVEw90CsYC3i6Kzau2lBrpzK11T/JcvkPOnIOwPJ9ZxjPzQ9tfo7SyIBVirIRAvZEwLAFxYkFP
 IhrTidxEVpVeBR3zGzSSCAFJ7cCfv+dFza2jKI5xOXihcM2Dm9KL1plYx9PXyksJQwhz88Bdlln
 1Oh7Y/c/2HeXpnUE8mAy7LXWfiSYe5di2GKWaPfC2UPqd3zbVzaHvrsq6EF/2c1Hr9k3CGl45aU
 DWciszQRP83nU2WfTl7sAW4RHDr+kV5H4Wqx/YvUgeWnPg9NAKuU0X9phUAoXz8ux7E6k12Bg0r
 EhLH+jgm+pylKsz04OXAmwmsrhgO3x+RQsvwMVHAf0JD43HobzbMl7LcYph28Zocs3cz/q4mBm7
 sd3QSM7Fb7ub1W9PSgzUBd2J9Vml6s1tkauaHaowfjRChpSFh9JdTBDYTt8/m7uc1O2foTEFhr2
 quYyvFvNRG/MP6jzpoQ==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4d237 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PYu-U4Ynb8dZ3rZs9soA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX5nXRaJEVX3SF
 lDThQa35vksxJqZ88P6+cNcfChm/bbdJt8UB8HoOLxEqggx60ruhYRYy4Vt6Fd3Pahmwz/DN1SX
 1UjGGeUWyDTM+68ZZZpIqgKf/3TjZ/c=
X-Proofpoint-GUID: u0X7yRH7ZuFmAvFoIy3cu9X2zLQfeccC
X-Proofpoint-ORIG-GUID: u0X7yRH7ZuFmAvFoIy3cu9X2zLQfeccC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240031

The series adds BWMON support for Nord SoC by documenting the compatible
and adding DTS nodes.

Georgi's Acked-by on the binding suggests that we can apply it via
soc tree.

Changes for v2:
- Fix "reg" length to be 0x500 for all three bwmon nodes (Thanks Konrad!)
- Combine bindging and DTS as one series
- Link to v1:
  https://lore.kernel.org/all/20260831090134.585588-1-zhangfei.gao@oss.qualcomm.com/
  https://lore.kernel.org/all/20260922080416.484280-1-shengchao.guo@oss.qualcomm.com/

Pushpendra Singh (1):
  arm64: dts: qcom: nord: Add bwmon node for Nord

Zhangfei Gao (1):
  dt-bindings: interconnect: qcom-bwmon: add nord cpu-bwmon compatible

 .../interconnect/qcom,msm8998-bwmon.yaml      |  1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 21 ++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 67 +++++++++++++++++++
 3 files changed, 89 insertions(+)

-- 
2.43.0

