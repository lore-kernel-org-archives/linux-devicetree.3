Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182152;
	b=A6HyzaggiWETmfGG+03flfHaX73JgvjQQEEHkQhgpp0kYFgM82tj5v3xwwW9GghtTcEu
	 LED4SCtXARQwn9zVIdwQxjzJcGdjgEd70NdR098iaGdCjcxeMHKwzF8qKofbE4KHp2H9v
	 pbOKeRWAtEVLl1IepoDITVbua3pdSQuxd9Ku43W5IshxMmlan0+9NDvOu1X4WXoXcnNqi
	 7Hub0O8FBm9AkwFs0FjFjVLV3tCkfwGnpz60Y4FPwp640XT6syMJJ04zhiVF5MA8xOtDP
	 /vJDx7hrYXJSgho2nR8Xnzksb15+zvbU4kYqmNp1xqRSlXkpIitCl7XSIcAscYuvGkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
	b=mi4JGEqaq8yJpw4hWdb4jj/zlgxdlpvkEVki6i57YO4s0u+iZhLFYM9fCFBabHowoLgK
	 1VQvxmvJgzICVFIuw/wbdi32aUTDDLTDsbDAaqp0285ZBvsuqSGJnN+8g2g0UXM0QDw2b
	 5+MELGwDAAGpiEj2X6VrPVFoM3W/tnteFeh1DbRMJvqQobqVoeVwn64ayl5Na+WXvP2+H
	 u5xePrW/fS/Q73OGETou190BiHhQKOO7XTnB8Py+TstFNErx3/THJm6nzzd0jxsiMpmcN
	 wtztb1Uz9BHf2cQkNqWJh4q/tjuxxyNshmBW7YHmyJTiYBE5jeN8Iu8CpprVUkkR9EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=migPxDrT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X/yyxIlB";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4E5606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B4E5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=migPxDrT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X/yyxIlB
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkCRq1017053
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=; b=migPxDrTTyI6/FTy
	q28lmrP8ETqeT+SpI3zFUxhTOKhYcOYH1iNE/nOtgiQaNI+zolAkn7DTpXIgKxUl
	0OHhQhiX7xD1ve6vx5arZc78eFX2Kw5RUktAGYOf4ha0ADCWa8gCz6ucKEiIp2V9
	XsF9r4TEJEAjX9xKFLCdZgxk/IA4M4Tc5LMSE0DnEZDVY4w1L1VBLa4ugkjV3U3r
	+ix1/Srndu3GB5+bcNaSD4H2gXPMeNzNsGBZbyK++ceruNaGCgPK65Jn69UU6M6p
	FyW4MrM5bQ+UNW42r2eBg60FG6V3hE1uRO4oV3frvrZ/HXSUYCVkGjNf8W6Pft8x
	3RV/OQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqst0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383f2d05c73so2789552eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182151; x=1795786951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=X/yyxIlB4o8SAXzhULwXpIDKlgT8jiX7SviTYapf4hBxd92SolLgFJkjwELbmvzq6P
         Dn0uFj8DnyQmFSgAEP8GuwgXLn2VJApKo1dorNryv8n5O5FnxdxgKmTc+tYiVEOgpOor
         UgpWoBmqn8zv45TDDGwv+7wiF3+O3SxWksJiKGcNfE4YDdnno5Dw5mkyjue022yZwxF9
         3cCfzY/bY0ZFGCS0uB8mlPX4omeWx576wucMQhvR1LE7cfo1BVmCdlOP5eQzm6Snxtw5
         8sKCBSW1Cf+cjhKEtKunmEG8jzqphumne/Im/K1XoTyDRdVgt0XVeD8Busj1IFGt5NeM
         zngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182151; x=1795786951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=g/ArE47qIsN9Q/+a0YDsiqew2jCZNqDcLlER6jkY6httfmQ8BPpCHnlTlGEROKTyku
         KZYQvusPIWSO69amRxLK5m76Pf1zNbQ8WU+WkUUCPqukxQnKvgY9Cv7W6McWruMbQI5J
         Zzc6E6qeQGiYwCgMD4NDSOpfohrvMsldWjUd8hUzgR4osuCY+jCLfVn8ml20k3/L8b4R
         a8QEkUM6cTN9rKKnDkgY8I19AxLkAbL22EPFJK251wAj+prZwmgumWQyQ5EsE/+k5MCj
         vqLiayIupbKIFstQzUicMSPZGAoKsHqHEFK0xlPwWkzmL1GbQPBSYuLcekdX85mBAdML
         XOuw==
X-Forwarded-Encrypted: i=1; AL+hErG5R2fws5ra4mMPVOh/IGV7GlpsF2/hIqKEqOKghPp2EBo82bVshjA5q6De6edXNnvBEsKFLTQ4qPjX@vger.kernel.org
X-Gm-Message-State: APuU4Z9DWp+qv0lYjDPPSYRFAKGBfJtF8pNo8EqaFBIAIqVza9yYLyss
	A1BzBczurTfUKJtSSc1fJ8ib/R4BgMd6Bc8dSWV7hN1+2RNmF0DH5lcNVfS5gbGOWkICDL9fRwa
	3iUwZNnkOwqrK8xLqk2jWJF0ILGNHc2PUnmaww2ozz0u1prK/BNJZEvz1lN8EyZXk
