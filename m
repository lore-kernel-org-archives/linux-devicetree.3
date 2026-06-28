Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F324330ACF6
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671091; cv=none; b=LoXUyC1vv0mF/HicdXKfdD+R1ADkkOWNXyGKGMo4MfxqBwVYoSY8me90C91hpHSr7O6FpUeDLjZyRETmizvZQknfzYx7YuOoEJav7UYaCFCK7EpiqZCn7wECxcsEGMWeZ5GEDeEB2+gJe+0jDmWmvVrUhLhSAKwbVwRV0LDXKpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671091; c=relaxed/simple;
	bh=PzLpTH0pbzRF9OZWwPiqESEYa/drXlg0Ml5pqQ2y7Tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXdWY5+5CiUW7b6JDNrenCYRxJL4tmdtqH0VcvrR67iO0yAJey5DbiuWIXEO1hBNjKqIGQiM3dBO9kiz0G571mEJHmSPNyYzbx0hOp/o7m6Gzw22rhKCCW6E20Tt8iYluBPgHESODUOC1R+ORpYTorDGgAeffMVdHayhlxNLwGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ilWAAZOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjfckiXG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ilWAAZOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjfckiXG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHjH4s445064
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9p3oCZzvqstazXxppdDmSZcGrd5rTD5PgWo89uABCs=; b=ilWAAZOfBhBzCFZb
	hQXPU2IHDPhZvPfe1PqWl8u9gK6zCsOvHAI8y+u9c9gtTG4jOQoJ4tpfm3sO6mEo
	xc30qaUKFlAz5+xqmZslKmMQCUEBN3yfMULQvChnGob2uZ8BBZ0EOkfLxgOjKiyZ
	UihblrL4LyigsylWQIX2SYXhLPcdo6Um4+Cu8JXfsZDJUb1CZEfQ+K+w63jU8tQv
	4FP2SNE87g6m7cFdAoQie1TWhOo4jgQN/++eGW+5+AADTpB7Ob2QEonVOFR8XTk5
	RmECGeVhcL+I7bioixGx3FOG3KFhWPR5ZPdbLBa5xwPcBVSmcGn9Mk0g35SJIhwr
	Jsg1bg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27083crg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 18:24:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bccca5620so3792661eec.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671089; x=1783275889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9p3oCZzvqstazXxppdDmSZcGrd5rTD5PgWo89uABCs=;
        b=cjfckiXG91LmJ338k/0EsZGpwcO11ABr2bpdHRaGnaCA7LiN73BcpQW/NMZAKnHX1K
         qnjLJGz3sS3FZ4rkh2CLj+KSQ2vl/E20BvoMtVCM5JYoM69m3WlnRxKm1iGVZETMsxpe
         8jHCf7jjqbQydhscsUwChvOUyDGD4RpWwfiAPnlyXsk18Uq5IbCZM4h3oCHV/fINWpTH
         wMpSnEkQTreZGXrVIWmhjwq7pe8/lyNDV2PnNutj9NjB4IcTk4kk4sqIKmWSgmyIwRRo
         Ac6Mdqae3iD/0M8HSCbYC4UKMUYONPALWoJMBLt2tLXP1Bi2ldMG0HoIVehLVhHPkIRh
         qUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671089; x=1783275889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9p3oCZzvqstazXxppdDmSZcGrd5rTD5PgWo89uABCs=;
        b=Mu7wmuRyiLrcKkN6E+fauklUnkkMWfxqXDIfnThhG1exrdWz0025e+ffjt3dMSrH/L
         I05tczSCQfvNakQN7OgEuZ5oO8WODlnML1F55JHI4oXg2ULVGXJdEWJuTHf5bXTuklHb
         74jheEVgOfXZDbi4SKRYeigLKDvCQ+tNOtTTppxL0Kf2r/2cGk442E2/qa/WZ2mftua4
         4/pQME3VGhfgCXPjUZQdkDwrkIN9Y0VYPyOG2YKnyffJtUBMi49xiHj3sHxMneeT5n1/
         5B2WKW3h3DFntPVwiEtXbBDop8Jsbt3mbBow8v92ODIjLCU690GI3F8VZqHG7t+L36vY
         3HKw==
