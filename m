Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182234;
	b=t7dlIONieTS0n9vlg0U9h5fpFbGV3HSmAoRam6SMciqhV3TPyVC0yuR5PsdyPo8UzSx0
	 TUSpUuzk1Wq0VcdEgRLIlAU6OvNriiwfAfl8G/29mFiG4h8FaFM99ARNnbyllPYsNlt2O
	 ZQF4rech9iJmPD7bh6BtQQkNLY09p3spAZvevGXAxh+u2pauV1tRKoKJZcnXcWE3R1HPk
	 Z9C5kbVA/6YvbUVEKRh3U5v1CFDznsbZXxMHvXdyExF/p3P40tZGMy91INbmTS43vAq92
	 CBzVCujyC1Z3bR9Zgk1K3XUNktmBW1KaoGn9qxO1+WHmufmRyqZnv6ck6bbfNNaFlsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
	b=dvPsE4Ix+wzSTceiEjivJwGaV4dB6L0ycvxgAXCAfPdsNGWlTeELbVNzmDh56imYnd8t
	 d6i+lL35f33W6jQz10lFf77+Tska4dIcjjjTtmnyF4PtXxlyT7kk6nHHp/dm9+3ppn+bm
	 a6h/4W8BaJvNVXVncvsgUhTgDOqwITYb91GdPOhcx4HY1GIJOmec7TuwDqu8avt8ljzrP
	 KN23Q3Fr13MvhfqfFCIcKm0na8mnNhyOpw08E7JYZOh+2iNtB0zp78eYfg0DJ6yJBA62R
	 xMncki5LI+DrAFgxIJ7Ek65UVI8SXrSyGqE3Uu1gcutoncV9Bth8deNin0sc6KjAA1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=clk3TyRx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bfE9cOiP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C111606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C111606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=clk3TyRx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bfE9cOiP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjx8Y556465
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=; b=clk3TyRxsqGpmwKH
	lXFfHJxGFKAo+2t1b7eu0FhmFz8UU5VLD0pn0BT5PwOd2Su68D3lc4U1WMgdM3pC
	TXHincv92LJJFagvBU3qxroJpby2qbjx3xHsqWhtYE1JLn4ReJGTWF+UIDUP04R/
	faja1vhBDAakHwDXpepD88lWuevZi3lTmylUyxCBpqFHm54oIHDKWTTOs2R1ffcl
	ydKhBgnJVZuNfYtM3VCStl7C5f/gI63pR0/hzVaw4gI5K7IrxkyykCE6QqaDUpDW
	yYSJzAM91z2nrVPn24bTgOOCGw5ZnYgV/fVPZtcrfOu3tVWzmeE7lIyw3OBKc4pf
	1akSlw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbj18a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38131260a5dso2341509eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182232; x=1795787032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=bfE9cOiPTWNTjRt5aiqNOp2uXhuBgGwY8rbEqFQeu8nHfAAYMoIZxiLHCEc/9ScQEb
         g5qy6sDRQ43CS0hixCDk8/nMuCkgMcEUzhFWB5JgHKF2B6lZWL3vhIREHEmkkpY/lGTy
         sfJkrv87EkPoTRBwmI58Xbi1oFFnElhyfSIt47u+DxW6Ol0TsWuKPOYOLxr59X94xpVS
         0OqrdPTQGEXdczMfYEQVBla8ke0NCfZ1hfWoKHm+F5zQ5hhIpET48Te6vzV2hLBEFSvT
         Zhs6kDFDO4CWcEKfd7XOdw1hxaLhzpGaQCfRPjN6Hwdh6gcZOJ2ZHoX/oaUSek2NWsGn
         t1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182232; x=1795787032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=FxP8Z14xBxKit6Wa2sjiGM8v514gIiTBp9LKNId9V4gvfWSL+8ljMBQAibhFtMNwoq
         jkkc77Jpk5g3I0J1XDTM3ynTPKMcDp0JFS5HGkk+nIz5M5FIw9nAEqbipeTRXfEl3Y1O
         PjRtIFGcanYb8aTAf47zn6z8Zz7AkNqqF2GN7kwJ8OKjG/5glKurFEay/pLgJejhqn2b
         Z3JTrlXdxdxZe2qP/oViNXyWsXZBQJygHPCqnZoCaqUXU0TXHVCoWh6eh4gsqHCM3odl
         JkBOPYHdDG/Yi19H327vDuD66yu5/qnEmXwPnZ1UWKyE8F0fewpfIPQTzO68e9Q35/eo
         ezxw==
