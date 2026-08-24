Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C16432BF4
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572620; cv=none; b=Qwh5Y5XdOwV7mNuynWZegnTdUR8CzQKDXKw1N7nxC7rFBoLcdx3FUcU3nzGi4UUnm5pXS75aPesEuGll6WrVqW1xVhqIWGhhVe71LpqgynRJnmbZkIHc96IcfRCro1aVnefMb12UJNWpvWvodFNRuFc7vep9zlNc9cgHTlqOQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572620; c=relaxed/simple;
	bh=kwoe9cDJHyiDxCz0G2t7XYacMKY7IbgYwFOuciWzpr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uk7a1tUVfN+kyPilagPCRq+n0Ic5w63duB8qPwvNVx1zqkXxaNO0l88Z3O1ZVG2zvgYvxcd5VZxpm3G0qgUkiKM7hevCn6jpbDUeZbUqH5dCIoZiOFdFqvDy78NPU0k0qx/ibMZFZE96C6LfSYgjAhCDYc0IWxjMvqjHqLbSC1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8q/GYOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZnXwlk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8q/GYOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZnXwlk+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMdR93194985
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFBlWjhx8TjR7emqcNSFWOI5z9JSSyOCX9bxdec/40U=; b=E8q/GYOHkx9WyMu1
	ZvCM69hFQMeBs/FTFSKiNHeSbyqkn2XeFJphIks5pHgVxpOUr037QcvT+THDIC78
	q0v9LHfpNzS8aCd3fDYiVpKQoCoFbt5uyiiQ/cGuHGLtodb4YyPPIVXJSFRumLy/
	/c/1/kCUFeAKAmKMFSr72pJBxO7wG+CNwnysbfP/kuc+ClffQltdL9+2rJoclHNw
	5D9X0feV28t9AOSPmU/015BKLzmGVJY9OJu6Gntr/AtP5upGICgEF/NOLOVwxjJl
	8WzlQTj+SgZ+Ltgqx5lLCh1QQkrTIU2jth9C1x52XDkHvwP5UeySA/YBtlo/d10i
	LEznMQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs33x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f871so35698576d6.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572617; x=1788177417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFBlWjhx8TjR7emqcNSFWOI5z9JSSyOCX9bxdec/40U=;
        b=MZnXwlk+34mV5H+tVwL1PsTZhatCPgnikrGn2FVjUJGLuus2t3b1nQQxgFBDVpXoj4
         j/H+3lm40Rsd1FQfOao3Uim2T2v7l0hJXEr2832vrr4EQF5cofaPI0lw51DgAOEoqKfD
         E0hPTkdt30pHDt6FXm5kuoOhhQevjqXKEhvpyS2ytooqEu0tBIVdTjt7uEhCY+bb5nfn
         dNVrg4HCxYe4800M8kZwegGJLlXMv3AnzHiJHv92APP7dnyCVZJc2Msw/6XL66IgB1bS
         dVm1ZcOsSDy9u/daWcvk19bcEfU5f0oF48vOav2zjWewy5j8LWWjf1Il6hz3Rud+gwzj
         F/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572617; x=1788177417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFBlWjhx8TjR7emqcNSFWOI5z9JSSyOCX9bxdec/40U=;
        b=Trqd50he3FvmSpUecqWNjaTiixUh6o9G38hOHL1q9F8WeKMDbWRSZ2qQr5n7IQjKt+
         aMNwbtwi+sOtsW4nnP/+upshVqqTDAt7OFViihbMjXXjW9oAzGoQkAKnbqZyHy9uI3AS
         5YyI9Zx4tmc0njH7SN9v8uiSF+oMi6P/TIG2j9bMLEE1hFk/mwrtTW374BqkLneQL7e/
         qbWr3ZozVIlIEckdo77Na1SV3IP+gj6A65v3rr25v8YlYv3YeIvez/l9bm5mW3RHNjtW
         qLbiiZelkA/aNmct5MU53ISH3rDiTTAoWh5/z3CL1gOthHBbkCKCncVfxRA0gvBTYxLG
         KLnA==
X-Forwarded-Encrypted: i=1; AHgh+RqLaTP+KmtzhiD+UV1Ogf7epVBm08Jq7QQQysMrk6dqzG9U9FeDsOK7LWX/5UNVg9JFamVl3E0M2xF0@vger.kernel.org
X-Gm-Message-State: AFuF++n/3oLbMCcle5o7+ZQIW5E5G2zqISWLlm9+GscVY7CXXoIwasMM
	Ftfq1SM3RarwVoyH2RH0Z2yA0wH7i3bSLamFtBCoqMgRxUVK3GRW1p5X00P4r+5TZG1+JFMwKOm
	PaXk4IbLxn1ypXarzS3I00/Qo7LTeGA1o4cVY1fdfSTrogcOOtx2oSq8rQ8IERrX7VA6jDzGk
