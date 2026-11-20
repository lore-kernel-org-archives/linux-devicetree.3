Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173130;
	b=mlB3fSmGaZ+ELh1GiqzMC1kDCiU0XXLUvcE0pyplFjOshxGEu/9qqtcZXoBfXo7tnBF5
	 iDHORte/bZ+oX7IzMJKm/RJr3lICZyQMXznUcxK3ZZIlAnYWfKKpEKw/nGrzV7d5V+TB/
	 ZplOy8/fGmq8fagm+KLMs5H0h8BdAxPjG2SLXWdi3YdFPtqKPGj2z6XpVVxsLYTu+dV8c
	 lmYrzo0MrCUBWRZX6KGLXeJXi0E1NJVLZadKoTUhOWbVfkpURng4vcXV+w4/VoPVMy00n
	 gW0SXiKuXr3iY0yM6v7eeq7sZn6PCY+3gCmogSeiFL4MkJ3yGXGBx0U1LqFLRA0il/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oqZu+4x9fDqyQ44o+g2J2eUFTLu5V88xCtdE1M3ct5s=;
	b=jHTw1JeD+bRbAilia7V9yh8D1xice7YZMQBtQGxy/GcfsgwAnWrto9kPArLdDdJGy8VT
	 zL2iYQop+PtyqN5mBioWD8OLwtZl3pYso8CpwVDK/iau5uojN2RS6UEjt7Y5wJpNlgdaN
	 2hr6B6cOx6rZpX3Gh3Od3oy7U9WTffv9/hnwWbRyzLCA/3mKtFAysLA3Lcmp2lQD0enDK
	 GLBUt1PHqTchLiGN2CBguidA4mW/e7C+QeL/6mgSL5sqd7NsZKrcELQ2ByeTDMtETd4Ri
	 4NIfT92ZdboCM9HJ53iYr8gzylUQFXBa0qKcKGmzcq6qUlVAzJOqwPIB8PjdUyGrvkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRiw0IbB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRXwiN6A;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B019160A5BCC
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B019160A5BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRiw0IbB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRXwiN6A
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoAK1462861
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqZu+4x9fDqyQ44o+g2J2eUFTLu5V88xCtdE1M3ct5s=; b=KRiw0IbBHmT6Y5Ns
	ROULM0D35x5Juz2YsgzcAileMNEC80p96/qGos4/1AfXhihuyWrRAUFgOUCFrghZ
	FDYe8R7UH6vTb3hax3+v2inL5jaFX5konNj+33d4VFDbslWosxoiGr5y+U7QWmnO
	dKgfWf8htN5OTF/4uuN+ngax3H3NxGrs1Itgfm11ktF9c4GZ5wADg3YqisgSd2Jw
	xlPJp1xfyHLHttZ66y3cDDoNN4u5np7yBCmWElR5RGs7gwCnrgcvS5J/CWt5+C14
	62PQ8v0lCmgQFVAJgeuNQKUw+5BXx+jK+X918rxWNDCA0YEjODX1MJwSL9fNY+D6
	A1zASA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah6fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:12:09 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b238436265so507297c88.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173128; x=1795777928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqZu+4x9fDqyQ44o+g2J2eUFTLu5V88xCtdE1M3ct5s=;
        b=YRXwiN6Ad+iPRCqjxFfkYyIjFiXR1z/XFOmE3X+xLsVyX/zdXcbrpeFvlo2vh6wfGv
         4ryM+zlueYPqh21DpbXxfzkqYP3tPBUw0AubRzkjmbvX4Z1VP+IH63JItRl99bIgWoGo
         f8XnQY/vvX1hk9rAlNZ5h4sZAMwuaGSMcxwQtMxR6jb2/hgNDwE2cqt1soOUgkcuLKW6
         5lmzCdRoa92qPfVaXGbrw6ckQxHx0aK2JBQRTrfypx0czCl33ANGEbMlPBfHtjYHTDe9
         9mDvpfvKDgEUe+QbQdbWRlNrzuH3mwAK2LMxlXL/8iprHQ4HsBRuB1yfLQJpJXhNWfMp
         exrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173128; x=1795777928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqZu+4x9fDqyQ44o+g2J2eUFTLu5V88xCtdE1M3ct5s=;
        b=j9g4TKQkH6d7i0afF8zGb5KDKVIBMNSWe6wv7iXhuHyZ90fUxsbeHFQzUSvRHoD0aO
         OBa1OxNyH8CW++R1dLEALa/Lem73EzFBLzwijRp/VekRjsxBt/X9ioojztkZqoanmhuH
         oyJkBe7zf35k51Pv6vwDQIkGNlNXgoCKeatlmxeAaQG1jMbstHpKE9De6jjx8IkbdazA
         NJhSuc5qYMc7tBghz/AG+Hf8ESLQFHAZIJbddr8F8LAeUmdsD/i1RYsMCPRGx2KGUDVi
         cnDzirr7TheMhskHfrMHXt0F10W5RCatQk3IcSmdvhD0dJkSDVOmI2NyAlpyQASkOhtr
         zB3w==
