Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997C841E6D6
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572563; cv=none; b=B+gGMAqQSk9rnnCgosVC/viW0Hs3Brs2O2hrVGxmEm/qBwGUMys46lUl08KiPTF4h7sSWo8ZTffnjU9ou222+1/zgf1/07cDTPhNWa9oyrce78OuueplG4zUnqEY99KqtckojWpaYN+NYly4LujLCPFagprJy7fo7UOrdhbx/5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572563; c=relaxed/simple;
	bh=MRJowHguzbNfcT2rStZLwQ8PUcKy9tX4dDpzrESdV+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbWEYTx7wBRObUSiN2keg/sjPd2k1OdEERCFioi4qpvip8tMPglkkNkKvPNNYYDWUnx5bbXnBx+L5BeR67pdv+XYckx5rD+E8e2wJ7DrXcCG9Zs78DLf40H8AEB6aQqlEnmrRh7A8l7q/Qc4708nrn7BIp3o1BJE0vTJzPgeTi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjB+pWeR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CdSnrLln; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjB+pWeR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdSnrLln"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMgEX2864704
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3tDisx9byyde7jrmeKqekh9TmDooMSFvQicbyx2kZ0=; b=AjB+pWeRRwPBrNN+
	0b9kKNcniBw5VXuZ+CTAPXsb+dcXmhuPFtUXJLErvQpkCpFxFTTxEzeTcfkDdH3+
	cixgbTEi0ohIJ33UT8v48Zw08gsmvWyjedgm6fHRaB5mN8LNOV2ypd5ve3f8FXV+
	boz0GifEx2egpa9++CK2QREyOtTnoP2NpEFjIZoUNNKKtb4UFZ//yiANzF0zacjg
	V02qwB+e1Cq/fkzIcLKqbyMb4qtFIc/0ip6W4CUf8aEr3FIJy1Uw4n1pR2fcOtKN
	SeHopZpL8fFSAd5nmwWUuz5AULuh4gfhX1RBILzu7M3/aVPLAhltITOD9laEzOgW
	09L5Nw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr29sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e9489f62bfso40054016d6.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572561; x=1788177361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3tDisx9byyde7jrmeKqekh9TmDooMSFvQicbyx2kZ0=;
        b=CdSnrLln32uFvDKAp8QlULXv/Te5WT1UXuQa6AhJjI7rvqlP8DWwC5rUG9qOO4AsCe
         7jQ+DZ3MKleqGR/JhhkzNqaFXsesg5a5LSGA53YhYHa9N1odZIlATur2orkml6W/CHjy
         irgjIqjVlrzyf3QpdlyL2Dyx5M+BIr4+NW5zNaAJAFh1QXAHSGbuVMtVAW4afCA6HGZe
         wZZ28UZ6q58OvCjKDTVAILznYVLEqa5ZJvXtvwlDYdpO66QPzjt6tr+n6ykBE7v2Ii/A
         9S4PUlR3F3/uTqsyH5fqZE0a1Se4HgY2XVW9/oxhN+93e4CnuuJOeLUZJyBst9XeNGTn
         RLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572561; x=1788177361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3tDisx9byyde7jrmeKqekh9TmDooMSFvQicbyx2kZ0=;
        b=EVUYBYwNTuVgF0T52Uf8yvaf9uy+ZhqteLq1yfIhac9PVkLemsCttKx9/+bJi3nH81
         Wwckbgo7CZDva1zfJz7BffR+YHQEcZmxW6s0SGDVacsHiqNtQNl2MRY1ap9N1/kZoalX
         VQPSp+djSUiJkjDzfXwTNlTajepiIxqc4rNezCFLP/oc9aWXRbYaYWG8a1W5rNFYU8Zs
         /HQjxMDCwQLj0hrWhgAJUt7HwY6Y9zbCA6gCQQyE5pi/m3lUGn4tm7OnET/unapdaipO
         CBP2AveWV7ER+p9f7TD8Z01ADf2J212NoMHgvMWcCJksHIdNNqTZiLFucaJaQvAzug51
         CpAw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5JJ8grW3kYFUSV7t7R9Tzx751U+6mClLDLeonSp/ZcEecnc8DqQDhDxio65eTuxBa42CY/+bGItLy@vger.kernel.org
X-Gm-Message-State: AFuF++ln2zbQC5gSMCkIjJeCqbfW5HSwQsSJN1aLRBTeWsQf6ramhBBd
	fge4wkVcs7/iuSpQwUpu+c14doiNstoi3zuS5bFKnQzLdJzhMZfi2jNB1+qLVH3GU3A8cndnsBG
	4QSA1XCeVKxkzI1J7WHAetmaUZKM9TUjo5nqIqIjV21O1oEvsHCkhf040HXMgzCfF
