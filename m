Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EB14E80CD
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788911; cv=none; b=hz6+nefAppRH86/WPdi3P263mSdL6GddnjRLfMQagFImqR6nAUWBWe69kzgEdTpKjPurgCfh4Q/PZlBG/EkgURbryrhLe7MKOQu6yOgt9R+4PUZJUmkvj9UojILsGKbmgWHXhsvl+G9KtjbIVo8s2hNoDcACAbFJ0jJ1/uuvEgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788911; c=relaxed/simple;
	bh=SevN/h5S6DPgIuqMF/YDcs3elkEIxRkJIUzLiwNvHUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2r5z9CaPL8cktXx004yWVOxEysPiWrIHHbu5cFnb7AL6l6qRV3q4QJExZCTWLR0vdJhhyysyYLh5DGQtKTlVGVn6ycrsopeGRdoAdHZ3kg233awEVxuLnURk/XMtmOvZmzuEi3Avsj2l6rapBFAwrdIH9j7eFeWKLgVonSXKtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTQ8IVwa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdK522E0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTQ8IVwa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdK522E0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdKdJ3723705
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=; b=aTQ8IVwav7WBOWsg
	ABzkUGrkJ/Dalckixx7L5N2i5f8US8Ghejb80zi8gRwxB8n06P7vsdKwNoGD0IPc
	RGriEEGl5TFa2GBaK6IhmyXj5sMql6U56Oi2Xbj21Yu+VWsIPoyFV++xIHa/fpxm
	wln8eAr95R5lvj1/HCbTXbvL/JqGn6EyGVyl9JuhuKZ+w07czrLsiUIRzV6ApoUA
	e5kjdOctSPPRljBf+AajKRd1W91K/UnyxaOuapZCZ404hcGY8blvjx2YTMnctKx2
	23Q59KHcFR/NF61AP9ntY/8KdGeNtt4PXkGA1qiJzA+5wGhljiM1bLuUCgIihyvc
	oCIW4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx11dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:48:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so4323352a91.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788903; x=1789393703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=;
        b=JdK522E0DdyZeY3VHJOx4XKjiOqjN4UI5RHnYp6dUdJeNN8i7alT9lpFslHDIhnnHI
         K8nK7OT0dvGqf//3VyERMunt1RFwhP6kZDVu4Vpch5VxyNmzVeu+hSy6FtOCeKT0er7J
         DPxN/WLOr4+koDY4jFb1YIIPei6XZ+MQYyINifRzlIV5b3dvfJKN7ip3xz77ywNEdAUE
         /V+w2pMQZlIq75lx1qQsAmvJUA5j0Eqzzta92sqKWFqdgwd1h//xc3SUfRWocmc+Pa23
         xF9IsPRVSPm6TKnN2d4PtKrrXC67W4Ed8QVcDT8z2PL7HXpLZVcHxx3RhBcpgvWA/8NT
         6mpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788903; x=1789393703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=;
        b=hTjoPpCha/bVt0EQAde2e3LGl2pNNOCBtq6FrdVO7NzqgdAHG8xn6Wn+r6A7/XtD+U
         5RHvlbJ77adkz0HR89cLhPZDJlwd5Mir4G3oAfdt5iqL30VmvjCzgPFtEUpge7ZsGBmy
         FiRYv7AHodylnt/Aa32DmmHe+DAZRS4RcGS5mk6P9otyvwBHoKE/XRm26EoJFz/68Dxl
         1x7gqm88WKIhGkt8yncRtmROz+i4KB5B76+6J4FDT5/t3AgZkxGLJ6nqGufkIUyyYyN+
         /itA8sjdR0axqbOmBBwkG7PaOFJZm0VuzkvZQlD8Oc9y9/WF8Zr5CTLVBhR+1eozDx29
         ksfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH/V7YclAYgUsEHTRRy8pfzcSladxWL8/f1yGKkD3bkE+JX5RznkdYQEYIq5MTXOcaTbI3HMd3Zyo+@vger.kernel.org
X-Gm-Message-State: AFuF++lym7KuDXjD/UCI54zu3escylRmq7r5aVquwbJ8G8yCkC1t1Bc+
	bEJBUzn90RZsPHxvnHCjUeChL/CZ0G3h4grwDOp8t4mtUCSLFZgggvtkpEOqUZw4hkhigOfs0ju
	qEoMAzDkdct0o3PjnGehU5q80WTBQ7a9BiL0YT2zwq/OM1LjYsty+iqnOf3fbfxmR
