Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819223A0B2E
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690596; cv=none; b=UNnbmx4eEdMr+c9M96/XkB9ItbjZM/Nke+JmE7u9wNtJkLs9B5E87FoX0ZzM6q/tfS0rQQjRfoF0lOgbQXHBbeHEQm87zynuzQCQvciyn/d5DPDL1E7bzKABKuBf2OMO/nSlYP3s1QHTxdcQLrxUgHR7iXGGd+GSl5iSOr6UxyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690596; c=relaxed/simple;
	bh=xYfGJGzqi+Ph030q1iDRh6gIu/gZ6goid+/tClxsst8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUm8ekkjrCTgWqXuhHuJXUaX/VhTGQHFWdWYlMU5zsyLGKBKXi5x5B05guSeTXq7AwnwLSLfBVmQe7R+wZKyEzxJToe9YqALznJDHVCaty036dlTun9hZJ6cPx/VjVtjPPCnm1ukH6o4BLF7g+17emaoHbCWe/athyYY4mXqhm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UyYdaBF9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ls0uI01n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UyYdaBF9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ls0uI01n"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OJ7evv236109
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OgwT+OL+z8vfI+l/SS4Z4sNq5N2cJHI/Lr6cvf4FDlo=; b=UyYdaBF90Y9e3Xkk
	ORUxGklZTY/I9oOF5LSpwuBowECVAlaLO6gtAdchKuzQm3PRKMXp8t/aDdIi7TRQ
	G4S53JX/gguegeqhAY9ioqx32PlBVEjzqnGEQz3zDxuCyngUFPZWShDAB+SVVExX
	mDRT5XvuBV94uKIvjCaNQ18Y9ziuEBfxGmVnKNHbtZ0jOPD8EPxgsh4aZTXk3cjp
	OhBhsx8D7GSfkbHMItPtzZU9GrmVEljduDt894JufP2bT+FEvMlLiyakyVHsLDvv
	XpXkmDrmjQ9/le09fGo5tz5tjDEY9uK4GfV0Wgj4I33ePcTvS+bhv0jn0n3ItBSY
	t++15g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9n3yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:29:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f2d983d109so1575979eec.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 23:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690593; x=1780295393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgwT+OL+z8vfI+l/SS4Z4sNq5N2cJHI/Lr6cvf4FDlo=;
        b=Ls0uI01nm6Tn9Ctfl8I3WOhi9s1KBjNVO1TqG7Dsprdfk1V0l72xwtajAlchny56D4
         kCleuUnDspHlTjnEOYREjuwDt7vLfqgsIN8hjo9AvSRM4n5o9i5OHs+aDWltNkK4YRd8
         zAH5qDbNdlglSyukgz7OV9z4IcHYbhQ9SaMrj6zVcyseF/MZaoxf/nuZCSW6L348k5I6
         TNhVAEZvY2AwQfTXNVsblhen94utyQb2EeR2yEbu4YHf16eHRcV3L4zGdYIkS5cfyXWX
         HZ39MXuYdQVm3oIbRRJhzCXujuj+OVuuZesw210A6asTssYBszqhPguKKs8s1QyQFeT+
         +gHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690593; x=1780295393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OgwT+OL+z8vfI+l/SS4Z4sNq5N2cJHI/Lr6cvf4FDlo=;
        b=tOAePJ0ScEqoNZ/L6xUM38QwAZNE5/ipNtBBy127EdniwBKhoHrGK0WC8bV1MHUC8L
         YWlwiD00+OvpYg5u7GINp9eXg95DsjZ7aX+JOk2rGuj+3mZwEaFP7jRNU6Hnaif5Xba7
         Sww2LUsA3SNe1iLlr6wIhaA2WfUktE5lRHT8fcJFgYa+XVCDcGw8aEiswBEOOGszH+zr
         nG3WMCIVhNideUnXm0ZXT9Iy970MY8enNEjZNWHcNlK/ToU/kPS4ieRTjEViwr7ZEwZj
         dlURwYwFZRXGo7CaOAkxgarC1N0Og7ADntKP0tcW/B57bxvhm1wyOcPYowKvHPlzJLMz
         4Pgw==
X-Forwarded-Encrypted: i=1; AFNElJ/jxFYTyPLVnUqCZ9+JxAeNbHRqx4BW5QxN8gSO8WwmlwAUqZ68BLAC8eSKLCWXeQ1e2i7RNvowFiWh@vger.kernel.org
X-Gm-Message-State: AOJu0YxEzShEmpXp4X/oDFjoMd3PPofs/6UrRjvQjqLvmnLiRLZs1EfG
	hXDIwDYV3VYdzAtyyWxiZrwNtDEP1NPtYTPigJj2r8Ig8May8Ln/oOYfL/XSaXlaUKTLC8U0lBW
	IUcHjbJC5pqMu7s1HC/+KuC5YggpjHx4T5A73582aYbC5thgS8puOV+mjWkA/dmFa
