Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172900;
	b=fqK9ZXzyu2vZfmKx/SIlWmLLMQP05bxsBybkExVTD+19XnIJS6RQg942TOD/WfbSJB/V
	 Vdxa3lZawn3/yZ1sJwfw3qIy6xR4rxH1165dPy4zrStRjk7WyVFf7Ms2m7Ur0hbP+852g
	 0F9Ttp6zyJPJuFh2zEv6GEJIOqpnMqd4YpYjU6Usw5Boaag39WyhVUvuoTR3IdgDd/xfL
	 qLpbIlSy5slx6Efz+53v0rfAUMqv7srnp9Td9I8oJdFTsojw0TpSY/bIT7+krXZOQBrHG
	 OXOtWMIYAPvYsDePKRWMolw/KxRlbatueeBwaF5Thr+HcagRJGAAQEawt68oILzpRhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
	b=385otwxj/n7fbk5C61dbGvcF4BnnWBjU92x2k32DfmS1h9XROQT7Prfq8fR18kc7cg3E
	 SIaZ8w8F72oYfMPNIxftLWNp+UkKMRTp+e+jsRLriX7BQhXzMz8boN3ta66lPewBneBYg
	 kI9w5iPKKTYm64ImWyGcaEBlQn5x0XifB/ki4RlPd7cwLbGi7q+QLWNQxH63rvbQNCk0I
	 0V57d2Gwgdz7+JfxeFk+Y6egacx3YwSXZLYlctqIOMrxZ9Oo06OTEDrND4qzLCb+b+SqB
	 86jhD+0aATz9/GP6Qw04r34uWk0yP/kK1Mm+kixBQC881Rj1ZHQKhCsWMEuj2t9/oMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="M/SiqKVW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EKsbm/Ui";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FE960A6F46
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07FE960A6F46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M/SiqKVW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EKsbm/Ui
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoPQ1462862
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=; b=M/SiqKVWCsBLXFmb
	l4zFOxr6T0VDM1R0F+KY4JepcSgMLlrunAvyOA1fzp/XEWO7bLUuvqRXrTDEmoVq
	jBWyM8s1t+5jghX0GC39ia2TqFJfyL9n0ST8zoe8f4C9D36bQvXt0YTyce0MRxWG
	fyClqlnYwed2v/YMdcUzPm3wM/+8ThTvA/ADNR7zlU93ZEkEDb/KfKFX74JULDVi
	eKjCR9XFi/XlO9BbRzQMqNIgyoTolQzIGV2HpBiliH0dyskfcqWzc9a0ie3rg3hw
	xKedYlmST1zQ+mDvDOz8ny54ZYvAnJw9oYgCQtuFJ4V6NQtWDp+SGXiN0LERCwDU
	BXcqxA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah5ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383165e9b0fso848104eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172899; x=1795777699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=EKsbm/Ui293vLEA3NBPMfLRlifGYParMRHZHrGI3PFMe6y8NaVbmMs/KNJeVgSmdFZ
         2idARqmLUhb+49iI7JLdnnlf4qqgSGyfFPRVGSq+7bPS6f29lHM6xe3CDgx5FMfy16TK
         uSjD1N1d0ddqK9ICv/Teh6AqhrbJseTL6c36OKhm7tyBSQCzadM4UmqAqLU897zDPYnO
         b9mClnydsTc0EjSG0I5wY2PY6npuZocQ1RwHfnJzl626t5bHzVzlfBsfcHgWwiLuZYfr
         HNgQh7V+QGIX/wWySDKWgREnA6siQ6ja2LZ9kgMgPjiqapxo/OiqhxKFELLbxcy1oo5o
         Um/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172899; x=1795777699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=JAWRPrUssclysJBanM7lfIeBSzkiGUlh8S0WWLQoGbCiQ4baiaGSLRb+S4MSAlaGQ0
         710otEFfJdOFaXoYkIev8YvcufIwy82b0CmJzqI75foYLMZDYgV2Nzcts3bY0RwO7FFd
         eTvqOmrz9+tdfNK6aqPPMOI0hqeuL9U5zj2jqz9o0+Twj1uz31LksHGNXrvGWEJOI5IT
         LFKFdMb1x3fNnGeZPvMbgLEdqC5U1YRLDiY6wZPW4JrKz8F/zQsg0YEdFMpReqwZijbE
         6IRYVtGZw7eFhsQ8r90Wvei4BbnUx+aEaEc3CFfN1+YBjwHRzlQrLhZoi04DC1t7QQA1
         Bqtg==
