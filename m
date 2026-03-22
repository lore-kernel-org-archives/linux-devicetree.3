Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7049436493A
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195722; cv=none; b=HHHl9hwdzzD2nDkNJUGXEDTXuoTY4h3T32jQc/7FFjF4VTK7MKzVoepuNWwsMjtnYM0/1Aioeev7ci94Y42RLJ0mwY8xtxamDJn6NHiIgHRqBerz84H7feKPmAsvSeXVfpy8XfyffLQKRh2K7e+CifU/Kz23ID3NZMhFOkrYXRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195722; c=relaxed/simple;
	bh=QgVgXe7CeHCCGHRYqA99NXgol+TWPrEGIroxY/e/mAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LncN2lZAOSbKGYxWqXrLR2/wvTMpFPLciDasIRIxtF+plQd9lHnJYyjTHiEkRbRM1jaTBkx2NNKadJkwme3ulyqxc0WA5tYHy4k+Hbpg4U5EjCpaYDs2LZQKVTk3WoL9F49UJ5NWeJA0K37VWQ2BBf6+o0p4nOxi8Cf1d8RKh6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3ZbnYLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MX58eWUZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3ZbnYLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MX58eWUZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M9DZmr416066
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 16:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	386IQlpt2NLafS/qXHiiXgv7Fj0hJuSYuk0U8G2ja5c=; b=V3ZbnYLwLFUOrw5A
	qWc8FWunYPqAtDioh3ZRPVAjTX2LISiBKTWXxiaFbaEPZdm9LpDN1w28lCozInoF
	uKZsoTTKx3W7Ss4lIfV07tuH1q8kGyB+mXN5V5I4fnSwAc9w+GciffLmtmMFSoQa
	8c8p8h8J/IC1E+XogWkh9BJko/CpKH3tPfxB1pOWvwtI+t66HNMMdtsMNhyPeb6w
	wRneZU9KmILacQLEl5KgY9W4JlHnPBf3CF/9OlYz9W5hIguTSL9aGT7d/T6sz0Se
	uulpDp7irnNtCSz1iifat1HFWWXV5jxaJYdTYM+SRiBeYGLBDWqwSQdn08MLHlpX
	goIvaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kduamha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 16:08:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b31cff27fso19043311cf.3
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774195719; x=1774800519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=386IQlpt2NLafS/qXHiiXgv7Fj0hJuSYuk0U8G2ja5c=;
        b=MX58eWUZdmoU5CILizzGqrt0hymmoKRyg+t7BUuq2RL8Xzm13S3wbPTSivWb0NKDc2
         s/JxxVuCox9D8+l9w+MF4dTKpv8NIAb5vOvyj+QM/E5swawU+GRT2SAJqxCbZ/vKJDfA
         04dFvvAtgBR3JnebgDM5WGbRrGaFsHqUGbk6LrwDezFqniLZSwNs7/lHBehPK7fa8k6G
         5gdz1qmhINVtZuzyANDgnjPoY9aznnGXu9hUWvwfjFIpQGuolqXQEuq1oGWLa+kY8wYd
         TLfh+P4Pkvq3PNOL5m5ZR9Vh5xm1RlZChaiFF08JuybYPVCzXt22Bbw6m2ivzTT+sbVP
         ca+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774195719; x=1774800519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=386IQlpt2NLafS/qXHiiXgv7Fj0hJuSYuk0U8G2ja5c=;
        b=GO5QxFAZXHcpJyVJVoEzVJ5oOX9D3JEpSCH4R4Lbu3wcvJCr3L6BI5WY8/XbvC7Z4e
         3jbewprdJVBwDtDBTTGO0+EoGU8Z0X6x0+cwzCdoLxmL7CRX1vlLf4p9Cq9M6zMbR/DK
         rGzwJQIDEeGgvDcCQ1OFHO8RDnu/UFNkVh1nyRb+soVuNQfkvrDXRZVgwYdVfKjc3g+m
         bB9vh0pFaqd1XJRpHFiDiaP9/ndTlQCcxk+JbI8CcfAOatQn1zqzNVMbdxvP6YGqSP1P
         4FtXuVp2uscLkPZLuwWsAr0ogcWkKbk7yvRC0YQPv05QTfXKHermBrEApCu/dWtL8ogt
         AOXA==
X-Forwarded-Encrypted: i=1; AJvYcCVFPHHijTzlhtijrfiwjuc8TxYAbNO88WgA6rCSpLd64tHbpj9HgdCYU+H5jEnq9/j6YA2ggiwqtvqB@vger.kernel.org
X-Gm-Message-State: AOJu0YyH4qVGpwinVHPLnwHz81uc7t3Jf3PNy5dHC19PD5Dgx8XAlnFp
	By02MwHLRokKglMXa3wlm5fvhZDJHTJmLPHInycw0PsLhBUMAEJYlIQfNGNUcoSrw/ZmJIvSuzb
	j9MsmQhYYHb0JC2uLYBfUm08Vjeh5o3teydMoKjiCUj4QOv8L18hrdgJsktbOFcyh
