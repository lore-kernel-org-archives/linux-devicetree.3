Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39008395AD1
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404557; cv=none; b=h4qLB3bsP+RuT1LYpx7vrHt4jx+rnjEA3M+kjzDFsb8koFj3BI2EwwPugquWul4VZzB0SOeMu+87nphr3ldo4uqR1Q+PMiptEV1x5rhEpJbJpBxTFH6uJBLiKntdsHRw+jWM7LgmrJotV3jAxaR3lKZeekz072L/g7901Ryg+E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404557; c=relaxed/simple;
	bh=3kFVW5Nz6U6ecZ7e3CWStkI5fGjySwII8rzzk5lKC5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9xXqHtkg889zXaCE3Od4vyK5nzd53TIglQvAjfN+gDlp/MijfhtC90o+5+PXcDbX0Er19kClraMwpVbbzTfnNVO5+2Jfq2THagR3oAYEHwxZhSuqmrXzSA8Lo84x/ip0/RRfotS2ddAsVxcCexFauPsr6Cjmj28aGuCwF5r8Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwszTZnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2kPGZ0u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwszTZnS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2kPGZ0u"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6P2AF2574924
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZYBA7KJEqE8Qvpi2+pbZkng941B30M0z1x+yOLpprU=; b=gwszTZnSkPrZtVu+
	1R9buWs4FR1uDn/tspjEsR9HFHFCwAg4uLKu1wgOLzW/EmMmvAW0xLZAJ/Zrl0k4
	TtWvbEfVoIltSNf/PqQdTWneuR8Yjh/l96fYjukNV4ko0WvtbkFWbQDiLG+ZgwEI
	iPLeucr2z5ReDUg3mWZdkJJEdjaFUATcn71B5APFzDYpsjJG3WmEPUa8FlA5H6uI
	TTGQgsqHRUeyqYOz0dfpoqZe5g4RBBXeB2sRlCOEWcukoOr3hZYycXT1XH3Hx5ue
	way1Lqp5d91wOkscWmLpqKUt4ZOIkcv+w+xfvvpgrMcK6A/Ju6+qrMq80+/ptPj0
	z2lBRA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9r57m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:35:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33f01b74124so2250438eec.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 23:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404555; x=1791009355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZYBA7KJEqE8Qvpi2+pbZkng941B30M0z1x+yOLpprU=;
        b=J2kPGZ0uW+r9qH4RVZlhLtc4QF+7iPz/dLFeR9Cgu3JG4TrVamGMEifs8JUAM0b4BO
         e0P/Ss6T7FnWtVYGVHRY7a9cLBhAoMPMlCi+MSprf94D3V5+3YHcKSaxpKUnezpy4et9
         YzA3D4IPhObIfJSdIHWiyDdVu27GuQnwCh6LiaRWhsp8jCasszhwEHn0/WD2mLvRG1PG
         EG+yDakkQpnX82Vx7aXDnQGTqEk6LHB6v+PdeGFkNjXuMbOdBTI6haVqb1NTCrVftPVa
         o1a2YaZqwR62gQnNUkjtOXb3keQt9wXLoShVRc2lr4W272FWp+qVdh7YNKeuds65SmXD
         ZhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404555; x=1791009355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZYBA7KJEqE8Qvpi2+pbZkng941B30M0z1x+yOLpprU=;
        b=IUHsE99y/jaIyy6MewDiNnQWLjHcGmknnO33ZqVYKh9xTDVsX+ev9SuVNmwVjrc0yN
         aMM/fy3moKco+lE9PYJRhrtuJz0NPPC7TEXAwJSykaA+RN+F8QLa/vETbcx4rlXhGZiH
         EwYIsvtTGR5z/CN4T305UvIZEJcRPq0O+yUQUPVxa+oiRJbLCT2L0YtwMyTFcLDc3lBk
         JU76g01FeCFBRuiyQEOKN1gjLbx7JbfqyzPgy7lw2O7uMsqlqXj/sWD6+U5IEZtGncq+
         qosDueTtwPKvl0S7kF65+PIPj/j4Ww1ROkEFcYI2hbKZ/T+ojzZEdAyFByGXnGETWZFC
         copw==
