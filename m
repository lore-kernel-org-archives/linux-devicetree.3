Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB603AF667
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352090; cv=none; b=gBTuI/7n8zghYtKLoQe91GiUX+6nVildhxdVFAQG71+xwA1JJ3nZHdTPabibmaRc28Sn/uZNPaGu+8bky4B+YmFmxfXmppTImRxErwnIujps1clA/VJPDF5ZzGfbtn3B3g0pLe8Kz/8zqPe3yMA1PPlDAxxG83d8J/WUj66jzLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352090; c=relaxed/simple;
	bh=INgF7j6jR9yVKd20w2sjPRmZeatBGZGecjWZbBa9840=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rxhzXCEIWRx7rgu5thpj1SQxnwg3v+vtBfy3wemQi9vkRTatOUwv5MEKNBEvvjClRy1YWaurKLwrzjjkk27FqwSQfo9zswNfXHQKAqcPr/DZdNS6iG9LBKbo7uazZ4gxt5jj1zp9MpT9WdjovXhrAzZgdpmY+sps5u91w7pkP+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xho4t1hD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7pJnpmN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xho4t1hD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7pJnpmN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A8qgwC1148979
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	greMutz1/ht9s5oH6M3SQjPD2TdtZtOnKHGsyOhbKk4=; b=Xho4t1hDO8apjZtF
	zc/C9sCUDeRV66S0Oo9w27/meAXpkdaroAdVbq8LGCu6Y+LxaIY7HnY6vF7tVZh4
	a/Tk9kJIc3hUAREzc58Lw989qDV3sBnl9MA9P3PMplFAE1/APstaK2pvrExWQi8E
	4AWfjwpW8t8cXLvc1ybiBObhdVwxBMSAVYPX5T6OSHXCkjS/Qc/QqasTMFOD2/wi
	JncU89XfcoE0zpnYNJ0iBsYUQ/8feuAcEU6zRJspEpB3FiGo01vA7J2cpBI71pF+
	TyoAPIDnNk7eq/LuHSZbtzHBvRU9sbT5QfeqrlRgMrVzjgqwMX12F94EybvoVYmY
	ch6KLw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh5809v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:54:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2918343a91.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786352087; x=1786956887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=greMutz1/ht9s5oH6M3SQjPD2TdtZtOnKHGsyOhbKk4=;
        b=e7pJnpmNqOai304NoDrdFm2TJQEe7oT7MrzG0/mbsjXSYfZjRhcL0kDfL44aUoSoDm
         BGn2ojPxmKIGK++dXapumGqgOzsl9AnG8kHGK7cUBBAfhOlVf4c86/KDLSqxG7GoAYzB
         oiYRT6kGANgOScUP8G/n5V5BJzyJhbwWIyhb1fsrJrRBIwwLXhJvZxXTnK8YtwT3HeeD
         AAWp8glQJ7u7kzWyfIIhX3CZfywlp85V7+DcIXmLlfQ4NKvInmWSjzvTrnk4jrX+/iZD
         RKWBH/aQqgMI4/rnV2+nm7eDuwLAhBCf8ACpoSmn69YHQxPLykqxkeDNB9ybvbepFqJd
         QCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786352087; x=1786956887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=greMutz1/ht9s5oH6M3SQjPD2TdtZtOnKHGsyOhbKk4=;
        b=sJY+iH+hotfpn1E1t9/dULHlrff2VmPR14FZk9TxthNiqDJuRpacUtNBwltstiP5D+
         jVdTEVsFXRgreXHWp0sjkdY7ppM/VrMqpRPLNQ9ydNdc4P9coFZbFo8LNtotR91F/Dso
         YMx++lkHyepawW4F0LU3Dh08qgkG8CZHFYnODQX4K3fdANtyKQZyl1aMcvM/858cvOrf
         +8VMDH7nQsN5MDUF3msip2GJkPXJT7iQq+ZR2n/bSclx7edJBaAxp1z3W6OcScyLzz4I
         OS6xs1w6pwp6Sfnv2mXCYOl7ljwV1Oa3lWd/8irTQDKZHCuu1Urhv/GIFZ1/PgmHe7xv
         W/9w==
