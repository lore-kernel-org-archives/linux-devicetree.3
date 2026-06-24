Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48882C21C4
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294601; cv=none; b=VDSmcAh/U1ox8Za82XOD4v1QVYNs1QKBjkmKx4sJmyjs/d6yUacnu/uM+Ezv6t90plUMIbgwHp6zujNYsR1QlELW66E8mQPTe0yI/yRkrMQNJkaqL4dTom9xS6k/7xbxcxRTwT/PBK83Vj9kE6vms/4aP0GO0HXgX0tC4TaQVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294601; c=relaxed/simple;
	bh=NOeWjRx/+N6Tt+3yCcJaVQnYDy9sxYSfEhEFJNU0Krk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OqTXbPy1kmGcyXproUINH9Jr9qIbpjj4yhgOiWEms14W+IfB7y5PfZH8kDTUvD5vuJ38sZ3WS3Gz/FNjTKMptPgy8oeBeF5pCoSnXD6YYBm2nx5dTNbaTZ6b0eaPvU2qlvacRknaqoxF2VQOBpheUjs6OD5kEasGiD7jML/DmEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjFpc78b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhAb7NKz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjFpc78b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RhAb7NKz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u68L2439047
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 09:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1JsjvqyGuqGJ2AUuXYyxfGScXM8BYsrNI9EyivldDU=; b=SjFpc78bDHurmRP5
	jZ/vVuS/1MXvmhvtNjie+4rISTrAhhpO/Agdvagxpm9UKqfxv3wRRVEOF3vrgbVR
	X+IKrca26ixW2Don9WAia1+dKnmrqjkZ44spXq1wS62peJxMX2P8/naIkLvZWuhA
	5WVhoubztpGiy3Ht19xSi9cWeBvSY/o3SjDkQygdFLFBW76X8maVSKk8PxeVu3KX
	Fwtopjq0GH/ZT7TUkgbCP7i9DjruCPtFpEWUAfK4sx/RRUeTzUZ+LpetMhgiCP6h
	OrtE6BbzZ9hK3cjKHduicu5ROhFaF6irN1ulSu7vEfR2v587uzH7KKKOvrnfu0qM
	MocF1Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar1kj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 09:49:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8454912a507so1618430b3a.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782294597; x=1782899397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1JsjvqyGuqGJ2AUuXYyxfGScXM8BYsrNI9EyivldDU=;
        b=RhAb7NKzlbUl4O5uKV0Nqpi/ZAlg6FtpIR0r3DBWNZWt50fof7MAqXBCzOYMTXvLZb
         cL5gS8WuKLcdwf4zXRMw8xQ3yHbk+xqA4fxg2edx88q1QDpIxkPOVFnsSmnbQqfcDWWZ
         fQNpkYPe1v2saDdw0Al2sB+qKTiFEXoDFyodwQQt/bM6r0KtnAj4a8ZemNSEDDnIhOa7
         hUih5XVBnz/fd76FuY0qCfCzLTim7QH7g0ptmRRHUIImsE/4POA40OuF1ORDc6ze2BEM
         y6J6iQJTXWxCb+Q5WAAF1UwRO0cNrWT4twizxvtJ6d6tBJ3zfqPjHwdf6lb+mDJXHYO4
         k/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294597; x=1782899397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J1JsjvqyGuqGJ2AUuXYyxfGScXM8BYsrNI9EyivldDU=;
        b=b7b2UNYmESkaEW2pLakwWqFAN0DOzadisN+y5pF9wCJ9j3xubNpZHpdV2nDcNlyTWN
         kVVG3DCdp8YBhtsvZ6x/EAIqwsfs5kfXMHFe9828uCjNoGKRxUtwV/xHWdlMBxof694q
         /OLvwRsrggkFpwEfJzJ9hf9YjRUJwhDV7DblxZor5UA/hHqjSdV1lIGD8Hq4AMMg+ZyK
         j8qVatvTGoF+0JBLtQx5ZaiOh4if8pXzYWl2rb0dOsYglyiCK/R9xuN6IH63jRlkpfd1
         C06malwYI+e/PlHFJBvZyX65X6RvGFql7u40X0aPAYzRFHvVOjYDHBKu8JBzzmfvnLb5
         dA5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+TjMXBzmTBmFOrbOIgHL48pkdoOQA3K2am1IkZjJsfhgUWiJmaSzsMH0tBcja4z2P3D1emBeGWLMfU@vger.kernel.org
