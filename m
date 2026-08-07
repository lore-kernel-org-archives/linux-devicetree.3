Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957646D554
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091295; cv=none; b=eLl3U8RgHEDRBYU3q5MLSfhzNPt6HjXgzw/uRUckmmW4dWXV72sIlSh7WRLdPmzKsfMJktj8uEQKa0wXgypEAdLirm2nG1+Z3BM5srb5axBfk3TurkgUqAEIR0+HN0OUP1IWtc5GbJ7PpWQof4SxGaJU0zP+wsC+iXMSrVAfSfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091295; c=relaxed/simple;
	bh=8/6xFOoS2iSYAo1lVZcmStYqyqoxabKr3P1TAAAAbJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QTOlsuCan0xm29sCgMmrQiICsV3GhRW2suo3FPrbElxXftUav7cPucOO9DAYcj2AFFj3kbE2xUj99EoDuRJCgCMrWaaVm71MobXBZeJ61b1Q1VE8KqgjyTbWVqU1qQeH7aF8PIha2HKr+pJjSJUp+uKlc87krKmdenSQ3AycWeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxXKU5oJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGqpg35Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxXKU5oJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGqpg35Z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777bwAo3534934
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kJaeOKTMGGqkbiKRfd/DVlD7jfmrG06f+sxa9jau9c=; b=MxXKU5oJDJf2rIKT
	NAIGY76WiRtC/IrXya4aJa+51Ivli4ESNq0NaNU1REZl7g40BppyABwG7oQ0mSdT
	SEBTZ19Ez2KZKCl0pipxxXjSFNQQN6TOrfYGumuhsi+lXQQ5KQLXcVFeiwCA5Adg
	fhKs/vFLbm6WHiUVl2cTuoWdkgnnuPVZhFEN2arxGe2AbW4fraElCts5H92PJhoE
	PyfYvbETArFJ89Q+VLwzn7TbMxuu63gZ5nJ0fCpk1+Zda7JmC4CRfJGHxExkMkPX
	t6qE3Av7xL1sirBPOgzsGs4cYm1Dl6V+9VB1uw2WRtW3HC0IuIBDgYM228OjS2qZ
	6smiPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fu3yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:28:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cd01a14e81so44363175ad.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091291; x=1786696091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kJaeOKTMGGqkbiKRfd/DVlD7jfmrG06f+sxa9jau9c=;
        b=YGqpg35Z/sxVHBqI1jUu5WSTIvOdZfUGSXG/3IW9M+VOp7t8Bw1prDGvdrjYRUm5Wa
         7GscGFg624xGwqXFBsfmeD1cn9/1Vmk83fn9qdt1NIyYE8DZu4r2RWEQQIKA4iC3pGd7
         I+8Q89lY8g5ZTmTH93LY9jATXdh2vWWVE9YF3xn+8tPFl5prjnF+p8p1gLOkSu5j+TyK
         B2MRwFngRqCKAXeu72dOpJ+YwQvzUqqPGpmZB6LG4xVzk6VdFlLXkNvGDpUvT+siQFXd
         Gp+GmcTh5TtIq2yuuFmHk5JXOR7E5uJjOuqgrhaOYrUkfCEyby8t4zkydf818rl6RHaJ
         g5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091291; x=1786696091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kJaeOKTMGGqkbiKRfd/DVlD7jfmrG06f+sxa9jau9c=;
        b=e/7GpJROABXRiLmObfnwqjOAwly6sjHLBafxf3rcpx3to8pkIxytt0wEUDtJPIjVo5
         2PQ6NnZDDATLSaPVJt84JQ8UONmBRdbVo3y1Lf0Jxf0vKhuuNRy9OgMSXWkIuYlVR3Ii
         rzBbtKSFUPepCcbaIFxp5pvFA1QewG5NYH291C3ENW/cTx3oosXsjiLyWmaQLf2SGGRO
         xS3z76DifCKUyaDtvZJrzZD1ZC7JGZ5FwaAWQaPxO7fxTFqrl2TK4nYLMFq1L3o7cC7E
         urWH9UlYx2ENXDL8HbMDvcR9ZR7i2uZ3v3tSVjNWAdnV0qzWba2RKvzk3DBJVewxqOHp
         ChoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAnAKNBxDbB20b0qp57uQ7icOyfus9eJ2Fp+NFi/OReKeJ00q30LqpFBNsbr+S1xS+5gKjHZJzcTQd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd7kp19heH5h7caRiszqKIuAEjMEDAipGBbxSdksroKBFHTWCN
	26MEp1/c7aHbDge9jXrI6H4RSJ2fHgXkSD6Pkg7qM7ogI5HbkrthWSPvcNhWmNl4CWBKWin5lOR
	wxmK4SENSerqij9evk6msA2wsGNhP8aPTKAM09ZvyOPj8pH1/iaMGKNaZPBB4hn5T
