Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702530;
	b=L68kZN4/pEuMXTLBpKptm+rF/Sv+wIn5bFMpvQvIDMiUKRQ2fL1GMXr1Of2t+wjad5/d
	 GzsCqxAaqMXzAU1x12zejS372KVBKqL5SUuklnr1ptcIP0t/EXobIqImg98jnUFx+w4NF
	 Y8fXU04syWza0Jb7fsDBzrDUUhYzXC5/dTiQ0M1TIgSZr4MTVyLJTO/ZFbvrLBmjzUBan
	 G7Hg66S/GaWDIUkEVPK3ND1ZIFo5Uxagz8+w9Ly22zqYz8DMdZFgxBDRR1Q1W3PfyusoJ
	 2fEBqcdmRtFyw7wtlnNed830mdf20T41niKyv0w1fukh4ZMNqNcUHhKWwKUG3/EMq1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wUky4id+jp8YQ+y/i0f5IenruvHIfgyCfa+AfUKoCwU=;
	b=Hb5gejWrFPc9KAvisRjmnflDw1tXVwWOKRkOhbZdIZ6amKO1r+HwUPsDwKVLcN28nUka
	 Rv3/UxroVl4fyUOWE/c5UzOnjAU1OaFMyB1/RqDf22BAmYJwKY9jw72HGubw4Rh37HOf1
	 walssuYgS7FpcG6j00z02fH5yi/C9Ouq1+gzwrbWMV2S4Iyzp37RF9/DAtUt9vzGgUyZB
	 F/Mgbf8BOso6Y5vgQMi2uak5ZWygAbCg6tzW3zALOZh9OB4s5y0ZTqbCdV3SMKpaBblYV
	 m/VTP78/0tTDk7z5sjNaWsbbQU6O8M7dGDbtKi+D/2ATdIyicHzGHGNvR4wirbWwjJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV+jB2z0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAHloy0q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127CF606BF8A
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 10:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 127CF606BF8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV+jB2z0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAHloy0q
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AA3As3577877
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 10:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUky4id+jp8YQ+y/i0f5IenruvHIfgyCfa+AfUKoCwU=; b=jV+jB2z00pxoabHh
	SdiGwrQlLUNusuWkGYEQd5oksX4s5Tvz9qroCiq6rSWoWPPnNGRDgM4crPEVMaaS
	rLqwgkvvR8hgTfr/S3eypnQFlACByLQur3d9Z0JVTOvOY97talx8qasYYazGDf+n
	R/o4JuINZEtQkSjKCycLeEmybrG+JHBBanAAnU+2lTTQ8uQ87IBdMQ8ReudNuW4s
	O9GKEfrxVxrnT51T7PeKN9GmeiyrAD8pKXV5ez27PXyDw5TIfvEfrCHNEHU+U6my
	+gH6jh9emSmvAC+FKeBZ5kfpICJH0vQ484Ee9gKy9wKhJhEhfRN30no4NIUBPy5x
	lCXRIg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d9qch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 10:42:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c0bad5ec1cso1060385137.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 02:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702528; x=1794307328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUky4id+jp8YQ+y/i0f5IenruvHIfgyCfa+AfUKoCwU=;
        b=cAHloy0qo3HP9wcV0PCNyLa0HXWcO1GwXESNIU7vuIrCe3ox0BoLsAH7CI+bhp2K0D
         IgM4Cu+KPNdYBp8iw1PNXNsQ5p93Srhid3cj9z0q69H+o2yAWuaeiK5IBLNYPBDSAYUo
         3JB3JhD31naGI0HyzjvbEEyTdeHXVkAXK6MXLo1APm8TB+9XU6/CBwoVuNuDfzHhyKB8
         vl/9TGwwipkd23+Cz7kdr/KoWdgCvwMiSHGqWrSg3PVkJG4s9HpcdaljJ+budyqWLbMH
         nTO5Bt3qSc1sl6Bkna0RMQHLkbi/IfI0rR0nEN2fZJJpFyrZeK6pAi7Eshuzcn/58MRU
         EhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702528; x=1794307328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUky4id+jp8YQ+y/i0f5IenruvHIfgyCfa+AfUKoCwU=;
        b=Dojrd5jk2euX4y7BzWR9DNLdfRcvBa1v1o+MbtjEbO3Z5VVc/26ZzYU/dqDCQdF4pC
         BL9tsWSTOMH85RJPbsyuKd4LBSXPILZU723L0VGg1MIMUGBcEBGk/ycieQCJuorUQaQ9
         HvPUqQudR4U0Pw1eI3W4afna+RTr2zrL7ondkU7YkQTrQZt+KG4OgoYMW6Cm+MEIpTIL
         H9pT4nsIzGBaBWlwIpSvZfMYrAQcIX+ud1Dit1w1k+P6M4M57Z4894feFzn7LJS5SseN
         k+i/DRTlTwtCP6yfuDkNKO08XpBCydbO2JWpS6mCFO79ja6I0Ui1mL6NXDTXrAw7TuVC
         cCLA==
