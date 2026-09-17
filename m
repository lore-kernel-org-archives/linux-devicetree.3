Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71914E13E9
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646140; cv=none; b=rO4E2BbkqUznm4kLqOUJkYYHfSa71zXy/tU2oz0ZQRX0fXYmKXFb4XF3Md2x8vPidj9fiJDn9zyedcyxQ8CwtmwPKzyMTzfBJoGh0UdaTEBxVzdy89hjrNYixZOGDuFpxeHezLWjxFZfCYyRrvSmdq5zxfXU3rz6gDgL4jdbdnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646140; c=relaxed/simple;
	bh=3UO+7i3bVMM+F/tEv/xBz6Ef+c3e3C4o9iDognI3z/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dWzsy21VcKiJ7JCtaEz0o46zgVPRn3m00RKSBRa/cEgc24nrUTGAEZyTf9/iVMzjmNqVRO2rMlueS02SMnhqpBVHdltRxShC4SIQA7bN9tGsOfWZPWgaAbq8I3FnSMOJNzUmD/OXQbmFCdBLTrc4ol53sf5//JcXY4WcHsWnY1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aj5iYwrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6X19oeN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aj5iYwrb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6X19oeN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zt7D1390184
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=; b=aj5iYwrbJT5InyMb
	S4FStayXNOWDoZnW8TWKshf6F2YJOi6CmORaZrMaMiHWkFfO6jWL03EsA2NGElFX
	f7TY8IxaSsdfUVM7Hl87IJCzAZ7ZfzODSfG6rUp18qD40cFpbvIYwEF0sIUCUX+V
	vFIgL5CdOYFMC0KfYb9qhlvgihfVlcXK8Lj/UBrX4xq/8d83YxrMv2eWCN7frEgN
	r/o7ofg4lTOHlmz/XaFuwT3wRTaFdIh8cVhXpThVZzB+/Ssoy2WOOVfifmug8MMh
	3d+GWvL2JeKTMqYn8ToWavwSIVLndy3V2HTY4xzbaJsnHH//r53bnRUdlgY0VGuw
	nzhE4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d47tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1110272a91.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646124; x=1790250924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=;
        b=F6X19oeNug5fpPXQgNlfYz6CPmZbLoLZRQyZiNVIMcgiPY8USnnNRjvtx4Qq6+3Qv6
         mJ0uH4w5uQ2DVZC/dfZXLH28ebxis9D9Fp20ydnng/7c8yHSAsoBUeoSKF5u6h8nxZkt
         zDJmncjUNnnG4gEUvLdAkJmIJ29kJ2ACfnoPC227aW/1HeE8Zj9hafDFr5vM19e/y7yJ
         IwM+SjQqNzWBc/bPUsylrXK5Asq0zcu2GlcHC2dQ6WOORrGa69OhKLCViCwyoWWLYV9h
         ERsNnldg50e/a5S31DL9KF3UfxB9cEfO8BP40iB7iPOsMu+aDFGSULS1ULXV2S29E9tv
         3efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646124; x=1790250924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=;
        b=eL7fleWMFv8Ybou7mjM9Nybl9GodhodlUN+CRogXqaz1mZnrynKuNnmUElpua6C6tn
         EHq3FW2kZ9/PfZKx6TMXgvD++lFzXy+alCyKgKzPPYmJyxUpcdv7NrA+LL4QHKcjdnWq
         xdJfFKcWd1IW3bQb7Hr5NyZQKeXTTp4t0rHPM/yYWji6WYHi/yCfd/eM9wW5N8Th8ZIk
         n++nQbcnsI8hhNxDwhGl85nnkxI1hSotTcSGFe7YnJCWu63M7m/pIeJkiuwBf82sFA08
         wTTIh8Y3J9GmYaUL+BpRnKXohuDZs5uFrQPjYOrofqdOvnMBDk9RmjPkLOr6WBzj4h6x
         XTRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuLinT6XJLHHCX3okaEIF5gj9Tg2nolycmbv99o/UIWM8zL2/Jgo8VS1Mv2y0vEL+mWXOAgP2Pfqw5@vger.kernel.org
