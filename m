Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172896;
	b=1RIF7rmc4K9b5RqHpK9QVQAg2NQcyj5xz5RW5Hb4YDXDB/0wjFXqLM2EPTzJp4W3r67Z
	 4EM4RbqKn8kndgeXjOp8cU8NaXN/brL3Rlx1ffYIAvfcLnZG0U+JcGrJVLxP3RzWKIOHt
	 2JRYsLg5yMAVNXt8FocEg6/RdoibCY+yiUQ1aytHXbaPUZB7RQRUZx+EZqc+7ddojGVuz
	 0GdIipiAoukH/QUrYDl+KX8Vd5A7WcAInyXLC4U+ncBkxrPlb4x2kYbkWOWhHmHUmDSdc
	 /43FptyDY1e5GrCSn5xn1KZdEdHk9e7hgt0OLwJBdzcyFGDCk8RJDw/I3BodVtjDXhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
	b=a7j6S1rgasCdTWv0VViZx/hP/zZcSJirOw4ve2RSTg3ftxtF83M67JgbTzWBLgj13JAC
	 c4cB7QMAJHJMpb0O3x4HG9WhfCM900us2BZiFFelvqTCV86Eir7oDrQ55tQw4EJRpEhhO
	 uoQru0D3jdztlALMtt71UrEhR8DDmViqMK7FadMWE2/71eWm8RYuaUMKN6Rt3+xwlkCsD
	 ADWPE0SiOxZWQjLGLPofOIT5VzXxYYzNCQbHZKYoo2AXLj7IBlFjE0HEHYjPwljiHpFtC
	 opzceELLwyRIG6VfEny7Cz5oXNpiqiBh3b9O84uQvS8SIZqGSZkb6ri+P683WV71R+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Znk8sWI/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gR6otSh4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A429F60A3813
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A429F60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Znk8sWI/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gR6otSh4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjunB1168930
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=; b=Znk8sWI/Dw/wTngZ
	niNrsQsD7OA3RaAn7WIYdaEwsJv+qgi60YoGMTHMJnAAJyDcSIn7L1oquNF5ObtO
	DXt8BKUE7MRQKhVukiMOxKocV3dYhEaRFMhpfPl23d8JQ2eRe+Eaf6bDTfL/v2HT
	4c7hrHGbH9WXAm2r3urJ7wrhnYJYOOrfpLEfVdr02H+09ebcROjlGBxLI2DCMjVi
	4cFcZINqIMLLC1I1DDILX9K6LsrsoDsY50Qsmcf+MILF0lgUuIa12lkW8Ojd1mbD
	19243BK777MlIdjNJzLRWqL7u+/muGXsVa36TNudyE32aGu/K9hTlykz/PiLicZs
	RTzLPA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5ucyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so823477eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172894; x=1795777694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=gR6otSh4qgBqVmGH1cs1XUEMocPzJbIgtL4FrjfO3Hsw8Zd1H1hzwSqgQGFZYJC+X9
         PRAviKZvnY9OlqFts2GehozotgvyDwBBrXJN9rH7Nt591tNOVQa3+CnFb/vceBBd56Lg
         /cXZinad/HuAvkC0vBfTi9tcdS72ZuhiBW15sPLdvSKLMwlp3/EZFKwU7Q9+k+hQT3v5
         DyjFQXwOMIYuOrp6dYa/SRp9mIidAZI08xzCCqIHG7L3oKezsmuijsxYOG6SIAO0dNRE
         YtzUtqH/wJNfSXK8z8ftn5z9Des6yw6aXL8ydxFzCSuET8bdvs2c5Tslm2CDTPGrHnsW
         HuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172894; x=1795777694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=DuZYEVFChurRfKH9mZMsHASlnF4iac60KLfAKIqpyVbGMhIjy2RZvxPCTnj4Ze9+vl
         dodqfiqjf9Rw+Zb9GmPmkOWDCPnrkyNWxuIb3LROutBW6EO22k4K8hZDiAApJ0dxsaEW
         WulJEwUFuzsoRL0aET2GNpOvyBN8B3AXrGqSSAyUNqnWxM6OJkmHnQ3Nhcw2jjRfrg09
         Sl5qXpcaNfw21cP6ZD/buWvvJ3xrYY2IgZ9MgFfZ/8nMHPefmEeE7cSMEG9bB0btiIoT
         Y0wvBRFn1k2wh067cvMDbja1hvoLqp4fsX74h4YkIW1bGzSaUan1aw1EmSM6IDFywN+q
         7lAw==