X-Forwarded-Encrypted: i=1; AKwUvBzxLU13MSVyTzgO5ZBhpsaiTXgqy85phrphImTltWx+zvdDpmtWAqFlwwun9nVguVM4AYI49ILvZID6@vger.kernel.org
X-Gm-Message-State: APuU4Z8GUsn7kBqPqjduHf31YU4KJsoM1Z9Z1bOJPMzUz+FXXfC5lqHj
	owTUxhxoVwcziHTJk3Ac+nHoYM6KKorf5vWLzS9GjV0VP3cHmCW2qNzwA8ri7YmCGyD+OgO96xK
	zcXty73atP4LnWei2HDg3/pF3YYyGDAiElv4rL92qV9r2Aj/3NaJsvIStGsKm5fi1
X-Gm-Gg: AYBFou0mDJSd4hCTGekdQpcK4IOk1vAlbOQEHsWS1qjkf4FmWZx/JvyQx0dHnJcatlL
	r/HFERsWyIvpvnaBpBUA42V6KpIKLQEHrLWsFh3yqBH7JgBhc9Euji4nIqjS61BvimdS6rVVXzD
	qQ1foz6w89pRLGLimOPnhbdJ15upxm03RkeK35ALs15v19kM34nheH0Civh4T5wWyaEjMrlbuL9
	p7Osrs1fpz0oF3Rfpw1vyyzyR5mWyzl+0LgeQqi6ANo/bi7M72v4cM+euLtllQEZnBp6S3NR0wV
	XPrVVgWobB+e82D8uHoQRW2eBj5kK7bCoqus9cvTEfloEBKEmesCF2Z7vCygC0pvI/oIFCT5BpY
	CVqwCYvw/Y51LUZRVSGJX76XLg/oEP1OSmQEtjVAtGWIyaBZjQzbHASNozdgBjqC8fA1VSP6QCR
	MxEw==
X-Received: by 2002:a05:6102:3eca:b0:7cc:2cd0:e73c with SMTP id ada2fe7eead31-7d072cb04f3mr4044817137.25.1793702528106;
        Tue, 03 Nov 2026 02:42:08 -0800 (PST)
X-Received: by 2002:a05:6102:3eca:b0:7cc:2cd0:e73c with SMTP id ada2fe7eead31-7d072cb04f3mr4044813137.25.1793702527720;
        Tue, 03 Nov 2026 02:42:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm21625057f8f.58.2026.11.03.02.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:42:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 11:41:59 +0100