X-Forwarded-Encrypted: i=1; AHgh+RrTqW/DqzxwgBfFCxnYy3yczpef9wbLmyeYUiB4+SPNbrzQS0T1sLOfnqiLLst/eWErfLiKS6CCB4AS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/r5Rs6wTAmm9qaQSAliIs2esQve6vBFl40vAioukOTsxSSMTj
	cl82d6Nxv77W0NQqCvbFeEZieqXam2o59LYdkIVt3IRe0E7QJ8ll8C4BkOLg0m3KuxYQGOGXFRq
	NyQUx7vElx+KpeC8YGPRzesAcRIcwi7QO9Gq0a3Ot6Lcc/Zgsiz/8uThSS+dd21zG
X-Gm-Gg: AfdE7ckdMvomBGH2pLH7qUtBPqlGWPj7vkwAEeIQg1YjE6WQoit9Hxc137bsDcZMTpm
	ZqaeGNAX53BnlupiH/tbPWtma5SuX3pTwh6YZ0JAu0oVF/ySDUz5QFbOXO9svmignqzlAQ+kjAW
	Nq/btdiiHWgfNW/dShaAmLLPzQCr4Vg0PzM+XMiE8nPAL+k9hZkJ7jiBywJhQSQQ0igN2Xq8QAz
	6fbP71Pm6d2wyk0e5Oiz/onhDa1euIC20BkNG2CibuGekDEJ4qD6i9iCRn4gRDpyN9/Op7Xapg1
	HZ01ODjgPhgcO8ym+aTZktrW67re3GmUm9Gc6UVlP1Et0Ad30La733uHoWFc9esrb42VitPOLcR
	OUeKdx9s9rRwP6jyQ4bFKdGPqj7xdssBUnAc=
X-Received: by 2002:a05:7301:6003:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30c84f77b05mr14159306eec.29.1782671088547;
        Sun, 28 Jun 2026 11:24:48 -0700 (PDT)
X-Received: by 2002:a05:7301:6003:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30c84f77b05mr14159282eec.29.1782671088092;
        Sun, 28 Jun 2026 11:24:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:56 +0530
Subject: [PATCH v3 3/8] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-3-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=1298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ab2FJciDIqw7/jxV1YWmBTVegZUhQ2SXaZRIypzuWaI=;
 b=DtAI8ypsLKBEX36oBYU18khootZJoi9iiNXb/fY1RbtwZTn86qyHcgIO51NjZJDUqackd5Lan
 UFQMxskGcxLBwd0K8GC7ROWRU2OWVZkcEAJqKGI7ITqTZV+Phs2p2eS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a4166f1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX9hdqHvzISgix
 SKZpYyo6YxBSMTOJHc0x5jK/F7vOc1PeY4aB8TIdEmOvbQFtHBVM+AH+MO3+UZ62ZFAjW5xcyCc
 FE/ryg2fFJvx9ulHLJnEmuks7qlB3U7qwOHkMDc8W3OO4HOk4HVsP8KrIlDh8BTKSbMvBR9rTfi
 CKn3GAv7sGj5kwa2s7FkC+nBG/o8I/ml3bZX+RNYZ9ZccwZgo4eJ11nbp2o4qusB9Kary12vgET
 vdTtUewSBi+Oppi1f0mkngQmQdEOFrI0wpm215r+4qBO1hMZel5RyTqjWQw500OgT6vAOnPkPKf
 tmrhw80IgwqQbHnOHwCj9iBM6X2WsDgrOlO+hfwgpBjpMkh1xwGdz3Y5zzdEyQJzPpy0Mw5S32D
 hSvgvYsz6WIwzeYyWToLEKgxWjfoCDzv8/nKSFp4U1gObOCJDUuZh4xvjiH6CQWMo0lztJcK5wG
 Jit7IkCTfzsqn7IghLQ==
X-Proofpoint-ORIG-GUID: r2c9LM4yQlCskht87dKxmdLJ3GDeUHAu
X-Proofpoint-GUID: r2c9LM4yQlCskht87dKxmdLJ3GDeUHAu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfXyMMetAT4OvBx
 cnotPsuPhVYvFn4bJhWWE67MJKHF7O0pKj05Q4gRVPxQmujsRD20GXg48q76xZHvg6lIru+kXn9
 qJC30WxMMm+xG8i8HCVEfof034zJKFY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606280165

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ad15fda5c25e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -108,6 +108,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
               - qcom,sm8150-smmu-500
@@ -543,6 +544,7 @@ allOf:
             - enum:
                 - qcom,milos-smmu-500
                 - qcom,sar2130p-smmu-500
+                - qcom,shikra-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500
                 - qcom,x1e80100-smmu-500

-- 
2.51.0