X-Forwarded-Encrypted: i=1; AL+hErG5zqR0VVR3YBqFZXviu34HPQhON3gVpSuaiM3Y4LX7a0Mwr1gtBG8B5j1rf2yTqZcGGDrVWRv6rMpM@vger.kernel.org
X-Gm-Message-State: APuU4Z8wUsc4dEfWa6Bm/zCMDhq7RltMBTlvvNfgxjMbGw6GvekOn0Lw
	fve69mkKNW9hArVJ+Iz7tS3QAcIoLUGAZtys2EAnblW05pacDRoGKzU9zoyhBEYwjNoOaT4J5Ag
	g9R8cea2zNvWLf0UWnrB/XYmrKyiLggnuBGAD092bCFmOsRlXj23SqBeqVZ7691Vl
X-Gm-Gg: AZFdTZf0LTBHYKF7OQHudK2D3j8YA478yGUAb4TljWqKSrPE5QMGs4cC+pUYcCUQyLx
	wjN7AwzC0oFuhxFqetQIc1Uz+tkA8VFf93Qa6BrC73cGerL+EUcfvxv9xqRXrJvtImIsxrfoRlQ
	sSqFpTpcKwfv7MhjpEnF0OOgMGRc1RbL6AV5e4DpYPJG1ufEtbUcFrMJh0NSEkzSPMwLv0X0rFe
	F5hyu4CvMaUmmubDLlkXADsA7CyEcPCCw1YyMOX2Tu34oIcYXxuk0uMNXgwVJRLp5hbfpSnBTlU
	gyqqvxylupHx8P+9lZ/B70wwAmzzmeT1NmkiM2cHY/1UuclZFD2tVAFcjjbFqmKYYJdmUBM7qS4
	9KwuzqHSEFCG4eeSBK/MCl0aicQsqY1JPgkdH5njLe9060eOeVFSz12brDoczcgdSjP3nVfOIf8
	EmXb2I
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr1852860eec.0.1795172893407;
        Fri, 20 Nov 2026 03:08:13 -0800 (PST)
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr1852806eec.0.1795172892688;
        Fri, 20 Nov 2026 03:08:12 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:12 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:57 +0530
Subject: [PATCH v4 16/20] arm64: dts: qcom: kaanapali: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-16-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1086;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=VBW+lAkn36GDWfLSpCvNbA+g18nHUbQQFlmvho8wcKk=;
 b=3u5aWyWWqvX72lbjGg4IOeHiJFq52q50gfyaLIyAg+4JVQf3SFaLJL0WxkzSJ3PimsuLOiRnL
 cT0t8ho6a2oCiyszc8in30bpVfEtvHfZ6d2fNZiaDAJIgqRMW0zW3a3
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXx+f7QOnpRcEa
 U+mGEITJDVMzEBBs3kshRhWOq6jDvQ3SIEAKiWsYW66McImLOh7eYTDI6v0bXq2FncOMRHwJ2EP
 tYmfEJeJ/0stgZyH/58IATjZCNUox00=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX/v1QyLMz9Daf
 YNWRm7amIIzYPOD64UXrWPVTKB+yFZ2CXWHfvZ4T40uyxqSLl+6jMZUnZV9qGN64UxVcxx87hKj
 huaQK9mTaH6R9EQfUB3WIw8iyctXoyaGCDxUK2ABSnqJ8/rb2ExCtVm4Dvv+BkmWSeebpvGsI03
 yfGS6WmXWeYZQd07I69xVWsRX3uhUnZwHV9H42hezjwsPLQOh7YNl+85KpA8OxeJ9FNcIepMcIh
 gGZAXBEWXTYptq+wV3IWfTyO9KxvJsWYWG8vgQghoYhkOSyudfCV5AbDBc3bNr4j6lAACBu3ltR
 vUBWNvYMJQhee+FM0pItzSUuDU4aZ+kwfckc9ogpuae7Gi5uFOWbYl1ALtmwUBqcFLAecM+mUnc
 T/st5tXQgy9hXe1uwD36V7nVIVQ1O9iHmjjSs2K8afGFa9G7XaBRQt4NAOcIF/FueKY4Skcba83
 GbsrYpCghA1GS9XzEoQ==
X-Proofpoint-GUID: msA74QwkR2y033FScDhbsgewqWCpVNmB
X-Proofpoint-ORIG-GUID: msA74QwkR2y033FScDhbsgewqWCpVNmB
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b002a1e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iVAGZxyPhfMzDMBdamgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On Kaanapali the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9f04a5ad75f2..eccd5451e875 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2997,6 +2997,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_adsp: remoteproc@6800000 {

-- 
2.34.1