X-Forwarded-Encrypted: i=1; AL+hErEw+X3TULyLm87wYNs5xrfi0pIYm+v2yJYYGRoEluh5ngG78GoVPSnWNrkFwQKW3QSEyHc2drCrHlQg@vger.kernel.org
X-Gm-Message-State: APuU4Z+fwrGwUkAwCv5zCAXEyuJGqEn3DDh4zqw/gmhYQZYrIAP1j83u
	7WCljb3AoEK6nA36DVLBP82k25hD3XXoE7tLrmIt/lvq0AsCXUaZmUJ07JE9QmLnpSTPOFUN68C
	xT68RXWdv12iBtgEED59biGMAoguzf3y+JuleEEZq5jXQV7vDBONIkKhMxWipazB5
X-Gm-Gg: AZFdTZfAGpOUuF8XzuqS6eoTf/A+SND/mAqv/ZskrEatN2UqEtkE269ddCee2ima58d
	a8Dl+DVzfZDJtEuP2yKtSNzk2yMY8hcdRDZM7ot2NWnM1IKUv4QL6SNVEBcAsSm7j+dLGOzXPJy
	K8w+nuwcwwwpNtZYc20khDzlGftufIoSMWhvu+lAQr8qywSRUj0qeQ3t9RcApFw0dzshwWukmqy
	c9+qW/QWGUVTaldwFceFADok37ioX2h9+Kng2Xbv++DMJSODNxfa1ZbWZ2W3fZUl4fageo5MUK4
	Ck+28mlYIc2HJl1Db9zxjaMzVO9ekN7BMQOoiOWSbDY9yy89FxqZO3Z0cuif3IYitAEFNUeoONV
	OibAyrWA2nXCYC6AGZc2hySEFyilY6iOx9P6510kXHJSu1lhll8qYtGA1IToj3mEDRn9VpIEqdD
	LkixTv
X-Received: by 2002:a05:7300:d08a:b0:386:240c:19dd with SMTP id 5a478bee46e88-386241b6dc4mr814532eec.9.1795172898614;
        Fri, 20 Nov 2026 03:08:18 -0800 (PST)
X-Received: by 2002:a05:7300:d08a:b0:386:240c:19dd with SMTP id 5a478bee46e88-386241b6dc4mr814485eec.9.1795172897871;
        Fri, 20 Nov 2026 03:08:17 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:17 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:58 +0530
Subject: [PATCH v4 17/20] arm64: dts: qcom: glymur: Add HSC_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-17-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1054;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=kQCr9BRTX/wWuCiHnkZ4IEloHpuZO4nxnn6nFDJWtJA=;
 b=VRQkE9FAhJjTHlJP+APs4NQ+u4MYqq3cljaL6I8nd2vmk2WV7jWXRfdZc9YMifbamkfdNbVRg
 df9S3AkG9TCDP/witUqKjgnNiQ+QU5yxEYYlir85AK+7EeOtvUUrD4Y
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2ZNIC08gOLKz
 UZnpLb39oExkOUsiJ64LOTMZqq4zxTx/pqF0YYIZOSalNqQJB5hg+TilKsjQpU88nQiNtry2A8C
 GE2CmkjWghwQ+4VjnEFmdFcy8lBqBFMHAOI98dxqOy6+K6n+aZyKR8QF/qRs/8tWpqhdJFTXdZp
 HqWgPr8yRNDj6nGH15ffDZ0uSub1MCAb0bk2ePMHEGxLnUMKgeo5NvigJcXfB7tn0OQq8PIlMV6
 2dT7LAuI9cpfq1RQl44VUSOb+IcxecQv571OmEAGdG1HAI3G+AaSHfmQX9ciKM1sWqTLfgV/+cp
 hZehvit2hmqR60f4YWA8PalmPm+lBuwMSu+4zKuqHRnBs+aSczE6iG3JfQ1wPPnLvEg+9w0QyRU
 GMI5b3vxHC5z7cgNvdXfzmc/N5Y61yzBQUgFSL7Sf/t4u/uvUnpUmegQQyFfwfSjXA4WWecjX/D
 dIBk3/pEnSbEBfr1VKw==
X-Proofpoint-ORIG-GUID: Ar2eLi2wadrRrO7jcZ7JjsyNQqyPLI8F
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b002a23 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=a6KFA2mGowSrcUvabvcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: Ar2eLi2wadrRrO7jcZ7JjsyNQqyPLI8F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXzTakp8sKO/s7
 Wmt7Rs6TpDiLAs1IVSL/9VGp9wVYfUT498N1PjeGSNtuDGpHumiiPPEa+HGkLkVxtrq0idjFFFK
 UxIeLcROJp9iZSd5wklavwZbfMpBJSc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Glymur the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on HSC_NOC. Without an explicit
interconnect bandwidth vote, the HSC_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index cdaf842814fb..ae3cedcaf9d8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4378,6 +4378,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&hsc_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipcc: mailbox@3e04000 {

-- 
2.34.1

