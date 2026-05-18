Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFF6494A1B
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123257; cv=none; b=F4cGpF59TMZHs3DxZtogLoGCrDnSySy5CCKzNX23mvqQgQFzgBTjZXHycYsGer97DhY0inkxMBMSnXGCoXg1NHC989/MLsh8MzHKH2NwUwHTR4KiiI9yB+UTOehezCcE3uZ+OzC2rABUFKoSD9wpCthcgYNjzaOA7C7DYKwFO/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123257; c=relaxed/simple;
	bh=VNEhOKBhobQqQsoEuqNm9mT3JANz2GEoOzRTHnEsEfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BERohYfsaZKhqkX4z3zH/84S9XUuWQC2ozae9I/VNo8gloTSnUbhF8tcafmVIsMiNbcszS+DaNbgKf2YtmNJccK0RHKam0KGDQEaDK48s/XjNurJczQeFVoGEmrR9LweEoate3InDvaARsHgzEWT0unhLy0DdUbjjw+3zO4QfQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxFBqabT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4Ghzzlh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxFBqabT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4Ghzzlh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IGSM7U2091041
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqhBDm7fYqu
	6MvZpBtGOglNbnbUjw4oExZ0wnZT6Ids=; b=UxFBqabTecW5vlb0rcdi4JEnZdY
	S2KzrNM3MalVdZP+7TvZsnJ6P7DFYCPv1fpY1NLr1BPBXRANhXP7v10aadNWe8Ej
	xv9X78RGLQ+xtuIG4ay6gR5TqYsMQpruf5ax4UEF8XO9bgQy1ldytPcJdJoLrHXh
	3a46lG/I30HxLo4bQBr0Ta6nrFzZ7jRoqW0pNV5V1cXT1rleZB28dyy7s5VcD5bR
	qbdkiouMHpduyyAFmMV/or7DEopALCJY4DYUa2JOPWFdVkHv+gA7hNa6dMH2wuTD
	Fr0AzlCS9wwTex20pF1ViOLe7sPFC9gVsH4Ed9m9NPbtLpCsaCAjXQHLxiw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rphkkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:54:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd6aeb3637so66601065ad.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779123252; x=1779728052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqhBDm7fYqu6MvZpBtGOglNbnbUjw4oExZ0wnZT6Ids=;
        b=N4GhzzlhAwB6y+o2Yb6SfVAZb7y0jsE+gHITUoiIIHbL+MjiE7tnX7+Mnqjx5XUlRh
         lyExfMYMJ4CYXuGKVXuUG6huf5jyIvW0so0UQu15SkE/OmEoQEPlVcPv09ECP2jSta7d
         vaCe7/Sr8WY2W+cwSmrKdQYpCnFZaR1FAZDnXcqBINuk1atg8Dit1kQQ9Zv3Q8nhdNVE
         1A6CjMvytW2Zv/RqtqGQh0PdJ/Iv3HFlmMFisjVVmN8wIcVKTBXiYPDnpUVyp5asD8tm
         fp5z6+dtLXi49YMzGO4yU1WiaNcUC5WvpYfE3H7/6JobaYgQoXijMQD+37iBEH88sRrw
         nbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123252; x=1779728052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqhBDm7fYqu6MvZpBtGOglNbnbUjw4oExZ0wnZT6Ids=;
        b=ek0pXuhoicx2lKlPKeejwYPYLBtxbA5Qd8Oj3OqQbM0QD1S5JXQx+4n8ilO817NKaH
         OYdFimviSu813wjJpMz6oRmlj6CxFtOfGLwi9erJy3BeZ2ZKvduxxvusIkONCRA2kp2D
         Qu0PVkNi4oeSy/yoRUR/crmU19vvZEw7qwMteGG2z7gAqSHdcVVaqKtk1i6xQk83E7RM
         fxz1f7krNAph8GwPCgeVvhvqvj4epPtpcGFRYrXdxcfwxA9PtWD7G4emiR6dAPmjxR7U
         b3eBrb9DFHR2JpTvkh6Rp9ctp3NDN90OyttAfIdkacUaGtsCwb2uAibjw54dgrdKkcIy
         rD6w==