X-Forwarded-Encrypted: i=1; AHgh+RohQCIee97UA3Fb5wYCOaOo1Sr77yjXhvuQiMM00ivt28+X1h/l5uBpct7suQP4GgIJuIFT1pAZ+Gmu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc4aNl0hEA6iwB1kx4LVThHPR7kmCutVYy8ApU2laKztrjzOEu
	Ndmt/yInBHbYKyC2iimcERKOA4CkGw85OLXuDdrRLXvH8FcVMmIfS+VXSIYISLoQxZ5Z0UGJFwj
	LW/y3OlaPCM0gtUIGm+0T9pimp8CghhQSWADCKaQ1L+qLUn97A7P1opsEwpKFMBjL
X-Gm-Gg: AR+sD10VJLEahFwXZXAQ+wOZGUdRSPXZyJ5Fxpi13BEd4uOvs0ictGgxb4VymsUmHmR
	cnlO6aVAyVpstPa4EcMQrzBt0aRTR+/RM5fajPOtPHUIYkgse9qidKBYap3rKVOmSQLlZPJqqq3
	JyrUfYJdy0eNKl6LROHcKpvu93P50zixnkw+/SHr7Ta/iyL//9SDrQgOEvpat+jky8zS4fsUaUk
	Koj4H/kRuYuxdgAUDKdQLj0RJYaCONdqrghNYJ1xnCCkpc9YpQgcucVQv26r4DDjyCAJqE+Ww5U
	Wg9dvVhOmOCJP+0NPyfnQDBRiAiM1V3SRF4oVwV9+2BPmtZSXKMx49e2cL1WL/PFfRkocVHS4iy
	L534WY5bdbsCc/wEBQyIFTG2iVMr9q1NJgmbVAoQPE99H5cknCcvH6nV7sFTifyOy
X-Received: by 2002:a17:90b:5845:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-392824a9a40mr19157853a91.14.1786352087278;
        Mon, 10 Aug 2026 01:54:47 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-392824a9a40mr19157801a91.14.1786352086832;
        Mon, 10 Aug 2026 01:54:46 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff69eabsm11840085a91.15.2026.08.10.01.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:54:46 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 01:54:36 -0700
Subject: [PATCH v6 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-b4-kalambo-crd-v6-5-744e8ad1dae9@oss.qualcomm.com>
References: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
In-Reply-To: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786352079; l=1205;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=INgF7j6jR9yVKd20w2sjPRmZeatBGZGecjWZbBa9840=;
 b=BVgPlo0Os4p3qq3KP9/faL+nMwLXfTG7moBulvkaFMLAYlghwzhdNa6mfR6RLVb4N/kztptx2
 /2Lm59BDxQiDOuas3DPXHPNKR7ddFDQa9mz/rfbd4ZgeArKDFkXjZDO
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7991d7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ZiPPdKFe465NvxhIqpciVj5_OQU0dQFD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfX4z0fUlurCOBc
 2fKUljq/qNdxp3DXHKXDVHq16a8Z1CNeIeTB9R1o7ogJ5f9nLyOAPH97zKDXEns3tH0TcaGfGjL
 KclJbJ/kp0f/NrsLLbPyH96cPLwYTuU=
X-Proofpoint-GUID: ZiPPdKFe465NvxhIqpciVj5_OQU0dQFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfX5I8/A4mLoUj2
 YI+XvkDY1Dz3KVavSxewwpPbkpyJpbBmD9D2loLH1GeKrezqyd0tCsiKGrkODD7i28fzxkr+ADP
 NNbHt8KkHcjgsIuVRas7+MrkudhCSbvBT1dGYRwRI5t8lLE6oIO2fOqZMUeayTQ4cYgi8TV3zWn
 ZRz1HbjWkGQb5Gm0KJUYmAeiovuYQYi8Z0ijqb2vtDDcnowEvnetLlBO5hbEH5itpfO1ZbjMwid
 YZJ8GBcusVSb3O6L3TmfVuAPz5Iml6ad5cNq0G5NeGoGhU9Ama+ZSrSWUKlqYDkAfVVsmLBrFwW
 LOVzllEdTJrnPPU0Zrr/lgrFzLxnwnD3TR4W/xVZKHkq56ZmruONpqkoak+1h9iW1yV3HdnNfP9
 yL84SJi2mo0jBsfjLN9XYEdekPiOCpdcR5Q/lgChZQ686LD8uHCT7YCBDUPtfAL7br5LJ9M8IOH
 1FMxxng+fXBEB+NtSyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100076

Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
compatible to the UBWC configuration table to enable support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 23901a4c51f7..9367ab5b3062 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -113,6 +113,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,eliza", .data = &ubwc_5_0_hbb15 },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
+	{ .compatible = "qcom,kalambo", .data = &glymur_data },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },

-- 
2.34.1

