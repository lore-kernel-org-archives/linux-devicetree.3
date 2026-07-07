Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B803CDBAB
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 06:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407344; cv=none; b=AOSd10hx0OP3ch4SAnSH+FXrBZWg0X8uFW/I1FvrKwSXOrMXmw0XIHEmFGmNt+9eLNBmTvshOaOOeobsyP8C+U9E34Cn0RtBVv4w7oMOXz6ncdfWeN1o4CuUEltJ0O1kOKGxpUEvBugosTpanNufv913u363ReWBZmsk0YvYkok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407344; c=relaxed/simple;
	bh=6scFAplSDWvq390EfKwCS0q8qQMAFjHSWaPuzf2+Lo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q1h8jbhfX6sVlQOMi+TAh0MvkP2b+73XVDuI5dt4wggcCZV8WwgrS5T7Rb8qeOFbfKyhhNZTaeBv7cFtE4UXAqvf2HQPSB0fECCRWTqiBWDcEU/lCt17Clcrq1xdGcZevtD68FG54l/T1fU9/F/QHOBA/kXRoC4IuO7c/udllac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCnqNWa+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4veI2su; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCnqNWa+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4veI2su"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749pSQ2527802
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 06:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxMxApdb9aRLVD+Bcbc+ocNyw8VP6JGFS5XkjZmyyu4=; b=FCnqNWa+Tbu3Bsav
	p0qEapJmMVUxWDb925ZG6Wir/h+ebKDI/fPCZTVSGuFwIbVjdstOAWsc6KYs3BW3
	UMtr398SK6+3gvCAPUOwce1ht2+AS8Ug3tQWS9D6HFr77lFBnA10dYEfSrqi5gBe
	xkKX2WsX9DzgYNRqkAc0JQ4/YwlU7dYcFS2yrpzW9397LYr2gLWaFQlp78CAoTAN
	//oLkm7XS3X/aOfL7U+8BuaRPLVT7DRJISEVifXLY4Oa33t1xvO3UZTuK9WaZxCr
	4TwqBaPRp/3qcKzAdhECdFAVEMN3+HQj/s2ZIZsQVvDQbWYeCDqXrt4jo/vZdmII
	VJrfvQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98mf7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:55:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so6520215a12.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783407339; x=1784012139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxMxApdb9aRLVD+Bcbc+ocNyw8VP6JGFS5XkjZmyyu4=;
        b=U4veI2suERBXqA4BLFMWa4h3QPwwb3kHWQ2H2DVU80fxLzewG3nUUNbMw1Mr7BDJUA
         V9abyMcbcXMTjclMz/nwlh0SnAsByhQqddH5RMOfAIV8Pntefy8CLW4BzDdCh4VMsVPt
         PRHtj7yB9GK+HgVWdRN62SosygTjAIwkYrQrK6u5cHPGL//t4m7rMjDFujzO1krqVqnm
         n1SGOrNaAvA/wu5yjzdg+rvRL8tOLuuDVPa+bAz3rUKVndCaL27Bk46P5M4xlyCHhVQh
         6WTAmwJ+X8Fb0SSNB2L4PbC/jcJsFBYvgYuZUTX57yclwMRto3PVqenaaxe4jlOaz4jJ
         OoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407339; x=1784012139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sxMxApdb9aRLVD+Bcbc+ocNyw8VP6JGFS5XkjZmyyu4=;
        b=KcxAoa3K7n9Gdny6LL2wCdHO805VLP6eZnMjmJvnUmVVN3AHaYDGj3FkCahSKc0vjL
         hpAQeX31tsqS21zYXEbQGwyBqdCG/WODdFQmrba/8yjGlqZ+r/fxj/m7NLn8FG4joyMr
         BARihL7UTx9Y2hE0iquyeVfFkatPKIctU8ufi1GU83dT7MHnwaAzrohADGLmPPiVM5gf
         by9AY0sf9Ye802SxjirHCN3A4J/RRcy+pbwNr6wtYSlkPUT0luhd6Cwk6fYZ8MZbnd/7
         cO9tpmln8z7g/w/DnhoQynsQoccPD60yws0PqvrCfzgv/rfS4k642fgUZ5FRaD7iykNx
         w57A==
X-Forwarded-Encrypted: i=1; AHgh+RpPX82AoPvaWiln47Zxyxy8i6SpI3N6V2oIX84YUlpFNpU3BtmzUgZL9k3eMiLR7kWIwvb4IuGJrI+s@vger.kernel.org
X-Gm-Message-State: AOJu0YxrCxyxbU+4IbB8I/c7rYYIjlA4iyldbEJ3WJQQ0npkE8I6uTNS
	ewqgUylPa/ixm+2UjofQoXtqereqOqaYcwldJWvHHpbfB30yaW6wVnJxNiHUnavCzWHQfYIGvOe
	24caSCd+G99e3GGgJ7/7L1MEoAIiets5hVgv2pMWNWvejtGRKPVbvnKFU9az156Lq