X-Forwarded-Encrypted: i=1; AKwUvByZZNHDRqQNQrKboCkz4/NAVpjD92GL3VxMuUXg17HqKvGN17mX/Td0jaRVOwzH5Z9ir8tOAD53u7cQ@vger.kernel.org
X-Gm-Message-State: AFuF++l+osEZQc/aS5birHeX2qQUBqCvgoJLZS12WWrLC6Br3aQd2y5z
	CuhzVUPA63n7giSV8kZ5soJ88i34oQQsGAkrWUJK4HFZpcLdQpJ+Xtgp8BlWZoYt5U8KL5+V6oH
	J7OVoWqj5ARV9kg9VE7Nf+P6Qayh0bmRr3Hb6475TkS+6H/ur75YvhxbXNcAk6z9D
X-Gm-Gg: AYBFou2Mv3vUJSyjbbGEd2waKrCiWElKIKsDxK/A9JY9bfKPl+f6HXFTiEsRRfDnQRJ
	Ruo9MH9hBKpJxSxuKtXDpscRAeerh853K5V6vj6jdwVkImFTmBs9WtW71il/NMtuP0UIGoO0mkM
	JEirT0Xjj+6LxtVCAAp0Xnlwo2aA3v+Eiuz0tIInLhb481zQFuT+4bU2zQH0RKAFesicAh3LRWH
	sdlJ+99K//bckjpuBsa6GvkOoqwNoGP3FQ3pQ39iFDwyresX4CDzedWbUpvf/UMFPgiJDPyvoON
	5DmXIASHbH6zGcFJ5vl39BQtsgSbIxn876ffz7eVDCEdnmjgXEL1rKB7yxTv8hf4thaCcA7TeYR
	ATNn8vmifqQ56JVU6qxBcs7EXM72pVAqvlw==
X-Received: by 2002:a05:701b:4512:10b0:146:5f73:d45b with SMTP id a92af1059eb24-146cdfbdaa8mr1829342c88.3.1790404554664;
        Fri, 25 Sep 2026 23:35:54 -0700 (PDT)
X-Received: by 2002:a05:701b:4512:10b0:146:5f73:d45b with SMTP id a92af1059eb24-146cdfbdaa8mr1829306c88.3.1790404554094;
        Fri, 25 Sep 2026 23:35:54 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:35:53 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:10 +0530
Subject: [PATCH v5 11/13] arm64: dts: qcom: monaco: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-11-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=3217;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=3kFVW5Nz6U6ecZ7e3CWStkI5fGjySwII8rzzk5lKC5I=;
 b=ciztsoOrnfTO6RwL5MaYR8Q+Dgl4oobZr7xvUYm+npPBX8zbl0ItNA3BprjPlyQ9XEe6vZG+B
 KsJZ2iURAqiAJ3epcFU/MHTkH6eg30SNZsb9e15qd8uPrWWFXY0yzBX
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX3um67+ItgrDH
 Yg8zaaPphP1dFaO6vgp+8pMfGU0gIixOmcwcE1oAFvvGtWE8jnHc+gCH9B68eSMzlZ1lYxc3j99
 CImPiA5I0tnenYcNeNczMSv72UDh40E=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab767cb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: RsTdzu6bovrOTOe3TNFBL4IBP_h3QP5m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfXx3uJ26XrZRCS
 1n7vxsrLlVlLTUdR2ivOxCfr3mcv3BtcpsmA8uWcnMOT/zwH/S+vCJmYX4YaIqoccj6ZvXLpGSc
 XSFYZmPMi4hYQXQvI4nk72j3Wxr4134rC2kwuMO7P42xAAy2ADwQIEdIlRT11LIt+N4F7yRhUwQ
 Dfu3BpIwGZR1t0b1yPBE6MCQpFn+DeGPFBOyh/Rsqo0ui2cLWpPPEPXJqi62NxTM5AZ3R9rnMfs
 mrBuNeuYsKOL9WxokoUJO2jm3+c0JwiA3msuEhTBaUeoBoeiCBAGoqNyAk8Y6GdjBTJ35Ezc6Sr
 79I46MXznHqNdtLM6dVObfJc76g2q3m0hEvZfL372VHEWrWaItZlVdBMnzzpS6GeGP6GuDfwIfQ
 TFmiwy09JNli/7XqU7geilrxsUph36UQlfv7nDILv4U2KG5rbtf4nP+M3VzmNytP3PZNFxNuqy0
 p6RSwmG2U3VPV8zlofw==
X-Proofpoint-ORIG-GUID: RsTdzu6bovrOTOe3TNFBL4IBP_h3QP5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

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

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d368443e6c73b934b183c3de007ca2e6b5..89ea87a274a159da872facb688cd742d8d28f3c5 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5403,12 +5403,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

