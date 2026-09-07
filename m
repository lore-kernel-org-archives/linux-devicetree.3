Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8AD45DF43
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775693; cv=none; b=gUkc9JyVcFGFOWq3LOSHCYMYrTGN7e2a0yh0+WBSh7SvLRW5shtcqVI3VePUVeBAt9M4PnUSR+3/tC/sxzQd7xdCCUIRyLlK/pDsoDGCJNc0uYKHaDPDYSrrQGT1n3O8qxaSdaJgipNfFjfPmPx7zSIFQDsRgI/DwUv+TnaCKnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775693; c=relaxed/simple;
	bh=RlfFDc7UtoL4YI+sEPICMXt/YuF7WL1UJ2L8ujipNtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C957tYJYxtQCqhwf25MEf7wsQma69bCO0en6/mitQsrXeiU97aEAXTQ8KNk1GGul5XTLDTmXN7Nk4+L7BbFMn8jqDCPm5BIwvj1RJyX1JZ7yH1szhzg++/Mk2CYSTY/eIZXj8cf3BrMMVHEQ26U/irvXtsAWOwihe1Wph7ggT4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FhuR87lx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANEoSW/f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FhuR87lx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANEoSW/f"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bSth3713158
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0u1BRLFrX5R8uNjGzbN0vqETKHPLGl0Br4CuDQoKv9Q=; b=FhuR87lxmZFl65YE
	tZC7BgRvfTtbn92PoSj09Z8LtuTlgPBqKEML1fll0f4THIhflgkwGbuWKUSVP4Wz
	tRYoOSKFCeiyrIQoZqtqGtwDRdfjgw9S2Kt/2ZIrr4BbElTsa2Jx1lyg5kUdK7Bb
	DgdI0ObJL6YyJ+prXpbcl7ztt9JoUXF347jV1cab3U3/q4yltL5WEQJS4H9+/Gnm
	PyjUJuciGeGALu8+XntLSIZQRFsxFDKVyEO1tdlgaTcy54dP/13c1EVmHByjgLou
	z3mS35gQC4EQ2UCiQTxRPiN4vy2kpKND7gPNpT0uygZFeJG16YiB++2uRt0zXDNm
	p4jlxg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1g8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:08:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so5050726a91.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775690; x=1789380490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0u1BRLFrX5R8uNjGzbN0vqETKHPLGl0Br4CuDQoKv9Q=;
        b=ANEoSW/fuw+mMeDRSnSgp30NjesCNANkCCsPr0Apu10J0S/+s7Rm3GKUgXVVHF/NH7
         hykn/6O34LMA+7ZbvrDSeAGhRUt7Ds4wJJtX1rLZeTU0lgm2wBEVCXEPzr7seR7rGrOi
         t6fTp6pzwokSSQ23iUc+A+luh5WE9loYk8oa8DPSSpkRNfZcAJOHslYAdAyDWCKmWVDK
         fv6vNUOjH0V/5VdtN+VOyNMBbwWwvBLw5PdNtS9ZBjFhQjRNEoXil7CzEepT8oaJyY+r
         rFTuEKhENDmoJyrW10fqF/1s4jdYNQT2d6ibwS4o3oWrsDrZeCp8MBl/70mwDaRWF5PQ
         B/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775690; x=1789380490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0u1BRLFrX5R8uNjGzbN0vqETKHPLGl0Br4CuDQoKv9Q=;
        b=X+k9oXggPmS1fJoaj7hCSAN9Osut9lvTwN5OQV6pN0UJb/NEOwGxrbAMYmd4/iaYz7
         OScyaLJD9y2SCIklv/tou20HGVSgMguKLDPlV90Pw3cL1CHyCCqsNVI0VTf358GyyDX0
         aMGghnoLU/k1wlBH4LSilxHPwiYA48ewfsNpD5ma06qGvHLmU1WklZ/hdGBxc/x+9JUj
         5Jt6MlI97x1RT8RlHtgXBqXPEnDpTx4zzJJi5SLCXaOfVom6D1r0Vuf+At+HOeaEgu1j
         j5FWmDQG+lG7kcIzNEqg4U8seyQHpPs9XY0n2tzGPKIgwxPzMnKXkQ+qoT/edLNHENo0
         0StQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgseSY7GevuwV/PSGLnsEUgymWdkL51XAjZvWutlJ9360M2wWHWtepAWq6Ec//DTQjh781FL8773U0@vger.kernel.org
