Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C46F372040
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588349; cv=none; b=F+WgaRt6sok1JOpk2quWnhIgDioItyrH7bjSTq2awfh9W5DNvKzviHYG64ilxG3UPU/uX4J6SGnFtzcGg6IoBduGBlcmfA6x9kGtuFhW3SXYOTNHMXDh2OPRi8u1QbuL4Cn7zCB3PV2PK/ylZFTfOhN6RlkxNaet33eFZU/cBh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588349; c=relaxed/simple;
	bh=/fsGK0RcI++sYO1sq1g8j1sqo+5hrLDliu2X0fxunrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOXWSo0K85+Y7p/V1Rc3wTcTweBAfyow+9DzyCVuP5MFSVJ8UFSN0M1rJp2KqqRoPYUY5LFe6L/asN+oBFJf0XfyliqQFTb6kgcFurJygDspxb0cykCfj0bjKdPAmNxuU6W2MDKsMg0D+eQ2YKOlFL0PbYHQO49XiyMi8sFmf74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uqtic9FU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5wCWxim; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uqtic9FU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5wCWxim"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB3ogC3384821
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMbEk1ndXqSY38Pt3AtE3A3ndA7Zc0BxITRNGNrHvFE=; b=Uqtic9FU99Xc8upV
	u0UasEZt6JiohZIbm9gfJXi1Bg1QAUnT/cOJn2meu8Yi6mFoVVlvmJ38K5MKR5fT
	yVNKPT2hFg1qOwk5IYMC8HrD5NFdLqNLSZAXhJ2Lcc08v3VEY1ygqoVRthxxGxef
	RN1Kdq2dNIjIB7ArDGjkzadeWKdn4q2SnR1MbEuwD8ZhplwirqLWhSjoHdBkun3Y
	TD/eG7m/cHIX7562PVaJxOQAEIguyWu0KjBwScSN1OczuL0G4DejaOFGm0K4KWmP
	zKQcqHKuj/1MtOLF9o1QmMpGkR9leXgd5UelKEGGWOzcewcrSAeRnDlSD3O5r/im
	3WTP9Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4k65h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:19:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95cf8749d71so7980783241.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588346; x=1779193146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMbEk1ndXqSY38Pt3AtE3A3ndA7Zc0BxITRNGNrHvFE=;
        b=N5wCWxim5t1SPXFlwV+NSZfblGs528khF29nTGcxqoLc7j/LKviNOvJIZJSlaHDuP8
         30dCjFYc4a9z0w4CMTC+myMye//TF221gHu1CJJJ0hMciRcq6LQmualcOZgfkgZE3RUD
         QFFpQWTE/8nhlgpoCc1cZqoZKZcyqkakMcJpM1h91NWga7ZK4cZJhjzQL0vv7itGCxjD
         Y3eHmTl/k505LCQ1ONPTsZ9nsGBjwB5T5cHmzEftqP8AcedcRSevU5Ix0hrtP4FGlUWs
         U9o4iNAak6PDEZNdQp2hdMqS0Z8SPUyHF/fAyFsyE87V+8YTASNdHYPMBKrnrmQjsI47
         ohRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588346; x=1779193146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KMbEk1ndXqSY38Pt3AtE3A3ndA7Zc0BxITRNGNrHvFE=;
        b=lmyB6GhP96IUOPwEqCEf+qL6hw9/1VeM3sdKJR5LENxx/FV42qrc1SmnfFrJI61Pa+
         6EzstH5iYfQD37T7aOtc8TeVjUOprpbFFOlz+UwCNoyuG1/IIWf4FydwF30GtJxkel+7
         C4TcN2WNQ1Km8xLjLlugGe3ebuWTqcdFqEfFUloRRaiRmwHwNgVufs5i7boBHJZEErKF
         fDcUJLnTYZ285rSKKkeiP3Pyz8ZSoU3dfkWm/DvqLie/KEyW2Bt5Pzfu9NlxSA24ckKX
         hSFOMMPiG8h38nmiI+fWbNrmZHe2LUG+/EWMf0q5kyiG5pE4e901233nzuGOtZ88XXaG
         Olmw==
