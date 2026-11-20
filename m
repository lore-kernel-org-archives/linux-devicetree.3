Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182212;
	b=nNU+5u08Ic10xx0nH9TlsKCJMVz6CIX+RmS4AFeWF4JGlDtXG8yjFtAIB0MEk3SRL+4E
	 qNpg9ligG/vcuXbnz5eRaNFEboNdDimbE2IANuseuDIE7QN1CAu8SdDeGDQgeTUbd2p/2
	 H65727nPZOiwhASk3DjHph0SbmJK6dLQnNCeBu27xN02wfWI6hbHK9VkKJsndXv35V3re
	 N6rqouHwA0F8lmPD/UZNmjN8CuJAdIHkgvPXBBQBA5PDJeGGJjV28MxaHkRyTl5K6nePg
	 tuWHAoMZ7nsfekfWi45DLikCp5p+10iKdrGSlenZLpfl5oCE8aWb1osoQJCHGynj2Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
	b=u5bHIsq3cZCrHYlvelKUEMUJ9VOiiydbgEhOSvNOvdPcjmjKGxpsAhAsAcef/F3XoOKU
	 jW+Uf00pnfa4RGtoAGRR3LGSL5rILmD0FoQEkcHdH3hCHk+At/ssvx7ET0ktuBOtaX/s1
	 iTgevX1o8sQxCB5BGqsjaXfynFn+v2VKZQrFhAwQqlW3khb7HduSKQJw1pz7RLnVJH4dQ
	 LQQjr3pY3svPRIq44ky5byS59Xfgt5eS8Nxb6DapX1/gw5dAm2PJmzM1QW8l1BnFMAZAU
	 Ln9+xWruiN0Sfo4aWbG6NmOgnVqQpQvXfPdFlXH3tsr7h8hnYYgIGUE6QZgbkNp6MRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iDX0SQ+C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c94x9+iO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8894606A337
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8894606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iDX0SQ+C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c94x9+iO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjsrl1681938
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=; b=iDX0SQ+Cr1ar4w2/
	/00qhlTElkSDRnEmUQlPi+xNC0A/bMK5ZEluq4xFreDF08sHnD7XlIDatmHuEbXL
	Cl14V2IIgHrxwOOZ5ftiGmRyt7AvupSMONsCgdNX7rhQa0QBAazPYgsx3GgenvxQ
	KotBHRuAbiL7u3y3L0QFuc5vEOhTDTmyskYlAScrl39mlucL+B+41vVCA0vJJ/0C
	LrrQEmZQjEsJT/gr3TJgVR6a3maErIxRiuiK6dZptPpxLSNgTv9rnS0vmIgWmNjA
	CQp6zALCNzC691rLA8UD6khSdDEYpBzfTkwCMAkswx/abSzJ/rtWR4w8qcLMUbh6
	gKvcTQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tqbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386177b0516so1468255eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182210; x=1795787010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=c94x9+iO3GBb3LvevbTxliBZMCRvpzlpnCZDAikFN4IZvoImfsCGzPj1mZbflfkAcy
         7dA/hV6nLO8m+mLPDY6e9n24VSfOWFM7+aM2WLmfxrpdWHSeFcS/SbCfItRuA0QRnnoi
         y86zJscvcQluj4gUzBob1dQIGnDnZDIo0rOxg+gR6rvNQPno3ngI/JfzAqkhfGRCQoD/
         wFJeMopM1Pi2BCY8WXU3KSsgPwqHFRBxuWXzm0QpOCgn5MBpLXdzTZ5QA3kwhoLkIgRN
         DGQxhPgyYq7uuPC6Fwm40meYpQNBjhbkvlyfteiE60QXbnDYY0iE4Ap2tJ0yyugEAmlt
         m3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182210; x=1795787010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=tArvWUl47v3AF89cn0OTCmwoTT9dGZkshoxIwOrrKUprDPyRD+FcpLxC9pmubFZQH5
         9urLTpah4VkAbcHmRifzcUp/3zeiX4z15JcmfINn6Lf3YFw96yP28FemLucQrrGKcN/2
         SN5NfhrbFckfu7D2Ip7bnADdFmOvoqCOuAoKg54e65wyRoCJ18LdAVgTj/FyIfaDq12K
         /ho3+3xiPUbj4lU712MLXFrdKYTE5OjM1JC8Qz4KSR9uF+2R1EsXdz7mMnwG91EWNIXB
         Dw0z2tL5Fzlsp19DbZHfkMs3CO0QWQV/3gKf+xU98SYT/aH/BeTjKJH/lVG8/NUQyNhe
         +c2A==