X-Gm-Message-State: AFuF++lSJNzeqEk4nCNdRlPmXCAliyo4fOhxmR9LzOuBxBZS46r4TzfJ
	ov3XKM6mdRBCcwmKWwVeU8HBNFyRGIXyA3rqo9FsKyY/xbncm8OzvZ3J57X+9YyehSeSNd9YgqE
	v+jW8R7J0QG69LrH9YilunGuHzFqCdY9EI4Wob4nMrPVkV3smw70/nA4xNQO0wbJ9
X-Gm-Gg: AYBFou0a1abJeeWcrqaiq/IJuo7dC1gkNIBf+IAbNqUznfGGh8c+aK7rsJ8/FlZsI1b
	Ctrovm5d2JnUl7QlHQQFZgWCkfz5GCldp7Z23fp8jNjIKm5VCR4uC0uh98bW8X9tg3+nwg1/irF
	NU9CbpKNJN7BHlWSqu1taPi2fC79UC5PDCEYz/MHuWe29EsXJzItAWs/fPv6o8/eqwl0O1RqrgS
	x/4zm8+tcZ9akc8I/DiJzEGKmqyss0+BE9lxCPV+EsucKMksXHKkq5x3r5d74+eU2gR+pVlK2Oo
	nQL9qBeWkJFwSfjLO2sWHhn9mxZPm8ar3xvSnGFxsL5CXsaqJg5HfgsppMVwoCtp5jUsV2183Th
	fr7YDpsg+9vCi0ZHSozvveAZuV6s5Ufo=
X-Received: by 2002:a17:90b:3809:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-39b260d333amr33499440a91.2.1788775689937;
        Mon, 07 Sep 2026 03:08:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3809:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-39b260d333amr33499360a91.2.1788775689455;
        Mon, 07 Sep 2026 03:08:09 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:09 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:46 +0530
Subject: [PATCH 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-3-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=1556;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=RlfFDc7UtoL4YI+sEPICMXt/YuF7WL1UJ2L8ujipNtQ=;
 b=HnS2Oy4u3yJr1ppFzS4g/naF5JyD9y4C0XjBKmFXE7VwmrJujqKBaDExkKN+ByoFbY6hd8J0x
 +qxiT8TPmFQDgPkLyZu8bajUK+L3Y9wr6+oMCHVckIN8L87n/lYSjX/
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX98u3BdoFJlDC
 8TjJIrNZMDdRo8XXskTpdGqKKXmAxNMlBXoyy2OwxeGTV1Kkqzby0eBjXVekzNJgh2Sx1xlZeg8
 dIbOpU/TYS0e4rRH2b9b0MurfSexetwWUTxkGhyn6Kvi/ovKCszIF4QE/JTKlCEDf61gg4uIWpt
 UgKlO5C4SiI3Swe1h1vRY/gCpKco3h/NHyM2Ss5R8UdDC/vLgfFwCGUZZ3wNCPT+7tN27rh+vlF
 mgg6oHKkMEqHLUnsBw21+P4c+z+PoE9qzOQEwj+tKjTafWV+B6zAHwlq4Q72SuQuwqDgWIwX7F3
 BymkhSzz29JpOww1lYjukRcHxwC/RtVvFSPM9UjjWvVCiRk2rrThzfOJqYVPFfbaWcLLUhOZER1
 vJ+cFVmoO8g6NemCMYDK/CEL1I121DQxWC/Hi4dL6iFfJF2ESYfqz19B/5TnmpXpDG8qAMtXJoa
 Jy0ZkYvx4lNX1sZbgqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfXzxbAekQTf44p
 QkmPYTVfH0VQyX7zX6mFK4VeKje54LucjTaHNMhcyqouYSUftqCQEhn+gst2Hz+Juq8D1bAbrJu
 om5s0Xw2agGjTuve2myRqMR0bSs7jSE=
X-Proofpoint-ORIG-GUID: Gmaj5qzQpj1IJlJIVBtpB1bpTRmX0GRc
X-Proofpoint-GUID: Gmaj5qzQpj1IJlJIVBtpB1bpTRmX0GRc
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e8d0a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BBkfL_16RjGsLhEIFcQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

Add pinctrl definitions for camera master clock pins on Glymur.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 4c48df593d1834a6ee7d97c9981965f557cad16c..ab1f742d0ecbce7268c76a4d3b398dfc518ef0ba 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -7090,6 +7090,41 @@ rx-pins {
 				};
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio97";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio99";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio100";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio101";

-- 
2.34.1