X-Forwarded-Encrypted: i=1; AFNElJ8BVwfAr8s1Y5fe4ceZbf9MA9R2TOl3X0UGtVHJjKR6VXoHFG5ONgfDzK+P7IQaQ5KZFU4zXoinHDdq@vger.kernel.org
X-Gm-Message-State: AOJu0YwtYkHn+ompaPOA8Ey+6MxQ9tuQG9bew4FyGN65wzV2oH8byqGm
	ELdFIdpVh0brkPhDc1QoqauNc0y1z5tR8NvS7/XP57Gpaakmrr4/1sUTNNlNNREES1DP5jO1yoD
	TTL4SLHg63j0ZreY0LB4v8+rjCAxejHHg5v3hMxQwuNLPqghKX7q8KVFWkPKt3xlw
X-Gm-Gg: Acq92OHwgqWvH+zm4ye0fiNlv/aTD3P0gQsm9nrY10GklN+S0+RJy9Kyb2USaRVQxpC
	MtETE83R4pgsWL1arAxjCM1hrmyQCB6mVByf9a0qaSidy+44OtFmotfkefKNnNvbgkW/WUenV37
	YgwHxLSLTlS1+EOPUhfYHl7QiH64hKbAM13ZIXHWfmoMck81CG7xvGLdxM1TfowwfzV/OoJZv+1
	aFFi9JZjWWM+w2sUlhuWOMXp+d63AMwmGqNNgY+Pjlzfi7C1NQg7pPZXmauDeoqjxJ54TJUBLto
	zzqL9D+KVxd4GXWLQrrTgQr5C4o/tyonjP2D3bySgqQhGySTEPzDUyTPmKVYUKcxbtWLBQNmN4A
	7Vt99NYJ/Ogx+6MWu56r3wZDoYYaJuSxD+A3QnUi/qvKsW3lWc/+R7A==
X-Received: by 2002:a17:903:8c4:b0:2bd:8fc0:1198 with SMTP id d9443c01a7336-2bd8fc01303mr150907295ad.5.1779123252200;
        Mon, 18 May 2026 09:54:12 -0700 (PDT)
X-Received: by 2002:a17:903:8c4:b0:2bd:8fc0:1198 with SMTP id d9443c01a7336-2bd8fc01303mr150906935ad.5.1779123251728;
        Mon, 18 May 2026 09:54:11 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc47sm149971045ad.10.2026.05.18.09.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:54:11 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V1 2/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document the Hawi UFS controller
Date: Mon, 18 May 2026 22:23:45 +0530
Message-Id: <20260518165346.1732548-3-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518165346.1732548-1-palash.kambar@oss.qualcomm.com>
References: <20260518165346.1732548-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ys6fGTvqSV4FpSe8ByS3ZsUYAFN4T8IO
X-Proofpoint-ORIG-GUID: Ys6fGTvqSV4FpSe8ByS3ZsUYAFN4T8IO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NiBTYWx0ZWRfXyEQBsK2Ylakl
 5mEZ81L0UvXNIFSUG5efxpRbulz382IePBqlyPBdDKz9QL6JPIRxhhFtbXBt0gLIfN+F9eqZ0az
 pqibdYiELm48OFQZtVDx4wyGVy86RU48PEiQB3sYSsxanBWVPj+G5tfrJKugZEIFJEstXbU5IXt
 t/T7yk9BnahyPhrdbCT72ZlFZpx04R9gM8XZH8aZsMRx0jjhDF3eaITQDdvVqmV2ImHszT7Tz+G
 nA/Ptw+G73tGyr3Dm60Q3+DPDJzrPrYblI4trusSQF1CLsVIHLbdTXHv0wgs2kN80jdn9NXez6O
 ke85IUUFNh6l/1QmnrbEZG6BlrSrNCvDH+OphfAaeXH5JUvO5LpduLVTgBedhyDqwLeYtQTgDrg
 XyVTDJC6TRpDUiRAr8T4lHWKOK3bcTBM46HNEBkM2P3Vgcz9T5tC8Cbdm0nmAp9hkRfVQSLFNe7
 zeg2+pF2k5u9TRorsUQ==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0b4435 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=dkR0I6OD3irOzcp_LXMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180166

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document the UFS Controller on the Hawi Platform.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index f28641c6e68f..3de00affa4c6 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
@@ -27,6 +28,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
-- 
2.34.1

