Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E586A41DE11
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315362; cv=none; b=PZgakQ5j8MXAtaussx2qLbliqiH1J8n3zLqCHj0rv1x6pAoRErkE/q2vi30bVtDv6e01v1cJfw7tJ8/cxNDyD6rUhl5Po1Da7VHu0OlX6W0XoljfAh1W+wauEply/893Y4a1yxotHT0VVm/59BQA4sWhfsbud/4kpefc8HeHz0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315362; c=relaxed/simple;
	bh=QLwU7fKegSZgo7lckFiKBtN1ZL2aPp2XYB5oMQOrME8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewV+FO+mK8INg0ZKrqjHEkuDATt7hJqlfS9bhIF7oxpEC90lj/KJrl96yCB5V+E9Bs85yGNAPly57TDr4qfrnDE0lE7qIbQDDIp7dHIGg/HNEf3azt8iAnT3ZIk7ILdHcVk5lBxvdYudBEiJzuPMOEzj8CKHTfhXPhLdlvBS/u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGTfyAbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DG1qLVB8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGTfyAbE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DG1qLVB8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YaeY2911753
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oss9++ljyuGbbaBIi8aA3J+tr+vbQN/DpaXOHs8TZi8=; b=eGTfyAbELFWnKAfB
	xt+GAruKXEPtJTQFZX/PIVtmQgtWvq3H3twCVe7TRXsKkZ7OEssHRWR7Fpr0454B
	OCpfsfIF8WS+HXgHanD+P/V+sQYlZlv2lft7d3kloC9jV8koQJTTKLmMFunDm+ur
	ehLDFd8YdAq7FSjJ3KuCUK4GyfNBySPaJhJPYEv7ewuu6d4anJqKPnlbuZgZC1lW
	AnLoj75lg9KwkmzSUtvYjzsc5r8mez0NsaJkwy2Ab6DiEUNCUWaAt09avcXUMyaN
	ihJX/yNEFryAZd6+FPipPbkKOt/PsxfmyAWwHjXZkhThGePcRz82UBXJJRUscZk7
	HAbx1w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm509j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:49:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3284bbaa89dso2098423eec.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 22:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790315360; x=1790920160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oss9++ljyuGbbaBIi8aA3J+tr+vbQN/DpaXOHs8TZi8=;
        b=DG1qLVB8nym1dPwlaHTlYyEFsMVShLCV4MmnjxGwumfGs5RtnkUD29kpgT/EQOoWsr
         Fz+Y4uFeTgRKh87x/VFJR3JFWFFOR0y1k+CpdfPrIw0axm0VpNKkJT+RZYCj0p8gSmtg
         FONA+WIITCAvNVoDJsqeUbbdtbSoJkUzo/yU1dcnygekqQ3HEO7AYb0U8PL8vng3NSnz
         mgVuSQsPYh0vSpnKGCcrb9Awj8TjVQzbWcIi6S6sz31gxgIoM1lhp7It2zHWyNW5CvH7
         6a6XUOgjfZDLzm9kCQAW7mOo7h3aF7rlYySqyULcrd0tNs5YVt6X/K+Iwepr6n2sgQ/Q
         342g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315360; x=1790920160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oss9++ljyuGbbaBIi8aA3J+tr+vbQN/DpaXOHs8TZi8=;
        b=XxPm/gZNTnj4aspMhn8Kdkz5GShZm/cc3J5Cf6YVqPNJOFmEOavAhvlRkZ9nlJR7ua
         KTKzPjV+JTzk213cRtNb0UnHOkxYFtWr7B/wI7FFaDhoH/wD+Bsj5+SFevurt96nlTta
         l46EUyCuVPZmW2I5PdcxuPO8C00Th3jQbWSAQ39W4OUSpZ28KH0trS1g8xb8QtLlbap6
         CcDHb+wkwLKlvmfGF1JEH0B87McQYvwoHx30+jCP9Bn+Ok9AAi3UJgwHCYb0tpl6Vjvu
         780OjXGjAHO/xdh5LDPOaCRiZ2PU0LeVwYlrxKzG2jePUYy9ZU4j3LGnjeo6oQFa0Ef7
         4roQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsiuraeoD3m271W6hK1W3WGQOBa156w8LgeRopt/zKP1IwBMTV2VheQUvg8KuSekV3jLF2o61zi410@vger.kernel.org