Subject: [PATCH v2 1/2] arm64: dts: qcom: lemans: fix iommus SID mask for
 ethernet nodes
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
Message-Id: <20261103-sa8255p-emac-dts-v2-1-05f9355df966@oss.qualcomm.com>
References: <20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com>
In-Reply-To: <20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jb7Uu8eDKmxeuPJ+cG/Fp+9EJ1Cb1pVCLeiG3jtX670=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6bp7mxuNVqXHR04a520lmNEQ/flnPb2mkrOMu
 7B9m8qjWgSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaum6ewAKCRAFnS7L/zaE
 w5/BD/oCRiPXuFwoeQm1Ic4o4j3gx5oJdO6UGAruazfnh5oiBQDqaBIw4zUI/mYpzrM8DGupgsi
 RtHcYtr9xsYKDLSB/Zhwlmm3Fahigrb2KqxRajOO+K1GqUIxdovKp+wXsr/LP/PZLOgNVyLWXt4
 Ju+YlFTQxZQ88cWyKnCzC/Iq68tO7twu9U9OJ36f/P34QQ+kH9f6Dd58DuQ+7mmc22Zb/EEnDIK
 LSWd2dNXH5kTq/18KrkBzIpJy+pSowCz7+eHvfVIQC3ixE7lbRyzvwJVkMaK17VeEN/JppFjVP5
 73R5HIX/cfXrZyT0Ttsr3UBS8ARu0dcJ+HWN+N+3SzL4WGkmBOxO90ZY153VbIFxbQQl2FvRujA
 FmXiRJGpA/tSOB7vAzICIt70aoaro1Wue64EbqYqCQLL8zZBRfduhzRDQpQTXCPkNRvto/gZdzf
 073oboRNCJ/zsl0rGKtOYSIz/Km8xsgJFYmfWKRHH6OwFWvq4Y6iUmoeYSQrWqKlA5t/2DBu8SO
 1b/XMdZvKvVip0oqdWuDH2MOpCF2z5GvOw1PTFTFJa/372BxvSJkyLxX5IXbdDQGKpq1Ea19d1f
 MRuO08OYQQeBZa1XvnTxjltzb4DhsRbsbphBZrf+mlYz1X5mirU8uIaP5Py+Rix2gGqMfMtiti4
 o6csCIpWeCH99HA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9ba81 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=jHMX-OgH2kBFWhD5V08A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX6hY7Fubk+IS+
 grIwHgxhI3jF17o5XovhkvOj/kEIeKlb7UkyBI2jsiu7Ashtqkma6bBTVNryOVJZ6L7sktIsmZ8
 I5MRiqfvcwKkmYvsIPiab7/5XUYTkUM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX5uOWekTB2n02
 MzBnHm3Td7TGCGoiQBOZx7VMP8H46yzD90Ffi7rnysuTlU9ut1kwLaPKlEg4kcbfbAzuwzjSajv
 klZeJOQsG4yAmDAEJprwlixQb1JTZ/woWo0FeNrMwi9M/+wyfiYSdgStQnzIAYF0ke+lxYufxiT
 3JbgZ5XkldvaLd3vHoxFmtTGPCX5vMt5REO++iewwNCHYDS6nd6QAzgev863hQBBD90GboSfJIk
 xSLqr7cmWjBHxC6v2bYbf1+PF/7iwNm6YCTAfhDfRT0RJSrnG5deSY+dMA6uZLee63idNFoscBR
 Uq/6Tsvs0iDtW1vvNYuvVWQ5jaOhyqAXbxOxneTI80BvwcHUtIyy3YLo2WIreQnFkPpusqAFb0X
 5kl7bT9iiB6DA+TDefTIbq8GmaORBUzL9UgIiMeTNEamNF0qAlSh8Hgz6qXSQGc8PLxCJig2nWz
 mKAUF70TLfrshDew52Q==
X-Proofpoint-GUID: w_ZV6gNQYLOrXPiYGVwAPId46W-NTD3F
X-Proofpoint-ORIG-GUID: w_ZV6gNQYLOrXPiYGVwAPId46W-NTD3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030042

The iommus mask for ethernet nodes is wrong, it makes the SMMU mask 16
stream IDs per MAC. We should actually only use 8 SIDs. This has
triggered a crash on sa8255p after a boot firmware update. Use the
correct value of 0x7.

Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 5284030fe69da9323571cf64db218ee2c7169509..915b3be65ff1302e2b05dd2034e73ec4a0970a6e 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4395,7 +4395,7 @@ ethernet1: ethernet@23000000 {
 				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x140 0xf>;
+			iommus = <&apps_smmu 0x140 0x7>;
 			dma-coherent;
 
 			snps,tso;
@@ -4416,7 +4416,7 @@ ethernet0: ethernet@23040000 {
 				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x120 0xf>;
+			iommus = <&apps_smmu 0x120 0x7>;
 			dma-coherent;
 
 			snps,tso;

-- 
2.47.3

