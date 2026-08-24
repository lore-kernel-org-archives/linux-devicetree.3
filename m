Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACE441D657
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572559; cv=none; b=pQrakJarKcv+mXLVUxgM4drOoZyYuwPfIbJ0QibXV2FhE4DvxYIDbtlKz/0+Vl4jjRhZkMG8wHoCPgHHexUPvoiBU3SZljUWYzuNcwp91xTbtZvdlmGeDsK7UcFsUiJqHNUGjOLJniOA/EOzU86uWoSCY8ZoddnsZiREXqgzo3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572559; c=relaxed/simple;
	bh=fkm1cu3iCQR87lufDwmiJdhLLsSFmGL7gsxEJ13zNHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yj8Bmzr3qVwflKbH33qf9kRtIbrM4P6huUFkYdS72DfuRMdiqWwz/aW5StpheTLW2yxCpSg+oUpwNhe0aAFuTXwz3aVLfCkG+L3yz6+1bnmt13cfYUfH/3cP+n8JznTLVJBVFWrRhxJevlIS+IbcToTytPwXtwseDt6PYgflCCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blSlCDq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jpy1t1NX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blSlCDq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jpy1t1NX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMQnd2743055
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5+TTogpgfLS0vvo4ab9m3yKNhSx1os/kunE/CWuc5PQ=; b=blSlCDq7SRNIbJKh
	1cFwyjShQueZjvJ9DbTzT30MSulVVpW/boIrk6GJuFUkmQsM5Fq5lr0Ukj3jDT5S
	dIUhWs9tLzeMdatsgdHT02QoeWlh112Pn6FbMfEm43W5+vDBzy3GsqMeeGXMuFnQ
	7M4yaoKp3aDYEqCdUQP26/DTPkG9B4lcyq/cTDCmTvo/IrHQn8f+HohEtQwIK1ps
	P1tziZJ5Hb2XrdK+kpJ9QfqvCeQ2Mdj28YcXIPiZNF4gspNLKtS+f3Ioo6NOYj0+
	9CWCjBXlxo81XWaVqNAuNsHqpMblpUPKzcd+zLtZdEJ0oFzmro33zqYY91Ahh0P+
	IUUddw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0wy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso48414391cf.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572556; x=1788177356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+TTogpgfLS0vvo4ab9m3yKNhSx1os/kunE/CWuc5PQ=;
        b=Jpy1t1NXQLM2oWTWhPFXqTQiJaDeL1881tS1Cyrq3CRuUEZnsTKHoalHEUwIe3cJAy
         XRr2a48WvvHGYUBL3/irsOojLSdNDLswywVlk64OZivbHoDzczKhELkUWZE/yPOsbGX+
         I1+iscBmtzl5FH/d9QuLUxPHs/rRDIw/aatNBQt7yW00AaJAlyl87+Snb7fXy0/gM611
         S047+nftNZojv4J/5XvHEI37sU5o10Oyssc2l8HS178GGclJtNLc/KZHKt6rD1wDr6GP
         TiBplVcym2B9JLYCUkciVPdPvFLK9jzDwiM0+SMkNVndmVdGGkpQCcIePSyzh1Q41e73
         Wf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572556; x=1788177356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+TTogpgfLS0vvo4ab9m3yKNhSx1os/kunE/CWuc5PQ=;
        b=GZbxvBkIrb7g7YqCIY77eIN+laexQU/5CdRLoQ2lkazp86T04bjwRQAQxKGPYQinIy
         RnnrezeYFRWAEpEsZOJ/IZQV+QPfCdHmzhulG8JGLyIdZn/hhIY9E2CxY4aPHrruHkWg
         1xyx/C2GZ6BtMwzz2UgW6FFifqeVusO3BtwCKkdPobVkvn7h3xJIxEi0WccuKXbauMAl
         VAIaJZ5lXRQQrxQPfOfgG/6TWX1tVPr5QHhhDqjeiaPjSv0G/yUoMgiJXNrx2paWk6AG
         sTHw6FLwdaGqvAXd1EArRDi+cs+psUWRVXnxrE/AmSegHnVTKrA6pWkh4CBQzbsMPWRv
         dRfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSWmsUbD0B8dWo/TN/4Bme6VoHI8PKpKkyffPl7YcKfx7aqj/XFJDG0Pxhywu2ARSyjUVWWgr/Ibpz@vger.kernel.org
X-Gm-Message-State: AFuF++ln5H8gZYNhyT+aF9svrp4P+/hjajhsaqgvTS2uw16jfadZVdtb
	mNspVIKjqajnKobyH0yEqh2pfokq8Ky+7gFsXVETwpPQ+R958HKTvpxDS3Uoh8ZWmkteI6fxqG5
	ly5pfnpraPRDS/B+Z373BUSMa3ldLeV1j3x1XDGf+3TBxoLMDwMlb/gDG9pvnG+iE