X-Forwarded-Encrypted: i=1; AL+hErEw9SAkAhu4iotaTyx+egAavwSagY9gPhflchc8zTcUHrxyW5AW5bIdjzLrZ4WsO9j8OFnJ1Ub3Neba@vger.kernel.org
X-Gm-Message-State: APuU4Z9v3a4fVvrZtFj+VlnyKdkkOYJ+rtfBVvqAbxAqUl0y92WqnLdy
	XVOtRr7nyAizONF6pggtVSVgEuN7xnBAoK7ipeqYKO2bVbPnDdk4Ghnl5Je/VS8mjuSaZRYI+fe
	rxh0LFnVGOCgjyRuWFtNRBj9Z9eKJvjiD5IV8sNNx4+e9D9rmq3+DkM+mUm2yqsw8
X-Gm-Gg: AYBFou11fgvzHujw3hgP0jlAkNqZNTP9TP4rqCZu+Veip8G/ygz53i/49W+GkSC9n7w
	2wGRkPluGHDCuVp2oRI+5E7beGTgK0bFoHmp/+osJGoDv0kAz14HtoVz/I2ZCY3n6DQY6s9TSwh
	A7BN67Onp9NnZP1YnCTOR/BFhLdpq7d7iiML0NfCcweKCEUXxLcAAhz653kzHR4FoNPXfQst0ja
	pFRId9EKXkOIrYfL2szGZyCe+/isK2yuzGzWvSHQ5fkhnHJTmFw+NVzZc5AXmbU1AfWU2tH+1b7
	B315GK1d1KFKojrMwJo8gDUkiy/0PWD5Zig6KA3rC1FPrPKTPpohMBZlu/EPfUsOjJW2auNG6EW
	zGkOBtPTMBCnGfKBbwNxCJf2cLsj/1XwUYw2LnAYosIZgLUXZmOt2u4twOMeHgz/PQtKsXuIJoN
	b7dBCjaP++
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr2509374c88.29.1795173128321;
        Fri, 20 Nov 2026 03:12:08 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr2509353c88.29.1795173127795;
        Fri, 20 Nov 2026 03:12:07 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:12:07 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:41:00 +0530
Subject: [PATCH v7 10/12] arm64: dts: qcom: monaco: Add Iris context bank
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-10-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3345;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Squ3Ho/x38HQ+PfZC/ca25g9bdRa6cMHaBF7TD1Laj0=;
 b=UNXJXTR7SlrBfmvrYKPiC2eatMbpTEzjm36wV1DMG5gn/2evsMiYH/2ID9Rs2v1PE5eoAwkT1
 vtf9osnY5iXDrjjBBqQxWdoDXxeeR2WAPbvutj9EinTL4wAsFMByhG/
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4IWePt5h7sRx
 GjFGyiVmBW8byO2DpgL3LSTBB1Q2nTV21KuzFStGXHeuIlWKBbte3KQQ2w1Xr3c526+xEl2SiID
 3nYtYykkCBpTwLNvOTerLcFMwXsxCZPpddzCu4aPSINy/5vPQERR+aZEY7EqU8Y+xo7WtaWDdb6
 wfcKUMyVTHh4Rr3HGbD8e7cEr8PhyYVhgPfEDhkOeV/1YQR6l3/78zXrOQ4pbmYjK/RfutpAtIx
 9TT+g3MG2+aLBnIwBdrsH+kDC3Mi9c+v+6JVYS4FZUY3IZoisQbGJj5Z9aFxIX0HXrAJGUxmpuO
 w4aYqOlssKAb+air0PEylhFyWHnm0CUuXZQezZjU48OEM9dEKchIewiTzy7uf4RAXA8YoQJEDj6
 hIQcIHJJVCH5HNs5UVfS1DWZr/AIjD6LXrnS0suT0Yng71VJBQoT7r3LYrv3PvoFBolxSz6KgTo
 CA5c6dalIKWvxDTNPoA==
X-Proofpoint-ORIG-GUID: GjAq3myOMKatbBqV6TQSCPZ3wbctfdDy
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b002b09 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: GjAq3myOMKatbBqV6TQSCPZ3wbctfdDy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX6jnYlXgmr24f
 AKdsxkDzPjzw71A8vwZDpKflkTkQFEjdZd5RXArkMQd/4Suwyeshj/ssSPnsQsLlNLwWoingeJi
 i48h9tbQQTgjB6fpe2U32UVswUoqzAw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

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
 arch/arm64/boot/dts/qcom/monaco.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf47fe27499f6dc370cb778d780a08..e4805479e82595f3e4583f051cf664ff97b43aaa 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5419,12 +5419,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