X-Gm-Gg: AZFdTZeKXPfqrfYrxlOM3AcMo/Ff4gPu4LDkjSkOAKxeKg2x1KtRl+u+8Um1mS/oLSG
	tQMZOYFPvbEk4Qmd2qmvDjgESVj2KZEguE3infhgTlXC388Sfbcb2gn2qFaVIhChemgeg8bEkGx
	uwiSN1ZVt6ysm0n9+1DuxD3Z0zMmnjbycphWEICqI6q6pM9qXL5hg0W0e0JTsCoMiZisvozW9+c
	GxDIbtrPG51nDtYyKNnmxqlxWbqsJYXt4j9oORQQWg9a8lCzV81KJrxXLjpxGtijeuqUCjPhffm
	gyTTJvisiWqHDx4l2DwyFM6Ag2cA7PSYTGRVgKHzDjnt5wH7LAESI18FVFx/Z6g9hxnXsGyIDi3
	xtfiJ4JwJtpcxKJb0/6HXOkOkCc/dnlTkq6iF0Bw9SeZSRUbOrZsuzwd9p3YQEiIT0pesesjTi8
	G7NFY=
X-Received: by 2002:a05:7300:e9d6:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-3856fd5b5e6mr3290397eec.8.1795182150845;
        Fri, 20 Nov 2026 05:42:30 -0800 (PST)
X-Received: by 2002:a05:7300:e9d6:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-3856fd5b5e6mr3290338eec.8.1795182150128;
        Fri, 20 Nov 2026 05:42:30 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:29 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:32 +0530
Subject: [PATCH RESEND v4 01/20] dt-bindings: iommu: arm,smmu: Document
 interconnects property
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
Message-Id: <20261120-smmu_interconnect_addition-v4-1-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=2417;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=L9ZDNV193MgcYYJuTHrN/Rk+LSdrA3XbSL8eIPKsLAM=;
 b=uY0Iae8oylJJB78xRp2RW53OaW97KnbRp1z7xWSKIKHPzU5GnoAeMZpdTPtMbwabSwKL6rJ38
 UUwBSOaoeG7C5EEzLSzPvYavoSyymBGzMhXJ24sUJHfdnpandMTpHnA
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXziPiSFAkc62a
 6IL939FoNuGRw2++qwuqpkt7QpZYbHvVdn94dtJzgMlxaEtB4xnAw5Q7uwxWZlVu88cUxtDsT4K
 WZXQ7AwyPv8bNZEGRhljd8cbXGip95sX0cMTRociQ3fVSkrjastth5ch1qQoCLkucnCeFLHfqxE
 hpjragMuajiLG0bl3iWk3Y/JB0twVD7Z6Fm1xK9Dn6Lu4ti5lgKD6kVTdrt2341BNO8pFWtL53D
 wDGcSho0kDDGczV62lNz3D7UXX/1gqIUl3eKqrfxS4Q2600jGIu48N0GqXuGRqET4HUtiIzDA3s
 gMShtPne4VlJtoVTfGeq1sbrOPqX//79vYFcOvSXzvxKPpngMP0rHPLl6SeTxbkbMFMRemWalRf
 Q2YGFFQCwpTFR4g5MEHlDcp3tY5JeqwkBrwYOWCYugTxfG+qRmfV62ITdOd8XtnvfoiN4NjocQs
 5Ebyoe8IQQtbeKsO11Q==
X-Proofpoint-GUID: 0Pr_pFeTDa36KMuaIrcd3XKku-0jV2qw
X-Proofpoint-ORIG-GUID: 0Pr_pFeTDa36KMuaIrcd3XKku-0jV2qw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXwC0RucNb//3z
 fG2weiYImEQXXTiOWsDHYtNmjMc2ygGjU6u0cJ5HepKgimiAhYaoOgNQnZ2V0XEPkANGqP7oHCV
 mHoaqHhj1pZcZV+yU7yGa0oR1VMTnSo=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004e47 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LIGS1bie0qojq0S7pNEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On Qualcomm platforms using the ARM MMU-500 (qcom,smmu-500) as the
adreno SMMU, starting from SM8150 (Snapdragon 855), an active
bandwidth vote is required on the interconnect path before the SMMU
register space is accessible.

On these platforms the GPU TCU is a separate hardware block with its
own AXI master port (alm_gpu_tcu) on GEM_NOC, independent of the GPU
rendering data ports. This means the TCU can be active during wakeup
while the GPU data path is idle, leaving GEM_NOC without any other
voter and causing intermittent SMMU register access failures.

On earlier platforms using QSMMU (SMMU-v2) the TCU is integrated
inside the SMMU block and shares the GPU data AXI port, so no
independent vote is required.

Add the optional 'interconnects' property and allow it for all
qcom,smmu-500 + qcom,adreno-smmu combinations.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..ec0fc5f7d4fd 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -252,6 +252,13 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path to the SMMU register space. Required on SoCs
+      where the SMMU registers are only accessible after a bandwidth
+      vote has been placed on the interconnect fabric.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -656,6 +663,24 @@ allOf:
         clock-names: false
         clocks: false
 
+  - if:
+      allOf:
+        - properties:
+            compatible:
+              contains:
+                const: qcom,smmu-500
+        - properties:
+            compatible:
+              contains:
+                const: qcom,adreno-smmu
+    then:
+      properties:
+        interconnects:
+          maxItems: 1
+    else:
+      properties:
+        interconnects: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1