X-Gm-Gg: AR+sD12WKJkZw9uflIvfTvp3sFPywgIFo1K/Uil8nRxQS2TKuETW8nmrgiYgU2SnRiS
	lS5zNADmw81QRWVizzqAryeEnv4jZBjdG3zeEG5TRj5VoMIrJOa3uSlacb0ged4Vz2SEk068DZv
	U3LJZ6VpMtx6AMwpr/3R7zltI3trRihqgH+xsiOhUdlrluf999RpMsNa9KZ/DYtpgAhafervH8W
	OXt9KHD2L36vd8UAEiAalijE7kMFcRYVc+tBM7ti5nsFHoDk3aS+04/geuRTvxtlpctcL+2XKbe
	cu7V2w6i7OsfgYnS3jw3WniroapGn1qOHHQqB/s15kVW2oGlXl/+rjTEi2mjBOKj/3WWYs8FLAR
	0uasyCaFV
X-Received: by 2002:a05:622a:1f91:b0:52d:8c01:5238 with SMTP id d75a77b69052e-52e09cb983fmr163063341cf.33.1787572560658;
        Mon, 24 Aug 2026 04:56:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1f91:b0:52d:8c01:5238 with SMTP id d75a77b69052e-52e09cb983fmr163062821cf.33.1787572560064;
        Mon, 24 Aug 2026 04:56:00 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:12 +0300
Subject: [PATCH v3 25/47] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-25-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=861;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=MRJowHguzbNfcT2rStZLwQ8PUcKy9tX4dDpzrESdV+s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDtOyoGs7O50Nhu6TXplPr/b8hTyNcxvnNj0
 Jah4PmK13GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww7QAKCRAbX0TJAJUV
 VnBjD/9I/0PKkqq+H6p9PPNvTVEPbnmRP5JtJ9+6GyYtCwQlnKb6kkLb96AdbrJxQzQ3Af8JKMx
 jSEjSAW2NzL6WorT1x/dLeWODU6e97kstgbipp+6DTqu1i2Jr2DUVHiDvygKGZ/EY1p4Ox38f9Z
 mNKszuUtG9PjozGGATP8m5fy+mMJpia3uKtXMWRLeo2X69joHqD+1sOaNNPzJ2KIznEsviiFb1S
 FaA7bHBTiKpO3a+IHBzdB6UJ85VIsfTOsUGrgK7GV0Mjca/6UsO4Ch4EK5aHXu+jjBOU1dm4+UZ
 7/McBdKxtjn0gawB5AGYHqkWbJ4u/HRI2XyvmK9b7v8Vw2CAOwbt6lYnsPxZarjRnZRiMoBDMj6
 wm1RboaktNaYvtqGEgEqKKAwuFM08f3/ZKJfcHI5hl8X3gxUS1neLr1O42Likx1Lf2yWKpAoZms
 2gU8qLlZ5e7gH2Z8U8b164g8yzf8zrcK8QyPSM/EZwM7IDytZmrQ4CEVZoc7wWIoJAhAi4B6URH
 oIqnpEnV7CVQiGe4I3Yz2isDq6UMt56LIHsvSzoJY5mGwohpuIyr9afnkRgJbFvZeBcQP3L9M7S
 MsT/KrR0Ksx03TKlP1hoqG/bzes3OyC2dIlr01e7UiknTKA3QuyAHK+Y7+0LSRw3LRGkEOMF4h4
 e7/wz2JiEiNL9Sw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX2pIolUFNXMzd
 KeDpN7f5OoXHhFrbL5zDu0yf8gwzEGrW1cfZonbX1fjHTR84AUFOIganKHOk0dN29qdij4zUNlB
 isSQFWM9GGyGHnMlFNqVijRS9PVtJlPQwhbEJlzggbLDfpvfH2xU2+cfsfQOlGhhHSpceeEz8/S
 BMMHvhj1/kCg0UKc1ccua+6DJRRhMBICJEkQFR4ZklM/bIswvxrM1E0RUPoU4GKFM6OcrfkzSjr
 P2vN2sWtDdTgbuXNgr+A7zD9j9dn0QZNaETX35pmIecsV9BeKQFJDecY2DX52KYaYCzJt1RCW04
 AxxJPrmtCoSR0hiJWaoXF3qtqPEnl6rsrKFrOZiCRVk4Qq9hyjEFb8GyWsvp6YE4zNlIDUIQ2ey
 fX/yEVzPW7C3kT9Geh0VePmR4CrPS0C0aXXchdfO5XHX2Ir0z+aq6tGwabo05Avf6cak/VuTMv+
 S2bIRQD1g2O08Lq6scg==
X-Proofpoint-GUID: IQB7zO0ucsu88PctCRt34ZTWS5FnGHT6
X-Proofpoint-ORIG-GUID: IQB7zO0ucsu88PctCRt34ZTWS5FnGHT6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX32QEo9Ty0I5F
 CTg7hJa4DD5lAFpL50rd1TxdG3T/A1EC/qr8pxepUjDezpxCTECPISkMe0w5MHuPJkAjW0ZCQwQ
 WBeryN2FuwBNvE+Zpi1PfuPxGGYYkFY=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c3151 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 1c59d70e0f96..86c2be3804c1 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3618,6 +3618,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.resets = gcc_sm8250_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8250_resets),
 	.gdscs = gcc_sm8250_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8250_gdscs),
 };
 

-- 
2.54.0

