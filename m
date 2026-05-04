Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EAC31E84E
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882370; cv=none; b=Qj0FmW2RzcVfo/NU8YO/OLX4SnUtZQg9ScvDAY+9cvbDIMftJvEwSU2ZrZE3qpq2tkzv3/445a78f5wTNaqPg4JL2G/8MhNuwAPzFCeTA5NPE0AMSNAsjxfFubb4CvrOfC0hklRnr+/9GQbtOz/ijLOablBeDwq1msdWCS9KXQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882370; c=relaxed/simple;
	bh=A5+FYYphLU3xHwcoQzFjmd7AyAyvzhTYoD8is267iTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cBFPhIfoGxyTikm6arNUncbAe8312bDuhK9j7HNHF0TwK6khtajKPrNMbqCpu8M8c8fZnpFIAhMLy+FFisfq1iT+ncSyWM8CdEwbb9tnffoi76RG+YLlZgZAgNn4IAH8RPvfG3y3uCFeT+cIJKRfnMLgfghCUZYOtWZu+VpuUrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHh/7H15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hX2otSeR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHh/7H15";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hX2otSeR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DtFr119551
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 08:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9IDQeLjerqRCd1Zv3/i+0JBwPw+fQuDZpL3
	Iq/FTkHI=; b=YHh/7H15uj7hXTmDl1nEZp1NGzc39MfwaIOq8bzWDWUnYArruUD
	p/+zR7ZdKx6io8E22UzIgMSZZ1ugRMvcnoiPCrXpat05YGaGKpRRfZNe0b+L6np0
	KtgTxsfJW5vpOEArUJqJQsd4I25FCUeqYWGG5wJGCpGG7FoWz6I7LkDP7NM17Tfk
	IZ1GVwRmVYxH2EDqhCVVQtMge4ACL2vRW9PzQHDDQZ7s1F7dfN7P55NdA8s5c0zR
	dBtqfXcKo2/w5HLQUahFl5PuaYdW8oGLWerAgm0HO8xkeoElKAPhisxnpf51lJbr
	C0ytOPOXPuZlYCjRn8VgtHotmlTAtItdVbA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaejmt0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 08:12:47 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c726f4055so6371210c88.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882367; x=1778487167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9IDQeLjerqRCd1Zv3/i+0JBwPw+fQuDZpL3Iq/FTkHI=;
        b=hX2otSeRg20z/bfC2QUkVvykY1k2DpqYYsiDld2mSVag6qbpHkDHf2gKLLqYoOX4tw
         BVnc6jzuUPLHSA5B/lmw33KAQKdftc11qdXyNUjRbeJ1xd71Dx+zaP5QGcUd0HQ4kqNz
         odFNhwzw3OPQl01T7pUtGtVjFmmrXs48LTnu1FRnx6Qm7PU0O0zrHfXz/FHuYPSlPgsD
         xb5hNf5LAbEnUVJ6MAdduqSlnZ2P33UCFDhmHVZG5oHX1TROx7gUCeRv2iGnzjlyuEMt
         uYTuz3ClZIbWtc1DHlya6bL3hnz4pPQUXJ8sZDi7bubWXb8ixZH+hL67kdSJ6DQ0fRk/
         3a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882367; x=1778487167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IDQeLjerqRCd1Zv3/i+0JBwPw+fQuDZpL3Iq/FTkHI=;
        b=VQ1P40I9y2xW6oBxDhe4buqkhdbr3FDhHX2u2RSs0A4zaiSGU8+Ko053dgMX2bdzo6
         ANMsmpVlcsv9C9aTqnxmeppPhPUtAq76ItbDGFVjQi9vmLAjhIz7EKdknn0QuPJp6JaU
         Tto0SQy4K+hh0Wq/gp71Bbp7f/mYW6T2bMW9ChzhQcy9gW9ZxvSg2xCG3miFEm6ZWLL9
         6sb6CJ4zW91c1WyTCyxFQuJYhPm+Syyj1p31sU05STmds1YXnq2ZeB9KiGwq5J25DHHo
         oCvdC+zCzVF1NlBsiA6mgSchpJ9XzlKbxEUsmRfzYA95sCAdpsoZSBwu3mKxfqfQ8nus
         +fBA==