X-Gm-Gg: ATEYQzzJicgKf6ge9LLC6ZGR6pYrua5Y62ppX19VXNldqivrrQHEd6EPMRyxuy7pQF0
	A0azs/iE+DKHOGpvjP7ZWLgSLWMaDE3EvbyhrwLbA6WDffGqb384AAFCfALMfgvUnd4/i8P2WOq
	f52xxW8h4OWelbNjsnmtykluM/RyvrttMzyNUkBnOT5LmpR3dk8BPlL08KsXYeXAR5Nr+VuhSy9
	6IXswFDc+P8okyvKkSQrw269G66z2CknO3s3Fc7kaF8a2tuc08YI9pD8+3GQv+vv39hK0C0e4EF
	1Xqq5T2Q+pxg9S2RU8KQ8RAKrdGr0go8z+X7Jwf4EYSi5ABBGw5KIlG0Jb/TDUPnBFsOAAaJ2V1
	kDDIp5oyaZen/GX7oJ6uzwUV7GDg=
X-Received: by 2002:ac8:7e8b:0:b0:50b:4d74:6614 with SMTP id d75a77b69052e-50b4d74669emr64263541cf.63.1774195718624;
        Sun, 22 Mar 2026 09:08:38 -0700 (PDT)
X-Received: by 2002:ac8:7e8b:0:b0:50b:4d74:6614 with SMTP id d75a77b69052e-50b4d74669emr64262981cf.63.1774195717963;
        Sun, 22 Mar 2026 09:08:37 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8159dcsm79087155e9.0.2026.03.22.09.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:08:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 18:08:21 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: eliza: Disable UFS MCQ mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QgVgXe7CeHCCGHRYqA99NXgol+TWPrEGIroxY/e/mAE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwBP8zfeTk+GYyGdR9Rfp889wufg4QHDUGR+mA
 vTcyHzckb6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacAT/AAKCRAbX0TJAJUV
 Vox9EACiSvwQYEqh5U0UNCPqDp29nnoblS6RDdcqAsLiiI5moF9pKw7tShHc4PXbq8rHg5ZC1Y/
 jOThm+NN7QZMfMwL+NwwTcejC+fh+wD7U2tKxzjefR43svHb4YSD8GBd3x4H/bZoBog9gKtyyf9
 9aC5E3VTfdeBYxX97b+Zek8miIFc61HeRQqqW3cZZ1nGUqBQBx6UfeL/qNEREeagDGjp8y8Lnf9
 v63bXVvy8flcDDxUUv3UAtdXX/c469eceBien8vwpr9g2EADvWpNCAF0a36PQpct+WypABOTrj4
 pjpq5kh5RSXLgz/IvdtxzLd+fHrlLCcIDUXnBVun/VyA5cw7yR6CmJipr6clkgkTPN5n4eDJl98
 dYLJxM4T3AYFI00dWPNTWhPD6ed1OWfaxGnb76jDZ+tMveLigY+CNtZuSC/aFBYAqdJxW3gzu9p
 3nPQX61i+vU39hnTnrluqSdpgn3J9J2EqXKX0pXbQWbYaRLVCLzlVBaMX5aTZQrU48ttyi2irFR
 LDvShb+YTs7HE8jkxyhhgCE/l9iIRk/i6etTaVVQjioJC1EPdMqgpkkjba0VKAX203btTjliOe5
 ynVC6LH7PprjTYJrsXApodhMKNtEumJeVF8/oJEwL4ct5196JTeRvBMblZBmAqGH+QL8BCBOPq2
 tD4EYYVN2vqPq5w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE0MSBTYWx0ZWRfX5ONEKHuV6B55
 p97rrfO6DRKWVP/vsdTayJnsgcUMJSJF4vZZ8+Yw069wX0jAGdsUGQUhMvpApqdt5g81np0Ojg/
 o580W/LL2EyO8VeSRSp+sZ6Mb81rLhzTUOq5uYk+/C2pyyiHcwA3kDw4CKmUVHCnUCyF2x/jkWr
 rT9JCrGJ4+bA3GUmY+oom2s/oEb/7Apd3qNSHG231trk7oLKG5A/aD3eGFuKInV1rkeBBKDN/Mq
 JUEbUGnA631LjiA407As3viWzQcEe1H/Fn2jLR4c/6mFAE/TKFSCqQ1/8L0F7/GXygVD/euhQ/V
 gUiD1c8P+ckH3/wM4hFrYmaZOLsffqcZE8aGz5sgBYbRd+WUooIVOv9uTxJxlJuNCyVPO9BKWw9
 6agv68d91dgylhuPqkXYX/+7HLegF/auinCKR01maWJF5HeitA0YtVpIONfFwiwd3bJc0NJdku7
 vOmS6M+H+PLiKnlSc7w==
X-Proofpoint-ORIG-GUID: KP9PnGkGxVv_qObTRMLrGH1abU8-BJbk
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69c01407 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EAnBn6KIKeZtCtzaVbkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: KP9PnGkGxVv_qObTRMLrGH1abU8-BJbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220141

The UFS MCQ mode is currently not functional in the driver. Eliza is
the first platform enabling it, which results in UFS failures at runtime
with errors such as:

  ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 4
  ufs_device_wlun 0:0:0:49488: tag#4 CDB: opcode=0x1b 1b 00 00 00 10 00

The failures occur when accessing the UFS device, while the controller
and PHY initialize correctly.

Disable MCQ mode by removing the corresponding register range. This can
be reverted once MCQ support is fixed in the driver.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index fab603cd8e42..60a3c861a5c0 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -743,10 +743,8 @@ ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,eliza-ufshc",
 				     "qcom,ufshc",
 				     "jedec,ufs-2.0";
-			reg = <0x0 0x01d84000 0x0 0x3000>,
-			      <0x0 0x01da0000 0x0 0x15000>;
-			reg-names = "std",
-				    "mcq";
+			reg = <0x0 0x01d84000 0x0 0x3000>;
+			reg-names = "std";
 
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 

-- 
2.48.1