X-Gm-Gg: AfdE7ckxRmQboYhFRVFwLc3cuddPEzdt9QxnyA6U+09J/luOp8ZINynSfKSpHf54qRA
	Ejcd+4EEW40NXgs+KfnPa/ZZ7a+YnaZ3qeej6XCK01WeBppNkhAAKQd1Zt3sa2rq3XVqSk0DrqB
	g8UOyebqSfb4qnaqnuG6JeZWq/N1yp8zSbIxBVTBQ/JeirsaMTyr1Q8FCtM/Wjm0FTrpczhKWU1
	DPT+yVLNkIHW9/hKcvFSHyYBje3mXTmha9jSM7lsAbMpFwHVRj1lleeolfUz1x3ZApeLXe6X3UL
	o8fmcqC8hwvE2k2l2u3i5u0Cn1RgeeBBSFhDMQ+xbylZsntyawCnW4wTXfenKbqTeRGYyyLJWxG
	3Lsja9SGYkYBg2RnvgGqSEY0IfgjXhfx0JUzxdd+5rLLduajbv4JHgERdnd3aZ5OICWgE/5DW+R
	85lRvkyGpunALbGlULh1KVFcTyWFFANKocAsRqKG+6oNSPww==
X-Received: by 2002:a05:6a20:a103:b0:3c0:9c19:6585 with SMTP id adf61e73a8af0-3c09c1966d7mr2006036637.63.1783407338802;
        Mon, 06 Jul 2026 23:55:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:a103:b0:3c0:9c19:6585 with SMTP id adf61e73a8af0-3c09c1966d7mr2006006637.63.1783407338339;
        Mon, 06 Jul 2026 23:55:38 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm5055480eec.13.2026.07.06.23.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:55:37 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 12:25:23 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add IPQ9650 REFGEN clock IDs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-b4-ipq9650_refgen_clocks-v1-1-e070624d03d2@oss.qualcomm.com>
References: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
In-Reply-To: <20260707-b4-ipq9650_refgen_clocks-v1-0-e070624d03d2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4ca2eb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kFjMkesOqst5SjKo_mUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfXz1RWo93QwrtT
 6QyqpWBW37K0o9KmIpyorNmHf/JtFRVgXvtlcEbSXRLY749TLGP8GY2g7J3SoJfKdxFjyRt6YyV
 5POnWy2MLAnh5Zvwlnd2r2bszHdBVVSjgmYjr2QBgxRQFWpCmMkpLl/mkCaC1NCoOOOSKcOEz9f
 tbWrs360EGBObYP8ZIfzfLX+orqDx5t4bauYM3qNorc84rFYFB9KCTJcuOeAUIUVzYQH56X4IQT
 jWzICZJIYe28lNTUZBEvIo92Qo26mVIUA9K6bC5PO2xfPZKBY802kJgM7mFi4qBieYE/mimG9Si
 UC9yyAWwhbaOYIG/azJWSIUHpI/lYRqs8FtT/EuwhDVnqpQhy7fq55+ksrBDPnurDAAKOaO1pMc
 e9qyf43nTA6pd3AT6/iL4YcNIArEa/wrtk2XfxkM8RefNOu28K4MI7TgKKLKoJ3eVTyFAi7M39H
 ZR44H7/KLaMXuXaSVPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX914lCPaYTsEv
 uG6703GpkU7EW6pdcVLZ5iM0N6vxIuMe1E+AnA714c3M7AfDQ4U6rIHREkm0r5puzoEkssj/f1K
 HSgr6VIqyW4WyfiizhHE9eMl152HxPs=
X-Proofpoint-GUID: l4Cgu9eS0zZDo2fAS54wdfobicCLCqgC
X-Proofpoint-ORIG-GUID: l4Cgu9eS0zZDo2fAS54wdfobicCLCqgC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064

Add the REFGEN clock IDs for the IPQ9650 SoC. These clocks are used
to enable the REFGEN block, which provides the reference current to
the PHYs in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,ipq9650-gcc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,ipq9650-gcc.h b/include/dt-bindings/clock/qcom,ipq9650-gcc.h
index afd17c00d96e..2d43ca36c09c 100644
--- a/include/dt-bindings/clock/qcom,ipq9650-gcc.h
+++ b/include/dt-bindings/clock/qcom,ipq9650-gcc.h
@@ -169,4 +169,9 @@
 #define GPLL2							160
 #define GPLL2_OUT_MAIN						161
 #define GPLL4							162
+#define GCC_REFGEN_CORE_CLK_SRC					163
+#define GCC_REFGEN_PCIE_CORE_CLK				164
+#define GCC_REFGEN_PCIE_HCLK					165
+#define GCC_REFGEN_CMN_UPHY_HCLK				166
+#define GCC_REFGEN_CMN_UPHY_CORE_CLK				167
 #endif

-- 
2.34.1

