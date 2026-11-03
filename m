Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720518;
	b=XQdpRx+X6Q2+891WJhHz/hZ1XjTesMT7unP0WN4FmBKRray/nxXtLt9Ypk8TWGAWopN5
	 pabNL5zO7gMlKstqGJJIiDrObX1eZd1dxrUa5aJVaN5K7WLlnY1wY2/VhcyYn1dcFiJWD
	 5CIbsjOM81SpScUVdwWyvIbK8ZvyIIdsoMCoLksQyFFmxQfmQsggbaiqOqgzdsd0sdffX
	 z7ywDn0W0+Nrfe2QzS7k66XXIQCfHlmqf7phtekY19VoV5FSOecZL5lnhs37ihlV+5J3h
	 MvE69bqnU5oJV8wA5trUk/dzeVWDAtE/m/lKxgGqEPU9eco4vwuduadYweP/SunkhSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720518;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k3X9eeAdKob44cdHpLXAXBh8F4GxpwEfqQORJq9Lp+8=;
	b=1D1YBche7XDwUT9hT596rRd+ZhFqOJD8+1DbFcSDEjYfUoxBsFQ9FsnSawpyJMrK/oZy
	 CTS5o+Z8ogvDltcTRQZLt9IAJFFIw3+P3gi4gp/v7vpUsBuVbk84M8VAn6BNyz4TUtb7N
	 hGm46Xw7O+HOqm3sqZB+BjnqWBa73pEPX2x6JFA5TlKzFQ4VrfS87Fa6EPTJMEdsi974f
	 CBJT9exEsgtbK1kuiD7S+LG0KW8Cj9hpGHlyhuiZuFahEzh9bD4/EyvRm4Le/4GN8ngpi
	 RE/Ca9c7hm0kzjRh5F7hbrHU4aCOtbbHnonhmAke+5kkfEFvd+gaqOaDIBM4QpqRT8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PP4yn+Iy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLbl6FV+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D67606D83D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0D67606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PP4yn+Iy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLbl6FV+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA6NM3048978
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 15:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k3X9eeAdKob44cdHpLXAXBh8F4GxpwEfqQORJq9Lp+8=; b=PP4yn+IyWNUhiZBS
	EkcYrcvChqkIum28aXYKBtA3fnCeLz17wSJ8X7ZGJlGGo8vsfq8/glhAsyUao4Ro
	oXnpt+mCcMZMkc5Gy05I6ui9fZlA0vnRrHVGrYewOc6pexhBoqyLKot9tElFnM28
	cQSSeiLDZ7TVR6ipygfnWKgg88vZ/oiQUgLGiZT5LGKZGJjVdm0e2n8bpaL0r4JI
	I0LRhGCRztK28FAaKXqzdbo0fvt3NxWre+Zb8JNDE1M0A8WisvOo+apIYfPw2RUA
	DLFSJEoAlzUOr5SOjI7a5TJqWuj3s9ijpgePKWihbfIwHKPVLg/cgmz7o/wmgjf2
	Q1CFag==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5ke0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 15:41:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so9371093eec.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720516; x=1794325316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3X9eeAdKob44cdHpLXAXBh8F4GxpwEfqQORJq9Lp+8=;
        b=KLbl6FV+4OXjRQ06s8x/LgymFaMHOHim79rBhmEF1QF2rqalGfu4qFW8z/msCZf0Pg
         ZJ8cgnYFlJq/Rehfp5RsJlRloXR5SKFIh8OhtWIl1nkTFwRdIDWFF2ekdlw/y3t5gUi2
         Scm0B9r7/A2WIJfsUTPN26UZ9Ldfwn8IVjhjNMV3L0qcdBTslutzEVnNxwvengrK3BMQ
         kJZqrIfnNrqaKeLWqbz0lKDDM0qlZHtwnzgvKSoj/hiuoYIdxONB3O3gByLdKJ6ahlLN
         2tS1IbQGVmq+L2Y6MzuN1U4WEWmq9hNbjodQOYLKhS7X/6HfRLJxSx9jBF7p0mgCCcDP
         8rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720516; x=1794325316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3X9eeAdKob44cdHpLXAXBh8F4GxpwEfqQORJq9Lp+8=;
        b=JBfsOSIWvQI4oirVXgRWrwFAk+BBRRZ/Fwk+Hv6ha8APg9tSu75u+mzVhHNdxRWz2A
         wfjurKz5oeY6dkGI1N3JM3iGAr5Rhm6+/mRJWOD08VKhmdZWTXvWRIfagRsmz7yla8LD
         Fn/LXVvcTlFVmF7y016K2lGmNGl2Ubht8KRtgWnCGHe5QQ3LjsXJb/P3AaqrAU4KVv04
         Q9VEc/NDXyP5suD+Kvjudt/ABYcsPu6jiWCARegILyGirUcel+99uSW9cV75poD5tzxz
         M2KaRsBOdmWLgEzkYldz/izVwOrkHmdctnhUQ2JP6K6QWDz49Tgc7twmEStYArZS8Muf
         MI0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRN9ICEy7iCzRi3y8j6ORTl6wTyRW7ljq6gGrGJNiBg3K4Mguyr1MBSyc3u2iTOHXma/Bu/FEQd/lt@vger.kernel.org