X-Forwarded-Encrypted: i=1; AL+hErGq8WNjJhgxItjWHMvB3oe0X+ar+++0BY/59r5GCtn1PyxEXH8AGzAC163MwaIzzrfzIkvXTULfl7pz@vger.kernel.org
X-Gm-Message-State: APuU4Z9VYXC/OaxhmIyxvQDeRMV4uaXYQhs3X4b8SwApKL0luDHPscWm
	l0HY+1LJ5rOj2QsWLxMWT8VoPPwEGkx+Xd9DpRo3pbTHYA9eaj6i0RVrUrEEQlcDSdXCFg5/4d3
	62H6Dh1e7RtqQpaSK9qANQVsygYfIDuZ761/53AHTSBJcqQaxoI+VZihgDMOsg9am
X-Gm-Gg: AZFdTZelJ2AOmMLrFI+Lyyrd69FU7GgziSmxzNvo/Gc5oxLH0a/W46E6Mtr1SFE6aaa
	AOgJpdvPUFOH9Mi0OgLOgMDLilwwTTv8OFOuKEE1ASs3/5U3Z/N/z81KplBneFMSxkAWaa3WzOz
	RN2YkxrehYX8+WYMGqlmmFUqPJ3JAiUE38JPnmGe8MExgDYq0t3C7QASs0Cdy/oGWuAKXo7Xct/
	MgOvlSoTLC9+jG7h7OP0L45AkciRKsl3dx//680F0Uv0XsCk5vVKTefBueghPdUY/k2p56NyWON
	7RncE48Xc+FVcxh+8zK9r+cJ9cwvzHUVzlUM3jZQcBR3icSjXj7oyPjhPlEfDMQJr0F/Ez/wa07
	hrLDrPeBWl/UKiv/+KyK0ZSO2Elykd9fCAt2PxcHJu5YfFWbuQ1jSp8iXc3rwEwtw5qEhmdtXZ8
	pPAcc=
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr2985134eec.6.1795182210316;
        Fri, 20 Nov 2026 05:43:30 -0800 (PST)
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr2985097eec.6.1795182209587;
        Fri, 20 Nov 2026 05:43:29 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:29 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:43 +0530
Subject: [PATCH RESEND v4 12/20] arm64: dts: qcom: sm8450: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-12-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1046;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=XGSCDo+PAJtTWrK9Yli/KgTXld6tpUWo0Tp3e8IW/LM=;
 b=pw8cWvyKwent69F39bfc+dvHudt8wpagQHoCzw0hmqpwl4FfInvFtYZNwSN1sydn3qGmcjJ/b
 vgngXSRqSFgDW6kPfAk8Dm4svPRauiLxmUoEh69/6Or/Laf/oJ2Tzp4
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b004e83 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fzENmhSgVi5qTvzIpAsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Lw76Uw8Y1UcNFM_HoxZanuUbKYZU0oHX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXzicKp24FSjk5
 2HSvjx2XdT0+tMdFMG4Qli+SK743YZxGnoHDZIkqHdu7MdcIiiWXV07bjLkgqbRJd+K5bPNf/Nh
 3WRT1BjFof68MvZRpwnlaxKKosriFPwcv65JlXkUsJ8S43so9rp3gwi0a5450hX41JZAexBL8wU
 fKwAlUAbYqWVIMJAnJ9HYF2XxjI4P1xxRPNxgVZvqtaUMFpzTqJOeWP0e+G4l8SuiLCQXFQ7vvZ
 2o4zJFtkApe9NgF4FBkLpcu3WyjZuToeQOLHSk+RF0942fBiDvZZXsxs6X+mFNiaulA+NpR5IxT
 ofd7T08cwhUJqMWbU1yFIqM+lhr/DcOz+CwJ72Ab+uhUyeDzTozUOYZ1mzhY8glz7HsO95dWM8f
 HA1umpkEdBF+4ARfad2MAKmORcZH1378QFNZU6AW9Yc/YlOHHYeWJsRWFFG0SyQLxb8Zq2pACih
 eC2Nc6+7PTbLocbZu8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX8ZNHN2H6Kq2q
 nJNpOD9dLH4eAtnkCACYREnBZCt02QmLq72mjpgVU1+wTY8TAMerQZbMA1RuVBKvPUIZo9VNaoA
 Pfo0G5s3Z1/t5Yf0Hl9rcjvfFO12rDw=
X-Proofpoint-ORIG-GUID: Lw76Uw8Y1UcNFM_HoxZanuUbKYZU0oHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SM8450 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8f84668169fd..f7dab346cc70 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2619,6 +2619,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1

