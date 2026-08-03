Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE5B38F639
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754029; cv=none; b=QVLbWq/3rqyQX1hFvAkbWkTe6GGEdiqBD8rh27bUvKc5OYyWuKUxQbvWEMXpJQ0ubyxAuCyDv4oIfvCCYviGstvXV+ghcnmvrqh9+USDVIlh2BGtZVeKHs298lHCgjVvbOFErfu0evAxr4tkRkXaQVMiu7X8Q0h6VAlLQA/4ATA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754029; c=relaxed/simple;
	bh=nsN0A4BkRTuXBqErp0cyVWbAemAMavp/V4BWlnV3i0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkG1WWO0oKyJUdiuFvYThOxsC1tel3RKpsgRPo5YYO3itBEqgrwj28KCWn/IGAhx6yH6lY7rrzZALs4WY8ul5tV7yF7fl9ND5d720/zsPyULZSloeW0lgZY5hFm3dI7J7XdtLFhqXu0JypY9ht0K09E9bWZ26+tl2vyaQdp+E3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4KbWRaQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ig+3aiNm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4KbWRaQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ig+3aiNm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737CWeh2211315
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 10:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	McCX/X+z7Qhc9dxXfIEon2dVb4eSsULT2vub9hT2J74=; b=V4KbWRaQDrV+NVuZ
	mJUFdtnEiixzCqAaGEt1ODH+cwfPWtVNJWkeR8Ys+Eq/9IGvUoPEUq9+JHKDs5Vy
	6y9fLN+s/2KdPDSrwGOuIh97AC+X5qpqYJVxh8DMj5cjaSfx6xejsl35xXQyPAtb
	QeewC4otH4R49remLlUWQb2gLRjwew3JTx2Y087yhfmC/Sfx/qP2QDD1p9QqU5A4
	ucu1uEu3qj0amO+k4hZiBn6TMEgb14VVFbuyUfy5qIIfeHNKEYmIHmppjO2k1Rjw
	RjuyK1AZj2+3jIDSSLIcpj6lwoSDP9Q4GS9EiukLlj9KhWpORqhTYEaE0Km9BMTn
	dySh1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmxaabm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:47:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2118360a91.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754026; x=1786358826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=McCX/X+z7Qhc9dxXfIEon2dVb4eSsULT2vub9hT2J74=;
        b=Ig+3aiNmNI2iXdbBPS83KvJZpzCUjL8udxIpKqgWASi5sgGAPdzfg/SM2en0H+Vpe5
         H+zQ/D/MvzpDws/4mqTL44YY+rtjp5pGpBM+FH0ZLh2RtAKMp5l9siw8cY9w7G2cLdeV
         VmSjh/By7AunLjENq/+S9ye6ve2aJ2vu1ocO19GL4uKjfkmJsaBnhPX8tpZopueO0exO
         qlU/+PWCNqsLk521t1PVeu+u22TBHsrZsQyc1k5rXi1+wDqHFUeLV/YrpNOwOAso7JSz
         SQq+nCJ4oFqIWn6I/oJ7cBOuzJAInlONlVGnZ+/PRWWUyO4mCMCUVUAIndXucpnV/fhI
         Qk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754026; x=1786358826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=McCX/X+z7Qhc9dxXfIEon2dVb4eSsULT2vub9hT2J74=;
        b=FhnfcWJ4Nrc0Un44ebxmIjQQti0NOlGrUmCwz97VuMZz5CnC/ZPsWbLyjdaAZLd8G0
         5X8al2haq5iKN7xFNKZ80g7P3c/bo1i8PnLV+Dnn2RHw1A754S4NmfNiBJ+ufQfhMmgm
         p3X/al5iUkT/6fDAqXhqteBVap43WU76T01W0FXFQZfKAE64mseCW/WROAi5l8EMiLle
         zCGnXQwUwaUQuXElOhBcAKOcdCQeu8a193Me+c+rT38g4VE/fMYuPiuv8IBfxqfkDFeY
         f0nAovuDROHwtXJc+Iqok45KKfEXrcH6LjNtuoQ0s4bdSZgfR8z+YwnNkHYFq6EJJoAs
         8PSw==