X-Forwarded-Encrypted: i=1; AFNElJ/Ec0huYqXlwEtvgGqejOcA/xDxrhM5x2xWHWR8qa+iyJGxiYk4z2rs6j0dlTOi252CUkAcCeZ50HFb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8/63I9OUC+Fq8uGiy391g1Wr+LQ6bXIjQF/rDLOPVgqvMifqb
	cw/mUQXjENKaV7wFP5F4uPkCoa3qU9bfsb/SQu4YUHGNrksMUCnPkzd0IftQTiTMce1lUTzCM24
	mVfs+LQvUx13WJmduwrVmoTGLGF3QBe4I74ewkXfdu4165IJAJt26mPvZLu2hY6Q0
X-Gm-Gg: Acq92OGKDncKDa2xvHesJR7iDiea3uD9ZLRjrujul9LNzNY7df+IPPfIPYgJf8FINZ8
	nljKOaI5WnKl8rzTt1wE5FvhAI2gm8gCPCpg3/6TVSyIzns2r3Ptd9mpK7Nkm13eVPq6/QUYpPZ
	Rn8a9OGDQVGYCM4qlatRDYVfegVIcZqRJqWosZNthEU8xriHLl0ye5CUM9TyMg9GLPHRxt/6Uvh
	kRzY8A1ZSL+B+og/JPIZcJrzCPalgmUkb+JhS6ieGXs3wsSgaVGSr4ikPtnlKup5yzh3djQg5ZF
	jtMQOFbd3fJJN8fzo/ZV5vNDG3SjF5oiSuFK3Gtvd+5UAEXIXdQRWdfsDr7EUuCj0vY0pBIPLLu
	x393oRqn0PTpA/Q6l7wBxojfujrjiaA==
X-Received: by 2002:a05:6102:8014:b0:632:1e2f:3a6f with SMTP id ada2fe7eead31-636180cd12fmr967935137.24.1778588346381;
        Tue, 12 May 2026 05:19:06 -0700 (PDT)
X-Received: by 2002:a05:6102:8014:b0:632:1e2f:3a6f with SMTP id ada2fe7eead31-636180cd12fmr967881137.24.1778588345625;
        Tue, 12 May 2026 05:19:05 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a6a64sm33700213f8f.6.2026.05.12.05.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:19:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 12 May 2026 15:18:53 +0300
