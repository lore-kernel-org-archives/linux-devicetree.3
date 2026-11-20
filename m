Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173118;
	b=Gi8aA+QmNnAjRWQ8inC3MoXWVcuc0PsmIPPcM5KyaRcxcojiJ5/WPyoRaVpxP9HR+i+f
	 lSvPWOSdSXGMZimCKOTY2rMqM1PzE1WLwPEZ7ONfz5Tw8O4F0wy6STu3adO+zqXWacAO8
	 hAbes9mTi4qOE0FiXRiSKvKSAkIbCNNPD8AQMazTu0IIcevvnIIrlmbxaWY9x0GgnjDh+
	 jfJ1AQRcNwHT9v92Wwb0+O80qU9WUgryDyymOSqjeug9evpD/3E+EVrXp6yqvUyAGwkxX
	 pVD32UTNNdTSYuTUaAPyBHf6N+5O5+K//LBjciLbT0haSD4GzFYs0/Tz4Hd2059FjBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173118;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GinH/XlQfvjPQgjvP7J6UKK2KAaihoWZf93tqcQ2sPA=;
	b=bF2GrhsTgM7Bpe67gz8JM3pulLBqwO1/dqUpMWxBPC04wsUVNr45Ja1/51Ww/m+pKmba
	 zwT+DzypOgD3tZx64AE3rl4AeoUkKumQ9J9ANyAEtIA+3WG8Qs5C5eE9cWBm/umhzOzZB
	 fjNmHNzIvLAPp1/Usz+yRjentmprIhCwLm+rmDfy+DZjJOyW42+u9dUGc/h5PFKBMFFD5
	 mzDhhA0Z3Vr/RiU9ilwUfcf21P5J8LNsB9ceKDPMMNL6kZKZ7qiJR4CVpiKtRsCs8nyus
	 ID13Pd3/GVqyZ0+zlxbEt7mRoqboI75+SnBzXWch4p3a9FLKnFQeTVhIhsmaDMfNJRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRNz8WhW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8XCno87;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D8D60A5BEB
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93D8D60A5BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRNz8WhW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8XCno87
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk2TF2433198
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GinH/XlQfvjPQgjvP7J6UKK2KAaihoWZf93tqcQ2sPA=; b=SRNz8WhWsS1UYZAG
	y/TLwZO41pdpX9/NNV62+XhOU21XXPoXrXBC+duejj7wSEvvu9bOpmI1q71VaI4b
	qVz0ezbCDHtNowBjbhP5Uex2YF4tNqO7em69/1ma147c4taBhyXrxT48hivLh/Hw
	Vsp7YnjfcN+DThNea1KUTqZhW6cINwGYgVWm9JBXJBkc0j7h+QhUz5wELixJskWM
	cEb064wRp/nSCEiR3FrYbTwCFjiw7rfEhLXtKINUc8UrTByiC8PqEp3oHO8Fkgk/
	KJdexvcmSGAYM+tfX3WNXGJRSpCTZ+aUnKd/hC9J/RRlZHSSwYgO6PYPmekwtZr/
	aoxjGg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9fhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso978791eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173116; x=1795777916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GinH/XlQfvjPQgjvP7J6UKK2KAaihoWZf93tqcQ2sPA=;
        b=W8XCno87Sr+e51euSxDlOemmeaOJTKE8IX+q47BRU8B8eg9odvbNDaY3fuJGiZ9PI1
         N0FFToUpv0DXQ5F3Y/g3V/k6wsjHF/eGnrnKRQTzW1PwT2xdtW86iov7ANJfAKih/nUN
         AG1mbmI2xA2f/8H57L/q5lZPlPGWJkL9STQQ6QlK2Hy3+L9/Adm+x/TeP2jJroC8GH5c
         pB9GTF9PMdBMkTIQnOu6FBbK6D7ViHzW2mFUFOOxs+6eE218NkyPRa8eQH2bZBAa3Sqn
         6eWc6KLW5bculKdL4AvTO8slHlFZTBsdZvLrn/I0/GbrhlAJIzV0guJuP4QcBQr2Zipz
         TEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173116; x=1795777916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GinH/XlQfvjPQgjvP7J6UKK2KAaihoWZf93tqcQ2sPA=;
        b=zCu//e5XfOfSpni0nqClj7Z7EfsIdBHc/D14cf0tr5aNOh2xtMDHKzoH+5l/PB5Bhr
         4vQQ38o9fQG1pIWrF16WV0Vk02tESIO6+HCwCxV8ARqKUbq+C+qW3zGX8VQ4tabhEFx1
         JnVucvDtDpMr6NanGGyaz02hPGPlnf70txPb/Xf/Reh1vRKBKAXbGvqnOygTUKIxPreU
         CWUbptR+GfAlva9NbZRXAhCx7Zflha3NIGlsCGTViPniqKLPkKz0pNNKFslEPwiB60T2
         qHCt8AOLFXnshHWTxjDw8majmpNFxoEtMfzBetAyasV4sGcx9cNnKioItQEdXHHD6DhY
         58OQ==
