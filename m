Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577149;
	b=ryf4at/FGQP674Ehi8YS46z6zPX5vzSg5bnVz8BDsC6QuvbUZKnAOMoGRr8CI6ebSbsk
	 GY8nS8UkOKrb8Dm19VuazfYrYmFYwwwgS3d9JEHLpznfVaEVSv9UquFbbbVDEaH9+8Rve
	 HkmzRYq6efHpJL59x3qlNtuZjDLx/vwNg9pI/asBqYa72rzYSnjNpkZCyorm1GGxuP07u
	 sfhfn8W2XfPs5K++DepoMgqqV0+AyrrF3O3b/mvbEPE5J3OWjOnVECQ/jyhHLS8tLDhpJ
	 9W2QVx+Ht320o5NEAnmZjDcb9ftmudIUfs8LKV4oHzVqyVc2imYwHynen+CI4Na6XDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=;
	b=3iRzNOMTrxSos5tL6Px3dPZdNymvagjXV58HF27QWYqbRq2QBNyt1ysDUG/mCRBfdTb8
	 dvGWmP/9e5BQC6hiO7ITQh31wkFAKYH7Rd4QMYcl17oDfYBFSIO8WlPjZCxjeqtPMGaTY
	 239KJrjzdBtqM26Rtd+RoSGBJlhrTt4cpm/aWfFT0dr24jdo4SnZySQz3qB8K0WbNO0qJ
	 iBVD5DqE2GeBwvSO7K4dGayZ8u126p0aTXGe0KFcoCVUZlPocgKHYSfDXb+oIdCPjkjV/
	 DfHiX9ST5MJC/7U36ivPF9YAIcTP0veroMlQeLxW8YQVgXEefPhwFGQW4mGX2WMNcFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=disey++d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hhnj4dgv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BAD606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50BAD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=disey++d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hhnj4dgv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2As643974136
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=; b=disey++dQOdh5OZp
	Oq4VJ08I7p7VCR9MX0DTRk9XRQSwk44yzOTh6QARQlpMtUBZwGovX33z1xOMWntq
	2z6hcTnzKfDJSWpj04ZH6sVVaxg5azsnZ9zhKHw68ZNqA7tA05CD12d7tkU7LLmE
	2kZqo/VwQeOVQ5NBT/9/d/3GCyvq/6tqcGGiNNsysXoOigxY3j3Gp9Wsan6eyDjD
	Pl+aFq0rSXtZ/SXt4+eJ5OPfyTharw5PDY6ndx2cLpJf3nO+u19lxtMF1merU5Hu
	ExhTjwpLG6wmHtMAGWXmE/C3COFWm8JDr2wg5lZ/TLkNsD+M52x5csOt7vyxvQRE
	w9Y1GQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rrgpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:25:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8c5408e418bso3751530b3a.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577148; x=1796181948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=;
        b=Hhnj4dgvNbMIK0LAs0Oh/XOACn++U00OD3fEVstyHcQQ/pFytKnhIdIB0o9qJ0eJ2K
         TFGI/oAJuWKjluNraPcIgRQ6WnuUA33BwXK3SHhEzsoblMnfXanVKAq2jJlSEXmPV8gc
         0aUMO2upMPSNuMpl47vXtNvudCupk3dg52TrxNA4h6U//3YmUOEXwFIUmHcK8+GIgnGQ
         JrioF8VPd/+vhOeuLkp/N83dKi9lpNL+PMG5mrS/k6RkRwD7ib4Qy8mHC6nMoZJ9pBb4
         2vBfDob+v+GErh/AUloDL55uXpzKpG6LcCIjUPmoaZ9F+W3s/BCXn2vLrIXnev91U1Ns
         pYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577148; x=1796181948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o40C1wtCttHNQxBfuq56N7Pfsx1mysz4Kk/KSVqukO8=;
        b=jviigGZMSfOE7iw1jWvtnPYqQNPkI+xPH3clyoE+O3ITwEyEqWThF9xWhs+5yIzB1U
         b67hlCduUB8EWUqegValR3J8TLT/o75kByzKFxr422W8KRpAibCVTnAk23pT2X96WaeG
         92oe3QRO38ZwCISNrkqoQlRO7PkoSG4iFqH/h/r2AxgKYT7FjleZ1mFRwNsIjJgTo8BF
         R1hcEDBMH4A9WrleRx5FKuLiPjlthFrDyLl8YImC2YI3+jOKEaYbRO9FuIRCC6ALkUnx
         lTlFNkqAXiEl5Ov68EGmStUzEPuLK6uYQQGJITzQPLioJ8NJfTeLOpJsrpydNUK0SzlW
         nItQ==