Subject: [PATCH 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
In-Reply-To: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/fsGK0RcI++sYO1sq1g8j1sqo+5hrLDliu2X0fxunrw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqAxqyHa8bNRbGRYhaal1bqBqlrQQ5A/ygPzOAo
 sXvByYsYhCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagMasgAKCRAbX0TJAJUV
 VjtEEACltHlYJTIgQOqUb9Ffu2aOQrsIWIZGhbgQrPLddl1jYPKssCXIxycFFp+M4/4uravI32U
 oUALuU9j3fJA34GHVkMjSdIBzHKJrDn/thG+ZenA+m0ogXm5nYG4mxVIPuD9blcqrgfNIXJB8AG
 oBQN6wxZtuhjeClVBtdlZkIoDiwmLs+70Z8GSneEcKJsJ188i2ERBnLY86mT4s6TYKSVkx2ODGH
 LEGIFckv5Uws5L4olPw06hklufT6ohtsyvIHjy585mlNkpHZOPI4Nocyk9ujVjCp7ugiRggFi9m
 VvDF6JeSBQVCbbfo4T4MnuOOWT0Al8Q8sMsM6wpobxLjOzFfVIsjF169tcSni3+FhTDF22wmr4x
 kRq3Dcutg61prXWmOW8Ezzxi8J1tZj4R8FaEU+JjLrpAUGF6i+mMVD3Z/fMLTpYNvyRV7WRM7fd
 LNnPPXVQTaUJeYEW1Adr3HEnyWYsfX5CfS+CEYtpmIjure2PyCpllMQFi9AME5hmyi3jqbbSzUB
 8iMg2LeeIQ+KK1h87vKkGKlw9FoY8d7tnAoMIROFWdbFUX57Ed+d5SyYBVyayNdvCJyehNnZeiU
 zlGHPiNtkmSNs9dseYYwshXraDaO2sBUltBTmKVGn0ANLUNReUTCc1DBwAzSVgu0E0RwuaXRsAH
 L/OrjxUFp7AaaXw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a031abb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eJdK8YEf0-IbTu21kd4A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNyBTYWx0ZWRfX8JdxlYIUzhgt
 5TINUh8SAr7FMixwtIbo7vY7FsXrdndetcarvrwCHkdAebyKxSYaRXfvR5b30EeP6K6+ise8spZ
 VnrsVDeFFz3Z2fLBHsdxE5Iy2iIxzBPX8edhw6Qk5YdGDq5N8VNW+t3VTAhVTFokgYYFE876l8g
 d5k0/vPAf7WgSuJUBlFqiNYZr2yoHupBFrg9g2gvDURwS+MGWziX54XzwcN5QdSjQ+i3Y4JD5WW
 ykfgR/1hxmUIIB06wDg0IvB7Txoz8lj1hEmVBbwgeVf3x1yAo/sA/lsaEJlDsWHZNZQ/NnjuKJO
 mxoDg4sbHSuRUQ6EdZlssyy+Tj3dmVLnwzH3yiW20A83OJUMMqwz6/Ss2bHNbGgyfFBkEHl/Fk4
 91lBuUi2CL4vEi3h/D/f2i06OYLyVv63dTVW5QExHjbwQ4goAZc4Gz2/OtnfULA112uXOVk7LBK
 FeEgTvTPVchxuaVrdgQ==
X-Proofpoint-ORIG-GUID: O_i-KmS0RFKZHlDvS6LpCT3m78slkU5o
X-Proofpoint-GUID: O_i-KmS0RFKZHlDvS6LpCT3m78slkU5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120127

The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
node. Add qhs_sdc1 to the provider node table and qsm_cfg links so
SDCC1 interconnect paths can resolve to a provider node.

Bump the qsm_cfg link count to match the new entry.

Fixes: a39efc80ff50 ("interconnect: qcom: Add Eliza interconnect provider driver")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/interconnect/qcom/eliza.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/eliza.c b/drivers/interconnect/qcom/eliza.c
index a4f7903f0524..6d12a1c3c034 100644
--- a/drivers/interconnect/qcom/eliza.c
+++ b/drivers/interconnect/qcom/eliza.c
@@ -127,6 +127,12 @@ static struct qcom_icc_node qhs_qup2 = {
 	.buswidth = 4,
 };
 
+static struct qcom_icc_node qhs_sdc1 = {
+	.name = "qhs_sdc1",
+	.channels = 1,
+	.buswidth = 4,
+};
+
 static struct qcom_icc_node qhs_sdc2 = {
 	.name = "qhs_sdc2",
 	.channels = 1,
@@ -383,7 +389,7 @@ static struct qcom_icc_node qsm_cfg = {
 	.name = "qsm_cfg",
 	.channels = 1,
 	.buswidth = 4,
-	.num_links = 29,
+	.num_links = 30,
 	.link_nodes = { &qhs_ahb2phy0, &qhs_ahb2phy1,
 			&qhs_camera_cfg, &qhs_clk_ctl,
 			&qhs_crypto0_cfg, &qhs_display_cfg,
@@ -392,7 +398,7 @@ static struct qcom_icc_node qsm_cfg = {
 			&qhs_mss_cfg, &qhs_pcie_0_cfg,
 			&qhs_prng, &qhs_qdss_cfg,
 			&qhs_qspi, &qhs_qup1,
-			&qhs_qup2, &qhs_sdc2,
+			&qhs_qup2, &qhs_sdc1, &qhs_sdc2,
 			&qhs_tcsr, &qhs_tlmm,
 			&qhs_ufs_mem_cfg, &qhs_usb3_0,
 			&qhs_venus_cfg, &qhs_vsense_ctrl_cfg,
@@ -1321,6 +1327,7 @@ static struct qcom_icc_node * const cnoc_cfg_nodes[] = {
 	[SLAVE_QSPI_0] = &qhs_qspi,
 	[SLAVE_QUP_1] = &qhs_qup1,
 	[SLAVE_QUP_2] = &qhs_qup2,
+	[SLAVE_SDCC_1] = &qhs_sdc1,
 	[SLAVE_SDCC_2] = &qhs_sdc2,
 	[SLAVE_TCSR] = &qhs_tcsr,
 	[SLAVE_TLMM] = &qhs_tlmm,

-- 
2.54.0