X-Gm-Gg: Acq92OHiQXhpedJkLdabGAEuzrEE1BK6mLPCs9dK4nkVCOepGorPRf6ggHPeYeqIsh8
	9AWzVLQkDSxb6AbMwpq/Kp2pbMT6H1711H9I25ssz4NwEm+jE90m6BS6Y8fEkSET3d/68Cj6ZbE
	5sSmznIvSfI4kewDRFd+qWfIwlqxDIy6kW3f5w62jj/erAff5hiASXpjpAh/ERwyHqsGfwrjGOF
	5JI3jQSvj7V5fTDxIr299JZ9DcDGT4bH44Ko6dBr53xXFQwH74aywPLH+zMsDucOlNhhpCUn/WF
	f6/PDSp/BVmausDBswycS2nC1QSiOs8EEEn6vt4Yhh0WOyD+T13UM9KzcjERPavxIEgwUJH/lpT
	7C92wM/s0eAI+2+0ApwV5CLfwqRsalq4R+LAgLPb2Nvsn08qM1WJltI6wDWv8q6PTOVKA46ev
X-Received: by 2002:a05:7301:7c0e:b0:2f2:5c68:5075 with SMTP id 5a478bee46e88-30449061a5dmr6688373eec.14.1779690593264;
        Sun, 24 May 2026 23:29:53 -0700 (PDT)
X-Received: by 2002:a05:7301:7c0e:b0:2f2:5c68:5075 with SMTP id 5a478bee46e88-30449061a5dmr6688350eec.14.1779690592647;
        Sun, 24 May 2026 23:29:52 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045223103bsm6918036eec.16.2026.05.24.23.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:29:52 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 24 May 2026 23:29:45 -0700
Subject: [PATCH 2/3] dt-bindings: sram: Document qcom,maili-imem compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-maili-soc-binding-v1-2-fdf9f9ff1b23@oss.qualcomm.com>
References: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
In-Reply-To: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690588; l=829;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=xYfGJGzqi+Ph030q1iDRh6gIu/gZ6goid+/tClxsst8=;
 b=ay7q80C9ko9C92cyHaao+vpmNN1YAacUIYUuxwinUKey5PQOq6zNX8y3/yP7+OHkers7/eqz4
 Hnd8AHVlNs1C/TtudUGVQz32AtDltcShYzAlHxBUU0x7QD4UWtFTPTV
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: REwO4KtM_C13NPHLEDW0vMJVovWfQc5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MiBTYWx0ZWRfX2+2+mZEQ09Jr
 JsqUKVKgLuVteF70122V1TLcFVr2UKX2PHGhBPA4DxvMGu1bwbdmMFDxMw2Tuei/7DRraZaUNB/
 zkTgMVIAHt/a/of9vnRixYp0zJgxWVNzkstDnahHYH10B/EUxMjFtPYVR/CBmHpfbnMWcM/WmTB
 vNcedNmM2LbFLpm9BKQXHDdEAEVaimrS/yepZ+SVt9xzPuOiyjk4e0Py6O++W7450warODVqCrm
 2wzsaAl5ddwaq+Uh1ak1/gg5Udj9G7ZypKLYcO2mzOk1ephTcQvynYXJ+LPy9f+zXHA0PN25ayk
 YxiM5W9OLTSyYVjH1qjG5z0bhncKBl4JAzArXxEzkIvWTt2UlHje/TmO0cRvpTDWuk4zeyXYgaH
 PGFZYs+8bg2apjXvn/gw94/na0i8Oq5FoT9MZpoMypfX85h8tPeT+SNd4OmxuTXSdI/wt3cVRl1
 Zx1IrMEn3IQsLp2FDYA==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a13ec61 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jc7a-Txr_6JP3MmN458A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: REwO4KtM_C13NPHLEDW0vMJVovWfQc5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250062

On Qualcomm Maili platform, IMEM is a block of SRAM shared across
multiple IP blocks which can fall back to "mmio-sram". Document
its compatible.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index eb695698a03e..14a537e82a84 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -37,6 +37,7 @@ properties:
         - qcom,eliza-imem
         - qcom,hawi-imem
         - qcom,kaanapali-imem
+        - qcom,maili-imem
         - qcom,milos-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram

-- 
2.34.1

