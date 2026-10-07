Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F5A3F9F25
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 06:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355857; cv=none; b=ulyBP+UfnXNiODgO9fG1iENOAWLoQtHG4YtuwZhmHlJtIpKSw7hVlOE2t4e7/xH1X9jszniC14T45FK1WuJtLPnQmHBYm7C47rgVEMWcmsuWYnAW+lOUoWI0bb5L4YDpXsds5o9CYxulQgq1HLq2ipW+TqehhFx2fYBDao65ynM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355857; c=relaxed/simple;
	bh=Ni1lTQeRbFImYjymCCxoP08AlDfxpAcx3Qkva4hCzAs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oHhqcBlGFZ75P4VGFaPlHwA2lDzuDjzH8Ug4ZO1fkLDIFhc0qjgD5T0ay7GJFXtsu10kYHZfjxFY8TP/jReEilwcOqqCV4TUVyzntlKGvKQtP0+T/Do9mjf2fJhCscXvN2K/uyOUNtGXeGUVGmTmE/LXMljhTaZs5MKl4Z/0Dh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtFDngL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bH80RO2y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtFDngL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bH80RO2y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974U6M72916052
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 06:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a11M7BngOPJoTkOyICJz2w
	OVpKy80IFCeWDMdq/5uas=; b=VtFDngL9Xd28E4NoJrmFjjGzr8Pqu+AS18g+VG
	pc/DFFYbIeE5u/mrUv+HZbP54JaRm/ov0XbVnhBk+LN5KFugFz009bRIZVH/b+NV
	vOeR9HzpHfeFxPxkYvSokviYum59woQIRHfF7iLVyi63SYW7dYR0Zu89eJmiww+o
	K2SwUQrkO6E62J+Nze89Srv+G13AVSBl49gX6uKaOv+ehrZO1wmrJb3krvmb1Zcv
	P5dW0iPbbX+0zPgf1XzioqKLAWS0LJfuuZgxOA3X7sop/uIpS3AofjTuKwxHTS+G
	DjL1ekgHlog64q6wJ6LQ9HdalpxhnqXL2QlgdGj+ZVFK4EjQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54622w4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 06:50:55 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so13097946c88.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355855; x=1791960655; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a11M7BngOPJoTkOyICJz2wOVpKy80IFCeWDMdq/5uas=;
        b=bH80RO2yA/QTeEGgMNg/pnv5S0j8VtESFgLkEi/eseUBBsWo4gm0f1SjYdVVRuj/kQ
         GHLn1KNjhggvoetcIv+8Nzys9dzrCQp8gcERKu4HeFNhR4zRLlM2EN/K+R3YF02x/Nia
         z/ZZt35mkDT6+MxJxhLlJ1Ish1/GoSllYDjoBhWyc5hLmRU0TcP+pM/813DdCx6jo1lR
         4flRjj+M0Dywi0TYL6FEKgzbr1QuhoOYdMtXXTZiSrHOljiImwrlJHmyly8cLT9GAWl1
         h+4a5b/xlT+eXAqhhTWxvR1CxXg4WXZQG9JhIkZdQyfpKzDWWwYuM19Ncve4j8ZNFG60
         KZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355855; x=1791960655;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a11M7BngOPJoTkOyICJz2wOVpKy80IFCeWDMdq/5uas=;
        b=P4iW1YoSSIgW/KhXRu/UDJMhlUY2pWEUnd0hBkq0t44tT4+AJLhE76hFnD6bcV+c0H
         BwdG4Nm6YxP000RXJbNXqtdQYoXQ8lZihmh5SRNA+6h0LXlDqdJ5UOujtNO4CAJ7Nfon
         Kqq6qXlCAvUvKTX3ZTT+E8pNTVetkDKVx83CxO7N9QGfDV9xPxEvo8ybE0pGxBaZw5lR
         o5IYEql7UmY4L6jF9Quvc+4t6A5vji5fonQJGFZoH/tWlga9V3Ql0bkd3+pvtv+RBgUq
         yRwHrI72l+pjgmyJfluX6BMDnAOjTW/VI1qz+HCHES4C6K02p/VIc0WbNw2sYXkUJItd
         tbWw==
X-Forwarded-Encrypted: i=1; AKwUvBwDCu9rlwdE5AxVl5NP1xzorIE3QcKD4114aIZVOiCMCt7qXV4eY12+6e2KQcJFkX1GwCtDPmV6Gr9R@vger.kernel.org
X-Gm-Message-State: AFuF++l59Di0eKdovnjIl3cht14w5uQI4Yo5lGMA6EjUCYVpV99CAl8a
	knGCevp+sYGYayXzTnzdyQDxFdYXyWIXgJpQ9Nr2/H0nuj575THNVjM8CSJCi5yOlGWGJwDy+b7
	gtfi7bk/uw+MBZjcqGVGpQC8KMjp7sEhDEFihmnVrDjOXiGlrRnSNZTPzrDuZ7JyF
