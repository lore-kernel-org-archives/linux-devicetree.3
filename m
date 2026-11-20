Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182255;
	b=x0fWUMcEVp/1d/WOCK5iS9bqBhp8ffQW+FQJXaZBBNUeoTUIgatrtzKsHXcq3Klo1usU
	 IPddfStdSBtqz/1JNpcBlHUyZgqnrZRls8IwXH1RGEfCpC9QjWlEG3pMH0PGGsEbgRtXF
	 V+wo1LY55TKMi4yIC5o55UyUBUpaj1cEUU0Vy+GRTWxTLPNhjMaNKCcHSwgMgb1tOzN6b
	 dCkF/ox9YSWFSMD6POHZ5lIU5jEvzMY8UZSPr+FnfXi+SE3g7Z8QpWZxjkm4qpIqATojG
	 0UTxfRzbLJUOKGY+iayqrTGp5t6HChJ+FoTBLEP2gHN5buwYXM020cnO5NP2R5Lh1cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
	b=sax+57LYxLS3SxFiiMo7usjgX3455T2VK1Ojj/bMApHiZnayoRGRjbmVqPhiEgsqmFp2
	 4m2Y8PcNEypUkizxYdORRa2X/LHJPnYZniMdjs0lPtQBQcJlQ6Es/xH0kmP8dMQYXBAUv
	 kDaFQQVXuxNbA8766NCHRxp9h6v0WM61mQ3YyJcFL2KfuZgeW74LXZYg88pz9/JRphM6B
	 LFMNCXrElMkxqhPvQQuOaXU6YZITivVwCNLdwLUN2XSCKTochryezo0aHyUlA4IRDjseE
	 vLscopq8C7XVw2HSWHJoEaIsDXwbZP0MMlL7LF95Loqjtocal5bQvEYDi1fk3nDRvVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I///JBMg";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VmJCDz9Z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03D760A262B
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03D760A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I///JBMg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VmJCDz9Z
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkJAQ1017203
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=; b=I///JBMg66s+Ajzu
	47ybV+1oKz2uCczswJ2PLec6ejaV8ECbm7IfuYzpICw11jUAWMVRIzg+OsYe4ap/
	+Mtw8Rbx9r4eUs+2WCUN0vwcJj7F3LE/ywIgGOqi5wSvPw/szZMa6E1/Kb9TZ0vX
	5j1hh+1g/A89ebO+E4ZIMxEJgQoJmT2r3dh0TI1MaeubSi5v8KrieU/DNnyrKsR9
	wU6r/VIKXVMxw4H1Wq3hrw+DP4hTux8BPHdAE86pgVQ4DGEo7lLAhSsibmhhAJ6H
	olphCQt6frVIoaQZ+zG31UD0VzOYKY2Oh2RdOWvOGZzr8nZwJn6PiNtmLHgbOJ8Z
	M1vJpQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqst8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:44:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so994203eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182253; x=1795787053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=VmJCDz9ZVC8JJ5XCdUIeTi+LE/1c+suU/i9eAjIpdHj/OPVAiVlQ2/Be7T7iKVWqZi
         /HvhtRrrw5YVo5s6SvcNtzcda6+WPuLr6ZLuKgDbFUFVbsCQ9gefYtW/zhgKbrc32QN/
         Mju5hqWn0co/awsWgwHQn3mr0Gad+IJRL8cCJwAE1cWTVusskbMYJZrdh/6Iwb/5L22w
         obDVb3jftHH7clnXboeHEUIgGdttk5YmcIz/xXD/Yttd1AooIRzfMgZmKy2+My77uIfv
         EoWFX8SE3Z/SA7p9Bk5ieWwQVxGIn6b8Pdmb6cr/kddUPobYKD2g6OCcMBUiGKfvOv+L
         3jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182253; x=1795787053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=lawuBcUw4785JS6xSpPYSEh9VnzA67WP1clZ5MrLv3sGOx3pJv9+JX2j0/JNNc8goU
         Tlud1oivLCfsfp1kV/7um9RGjb3q/A67qgaBDCMXehNDZL6YQbuVyYpijdyGkuJxbkSf
         bdG3xZFtEd+27amDgUzGKtH6LvIGnN9OjQW6M9/OJMHtLZrKgUo6cQPVb1SZWTA1Dtmz
         N0+fQnmwvSVPAS6YwZ9EPmqxjfcWQmgMnsJiUyH6QbWbHifSOXdystmOUu3allrTPYlj
         b9VjgLIXB1TdRqHr3WVaCvgW4AVG4X8m3DU9ZxI5Cd52MS80bkBdwK2JrdQvtyEFZDhV
         UGaw==