X-Forwarded-Encrypted: i=1; AL+hErFzdpD4gvY1mxDD/J8GRsfF1VpNEhngCbE6Vew7BmJHKrAmKVkd5bckqfKzBcQJQLabzIKDUlTBXJX3@vger.kernel.org
X-Gm-Message-State: APuU4Z/gs+Ns6pDtnxDegWNDNElTrWq4wmD9X9KkJcUjFJOXaqsLZZip
	z7uYuQjGDu8yhKHFHO2GQidoBg4w7UAWKxP/rQrUs8bpzVktsQeAp1v0sSWdL1+WRjWgzjszUxH
	0mwlr0AwTKSjlal1It6jarZHGg90zl+bLaE5gxCx82iYT+woES0OvNAvw3ZUjNC7L
X-Gm-Gg: AYBFou1W+qunvhRtgDHBq/gdNkemkSVsQpt12sSFT0oL9Z/DqfNKs54LHwoMmtoChnT
	n0IZDUYU1dNFi0Qcvf52VDDHzFw9ai+9OVba9NWQd0mk5f+VRJ3cSUMNiod/tZC7p7t+abz2MCa
	W468aEZht1WKT5J1GOcpYz77DkxDQQE5hs9QZrEG4lK62mC5yX5YfofaojI2JfmZoUFx6rx7cy5
	Owc2fIT14NaBYZPqipq6dovAQSFy+JdSJe7YJfnmZeKYBgQmrRHOp6w+MI4pbDdm13WvsOm+hJN
	e6nSLeegKw90kxjwo5ZExFEEBZfkZYLuaw7Bv0uxw3vcug9E7ZR9+k/rLyNCQU3V4nWIk7RZjUW
	TD7rATXYDQGA2eHYzjLBtCgUUlR7ZYdQFi3cMDB5ohWsqKT2RKCLNjSreZXEborqmXguJ0fIC05
	qpg15ktkjs
X-Received: by 2002:a05:7022:7f01:b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b5568aeb2bmr2348983c88.24.1795173116069;
        Fri, 20 Nov 2026 03:11:56 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b5568aeb2bmr2348956c88.24.1795173115508;
        Fri, 20 Nov 2026 03:11:55 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:55 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:58 +0530
Subject: [PATCH v7 08/12] arm64: dts: qcom: sm8550: Add Iris context bank
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-8-25a771235a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3423;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=X8tAxkzMw1wEATctH4Ad2sAV2eJmcw304ql4kPc8PM4=;
 b=5FSQzCTwujSEBgftO5XUxEyJbcYHFMcEHSw38p+chaEZRFHR9ma6c6ZEzSR2+C4VgtSTtfQOa
 Of/ktLYtV0fDLVgGWtYLXrNhRfvydl0DLt9QOxNkh7oFZoArrm2Lmu6
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b002afc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX3vVwQIYjgGnc
 sO/wH09a2CS5Ob9OBkakcY/MdypZVKlGiSTW50ceSsPpx3532k4twYItzfRt5P0zNlmP10VHwph
 oZf4lvkSpOmLXXtHs7FJtq6/LuVxty0=
X-Proofpoint-ORIG-GUID: M0XTyUAHuIZo5jQZeWkXlXx0Vwaae9Vp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxsOMs+ZV1est
 dSOEqpHSIMUk+d1hsYTZRfCTD+AksHzUTpLvaNv16Od99VNq4NGiC0dwO6ob29eoaJR1C+YR4ij
 jjTNoyp8Y479CMUoS7+aFk5DJQQ3gE1mT9wAczVCVvNaBNvg8AhIlN+weciRLlDaCTQu5fWjn8O
 LQ0X5cw5whJwRPrTI3SObzpbU/5NRCjnJPCML6HNrKopZYx4W5bGYp6bst73Su5cn+cSHvsxkzs
 aJ0xFIAuU8g4WidlZmWEJxzSfYShqvDmowYFbXrxJKxzBVC01aJPW10gNM38qAX0CEPF7g9R9z2
 JUunw59QsTs/zoLu33x1Zadk3iWgQd0INJCoF5+Mp+MsenngkH2B0jKtK3R1Ui4doKH8kuYTpis
 zjKTzqu+0z0A8oPr+Vw4OxabvXxZUEKLqfZI2v4w8j+f4LaXdlYxi5A8OQFVUphVxRfj27nw/o2
 8x5qNKyEz/wwsAQr1UA==
X-Proofpoint-GUID: M0XTyUAHuIZo5jQZeWkXlXx0Vwaae9Vp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
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
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index cf7d67faef92561a7e07a79e0454bb6ae13b7910..3bc4d08d69b30b729e2bc859a4d86b71e868afae 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3712,8 +3712,6 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
 			/*
@@ -3723,6 +3721,19 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
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