X-Gm-Gg: AR+sD13WFhOjF4+ULFLajlMNeouUnp5U4QyJC1UrDb8alNpzHMAb6Zkgh8tVAem58Vo
	SE0Nc3XxjaRb/YlR3Q3gf7HcZm0rRo6N1SjR3epv4/BX5K9A15orzHpeom58fMvFDJ5squ/rTmc
	a5Faagura3DOk+LUCm7x/8nM+6IqOob3KgXlAtuOw4KsLzr5pu8H3KJreY99NGvXXjeM2cQ6rN2
	3UdsMOKG8nDk3X7GfP9eiCNQO1rfgA3ClVlS/V2GDFXDl3od0lq3KwllauUf4j+74lW2C0EGpLb
	vMe4fn67KGOyL0ll2EwiudHklHBp0UlRgP4On8rwPi+Cr5P2OncrPQ14hOGFgJA5TU3cLsT5xI9
	zvhEazSm4
X-Received: by 2002:a05:622a:14b:b0:528:38b1:b54c with SMTP id d75a77b69052e-52df56eb847mr255254691cf.2.1787572555712;
        Mon, 24 Aug 2026 04:55:55 -0700 (PDT)
X-Received: by 2002:a05:622a:14b:b0:528:38b1:b54c with SMTP id d75a77b69052e-52df56eb847mr255254151cf.2.1787572555160;
        Mon, 24 Aug 2026 04:55:55 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:10 +0300
Subject: [PATCH v3 23/47] clk: qcom: gcc-sm6350: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-23-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fkm1cu3iCQR87lufDwmiJdhLLsSFmGL7gsxEJ13zNHk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDrjjQNiR9rJDygYlRjFfU1R6mkl4/8jLGH1
 tzaxRJHn9mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww6wAKCRAbX0TJAJUV
 VtA/EACfwHO3LtgWxyxD1F0fe4R3jSZ/Zr2KoX1JR2GMhoKtsLdJXlwnH3v7biRgosEY+oGgS4d
 jXSu2v50cH+S3d9Zvlxcoza0dCZkkJZAjK52v3zVUhYMUfCSr8VXFECLW5oUC7G54RIhf5hBV96
 LYzwxcMFGmt9aevEAX6Lj9xggEpKcefihaLKkxNbFkfiymv3+pLzfjOw3ptPOMFhmphYNga2ovc
 ItxGNTRlwzRnjpGobjXVC4F418v0Hk8G7tWwg/SKSE9kZCIwW2uricVZivo8ClRzp5BQEOkQtCy
 2s7lC448jzzMR3gf3vDQ7Oq/mw0mu7Np6BguF1PA/zkrTUsgXzpSkKl27OoXi1XDuLSNIkhjuup
 bOB3sU2sSa562FiOTFEqya6b84UHZyb0iKmEbCLJiuUQl4p6ABQCQBIjDcP7x0vWga9gdkqKoy5
 mBfBe1Ia6uvhAJTTtID3HJp/CatmN4B+xA3SZcHzPou4dB/sy5Sv6PXMJfEZGW309eY8pbfADam
 l67CABEHLKlFycZGDejw6ZpE8nchyghuIksH6JhCI3GYkPUvCtp5HNQQhf3UHgXys36MFWCjavF
 pLTKgFeX9USg/PUNAYv/elyvR41WeFqgDvGDbVa8xFJJ2Az67s/awnv6C0jHoglwmQFNvX0qDPC
 +iEofMrg/K3FFNA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX/daQ24V4Zqiq
 BA4EJOqsu9PYTKcTl04ZQf2lUrjQNJQ9kRovVtSX4RYG3+8H3z6WjqWrGYd94fMRDRgEw8Iu5dV
 CaA/FOttj2aplpH9pM5I1dYAuvYagu7gm2ugS78opixaS33Ept6l/YO/dkNhrG43k1f7FNtM8/Y
 gG4ozVzKWVUoPJeArcQEv/flm2XYTxomgTjGDuLNCCKzI47KIHR2AERX7BlHJMFZkITRcQL28YN
 cS68xp6fgIJQrhLPtqFGGgJzm7iFH7Gff2g48tgKJyfAikSUu1zDdWMCvgQAw7Q0EDGP+vrUSFb
 1q/6m+RhCPChBhaY4l6wfhjP0tvUUXLJ/If1kCX0T/2FZtA/yS+R0NuhhZpMtlKqSc4dYi9KaYD
 Y+lEM+orZLbRCeYlqCKWVUEGa5/ANDXy/kFLcr69BQIoI7hn4JX+HRMkmoNCT6Cd+353l0xWU6T
 zlh+XqmugxSGY4GHlDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX1JWJ60Ko5lNk
 EeLEWq6kIAlPDe3LF0vHsEiYo6iWa2VsY1PaTDHWhdGn1wlxCNxDouz2uEG3n4cEw4drTDphgfj
 5Ywn35j/vjhLT/Mh4te7aAn0HaRlVUI=
X-Proofpoint-GUID: H36OtbRYk0bWMGR30YLVYhv-18YSm2sa
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c314c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: H36OtbRYk0bWMGR30YLVYhv-18YSm2sa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index a4d6dff9d0f7..b99a5bc53048 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -2545,6 +2545,7 @@ static const struct qcom_cc_desc gcc_sm6350_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm6350_resets),
 	.gdscs = gcc_sm6350_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm6350_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm6350_match_table[] = {

-- 
2.54.0

