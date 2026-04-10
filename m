Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E13E63BA
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846606; cv=none; b=nnyYFxxTXED6Ngy5A7AkOzq0JHf63s/BeiUd6rAF6qxj/QjrczOyRLFZA4r1SGVjBMzGEwRTc5vw03jHpD4DMhB7wAHslI7KCQ7nX9P3WYXxbH72/7w/cTqYqxGGLmmd6D5UuQz5IpARI+15A0+G5Feo/MagjPiQW6Qw10TXbXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846606; c=relaxed/simple;
	bh=0ve8pNCffz3N2uHWC8FpfGsaIcwRLFaPgdOQDXHKnkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxD7AJvbvYVlIYcJvPJbqDkYcje4DuXYn2sWjnnLiEbzjyPRAfedWzOb6aNaELzVtUSmq2GPLVV4xDFkl7Fj7PLGk2en1Ebp0Fio+bBl8YUmRLNb7j44L/JaDw3O5/wd069WYQrrlZYt3ok4qKEa3gh4HK06s2miu16ihWxum9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtqDgDa5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcxxiaR1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtqDgDa5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcxxiaR1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIAWZ9438883
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=14y7ejpNC12
	1h8701Hw9zRhaqlQdrJV5PjTH/tdTxx8=; b=gtqDgDa5ebktG8K4dSbXMV3Z8Wi
	QxSwWxH76vK/qs9ro6Sq+VbxqLSYsi5DBR3tZlwF83nT9I98PluPe/xn5b3jFATp
	s2vkATWxFIZd+eFSRekYB+6NMwnxuNApAlC0/LnQIso3pl79wUK8uTR9SbieDIxZ
	tcKfUEvmHsbS14t0rjEy84SnoBuceig0xqPPc2drO2dbe4uucgBgYMjPJSLRdGjO
	PF8GbXZtjph1sEVYQG463uNkKGXiw0THIDEmXJLJMSL4DQgw+psLbrWdWlEzirio
	BffnnnDGC2Q3+LoKAF6wBTrd14penObVpQveFBzov1kpDTEfzD7ZhAQMWRw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9sefn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c4664f75fso1733417b3a.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846603; x=1776451403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14y7ejpNC121h8701Hw9zRhaqlQdrJV5PjTH/tdTxx8=;
        b=hcxxiaR1KLg27uvAKjhXnaxRLl4zFua9Ui3smiFprxrJVW2mX9ppRHAFBw1MmAn/6Z
         fwxYpVsPVbbpCnBw7pWS7muZzgN7D3kMwJ7VvApQ9eoLIat5g0J3K9jKxCGvv6uNzujW
         vfSZyBcFNS5YNdUA/2GMBRTEkHMpowq1uqi1BK2ICJLEZpvw+uB/uzs4vmlsMZflccxo
         rm+reOdcTfYS6wwE6iT9fYi1Upthb5B+002uM6MY9jtw5hZwx87+h7Vs1k3vrLCeEmMW
         aczdGm5B1WSvn6nET/TEDTkkq737dbLOVzp8EvO36yXwxRCI1Sq3fMK5mYyJJ2UiK3pL
         7CFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846603; x=1776451403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=14y7ejpNC121h8701Hw9zRhaqlQdrJV5PjTH/tdTxx8=;
        b=gEN2ZOesP14jHvtpMVJmJ7qtlaE15nItybZ3nfINw63NNf/hygMHNzvzNdO6TMLL6C
         V3IZXh0WALIVRxZjQWM4v0Mpwsk+oihWipQ1jA12Jx21Hfxr50tO1Di0sVyPVDn+HMH5
         BUq5xKlMIANgbrHI55U279IRg4642VwyzN93ZnCeeNUInVFw9hY2PATrDBKFNu1RQzxG
         qvRAwQFmgmUnCRLIMhe3YNkI+x31Ljt5vUUuv995lJI5BGmy8tb9cx/6/SngyhFqrrAA
         4QRBku/lgOQpG93HuJ4TPKr/3x1LMNr7qDdJsETeZFPQOm/r67bon7ZAsgXi+tmS83g9
         cixg==
