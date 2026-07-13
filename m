Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D273B14B6
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930645; cv=none; b=AGzRNy86wBx4tr5HGltrYxLs5vOAPVR+eFSop2M0AeXD+9MvYczls+IgzMIF1XlP4uRrWgp0p4lxiFvA+2WAnsSwAYuhnVX1HVfJ5rf/CXSGexh/A/R8bFvCvXJkQmWpoqXJbu3efpb9YHHfZsGRjYSRmpWOPaEkGE1kfRnAcdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930645; c=relaxed/simple;
	bh=SevN/h5S6DPgIuqMF/YDcs3elkEIxRkJIUzLiwNvHUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FyTzG19D2jkiZuFNhsaNWwEvadffL5IbV38tpUHkwKxM6vgu7eS9hjkyA+0vLfjSKG2A2gUDBrb1Csvwi1LJZL4H/x96GavWWjZL5x8IJEl9GidOXpSzig61vCVH0NCP6n8HEq4JA4Qd0TWdXr2nc72recYch2SuQzcYK+IzIdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDfa16sQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kkDNq9u8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDfa16sQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkDNq9u8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NwIS390874
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=; b=dDfa16sQG3zovPs7
	EYRtdAhDT3TDREkG8qZ58wj+gptstuXG2ONEzXLsynO4+JGzzdbW0Vti/oYdoUX4
	SzAbLY2XMt1v09ove0cPSLxnHiMdQfnatC8fTIfxHJe2g++F534vDZkcjdYHMKPu
	2WOc2okgloZlY1W6UR63/pPJs6zzlmRZJPtQNhQbCGG3CvWTIdUaCvt0i65pSxaf
	CXf25/yQvrnOI0ZMlbYxWfBNHqZkAluBDAAwK2qN+2WPIHl+JBouOCXBbKkwbjLu
	NAyqMNs91cEIxZ3528qMy7p30Ez1vsol0a7dvAEyondVUQThS2vbSUmyPJkFbctB
	cKJ22Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gn16n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:17:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484f26852dso3622637b3a.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930643; x=1784535443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=;
        b=kkDNq9u8e/Hin76sbrX413RZU5G5MeHVWV6bvFL6U43i1iHf+aTeh1/msjviWo4Vy6
         FSuUTERx2S9k9eAiETnCRfq86HUn7zobNHRex7dCkcINz1HguVMyS4T+979JPfX9Vwnn
         eBYW7WIGtYXhMb4g0CkO6okx9dz8UeVKwSDcarErvuQgwi3LBQvFy4hxl3NyDYOkdvXO
         dVvsEnQxvJU2eckrrVnztnrMIXcyX7Aza+u35ttzav1GpTWGBqyil5z5P2orQ6sUUR48
         LazcvIU51id25hxH1D/VHfDl5Bek9fO9KMW9PCHSalut/s9SbizAmxKeXgAthOTOxiF3
         O7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930643; x=1784535443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkiq0j1pviRQkhRsTvh7m2Qc8yWxZ4b2dbKDsm5MlxE=;
        b=imT/8KSZ0Q/DnQn+YzbHFHqjIhNcxITWOPV9T58aF1jkC1saLUhu9zV+K12EfOM0BF
         EXMP2RIt7iS+4WXz/HJuWwcnXMEmSKZLCdUTWtoSVFNRe+efvGvSnVpifzQ3O13tHieI
         nonPra5wGkZXzcnDT0tQvBi+ZURMZc7JPpqG4XPtTBjeLM28fDV4fSgNufsVXIBNsD8w
         D6J1PsSXRyLApvlP7FEK+eUwHvia5p7Ws33n48Cgm5xT/fojuVQjCYw32KZ/BPSCKWZF
         VSmXej1dFySVAzfcJvUcD+0uFW5uM5SzdHeMMg5Vk1HAjWhuHfXb21vtQs1mnGYrwlQ9
         1htA==
X-Forwarded-Encrypted: i=1; AHgh+RofXIUUGkAGCxZ5qqa0YQnvhaH84FdK4Zms/gFl0LNW0KuajZUhKYsk87L3aV10shBk8dVwTHGu/PsJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJX4EYbDpC3oe9D/B7wih4ra1FQ0w9WPlrJreyeIVRAdxelRXC
	Gv79EbPI5ybHPmfhStl82rKlJv1JHNkhqIBfvmO2khIWysQpCHk0FiBvQdAc1m/y5dNacXK7Mq7
	toLfrUVIRYouTB0FeYsSEuBjMxi0fgbtwid5yPLvej+l80PGLH+2p39mBTYu1O9xW