X-Gm-Message-State: AFuF++mVmr4IILKbZTCaZycsYqxwVh+NLho7aNsagllsSgm+G5TD9Q2y
	mPEnklZ3P91hj6Ex521N36E+V0dewn2KUWnwUbe4y0l4E5b8HACVp9NGM5D7MBh1fynbpXjGGD/
	B+NoUr0uZZ0pTQGbIQO1Vp2dhRv+03kY7tWINGCDLpx1XckSAW1KSEM+wKiArixK9WWhEbC/8
X-Gm-Gg: AYBFou0Y7Y1D28nH/sKQ9w8K6mB9fD3A9tbz0doEy+NDrpcqLt7AWa8Bm6tSRf4MLrI
	ZPvyBgbU7dEtXmF1oc/LJn7vk76eyvnpSO9nSLI52DZfBBbLqAG5/rmI23onP0t3bV8Dn4xAKWW
	4w/cXDN7CqOXjjhjiczkdnyA5SDFFBtDMXMuiNQKrs4quRMEzF9zdYDF1ZKcrXaAPfhMgbYlAE3
	ggNgm2zVhgDX66RiiO6iYU02xiSExIPYlbyPLlv9vvj7h4L2fdP2EffC0nnhQA+9ko/HpKrrJkN
	wbpiXYzbCpWdPAE6Lm88TwOQbsqomz++54RjVTeOjeVva3I/VFmfuAfdfNdoCErbtjItxOktE1N
	JfbUr1zOLUytKsF/b25/bAjqmRRCvoX3g/g==
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e1e324463mr21988771a91.10.1789646124340;
        Thu, 17 Sep 2026 04:55:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e1e324463mr21988636a91.10.1789646123700;
        Thu, 17 Sep 2026 04:55:23 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:23 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:20 +0530
Subject: [PATCH v2 12/18] arm64: dts: qcom: kaanapali: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-12-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=933;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3UO+7i3bVMM+F/tEv/xBz6Ef+c3e3C4o9iDognI3z/I=;
 b=u+BLxxMOlJ7ECpdh06aQcLMRLS+92yOFFdrZAV3wlY1eCZwlJYhFKOu4PN3tg2k/saHs0ZRno
 Z92NVXuWgcpD3jF0KWF2OOdrv9hwVzwcsaTv8H3heV8g/Y3fVk0Kn6p
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: d7hED47sESTtioPAvRv_0K8owzTjRAYW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX61TtV6i8Zs3I
 ff+wbfLp15PrwCLSTooGpuMXCbddvIvcg05DTzLEkRi2MJPfxZfHXjDxr8ABH2mrZuNPpJiCdli
 G85JwXg6CG2kRVufpzmFFI0U7mPvJtw=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabd52c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: d7hED47sESTtioPAvRv_0K8owzTjRAYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX58I068pe87GR
 9UyIDjJuyzsakQ9RfjsdCJdd9vqX4dmZ+ppMx/4OO8TEYDS3dbvRvuIqorURdEvUo7FtaEkGYKo
 zKV2v9t/A38kzUuOq3njiF+/WhX+XZLl+HPm2bF2PXIrp3CJERCfAWuwHQazemRkp5i+Qz50vpo
 2/P/lYq9/3WUnvsMFb58Fe1QXj9d17i6Aj9NIs3u37+8SC3koVtT2JoujZ5AT7wBp9xFPdPnlT1
 W/SA5d+4d2n31xNLq6wQHo76tN+5oFseErh6Vx0t+kCJuKQzh5k8ubXq7qsaRePAkvNcWABYHTJ
 ZXoC5SHIWb2BnJNyLxrYRV055hVCaExg/dMss+hb1XVKojQB5WycSrHm1tXkU4/XJVn79PwuN22
 104i/D6SaYLEstb/K3JYebkazr617XqstV+YLX5pGcoR9Q+Onr9l9Hf7QonnOCyeD7FrvutSStW
 KC6w5WLxGedXIwCDDYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 6d817381bb37..83c4f93a654a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -976,7 +976,7 @@ &pcie0_phy {
 };
 
 &pcie_port0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1