X-Forwarded-Encrypted: i=1; AHgh+RoXBhYniUVDUsXMbUkXFQwb3r0OHmsCY/8H6ZEMO8OiwFFOJHoGYhnLIMmhs5D3qO/NY6hRmVDEOPpE@vger.kernel.org
X-Gm-Message-State: AOJu0YxdehRkvoyqE1BDmb1wIyNeWJowUF1zmUTMkKlEz5145U+Q2nqC
	MjaVI8H/O2h8tQF/KmCKnihtxK2Z7iJDy3jSjwuBqzz/xtquFLFq3Lm+uQh4bdntoRdyohqDWgm
	60gz6J2NEUGypArh21TR3BVGDMj/sB1eFZckOMCRLEDGyUQxenZO3MwGpiNmyriXV
X-Gm-Gg: AR+sD11uRfKYDiN4xB5tPfXTZgv8QFkcYRILsLbo4KcBAaCKO4SDzUZrlZXxy9TlIpi
	+XT9wt8KP0emcpL4XSncY7bwtDlF5ooU/263WBYiEi5nGbuLoeq5Ju8KSbzUGQBnw1fzmgZRxyy
	brlOnD30lhfmf3YfTI3KnOxIIjNbTmGDq3phZfdW4giwo2wsaKH5jciB8uBZhQ56dt5USCP56Tk
	GBsNBLObl6boVyKJH9XlM3csD4ny8O2lFEWE7Gn/sPOY6F5OliYOwfR4zYG89kefhyio5nwbsex
	1eD9eLOTRqM0+g5195qsI+xJaYEj1kx6IaNGfyfFvdCRWAJThMACyBBT4belt602/B0ED6rMW3s
	9TX4N9RF5QIwBt5YH/w+nq+m0OSGEu6GPqXK1poWovEFENO7ygvYUUR6dInXN2WTGMyWYTZDaiF
	3jJonBPycn+CkOV6XeteNX+0eKZaz5Tg==
X-Received: by 2002:a17:90b:1b01:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38fbc4cbaf7mr8455582a91.22.1785754026262;
        Mon, 03 Aug 2026 03:47:06 -0700 (PDT)
X-Received: by 2002:a17:90b:1b01:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38fbc4cbaf7mr8455555a91.22.1785754025855;
        Mon, 03 Aug 2026 03:47:05 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:47:05 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:14 +0530
Subject: [PATCH v14 8/9] arm64: dts: qcom: ipq5332: Enable q6v5_wcss
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-8-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: pwMas5L52vrKNyqFzABKDu-6Dw71k0QQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX2WnJjgtW0v0Z
 jZVD0EILlbrUe8bpC73v41pNSAmNPfJiGdbkqoRwKW3lZpioazgE5+NpH7XQbdWS3etvAKss0jB
 Sclq7h2S83F9q2sesO39vT6D3a3uUdEOT+jlBqkYyOHPUpE9wT5HCbD5AOGf7vW4ZkfopmZeU0d
 BAwz/d0cZn0Pq8OJy0lJ9aestF3xLIZNzp8M+Q/vGwAHlvk+JYRB0ba4IMtrIrjJrt9bQcmNqqH
 tOWUmbcr2e65bIBbNdWKojvPS4KT1da+BzrbY2Ld7cwimdc3hrs/MNAy5tJehYCyxr96udk0OWM
 lHEMGiM8LLNp92H+TfM11B6yzd9nP3/2+McvnqmSRIR6oUZXlbUyWSbdTMOmEIk4bIEuKkax3Ta
 Cj7dkhImmEWGexsHZeBWuJFnp/aM0ZggnAEVCHBCrL3arXShxW+Tmix3QDca94bZ1ddtfCnfW03
 HWO4aUPHGXKXlFj1t1g==
X-Proofpoint-ORIG-GUID: pwMas5L52vrKNyqFzABKDu-6Dw71k0QQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX9z8F3XJyVr1n
 8m9Bi472OPlr8Cx+vxRdWAyVp2BjffZI6Vgn66VVMG6u9EUyf51pkl8CpHeLuk1BeK+dybNI4li
 0dq0lRyB0SCmN7GTWT6ETK2QgOpjP28=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a7071aa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=16OTYffOprEdp6u1-3gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030096

Turn on the q6v5_wcss node.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
index 3bbf748f2e5c..9e82afb354d4 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
@@ -55,6 +55,10 @@ &blsp1_uart0 {
 	status = "okay";
 };
 
+&q6v5_wcss {
+	status = "okay";
+};
+
 /*
  * The bootstrap pins for the board select the XO clock frequency that
  * supports 48 MHZ or 96 MHZ. This setting automatically enables the

-- 
2.34.1