X-Gm-Gg: AfdE7cmbHu4/W46F45lTa9zBXRlaIbPo2ArtftfpqYOgf2fSRPTwjJDWoUzZjJksW52
	EGq4uoy0YQbdbGclf4VfWMR5N6AlyB1fugA1Fa74MDwiZQsPtqmRWckH/dyjGQSa/8OIpVE9fIr
	LTxjjm50JtG+Sek2qfM9M1NHrNX0wQX+4bkTxwltWQXZCllucOVKxW5aboH7zee9IkL1J1HIzsG
	BguQ6lEdVHv9ZrVRafK8iAM8ttlwOrBeC9qZgwNuNwGHBc7kw/v5j57u/FPcEvYX0w19JF+A68L
	8cIyuGhRyLc9oH1QV3148yG1i8fRltt7vP4rngnGJLz2M+B8M8RMeYFtzgAlhsN/l1kk9Qm23WQ
	ivP8rUDeru8grc2o6ugXph9GAgAzN9MGqkmECx4wu
X-Received: by 2002:a05:6a00:234b:b0:848:2f74:1d61 with SMTP id d2e1a72fcca58-84889736717mr7658915b3a.71.1783930642601;
        Mon, 13 Jul 2026 01:17:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:234b:b0:848:2f74:1d61 with SMTP id d2e1a72fcca58-84889736717mr7658887b3a.71.1783930642088;
        Mon, 13 Jul 2026 01:17:22 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm6283954a12.6.2026.07.13.01.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:17:21 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:46:56 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
In-Reply-To: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783930626; l=1012;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=SevN/h5S6DPgIuqMF/YDcs3elkEIxRkJIUzLiwNvHUw=;
 b=xuvVkF8oex7JpzIrIfnTWJvaEVZ4HRG2/Ubb7jjSlAoTWkgJr3VcSjpUwZvJDyFaDYhwDnl1J
 1iBKxsSOcaOASKhehcXtGVi4j2mdp/C0StsVJ/SncgCp+LVBpFnaJxz
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a549f13 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DU1Wev2QKLRUMiDuaJkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: C5-ChKr1LmgsyOcLWPBNYEBE3vUaCbHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfXwTCpQJH+sZMk
 DcrR5VSzLMDU4vzGgMVLcasfJPBmpNFMCP0kPQro9/wWZFzCfQ9X+P7udKV30DMTljD6bcTkPXg
 erTvQGYPODsVb1B5UiWKJCXAbuY6DgudKAvH+0IHQqo3wV21A5PN/U44IEs+n5Q7WbUCvPHLrMA
 07PWKuO73HEgUS0cZ4ySDVwT538pELeIXBgjDwbJPuasTxg6YVh19qbzBjtY3AX4xSDzRqGCLeL
 C1YUGlXgjiORmVgQnah9JPCswbUdjf7Vh4KX7RNjDnquQnGZpkYReM8s+RSsvzaliR6hX+BP1vO
 6eoGNcrgcshujj65JDVT9yABskq7AjVFzLEsGfKLR7bI8EH1GCZzV+9ZUuNK4lNafRLEoZkpsID
 K2E/ts9/pztS6JlZDH9O8wXWWIQHYm6zoy9WT90iV0GLSUud2AoB+wO7wkoAaXys+N1fP1z/pGX
 tTV6c6DB0maosRU8+eQ==
X-Proofpoint-GUID: C5-ChKr1LmgsyOcLWPBNYEBE3vUaCbHg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfXwMdqySgcpUuE
 xAqbDZTiCjK35CGZlbVDAXv86FwABx4ODziAzlhjlfXh09ZuPielRdzAMqNE+mP90Q5FPlTzUvm
 gpBbxky2TvXaz4kENHBY43nR7+5XJRA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130085

A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
stats like vmin and vlow.

Shikra SoC specific compatible allows reading individual subsystem level
LPM stats along with SoC level LPM stats. Change it.

Keep "qcom,rpm-stats" as fallback compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..b299f316e3c61858c4b380f6211d0f36ef9fecf9 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
 		};
 
 		sram@4690000 {
-			compatible = "qcom,rpm-stats";
+			compatible = "qcom,shikra-rpm-stats", "qcom,rpm-stats";
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 

-- 
2.34.1