X-Gm-Gg: AYBFou0yFPqBEvF4LmjKdVnUHkO1yYHuhE3tH6AtLAMpAhR/w+ucaIie3EBeeU2wfUV
	vTHanD3N9sGCQ5OKEcGvRDtlbdq+dFGkzlgaSlR+nBlW9ogIfKCsbtDIQt9JzoDqaoW+nl9/ll8
	YlcldweiJVvpWi5ltpFpUOco55FSJcgOXZNEAjRBBepJEK2aCYNMMjfPNu6vwArRn5imnpKPssP
	jiJ/sVWOpt9fh6fUQ2VenVbPmUnAmC8/Gb/VI55jftkftuj9P/Rde2v8GtkFdqWzoo2RpWBnHMN
	tIOXmKPKfDyIbN8PvPFtty/MXNuSm0bnKJwIlI3ixMPCp6FJSYuOhauMN19I9/eIke7nvcL6YYd
	fJD3oHk33sV49TxOD0pYRs+gkzpE4bQ==
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr35663526a91.7.1788788902818;
        Mon, 07 Sep 2026 06:48:22 -0700 (PDT)
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr35663460a91.7.1788788902390;
        Mon, 07 Sep 2026 06:48:22 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm20826354c88.8.2026.09.07.06.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:48:22 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 19:17:55 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788788886; l=1012;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=SevN/h5S6DPgIuqMF/YDcs3elkEIxRkJIUzLiwNvHUw=;
 b=ZIyCryHXV2gt2/XSnLwKMB+WPlZjjZsOE12H8inwzxYUxB+L1C0SoiX8QNjZqh24fhoIxwWtV
 O5rUihrTob0DEibps3Eg5C1WDdR9s7htcDArZfz6bT8G9Fqh8hOOS5N
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9ec0a7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DU1Wev2QKLRUMiDuaJkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 2Lmed3i8z22PMlYGxVWftQ4WjmKMmfEu
X-Proofpoint-ORIG-GUID: 2Lmed3i8z22PMlYGxVWftQ4WjmKMmfEu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX4QI8X0E6quxT
 XEgtQtv9mssvJxSqPeFQ7H+eDqGrL6nP5KMK6Om9V9EIiLAFR47iptDIATVv95zsk/7rXueBmnG
 YJcVjnClTcXL49B1Zaz1+7iQnZDbVwI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX9sEwlzSLtGDN
 eCVox2WEFQgasnXKV3yb41GTSK7xOFCZ0YjbFGjygvy9cHfeJwSRVmJOl5D7t3emGyJsZOJEaeo
 HjTr0qFNY3UMykvm8zx5118/h3Hcsv4YJbe9b+nYF8Xfd5czM+Sh/u/K5J/x6AHf9+MouTc8htV
 7pEO48nIUyPFEveUM8Po1pWnMneTr84fj+EIrUyshvYiY65N/pEpieDzeZRkk32HhvKiYeZnCmX
 euxSC7eYQJivzv4P1/6BiyLicOuREEjhZnJf1yy1Kcj25FdRpakCemIYv7km0vNgrSHwGQ2z+Wx
 5UkzfwX0NCMETBqo0Ju+iVKyKDS/0zuUNeqqhDEggUjTe0IjiNeCElBuS7HhCJ1XX/HbcHr6nol
 SC40a3cfqQsBzoAdJGEVc0v87NFuFkbnqp3G/DCpT9wk7vekNnFGtkGmw+WiXkzxf3KK+YkPU8F
 5V+HyIhNLsQpEkFDs6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070153

A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
stats like vmin and vlow.

Shikra SoC specific compatible allows reading individual subsystem level
LPM stats along with SoC level LPM stats. Change it.

Keep "qcom,rpm-stats" as fallback compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..b299f316e3c61858c4b380f6211d0f36ef9fecf9 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
 		};
 
 		sram@4690000 {
-			compatible = "qcom,rpm-stats";
+			compatible = "qcom,shikra-rpm-stats", "qcom,rpm-stats";
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 

-- 
2.34.1