X-Gm-Gg: AR+sD103n73hC60F9++p6D6vtpGhsu5sKjuFpfCPdhCZJMmJzoLyPWLnKZMs1zJ+DoA
	p0cCogvq9UeuIkyyVF6aUBYtiBDit5yLG4KV6LQkU0LW+zuLoUXc2Gf8DRksYqLpyMMO5jpist1
	Z3m1e6GcBzpE2b4kIljDO+zoLdkDv4NEgVrFPOsXW9Y+N0gtbgCoZtl/x8M5d1lGUg57lxzXxF8
	wrxYRRPhMporjYS5gJ3lidJj/ZMi0Mv1NeG5ayIQr0XxTXCSsD0YaO6SqeIB4b+91/fWZfnfJN5
	ByTugkzLb+kfqXO5vCkKYlx6qv9CRINqgyH63SYHOnkmDzhNA6+3UIZc07z6iAubLWq2kokMHwD
	KQSX4eUOq
X-Received: by 2002:a05:622a:1cc7:b0:51a:896c:9ab0 with SMTP id d75a77b69052e-52e09b9c641mr176201681cf.10.1787572617289;
        Mon, 24 Aug 2026 04:56:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc7:b0:51a:896c:9ab0 with SMTP id d75a77b69052e-52e09b9c641mr176201301cf.10.1787572616791;
        Mon, 24 Aug 2026 04:56:56 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:34 +0300
Subject: [PATCH v3 47/47] arm64: dts: qcom: talos: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-47-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kwoe9cDJHyiDxCz0G2t7XYacMKY7IbgYwFOuciWzpr8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDED75ng0aQajs3YEy9GbrRjxUSe2ufvz9Fax
 miHRFirMaaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaowxAwAKCRAbX0TJAJUV
 VlMeEAC8NASqNnvAoGy5djJtzHAVJuSHns/Rxrv7IOsAjO61QP7F5nJunT5UyW/1ilRIlxhDMir
 S0gP0/5VWwM3jlGeDnBuPctfyqV4klGCLWQquORTHLE2CcVvhRrK8iYeIG9zTUYvwR7edoPeAE7
 21UtN9kmXj9qkmQerdYsukVgT8qmKqCxNoz1Bn3GDji2C9Oij0C3B11xs86bqUmBnTxFQRMQZXd
 zaipwufxVRGLNN5hQOjUfhabcqGE6iqLkY6TFOpqVXc0R7zdMuCJdkreqajXFZ6oS7KXQrTpPct
 VBgT309C7juMQUUvBKLEg/kByeDAEiApsncZDxc/TK3quXSfDia6578lb7TB3V9xEUncGaG8/1g
 m3tFbLSkK5LKw1v65KOy1ESWM1E5UPkmjQdOix7chrlZUYapVDlMcNNwSvcQDsFFBQ4883qb5dn
 viZhJpDYYOyhVPXw6B6rnsdkwOAhyyIAi0tncnKEOIvW8/lA2AMGMfOWn3BTwID+cys4QsShOkc
 xykkbsNCNYg3M7jIQyDrCUNDhhZEo6XAKmhr4g8m9SW2bCRQY5KhXDsSUf7ZWnZBMdjeqPHlhor
 KyBHw6lyFsQ3f4tUaQT8i0NKQuLkIQBucHJ1V+aIDIvpekMYw8849CXhRhw0/8sr4b4Gs+W+UIz
 t5IIhfziMhfOpTQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX2GvBSVBaQPIl
 85ODKv/c5VMYqCwUGb4Fkvc0U0ReHdM5Qb2njat0SknNrzzHSQEarJJCPFWA8kyT7MPGjNukxll
 /ch9VeB6Kwfp+pJ26l6DGvKX8B3h+p4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX+CJ8RHPaVmkD
 iYbRyRHP5IvX0KcoJ8R6N4/x8T55yoB+VG8omtgPfxmNR8gsoVOfxHwfS4KhEw4d8MbkxGDipBP
 +5f0PqbKW0vkKJqm5/f7Ks0kxHXbw2Cc5fcrnCoOickjMGRCJkvRLb97y1s4rW6Gb4O4atbKDOQ
 YJU/TqwJBTZJJv5gSXtZRMXmqmEil4zb8Hqr5ekSeNLrI8/uYArAwtikoBrEqzUqbqNdZyifBPh
 CTuT1QPLvARvEN9wA6KSiZbe0OZQOiCrXlzToCYVM+dHwRh47s0gR46R94u+oLz9lrq+TVDrq+d
 WjZNxzHNmXIBD+xfW5URFyRFYuPiK3cxiq7zlIl13QwR/XBRurLCKUvxDTO9jGxng+JzNumhbQx
 eB3OigGYyjmmu7qErqkKOQbpHZHHeiQTlubk9lRdfNqnAoe2+75O6ihvg/Hoi95jmulfhyxJRJZ
 VcMSgxdEj9zSavXpHkA==
X-Proofpoint-ORIG-GUID: B0gwRkKgkrqInLX9tpYmqEWkaMR-IilU
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c318a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: B0gwRkKgkrqInLX9tpYmqEWkaMR-IilU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..06ca54acf565 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -706,6 +706,8 @@ gcc: clock-controller@100000 {
 				      "bi_tcxo_ao",
 				      "sleep_clk";
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