X-Gm-Gg: AR+sD10IdMwcYkQqpgf01Skfi16EWOv3WfwZZ4lCTH5mZxEYSigcnRz6T+xcYy29jO+
	Uv5v+EsWDbO2Bpv7K8+TqrPXOUOzpfNEC23EwnT87K5bytC/CAlhvBrlqVSpmZGscPekhMe+8ec
	O/GopuY5QYUSI6vRCLbmZanT4C9z8XNt4rB4BO/o5mtRWMsH8rAeTzCXH/iFUBP4ZWX4mcY7ZLP
	8c9+7oofKzRqQiBx2KMxtwqD+TXn3YWSNH2fzcVLJsulcGUTzjw/gzW+xdqW7ymYP1BkWMu+1g/
	zuuyEojbb2eBiuZAJx47uqIWdZeKDIxW1mBpOnVcOZlivT7bX8KFqRUoiCcnYXbgFmhgPK6EwxM
	YsU3jFWZjRSU5pDaRDjbo5Y5be9PGzdUW0zU=
X-Received: by 2002:a05:6a21:1f89:b0:3ba:f5c7:6bc3 with SMTP id adf61e73a8af0-3cb85e9924emr25383747637.10.1786091290989;
        Fri, 07 Aug 2026 01:28:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f89:b0:3ba:f5c7:6bc3 with SMTP id adf61e73a8af0-3cb85e9924emr25383687637.10.1786091290540;
        Fri, 07 Aug 2026 01:28:10 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:28:10 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:57 +0530
Subject: [PATCH 13/22] arm64: dts: qcom: kodiak: Reserve low IOVA range for
 Venus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-13-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1897;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=8/6xFOoS2iSYAo1lVZcmStYqyqoxabKr3P1TAAAAbJ8=;
 b=p6oNxPNJjeYzPb6Tfc6iaEKXXtE9dzonykPnzz0nse7vJHhJbrKhk/AUjwF/Sm0Y1GUyvAKSR
 LbsO9IX3bHkAjglM6QliIYkk+WoouAklgcJdD5L/SQVHoepBN769ZGG
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX4+BBvr+19ln5
 D/k6wFgRZCReh1T9QyYyyRZGli4BVwRIW/BTfndxkvNJR5FSlvjrC7Uw9Ww0DxB3ZP78lnd0iL2
 ZSysNUNLC9mvb2Fba0Guisvz1uBTBFmJGbietiL+s3GYdBbHy79PCVuodip+fc4F1oB5NlTuFBY
 BJPV/lxTQ9HCsZ9uHBMM9RAwGVvYaBaBPmosxpE3/Un/1ys99cUb8rx01XDe6zrAP3205GSpbXR
 mVfj2xJRtDQZ1I1VvPNBYV6Y7QguQzN63qluclKSRLknoXTLsk/h7pwBADjfU+Wgtzl8PZvvKEK
 c+0x9W2sxLGdz53H31Kz1G+/B1CURG2jNcK5/vwcFmH64cqbLfE9QoBjExpqcdq2nh78NdXmBbc
 jNBQf65lPDcJteD494KDCWQjk7UgAjDvMNbArzC+jnCEQcAIby2UtGVYzjEtMd9KTQU9hy0pH3X
 VFDGF9CdThKLmwulN7Q==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a75971c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: A5Fdf1_djT_iwQr3hnFKxeH4OO7bTb6n
X-Proofpoint-GUID: A5Fdf1_djT_iwQr3hnFKxeH4OO7bTb6n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfXyq+FcJcHbj4D
 rGT0dxvBFCaYMXfvvg4z7lsiedx2v0yNCPu6ZSXfwyteW4nUpseelFf2cQ0QMlbEoYMrhmKuIJ6
 R7mDPVg9i0pIeFMRjJpKKurDaoDlj54=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070062

Venus VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the venus node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c887e36a55dc5e2f63dc21e940191c..8894149a3d4e238dcb996e25379892949f7302e8 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -198,6 +198,17 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
+
+		/*
+		 * The Venus VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		venus_iova: venus-iova {
+			iommu-addresses = <&venus 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	cpus {
@@ -5026,7 +5037,7 @@ venus: video-codec@aa00000 {
 			interconnect-names = "cpu-cfg", "video-mem";
 
 			iommus = <&apps_smmu 0x2180 0x20>;
-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&venus_iova>;
 
 			status = "disabled";
 

-- 
2.34.1

