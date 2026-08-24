Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A47411FA7
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572613; cv=none; b=dQ7IkuyG7XrFt9dL7AI7dCP7HYtP/suFdmZTvceoc5d2IW74CzW6PgTxqPUY6TwPCRCQJB+MMCvl3klXnZhh1WKCJUbZFH7cSgfYsDO0bL7kWdPW3TglD+9zRrbxOJdj7DWf0VRY6CKxW4VEDu20Bg9z/YCpB5eqAtne4YVbKDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572613; c=relaxed/simple;
	bh=cilCKvA/3a3Wka/jsS2LeOJBUE47gxvNpliu0TuaaCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EPVYOlPKsnflK9BNveRX4kHeMjwtuMxWwTL/YO2sZoM6m7EizeVqpt2FrEu4Gt6ksvcrIcyDVHDeufS8qR8Pdli6kfltAe4rRlXxwd9LKVtPePj43jEgtMXOh+YsLljGaW9dl/MYvDUsv0ViMUpTOCtip8ifRakevvlIdshF/mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQzHs49t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WBaoPSLq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQzHs49t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WBaoPSLq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMVFG2372293
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwq/wB9raf9qhdFurJx/mRWvzmt5xzsSbEkUxJZbwJY=; b=LQzHs49tIityLTBb
	aaEFCg8q+5v+VuUShyQ0PHKzGIWh9y9fJuf/DXpZeG1wLWKnLXvnGF//HheTwRpC
	bFZXq+G2W0s4wwvtdVD9CG1BJxO1phYo2ShrRNdw6XjYQuSLCJjQDv+KSAHr8KAu
	Px9J14rs35pIJAkZHV1I/IHlDSPNZLyElRRvuGgY4ADgzFJzBGb/TSFfYpWCiTHt
	1b+qXtwErx9uPJVHDkO6skk+3WspJpyXoRQCizfDlpkOhObJ31AjVCKsnBex9tHj
	d4raCMfZ832ljOBDSH8mghyjpRjVRgsVSByHXIzUI9bgvayBWSnrrmQhIjSx3nqj
	4u8F/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshes7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1c7f135bso61007351cf.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572610; x=1788177410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwq/wB9raf9qhdFurJx/mRWvzmt5xzsSbEkUxJZbwJY=;
        b=WBaoPSLqEikpKeoM0LTt2fnhihJH28EZ+TY9+1LKF8ehY4WP8gLeREfUadvb9m7aap
         sCnoRT/w1WdOsqSIJ3Ds2xv2ShM7Fsphbp2mYP0AkjAN3CaEiernKqy/WYqRT1sTwmGO
         1y0uw/pktqogYP7QXRKPxmPUN7sCTk6FKX5ICHSLOBYPNa7lA+mWpRLX7ysFxY/iV/yw
         f/RXbWNev54PNLTePoTte3TsBjhRz1zrnT+MtRdW8WypTmQ3LafgvYewlL2xX+O0DOTQ
         3WPYuc8GSGydehWpclNQgK55AN6rcxTbsWWg9IA9ICzFA33RiG8NIsVmtAb4WQ9hD3nW
         pN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572610; x=1788177410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwq/wB9raf9qhdFurJx/mRWvzmt5xzsSbEkUxJZbwJY=;
        b=G9GtF3YkuzdsSBx6mrBz043rc+GE8/AKFAcHO0S6omAO6Zw0loDZYX+qvZ4JG1P14R
         ts7varWKfQ+0YFa7lzrdOZ+0G0a6Gm/uzdQkd+DclupurY0r8ud0uKAD5ujYX9PJdS2S
         q+Ls8RRojzvs7qPa8bJom6fT0+LPWxmSX4y3ScV6lsZkCsM7sGvljZdtJAheVuhqNJrG
         XOOFsXdvjJlO+6+UG6o4gdRql0g5znsnPyM4cSKOWmxCtRCLY2Wvj5Hw5ikqKcPbo9S/
         4cLoCIIyCDt9YCHi5etOtb9iKthHva7dk2/YhaArooyCYV1H3TaxTYirvihSxmD9TKyk
         GcfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVw3YhIi2U2aJ3QK0YFbHr9gigDX9pZjDBSfDxUT2YjCmb+BxWzjV8AMBrSaSAgBxsjcQoiR/D9lVm@vger.kernel.org
X-Gm-Message-State: AFuF++n1brySUrjs99lOnINT9V4i/jVNyAb1w9iH6BdkBgNtWvSQpR5a
	TsXWHPydcegn3k/4ywxWUKoEAEUJbNd20ysYFXsvRsJb53/eJQXJKbn4QN8wqsWW9xc05qff0W2
	ZhsGonxmQpHTaKfcim6FkTP8B+Nnv0bipK4mjAEqPzWPEbCpnkPHrYmjo9UnMZqc4