X-Forwarded-Encrypted: i=1; AFNElJ9NPOeXdewbOdyxgfrCuRnU1mzHlgME2QQEHS5qaxcLNBnKm+QzLFhyh08JdqkLdrZFbvW5Ghw/HZki@vger.kernel.org
X-Gm-Message-State: AOJu0YzKq0Bn/i1jzBKE9ljvWpcStKtXV/AUS++SVVc+3wuCZ8pvI+mE
	LPxnBlbIOpvhMe24Sa6APHUuN10ZZBxf+t0d63trP1Xku2IzHopkgYyzB0onJGqyFJZGfXzlhbR
	ZHH64RLiNWvbZzbe75ZWxMxrczIDJ0+ILeP6NLsoizfCZdgsslh7Dvbu5HSEN1HD1
X-Gm-Gg: AeBDiev0CQ5TVijCLz+n+ZlHVGlGId1hy18go6A+K41ba5J8+Ts00a/Rq9FWPi8rL4E
	rg95DUw16wgT90w5FD5Ghn0llr/qjiC8G3/WWaUbO4K0WJZa1xtjdEr7fa+fcMSqnxG2q1z6iK5
	W0kROa9r2v1qB1vVEEoECKgL7XFC2H2kOIRIpJBJXGYHEVofzYfU6ZsgsJILUxkCvqF3DAttF1O
	LpOF+6Eyr9aa8f2FFGeyh/HBnZJTEeyQoMMuwmg5bXAVtGiyAaaiNQNin38nqfG1udzytHR7jqI
	kKvN0FUVMgGAgJLRYPkqTf+vf7wiiO27AQjX2tPodYkucIRaJdv3BCgb15tfhYVkXcPGEzqCzpS
	3pTeE15sIOnd/NsAxC6OkTJFzpEaGshY8GUMfF1TQdsPohqH82gRIFBYGM2RTBe0rZTaoekm+u0
	66DiktydHy2gy0TjTn
X-Received: by 2002:a05:7022:e25:b0:12b:f881:d8f6 with SMTP id a92af1059eb24-12dfd855517mr3839426c88.29.1777882367062;
        Mon, 04 May 2026 01:12:47 -0700 (PDT)
X-Received: by 2002:a05:7022:e25:b0:12b:f881:d8f6 with SMTP id a92af1059eb24-12dfd855517mr3839417c88.29.1777882366362;
        Mon, 04 May 2026 01:12:46 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8287711sm13321511c88.4.2026.05.04.01.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:12:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: thermal: qcom-tsens: Document Nord Temperature Sensor
Date: Mon,  4 May 2026 16:12:36 +0800
Message-ID: <20260504081236.825755-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4OCBTYWx0ZWRfX+UGMdaJ5uw9D
 ebpaMwauyHnLNSHyRdSJyt2FPtKSZUsHvilWqnbPX5pzhztiBCtb2FyA6Zj8xAQyMkobTMcajKp
 2M8h+LnXtRm3XdxjD/v/bT+Jlso1MPZ73wfOdj0Cn8vKIb4QTrD9+7kH+MF1qXjctlm06H4AxZY
 zI1rHfdZZNwhKfX24o89tl6vIKE5mLSigXeOb62Vpwy12zctbCIKt6U7Zu2aYvuinmgvFuyrSol
 DpfIvzJvIO5sd1ySCVS/B6kx3oqD2DUGiisBa9khrawZXkdZPlkPvF1wsIeSWF60A9TPyhVa13Y
 x5a7/fnVEjI9/QB5nhUJQPmA2JF9FphAyYL9XVD/PcZW18TtkheeBkMQWWsBBkgQupe/69mWCqs
 5glRn5AF05WyqvjiMbmH0wPFUCX6F9gOyt5uhKnJsDtwNpuz1tOVm5VcVtuAbiqjSs4B4Et8Ifj
 A9QjKt/vWebK3Kn4uKA==
X-Authority-Analysis: v=2.4 cv=Wa48rUhX c=1 sm=1 tr=0 ts=69f854ff cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IYgEcGvnuURNE-kt15cA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: o_BxptsUd4B-4-DAgJqTwwP3rrP86XLS
X-Proofpoint-GUID: o_BxptsUd4B-4-DAgJqTwwP3rrP86XLS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040088

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Temperature Sensor (TSENS) on Qualcomm Nord SoC.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427012511.231475-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..e65ebc6f1698 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -58,6 +58,7 @@ properties:
               - qcom,glymur-tsens
               - qcom,kaanapali-tsens
               - qcom,milos-tsens
+              - qcom,nord-tsens
               - qcom,msm8953-tsens
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
-- 
2.43.0