X-Gm-Gg: AYBFou1DNQMs1Od+41Uxk+26j17VIlUDPv0a5t4NcX2wZEYQ7RDHcQxkWxHTnppdFoc
	9UUAOMYtARdVvNSP4OXVNmD6zs744XuAhyNXerDQ8yAFFmeFQ1RcM10YOt39p+y8XYiCxQQoFfV
	5/XPMZAW3Uc2KUKfMloFIgnl5GfLEARMHiNZM7aFG+sfSZiFuGfoQ6YGoVBTqn4lUeeztfy2BKL
	b/D5/7M/sRvMZCn859dbKiJQx+NIJdvVqdFW+YW7YHHUraMZQiCBD0K42+1pDAnIRLrJBB1k1gg
	TZYiVBovzGxCTXJaEI+I7DmPuUE4ck3X5OBmeuszZ3+8G0JbH57qCPoigWKPzz+0ej1TnhFulrG
	D7ziy/t1y0O3I5AT9w7P18cZEDkBaUvfwy02xq20dcrUrjy3Lsao6pmKlIxvS/SNgQjUrKwkV2g
	PeHsT372LjrE9ecDnbWM4mqKPFfaC91dkZiy4=
X-Received: by 2002:a05:7022:3a02:b0:143:26f9:33d4 with SMTP id a92af1059eb24-162079a5f27mr1774329c88.34.1791355854458;
        Tue, 06 Oct 2026 23:50:54 -0700 (PDT)
X-Received: by 2002:a05:7022:3a02:b0:143:26f9:33d4 with SMTP id a92af1059eb24-162079a5f27mr1774273c88.34.1791355853728;
        Tue, 06 Oct 2026 23:50:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm7374730c88.2.2026.10.06.23.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:50:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/4] Add Qualcomm's IPQ9650 APSS Clock Driver Support
Date: Wed, 07 Oct 2026 12:20:43 +0530
Message-Id: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMPrxWoC/yXMQQqDMBBA0avIrBtIItHaq5QiGic6VWyaURHEu
 xt1+Rb/b8AYCBleyQYBF2L6jRHqkYDtqrFFQU00aKkzWWgjyP+LzMiy8sylHXrh3FMbTNO8UQp
 i5gM6Wq/l+3Ob5/qLdjo/sO8HEqeygnQAAAA=
X-Change-ID: 20260925-ipq9650_apss_clk-ff825e337d11
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: dVe5VSpjvaRVrb4-1Kn6Gh6w3ZsNKAJi
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac5ebcf cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mshoYkgwlum6hxNOkgkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfXychac7qH6JnK
 g749KRLmMOi1SpW8Gp84F9f/zNKr0CWzSxAiWrJZPkOBdreN3k3KvojkDwjmorolulE4OODqptc
 3bYGX+oouC7hCxK/GGK0BfuPx7NKwtA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfXxXOjcrX3OwgT
 KRvRNKBpez5uWXt+1R56RSxv8RQHXiCT/5o+T3+S051SDa59WMox/lcnMGGlUSfVdkpFv+Muoas
 ByXjuOfnfsDxfTROSaqWZRl3q0pEER6X02WkLWJuaMhsIJy7Q5dzeejHN8sB0GjzsWgujAggdIf
 sk658IUG7R3cVNnbN4nFjmMy6r9CSPGuAR1YCJrmWCNs4Fl6fxnz8Vk0IeBy+QVjTjMGPF2ID53
 Aqs6NoW1B/A56DlsueWzQ5/0/JjXWVh6AdABrKcrUlbpZpxo/GPLd2y+O/DF+hAcqNgO9kDnBET
 n4iRRPjQKRrqKmviYQXV8dWoWaN++QlxKeMRcJe8Z3dxH3qSOvcclmvOXvSVSH5wMvyMLNTNpk6
 S9reyk4e8zNDMjXW/H4ZNYRoQBCND2NWw8GoVTZUeIGeZOu2Nt5kBe7bLwBnhx4erx+3l45ph26
 4kewhpHRfjM3VTZvE6A==
X-Proofpoint-ORIG-GUID: dVe5VSpjvaRVrb4-1Kn6Gh6w3ZsNKAJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070027

The APSS clock controller on IPQ9650 provides the CPU and L3 clocks. The
four Cortex-A55 cores (silver), the Cortex-A78 core (gold) and the L3
are each clocked by their own Zonda PLL, selected through a glitch-free mux
whose parents are XO, GPLL0 and the corresponding PLL. Since the L3 has
to scale along with the CPUs, the controller also registers an icc-clk
provider in which both CPU clusters vote on the L3 clock.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (4):
      interconnect: icc-clk: support N:1 master-to-slave topology
      clk: qcom: clk-alpha-pll: Skip Zonda PLL configuration if already enabled
      dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650 apss clock controller
      clk: qcom: apss-ipq9650: Add IPQ9650 APSS clock controller driver

 .../bindings/clock/qcom,ipq9650-apss-clk.yaml      |  58 ++++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/apss-ipq9650.c                    | 385 +++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   4 +
 drivers/interconnect/icc-clk.c                     |  45 ++-
 include/dt-bindings/clock/qcom,apss-ipq.h          |   5 +
 include/dt-bindings/interconnect/qcom,ipq9650.h    |   4 +
 8 files changed, 504 insertions(+), 7 deletions(-)
---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20260925-ipq9650_apss_clk-ff825e337d11

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