X-Forwarded-Encrypted: i=1; AL+hErGU+CsSgJrDeD58fXBudwlYNaXQAXdPPX/6WcmV0xYMgjERx63/6f6K8KxeJlQCPAkYtOzLAxq0vCnC@vger.kernel.org
X-Gm-Message-State: APuU4Z+wSAhkFo0iYSmNTyCGN8O5zbG45/FyFjbuUXlkO9k/F1U91Ol0
	HuFUXnOlSmcFwoTDOcJFUO+carg8Z2u1ngQNBxhB0IjMAGb3rSHpICRWmNoPljln18XcXNZT4mq
	wXto5WXnjxu8jdACm8AW/vM/Nwf7beFUjeMBNqqyb6Nh2R6EKyjSgcCj56hfqvLPb
X-Gm-Gg: AZFdTZeIGQUGTXmQEivkeHVCjVF515oZ75F6hEJuIv/QxJ8HTEdegSuxADlc624YXuJ
	CBpGL2Ej5QBGTo0fqOtIM9SAvdiKPLjZvTQs2ZAyxJib0RAsaLK3s98fqWT/rcwvvPI7zb0RBQ/
	63MPhqXJt3CCF5l724tBIeBVaCKggpOFmd26xoRud8nEWWCUoY5Xg/YULElFUHKuQYIPHcy0tCt
	bYp8v4qWvNQrZxjWaysDhfFc1EsoqBEJ8feF5gUCCZUkmEVg9oRdw4zgg/oKHOClZY5JzziqrRL
	UIitowFXPpghssvZc1CK/ETQzfDD6C49Gi5bHym/F4KeXByKno54y87L9nBxSIvpyvD5Es1WYMV
	wYq+rgIJsr7DhunrOUt2uc9u7PtbTOItDL9zyGYn51kAXyB6cwqzNBaarFV4xOXiKggsEUKWCWJ
	EUUUE=
X-Received: by 2002:a05:7301:f23:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-385707434a6mr3031611eec.41.1795182231737;
        Fri, 20 Nov 2026 05:43:51 -0800 (PST)
X-Received: by 2002:a05:7301:f23:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-385707434a6mr3031568eec.41.1795182231051;
        Fri, 20 Nov 2026 05:43:51 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:50 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:47 +0530
Subject: [PATCH RESEND v4 16/20] arm64: dts: qcom: kaanapali: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-16-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1086;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=VBW+lAkn36GDWfLSpCvNbA+g18nHUbQQFlmvho8wcKk=;
 b=Fm5c9lgr4dbQtZ6J15zj9ArLcVgsoaJbg8eXgfGxClImKansogbJQoCBmf72JtCS7ZdNH5yZU
 9syPd6qmkycAwiyl/Un5MoDMHOeMfsWOs5/rFq2iL1qBF8PoemaXM3b
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXzDlI1jbEGria
 VkDncByLAhb+rzICoN/vCgfIkL9CD62fDV1r9gUuCovRyqnhW48ntl2XTFRmCWneePcwwykk7Iz
 z4WgrAdHlghV9Ayu28j2c1ixQZ1tvAoHDkyIAX+IIQrNgU4+tI78hPFgq07ENOcA3QGPrPuEA98
 jlgBxRiCZld2l5BU605UEzPqU5N3Iaeug0K9NNENybCCY2HTM84X6nDCdVh3Sw+HCug3W7NZJjk
 NC/zvSfKmRgZ9xC47z0I4oORAh1HIB6ss688P2gOkk3KwfhCrxfyd66OqlOfbwlvyVmHF4/f7bW
 P9pOVUCpcEgs/KzSM8A9rwIeFTuhoN9G8OKK1ofQkYvErbgLfym5hMsox4Ys4ec9scJy7SqXU3I
 Slq6IOSgCxjN19j50wEQrju9MaFQ5m4qHlgBHVUAkRw/XMAcbwpqQNpq+zqxB8uBFOro7gUPqzf
 gC9+gzxVw/jXlQStjTg==
X-Proofpoint-GUID: hiv-NF7kFunSDzJagRj2yZWbazhE5vtv
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b004e98 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iVAGZxyPhfMzDMBdamgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: hiv-NF7kFunSDzJagRj2yZWbazhE5vtv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXwx1td90JETtv
 oMPvKXv6d72NMFfDQJ6lNyiKifKkj5ewTY7zhkFl9HuunzXLi1kQGLDYojkMe1KEfe/yZ/utijo
 GyFQTyujSUOaABD0I9Waj6tmbDBM83Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

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