X-Gm-Gg: AR+sD12qLFFsDtFpSkF8sE18oPaGoYiUAXKxG2nUjPx57b5FWcN9zeMH4WMDjnas07c
	U/s2hfeRGIb7F1gwk5lNGR6FKaIOjDLTiVFAbH3UDtICkxGuMqDlnrL5qcnXY60aVnCQFvtzyY6
	JYOcu6doUFSA5zicUioenepgMgm2TyvwI2ASaFcQUbaJzyIXmv1dXHudIYT3cZJf4J3XCSQyvSX
	Hgz9BF6Sb6sIAuFnmaJuHtntVjjaQcEvpQeAR2VYladzg1cP2KT0agckhBjHkBWoQ8rpKBJXLJG
	YguxoyTnEf+ZVbgn1rMjmBh9SBjcLg/lZA7eT4XcxI7B0I2X7wGlz/RUwMObqavx+ah1RPl57GA
	96eDkIHsl
X-Received: by 2002:a05:622a:5c05:b0:52d:70b4:2e1a with SMTP id d75a77b69052e-52df5637a93mr287818311cf.1.1787572609887;
        Mon, 24 Aug 2026 04:56:49 -0700 (PDT)
X-Received: by 2002:a05:622a:5c05:b0:52d:70b4:2e1a with SMTP id d75a77b69052e-52df5637a93mr287817591cf.1.1787572609355;
        Mon, 24 Aug 2026 04:56:49 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:31 +0300
Subject: [PATCH v3 44/47] arm64: dts: qcom: sm8550: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-44-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=cilCKvA/3a3Wka/jsS2LeOJBUE47gxvNpliu0TuaaCk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDEA9V13MSHon4ZpWem0ulr0pgrGDypsIQ2xT
 w7h/OJRkpuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaowxAAAKCRAbX0TJAJUV
 VpxCEAC0M2H1de+WH7TV+36KUtk6uPCmBn+K1KUNni9iMJyBH3VVOadOK5d4srQRh+tel27BbEc
 qRqOoDEGxVJwBTc2qyBVW58Ob9Iw1q9aShyqtNcJSkRQYu22Sn1PrFfZPYCGmpJRsOsuFotKyjy
 l3KMQ6aLiTWeZwk202oKvutY7c5aqFcGsQ66DqmtJnEIiXqxHjZ9PRGozqd7tHtZWyMsARJsrxS
 uMV4SquhXAYiEfWHplaxrup1b1xhgbOGmlDUQFn5t29oVhwEgI2aHeirl+qA2DSTNdcwyZMVifS
 e09o4JspxSuEfaJcqRbfx6Rq2R2ha02CGsc2ARztyg8HiXL+su2Atm3et0BZvHO33ZjEkdmYzBJ
 iWV8R+yrd9qp3JpaRNmt/FKw2XQ3QBVYoEWrxNM05csYCzEdLUE5oSz28hQgIydSlJq+yuSrlWH
 szJjOhU486+5vphljxbsEHiFSaRauDoCeQ4opu16Uusiz0hQdn5S5iVFjs3LcbCFD7wqTGP0wrA
 R72UgPV3SEzMahuAE8rdJDiWUX5RJFRGK4N+FCT0SLDzoZGtVJcafkj06ZZXqElVpk8ntVXCJMq
 3O8Iqqe0BDuJ51A89VZ8aTrt52jqRr7RjusfvPCxc4K7Qd+foBgYdR6Hbbshg3t9Np3uoWOh9zY
 Yp72cQYl8fxUyhA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 4oTnpACWCsCezAEWbDlmxZwThdGFi5Pk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX0gpmIYohOfCV
 GZNZRvfnJveq1w3NE0VsYAVVKGbr5Up9ywAOEJYKerJ+weLbgOsQo3wzwMXWIFoImBZbGk6uCXc
 hKGeCWRokAnJduamaeNHdkI6tzoENnucFVY3yZ/OIeVFuzTofH48KC0h3L+mpuzBICSHD5gr/4h
 9Kjxdqq/7cjgfl16cRuusnhFesSPmsrekBZ2bmK03XhRvQb+BeVnEOFnbh5vkKw7ydRusL7zt58
 5AFLgB058bHn+AKTDP8GNFfmrK8OLi/LtWafIYDB/1LItsNLAul/3l6lW7cjCk6ZDpB931pMAWR
 VQqgXH+XCJKnW32oqGJy9WvSIqe8uvSf/3+fHqG0ez+kFekjDlubHWwhul+y5sZ3vQJD4JPHpc8
 j9p1UKuBOguvCVNVDrgBve17w0V/KS4o0YuqOAyqiqi/zKdsnUCaNkbSZJIDUa1vdzxYH/SnAzt
 bNuSzgN1bz7yOKKqiIg==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c3182 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 4oTnpACWCsCezAEWbDlmxZwThdGFi5Pk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX7jHM0KDnzIVM
 UT05RdX3rWQ1dOWLWdYjJQIdDfxzNy4ob8ZQDPmeVF0KP1EoYd970Db1/LPC3o4KYZbVlOrTG7u
 iuB9qwrW87N/VMP3lHHKH8CZA8pGUgc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on SM8550 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235..7137efb45346 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1195,6 +1195,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