X-Gm-Message-State: AFuF++nq9HLFYOx0xbbVRqtB5jHCi5L70mcwx0Mu1K99J3y10jJST49T
	JNb+tjI3nhIBbcL+4Mw0MFljCytDrh4CfhFXiZtc/nIa82mik6XzJn1Y/Dglzqx2Nli70mbyDaA
	rl+2odggJxMkUha6Atw9sz0aYApF+pf0OeLVIzLeiXbQxDD2XZJ6ZBfFWLiCPlRPM
X-Gm-Gg: AYBFou2O30u0RTJZ1Z7PhvVdWIVZOJ+4xqZTyy0qzVd7BDvAHZojv/RUmPAkYmNsgsz
	YxtV7ZTymdK1OQwQi4AHc0eFEaRIueKuVXD0AJXrUuUZ1w1FwOfNJ4yIWTDQ0SMeDLYCHGopIAx
	L3zxug8NUe9ie7eGd7rr8K3SZsJ4vWLI8KzANaFr3+sdnB+5kIF3jObi21EQZJqXBC6jyJNl+IH
	Nx3JZwmrVmvwGTf1XF1K5aeEwPko+EvmfOguQRPdKjWqRPhkpr7NRt9+Qi6z5T79bvtpjuvDTnA
	RgDfH0X14zQPCh1i7e088Oi2G4KqmTtTv2m/1DXManLgPZn3dluowNb+FEpiDjnBVrqmgkarkfn
	Q1irpaPb949eM+RPRxeLMMCqDoHpE4oA=
X-Received: by 2002:a05:7300:8427:b0:334:2f5c:7c71 with SMTP id 5a478bee46e88-34003ea90bdmr4212623eec.33.1790315359298;
        Thu, 24 Sep 2026 22:49:19 -0700 (PDT)
X-Received: by 2002:a05:7300:8427:b0:334:2f5c:7c71 with SMTP id 5a478bee46e88-34003ea90bdmr4212565eec.33.1790315358318;
        Thu, 24 Sep 2026 22:49:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm4033640eec.13.2026.09.24.22.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:49:18 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:18:47 +0530
Subject: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
In-Reply-To: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790315331; l=1214;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QLwU7fKegSZgo7lckFiKBtN1ZL2aPp2XYB5oMQOrME8=;
 b=GmEpPaANJX5Rbq9h6qVoKL1Y9Z5DqvP0yTw3ry0S3pNLIgkkBoGmp1DvnWKweEA8hq9eRoF4i
 MGN5D6ID16RAFcN7R0Nuax6bTwsuplBO+rOdSFi/QbrQDiRqc+R6FbV
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: yiDsltl95_6-OIa8rc2pV9oJvdtQVIMM
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab60b60 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xYyVevvQUQiUFKtwU9sA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfX4S+nm2l++Etm
 ngyXo8MK8oiUoBv0ux0w8GwVAnIJlJXxX+WhG6a9LaW2g1TIfJUozEwfhnFdDieHnjwPniN2gs6
 rsZvrTHc12J9l65VeVMVZWwI/FAwnoyhG+FIdFn4NM/ktSEoTBUG1mKn8lP/bubm+64V+xftLUb
 DZukLp02ePt1ap7GsN7DohVX6Qa4GvIHSuID48/4A7Da6+N3Wl+QWS1bWS7ZJLm+/hyulQPgGhB
 n9B45/xlfzry5JK5BGhjYKWb2vhuNgUhSSUFDvcqPON8/UcEOrVsKsdU3dhxK087lUPenQiohYv
 GIdSuUYbiuSY22s3jBPVt8i/f1Dq2oQhj8oFHJw/Vy4PRfa3FdiZu9oAPqSJ1jCLyaAeCZhi6u6
 ajZMuI1PRiQp/e/8renUlRzWF6Dusr47F0yHhJOGnzvhlh78q0Hpahu5PyblW8rYRi5mevZ+lhm
 BSRn3CunAvOvS/Yt1Tw==
X-Proofpoint-ORIG-GUID: yiDsltl95_6-OIa8rc2pV9oJvdtQVIMM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfXwAVuM28TQt3m
 DuCkprXv3U3AjNLyBRoVEMzWGDSFfpJ3PtAN2ipk4ITLBQcH+8t6FVk7pgtmne+Tuj8Zcb7gXFO
 sUH/73G6t6gCPYN50rfo5bvaSJLe7Uk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250023

Glymur's camera subsystem hardware is a functional subset of X1E80100.
TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
three CSIPHY instances versus X1E80100's four.

qcom,x1e80100-camss is not used as a fallback compatible since it is
already claimed by its own binding schema, causing a duplicate
compatible warning in the DT schema checker.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