X-Forwarded-Encrypted: i=1; AL+hErF2iPJpgpbGWc5YEBYRMJsl8wj/K792k6lGZSBUw3OfwpWYS0hG2J7IZbinIDB5Cs15tw7KYSMAjZMY@vger.kernel.org
X-Gm-Message-State: APuU4Z8PJunQsKhFk8JhXCh2e4LPKDSI/JET7r6iCH/mu76zHMtEADQ1
	mUr21M3EhMfMw0JFFoBysGfDcep374nwAXM5be7YiUMIbj8hCEXaFRq5DNJB9n5ecf7mUc310l/
	+Bnh0KnaEJDXCBvKspGkszeizqXETH8uMKJjOqO+NkAbLfhyFqXHYVlkeh1ubL8j7
X-Gm-Gg: AZFdTZd6snfltlcNe2BbqLE8W1qE/T329l/kws6X3uTBggpNAV60yzXy9HpT8HhGxBh
	pOOjA17VNuCOKOwVMnVin5r+YxyfXqmGJOOPjrXizCei4QTkv4FaIwHL0wMz+W7WxCJDQGrERBG
	39XdBtjDb7AcVbFlxeZ8sB5570TxhIFWpTiYCqiNEMTx/ARPyedJYkj7T6BaVIpohsoBjx7EAeF
	L4qAu0Bbex54He+DRy3NLMSofU/fGf+P2C4neF/QECEiBQJxWT0yA8xH8MaBWoSiZAVy2yfF6IG
	YX02AivnT+8Yf5UgYXKEdwucYk02ilmbVxC+0eISJlNoCOMx9Qcc2osI41Zdo3jZjIzUrRz2uDq
	9pafQEsjeQrTDjpXXp45vU7UYD6Ext86z0HTIyJQXywveqCxgq20M7Xixh7T0pjpl5dwSnow1LE
	sHqNc=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4222092eec.7.1795182253051;
        Fri, 20 Nov 2026 05:44:13 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4222061eec.7.1795182252290;
        Fri, 20 Nov 2026 05:44:12 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:12 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:51 +0530
Subject: [PATCH RESEND v4 20/20] arm64: dts: qcom: sar2130p: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-20-be30526391d9@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1058;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jWnycFT0az2p/u5EzI2kuq2uyYSvSmt1HyCePSsKymg=;
 b=ZflA6r7UtGdDB/8yQ07sE7yzSHaKi/dsLit6bYC44nb5Pebakn6aH+wZQKxLjgIoCtcFXVcpe
 bgFuB6VkQYvAFuouqHVo9+JC5mPuCRTT9JJdyxC+SQjThL3oBPuBpig
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXz83KTIUIjUzt
 lIyIcSm4pX2v+Koc4XnpaqSiRFagdaznQNxSEfIWojVA16fvGeeWLY6flzSkvt4/Uw5K5C+ad5T
 trIHanxNf0legnOADTObz8x3xNQLLzGQFK6vaN8ydOjY52ePK4ngvFpM8rtHCsRC9YPWEyNMwMe
 LPGKpV5UexfVeEbv2zPG4sy9KXLuTYhfLeLHnpbQMv2KAmtheYvoZ34NA7UGG9TgHjRrl+fXbq7
 ekARs8eHMTYOBBTDZyRzqpdzHkHzi5/H1sITZ4stq1zq1PgZ0LuqaWzBUpR+W8HkZZFrDL0UbDu
 HWBBc9KFEskidZ6knCA5GTm5Dnu0pyAZxiM3n1wjcGc7rufjorZbr5qxdMnnbknUn0VzgH43ZMO
 FIcJ07HdgUTVl1CjzoDRV9Hc1acT2he44xuyh8+cFFjXz8TDGzzvR3IwnK+/ThPPPvDNT8t6hfU
 YBIUyTdm4N1bTZvURcw==
X-Proofpoint-GUID: NNlzUXoPJwNpCzU7PXrEEcUD-kn1Zg2T
X-Proofpoint-ORIG-GUID: NNlzUXoPJwNpCzU7PXrEEcUD-kn1Zg2T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX8SpAmJygV1O/
 KJaM0h9244hSPaqklRM8S3fjGJIDXiROHgwVVgZYibUwaG+EvqXneHXDy/8/SacoCi7Q9s39YpT
 a9cRzR/E0mW63+gwuGY+m0TGqArrcWU=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004eae cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BzZyaU2VGnUrTJno3XcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On SAR2130P the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index cc4077005e66..950fb83f26db 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1857,6 +1857,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1