X-Forwarded-Encrypted: i=1; AL+hErEbH2IMVCCmlLu94t3z1N8o1lRCDFlU8O4HRWC6EbRWZrt5WlqOot6s/9+bSi8Nb6EXqJhdcgWNaM1J@vger.kernel.org
X-Gm-Message-State: APuU4Z/awYVdOU69BQwGeEv+buvKpt+s2srz4+6GvA/mjA4+Nz4k3NVY
	+NP6v9dUNocN0VE6ZiHduhtuvPUtYaDFpmVGrmaWhOPFP8KmXU36x1pKABB1wqztNBuhvWmjaxc
	IP0Xox5yWG9FeVmwxltok0kOnV+ujboHTy2FoVFGY06NP8JntNkFH1B6t/wmyK+2l
X-Gm-Gg: AZFdTZfoO9ik31Q1vuifr1wc/vWmpXrBkKZTZOb6XCfhwhmtGYdahffiGT9iauVLwiS
	vueCvQU6KKh2ePsBQSKtteE4a8d4qtR8xQzDxxpNXArCCQzVW9kNSpeJlYn2/Eniw7c1J0VAhQl
	glexInqvJxOsXHx09WRQFLOQ5YX7CCcoadxQRvcosfGaVLMTYfKEjl/WjhiGq3cYDtc2gG8yqql
	90iLJZ0yIiYEeRibRVkzLlyRGsH6hABuzhWzbdKp565CmYQawgMPP5lB0jvDCsQFjDGN7Cdy907
	Os7Ls9e8m0xFITU34j8iUTqp0tOkjUWkHpepCo7JySTjy1sXFmqrwoLo5ex5WF5OhVTbaW0NCsz
	hQ5H0Z9wq2NebkjHTwway8gdKKCoNbQs8kQ1iUk9PXK06QMySZMl1HbrEtuE3AtLAFelPz3RfAt
	4TGcLWRVE=
X-Received: by 2002:a05:6a20:3ca5:b0:3de:46cc:b641 with SMTP id adf61e73a8af0-401493a6d0emr21051789637.8.1795577147877;
        Tue, 24 Nov 2026 19:25:47 -0800 (PST)
X-Received: by 2002:a05:6a20:3ca5:b0:3de:46cc:b641 with SMTP id adf61e73a8af0-401493a6d0emr21051761637.8.1795577147412;
        Tue, 24 Nov 2026 19:25:47 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:47 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:16 +0530
Subject: [PATCH v12 9/9] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-glymur-v12-9-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=1036;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=DbPABSYVkpMlvsV5R4AOmReFgmMQAmLdU68WF9AOk7s=;
 b=1+q+G9l1KysEPxNfsT3JDoeLn4WSzohIQEvczL3tRSUJ2wuxSCNIIFZEg9yJPvbeW6cWOMwZv
 j29tQo5lDfrA+/fxKyUQtotFR9C/tob5keXfp/2MJdJx/iRFs6kiK1i
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfXwBCV+WEc6300
 87Kqw6z+nOwAbvoAsxu0vkGJ/pbzDtZOjOngY53XyMhCpNDFkslnQVhEH/yRp2mtJWZpeU7WzzL
 vn0DXdWEyKMcpTLZt/7L69AtjyuIdKVPjDmE+JqQA8Et5LlMQsJIUvMW0Xof/IvXvF+Knyx6UyH
 /pg0Wh+kfoHjRTsopIauE3ieV7qZ9A3xtri2rEZpUZ4+IXKk1zqxabfz2tPJgAi7+xV/ITgyF43
 pC5GicjWeeRZWEnzu5HLkJ9r+3p4c2l95p+7BufDLSK1VTr0E+PhzhKtFqp30JQioueGX6a5kCP
 shUE7VNcKfWu+5xk3F4rDcggxWuxiVqCeyBRUAVJ/SuPzqUatLGEWq85IrZpc8x2feiX3WfLXgT
 lIK26bwCfZmTRNRv2EdVUDeCOCo4Ps7bWOAQgq6JE4YCyo0zBndL8CPYOXZ3ZJf/DlG04vWCwpP
 TVPnnOIpaulDrDLQu0w==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06553c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AZ0k4gBlmfIc1QQ3fuQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: EK5AS3iGn3yRtpvjAODX_arSgEr_7PU3
X-Proofpoint-ORIG-GUID: EK5AS3iGn3yRtpvjAODX_arSgEr_7PU3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX8ygeypUVdRj4
 pVOHkRadQVOIW90HlC+FA6/JSwt5+ah0sMBU1mKCw+ibbI9qRvxhX+Cx5rQCNYMvFIJgOKGZLDN
 41zyPRiST0UpMtYsfJXVAIDsq5AHfJs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 3a9cd5f3ec2b..17947e7bd6d5 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -521,6 +521,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic45_default>;
 	pinctrl-names = "default";

-- 
2.34.1