X-Forwarded-Encrypted: i=1; AJvYcCVUurUz7lp7W1dbp/jmc5ky27M3L3ytYjtL9hTrkooOof5uTwSN9Ug7O+iBxmJbeqruoCUsIdhl1naS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt9gOuyDSJEwZdwcsKnKg/72B7VfX4VN/mDY53hhTNim9OIJ17
	k50hqi3Z9vgUljlMRIhMvgk157Vs+mOHD0NIbDhLiIohP2UZfHEgxO8jCxR27QGphAEFO1uqiie
	t89z4eIz6tQlPYpupkzx7MIRJuU0/R6G0mmFUofAhw+7xSFhAKS76c4wtOORXYK8j
X-Gm-Gg: AeBDievlmpyyNLSLvCQrt1/xy2KiRTGOQ3Jg4UcbkcVzKBPBrlK8IK1C9cBiiBJxPU3
	NMo9eZu/tjkG/Vjoyh3BeqzlYVsO/pJCl0u7xjBfCdKqXsZsPpbH15xlIBsa+ZkpydiHdjp5bV3
	viq42lSa0UY+AuM9rWSj1618adhj3LqkuUoj3/0EiiWfL0Zklu36TMETn+UrJR5L/SlIFgj7LD7
	JwlI6jHHNGbtNN9YWriK8ffwncNyBLqjokL14uKmMwGkxJc4GICu1Uz9ogiJczMV97Udwc/U3nb
	hSwX2MnRdMizP/locB7QlllYh5NqWWy1pwu0QwnLqfc49+AL9moYB0VGgOZDeCwXZ4d2A2mIbuS
	DTCG8ann7MwwAw2hnumcWmtrYy1e/EdRMVARB453PVqB+7rcI
X-Received: by 2002:a05:6a00:a90e:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-82f0c21f5b1mr4672656b3a.32.1775846602612;
        Fri, 10 Apr 2026 11:43:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:a90e:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-82f0c21f5b1mr4672629b3a.32.1775846602049;
        Fri, 10 Apr 2026 11:43:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 20/35] arm64: dts: qcom: x1e80100: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:57 +0530
Message-ID: <20260410184124.1068210-21-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX3fqbxixhDdHG
 vZE8+XVD2+iIjgOd+i+SjowKaPh1OTj6OkPYMqgKQqLg7srYJuqycTq62J8ow5MOvd87QxNyrRm
 LMI3mdzvPqlHkLJbyWuZO+WQ0MwWlGcm+2gUdsdelcM0U/Xp1LjpgJxCZ/+l2lRFjaLtS++ZTd0
 PbKo0zxeLw01rl94+kiXQS43+DhkzE8+HbAJR38n2BDxwp/XzgwIpnB5sLXeuIVjfalCLw4x5EP
 THsmxipA+c5F14tiZtknuDzRBYTPaT/AH5my4V8ahVSAf036pNdzhKLpzJyMFZr1APt6gW8qd96
 6gKDgFUX+w6u4tc6hrEW4oS+CfzAEHXjpzdwPzL2Yd2dNx/iLvYyGruGdWxq2UEVg4xeip00ptd
 yM6Q6bAYzrlWp/gvy5q0yGUl6QLK/wDWfKui48CB/bq6yomnE2rhDbX16P5wdM/InRmC8vCpRPD
 +eXIAnsk0jjKcQRLi6A==
X-Proofpoint-GUID: hlpyveSPE2auJF7wHaEI-uNlL2a2SEUG
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d944cb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=5GN5YITqWjchQBVL-iUA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: hlpyveSPE2auJF7wHaEI-uNlL2a2SEUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4b0784af4bd3..d8b171fb0fbc 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6014,7 +6014,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,x1e80100-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 
 			qcom,pdc-ranges = <0 480 42>, <42 251 5>,
 					  <47 522 52>, <99 609 32>,
-- 
2.53.0