X-Gm-Message-State: APuU4Z/CLz8ry9zPsuN+ebm8ShLH3BnFjd51KQf5TAbfWUi33dWzwUtR
	6maN5dqJBeUn+saDslay2M+i6ikWWNGl9rdjtVrA2/KskSkfELBxFurp4IVdKs/TPu7QD1rH3Pp
	fDnZBxQqmc3LftW3ZTqriAWV53ragoV5CiOmKt9fbU46Gvr9hmbXO9DRdkz88hBSC
X-Gm-Gg: AYBFou2XL8jHeIBBspTMGMBAjoeWVUuCNLtm+ZEEpH7AwNB7G85UNDi/vOfz12tE7sK
	8UcHXo0ob4qVc/OUsVG/2yAP9TiVCQ9anZOhyZhENlzirgQNN10KL8bOJtxiLMeA/0vagfzQvGY
	K+9VMub5zNZd7QNrIpnqnLzWh+ZUHodYNmVpMbPywdfXAew1QygK5Vw7LyRXlUzHq2jNWmpawDF
	sUI+aGiqsvID1pDGw9Jn6WxCAYSrgqlrlXkKYOb6uzga/rx1s1Qn2hjiNfjbqnCv+VKEEdpBK4D
	7FlQdIXo9/8XS+VgEvfahm65fvjpVA/ic6qPrnrebCE8moycExY73JzIws3SPLT2F+pJK0X9SHY
	Af1c4ZCIBPKcuol/jiyryhf0vWkXIXIPME8zUxKuScOCCdepnqkH72KuRsPy8s10hToQGMcoeYx
	0Ra4IW+WLW
X-Received: by 2002:a05:701b:4248:20b0:1a1:c1e3:1ec with SMTP id a92af1059eb24-1ac5ecb684emr20655675c88.46.1793720516148;
        Tue, 03 Nov 2026 07:41:56 -0800 (PST)
X-Received: by 2002:a05:701b:4248:20b0:1a1:c1e3:1ec with SMTP id a92af1059eb24-1ac5ecb684emr20655626c88.46.1793720515529;
        Tue, 03 Nov 2026 07:41:55 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:54 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:38 +0530
Subject: [PATCH v6 07/12] arm64: dts: qcom: hamoa: Add Iris context bank
 subnodes
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-7-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=3527;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Kx1Spp6KJHM/XWRn83wWXOQAWtlHL2BRvZW9xTyFHwc=;
 b=b7Mkz0Y+9Q+XFK0lXWY9VZ6ZzJKG2BoMZeEBJcKIimMrV5c25MIp6UMDBpzCyiYufhPa5nguF
 f7sBJEQPSmuA6SrcXaLBAIKE0QyL/moIKroHjLf7fPf1WEVPHdjt/rM
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: 2NUFhhfebyqw9FdxXGgFnHaWSwmFpvNw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX/ePD8zf7lbmZ
 lDNn+I/ELdhSGKejOujgw3FNiPR3XqCJl6iGLtky/tqVs0NzBegIAKBMm819Lz4nzqxRhpHx2zn
 bvNNgGNRkDuqCAwiH7eirjgC5smvlVd9sSduhaLxhSdnqicLvs6Bh6LiaFPEUGqi1dqKf4RTnkR
 UiVGNYFgMsSX+hSFPgPulAijXX5myRMohjLkobzte7m2gb5UOSxaWvvVSgvDOE2T++kXoCbob1F
 wXQAdsWzNMwotkYpA9K49aSuLhOcio25acarlkajJiFPTytIi7h5Q6UnI0dtQQPP1hISngIcDK0
 MukW6x6rfHHBWh1itG9XoUqQxten8aIRfXuuYGspIZh/+X2t5cu6nOIiacXpbFQgTeAUVU72wJD
 dekUphq/T1rSQHrg1dnSqY512LKIAdqEJRLhgkR9z9xqYW8IAcVDvtUVBrICkF1vSj1w4GrmzlJ
 IX4ekmH6QrmxIjJed8Q==
X-Proofpoint-GUID: 2NUFhhfebyqw9FdxXGgFnHaWSwmFpvNw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX43ltbcBoJ6F+
 D2PaarpXOTFoikRpo4+V5ScnFmFbiUizpR4q0DNrMgpLD9mjf1WYINN19hrE+BwG5xLZKlsARA+
 LpowVyhcXmOu0rzX6x2UGMoLYKViHRg=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6aea00c4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 48f47aa6ba3c7a86b9746ccef05724529ea2cd02..c6bfaaeb2247037ad524d2f848851cfeae24b7c6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5468,10 +5468,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5479,6 +5481,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