X-Gm-Message-State: AOJu0YyjpifiivwSQfneDyOf32dOoneIMObLwx2YBMYGIOsYD8y1n8e/
	hrZCdo4Yk62kGIVwj2RjnjAeYh5wcsGUUVneIgM8NqbR1k41d4xZeZ3h2bbKgrynAHL8TtkPzKI
	TF8pCKNIlsk5XTvZy6KdptUXTxYYxNpmOggYeMWg9QVdX93B71UpEIiRcbITjf/Fj
X-Gm-Gg: AfdE7cmSdbmuuE6MdCKpsh/It7StX3mR/Tu3fmGcS06lMVxg59D2e+jWvpnS3/Mb4Ig
	8c3If1TjjnYc9R1djyFjBzCOGGQ8OyTSjvcjeVy/TpWGBsPoQEvQ1ZsrOtO1YQvoOvwcdDIe4H5
	9HTUGbX/WA7LxoEKMOzH2eoqbGEmW+Vm13a23m4sM/0CEBiXyVjmZf4/SPRCVjyBQEzbbqSVxEZ
	uNg4+0DGOs5QAEocjwNAijnXVKW1gXo9j1vzqIGOGvTbYfRUNE0Gd7x5ok6kJ3G6AzCHT9gEBly
	rLTdMMmYTnjmJRYKqxwBUwTbjQbPTFUVUOhH0gnnR7FCV75U7ZhHDJIdvo/22Sp26q78hfSwFnM
	G0tvS69Pa/aw1I/UYGkRk1LRBQ2L6GJ9VBGKMys8WZnp4YmYLMkDRhUS4fEKTzGJB98aepGzW/Q
	==
X-Received: by 2002:a05:6a00:2a09:b0:845:34ea:75ac with SMTP id d2e1a72fcca58-845a27beb31mr3220464b3a.0.1782294596796;
        Wed, 24 Jun 2026 02:49:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a09:b0:845:34ea:75ac with SMTP id d2e1a72fcca58-845a27beb31mr3220436b3a.0.1782294596412;
        Wed, 24 Jun 2026 02:49:56 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb7b3sm2161302b3a.13.2026.06.24.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 02:49:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 17:49:26 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782294579; l=1011;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=NOeWjRx/+N6Tt+3yCcJaVQnYDy9sxYSfEhEFJNU0Krk=;
 b=Wi05gzbNeph1isJpH4EZJiEZGHTd+QoP61914r7LB4+nEaCkaU8hXCuaYbH2LnMooI7P3pklW
 dkn3b8QAuzOAH6AUaGfRLWFuoA2V8qTSVPOqJCCYjdAK7XxTIrHdiY7
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 1MeQYlMNrc6yaHxaxqkNONWMxvZPoV6z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfXwDuwJz2RHQUn
 42nIr3BvRa6hSViLjMWlgR1tE3QUr2Csttg8FWr8VW8B6ej7F9Oll2Ysi05B3AfpWIFW0NFcTaB
 sMt+9BvXb7ZlM1rNkdnGMp1dtro6oZ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MSBTYWx0ZWRfX6DP5ftqtxXr/
 Gcq8o6MoaO6IVP6SIv6tLYNI8TMyRaKUvS8yEcZ35tojVduQxqTqPqituglRl21iRUuObTYKl0z
 DEhy1n4AXJ1PUtLlaMaBMtqO3sr9bNqrmkhYLoShq7QOsTmP0VnYG5GnWLdu53ygFnFSkeDOv/L
 FR/Rj2c45kFdTV3NWx8rp486bunLPS6ncs1/XXdG+ozf8FG+cLzcsIhoTAe1ePoFF+UNFkiAExr
 0XZDK0ShzCnpiQfeRiNn0Ncu+UtmHF9qFg2iqUZtNxN+nn92ViaWbHKogmENFUI+Eq3F+l8jTVE
 R/Cfy5QaCaZ5M2slKac8vCL9aGDAtw/UtSQTxTNrMJ7Cur/1UpzS1WH5fkdgCjKvhcYYmFawwgq
 p85cku3PKgDgaYyzI2OPxgTmR4JtHg==
X-Proofpoint-GUID: 1MeQYlMNrc6yaHxaxqkNONWMxvZPoV6z
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3ba845 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GaqzazX96i3VkeCjfTUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240081

The AMBA bus attempts to read the CID/PID of a device before invoking
its probe function if the arm,primecell-periphid property is absent.
This causes a deferred probe issue for the TraceNoC device, as the
CID/PID cannot be read from the periphid register.
Add the arm,primecell-periphid property to bypass the AMBA bus
check and resolve the probe issue.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..25820f7c04cd 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5009,6 +5009,7 @@ tn@111b8000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			arm,primecell-periphid = <0x000f0c00>;
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1

